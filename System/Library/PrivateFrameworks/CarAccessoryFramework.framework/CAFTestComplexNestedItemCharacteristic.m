@implementation CAFTestComplexNestedItemCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedItem)testComplexNestedItemValue
{
  CAFTestComplexNestedItem *v3;
  void *v4;
  CAFTestComplexNestedItem *v5;

  v3 = [CAFTestComplexNestedItem alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFTestComplexNestedItem initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setTestComplexNestedItemValue:(id)a3
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

  -[CAFTestComplexNestedItemCharacteristic testComplexNestedItemValue](self, "testComplexNestedItemValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("TestComplexNestedItem");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x00000000FF000025");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
