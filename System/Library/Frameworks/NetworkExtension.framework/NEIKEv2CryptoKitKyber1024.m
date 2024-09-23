@implementation NEIKEv2CryptoKitKyber1024

- (id)initAndReturnError:(id *)a3
{
  return (id)sub_19BD220C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))NEIKEv2CryptoKitKyber1024.init());
}

- (_TtC16NetworkExtension25NEIKEv2CryptoKitKyber1024)initWithPublicKeyData:(id)a3 error:(id *)a4
{
  return (_TtC16NetworkExtension25NEIKEv2CryptoKitKyber1024 *)sub_19BD2252C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))NEIKEv2CryptoKitKyber1024.init(publicKeyData:));
}

- (void).cxx_destruct
{
  sub_19BD238E4((uint64_t)self + OBJC_IVAR____TtC16NetworkExtension25NEIKEv2CryptoKitKyber1024_privateKey, &qword_1EE411358);
}

@end
