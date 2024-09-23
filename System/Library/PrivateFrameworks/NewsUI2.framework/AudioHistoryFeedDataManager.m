@implementation AudioHistoryFeedDataManager

- (_TtC7NewsUI227AudioHistoryFeedDataManager)init
{
  _TtC7NewsUI227AudioHistoryFeedDataManager *result;

  result = (_TtC7NewsUI227AudioHistoryFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioHistoryFeedDataManager_delegate);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI227AudioHistoryFeedDataManager_headlineService);

}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6;
  _TtC7NewsUI227AudioHistoryFeedDataManager *v7;

  sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4780);
  sub_1D6E267D4();
  v6 = a3;
  v7 = self;
  sub_1D62BFF0C(v6);

  swift_bridgeObjectRelease();
}

@end
