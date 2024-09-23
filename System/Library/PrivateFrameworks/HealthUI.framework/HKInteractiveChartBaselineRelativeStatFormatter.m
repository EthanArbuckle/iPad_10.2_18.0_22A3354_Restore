@implementation HKInteractiveChartBaselineRelativeStatFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  objc_super v13;
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "hk_filter:", &__block_literal_global_33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v13.receiver = self;
    v13.super_class = (Class)HKInteractiveChartBaselineRelativeStatFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v13, sel_formattedSelectedRangeLabelDataWithChartData_context_, v7, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "hk_containsObjectPassingTest:", &__block_literal_global_184))
    {
      -[HKInteractiveChartBaselineRelativeStatFormatter _establishingBaselineSelectedRangeData](self, "_establishingBaselineSelectedRangeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = v9;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = (void **)v15;
    }
    else
    {
      -[HKInteractiveChartBaselineRelativeStatFormatter _unavailableSelectedRangeData](self, "_unavailableSelectedRangeData");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v9;
      v10 = (void *)MEMORY[0x1E0C99D20];
      v11 = &v14;
    }
    objc_msgSend(v10, "arrayWithObjects:count:", v11, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

BOOL __104__HKInteractiveChartBaselineRelativeStatFormatter_formattedSelectedRangeLabelDataWithChartData_context___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "relativeValueState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") == 3;

  return v3;
}

BOOL __104__HKInteractiveChartBaselineRelativeStatFormatter_formattedSelectedRangeLabelDataWithChartData_context___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "relativeValueState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue") == 2;

  return v3;
}

- (id)_establishingBaselineSelectedRangeData
{
  HKSelectedRangeData *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
  -[HKSelectedRangeData setDataType:](v3, "setDataType:", 0);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ESTABLISHING_BASELINE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, v9);
  -[HKSelectedRangeData setAttributedString:](v3, "setAttributedString:", v10);

  return v3;
}

- (id)_unavailableSelectedRangeData
{
  HKSelectedRangeData *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v3 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
  -[HKSelectedRangeData setDataType:](v3, "setDataType:", 0);
  v4 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("NOT_ENOUGH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v12[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithString:attributes:", v6, v9);
  -[HKSelectedRangeData setAttributedString:](v3, "setAttributedString:", v10);

  return v3;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HKRelativeNumberFormatter *v7;
  void *v8;

  v4 = a3;
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(HKRelativeNumberFormatter);
  HKFormattedStringFromValue(v4, v5, v6, 0, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedDisplayNameForDisplayType:value:", v7, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("%@_DEGREES_FROM_BASELINE_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v11, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
