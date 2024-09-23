@implementation HFPercentFormatter

- (HFPercentFormatter)init
{
  return -[HFPercentFormatter initWithMinimumValue:maximumValue:](self, "initWithMinimumValue:maximumValue:", &unk_1EA7CC7C0, &unk_1EA7CC7D8);
}

- (HFPercentFormatter)initWithMinimumValue:(id)a3 maximumValue:(id)a4
{
  id v6;
  id v7;
  HFPercentFormatter *v8;
  HFPercentFormatter *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HFPercentFormatter;
  v8 = -[HFPercentFormatter init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[HFPercentFormatter setMinimumValue:](v8, "setMinimumValue:", v6);
    -[HFPercentFormatter setMaximumValue:](v9, "setMaximumValue:", v7);
    -[HFPercentFormatter setNumberStyle:](v9, "setNumberStyle:", 3);
    -[HFPercentFormatter setMaximumFractionDigits:](v9, "setMaximumFractionDigits:", 0);
  }

  return v9;
}

- (void)setMaximumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setMinimumValue:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)stringForObjectValue:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && -[HFPercentFormatter numberStyle](self, "numberStyle") == 3)
  {
    v5 = (void *)objc_opt_class();
    -[HFPercentFormatter minimumValue](self, "minimumValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFPercentFormatter maximumValue](self, "maximumValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_percentageFromValue:forMinimumValue:maximumValue:", v4, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v12.receiver = self;
    v12.super_class = (Class)HFPercentFormatter;
    -[HFPercentFormatter stringForObjectValue:](&v12, sel_stringForObjectValue_, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)HFPercentFormatter;
    -[HFPercentFormatter stringForObjectValue:](&v11, sel_stringForObjectValue_, v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (NSNumber)minimumValue
{
  return self->_minimumValue;
}

- (NSNumber)maximumValue
{
  return self->_maximumValue;
}

+ (id)_percentageFromValue:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "doubleValue");
  v11 = v10;
  objc_msgSend(v9, "doubleValue");
  v13 = v11 - v12;
  objc_msgSend(v8, "doubleValue");
  v15 = v14;

  objc_msgSend(v9, "doubleValue");
  v17 = v16;

  return (id)objc_msgSend(v7, "numberWithDouble:", v13 / (v15 - v17));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HFPercentFormatter;
  v4 = -[HFPercentFormatter copyWithZone:](&v8, sel_copyWithZone_, a3);
  -[HFPercentFormatter minimumValue](self, "minimumValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMinimumValue:", v5);

  -[HFPercentFormatter maximumValue](self, "maximumValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMaximumValue:", v6);

  return v4;
}

- (id)stringForRelativePercentValue:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  objc_msgSend(v4, "minimumValue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &unk_1EA7CC7C0;
  if (v5)
    v7 = (void *)v5;
  v8 = v7;

  objc_msgSend(v4, "maximumValue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = &unk_1EA7CC7D8;
  if (v9)
    v11 = (void *)v9;
  v12 = v11;

  v13 = (void *)objc_opt_class();
  objc_msgSend(v4, "value");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "_percentageFromValue:forMinimumValue:maximumValue:", v14, v8, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v18.receiver = self;
  v18.super_class = (Class)HFPercentFormatter;
  -[HFPercentFormatter stringForObjectValue:](&v18, sel_stringForObjectValue_, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)stringForNormalizedObjectValue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HFPercentFormatter;
  -[HFPercentFormatter stringForObjectValue:](&v4, sel_stringForObjectValue_, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)getObjectValue:(id *)a3 forString:(id)a4 range:(_NSRange *)a5 error:(id *)a6
{
  _BOOL4 v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HFPercentFormatter;
  v8 = -[HFPercentFormatter getObjectValue:forString:range:error:](&v14, sel_getObjectValue_forString_range_error_, a3, a4, a5, a6);
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_opt_class();
      v10 = *a3;
      -[HFPercentFormatter minimumValue](self, "minimumValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[HFPercentFormatter maximumValue](self, "maximumValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_valueFromPercentage:forMinimumValue:maximumValue:", v10, v11, v12);
      *a3 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(v8) = 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (NSString)unitDescription
{
  return (NSString *)_HFLocalizedStringWithDefaultValue(CFSTR("HFCharacteristicTriggerValueRangePickerUnitSuffix_Percent"), CFSTR("HFCharacteristicTriggerValueRangePickerUnitSuffix_Percent"), 1);
}

- (id)stringForObjectValue:(id)a3 withUnit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;

  v4 = a4;
  v6 = a3;
  if (v4)
  {
    -[HFPercentFormatter stringForObjectValue:](self, "stringForObjectValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)-[HFPercentFormatter copy](self, "copy");
    objc_msgSend(v8, "setNumberStyle:", 0);
    objc_msgSend(v8, "stringForObjectValue:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v8;
  }

  return v7;
}

+ (id)_valueFromPercentage:(id)a3 forMinimumValue:(id)a4 maximumValue:(id)a5
{
  void *v7;
  id v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "doubleValue");
  v11 = v10;
  objc_msgSend(v8, "doubleValue");
  v13 = v12;

  objc_msgSend(v9, "doubleValue");
  v15 = v13 - v14;
  objc_msgSend(v9, "doubleValue");
  v17 = v16;

  return (id)objc_msgSend(v7, "numberWithDouble:", v17 + v11 * v15);
}

@end
