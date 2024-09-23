@implementation ArticleNavigationBarMessageContainer

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithDefaultView:(id)a3
{
  return (_TtC12NewsArticles36ArticleNavigationBarMessageContainer *)ArticleNavigationBarMessageContainer.init(defaultView:)(a3);
}

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F31964();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat height;
  void *v4;
  _TtC12NewsArticles36ArticleNavigationBarMessageContainer *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_defaultView);
  v5 = self;
  -[ArticleNavigationBarMessageContainer bounds](v5, sel_bounds);
  objc_msgSend(v4, sel_sizeThatFits_, v6, v7);
  v9 = v8;

  v10 = v9;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  _TtC12NewsArticles36ArticleNavigationBarMessageContainer *v2;

  v2 = self;
  sub_1B9F2FF90();

}

- (_TtC12NewsArticles36ArticleNavigationBarMessageContainer)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticles36ArticleNavigationBarMessageContainer *result;

  result = (_TtC12NewsArticles36ArticleNavigationBarMessageContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_defaultView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles36ArticleNavigationBarMessageContainer_clipView));
}

- (id)showMessage:(int64_t)a3
{
  _TtC12NewsArticles36ArticleNavigationBarMessageContainer *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[3];
  uint64_t v13;

  v4 = self;
  ArticleNavigationBarMessageContainer.show(_:)(a3, (uint64_t)v12);

  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1BA0BF5E4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v10;
}

@end
