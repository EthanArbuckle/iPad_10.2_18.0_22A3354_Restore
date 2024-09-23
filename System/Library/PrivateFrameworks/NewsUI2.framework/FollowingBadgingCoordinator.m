@implementation FollowingBadgingCoordinator

- (_TtC7NewsUI227FollowingBadgingCoordinator)init
{
  _TtC7NewsUI227FollowingBadgingCoordinator *result;

  result = (_TtC7NewsUI227FollowingBadgingCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI227FollowingBadgingCoordinator_delegate);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227FollowingBadgingCoordinator_sharedItemManager);
}

- (void)readingList:(id)a3 didAddArticles:(id)a4 removeArticles:(id)a5 eventInitiationLevel:(int64_t)a6
{
  uint64_t v9;
  id v10;
  _TtC7NewsUI227FollowingBadgingCoordinator *v11;

  v9 = sub_1D6E26D80();
  v10 = a3;
  v11 = self;
  sub_1D6B01A1C(v9, a6);

  swift_bridgeObjectRelease();
}

- (void)userInfoDidChangeDateLastViewedSaved:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI227FollowingBadgingCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1D6B01B00();

}

- (void)userInfoDidChangeDateLastViewedSharedWithYou:(id)a3 fromCloud:(BOOL)a4
{
  id v5;
  _TtC7NewsUI227FollowingBadgingCoordinator *v6;

  v5 = a3;
  v6 = self;
  sub_1D6B018D4();

}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC7NewsUI227FollowingBadgingCoordinator *v8;

  sub_1D5F75020();
  v6 = sub_1D6E267D4();
  v7 = a3;
  v8 = self;
  sub_1D6B01BD4(v6);

  swift_bridgeObjectRelease();
}

@end
