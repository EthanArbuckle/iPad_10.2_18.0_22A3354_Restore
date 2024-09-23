@implementation BuddyDeviceImageUtilities

+ (id)imageForDeviceModelWithModel:(id)a3 traitCollection:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v8 = a4;
  v9 = sub_10001287C(v5, v7, v8);

  swift_bridgeObjectRelease(v7);
  return v9;
}

- (_TtC5Setup25BuddyDeviceImageUtilities)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for BuddyDeviceImageUtilities();
  return -[BuddyDeviceImageUtilities init](&v3, "init");
}

@end
