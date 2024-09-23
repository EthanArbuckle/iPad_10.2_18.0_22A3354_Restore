@implementation AnalyticsEvent

+ (void)sendLazy:(id)a3
{
  void *v4;
  uint64_t v5;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject(&unk_10004A100, 24, 7);
  *(_QWORD *)(v5 + 16) = v4;
  swift_getObjCClassMetadata(a1);
  sub_100026D64((uint64_t)sub_1000285E8, v5);
  swift_release(v5);
}

- (NSDictionary)payload
{
  _TtC17StoreKitUIService14AnalyticsEvent *v2;
  uint64_t v3;
  Class isa;

  v2 = self;
  v3 = sub_100026ED4();

  sub_100027880();
  isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSDictionary *)isa;
}

+ (NSString)name
{
  NSString v2;

  swift_getObjCClassMetadata(a1);
  sub_100027498();
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(0xE000000000000000);
  return (NSString *)v2;
}

- (_TtC17StoreKitUIService14AnalyticsEvent)init
{
  return (_TtC17StoreKitUIService14AnalyticsEvent *)sub_1000276E0();
}

- (BOOL)canCreatePayload
{
  return 1;
}

- (id)createPayload
{
  _TtC17StoreKitUIService14AnalyticsEvent *v2;
  uint64_t v3;
  NSDictionary v4;

  v2 = self;
  v3 = sub_100027790();

  if (v3)
  {
    sub_100027880();
    v4.super.isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return v4.super.isa;
}

- (NSString)eventName
{
  _TtC17StoreKitUIService14AnalyticsEvent *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;

  v2 = self;
  sub_100027854();
  v4 = v3;

  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

@end
