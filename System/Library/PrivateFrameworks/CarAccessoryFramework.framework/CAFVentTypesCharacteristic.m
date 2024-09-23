@implementation CAFVentTypesCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFVentTypesCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasWindow
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 1);
}

- (void)setHasWindow:(BOOL)a3
{
  -[CAFVentTypesCharacteristic setVentTypesValue:](self, "setVentTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 1, a3));
}

- (BOOL)hasUpper
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 2);
}

- (void)setHasUpper:(BOOL)a3
{
  -[CAFVentTypesCharacteristic setVentTypesValue:](self, "setVentTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 2, a3));
}

- (BOOL)hasLower
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 4);
}

- (void)setHasLower:(BOOL)a3
{
  -[CAFVentTypesCharacteristic setVentTypesValue:](self, "setVentTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 4, a3));
}

- (BOOL)hasNeck
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 8);
}

- (void)setHasNeck:(BOOL)a3
{
  -[CAFVentTypesCharacteristic setVentTypesValue:](self, "setVentTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 8, a3));
}

- (BOOL)hasMiddle
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 16);
}

- (void)setHasMiddle:(BOOL)a3
{
  -[CAFVentTypesCharacteristic setVentTypesValue:](self, "setVentTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"), 16, a3));
}

- (id)formattedValue
{
  return NSStringFromVentTypes(-[CAFVentTypesCharacteristic ventTypesValue](self, "ventTypesValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000031000015");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
