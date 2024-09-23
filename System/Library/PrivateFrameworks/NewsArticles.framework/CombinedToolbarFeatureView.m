@implementation CombinedToolbarFeatureView

- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1B9F84E30();
}

- (void)layoutSubviews
{
  _TtC12NewsArticles26CombinedToolbarFeatureView *v2;

  v2 = self;
  sub_1B9F8479C();

}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  _TtC12NewsArticles26CombinedToolbarFeatureView *v4;
  id v5;
  double Height;
  double v7;
  double v8;
  CGSize result;
  CGRect v10;

  if (*(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_coverModel)
    && (v3 = *(Class *)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverButton)) != 0)
  {
    v4 = self;
    v5 = v3;
    objc_msgSend(v5, sel_frame);
    Height = CGRectGetHeight(v10);

    v7 = Height + 38.0;
  }
  else
  {
    v7 = 38.0;
  }
  v8 = 72.0;
  result.height = v7;
  result.width = v8;
  return result;
}

- (_TtC12NewsArticles26CombinedToolbarFeatureView)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticles26CombinedToolbarFeatureView *result;

  result = (_TtC12NewsArticles26CombinedToolbarFeatureView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B9F84D28(*(void **)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_coverModel));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverViewButtonFactory);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_issueCoverButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView_newsPlusLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26CombinedToolbarFeatureView____lazy_storage___animator));
}

@end
