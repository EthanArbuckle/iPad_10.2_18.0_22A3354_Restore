@implementation CAFTestComplexNestedListItemCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedListItemCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedListItem)testComplexNestedListItemValue
{
  CAFTestComplexNestedListItem *v3;
  void *v4;
  CAFTestComplexNestedListItem *v5;

  v3 = [CAFTestComplexNestedListItem alloc];
  -[CAFDictionaryCharacteristic dictionaryValue](self, "dictionaryValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[CAFTestComplexNestedListItem initWithDictionary:](v3, "initWithDictionary:", v4);

  return v5;
}

- (void)setTestComplexNestedListItemValue:(id)a3
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

  -[CAFTestComplexNestedListItemCharacteristic testComplexNestedListItemValue](self, "testComplexNestedListItemValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("TestComplexNestedListItem");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x00000000FF000027");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
