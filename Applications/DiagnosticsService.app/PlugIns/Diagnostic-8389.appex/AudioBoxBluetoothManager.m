@implementation AudioBoxBluetoothManager

- (_TtC15Diagnostic_838924AudioBoxBluetoothManager)init
{
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *result;

  result = (_TtC15Diagnostic_838924AudioBoxBluetoothManager *)_swift_stdlib_reportUnimplementedInitializer("Diagnostic_8389.AudioBoxBluetoothManager", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  sub_10000B224((Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_delegate));
  v3 = (char *)self + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_peripheralScanTimeout;
  v4 = type metadata accessor for DispatchTimeInterval(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_authenticationTimeout, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_centralManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagingCharacteristic));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capPSMCharacteristic));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_l2capChannel));

  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxSerial]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedAudioBoxToken]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_messagePacketsReceived));
  sub_100008A34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataReceived]);
  sub_100008A34(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_fileDataToSend]);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_expectedFiles));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_filesToSend));
  sub_10000ADB8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_bluetoothReadyCallback]);
  sub_10000ADB8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxConnectionCompletion]);
  sub_10000ADB8(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion), *(_QWORD *)&self->delegate[OBJC_IVAR____TtC15Diagnostic_838924AudioBoxBluetoothManager_audioBoxAuthenticationCompletion]);
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v5;

  v4 = a3;
  v5 = self;
  sub_100005598(v4);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v14;

  v10 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a5, &type metadata for String, (char *)&type metadata for Any + 8, &protocol witness table for String);
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  sub_100009C90(v11, v12, v10);

  swift_bridgeObjectRelease(v10);
}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  id v7;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_10000A128(v7);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10000A2D0();

}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10000A41C();

}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  id v6;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = a4;
  sub_100005F30(v6, (uint64_t)a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  sub_100007A40(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_10000659C);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_100007A40(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_100006E9C);
}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v10;

  v7 = sub_10000B120(0, &qword_10002E0E0, CBService_ptr);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v7);
  v9 = a3;
  v10 = self;
  sub_10000A568(v8);

  swift_bridgeObjectRelease(v8);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10000A8FC((uint64_t)a5);

}

- (void)peripheral:(id)a3 didOpenL2CAPChannel:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  _TtC15Diagnostic_838924AudioBoxBluetoothManager *v10;
  id v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_10000AB14(a4, (uint64_t)a5);

}

@end
