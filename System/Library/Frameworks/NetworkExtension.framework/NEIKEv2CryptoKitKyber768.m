@implementation NEIKEv2CryptoKitKyber768

- (id)initAndReturnError:(id *)a3
{
  return (id)sub_19BD220C8((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))NEIKEv2CryptoKitKyber768.init());
}

- (_TtC16NetworkExtension24NEIKEv2CryptoKitKyber768)initWithPublicKeyData:(id)a3 error:(id *)a4
{
  return (_TtC16NetworkExtension24NEIKEv2CryptoKitKyber768 *)sub_19BD2252C((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))NEIKEv2CryptoKitKyber768.init(publicKeyData:));
}

- (void).cxx_destruct
{
  sub_19BD238E4((uint64_t)self + OBJC_IVAR____TtC16NetworkExtension24NEIKEv2CryptoKitKyber768_privateKey, (uint64_t *)&unk_1EE411348);
}

@end
