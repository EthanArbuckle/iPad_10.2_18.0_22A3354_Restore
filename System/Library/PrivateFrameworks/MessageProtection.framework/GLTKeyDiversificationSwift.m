@implementation GLTKeyDiversificationSwift

+ (id)diversifyWithPublicKey:(__SecKey *)a3 trackingPreventionSalt:(id)a4 docId:(id)a5 error:(id *)a6
{
  void *v7;
  __SecKey *v9;
  id v10;
  id v11;
  unint64_t v12;
  unint64_t v13;
  __SecKey *v14;
  id v15;
  uint64_t v16;
  const __CFData *v17;
  const __CFData *v18;
  void *v19;
  void *v20;

  v7 = a4;
  if (a4)
  {
    v9 = a3;
    v10 = a5;
    v11 = v7;
    v7 = (void *)static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v13 = v12;

  }
  else
  {
    v14 = a3;
    v15 = a5;
    v13 = 0xF000000000000000;
  }
  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v18 = v17;

  specialized static GLTKeyDiversificationSwift.diversify(publicKey:trackingPreventionSalt:docId:)(a3, (unint64_t)v7, v13, v16, v18);
  v20 = v19;
  swift_bridgeObjectRelease();

  outlined consume of Data?((uint64_t)v7, v13);
  return v20;
}

+ (__SecKey)diversifyWithPrivateKey:(__SecKey *)a3 docId:(id)a4 trackingPreventionSalt:(id)a5 error:(id *)a6
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __SecKey *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = v9;
  v11 = a3;
  v12 = a5;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  v16 = (void *)specialized static GLTKeyDiversificationSwift.diversify(privateKey:docId:trackingPreventionSalt:)(v11, v8, v10, v13, v15);
  outlined consume of Data._Representation(v13, v15);
  swift_bridgeObjectRelease();
  return (__SecKey *)v16;
}

- (_TtC17MessageProtection26GLTKeyDiversificationSwift)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GLTKeyDiversificationSwift();
  return -[GLTKeyDiversificationSwift init](&v3, sel_init);
}

@end
