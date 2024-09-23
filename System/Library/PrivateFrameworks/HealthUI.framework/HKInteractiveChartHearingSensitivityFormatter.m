@implementation HKInteractiveChartHearingSensitivityFormatter

- (HKInteractiveChartHearingSensitivityFormatter)initWithUnitController:(id)a3
{
  id v4;
  HKInteractiveChartHearingSensitivityFormatter *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKInteractiveChartHearingSensitivityFormatter;
  v5 = -[HKInteractiveChartHearingSensitivityFormatter init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter setMajorFont:](v5, "setMajorFont:", v6);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueKindFont");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter setMinorFont:](v5, "setMinorFont:", v7);

    -[HKInteractiveChartDataFormatter setUnitController:](v5, "setUnitController:", v4);
    -[HKInteractiveChartDataFormatter setDisplayType:](v5, "setDisplayType:", 0);
  }

  return v5;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v5);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = v12;
          v14 = objc_msgSend(v13, "isLeftEar");
          if (v14)
            v15 = v9;
          else
            v15 = v8;
          if (v14)
            v9 = v13;
          else
            v8 = v13;

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v9 = 0;
  }
  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKInteractiveChartHearingSensitivityFormatter _selectedRangeDataForSensitivityData:isLeftEar:](self, "_selectedRangeDataForSensitivityData:isLeftEar:", v9, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_addNonNilObject:", v17);

  -[HKInteractiveChartHearingSensitivityFormatter _selectedRangeDataForSensitivityData:isLeftEar:](self, "_selectedRangeDataForSensitivityData:isLeftEar:", v8, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hk_addNonNilObject:", v18);

  return v16;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedDisplayNameForUnit:value:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)valueStringFromNumber:(id)a3
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a3, "doubleValue");
  objc_msgSend(v3, "numberWithDouble:", HKRoundWithPositiveZeroForDoubleValue(v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKIntegerFormatter();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringFromNumber:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_selectedRangeDataForSensitivityData:(id)a3 isLeftEar:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;
  void *v8;
  HKSelectedRangeData *v9;
  HKSelectedRangeData *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;

  if (a3)
  {
    v4 = a4;
    v6 = (void *)MEMORY[0x1E0CB6CD0];
    v7 = a3;
    objc_msgSend(v6, "decibelHearingLevelUnit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    v10 = v9;
    if (v4)
      v11 = 7;
    else
      v11 = 8;
    -[HKSelectedRangeData setDataType:](v9, "setDataType:", v11);
    objc_msgSend(v7, "sensitivityDBHL");
    -[HKInteractiveChartDataFormatter attributedStringWithValue:unit:showUnit:](self, "attributedStringWithValue:unit:showUnit:", v8, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v10, "setAttributedString:", v12);

    v13 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v7, "sensitivityDBHL");
    v15 = v14;

    objc_msgSend(v13, "numberWithDouble:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setValueAsNumber:](v10, "setValueAsNumber:", v16);

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_formattedFrequencyValue:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;

  HKNumberFormatterWithDecimalPrecision(5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 / 1000.0 >= 1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3 / 1000.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("KILOHERTZ_NUMBERLESS_UNIT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringFromNumber:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("HERTZ_NUMBERLESS_UNIT");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormatValueAndUnit(v6, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
