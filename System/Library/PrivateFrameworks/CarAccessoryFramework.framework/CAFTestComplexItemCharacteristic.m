@implementation CAFTestComplexItemCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexItem)testComplexItemValue
{
  CAFTestComplexItem *v3;
  void *v4;
  CAFTestComplexItem *v5;

  v3 = [CAFTestComplexItem alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFTestComplexItem initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setTestComplexItemValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "dictionaryRepresentation");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFDictionaryCharacteristic setDictionaryValue:](self, "setDictionaryValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFTestComplexItemCharacteristic testComplexItemValue](self, "testComplexItemValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("TestComplexItem");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x00000000FF000010");
  v3[1] = CFSTR("0x00000000FF000021");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
