@implementation PuzzleDataManager

- (_TtC8NewsFeed17PuzzleDataManager)init
{
  _TtC8NewsFeed17PuzzleDataManager *result;

  result = (_TtC8NewsFeed17PuzzleDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1BA8FD860((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_delegate);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleService);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleHistoryService);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleNotificationAutoEnableManager);
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed17PuzzleDataManager_puzzleStatsService);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  id v4;
  _TtC8NewsFeed17PuzzleDataManager *v5;

  v4 = a3;
  v5 = self;
  sub_1BA9CFB64();

}

@end
