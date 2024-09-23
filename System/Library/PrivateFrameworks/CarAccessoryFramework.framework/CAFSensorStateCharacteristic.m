@implementation CAFSensorStateCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSensorStateCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return (id)NSStringFromSensorState(-[CAFSensorStateCharacteristic sensorStateValue](self, "sensorStateValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x000000003000001A");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
