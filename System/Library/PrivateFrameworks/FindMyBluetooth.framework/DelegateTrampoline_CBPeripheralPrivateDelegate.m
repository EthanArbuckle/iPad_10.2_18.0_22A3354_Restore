@implementation DelegateTrampoline_CBPeripheralPrivateDelegate

- (void)peripheralDidUpdateName:(id)a3
{
  _TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23B5A0898(v5);

}

- (void)peripheral:(id)a3 didModifyServices:(id)a4
{
  uint64_t v6;
  _TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *v7;
  id v8;

  sub_23B58F7DC(0, &qword_256A34AB0);
  v6 = sub_23B6019DC();
  v8 = a3;
  v7 = self;
  sub_23B5A0B6C(v8, v6);
  swift_bridgeObjectRelease();

}

- (void)peripheral:(id)a3 didReadRSSI:(id)a4 error:(id)a5
{
  sub_23B5A13E4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23B5A0E84);
}

- (void)peripheral:(id)a3 didDiscoverServices:(id)a4
{
  _TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *v6;
  id v7;
  id v8;

  v8 = a3;
  v6 = self;
  v7 = a4;
  sub_23B5A0FE4(v8, a4);

}

- (void)peripheral:(id)a3 didDiscoverCharacteristicsForService:(id)a4 error:(id)a5
{
  sub_23B5A13E4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23B5A12B8);
}

- (void)peripheral:(id)a3 didUpdateValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_23B5A13E4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23B5A1468);
}

- (void)peripheral:(id)a3 didWriteValueForCharacteristic:(id)a4 error:(id)a5
{
  sub_23B5A13E4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23B5A1538);
}

- (void)peripheral:(id)a3 didUpdateNotificationStateForCharacteristic:(id)a4 error:(id)a5
{
  sub_23B5A13E4(self, (uint64_t)a2, a3, a4, a5, (void (*)(id, id, void *))sub_23B5A1608);
}

- (void)peripheralIsReadyToSendWriteWithoutResponse:(id)a3
{
  _TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23B5A185C(v5);

}

- (_TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate)init
{
  _TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *result;

  result = (_TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FindMyBluetooth46DelegateTrampoline_CBPeripheralPrivateDelegate_delegateQueue));
  swift_weakDestroy();
}

@end
