@implementation HKValueRange

+ (HKValueRange)valueRangeWithMinValue:(id)a3 maxValue:(id)a4
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = (_QWORD *)objc_opt_new();
  v8 = (void *)v7[1];
  v7[1] = v5;
  v9 = v5;

  v10 = (void *)v7[2];
  v7[2] = v6;

  return (HKValueRange *)v7;
}

- (id)minValue
{
  return self->_minValue;
}

- (id)maxValue
{
  return self->_maxValue;
}

- (BOOL)containsValue:(id)a3 exclusiveStart:(BOOL)a4 exclusiveEnd:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  id minValue;
  BOOL v11;
  BOOL IsLargerOrEqual;
  BOOL v13;
  id maxValue;
  BOOL v15;
  BOOL IsSmallerOrEqual;
  BOOL v17;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  v9 = v8;
  minValue = self->_minValue;
  if (minValue)
    v11 = !v6;
  else
    v11 = 0;
  if (v11)
    IsLargerOrEqual = HKUIObjectIsLargerOrEqual(v8, (uint64_t)minValue);
  else
    IsLargerOrEqual = HKUIObjectIsLarger(v8, (uint64_t)minValue);
  v13 = IsLargerOrEqual;
  maxValue = self->_maxValue;
  if (maxValue)
    v15 = !v5;
  else
    v15 = 0;
  if (v15)
    IsSmallerOrEqual = HKUIObjectIsSmallerOrEqual(v9, (uint64_t)maxValue);
  else
    IsSmallerOrEqual = HKUIObjectIsSmaller(v9, (uint64_t)maxValue);
  v17 = v13 && IsSmallerOrEqual;

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_maxValue, 0);
  objc_storeStrong(&self->_minValue, 0);
}

- (void)unionRange:(id)a3
{
  id v4;

  v4 = a3;
  -[HKValueRange unionMinValueWithRange:](self, "unionMinValueWithRange:", v4);
  -[HKValueRange unionMaxValueWithRange:](self, "unionMaxValueWithRange:", v4);

}

- (void)unionMinValueWithRange:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 IsSmaller;
  void *v7;
  id minValue;
  id v9;

  v9 = a3;
  -[HKValueRange minValue](self, "minValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v9, "minValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        IsSmaller = HKUIObjectIsSmaller(v5, (uint64_t)v4),
        v5,
        IsSmaller))
  {
    objc_msgSend(v9, "minValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    minValue = self->_minValue;
    self->_minValue = v7;

  }
}

- (void)unionMaxValueWithRange:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 IsLarger;
  void *v7;
  id maxValue;
  id v9;

  v9 = a3;
  -[HKValueRange maxValue](self, "maxValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4
    || (objc_msgSend(v9, "maxValue"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        IsLarger = HKUIObjectIsLarger(v5, (uint64_t)v4),
        v5,
        IsLarger))
  {
    objc_msgSend(v9, "maxValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    maxValue = self->_maxValue;
    self->_maxValue = v7;

  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;

  v4 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong(v4 + 1, self->_minValue);
  objc_storeStrong(v4 + 2, self->_maxValue);
  return v4;
}

- (NSDate)startDate
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[HKValueRange minValue](self, "minValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKValueRange minValue](self, "minValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (NSDate)endDate
{
  void *v3;
  char isKindOfClass;
  void *v5;

  -[HKValueRange maxValue](self, "maxValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[HKValueRange maxValue](self, "maxValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  return (NSDate *)v5;
}

- (BOOL)isEqual:(id)a3
{
  HKValueRange *v4;
  uint64_t v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (HKValueRange *)a3;
  v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    if (v4 == self)
    {
      v6 = 1;
    }
    else
    {
      -[HKValueRange minValue](self, "minValue");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueRange minValue](v4, "minValue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueRange maxValue](self, "maxValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKValueRange maxValue](v4, "maxValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7 == v8 || objc_msgSend(v7, "isEqual:", v8))
      {
        if (v9 == v10)
          v6 = 1;
        else
          v6 = objc_msgSend(v9, "isEqual:", v10);
      }
      else
      {
        v6 = 0;
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = objc_msgSend(self->_minValue, "hash");
  return objc_msgSend(self->_maxValue, "hash") ^ v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v7.receiver = self;
  v7.super_class = (Class)HKValueRange;
  -[HKValueRange description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ min=%@ max=%@"), v4, self->_minValue, self->_maxValue);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setMinValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)setMaxValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)hk_animatable
{
  return 1;
}

- (id)hk_midPointToValue:(id)a3 percentage:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  -[HKValueRange minValue](self, "minValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "minValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKValueRange maxValue](self, "maxValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "hk_midPointToValue:percentage:", v8, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "hk_midPointToValue:percentage:", v10, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end
