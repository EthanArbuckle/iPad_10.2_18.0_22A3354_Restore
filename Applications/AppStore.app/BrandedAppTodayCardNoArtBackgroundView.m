@implementation BrandedAppTodayCardNoArtBackgroundView

- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *)sub_1004914E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *result;

  v5 = (char *)self + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_style;
  v6 = type metadata accessor for Artwork.Style(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_image) = 0;
  v7 = a3;

  result = (_TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/BrandedAppTodayCardNoArtBackgroundView.swift", 53, 2, 48, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView *v2;

  v2 = self;
  sub_1004919E0();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_imageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_gradientLayer));
  sub_100491FA8((uint64_t)self + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_style);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore38BrandedAppTodayCardNoArtBackgroundView_image));
}

@end
