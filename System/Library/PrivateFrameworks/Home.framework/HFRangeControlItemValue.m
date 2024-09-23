@implementation HFRangeControlItemValue

- (void)setTargetValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (void)setMinimumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setMaximumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (HFNumberRange)numberRange
{
  void *v2;
  unint64_t v4;
  void *v5;
  void *v6;

  v4 = -[HFRangeControlItemValue mode](self, "mode");
  if (v4 < 2)
  {
    -[HFRangeControlItemValue targetValue](self, "targetValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange valueWithValue:](HFNumberRange, "valueWithValue:", v5);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    return (HFNumberRange *)v2;
  }
  if (v4 == 2)
  {
    -[HFRangeControlItemValue maximumValue](self, "maximumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFRangeControlItemValue minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFNumberRange rangeWithMaxValue:minValue:](HFNumberRange, "rangeWithMaxValue:minValue:", v5, v6);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  return (HFNumberRange *)v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  unint64_t v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  char v21;

  v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    v6 = -[HFRangeControlItemValue mode](self, "mode");
    if (v6 == objc_msgSend(v5, "mode"))
    {
      if (-[HFRangeControlItemValue mode](self, "mode") == 1 || !-[HFRangeControlItemValue mode](self, "mode"))
      {
        -[HFRangeControlItemValue targetValue](self, "targetValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "targetValue");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v8;
        v11 = v9;
        if (v10 == v11)
        {
          v7 = 1;
        }
        else if (v10)
        {
          v7 = objc_msgSend(v10, "isEqual:", v11);
        }
        else
        {
          v7 = 0;
        }

      }
      else
      {
        v7 = 1;
      }
      if (-[HFRangeControlItemValue mode](self, "mode") == 2 || !-[HFRangeControlItemValue mode](self, "mode"))
      {
        -[HFRangeControlItemValue minimumValue](self, "minimumValue");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "minimumValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v12;
        v15 = v13;
        if (v14 == v15)
        {
          v16 = 1;
        }
        else if (v14)
        {
          v16 = objc_msgSend(v14, "isEqual:", v15);
        }
        else
        {
          v16 = 0;
        }

        -[HFRangeControlItemValue maximumValue](self, "maximumValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "maximumValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17;
        v20 = v18;
        if (v19 == v20)
        {
          v21 = 1;
        }
        else if (v19)
        {
          v21 = objc_msgSend(v19, "isEqual:", v20);
        }
        else
        {
          v21 = 0;
        }

        v7 &= v21 & v16;
      }
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)mode
{
  return self->_mode;
}

- (NSNumber)targetValue
{
  NSNumber *targetValue;
  NSNumber *v3;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;

  targetValue = self->_targetValue;
  if (targetValue)
  {
    v3 = targetValue;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB37E8];
    -[HFRangeControlItemValue minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;
    -[HFRangeControlItemValue maximumValue](self, "maximumValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    objc_msgSend(v5, "numberWithDouble:", (v8 + v10) * 0.5);
    v3 = (NSNumber *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

+ (id)thresholdValueWithMinimumValue:(id)a3 maximumValue:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v7, "setMode:", 2);
  objc_msgSend(v7, "setMinimumValue:", v6);

  objc_msgSend(v7, "setMaximumValue:", v5);
  return v7;
}

+ (id)targetValueWithValue:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setMode:", 1);
  objc_msgSend(v4, "setTargetValue:", v3);

  return v4;
}

- (unint64_t)hash
{
  unint64_t v2;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = -[HFRangeControlItemValue mode](self, "mode");
  if (v4 < 2)
  {
    -[HFRangeControlItemValue targetValue](self, "targetValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v5, "hash");
LABEL_5:

    return v2;
  }
  if (v4 == 2)
  {
    -[HFRangeControlItemValue minimumValue](self, "minimumValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hash");
    -[HFRangeControlItemValue maximumValue](self, "maximumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v7, "hash") ^ v6;

    goto LABEL_5;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HFRangeControlItemValue targetValue](self, "targetValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRangeControlItemValue minimumValue](self, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HFRangeControlItemValue maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, min %@ max %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

@end
