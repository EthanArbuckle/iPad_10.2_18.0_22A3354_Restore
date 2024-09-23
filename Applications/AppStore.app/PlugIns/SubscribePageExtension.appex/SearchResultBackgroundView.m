@implementation SearchResultBackgroundView

- (void)layoutSubviews
{
  sub_1001863BC(self, (uint64_t)a2, (const char **)&selRef_layoutSubviews);
}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  _TtC22SubscribePageExtension26SearchResultBackgroundView *v5;

  v4 = a3;
  v5 = self;
  sub_1001861F0(v4);

}

- (void)_dynamicUserInterfaceTraitDidChange
{
  sub_1001863BC(self, (uint64_t)a2, (const char **)&selRef__dynamicUserInterfaceTraitDidChange);
}

- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SearchResultBackgroundView();
  return -[SearchResultBackgroundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC22SubscribePageExtension26SearchResultBackgroundView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_backgroundGradientColors) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SearchResultBackgroundView();
  return -[SearchResultBackgroundView initWithCoder:](&v5, "initWithCoder:", a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_borderColor));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.super.isa
                                     + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_backgroundGradientColors));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension26SearchResultBackgroundView_gradientLayer));
}

@end
