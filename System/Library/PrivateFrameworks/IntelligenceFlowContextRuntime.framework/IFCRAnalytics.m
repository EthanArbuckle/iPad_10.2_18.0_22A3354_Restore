@implementation IFCRAnalytics

+ (void)sendEventForProductionWithEventName:(id)a3 prefix:(id)a4 eventPayload:(id)a5
{
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  Swift::String_optional v12;

  v7 = sub_23F33B51C();
  v9 = v8;
  if (!a4)
  {
    v10 = 0;
    if (!a5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = sub_23F33B51C();
  a4 = v11;
  if (a5)
  {
LABEL_3:
    sub_23F2EAA74();
    a5 = (id)sub_23F33B4A4();
  }
LABEL_4:
  v12.value._countAndFlagsBits = v10;
  v12.value._object = a4;
  static Analytics.sendEventForProduction(eventName:prefix:eventPayload:)(v7, v9, v12, a5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (IFCRAnalytics)init
{
  return (IFCRAnalytics *)Analytics.init()();
}

@end
