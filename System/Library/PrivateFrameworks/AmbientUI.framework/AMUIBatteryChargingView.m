@implementation AMUIBatteryChargingView

+ (id)batteryChargingRingViewWithConfiguration:(id)a3
{
  id v3;
  AMUIBatteryChargingRingView *v4;
  AMUIBatteryChargingRingView *v5;

  v3 = a3;
  v4 = [AMUIBatteryChargingRingView alloc];
  v5 = -[AMUIBatteryChargingRingView initWithFrame:configuration:](v4, "initWithFrame:configuration:", v3, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));

  return v5;
}

- (AMUIBatteryChargingView)initWithFrame:(CGRect)a3
{
  AMUIBatteryChargingView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AMUIBatteryChargingView;
  v3 = -[AMUIBatteryChargingView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMUIBatteryChargingView setBackgroundColor:](v3, "setBackgroundColor:", v4);

  }
  return v3;
}

- (void)setLegibilitySettings:(id)a3
{
  _UILegibilitySettings **p_legibilitySettings;
  id v5;

  p_legibilitySettings = &self->_legibilitySettings;
  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](*p_legibilitySettings, "isEqual:") & 1) == 0)
    objc_storeStrong((id *)p_legibilitySettings, a3);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  AMUIBatteryChargingView *v5;
  AMUIBatteryChargingView *v6;
  AMUIBatteryChargingView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AMUIBatteryChargingView;
  -[AMUIBatteryChargingView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (AMUIBatteryChargingView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
