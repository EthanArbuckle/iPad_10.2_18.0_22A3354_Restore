@implementation SKIncomingRatchet

+ (unint64_t)maxForwardRatchetDelta
{
  return 50000;
}

- (_TtC17MessageProtection17SKIncomingRatchet)initWithData:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection17SKIncomingRatchet *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))SKIncomingRatchet.init(data:));
}

- (_TtC17MessageProtection17SKIncomingRatchet)initWithKey:(id)a3 index:(unsigned __int16)a4 signingKey:(id)a5 error:(id *)a6
{
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  return (_TtC17MessageProtection17SKIncomingRatchet *)SKIncomingRatchet.init(key:index:signingKey:)(v10, v12, v7, v13, v15);
}

- (id)openStatusWithIndex:(unint64_t)a3 encryptedMessage:(id)a4 authenticating:(id)a5 signature:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  _TtC17MessageProtection17SKIncomingRatchet *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void (*v18)(_QWORD, _QWORD, _QWORD, _QWORD);
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  Class isa;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  v15 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v17 = v16;

  v18 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD))static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v20 = v19;

  v21 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v23 = v22;

  v24 = SKIncomingRatchet.openStatus(index:encryptedMessage:authenticating:signature:)(a3, v15, v17, v18, v20, v21, v23);
  v26 = v25;

  outlined consume of Data._Representation(v21, v23);
  outlined consume of Data._Representation((uint64_t)v18, v20);
  outlined consume of Data._Representation(v15, v17);
  isa = Data._bridgeToObjectiveC()().super.isa;
  outlined consume of Data._Representation(v24, v26);
  return isa;
}

- (id)serializedData
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, SKIncomingRatchet.serializedData());
}

- (id)signingKeyIdentifier
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, (uint64_t (*)(void))SKIncomingRatchet.signingKeyIdentifier());
}

- (_TtC17MessageProtection17SKIncomingRatchet)init
{
  _TtC17MessageProtection17SKIncomingRatchet *result;

  result = (_TtC17MessageProtection17SKIncomingRatchet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  outlined destroy of TetraRatchetOuterMessage((uint64_t)self + OBJC_IVAR____TtC17MessageProtection17SKIncomingRatchet_ratchet, (uint64_t (*)(_QWORD))type metadata accessor for SymmetricRatchet);
  v3 = (char *)self + OBJC_IVAR____TtC17MessageProtection17SKIncomingRatchet_signingPublicKey;
  v4 = type metadata accessor for P256.Signing.PublicKey();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
}

@end
