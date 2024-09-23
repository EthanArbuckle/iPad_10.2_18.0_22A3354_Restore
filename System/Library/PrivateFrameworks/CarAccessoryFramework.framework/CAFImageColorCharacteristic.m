@implementation CAFImageColorCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFImageColorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (id)formattedValue
{
  return NSStringFromImageColor(-[CAFImageColorCharacteristic imageColorValue](self, "imageColorValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000037000009");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
