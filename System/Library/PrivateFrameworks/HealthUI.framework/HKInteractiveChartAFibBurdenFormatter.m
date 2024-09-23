@implementation HKInteractiveChartAFibBurdenFormatter

- (HKInteractiveChartAFibBurdenFormatter)initWithStatisticsType:(int64_t)a3
{
  HKInteractiveChartAFibBurdenFormatter *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
  result = -[HKInteractiveChartAFibBurdenFormatter init](&v5, sel_init);
  if (result)
    result->_statisticsType = a3;
  return result;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  id v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  uint64_t v19;
  void *v20;
  objc_super v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v11)
      {
        v12 = v11;
        v13 = 0;
        v14 = *(_QWORD *)v24;
        v15 = -1.79769313e308;
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
            objc_msgSend(v17, "value");
            if (v15 < v18)
              v15 = v18;
            v13 |= objc_msgSend(v17, "clampsLowerData");
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v12);

        if ((v13 & 1) != 0)
        {
          -[HKInteractiveChartAFibBurdenFormatter _formattedDataWithLessThan:](self, "_formattedDataWithLessThan:", v15);
          v19 = objc_claimAutoreleasedReturnValue();
LABEL_17:
          v20 = (void *)v19;
          goto LABEL_20;
        }
      }
      else
      {

      }
      -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](self, "setOverrideStatFormatterItemOptions:", &unk_1E9CE9E18);
      v22.receiver = self;
      v22.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
      -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v22, sel_formattedSelectedRangeLabelDataWithChartData_context_, v10, a4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartAFibBurdenFormatter statisticsType](self, "statisticsType");
      goto LABEL_20;
    }
    v27.receiver = self;
    v27.super_class = (Class)HKInteractiveChartAFibBurdenFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v27, sel_formattedSelectedRangeLabelDataWithChartData_context_, v7, a4);
    v19 = objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v20 = (void *)MEMORY[0x1E0C9AA60];
LABEL_20:

  return v20;
}

- (id)_formattedDataWithLessThan:(double)a3
{
  void *v5;
  HKDateCache *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKAFibBurdenDataProviderCurrentValue *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  HKSelectedRangeData *v21;
  void *v22;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D48], "hk_gregorianCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFirstWeekday:", 2);
  v6 = -[HKDateCache initWithCalendar:]([HKDateCache alloc], "initWithCalendar:", v5);
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "adjustedValueForDaemonValue:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartGenericStatFormatter chartRangeProvider](self, "chartRangeProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "effectiveVisibleRangeActive");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endDate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[HKAFibBurdenDataProviderCurrentValue initWithMaxValue:date:]([HKAFibBurdenDataProviderCurrentValue alloc], "initWithMaxValue:date:", v10, v13);
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAFibBurdenDataProviderCurrentValue attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:](v14, "attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:", v15, v16, v17, v18, v6);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3 <= 0.02)
    v20 = 0;
  else
    v20 = 9;
  v21 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v20);
  -[HKSelectedRangeData setValueAsNumber:](v21, "setValueAsNumber:", 0);
  -[HKSelectedRangeData setAttributedString:](v21, "setAttributedString:", v19);
  v24[0] = v21;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (int64_t)statisticsType
{
  return self->_statisticsType;
}

- (void)setStatisticsType:(int64_t)a3
{
  self->_statisticsType = a3;
}

@end
