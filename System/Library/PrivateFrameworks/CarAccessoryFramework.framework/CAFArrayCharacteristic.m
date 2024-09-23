@implementation CAFArrayCharacteristic

+ (void)load
{
  objc_super v2;

  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___CAFArrayCharacteristic;
  objc_msgSendSuper2(&v2, sel_load);
}

- (NSArray)arrayValue
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

  return (NSArray *)v4;
}

- (void)setArrayValue:(id)a3
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
  void *v6;
  __CFString *v7;

  -[CAFCharacteristic value](self, "value");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    -[CAFArrayCharacteristic arrayValue](self, "arrayValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "componentsJoinedByString:", CFSTR(", "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@]"), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = CFSTR("(null)");
  }

  return v7;
}

+ (id)primaryCharacteristicFormat
{
  return CFSTR("array");
}

+ (id)secondaryCharacteristicFormats
{
  _QWORD v3[23];

  v3[22] = *MEMORY[0x24BDAC8D0];
  v3[0] = CFSTR("0x0000000050000001");
  v3[1] = CFSTR("0x0000000036000012");
  v3[2] = CFSTR("0x0000000030000037");
  v3[3] = CFSTR("0x0000000030000018");
  v3[4] = CFSTR("0x0000000036000009");
  v3[5] = CFSTR("0x0000000036000007");
  v3[6] = CFSTR("0x0000000036000062");
  v3[7] = CFSTR("0x00000000FF000011");
  v3[8] = CFSTR("0x00000000FF00001C");
  v3[9] = CFSTR("0x00000000FF00001A");
  v3[10] = CFSTR("0x00000000FF000017");
  v3[11] = CFSTR("0x00000000FF000018");
  v3[12] = CFSTR("0x00000000FF000019");
  v3[13] = CFSTR("0x00000000FF000016");
  v3[14] = CFSTR("0x00000000FF00001D");
  v3[15] = CFSTR("0x00000000FF00001B");
  v3[16] = CFSTR("0x00000000FF000013");
  v3[17] = CFSTR("0x00000000FF000014");
  v3[18] = CFSTR("0x00000000FF000015");
  v3[19] = CFSTR("0x00000000FF000012");
  v3[20] = CFSTR("0x0000000047000004");
  v3[21] = CFSTR("0x0000000031000025");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v3, 22);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
