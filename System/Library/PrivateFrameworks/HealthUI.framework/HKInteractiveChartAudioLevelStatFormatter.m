@implementation HKInteractiveChartAudioLevelStatFormatter

- (id)initForDisplayType:(id)a3 timeScope:(int64_t)a4
{
  id v6;
  HKInteractiveChartAudioLevelStatFormatter *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HKInteractiveChartAudioLevelStatFormatter;
  v7 = -[HKInteractiveChartAudioLevelStatFormatter init](&v15, sel_init);
  if (v7)
  {
    objc_msgSend(v6, "chartingRules");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "chartStyleForTimeScope:", a4) == 3)
    {

    }
    else
    {
      objc_msgSend(v6, "chartingRules");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "chartStyleForTimeScope:", a4);

      if (v10 != 9)
      {
        objc_msgSend(v6, "objectType");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "aggregationStyle");

        if (v13)
          v11 = &unk_1E9CE9D70;
        else
          v11 = &unk_1E9CE9D58;
        goto LABEL_9;
      }
    }
    v11 = &unk_1E9CE9D40;
LABEL_9:
    -[HKInteractiveChartGenericStatFormatter setOverrideStatFormatterItemOptions:](v7, "setOverrideStatFormatterItemOptions:", v11);
  }

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  uint64_t v10;
  void *v11;
  char v12;
  objc_super v14;

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
      -[HKInteractiveChartAudioLevelStatFormatter _formatQuantityAudioData:](self, "_formatQuantityAudioData:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v11 = (void *)v10;
      goto LABEL_13;
    }
    objc_msgSend(v7, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v12 = objc_opt_isKindOfClass();

    if ((v12 & 1) == 0)
    {
      v14.receiver = self;
      v14.super_class = (Class)HKInteractiveChartAudioLevelStatFormatter;
      -[HKInteractiveChartGenericStatFormatter formattedSelectedRangeLabelDataWithChartData:context:](&v14, sel_formattedSelectedRangeLabelDataWithChartData_context_, v7, a4);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (!-[HKInteractiveChartAudioLevelStatFormatter showsClassificationInCurrentValueView](self, "showsClassificationInCurrentValueView"))goto LABEL_10;
    if (a4 == 1)
    {
      -[HKInteractiveChartAudioLevelStatFormatter _formattedCurrentValueForChartData:](self, "_formattedCurrentValueForChartData:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    if (!a4)
    {
LABEL_10:
      -[HKInteractiveChartGenericStatFormatter _formattedAnnotationForDistributionChartData:](self, "_formattedAnnotationForDistributionChartData:", v7);
      v10 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }
LABEL_13:

  return v11;
}

- (id)_formattedCurrentValueForChartData:(id)a3
{
  id v4;
  HKSelectedRangeData *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 4);
  -[HKInteractiveChartAudioLevelStatFormatter _attributedCurrentAudioExposureClassificationForChartData:](self, "_attributedCurrentAudioExposureClassificationForChartData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKSelectedRangeData setAttributedString:](v5, "setAttributedString:", v6);
  -[HKSelectedRangeData setValueAsNumber:](v5, "setValueAsNumber:", 0);
  v9[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_attributedCurrentAudioExposureClassificationForChartData:(id)a3
{
  id v4;
  HKDateCache *v5;
  void *v6;
  HKDateCache *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  void *v13;
  void *v14;
  HKAudioExposureDataProviderCurrentValue *v15;
  HKAudioExposureDataProviderCurrentValue *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[5];
  uint64_t v23;
  double *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a3;
  v5 = [HKDateCache alloc];
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HKDateCache initWithCalendar:](v5, "initWithCalendar:", v6);

  objc_msgSend(v4, "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "endDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartGenericStatFormatter chartRangeProvider](self, "chartRangeProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "effectiveVisibleRangeActive");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[HKInteractiveChartAudioLevelStatFormatter _numberOfDaysVisibleInRange:](self, "_numberOfDaysVisibleInRange:", v11);

  v23 = 0;
  v24 = (double *)&v23;
  v25 = 0x2020000000;
  v26 = 0;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __103__HKInteractiveChartAudioLevelStatFormatter__attributedCurrentAudioExposureClassificationForChartData___block_invoke;
  v22[3] = &unk_1E9C41368;
  v22[4] = &v23;
  objc_msgSend(v4, "hk_map:", v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB62F8], "computeLEQFromAudioExposureValues:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [HKAudioExposureDataProviderCurrentValue alloc];
  v16 = -[HKAudioExposureDataProviderCurrentValue initWithLEQQuantity:secondsListened:daysAggregated:date:](v15, "initWithLEQQuantity:secondsListened:daysAggregated:date:", v14, v12, v9, v24[3]);
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKAudioExposureDataProviderCurrentValue attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:](v16, "attributedStringWithDisplayType:unitController:valueFont:unitFont:dateCache:", v17, v18, v19, 0, v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v23, 8);
  return v20;
}

id __103__HKInteractiveChartAudioLevelStatFormatter__attributedCurrentAudioExposureClassificationForChartData___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v3 = a2;
  objc_msgSend(v3, "duration");
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v4
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  v5 = objc_alloc(MEMORY[0x1E0CB6300]);
  objc_msgSend(v3, "averageValue");
  v7 = v6;
  objc_msgSend(v3, "duration");
  v9 = v8;

  return (id)objc_msgSend(v5, "initWithValue:duration:", v7, v9);
}

- (id)_majorAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_minorAttributes
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v2;
  v6[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  _QWORD v31[3];
  uint64_t v32;
  _QWORD v33[2];

  v5 = a5;
  v33[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "presentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "adjustedValueForDaemonValue:", v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = v10;
  }

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitStringFromUnit:number:](self, "unitStringFromUnit:number:", v9, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartDataFormatter valueStringFromNumber:](self, "valueStringFromNumber:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  -[HKInteractiveChartAudioLevelStatFormatter _majorAttributes](self, "_majorAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithString:attributes:", v17, v19);

  if (v5 && objc_msgSend(v16, "length"))
  {
    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    v32 = *MEMORY[0x1E0DC1138];
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v33, &v32, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v21, "initWithString:attributes:", CFSTR(" "), v23);

    v25 = objc_alloc(MEMORY[0x1E0CB3498]);
    -[HKInteractiveChartAudioLevelStatFormatter _minorAttributes](self, "_minorAttributes");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v25, "initWithString:attributes:", v16, v26);

    v31[0] = v20;
    v31[1] = v24;
    v31[2] = v27;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsForLocale(v28);
    v29 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29 = v20;
  }

  return v29;
}

- (int64_t)_numberOfDaysVisibleInRange:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;

  v3 = a3;
  objc_msgSend(v3, "startDate");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4
    && (v5 = (void *)v4,
        objc_msgSend(v3, "endDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        v6))
  {
    objc_msgSend(v3, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "components:fromDate:toDate:options:", 16, v7, v8, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v10, "day") < 1)
      v11 = 1;
    else
      v11 = objc_msgSend(v10, "day");

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_formatQuantityAudioData:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  HKSelectedRangeData *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  int64_t v38;
  void *v39;
  void *v40;
  void *v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[2];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB6CD0], "decibelAWeightedSoundPressureLevelUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  objc_msgSend(v4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 < 2)
  {
    objc_msgSend(v7, "overviewData");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v8, "overviewData");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "averageLEQ");
      v25 = v24;

    }
    else
    {
      objc_msgSend(v8, "averageLEQ");
      v25 = v28;
    }

    objc_msgSend(v8, "overviewData");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v8, "overviewData");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "duration");
      v32 = v31;

    }
    else
    {
      objc_msgSend(v8, "duration");
      v32 = v33;
    }

    -[HKInteractiveChartGenericStatFormatter overrideStatFormatterItemOptions](self, "overrideStatFormatterItemOptions");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "count");

    if (v35 == 1)
    {
      -[HKInteractiveChartGenericStatFormatter overrideStatFormatterItemOptions](self, "overrideStatFormatterItemOptions");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "firstObject");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = +[HKInteractiveChartGenericStatFormatter mapSingleItemToStatisticsType:](HKInteractiveChartAudioLevelStatFormatter, "mapSingleItemToStatisticsType:", v37);

    }
    else
    {
      v38 = 4;
    }
    v26 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v38);
    -[HKInteractiveChartAudioLevelStatFormatter _formattedStringWithValue:unit:showUnit:](self, "_formattedStringWithValue:unit:showUnit:", v5, 1, v25);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v26, "setAttributedString:", v39);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setValueAsNumber:](v26, "setValueAsNumber:", v40);

    -[HKInteractiveChartAudioLevelStatFormatter _formatDuration:](self, "_formatDuration:", v32);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v7, "averageLEQ");
    v10 = v9;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v11 = v4;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v44;
      v15 = 0.0;
      v16 = v10;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v11);
          v18 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v18, "averageLEQ", (_QWORD)v43);
          if (v16 >= v19)
            v16 = v19;
          objc_msgSend(v18, "averageLEQ");
          if (v10 < v20)
            v10 = v20;
          objc_msgSend(v18, "duration");
          v15 = v15 + v21;
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v48, 16);
      }
      while (v13);
    }
    else
    {
      v15 = 0.0;
      v16 = v10;
    }

    -[HKInteractiveChartGenericStatFormatter _formatMin:max:unit:](self, "_formatMin:max:unit:", v5, v16, v10);
    v26 = (HKSelectedRangeData *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartAudioLevelStatFormatter _formatDuration:](self, "_formatDuration:", v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v47[0] = v26;
  v47[1] = v27;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2, (_QWORD)v43);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  return v41;
}

- (id)_formatDuration:(double)a3
{
  HKSelectedRangeData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 10);
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HKTimePeriodStringWithFonts(v6, v7, v8, 0x14uLL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v5, "setAttributedString:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v5, "setValueAsNumber:", v10);

  return v5;
}

- (BOOL)showsClassificationInCurrentValueView
{
  return self->_showsClassificationInCurrentValueView;
}

- (void)setShowsClassificationInCurrentValueView:(BOOL)a3
{
  self->_showsClassificationInCurrentValueView = a3;
}

@end
