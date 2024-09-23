@implementation BrandBar

- (void)contentSizeCategoryDidChange
{
  _TtC12NewsArticles8BrandBar *v3;

  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer), *(uint64_t *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints+ OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer));
  v3 = self;
  sub_1BA0142C8((uint64_t)v3);
  -[BrandBar setNeedsLayout](v3, sel_setNeedsLayout);

}

- (_TtC12NewsArticles8BrandBar)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_1BA057E20();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  _TtC12NewsArticles8BrandBar *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v5 = self;
  sub_1BA0148C4((uint64_t)v5, width, height);
  v7 = v6;
  v9 = v8;

  v10 = v7;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  -[BrandBar layoutSubviews](&v3, sel_layoutSubviews);
  sub_1BA014438(v2);

}

- (_TtC12NewsArticles8BrandBar)initWithFrame:(CGRect)a3
{
  _TtC12NewsArticles8BrandBar *result;

  result = (_TtC12NewsArticles8BrandBar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles8BrandBar_renderer);
}

@end
