@implementation CAFUInt16Range

- (unsigned)minimumValue
{
  void *v2;
  unsigned __int16 v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (unsigned)maximumValue
{
  void *v2;
  unsigned __int16 v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (unsigned)stepValue
{
  void *v2;
  unsigned __int16 v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedShortValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%hu..%hu]x%hu"), -[CAFUInt16Range minimumValue](self, "minimumValue"), -[CAFUInt16Range maximumValue](self, "maximumValue"), -[CAFUInt16Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned __int16)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned __int16)a3
{
  int v3;
  int v5;

  v3 = a3;
  if (-[CAFUInt16Range stepValue](self, "stepValue"))
  {
    v3 -= -[CAFUInt16Range minimumValue](self, "minimumValue");
    v5 = v3 / -[CAFUInt16Range stepValue](self, "stepValue");
    LOWORD(v3) = -[CAFUInt16Range minimumValue](self, "minimumValue");
    LOWORD(v3) = v3 + -[CAFUInt16Range stepValue](self, "stepValue") * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_2509589E0;
}

+ (id)maximum
{
  return &unk_2509589F8;
}

+ (id)step
{
  return &unk_250958A10;
}

@end
