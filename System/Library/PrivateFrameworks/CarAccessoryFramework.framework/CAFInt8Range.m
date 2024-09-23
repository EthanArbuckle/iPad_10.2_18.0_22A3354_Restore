@implementation CAFInt8Range

- (char)minimumValue
{
  void *v2;
  char v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "charValue");

  return v3;
}

- (char)maximumValue
{
  void *v2;
  char v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "charValue");

  return v3;
}

- (char)stepValue
{
  void *v2;
  char v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "charValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%hhd..%hhd]x%hhd"), -[CAFInt8Range minimumValue](self, "minimumValue"), -[CAFInt8Range maximumValue](self, "maximumValue"), -[CAFInt8Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(char)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithChar:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (char)valueRoundedToNearestStepValue:(char)a3
{
  int v3;
  int v5;

  v3 = a3;
  if (-[CAFInt8Range stepValue](self, "stepValue"))
  {
    v3 -= -[CAFInt8Range minimumValue](self, "minimumValue");
    v5 = v3 / -[CAFInt8Range stepValue](self, "stepValue");
    LOBYTE(v3) = -[CAFInt8Range minimumValue](self, "minimumValue");
    LOBYTE(v3) = v3 + -[CAFInt8Range stepValue](self, "stepValue") * v5;
  }
  return v3;
}

+ (id)minimum
{
  return &unk_250958A28;
}

+ (id)maximum
{
  return &unk_250958A40;
}

+ (id)step
{
  return &unk_250958A58;
}

@end
