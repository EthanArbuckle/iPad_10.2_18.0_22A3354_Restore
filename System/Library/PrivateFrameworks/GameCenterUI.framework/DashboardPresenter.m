@implementation DashboardPresenter

- (BOOL)shouldUseLargeTitle
{
  return sub_1AB6FFD90() & 1;
}

- (void)setShouldUseLargeTitle:(BOOL)a3
{
  sub_1AB6FFDC0(a3);
}

- (NSString)title
{
  _TtC12GameCenterUI18DashboardPresenter *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = self;
  sub_1AB6FFE30();
  v4 = v3;

  if (v4)
  {
    v5 = (void *)sub_1AB7DAF60();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  return (NSString *)v5;
}

- (GKGameRecord)gameRecord
{
  id v2;

  sub_1AB6FFE74();
  return (GKGameRecord *)v2;
}

- (void)setGameRecord:(id)a3
{
  id v5;
  _TtC12GameCenterUI18DashboardPresenter *v6;

  v5 = a3;
  v6 = self;
  sub_1AB6FFEE4((uint64_t)a3);

}

- (BOOL)displayInSplitView
{
  return sub_1AB6FFEF8() & 1;
}

- (void)setDisplayInSplitView:(BOOL)a3
{
  _TtC12GameCenterUI18DashboardPresenter *v4;

  v4 = self;
  sub_1AB6FE1D4(a3);

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
  sub_1AB700134();
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
  _TtC12GameCenterUI18DashboardPresenter *v10;
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
  sub_1AB70023C((uint64_t)v7);

}

- (BOOL)didScrollToIndexPath
{
  return sub_1AB7002B0() & 1;
}

- (void)setDidScrollToIndexPath:(BOOL)a3
{
  sub_1AB7002E0(a3);
}

- (void)handleViewDidLoad
{
  _TtC12GameCenterUI18DashboardPresenter *v2;

  v2 = self;
  sub_1AB6FDEC0();

}

- (void)fetchDashboardRequiredDataWithForce:(BOOL)a3
{
  _TtC12GameCenterUI18DashboardPresenter *v4;

  v4 = self;
  sub_1AB6FDF64(a3);

}

- (void)fetchGameRecordAfterAuthenticationFor:(id)a3
{
  sub_1AB703E30(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB6FE1E8);
}

- (void)updateSnapshot
{
  _TtC12GameCenterUI18DashboardPresenter *v2;

  v2 = self;
  sub_1AB6FFF6C();

}

+ (void)processLeaderboardRequestFrom:(id)a3 request:(id)a4 gameRecord:(id)a5
{
  id v8;
  id v9;
  id v10;

  swift_getObjCClassMetadata();
  v8 = a3;
  v9 = a4;
  v10 = a5;
  sub_1AB6FE428(v8, a4, v10);

}

+ (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5 leaderboard:(id)a6 leaderboardSet:(id)a7 animated:(BOOL)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  sub_1AB703014();

}

- (void)presentLeaderboardsFrom:(id)a3 request:(id)a4 gameBundleID:(id)a5
{
  id v8;
  id v9;
  _TtC12GameCenterUI18DashboardPresenter *v10;

  sub_1AB7DAF90();
  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_1AB6FE320();

  swift_bridgeObjectRelease();
}

- (void)presentAchievementsFrom:(id)a3 request:(id)a4 gameRecord:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12GameCenterUI18DashboardPresenter *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1AB6FE64C();

}

- (void)presentChallengesFrom:(id)a3 gameRecord:(id)a4 shouldShowPlayForChallenge:(BOOL)a5
{
  id v7;
  id v8;
  _TtC12GameCenterUI18DashboardPresenter *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AB6FEA58();

}

- (void)presentPlayerProfileFrom:(id)a3 request:(id)a4 animated:(BOOL)a5
{
  id v7;
  id v8;
  _TtC12GameCenterUI18DashboardPresenter *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  sub_1AB6FED38();

}

- (void)loadMoreActivityFeedWithContinuationToken:(id)a3
{
  sub_1AB703E30(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_1AB6FF6D8);
}

- (_TtC12GameCenterUI18DashboardPresenter)initWithPlayerId:(id)a3
{
  if (a3)
    sub_1AB7DAF90();
  sub_1AB703E84();
}

- (void).cxx_destruct
{
  swift_release();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_request);
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_gameRecord);
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_152_0();
  OUTLINED_FUNCTION_5_2(OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_game);
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_scrollToIndexPath, &qword_1EEC01980);
  swift_bridgeObjectRelease();
  swift_release();
  OUTLINED_FUNCTION_152_0();
  sub_1AB47A074((uint64_t)self + OBJC_IVAR____TtC12GameCenterUI18DashboardPresenter_requiredData, &qword_1EEBFC5B0);
  swift_release();
}

@end
