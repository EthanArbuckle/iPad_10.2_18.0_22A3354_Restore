@implementation HKInteractiveChartBloodGlucosePercentInRangeFormatter

- (HKInteractiveChartBloodGlucosePercentInRangeFormatter)init
{
  HKInteractiveChartBloodGlucosePercentInRangeFormatter *v2;
  void *v3;
  uint64_t v4;
  NSNumberFormatter *percentageFormatter;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HKInteractiveChartBloodGlucosePercentInRangeFormatter;
  v2 = -[HKInteractiveChartBloodGlucosePercentInRangeFormatter init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37F0], "hk_percentDecimalNumberFormatter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    percentageFormatter = v2->_percentageFormatter;
    v2->_percentageFormatter = (NSNumberFormatter *)v4;

  }
  return v2;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  HKSelectedRangeData *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  int64_t v41;
  HKSelectedRangeData *v42;
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[2];
  uint64_t v46;
  uint64_t v47;
  _QWORD v48[3];

  v48[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    if (a4 == 1)
    {
      -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _overallFractionInEuglycemiaForChartData:](self, "_overallFractionInEuglycemiaForChartData:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v8
        || (-[HKInteractiveChartBloodGlucosePercentInRangeFormatter _stringFromFraction:](self, "_stringFromFraction:", v8), (v9 = (id)objc_claimAutoreleasedReturnValue()) == 0))
      {
LABEL_6:
        v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_13:

        goto LABEL_14;
      }
    }
    else
    {
      -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _rangeOfFractionInHighlightedClassificationForChartData:](self, "_rangeOfFractionInHighlightedClassificationForChartData:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "minValue");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _stringFromFraction:](self, "_stringFromFraction:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "maxValue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _stringFromFraction:](self, "_stringFromFraction:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v13, "isEqualToString:", v15) & 1) != 0)
      {
        objc_msgSend(v11, "minValue");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v13;
      }
      else
      {
        v16 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "stringWithFormat:", v18, v13, v15);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        v8 = 0;
      }

      if (!v9)
        goto LABEL_6;
    }
    -[HKInteractiveChartDataFormatter unitController](self, "unitController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedDisplayNameForUnit:value:", v20, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = objc_alloc(MEMORY[0x1E0CB3498]);
    v41 = a4;
    v22 = v8;
    v46 = *MEMORY[0x1E0DC1138];
    v23 = v46;
    -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v48[0] = v24;
    v47 = *MEMORY[0x1E0DC1140];
    v25 = v47;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v48[1] = v26;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v48, &v46, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v21, "initWithString:attributes:", v9, v27);

    v29 = objc_alloc(MEMORY[0x1E0CB3498]);
    v44[0] = v23;
    v8 = v22;
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v25;
    v45[0] = v30;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v31;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 2);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v29, "initWithString:attributes:", v40, v32);

    v34 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    -[HKSelectedRangeData setDataType:](v34, "setDataType:", -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _selectedRangeDataTypeForContext:](self, "_selectedRangeDataTypeForContext:", v41));
    v43[0] = v28;
    v43[1] = v33;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsWithFormat(v35, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v34, "setAttributedString:", v38);

    -[HKSelectedRangeData setValueAsNumber:](v34, "setValueAsNumber:", v8);
    v42 = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_13;
  }
  v10 = (void *)MEMORY[0x1E0C9AA60];
LABEL_14:

  return v10;
}

- (id)_overallFractionInEuglycemiaForChartData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        v6 += objc_msgSend(v9, "countForClassification:", 2);
        v5 += objc_msgSend(v9, "totalCount");
      }
      v4 = (void *)objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v6 / (double)v5);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }

  return v4;
}

- (id)_rangeOfFractionInHighlightedClassificationForChartData:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        -[HKInteractiveChartBloodGlucosePercentInRangeFormatter _fractionForHighlightedClassificationFromDataPoint:](self, "_fractionForHighlightedClassificationFromDataPoint:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        if (v11 < v8)
          v8 = v11;
        if (v11 > v9)
          v9 = v11;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1.79769313e308;
    v9 = 2.22507386e-308;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (double)_fractionForHighlightedClassificationFromDataPoint:(id)a3
{
  double v3;
  id v5;
  void *v6;
  int64_t highlightedClassification;
  double v9;
  double v10;
  double v11;
  double v12;

  v5 = a3;
  v6 = v5;
  highlightedClassification = self->_highlightedClassification;
  if ((unint64_t)(highlightedClassification - 2) < 2 || highlightedClassification == 0)
  {
    objc_msgSend(v5, "fractionForClassification:");
    v3 = v9;
  }
  else if (highlightedClassification == 1)
  {
    objc_msgSend(v5, "fractionForClassification:");
    v11 = v10;
    objc_msgSend(v6, "fractionForClassification:", 0);
    v3 = v11 + v12;
  }

  return v3;
}

- (id)_stringFromFraction:(id)a3
{
  id v4;
  double v5;
  double v6;
  _BOOL8 v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "doubleValue");
  v7 = 0;
  if (v5 > 0.0)
  {
    objc_msgSend(v4, "doubleValue");
    if (v6 < 0.01)
      v7 = 1;
  }
  -[NSNumberFormatter setMaximumFractionDigits:](self->_percentageFormatter, "setMaximumFractionDigits:", v7);
  -[NSNumberFormatter stringFromNumber:](self->_percentageFormatter, "stringFromNumber:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)_selectedRangeDataTypeForContext:(int64_t)a3
{
  int64_t highlightedClassification;
  unint64_t v5;
  int64_t v6;

  if (a3 == 1)
    return 22;
  highlightedClassification = self->_highlightedClassification;
  v5 = highlightedClassification - 1;
  v6 = highlightedClassification + 20;
  if (v5 >= 3)
    return 20;
  else
    return v6;
}

- (int64_t)highlightedClassification
{
  return self->_highlightedClassification;
}

- (void)setHighlightedClassification:(int64_t)a3
{
  self->_highlightedClassification = a3;
}

- (NSNumberFormatter)percentageFormatter
{
  return self->_percentageFormatter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
}

@end
