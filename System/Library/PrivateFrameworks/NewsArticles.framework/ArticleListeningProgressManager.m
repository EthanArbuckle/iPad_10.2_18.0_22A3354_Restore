@implementation ArticleListeningProgressManager

- (_TtC12NewsArticles31ArticleListeningProgressManager)init
{
  _TtC12NewsArticles31ArticleListeningProgressManager *result;

  result = (_TtC12NewsArticles31ArticleListeningProgressManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC12NewsArticles31ArticleListeningProgressManager_readingHistory));
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31ArticleListeningProgressManager_paidBundleConfigManager);
  swift_release();
  swift_unknownObjectRelease();
}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  uint64_t v6;
  id v7;
  _TtC12NewsArticles31ArticleListeningProgressManager *v8;

  sub_1B9E1D654();
  v6 = sub_1BA0BE768();
  v7 = a3;
  v8 = self;
  sub_1BA0989FC(v6);

  swift_bridgeObjectRelease();
}

@end
