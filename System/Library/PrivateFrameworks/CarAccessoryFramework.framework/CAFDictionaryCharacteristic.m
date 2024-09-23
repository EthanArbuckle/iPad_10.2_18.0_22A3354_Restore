@implementation CAFDictionaryCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDictionaryCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSDictionary)dictionaryValue
{
  id v3;
  id v4;

  objc_opt_class();
  -[CAFCharacteristic value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return (NSDictionary *)v4;
}

- (void)setDictionaryValue:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[CAFCharacteristic setValue:](self, "setValue:", v4);

}

- (id)formattedValue
{
  void *v3;
  void *v4;
  __CFString *v5;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "description");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = CFSTR("(null)");
  }

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("dictionary");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
