@implementation CSBatteryFillView

- (CSBatteryFillView)initWithFrame:(CGRect)a3 isInternalBattery:(BOOL)a4 lowBatteryLevel:(int64_t)a5
{
  CSBatteryFillView *result;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CSBatteryFillView;
  result = -[CSBatteryFillView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result)
  {
    result->_isInternalBattery = a4;
    result->_lowBatteryLevel = a5;
  }
  return result;
}

- (void)setChargePercentage:(int64_t)a3
{
  self->_chargePercentage = a3;
  -[CSBatteryFillView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)setBatterySaverModeActive:(BOOL)a3
{
  self->_isBatterySaverModeActive = a3;
  -[CSBatteryFillView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  double width;
  CGFloat y;
  double x;
  void *v8;
  float v9;
  double v10;
  id *v11;
  id v12;
  CGRect v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self->_isInternalBattery && self->_isBatterySaverModeActive)
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "systemYellowColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_chargePercentage <= self->_lowBatteryLevel)
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
    else
      objc_msgSend(MEMORY[0x1E0CEA478], "systemGreenColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v8;
  objc_msgSend(v8, "set");
  v9 = width * (double)self->_chargePercentage / 100.0;
  v10 = floorf(v9);
  v11 = (id *)MEMORY[0x1E0CEB258];
  if (objc_msgSend((id)*MEMORY[0x1E0CEB258], "userInterfaceLayoutDirection") != 1 && !self->_isInternalBattery
    || objc_msgSend(*v11, "userInterfaceLayoutDirection") == 1 && self->_isInternalBattery)
  {
    x = x + width - v10;
  }
  v13.origin.x = x;
  v13.origin.y = y;
  v13.size.width = v10;
  v13.size.height = height;
  UIRectFill(v13);

}

@end
