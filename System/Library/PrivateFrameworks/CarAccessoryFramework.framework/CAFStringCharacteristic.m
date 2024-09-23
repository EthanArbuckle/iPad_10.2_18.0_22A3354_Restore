@implementation CAFStringCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFStringCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSString)stringValue
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[CAFCharacteristic value](self, "value");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (v3 && (objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (void)setStringValue:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[CAFCharacteristic setValue:](self, "setValue:", v4);

}

- (id)formattedValue
{
  void *v3;
  __CFString *v4;
  __CFString *v5;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CAFStringCharacteristic stringValue](self, "stringValue");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("(null)");
  }
  v5 = v4;

  return v5;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("string");
}

+ (id)secondaryCharacteristicFormats
{
  return (id)MEMORY[0x24BDBD1A8];
}

@end
