@implementation BrandedAppTodayCardLargeIconBackgroundView

- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_1001C2254(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_style;
  v6 = type metadata accessor for Artwork.Style(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_image) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/BrandedAppTodayCardLargeIconBackgroundView.swift", 69, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  uint64_t v2;
  _TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView *v3;

  v3 = self;
  sub_1001C2738((uint64_t)v3, v2);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_backgroundImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_gradientLayer));
  sub_1000E9140((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_style);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension42BrandedAppTodayCardLargeIconBackgroundView_image));
}

@end
