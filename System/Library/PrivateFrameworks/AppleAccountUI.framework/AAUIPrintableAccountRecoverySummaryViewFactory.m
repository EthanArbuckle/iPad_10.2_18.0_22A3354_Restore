@implementation AAUIPrintableAccountRecoverySummaryViewFactory

+ (id)createWithContext:(id)a3
{
  id v3;
  void *v4;
  uint64_t v6;
  void *v7;
  id v9;

  swift_getObjCClassMetadata();
  v3 = a3;
  v6 = sub_1DB62FCE0();
  v7 = v4;
  swift_getObjCClassMetadata();
  v9 = static PrintableAccountRecoverySummaryViewFactory.create(context:)(v6, v7);
  swift_bridgeObjectRelease();

  return v9;
}

- (AAUIPrintableAccountRecoverySummaryViewFactory)init
{
  return (AAUIPrintableAccountRecoverySummaryViewFactory *)PrintableAccountRecoverySummaryViewFactory.init()();
}

@end
