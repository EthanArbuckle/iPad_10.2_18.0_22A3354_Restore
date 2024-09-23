@implementation CAFButtonActionCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFButtonActionCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return (id)NSStringFromButtonAction(-[CAFButtonActionCharacteristic buttonActionValue](self, "buttonActionValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("ButtonAction");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000036000010");
  v3[1] = CFSTR("0x00000000FF00000E");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
