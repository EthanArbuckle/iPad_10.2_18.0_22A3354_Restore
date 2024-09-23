@implementation CAFUInt8Range

- (unsigned)minimumValue
{
  void *v2;
  unsigned __int8 v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedCharValue");

  return v3;
}

- (unsigned)maximumValue
{
  void *v2;
  unsigned __int8 v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedCharValue");

  return v3;
}

- (unsigned)stepValue
{
  void *v2;
  unsigned __int8 v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedCharValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%hhu..%hhu]x%hhu"), -[CAFUInt8Range minimumValue](self, "minimumValue"), -[CAFUInt8Range maximumValue](self, "maximumValue"), -[CAFUInt8Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned __int8)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned __int8)a3
{
  int v3;
  int v5;

  v3 = a3;
  if (-[CAFUInt8Range stepValue](self, "stepValue"))
  {
    v3 -= -[CAFUInt8Range minimumValue](self, "minimumValue");
    v5 = v3 / -[CAFUInt8Range stepValue](self, "stepValue");
    LOBYTE(v3) = -[CAFUInt8Range minimumValue](self, "minimumValue");
    LOBYTE(v3) = v3 + -[CAFUInt8Range stepValue](self, "stepValue") * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_250958890;
}

+ (id)maximum
{
  return &unk_2509588A8;
}

+ (id)step
{
  return &unk_2509588C0;
}

@end
