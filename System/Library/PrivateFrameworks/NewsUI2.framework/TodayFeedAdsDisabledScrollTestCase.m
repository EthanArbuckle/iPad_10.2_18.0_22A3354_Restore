@implementation TodayFeedAdsDisabledScrollTestCase

- (NSString)testName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase)init
{
  objc_class *ObjectType;
  _QWORD *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_testName);
  *v4 = 0xD00000000000001ALL;
  v4[1] = 0x80000001D6EE7910;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_numberOfScreens) = (Class)3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[TodayFeedAdsDisabledScrollTestCase init](&v6, sel_init);
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa
                             + OBJC_IVAR____TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase_aggregate);
}

- (int64_t)iterations
{
  return 2;
}

- (int64_t)offset
{
  return 15;
}

- (int64_t)numberOfScreens
{
  return 3;
}

- (id)scrollViewWithContext:(id)a3
{
  id v4;
  _TtC7NewsUI234TodayFeedAdsDisabledScrollTestCase *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1D60A0528(v4);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
