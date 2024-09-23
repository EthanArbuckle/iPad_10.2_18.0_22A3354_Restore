@implementation Kyber1024ObjCPrivateKey

- (_TtC17MessageProtection22Kyber1024ObjCPublicKey)publicKey
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v10;
  objc_class *v11;
  id v12;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v13;
  objc_super v15;

  v3 = type metadata accessor for Kyber1024.PublicKey();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TetraKEM1024Key(0);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  outlined init with copy of TetraKEM1024Key((uint64_t)self + OBJC_IVAR____TtC17MessageProtection23Kyber1024ObjCPrivateKey_privKey, (uint64_t)v9);
  v10 = self;
  TetraKEM1024Key.publicKey.getter((uint64_t)v6);
  outlined destroy of TetraKEM1024Key((uint64_t)v9);
  v11 = (objc_class *)type metadata accessor for Kyber1024ObjCPublicKey(0);
  v12 = objc_allocWithZone(v11);
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 16))((uint64_t)v12 + OBJC_IVAR____TtC17MessageProtection22Kyber1024ObjCPublicKey_pubKey, v6, v3);
  v15.receiver = v12;
  v15.super_class = v11;
  v13 = -[Kyber1024ObjCPrivateKey init](&v15, sel_init);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return (_TtC17MessageProtection22Kyber1024ObjCPublicKey *)v13;
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)init
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v6;
  objc_class *v7;
  uint64_t v9;
  objc_super v10;

  v3 = type metadata accessor for TetraKEM1024Key(0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  TetraKEM1024Key.init()((uint64_t)v5);
  outlined init with take of TetraRatchetState((uint64_t)v5, (uint64_t)v6 + OBJC_IVAR____TtC17MessageProtection23Kyber1024ObjCPrivateKey_privKey, type metadata accessor for TetraKEM1024Key);

  v7 = (objc_class *)type metadata accessor for Kyber1024ObjCPrivateKey(0);
  v10.receiver = v6;
  v10.super_class = v7;
  return -[Kyber1024ObjCPrivateKey init](&v10, sel_init);
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithSepKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))Kyber1024ObjCPrivateKey.init(sepKeyBytes:));
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithApKeyBytes:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))Kyber1024ObjCPrivateKey.init(apKeyBytes:));
}

- (void).cxx_destruct
{
  outlined destroy of TetraKEM1024Key((uint64_t)self + OBJC_IVAR____TtC17MessageProtection23Kyber1024ObjCPrivateKey_privKey);
}

- (_TtC17MessageProtection23Kyber1024ObjCPrivateKey)initWithProtoBufData:(id)a3 error:(id *)a4
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  v4 = a3;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  return (_TtC17MessageProtection23Kyber1024ObjCPrivateKey *)Kyber1024ObjCPrivateKey.init(protoBufData:)(v5, v7);
}

- (NSData)protobufData
{
  _TtC17MessageProtection23Kyber1024ObjCPrivateKey *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  Class isa;

  v2 = self;
  v3 = Kyber1024ObjCPrivateKey.protobufData.getter();
  v5 = v4;

  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v3, v5);
  return (NSData *)isa;
}

@end
