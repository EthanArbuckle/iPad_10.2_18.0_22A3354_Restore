@implementation CAFSettingProminenceLevelCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSettingProminenceLevelCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (BOOL)hasAppHomeTile
{
  return +[CAFBitMaskUtilities bitmask:hasOption:](CAFBitMaskUtilities, "bitmask:hasOption:", -[CAFSettingProminenceLevelCharacteristic settingProminenceLevelValue](self, "settingProminenceLevelValue"), 1);
}

- (void)setHasAppHomeTile:(BOOL)a3
{
  -[CAFSettingProminenceLevelCharacteristic setSettingProminenceLevelValue:](self, "setSettingProminenceLevelValue:", +[CAFBitMaskUtilities bitmask:setOption:on:](CAFBitMaskUtilities, "bitmask:setOption:on:", -[CAFSettingProminenceLevelCharacteristic settingProminenceLevelValue](self, "settingProminenceLevelValue"), 1, a3));
}

- (id)formattedValue
{
  return NSStringFromSettingProminenceLevel(-[CAFSettingProminenceLevelCharacteristic settingProminenceLevelValue](self, "settingProminenceLevelValue"));
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("0x0000000036000019");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
