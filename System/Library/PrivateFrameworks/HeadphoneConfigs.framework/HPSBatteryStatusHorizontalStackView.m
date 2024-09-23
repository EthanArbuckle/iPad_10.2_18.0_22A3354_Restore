@implementation HPSBatteryStatusHorizontalStackView

- (HPSBatteryStatusHorizontalStackView)init
{
  HPSBatteryStatusHorizontalStackView *v2;
  HPSBatteryStatusHorizontalStackView *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HPSBatteryStatusHorizontalStackView;
  v2 = -[HPSBatteryStatusHorizontalStackView init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[HPSBatteryStatusHorizontalStackView setAxis:](v2, "setAxis:", 0);
    -[HPSBatteryStatusHorizontalStackView setAlignment:](v3, "setAlignment:", 3);
    -[HPSBatteryStatusHorizontalStackView setDistribution:](v3, "setDistribution:", 3);
    -[HPSBatteryStatusHorizontalStackView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  }
  return v3;
}

@end
