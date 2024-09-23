@implementation CAFInt16Range

- (signed)minimumValue
{
  void *v2;
  signed __int16 v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (signed)maximumValue
{
  void *v2;
  signed __int16 v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (signed)stepValue
{
  void *v2;
  signed __int16 v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shortValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%hd..%hd]x%hd"), -[CAFInt16Range minimumValue](self, "minimumValue"), -[CAFInt16Range maximumValue](self, "maximumValue"), -[CAFInt16Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(signed __int16)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithShort:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (signed)valueRoundedToNearestStepValue:(signed __int16)a3
{
  int v3;
  int v5;

  v3 = a3;
  if (-[CAFInt16Range stepValue](self, "stepValue"))
  {
    v3 -= -[CAFInt16Range minimumValue](self, "minimumValue");
    v5 = v3 / -[CAFInt16Range stepValue](self, "stepValue");
    LOWORD(v3) = -[CAFInt16Range minimumValue](self, "minimumValue");
    LOWORD(v3) = v3 + -[CAFInt16Range stepValue](self, "stepValue") * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_2509586B0;
}

+ (id)maximum
{
  return &unk_2509586C8;
}

+ (id)step
{
  return &unk_2509586E0;
}

@end
