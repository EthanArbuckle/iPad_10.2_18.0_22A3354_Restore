@implementation SubscriptionButtonTextProvider

- (NSString)title
{
  _TtC12NewsArticles30SubscriptionButtonTextProvider *v2;
  void *v3;

  v2 = self;
  sub_1BA088C0C();

  v3 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;

  v4 = sub_1BA0BE840();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC12NewsArticles30SubscriptionButtonTextProvider____lazy_storage___title);
  *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (_TtC12NewsArticles30SubscriptionButtonTextProvider)init
{
  _TtC12NewsArticles30SubscriptionButtonTextProvider *result;

  result = (_TtC12NewsArticles30SubscriptionButtonTextProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

@end
