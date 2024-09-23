@implementation NEIKEv2CryptoKitECDH

- (NSData)keyExchangeData
{
  return (NSData *)sub_19BD20FB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_keyExchangeData);
}

- (NSData)sharedSecret
{
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *v2;
  void *v3;

  v2 = self;
  v3 = (void *)NEIKEv2CryptoKitECDH.sharedSecret.getter();

  return (NSData *)v3;
}

- (BOOL)processPeerPayload:(id)a3 error:(id *)a4
{
  return sub_19BD213E4(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_1EE411338, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA9388], &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_internalSharedSecret);
}

- (_TtC16NetworkExtension20NEIKEv2CryptoKitECDH)init
{
  _TtC16NetworkExtension20NEIKEv2CryptoKitECDH *result;

  result = (_TtC16NetworkExtension20NEIKEv2CryptoKitECDH *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19BD2164C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_internalSharedSecret, &qword_1EE411338, &OBJC_IVAR____TtC16NetworkExtension20NEIKEv2CryptoKitECDH_keyExchangeData);
}

@end
