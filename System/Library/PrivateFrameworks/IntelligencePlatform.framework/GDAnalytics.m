@implementation GDAnalytics

+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;

  v7 = sub_1AE925E3C();
  v9 = v8;
  if (!a4)
  {
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = sub_1AE925E3C();
  a4 = v11;
  if (a5)
  {
LABEL_3:
    sub_1AE4F99B0();
    a5 = (id)sub_1AE925C5C();
  }
LABEL_4:
  static Analytics.sendEventForProduction(eventName:prefix:eventPayload:)(v7, v9, v10, a4, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

+ (void)sendEventForProductionLazyWithEventName:(id)a3 eventPayloadBuilder:(id)a4
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4 = _Block_copy(a4);
  v5 = sub_1AE925E3C();
  v7 = v6;
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = v4;
  static Analytics.sendEventForProductionLazy(eventName:eventPayloadBuilder:)(v5, v7, (uint64_t)sub_1AE5269A4, v8);
  swift_bridgeObjectRelease();
  swift_release();
}

- (GDAnalytics)init
{
  return (GDAnalytics *)Analytics.init()();
}

@end
