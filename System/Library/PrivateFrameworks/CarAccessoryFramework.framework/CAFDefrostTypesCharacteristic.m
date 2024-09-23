@implementation CAFDefrostTypesCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDefrostTypesCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasBlownAir
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFDefrostTypesCharacteristic defrostTypesValue](self, "defrostTypesValue"), 1);
}

- (void)setHasBlownAir:(BOOL)a3
{
  -[CAFDefrostTypesCharacteristic setDefrostTypesValue:](self, "setDefrostTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFDefrostTypesCharacteristic defrostTypesValue](self, "defrostTypesValue"), 1, a3));
}

- (BOOL)hasFilament
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFDefrostTypesCharacteristic defrostTypesValue](self, "defrostTypesValue"), 2);
}

- (void)setHasFilament:(BOOL)a3
{
  -[CAFDefrostTypesCharacteristic setDefrostTypesValue:](self, "setDefrostTypesValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFDefrostTypesCharacteristic defrostTypesValue](self, "defrostTypesValue"), 2, a3));
}

- (id)formattedValue
{
  return NSStringFromDefrostTypes(-[CAFDefrostTypesCharacteristic defrostTypesValue](self, "defrostTypesValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000031000014");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
