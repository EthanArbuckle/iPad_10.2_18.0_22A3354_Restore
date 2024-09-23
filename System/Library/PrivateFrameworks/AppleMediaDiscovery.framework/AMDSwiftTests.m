@implementation AMDSwiftTests

+ (id)strToIntWithStrValue:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  void *v9;

  swift_getObjCClassMetadata();
  v3 = a3;
  v6 = sub_1DC76F44C();
  v7 = v4;
  swift_getObjCClassMetadata();
  static AMDSwiftTests.strToInt(strValue:)(v6, v7);
  swift_bridgeObjectRelease();

  v9 = (void *)sub_1DC76F440();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC19AppleMediaDiscovery13AMDSwiftTests)init
{
  return (_TtC19AppleMediaDiscovery13AMDSwiftTests *)AMDSwiftTests.init()();
}

@end
