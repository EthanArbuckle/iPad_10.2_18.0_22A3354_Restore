@implementation AMUIBatteryChargingUIConfiguration

+ (id)defaultConfiguration
{
  if (defaultConfiguration_onceToken != -1)
    dispatch_once(&defaultConfiguration_onceToken, &__block_literal_global_5);
  return (id)defaultConfiguration___defaultConfiguration;
}

void __58__AMUIBatteryChargingUIConfiguration_defaultConfiguration__block_invoke()
{
  AMUIBatteryChargingUIConfiguration *v0;
  void *v1;

  v0 = -[AMUIBatteryChargingUIConfiguration initWithRingDiameter:lineWidth:boltSize:chargingTextFontSize:]([AMUIBatteryChargingUIConfiguration alloc], "initWithRingDiameter:lineWidth:boltSize:chargingTextFontSize:", 70.0, 7.0, 42.3333, 63.6666, 26.3333);
  v1 = (void *)defaultConfiguration___defaultConfiguration;
  defaultConfiguration___defaultConfiguration = (uint64_t)v0;

}

- (AMUIBatteryChargingUIConfiguration)initWithRingDiameter:(double)a3 lineWidth:(double)a4 boltSize:(CGSize)a5 chargingTextFontSize:(double)a6
{
  CGFloat height;
  CGFloat width;
  AMUIBatteryChargingUIConfiguration *result;
  objc_super v12;

  height = a5.height;
  width = a5.width;
  v12.receiver = self;
  v12.super_class = (Class)AMUIBatteryChargingUIConfiguration;
  result = -[AMUIBatteryChargingUIConfiguration init](&v12, sel_init);
  if (result)
  {
    result->_ringDiameter = a3;
    result->_lineWidth = a4;
    result->_boltSize.width = width;
    result->_boltSize.height = height;
    result->_chargingTextFontSize = a6;
  }
  return result;
}

- (double)ringDiameter
{
  return self->_ringDiameter;
}

- (void)setRingDiameter:(double)a3
{
  self->_ringDiameter = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

- (CGSize)boltSize
{
  double width;
  double height;
  CGSize result;

  width = self->_boltSize.width;
  height = self->_boltSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setBoltSize:(CGSize)a3
{
  self->_boltSize = a3;
}

- (double)chargingTextFontSize
{
  return self->_chargingTextFontSize;
}

- (BOOL)staticViewNeeded
{
  return self->_staticViewNeeded;
}

@end
