@implementation TDEffectParameterValue

+ (id)keyPathsForValuesAffectingColor
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("colorValue"), 0);
}

+ (id)keyPathsForValuesAffectingRedComponent
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("colorValue"), 0);
}

- (unint64_t)redComponent
{
  return objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
}

- (void)setRedComponent:(unint64_t)a3
{
  unsigned __int8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  -[TDEffectParameterValue setColorValue:](self, "setColorValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFFFFFF00 | v3));
}

+ (id)keyPathsForValuesAffectingGreenComponent
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("colorValue"), 0);
}

- (unint64_t)greenComponent
{
  return ((unsigned __int16)objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue") >> 8);
}

- (void)setGreenComponent:(unint64_t)a3
{
  unsigned __int8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  -[TDEffectParameterValue setColorValue:](self, "setColorValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFFFF00FFLL | ((unint64_t)v3 << 8)));
}

+ (id)keyPathsForValuesAffectingBlueComponent
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("colorValue"), 0);
}

- (unint64_t)blueComponent
{
  return (objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue") >> 16);
}

- (void)setBlueComponent:(unint64_t)a3
{
  unsigned __int8 v3;
  uint64_t v5;

  v3 = a3;
  v5 = objc_msgSend((id)-[TDEffectParameterValue colorValue](self, "colorValue"), "unsignedIntegerValue");
  -[TDEffectParameterValue setColorValue:](self, "setColorValue:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v5 & 0xFFFFFFFFFF00FFFFLL | ((unint64_t)v3 << 16)));
}

@end
