@implementation HandsKitConfigGenerator

+ (id)GenerateConfigWithName:(id)a3 config:(id)a4
{
  uint64_t v5;
  void *v6;
  void *v7;
  HandsKitConfig_optional *v8;
  Swift::String v9;
  void *v11;
  void *v12;
  unsigned __int8 v13;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;
  swift_bridgeObjectRetain();
  v8 = (HandsKitConfig_optional *)a4;
  v9._countAndFlagsBits = v5;
  v9._object = v7;
  ConfigNames.init(rawValue:)(v9);
  if (v13 == 11)
  {

    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    ConfigNames.createConfig(config:)((HandsKitConfig *)v13, v8);
    v12 = v11;

    swift_bridgeObjectRelease();
    return v12;
  }
}

- (_TtC5Hands23HandsKitConfigGenerator)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HandsKitConfigGenerator();
  return -[HandsKitConfigGenerator init](&v3, sel_init);
}

@end
