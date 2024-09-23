@implementation HKUIDateLabel

- (HKUIDateLabel)init
{
  HKUIDateLabel *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKUIDateLabel;
  result = -[HKUIDateLabel init](&v3, sel_init);
  if (result)
    result->_useUppercase = 1;
  return result;
}

- (void)setDate:(id)a3 formatTemplate:(int64_t)a4
{
  uint64_t v6;
  id v7;

  if (a3)
  {
    +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", a3, a3);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (id)v6;
  -[HKUIDateLabel setDateRange:formatTemplate:](self, "setDateRange:formatTemplate:", v6, a4);

}

- (void)setDateRange:(id)a3 formatTemplate:(int64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  if (-[HKUIDateLabel _setDateRange:](self, "_setDateRange:"))
  {
    +[HKUIDateLabel dateStringForDateRange:formatTemplate:useUppercase:](HKUIDateLabel, "dateStringForDateRange:formatTemplate:useUppercase:", v7, a4, self->_useUppercase);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKUIDateLabel setText:](self, "setText:", v6);

  }
}

- (BOOL)_setDateRange:(id)a3
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (v5 && -[HKValueRange isEqual:](self->_dateRange, "isEqual:", v5))
  {
    v6 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_dateRange, a3);
    v6 = 1;
  }

  return v6;
}

+ (id)dateStringForDateRange:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = a5;
  v7 = a3;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "minValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "maxValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    objc_msgSend(v8, "minValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HKUIDateLabel _formattedTextFromDate:formatTemplate:useUppercase:](HKUIDateLabel, "_formattedTextFromDate:formatTemplate:useUppercase:", v12, a4, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((v11 & 1) == 0)
    {
      objc_msgSend(v8, "maxValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HKUIDateLabel _formattedTextFromDate:formatTemplate:useUppercase:](HKUIDateLabel, "_formattedTextFromDate:formatTemplate:useUppercase:", v14, a4, v5);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("DATE_RANGE %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "stringWithFormat:", v18, v13, v15);
      v19 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v19;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_formattedTextFromDate:(id)a3 formatTemplate:(int64_t)a4 useUppercase:(BOOL)a5
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  if (a3)
  {
    HKLocalizedStringForDateAndTemplate(a3, a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uppercaseStringWithLocale:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = v6;
      v9 = v7;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", 0, a4, a5);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKUIDateLabel.m"), 67, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("date != nil"));
    v9 = 0;
  }

  return v9;
}

- (HKValueRange)dateRange
{
  return self->_dateRange;
}

- (BOOL)useUppercase
{
  return self->_useUppercase;
}

- (void)setUseUppercase:(BOOL)a3
{
  self->_useUppercase = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRange, 0);
}

@end
