@implementation HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a4 == 1)
      {
        -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _formattedCurrentValueForChartData:](self, "_formattedCurrentValueForChartData:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (a4)
        {
LABEL_11:

          goto LABEL_12;
        }
        -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _formattedAnnotationValueForChartData:](self, "_formattedAnnotationValueForChartData:", v8);
        v10 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v12.receiver = self;
      v12.super_class = (Class)HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter;
      -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v12, sel_formattedSelectedRangeLabelDataWithChartData_context_, v8, a4);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v10;
    goto LABEL_11;
  }
  v4 = (void *)MEMORY[0x1E0C9AA60];
LABEL_12:

  return v4;
}

- (id)_formattedAnnotationValueForChartData:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  HKSelectedRangeData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HKSleepApneaUtilities averageBreathingDisturbancesForChartData:](HKSleepApneaUtilities, "averageBreathingDisturbancesForChartData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _statisticsTypeForChartData:context:](self, "_statisticsTypeForChartData:context:", v4, 0);

  v7 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v6);
  HKAppleSleepingBreathingDisturbancesClassificationForQuantity();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _attributedBreathingDisturbancesClassification:](self, "_attributedBreathingDisturbancesClassification:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v7, "setAttributedString:", v9);

  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB6CD0], "countUnit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValueForUnit:", v11);
  objc_msgSend(v10, "numberWithDouble:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v7, "setValueAsNumber:", v12);

  v15[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)_formattedCurrentValueForChartData:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  HKSelectedRangeData *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[HKSleepApneaUtilities mostFrequentBreathingDisturbancesClassificationForChartData:](HKSleepApneaUtilities, "mostFrequentBreathingDisturbancesClassificationForChartData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _statisticsTypeForChartData:context:](self, "_statisticsTypeForChartData:context:", v4, 1);

  v7 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v6);
  -[HKAppleSleepingBreathingDisturbancesInteractiveChartFormatter _attributedBreathingDisturbancesClassification:](self, "_attributedBreathingDisturbancesClassification:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v7, "setAttributedString:", v8);

  -[HKSelectedRangeData setValueAsNumber:](v7, "setValueAsNumber:", 0);
  v11[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_attributedBreathingDisturbancesClassification:(id)a3
{
  id v4;
  HKDateCache *v5;
  void *v6;
  HKDateCache *v7;
  void *v8;
  void *v9;
  void *v10;
  _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *v11;
  _HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  v5 = [HKDateCache alloc];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKDateCache initWithCalendar:](v5, "initWithCalendar:", v6);

  -[HKInteractiveChartGenericStatFormatter chartRangeProvider](self, "chartRangeProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "effectiveVisibleRangeActive");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v11 = -[_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider initWithBreathingDisturbancesClassification:date:]([_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider alloc], "initWithBreathingDisturbancesClassification:date:", (int)objc_msgSend(v4, "intValue"), v10);
  else
    v11 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  v12 = v11;
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKAppleSleepingBreathingDisturbancesCurrentValueDataProvider attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:](v12, "attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:", v13, v14, v15, 0, v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (int64_t)_statisticsTypeForChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v5);
        v8 += objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "recordCount");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
    v11 = 25;
    if (v8 > 1)
      v11 = 28;
    v12 = 31;
    if (v8 > 1)
      v12 = 3;
  }
  else
  {
    v12 = 31;
    v11 = 25;
  }
  if (a4 == 1)
    v13 = v11;
  else
    v13 = v12;

  return v13;
}

@end
