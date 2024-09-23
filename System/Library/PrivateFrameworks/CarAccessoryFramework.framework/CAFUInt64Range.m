@implementation CAFUInt64Range

- (unint64_t)minimumValue
{
  void *v2;
  unint64_t v3;

  -[CAFRange minimum](self, "minimum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (unint64_t)maximumValue
{
  void *v2;
  unint64_t v3;

  -[CAFRange maximum](self, "maximum");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (unint64_t)stepValue
{
  void *v2;
  unint64_t v3;

  -[CAFRange step](self, "step");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedLongLongValue");

  return v3;
}

- (id)rangeDescription
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("[%llu..%llu]x%llu"), -[CAFUInt64Range minimumValue](self, "minimumValue"), -[CAFUInt64Range maximumValue](self, "maximumValue"), -[CAFUInt64Range stepValue](self, "stepValue"));
}

- (BOOL)valueIsInRange:(unint64_t)a3
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[CAFRange isInRange:](self, "isInRange:", v4);

  return (char)self;
}

- (unint64_t)valueRoundedToNearestStepValue:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  if (-[CAFUInt64Range stepValue](self, "stepValue"))
  {
    v5 = a3 - -[CAFUInt64Range minimumValue](self, "minimumValue");
    v6 = v5 / -[CAFUInt64Range stepValue](self, "stepValue");
    v7 = -[CAFUInt64Range minimumValue](self, "minimumValue");
    return v7 + -[CAFUInt64Range stepValue](self, "stepValue") * v6;
  }
  return a3;
}

+ (id)minimum
{
  return &unk_2509586F8;
}

+ (id)maximum
{
  return &unk_250958710;
}

+ (id)step
{
  return &unk_250958728;
}

@end
