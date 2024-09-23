@implementation MUAppleRatingRowSubtitleView

- (MUAppleRatingRowSubtitleView)initWithFrame:(CGRect)a3
{
  return (MUAppleRatingRowSubtitleView *)AppleRatingRowSubtitleView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MUAppleRatingRowSubtitleView)initWithArrangedSubviews:(id)a3
{
  sub_191E0922C();
  sub_191EEB044();
  return (MUAppleRatingRowSubtitleView *)sub_191E248A4();
}

- (MUAppleRatingRowSubtitleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_191E25524();
}

- (void)layoutSubviews
{
  MUAppleRatingRowSubtitleView *v2;

  v2 = self;
  AppleRatingRowSubtitleView.layoutSubviews()();

}

- (void)setPercentageString:(id)a3 ratingsValueString:(id)a4 ratingsValueAnimation:(int64_t)a5 ratingsString:(id)a6
{
  id v11;
  id v12;
  id v13;
  MUAppleRatingRowSubtitleView *v14;

  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = self;
  AppleRatingRowSubtitleView.set(percentageString:ratingsValueString:ratingsValueAnimation:ratingsString:)(a3, a4, a5, (uint64_t)v13);

}

- (void)contentSizeDidChange
{
  MUAppleRatingRowSubtitleView *v2;

  v2 = self;
  sub_191E24D38(0, 0);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___percentLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___rollingLabelsView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___ratingsLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___MUAppleRatingRowSubtitleView____lazy_storage___lineTwoStackView));
}

@end
