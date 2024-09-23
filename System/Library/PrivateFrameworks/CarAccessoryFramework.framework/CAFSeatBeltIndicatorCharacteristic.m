@implementation CAFSeatBeltIndicatorCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSeatBeltIndicatorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return NSStringFromSeatBeltIndicator(-[CAFSeatBeltIndicatorCharacteristic seatBeltIndicatorValue](self, "seatBeltIndicatorValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000060000007");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
