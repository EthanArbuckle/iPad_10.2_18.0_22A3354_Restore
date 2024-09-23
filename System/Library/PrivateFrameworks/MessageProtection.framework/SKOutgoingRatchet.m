@implementation SKOutgoingRatchet

- (_TtC17MessageProtection17SKOutgoingRatchet)initWithData:(id)a3 error:(id *)a4
{
  return (_TtC17MessageProtection17SKOutgoingRatchet *)@objc Kyber1024ObjCPrivateKey.init(sepKeyBytes:)((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t))SKOutgoingRatchet.init(data:));
}

- (_TtC17MessageProtection17SKOutgoingRatchet)init
{
  return (_TtC17MessageProtection17SKOutgoingRatchet *)SKOutgoingRatchet.init()();
}

+ (id)generate
{
  swift_getObjCClassMetadata();
  return static SKOutgoingRatchet.generate()();
}

- (BOOL)ratchetForward
{
  _TtC17MessageProtection17SKOutgoingRatchet *v2;
  Swift::Bool v3;

  v2 = self;
  v3 = SKOutgoingRatchet.ratchetForward()();

  return v3;
}

- (id)sealMessage:(id)a3 authenticating:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _TtC17MessageProtection17SKOutgoingRatchet *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  v9 = self;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  v16 = (void *)SKOutgoingRatchet.sealMessage(_:authenticating:)(v10, v12, v13, v15);
  outlined consume of Data._Representation(v13, v15);
  outlined consume of Data._Representation(v10, v12);
  return v16;
}

- (id)currentSubscriptionKeys
{
  _TtC17MessageProtection17SKOutgoingRatchet *v2;
  void *v3;

  v2 = self;
  v3 = (void *)SKOutgoingRatchet.currentSubscriptionKeys()();

  return v3;
}

- (id)serializedData
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, SKOutgoingRatchet.serializedData());
}

- (id)signingKeyIdentifier
{
  return @objc SKOutgoingRatchet.serializedData()(self, (uint64_t)a2, (uint64_t (*)(void))SKOutgoingRatchet.signingKeyIdentifier());
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  outlined destroy of TetraRatchetOuterMessage((uint64_t)self + OBJC_IVAR____TtC17MessageProtection17SKOutgoingRatchet_ratchet, (uint64_t (*)(_QWORD))type metadata accessor for SymmetricRatchet);
  v3 = (char *)self + OBJC_IVAR____TtC17MessageProtection17SKOutgoingRatchet_signingKey;
  v4 = type metadata accessor for P256.Signing.PrivateKey();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  outlined destroy of TetraSessionStates?((uint64_t)self + OBJC_IVAR____TtC17MessageProtection17SKOutgoingRatchet_currentSubscriptionKey, &demangling cache variable for type metadata for (key: SymmetricKey, index: UInt64));
  outlined destroy of TetraSessionStates?((uint64_t)self + OBJC_IVAR____TtC17MessageProtection17SKOutgoingRatchet_currentMessageKey, &demangling cache variable for type metadata for (key: SymmetricKey, index: UInt64));
}

@end
