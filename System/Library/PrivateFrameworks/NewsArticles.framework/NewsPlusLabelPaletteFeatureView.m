@implementation NewsPlusLabelPaletteFeatureView

- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *result;

  *((_BYTE *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_isTransitioning) = 0;
  v5 = OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label;
  v6 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *)sub_1BA0BF3B0();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  -[NewsPlusLabelPaletteFeatureView layoutSubviews](&v4, sel_layoutSubviews);
  v3 = *(void **)&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label];
  objc_msgSend(v3, sel_sizeToFit, v4.receiver, v4.super_class);
  objc_msgSend(v2, sel_bounds);
  sub_1BA0BEFB4();
  objc_msgSend(v3, sel_setCenter_);

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label), sel_sizeThatFits_, a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToWindow
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[NewsPlusLabelPaletteFeatureView didMoveToWindow](&v3, sel_didMoveToWindow);
  __swift_project_boxed_opaque_existential_1(&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler], *(_QWORD *)&v2[OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler + 24]);
  sub_1B9E93CD4(v2);

}

- (void)style
{
  _TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *v3;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler));
  v3 = self;
  sub_1B9E93CD4((char *)v3);

}

- (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *result;

  result = (_TtC12NewsArticles31NewsPlusLabelPaletteFeatureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_renderer);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_styler);
  sub_1B9E6C380((uint64_t)self + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_page);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles31NewsPlusLabelPaletteFeatureView_label));
}

@end
