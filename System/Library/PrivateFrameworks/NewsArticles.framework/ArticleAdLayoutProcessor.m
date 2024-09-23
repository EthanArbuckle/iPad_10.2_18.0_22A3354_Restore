@implementation ArticleAdLayoutProcessor

- (void)processLayoutTask:(id)a3 layoutBlueprint:(id)a4 DOMObjectProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC12NewsArticles24ArticleAdLayoutProcessor *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  sub_1B9E6D76C(v9, v10);

}

- (_TtC12NewsArticles24ArticleAdLayoutProcessor)init
{
  _TtC12NewsArticles24ArticleAdLayoutProcessor *result;

  result = (_TtC12NewsArticles24ArticleAdLayoutProcessor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles24ArticleAdLayoutProcessor_bannerAdRequesterFactory);
  v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles24ArticleAdLayoutProcessor_layoutEnvironment;
  v4 = sub_1BA0BCD40();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
