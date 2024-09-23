@implementation CAFInt32Range

- (int)minimumValue
{
  void *v2;
  int v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)maximumValue
{
  void *v2;
  int v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (int)stepValue
{
  void *v2;
  int v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%d..%d]x%d"), -[CAFInt32Range minimumValue](self, "minimumValue"), -[CAFInt32Range maximumValue](self, "maximumValue"), -[CAFInt32Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(int)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (int)valueRoundedToNearestStepValue:(int)a3
{
  int v5;
  int v6;
  int v7;

  if (-[CAFInt32Range stepValue](self, "stepValue"))
  {
    v5 = a3 - -[CAFInt32Range minimumValue](self, "minimumValue");
    v6 = v5 / -[CAFInt32Range stepValue](self, "stepValue");
    v7 = -[CAFInt32Range minimumValue](self, "minimumValue");
    return v7 + -[CAFInt32Range stepValue](self, "stepValue") * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_2509588D8;
}

+ (id)maximum
{
  return &unk_2509588F0;
}

+ (id)step
{
  return &unk_250958908;
}

@end
