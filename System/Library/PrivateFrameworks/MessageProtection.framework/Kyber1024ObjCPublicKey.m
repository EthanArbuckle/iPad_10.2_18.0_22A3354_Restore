@implementation Kyber1024ObjCPublicKey

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)initWithPublicKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)Kyber1024ObjCPublicKey.init(publicKeyBytes:)(a3);
}

- (id)dataRepresentation
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC17MessageProtection22Kyber1024ObjCPublicKey *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  Class isa;
  uint64_t v13;

  v3 = type metadata accessor for Kyber1024.PublicKey();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, (char *)self + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey, v3);
  v7 = self;
  v8 = Kyber1024.PublicKey.dataRepresentation.getter();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v8, v10);

  return isa;
}

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)init
{
  _TtC17MessageProtection22Kyber1024ObjCPublicKey *result;

  result = (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v2;
  uint64_t v3;

  v2 = (char *)self + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey;
  v3 = type metadata accessor for Kyber1024.PublicKey();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

@end
