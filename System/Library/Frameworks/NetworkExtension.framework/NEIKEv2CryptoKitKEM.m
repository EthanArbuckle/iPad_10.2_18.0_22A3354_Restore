@implementation NEIKEv2CryptoKitKEM

- (NSData)keyExchangeData
{
  return (NSData *)sub_19BD20FB8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_keyExchangeData);
}

- (NSData)sharedSecret
{
  _TtC16NetworkExtension19NEIKEv2CryptoKitKEM *v2;
  void *v3;

  v2 = self;
  v3 = (void *)NEIKEv2CryptoKitKEM.sharedSecret.getter();

  return (NSData *)v3;
}

- (BOOL)processPeerPayload:(id)a3 error:(id *)a4
{
  return sub_19BD213E4(self, (uint64_t)a2, a3, (uint64_t)a4, &qword_1EE411340, (uint64_t (*)(_QWORD))MEMORY[0x1E0CA93C8], &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_internalSharedSecret);
}

- (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM)init
{
  _TtC16NetworkExtension19NEIKEv2CryptoKitKEM *result;

  result = (_TtC16NetworkExtension19NEIKEv2CryptoKitKEM *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_19BD2164C((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_internalSharedSecret, &qword_1EE411340, &OBJC_IVAR____TtC16NetworkExtension19NEIKEv2CryptoKitKEM_keyExchangeData);
}

@end
