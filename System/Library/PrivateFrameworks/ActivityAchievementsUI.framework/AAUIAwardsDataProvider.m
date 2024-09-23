@implementation AAUIAwardsDataProvider

- (void)dealloc
{
  AAUIAwardsDataProvider *v2;

  v2 = self;
  AAUIAwardsDataProvider.__deallocating_deinit();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR___AAUIAwardsDataProvider_calendar;
  v4 = sub_21CC3F6A8();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
  swift_bridgeObjectRelease();
}

- (AAUIAwardsDataProvider)init
{
  AAUIAwardsDataProvider *result;

  result = (AAUIAwardsDataProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
