@implementation DashboardActivityFeedPresenter

- (NSString)title
{
  _TtC12GameCenterUI30DashboardActivityFeedPresenter *v2;
  void *v3;

  v2 = self;
  sub_1AB752D54();

  v3 = (void *)sub_1AB7DAF60();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSIndexPath)scrollToIndexPath
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC01980);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AB753524();
  v5 = sub_1AB7D7D68();
  v6 = 0;
  if (__swift_getEnumTagSinglePayload((uint64_t)v4, 1, v5) != 1)
  {
    v6 = (void *)sub_1AB7D7D08();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  return (NSIndexPath *)v6;
}

- (void)setScrollToIndexPath:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _TtC12GameCenterUI30DashboardActivityFeedPresenter *v10;
  uint64_t v11;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EEC01980);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1AB7D7D14();
    v8 = sub_1AB7D7D68();
    v9 = 0;
  }
  else
  {
    v8 = sub_1AB7D7D68();
    v9 = 1;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_1AB753628((uint64_t)v7);

}

- (BOOL)didScrollToIndexPath
{
  return sub_1AB7536A0() & 1;
}

- (void)setDidScrollToIndexPath:(BOOL)a3
{
  sub_1AB7536D4(a3);
}

- (void)updateSnapshot
{
  _TtC12GameCenterUI30DashboardActivityFeedPresenter *v2;

  v2 = self;
  sub_1AB754C5C();

}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  _TtC12GameCenterUI30DashboardActivityFeedPresenter *v4;

  sub_1AB7DAF90();
  v4 = self;
  sub_1AB752E8C();

  swift_bridgeObjectRelease();
}

- (_TtC12GameCenterUI30DashboardActivityFeedPresenter)initWithPlayerId:(id)a3
{
  if (a3)
    sub_1AB7DAF90();
  sub_1AB754E20();
}

- (void).cxx_destruct
{
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_scrollToIndexPath, &qword_1EEC01980);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_requiredData, &qword_1EEBFC5B0);
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI30DashboardActivityFeedPresenter_dashboardDisplayMode));
  swift_release();
  swift_release();
}

@end
