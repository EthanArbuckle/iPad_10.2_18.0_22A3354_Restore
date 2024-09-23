@implementation GFTKeyWrapper

+ (id)unwrapWrappedSeed:(id)a3 legacy:(BOOL)a4 using:(__SecKey *)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v8;
  __SecKey *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;

  v7 = a4;
  v8 = a3;
  v9 = a5;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  specialized static GFTKeyWrapper.unwrapWrappedSeed(_:legacy:using:)(v10, v12, v7, (uint64_t)v9);
  v14 = v13;

  outlined consume of Data._Representation(v10, v12);
  return v14;
}

+ (id)encrypt:(id)a3 to:(__SecKey *)a4 error:(id *)a5
{
  return @objc static GFTKeyWrapper.encrypt(_:to:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))specialized static GFTKeyWrapper.encrypt(_:to:));
}

+ (id)decrypt:(id)a3 using:(__SecKey *)a4 error:(id *)a5
{
  return @objc static GFTKeyWrapper.encrypt(_:to:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))specialized static GFTKeyWrapper.decrypt(_:using:));
}

+ (id)wrapSeed:(id)a3 to:(id)a4 legacy:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  Class v13;

  v6 = a5;
  v8 = a3;
  v9 = a4;
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;

  v13 = specialized static GFTKeyWrapper.wrapSeed(_:to:legacy:)(v10, v12, v9, v6);
  outlined consume of Data._Representation(v10, v12);
  return v13;
}

- (_TtC17MessageProtection13GFTKeyWrapper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GFTKeyWrapper();
  return -[GFTKeyWrapper init](&v3, sel_init);
}

@end
