@implementation PHSearchUtilities

+ (id)matchedPhoneNumberFor:(id)a3 searchText:(id)a4
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v7 = v6;
  v8 = a3;
  v9 = sub_10017E63C(v8, v5, v7);

  swift_bridgeObjectRelease(v7);
  return v9;
}

+ (BOOL)matchedProperties:(id)a3 contains:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v8 = v7;
  sub_10017E3F4(v5, v6, v7);
  v10 = v9;
  swift_bridgeObjectRelease(v5);
  swift_bridgeObjectRelease(v8);
  return v10 & 1;
}

- (PHSearchUtilities)init
{
  return (PHSearchUtilities *)sub_10017E9F8();
}

@end
