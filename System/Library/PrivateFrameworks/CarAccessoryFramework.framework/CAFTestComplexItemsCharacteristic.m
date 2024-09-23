@implementation CAFTestComplexItemsCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFTestComplexItemsCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (CAFTestComplexItems)testComplexItemsValue
{
  void *v2;
  void *v3;

  -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[CAFTestComplexItems testComplexItemsWithArray:](CAFTestComplexItems, "testComplexItemsWithArray:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CAFTestComplexItems *)v3;
}

- (void)setTestComplexItemsValue:(id)a3
{
  id v4;

  objc_msgSend(a3, "testComplexItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CAFArrayCharacteristic setArrayValue:](self, "setArrayValue:", v4);

}

- (id)formattedValue
{
  void *v2;
  void *v3;

  -[CAFTestComplexItemsCharacteristic testComplexItemsValue](self, "testComplexItemsValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("TestComplexItems");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x00000000FF000022");
  v3[1] = CFSTR("0x00000000FF000020");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
