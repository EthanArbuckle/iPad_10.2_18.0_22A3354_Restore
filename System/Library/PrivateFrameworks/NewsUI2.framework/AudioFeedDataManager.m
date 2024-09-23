@implementation AudioFeedDataManager

- (_TtC7NewsUI220AudioFeedDataManager)init
{
  _TtC7NewsUI220AudioFeedDataManager *result;

  result = (_TtC7NewsUI220AudioFeedDataManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1D5FF43C0((uint64_t)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_delegate);
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_offlineFeedPrimer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_offlineFeatures);
}

- (void)readingHistory:(id)a3 didAddArticlesWithIDs:(id)a4
{
  id v6;
  _TtC7NewsUI220AudioFeedDataManager *v7;

  sub_1D6E26D80();
  v6 = a3;
  v7 = self;
  sub_1D68F38C0(v6);

  swift_bridgeObjectRelease();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6;
  _TtC7NewsUI220AudioFeedDataManager *v7;

  sub_1D5E6F04C(0, (unint64_t *)&qword_1ED5F4780);
  sub_1D6E267D4();
  v6 = a3;
  v7 = self;
  sub_1D68F5614();

  swift_bridgeObjectRelease();
}

- (void)readingHistoryDidClear:(id)a3
{
  sub_1D68F3B6C((char *)self, (uint64_t)a2, a3, (unint64_t)&unk_1E9AB0B60);
}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
  sub_1D68F3B6C((char *)self, (uint64_t)a2, a3, (unint64_t)&unk_1E9AB0B88);
}

- (void)readingHistory:(id)a3 didRemoveArticlesWithIDs:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtC7NewsUI220AudioFeedDataManager *v9;

  v6 = MEMORY[0x1D82919D4]((char *)self + OBJC_IVAR____TtC7NewsUI220AudioFeedDataManager_delegate, a2, a3, a4);
  if (v6)
  {
    v7 = v6;
    v8 = a3;
    v9 = self;
    sub_1D68F445C((unint64_t)&unk_1E9AB0BB0, v7);

    swift_unknownObjectRelease();
  }
}

@end
