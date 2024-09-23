@implementation CAFChargingStateCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFChargingStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return (id)NSStringFromChargingState(-[CAFChargingStateCharacteristic chargingStateValue](self, "chargingStateValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000040000005");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
