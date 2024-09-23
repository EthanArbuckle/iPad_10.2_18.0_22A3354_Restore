@implementation HPSBatteryStatusVerticalStackView

- (HPSBatteryStatusVerticalStackView)init
{
  HPSBatteryStatusVerticalStackView *v2;
  HPSBatteryStatusVerticalStackView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HPSBatteryStatusVerticalStackView;
  v2 = -[HPSBatteryStatusVerticalStackView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HPSBatteryStatusVerticalStackView setAxis:](v2, "setAxis:", 1);
    -[HPSBatteryStatusVerticalStackView setAlignment:](v3, "setAlignment:", 3);
    -[HPSBatteryStatusVerticalStackView setDistribution:](v3, "setDistribution:", 3);
    -[HPSBatteryStatusVerticalStackView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v3;
}

@end
