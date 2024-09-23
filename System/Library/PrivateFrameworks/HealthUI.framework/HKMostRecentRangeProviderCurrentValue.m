@implementation HKMostRecentRangeProviderCurrentValue

- (HKMostRecentRangeProviderCurrentValue)initWithMinimumValue:(id)a3 maximumValue:(id)a4 date:(id)a5
{
  id v9;
  id v10;
  id v11;
  HKMostRecentRangeProviderCurrentValue *v12;
  HKMostRecentRangeProviderCurrentValue *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HKMostRecentRangeProviderCurrentValue;
  v12 = -[HKMostRecentRangeProviderCurrentValue init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_date, a5);
    v13->_isSingleValue = 0;
    objc_storeStrong((id *)&v13->_minimumValue, a3);
    objc_storeStrong((id *)&v13->_maximumValue, a4);
  }

  return v13;
}

- (id)attributedStringWithDisplayType:(id)a3 unitController:(id)a4 valueFont:(id)a5 unitFont:(id)a6 dateCache:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  HKInteractiveChartNumberRangeFormatter *v24;
  void *v25;
  uint64_t v27;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v13, "unitForDisplayType:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity doubleValueForUnit:](self->_minimumValue, "doubleValueForUnit:", v15);
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "adjustedValueForDaemonValue:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "presentation");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB37E8];
  -[HKQuantity doubleValueForUnit:](self->_maximumValue, "doubleValueForUnit:", v15);
  objc_msgSend(v21, "numberWithDouble:");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "adjustedValueForDaemonValue:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(HKInteractiveChartNumberRangeFormatter);
  LOBYTE(v27) = 1;
  -[HKInteractiveChartNumberRangeFormatter attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:resultIsSingleValue:](v24, "attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:resultIsSingleValue:", v19, v23, v14, v13, v12, v11, v27, &self->_isSingleValue);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)attributedSupplementaryStringWithDisplayType:(id)a3 unitController:(id)a4 font:(id)a5
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;

  if (self->_isSingleValue)
  {
    v5 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0CB34D0];
    v7 = a5;
    objc_msgSend(v6, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("RANGE_ABBREVIATED"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKAttributedStringAttributesForFont(v7, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = (void *)objc_msgSend(v10, "initWithString:attributes:", v9, v12);
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);
  objc_storeStrong((id *)&self->_minimumValue, 0);
}

@end
