@implementation CAFSymbolNameAndColorCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFSymbolNameAndColorCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFSymbolNameAndColor)symbolNameAndColorValue
{
  void *v2;
  void *v3;

  -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFSymbolNameAndColor symbolNameAndColorWithArray:](CAFSymbolNameAndColor, "symbolNameAndColorWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFSymbolNameAndColor *)v3;
}

- (void)setSymbolNameAndColorValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "symbolImageWithColors");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFArrayCharacteristic setArrayValue:](self, "setArrayValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFSymbolNameAndColorCharacteristic symbolNameAndColorValue](self, "symbolNameAndColorValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("SymbolNameAndColor");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
