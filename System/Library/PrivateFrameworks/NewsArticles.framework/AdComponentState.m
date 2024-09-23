@implementation AdComponentState

- (NSString)identifier
{
  void *v2;

  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BA0BE81C();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (_TtC12NewsArticles16AdComponentState)init
{
  _TtC12NewsArticles16AdComponentState *result;

  result = (_TtC12NewsArticles16AdComponentState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles16AdComponentState_bannerState;
  v4 = sub_1BA0BC8CC();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
