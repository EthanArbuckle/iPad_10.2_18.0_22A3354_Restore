@implementation DelegateTrampoline_CBCentralManagerPrivateDelegate

- (void)centralManagerDidUpdateState:(id)a3
{
  _TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_23B5E18F0(v5);

}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  uint64_t v10;
  id v11;
  id v12;
  _TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *v13;
  id v14;

  v10 = sub_23B6018B0();
  v14 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_23B5E4A94(v11, v10, v12);
  swift_bridgeObjectRelease();

}

- (void)centralManager:(id)a3 didConnectPeripheral:(id)a4
{
  id v6;
  _TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  v7 = self;
  sub_23B5E4C14(v6, (uint64_t)&unk_250C827D0, (uint64_t)&unk_256A35D80);

}

- (void)centralManager:(id)a3 didFailToConnectPeripheral:(id)a4 error:(id)a5
{
  sub_23B5E1F7C(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_250C827A8, (uint64_t)&unk_256A35D68);
}

- (void)centralManager:(id)a3 didDisconnectPeripheral:(id)a4 error:(id)a5
{
  sub_23B5E1F7C(self, (uint64_t)a2, a3, a4, a5, (uint64_t)&unk_250C82780, (uint64_t)&unk_256A35D38);
}

- (void)centralManager:(id)a3 connectionEventDidOccur:(int64_t)a4 forPeripheral:(id)a5
{
  id v8;
  _TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *v9;
  id v10;

  v10 = a3;
  v8 = a5;
  v9 = self;
  sub_23B5E4EF4(a4, v8);

}

- (_TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate)init
{
  _TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *result;

  result = (_TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FindMyBluetoothP33_70F3B43C606FCD1D14F1E1CF221D31A750DelegateTrampoline_CBCentralManagerPrivateDelegate_delegateQueue));
  swift_weakDestroy();
}

@end
