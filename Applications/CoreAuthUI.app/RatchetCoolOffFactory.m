@implementation RatchetCoolOffFactory

- (_TtC10CoreAuthUI21RatchetCoolOffFactory)init
{
  _TtC10CoreAuthUI21RatchetCoolOffFactory *result;

  result = (_TtC10CoreAuthUI21RatchetCoolOffFactory *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD00000000000001DLL, 0x800000010006E250, "CoreAuthUI/RatchetCoolOffFactory.swift", 38, 2, 20, 0);
  __break(1u);
  return result;
}

+ (id)makeViewControllerWith:(id)a3 delegate:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  id v9;

  v5 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for AnyHashable, (char *)&type metadata for Any + 8, &protocol witness table for AnyHashable);
  type metadata accessor for RatchetCoolOffContentViewModel(0);
  swift_unknownObjectRetain_n(a4, 2);
  v6 = swift_bridgeObjectRetain(v5);
  v7 = sub_100036074(v6, (uint64_t)a4);
  type metadata accessor for RatchetCoolOffContentViewController();
  v8 = sub_100030204();
  v9 = sub_10002E84C((uint64_t)v7, v8);
  swift_unknownObjectRelease(a4);
  swift_bridgeObjectRelease(v5);
  return v9;
}

@end
