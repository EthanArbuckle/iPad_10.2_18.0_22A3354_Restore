@implementation CAFPressureStateCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFPressureStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return NSStringFromPressureState(-[CAFPressureStateCharacteristic pressureStateValue](self, "pressureStateValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x000000003000001C");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
