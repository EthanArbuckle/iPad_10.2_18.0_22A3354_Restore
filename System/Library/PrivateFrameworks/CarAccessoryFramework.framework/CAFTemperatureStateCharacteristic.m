@implementation CAFTemperatureStateCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTemperatureStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return NSStringFromTemperatureState(-[CAFTemperatureStateCharacteristic temperatureStateValue](self, "temperatureStateValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x000000003000001E");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
