@implementation HKInteractiveChartCardioFitnessFormatter

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  void *v4;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v7 = a3;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "count"))
  {
    if (a4 == 1)
    {
      -[HKInteractiveChartCardioFitnessFormatter _formattedCurrentValueForChartData:context:](self, "_formattedCurrentValueForChartData:context:", v8, 1);
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    }
    if (!a4)
    {
      v11.receiver = self;
      v11.super_class = (Class)HKInteractiveChartCardioFitnessFormatter;
      -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v11, sel_formattedSelectedRangeLabelDataWithChartData_context_, v8, 0);
      v9 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = (void *)v9;
    }
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v4;
}

- (id)_formattedCurrentValueForChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  HKSelectedRangeData *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  HKSelectedRangeData *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v20 != v12)
            objc_enumerationMutation(v8);
          v11 += objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * i), "sampleCount", (_QWORD)v19);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      }
      while (v10);

      if (v11 <= 1)
        v14 = 22;
      else
        v14 = 23;
    }
    else
    {

      v14 = 22;
    }
    v16 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v14);
    -[HKInteractiveChartCardioFitnessFormatter _attributedCurrentCardioFitnessClassificationForChartData:](self, "_attributedCurrentCardioFitnessClassificationForChartData:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v16, "setAttributedString:", v17);

    -[HKSelectedRangeData setValueAsNumber:](v16, "setValueAsNumber:", 0);
    v24 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)HKInteractiveChartCardioFitnessFormatter;
    -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v23, sel_formattedSelectedRangeLabelDataWithChartData_context_, v6, a4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_attributedCurrentCardioFitnessClassificationForChartData:(id)a3
{
  id v4;
  HKDateCache *v5;
  void *v6;
  HKDateCache *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HKCardioFitnessDataProviderCurrentValue *v12;
  void *v13;
  HKDataProviderNoDataCurrentValue *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

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

  +[HKCardioFitnessUtilities cardioFitnessLookupPropertiesForChartData:](HKCardioFitnessUtilities, "cardioFitnessLookupPropertiesForChartData:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [HKCardioFitnessDataProviderCurrentValue alloc];
    objc_msgSend(v11, "vo2MaxQuantity");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[HKCardioFitnessDataProviderCurrentValue initWithVO2MaxQuantity:biologicalSex:age:date:](v12, "initWithVO2MaxQuantity:biologicalSex:age:date:", v13, objc_msgSend(v11, "biologicalSex"), objc_msgSend(v11, "age"), v10);

  }
  else
  {
    v14 = objc_alloc_init(HKDataProviderNoDataCurrentValue);
  }
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKDataProviderNoDataCurrentValue attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:](v14, "attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:", v15, v16, v17, 0, v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

@end
