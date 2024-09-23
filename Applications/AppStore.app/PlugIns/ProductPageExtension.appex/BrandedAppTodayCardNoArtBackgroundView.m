@implementation BrandedAppTodayCardNoArtBackgroundView

- (_TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView *)sub_1000E867C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView *result;

  v5 = (char *)self + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_style;
  v6 = type metadata accessor for Artwork.Style(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_image) = 0;
  v7 = a3;

  result = (_TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x8000000100685560, "ProductPageExtension/BrandedAppTodayCardNoArtBackgroundView.swift", 65, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView *v2;

  v2 = self;
  sub_1000E8B78();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_imageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_gradientLayer));
  sub_1000E9140((uint64_t)self + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_style);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20ProductPageExtension38BrandedAppTodayCardNoArtBackgroundView_image));
}

@end
