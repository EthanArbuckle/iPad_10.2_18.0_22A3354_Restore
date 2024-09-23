@implementation BuddyAppStateManager

+ (id)currentAppStates
{
  void *v2;
  Class isa;

  v2 = sub_10000DBE0();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return isa;
}

+ (void)persist:(id)a3 to:(id)a4
{
  uint64_t v5;
  id v6;
  Class isa;
  id v8;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String, &type metadata for Data, &protocol witness table for String);
  v6 = a4;
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v8 = String._bridgeToObjectiveC()();
  objc_msgSend(v6, "setObject:forKey:persistImmediately:", isa, v8, 1);

  swift_bridgeObjectRelease(v5);
}

- (_TtC5Setup20BuddyAppStateManager)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyAppStateManager();
  return -[BuddyAppStateManager init](&v3, "init");
}

@end
