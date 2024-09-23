@implementation CAFUInt32Range

- (unsigned)minimumValue
{
  void *v2;
  unsigned int v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)maximumValue
{
  void *v2;
  unsigned int v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (unsigned)stepValue
{
  void *v2;
  unsigned int v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%u..%u]x%u"), -[CAFUInt32Range minimumValue](self, "minimumValue"), -[CAFUInt32Range maximumValue](self, "maximumValue"), -[CAFUInt32Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unsigned int)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (unsigned)valueRoundedToNearestStepValue:(unsigned int)a3
{
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;

  if (-[CAFUInt32Range stepValue](self, "stepValue"))
  {
    v5 = a3 - -[CAFUInt32Range minimumValue](self, "minimumValue");
    v6 = v5 / -[CAFUInt32Range stepValue](self, "stepValue");
    v7 = -[CAFUInt32Range minimumValue](self, "minimumValue");
    return v7 + -[CAFUInt32Range stepValue](self, "stepValue") * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_250958920;
}

+ (id)maximum
{
  return &unk_250958938;
}

+ (id)step
{
  return &unk_250958950;
}

@end
