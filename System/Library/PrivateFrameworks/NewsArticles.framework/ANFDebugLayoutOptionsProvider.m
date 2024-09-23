@implementation ANFDebugLayoutOptionsProvider

- (_TtC12NewsArticles29ANFDebugLayoutOptionsProvider)init
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *result;

  result = (_TtC12NewsArticles29ANFDebugLayoutOptionsProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _BYTE v3[152];

  sub_1B9F13F88((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v3);
  sub_1B9F14118((uint64_t)v3);
}

- (void)addObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_observers), sel_addObject_, a3);
}

- (void)removeObserver:(id)a3
{
  objc_msgSend(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_observers), sel_removeObject_, a3);
}

- (CGSize)overrideViewportSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  double v5;
  double v6;
  _BYTE v7[152];
  _QWORD v8[2];
  char v9;
  CGSize result;

  height = a3.height;
  width = a3.width;
  sub_1B9F13F88((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v7);
  sub_1B9F13F88((uint64_t)v7, (uint64_t)v8);
  if (sub_1B9F140F4((uint64_t)v8) != 1 && (v9 & 1) == 0)
  {
    width = *(double *)v8;
    height = *(double *)&v8[1];
  }
  v5 = width;
  v6 = height;
  result.height = v6;
  result.width = v5;
  return result;
}

- (id)overrideContentSizeCategory:(id)a3
{
  int v4;
  id v5;
  BOOL v6;
  _BYTE v8[152];
  _BYTE v9[56];
  void *v10;

  sub_1B9F13F88((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v8);
  sub_1B9F13F88((uint64_t)v8, (uint64_t)v9);
  v4 = sub_1B9F140F4((uint64_t)v9);
  v5 = v10;
  if (v10)
    v6 = v4 == 1;
  else
    v6 = 1;
  if (v6)
    v5 = a3;
  return v5;
}

- (double)overrideContentScaleFactor:(double)a3
{
  BOOL v4;
  double result;
  _BYTE v6[152];
  _BYTE v7[80];
  double v8;
  unsigned __int8 v9;

  sub_1B9F13F88((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v6);
  sub_1B9F13F88((uint64_t)v6, (uint64_t)v7);
  v4 = sub_1B9F140F4((uint64_t)v7) == 1;
  result = v8;
  if (((v4 | v9) & 1) != 0)
    return a3;
  return result;
}

- (unint64_t)overrideViewingLocation:(unint64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  unint64_t v4;

  v3 = self;
  v4 = sub_1B9F13694();

  return v4;
}

- (int64_t)overrideBundleSubscriptionStatus:(int64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  int64_t v4;

  v3 = self;
  v4 = sub_1B9F137EC();

  return v4;
}

- (int64_t)overrideChannelSubscriptionStatus:(int64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  int64_t v4;

  v3 = self;
  v4 = sub_1B9F13944();

  return v4;
}

- (unint64_t)overrideNewsletterSubscriptionStatus:(unint64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  unint64_t v4;

  v3 = self;
  v4 = sub_1B9F13A94();

  return v4;
}

- (int64_t)overrideOfferUpsellScenario:(int64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  int64_t v4;

  v3 = self;
  v4 = sub_1B9F13BEC();

  return v4;
}

- (int64_t)overrideSubscriptionActivationEligibility:(int64_t)a3
{
  _TtC12NewsArticles29ANFDebugLayoutOptionsProvider *v3;
  int64_t v4;

  v3 = self;
  v4 = sub_1B9F13D5C();

  return v4;
}

- (id)overrideConditionKeys:(id)a3
{
  void *v4;
  _BYTE v6[152];
  _BYTE v7[144];
  uint64_t v8;

  if (a3)
    v4 = (void *)sub_1BA0BEBF4();
  else
    v4 = 0;
  sub_1B9F13F88((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29ANFDebugLayoutOptionsProvider_anfOverrides, (uint64_t)v6);
  sub_1B9F13F88((uint64_t)v6, (uint64_t)v7);
  if (sub_1B9F140F4((uint64_t)v7) != 1 && v8)
  {
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
LABEL_8:
    v4 = (void *)sub_1BA0BEBE8();
    swift_bridgeObjectRelease();
    return v4;
  }
  if (v4)
    goto LABEL_8;
  return v4;
}

@end
