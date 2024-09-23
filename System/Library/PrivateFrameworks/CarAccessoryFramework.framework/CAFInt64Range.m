@implementation CAFInt64Range

- (int64_t)minimumValue
{
  void *v2;
  int64_t v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (int64_t)maximumValue
{
  void *v2;
  int64_t v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (int64_t)stepValue
{
  void *v2;
  int64_t v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "longLongValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%lld..%lld]x%lld"), -[CAFInt64Range minimumValue](self, "minimumValue"), -[CAFInt64Range maximumValue](self, "maximumValue"), -[CAFInt64Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(int64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (int64_t)valueRoundedToNearestStepValue:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  int64_t v7;

  if (-[CAFInt64Range stepValue](self, "stepValue"))
  {
    v5 = a3 - -[CAFInt64Range minimumValue](self, "minimumValue");
    v6 = v5 / -[CAFInt64Range stepValue](self, "stepValue");
    v7 = -[CAFInt64Range minimumValue](self, "minimumValue");
    return v7 + -[CAFInt64Range stepValue](self, "stepValue") * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_250958668;
}

+ (id)maximum
{
  return &unk_250958680;
}

+ (id)step
{
  return &unk_250958698;
}

@end
