@implementation CAFUnitTypeCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFUnitTypeCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSUnit)unitValue
{
  return (NSUnit *)NSUnitFromCAFUnitType(-[CAFUnitTypeCharacteristic unitTypeValue](self, "unitTypeValue"));
}

- (void)setUnitValue:(id)a3
{
  -[CAFUnitTypeCharacteristic setUnitTypeValue:](self, "setUnitTypeValue:", CAFUnitTypeFromNSUnit(a3));
}

- (id)formattedValue
{
  return (id)NSStringFromUnitType(-[CAFUInt16Characteristic uint16Value](self, "uint16Value"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("UnitType");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000046000004");
  v3[1] = CFSTR("0x0000000046000001");
  v3[2] = CFSTR("0x0000000046000005");
  v3[3] = CFSTR("0x00000000FF00000F");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
