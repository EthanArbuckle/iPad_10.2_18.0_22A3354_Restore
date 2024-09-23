@implementation CAFTestComplexNestedItemsCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexNestedItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexNestedItems)testComplexNestedItemsValue
{
  void *v2;
  void *v3;

  -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFTestComplexNestedItems testComplexNestedItemsWithArray:](CAFTestComplexNestedItems, "testComplexNestedItemsWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexNestedItems *)v3;
}

- (void)setTestComplexNestedItemsValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "testComplexNestedItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFArrayCharacteristic setArrayValue:](self, "setArrayValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFTestComplexNestedItemsCharacteristic testComplexNestedItemsValue](self, "testComplexNestedItemsValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("TestComplexNestedItems");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x00000000FF000026");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
