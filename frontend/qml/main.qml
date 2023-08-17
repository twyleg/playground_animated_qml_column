// Copyright (C) 2023 twyleg
import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

import "./items"

Window {
	id: window

	width: 200
	height: 700
	visible: true
	title: qsTr("Animated column example")

	color: "#212121"

	Rectangle {

		anchors.centerIn: parent

		width: 120
		height: 565

		color: "transparent"

		border.color: "black"
		border.width: 5
		radius: 15

		AnimatedColumn {
			id: animatedColumn

			width: 100
			y: 10

			anchors.horizontalCenter: parent.horizontalCenter
			margin: 5
		}
	}

	Component.onCompleted: {

		var comp = Qt.createComponent("items/TestElement.qml");

		for (var i = 0; i < 10; i++)  {
			console.log("Add AnimatedColumnElement")

			var elem = comp.createObject(animatedColumn, {
				text: ""+i,
				width: 100,
				height: 50
			})
			animatedColumn.elementList.push(elem)
		}
	}
}
