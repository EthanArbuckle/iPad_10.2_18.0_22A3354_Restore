@implementation CAFDataCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFDataCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSData)dataValue
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

  return (NSData *)v4;
}

- (void)setDataValue:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[CAFCharacteristic setValue:](self, "setValue:", v4);

}

- (id)formattedValue
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __CFString *v9;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CAFDataCharacteristic dataValue](self, "dataValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "length");
    -[CAFDataCharacteristic dataValue](self, "dataValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "description");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("bytes=%lu %@"), v6, v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = CFSTR("(null)");
  }

  return v9;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("data");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[4];

  v3[3] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000032000020");
  v3[1] = CFSTR("0x00000000FF00000C");
  v3[2] = CFSTR("0x00000000FF00000D");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
