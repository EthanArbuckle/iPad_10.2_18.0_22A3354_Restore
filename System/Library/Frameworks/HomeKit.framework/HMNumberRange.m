@implementation HMNumberRange

+ (HMNumberRange)numberRangeWithMaxValue:(NSNumber *)maxValue
{
  NSNumber *v3;
  HMNumberRange *v4;

  v3 = maxValue;
  v4 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", 0, v3);

  return v4;
}

+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue
{
  NSNumber *v3;
  HMNumberRange *v4;

  v3 = minValue;
  v4 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", v3, 0);

  return v4;
}

- (HMNumberRange)initWithMinValue:(id)a3 maxValue:(id)a4
{
  id v7;
  id v8;
  HMNumberRange *v9;
  HMNumberRange *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMNumberRange;
  v9 = -[HMNumberRange init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_minValue, a3);
    objc_storeStrong((id *)&v10->_maxValue, a4);
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[HMNumberRange minValue](self, "minValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[HMNumberRange maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  HMNumberRange *v4;
  HMNumberRange *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;

  v4 = (HMNumberRange *)a3;
  if (v4 == self)
  {
    v11 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[HMNumberRange minValue](self, "minValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMNumberRange minValue](v5, "minValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = HMFEqualObjects();

      if (v8)
      {
        -[HMNumberRange maxValue](self, "maxValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMNumberRange maxValue](v5, "maxValue");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = HMFEqualObjects();

      }
      else
      {
        v11 = 0;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMNumberRange minValue](self, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMNumberRange maxValue](self, "maxValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMNumberRange: min: %@, max: %@>"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSNumber)minValue
{
  return self->_minValue;
}

- (NSNumber)maxValue
{
  return self->_maxValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxValue, 0);
  objc_storeStrong((id *)&self->_minValue, 0);
}

+ (HMNumberRange)numberRangeWithMinValue:(NSNumber *)minValue maxValue:(NSNumber *)maxValue
{
  NSNumber *v5;
  NSNumber *v6;
  HMNumberRange *v7;

  v5 = maxValue;
  v6 = minValue;
  v7 = -[HMNumberRange initWithMinValue:maxValue:]([HMNumberRange alloc], "initWithMinValue:maxValue:", v6, v5);

  return v7;
}

@end
