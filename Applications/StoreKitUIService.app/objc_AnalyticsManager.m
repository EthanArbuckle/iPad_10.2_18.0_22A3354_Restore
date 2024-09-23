@implementation objc_AnalyticsManager

+ (void)sendEvent:(id)a3
{
  swift_unknownObjectRetain(a3, a2);
  sub_100028B64(a3);
  swift_unknownObjectRelease(a3);
}

+ (void)sendEventLazy:(id)a3 buildEvent:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = _Block_copy(a4);
  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = swift_allocObject(&unk_10004A1C8, 24, 7);
  *(_QWORD *)(v9 + 16) = v5;
  sub_100028B98(v6, v8, (uint64_t)sub_1000285E8, v9);
  swift_bridgeObjectRelease(v8);
  swift_release(v9);
}

- (_TtC17StoreKitUIService21objc_AnalyticsManager)init
{
  return (_TtC17StoreKitUIService21objc_AnalyticsManager *)sub_100028C1C();
}

@end
