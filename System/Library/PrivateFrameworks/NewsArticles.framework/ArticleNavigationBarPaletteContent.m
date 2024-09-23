@implementation ArticleNavigationBarPaletteContent

+ (double)paletteHeight
{
  if (qword_1EF24EA88 != -1)
    swift_once();
  return *(double *)&qword_1EF256038;
}

- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v10;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar;
  v9 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_horizontalScrollOffset) = 0;
  *(Class *)((char *)&v10->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_bottomPaletteButtonLocation) = 0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for ArticleNavigationBarPaletteContent();
  v11 = -[ArticleNavigationBarPaletteContent initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
  -[ArticleNavigationBarPaletteContent addSubview:](v11, sel_addSubview_, *(Class *)((char *)&v11->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar));
  return v11;
}

- (_TtC12NewsArticles34ArticleNavigationBarPaletteContent)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *result;

  v5 = OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_horizontalScrollOffset) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_bottomPaletteButtonLocation) = 0;

  result = (_TtC12NewsArticles34ArticleNavigationBarPaletteContent *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)setBarColorFor:(id)a3 primaryColor:(id)a4 secondaryColor:(id)a5 primaryVisibilityFactor:(double)a6
{
  id v10;
  id v11;
  id v12;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v13;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  sub_1B9F3EF4C(v10, (uint64_t)a4, a6);

}

- (void)setBarColor:(id)a3
{
  id v5;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v6;

  v5 = a3;
  v6 = self;
  sub_1B9F3F1C4(a3);

}

- (void)compressWithScale:(double)a3 opacity:(double)a4
{
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v6;

  v6 = self;
  sub_1B9F3F3CC(a3, a4);

}

- (double)paletteHeight
{
  uint64_t v2;
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v3;
  double v4;

  v2 = qword_1EF24EA88;
  v3 = self;
  if (v2 != -1)
    swift_once();
  v4 = *(double *)&qword_1EF256038;

  return v4;
}

- (void)layoutSubviews
{
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v2;

  v2 = self;
  sub_1B9F3F718();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles34ArticleNavigationBarPaletteContent_opaqueBar));
}

- (id)showMessage:(int64_t)a3
{
  _TtC12NewsArticles34ArticleNavigationBarPaletteContent *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  __int128 v12;
  uint64_t v13;

  v4 = self;
  ArticleNavigationBarPaletteContent.show(_:)(a3, &v12);

  v5 = v13;
  if (!v13)
    return 0;
  v6 = __swift_project_boxed_opaque_existential_1(&v12, v13);
  v7 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v7 + 16))(v9);
  v10 = (void *)sub_1BA0BF5E4();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v5);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)&v12);
  return v10;
}

@end
