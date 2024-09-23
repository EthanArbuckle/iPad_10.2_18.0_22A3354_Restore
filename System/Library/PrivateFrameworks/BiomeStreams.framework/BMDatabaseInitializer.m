@implementation BMDatabaseInitializer

+ (BOOL)initializeSQLDatabaseWithIdentifier:(id)a3
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = static BMDatabaseInitializer.initializeSQLDatabase(identifier:)(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

+ (id)viewSubscribedStreams
{
  Class isa;

  static BMDatabaseInitializer.viewSubscribedStreams()();
  isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  return isa;
}

- (_TtC12BiomeStreams21BMDatabaseInitializer)init
{
  return (_TtC12BiomeStreams21BMDatabaseInitializer *)BMDatabaseInitializer.init()();
}

@end
