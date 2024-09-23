@implementation AudioRecentlyPlayedStore

- (_TtC7NewsUI224AudioRecentlyPlayedStore)init
{
  _TtC7NewsUI224AudioRecentlyPlayedStore *result;

  result = (_TtC7NewsUI224AudioRecentlyPlayedStore *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224AudioRecentlyPlayedStore_headlineService);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI224AudioRecentlyPlayedStore_paidBundleConfigManager);
}

- (void)readingHistoryDidClear:(id)a3
{
  id v4;
  _TtC7NewsUI224AudioRecentlyPlayedStore *v5;

  v4 = a3;
  v5 = self;
  swift_retain();
  sub_1D6E1A168();

  swift_release();
}

- (uint64_t)readingHistory:(void *)a3 didRemoveArticlesWithIDs:
{
  id v4;
  id v5;

  v4 = a3;
  v5 = a1;
  swift_retain();
  sub_1D6E1A168();

  return swift_release();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6;
  _TtC7NewsUI224AudioRecentlyPlayedStore *v7;

  sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4780);
  sub_1D6E267D4();
  v6 = a3;
  v7 = self;
  sub_1D6C0B7D8();

  swift_bridgeObjectRelease();
}

@end
