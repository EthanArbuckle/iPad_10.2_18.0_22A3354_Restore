@implementation BrandedAppTodayCardLargeIconBackgroundView

- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *)sub_1004D48F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView)initWithCoder:(id)a3
{
  char *v5;
  uint64_t v6;
  id v7;
  _TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *result;

  v5 = (char *)self + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_style;
  v6 = type metadata accessor for Artwork.Style(0, a2);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 1, 1, v6);
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_image) = 0;
  v7 = a3;

  result = (_TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x800000010062E5C0, "SubscribePageExtension/BrandedAppTodayCardLargeIconBackgroundView.swift", 71, 2, 46, 0);
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  _TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView *v2;

  v2 = self;
  sub_1004D4DD8();

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_backgroundImageLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_gradientLayer));
  sub_10039FEA4((uint64_t)self + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_style);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC22SubscribePageExtension42BrandedAppTodayCardLargeIconBackgroundView_image));
}

@end
