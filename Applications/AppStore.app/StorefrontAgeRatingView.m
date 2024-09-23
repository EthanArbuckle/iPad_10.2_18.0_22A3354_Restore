@implementation StorefrontAgeRatingView

- (_TtC8AppStore23StorefrontAgeRatingView)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23StorefrontAgeRatingView *)sub_100469248(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23StorefrontAgeRatingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  uint64_t v8;
  _TtC8AppStore23StorefrontAgeRatingView *result;

  v5 = OBJC_IVAR____TtC8AppStore23StorefrontAgeRatingView_label;
  v6 = objc_allocWithZone((Class)UILabel);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, "init");
  v8 = OBJC_IVAR____TtC8AppStore23StorefrontAgeRatingView_fontMetrics;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone((Class)UIFontMetrics), "initForTextStyle:", UIFontTextStyleSubheadline);

  result = (_TtC8AppStore23StorefrontAgeRatingView *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001006A63C0, "AppStore/StorefrontAgeRatingView.swift", 38, 2, 42, 0);
  __break(1u);
  return result;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  _TtC8AppStore23StorefrontAgeRatingView *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23StorefrontAgeRatingView_fontMetrics);
  v3 = self;
  objc_msgSend(v2, "scaledValueForValue:", 26.0);
  v5 = v4;
  objc_msgSend(v2, "scaledValueForValue:", 26.0);
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[StorefrontAgeRatingView intrinsicContentSize](self, "intrinsicContentSize", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  _TtC8AppStore23StorefrontAgeRatingView *v2;

  v2 = self;
  sub_1004696C0();

}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore23StorefrontAgeRatingView_fontMetrics));
}

@end
