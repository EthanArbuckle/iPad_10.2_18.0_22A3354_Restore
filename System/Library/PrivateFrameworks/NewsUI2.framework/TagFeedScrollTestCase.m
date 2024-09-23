@implementation TagFeedScrollTestCase

- (_TtC7NewsUI221TagFeedScrollTestCase)init
{
  objc_class *ObjectType;
  char *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_testName;
  strcpy((char *)self + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_testName, "ScrollTagFeed");
  *((_WORD *)v4 + 7) = -4864;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_timeoutInSeconds) = (Class)0x405E000000000000;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_aggregate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_iterations) = (Class)2;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_offset) = (Class)15;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_numberOfScreens) = (Class)3;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return -[TagFeedScrollTestCase init](&v6, sel_init);
}

- (NSString)testName
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D6E26948();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (double)timeoutInSeconds
{
  return 120.0;
}

- (unint64_t)aggregate
{
  return *(unint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC7NewsUI221TagFeedScrollTestCase_aggregate);
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
  _TtC7NewsUI221TagFeedScrollTestCase *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  sub_1D6452130(v4);
  v7 = v6;

  return v7;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end
