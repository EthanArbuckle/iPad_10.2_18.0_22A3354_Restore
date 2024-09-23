@implementation ARCoachingPillButton

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARCoachingPillButton;
  -[ARCoachingButton layoutSubviews](&v9, sel_layoutSubviews);
  -[ARCoachingPillButton frame](self, "frame");
  v4 = v3;
  -[ARCoachingPillButton frame](self, "frame");
  if (v4 >= v5)
    v6 = v5;
  else
    v6 = v4;
  v7 = v6 * 0.5;
  -[ARCoachingPillButton _continuousCornerRadius](self, "_continuousCornerRadius");
  if (v8 != v7)
    -[ARCoachingPillButton _setContinuousCornerRadius:](self, "_setContinuousCornerRadius:", v7);
}

@end
