@implementation DelegateTrampoline_CBPairingAgentDelegate

- (void)pairingAgent:(id)a3 peerDidCompletePairing:(id)a4
{
  id v7;
  _TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = self;
  sub_23B5C5EC4(a3, v7);

}

- (void)pairingAgent:(id)a3 peerDidFailToCompletePairing:(id)a4 error:(id)a5
{
  id v9;
  _TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *v10;
  id v11;
  id v12;

  v12 = a3;
  v9 = a4;
  v10 = self;
  v11 = a5;
  sub_23B5C61A0(a3, a4, a5);

}

- (void)pairingAgent:(id)a3 peerDidUnpair:(id)a4
{
  id v7;
  _TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *v8;
  id v9;

  v9 = a3;
  v7 = a4;
  v8 = self;
  sub_23B5C64BC(a3, a4);

}

- (void)pairingAgent:(id)a3 peerDidRequestPairing:(id)a4 type:(int64_t)a5 passkey:(id)a6
{
  id v11;
  id v12;
  _TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *v13;
  id v14;

  v14 = a3;
  v11 = a4;
  v12 = a6;
  v13 = self;
  sub_23B5C675C(a3, a4, a5, a6);

}

- (_TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate)init
{
  _TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *result;

  result = (_TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15FindMyBluetoothP33_FB9F492088B4C388E3479FD29311B1A941DelegateTrampoline_CBPairingAgentDelegate_delegateQueue));
  swift_weakDestroy();
}

@end
