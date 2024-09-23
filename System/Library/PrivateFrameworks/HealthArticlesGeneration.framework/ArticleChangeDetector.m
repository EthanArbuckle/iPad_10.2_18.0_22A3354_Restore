@implementation ArticleChangeDetector

- (void)articleStatusDidChange:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  _TtC24HealthArticlesGeneration21ArticleChangeDetector *v8;
  uint64_t v9;

  v4 = sub_1D77BD69C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D77BD684();
  v8 = self;
  sub_1D77B1670();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC24HealthArticlesGeneration21ArticleChangeDetector)init
{
  _TtC24HealthArticlesGeneration21ArticleChangeDetector *result;

  result = (_TtC24HealthArticlesGeneration21ArticleChangeDetector *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector_articlesKVDomain));
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24HealthArticlesGeneration21ArticleChangeDetector____lazy_storage___observers));
}

@end
