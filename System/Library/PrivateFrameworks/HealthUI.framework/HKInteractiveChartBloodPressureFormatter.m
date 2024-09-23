@implementation HKInteractiveChartBloodPressureFormatter

- (id)_formattedStringWithRange:(id)a3 displayUnit:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v34;
  _QWORD v35[3];
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[3];

  v4 = a4;
  v39[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unitForDisplayType:", v8);
  v9 = objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)v9;
  objc_msgSend(v10, "hk_numberFormatterForUnit:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartBloodPressureFormatter _stringFromRange:numberFormatter:displayType:unitController:](self, "_stringFromRange:numberFormatter:displayType:unitController:", v6, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0CB3498]);
  v16 = *MEMORY[0x1E0DC1138];
  v38[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v17;
  v18 = *MEMORY[0x1E0DC1140];
  v38[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v39[1] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v15, "initWithString:attributes:", v14, v20);

  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v23 = (char *)objc_claimAutoreleasedReturnValue();
  HKUIUnitDisplayName(v22, v23, (uint64_t)&unk_1E9CEB0D8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v24, "length"))
  {
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", CFSTR(" "));
    v26 = objc_alloc(MEMORY[0x1E0CB3498]);
    v36[0] = v16;
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = v18;
    v37[0] = v27;
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v28;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v26, "initWithString:attributes:", v24, v29);

    v35[0] = v21;
    v35[1] = v25;
    v35[2] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsForLocale(v31);
    v32 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v32 = v21;
  }

  return v32;
}

- (BOOL)_lowerMinimum:(id)a3 currentMinimum:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      v8 = objc_msgSend(v5, "compare:", v6) == -1;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_higherMaximum:(id)a3 currentMaximum:(id)a4
{
  id v5;
  id v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (v5)
  {
    if (v6)
      v8 = objc_msgSend(v5, "compare:", v6) == 1;
    else
      v8 = 1;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  HKSelectedRangeData *v41;
  void *v42;
  void *v43;
  HKSelectedRangeData *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[2];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5 || !objc_msgSend(v5, "count"))
  {
    v47 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_30;
  }
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  obj = v6;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  v49 = v6;
  v7 = 0;
  v8 = 0;
  if (!v52)
    goto LABEL_28;
  v51 = *(_QWORD *)v54;
  do
  {
    for (i = 0; i != v52; ++i)
    {
      if (*(_QWORD *)v54 != v51)
        objc_enumerationMutation(obj);
      v10 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
      objc_msgSend(v10, "systolicRange", v49);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v8)
      {
        objc_msgSend(v11, "minValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "minValue");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = -[HKInteractiveChartBloodPressureFormatter _lowerMinimum:currentMinimum:](self, "_lowerMinimum:currentMinimum:", v13, v14);

        if (v15)
        {
          objc_msgSend(v10, "systolicRange");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "minValue");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setMinValue:", v17);

        }
        objc_msgSend(v10, "systolicRange");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "maxValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "maxValue");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[HKInteractiveChartBloodPressureFormatter _higherMaximum:currentMaximum:](self, "_higherMaximum:currentMaximum:", v19, v20);

        if (v21)
        {
          objc_msgSend(v10, "systolicRange");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "maxValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setMaxValue:", v23);
LABEL_15:

        }
      }
      else
      {

        if (v12)
        {
          objc_msgSend(v10, "systolicRange");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "minValue");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "systolicRange");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "maxValue");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v23, v25);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_15;
        }
        v8 = 0;
      }
      objc_msgSend(v10, "diastolicRange");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v26;
      if (v7)
      {
        objc_msgSend(v26, "minValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "minValue");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[HKInteractiveChartBloodPressureFormatter _lowerMinimum:currentMinimum:](self, "_lowerMinimum:currentMinimum:", v28, v29);

        if (v30)
        {
          objc_msgSend(v10, "diastolicRange");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "minValue");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setMinValue:", v32);

        }
        objc_msgSend(v10, "diastolicRange");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "maxValue");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "maxValue");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = -[HKInteractiveChartBloodPressureFormatter _higherMaximum:currentMaximum:](self, "_higherMaximum:currentMaximum:", v34, v35);

        if (v36)
        {
          objc_msgSend(v10, "diastolicRange");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "maxValue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setMaxValue:", v38);
LABEL_24:

          continue;
        }
      }
      else
      {

        if (v27)
        {
          objc_msgSend(v10, "diastolicRange");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "minValue");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "diastolicRange");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "maxValue");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          +[HKValueRange valueRangeWithMinValue:maxValue:](HKValueRange, "valueRangeWithMinValue:maxValue:", v38, v40);
          v7 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_24;
        }
        v7 = 0;
      }
    }
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  }
  while (v52);
LABEL_28:

  v41 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
  -[HKSelectedRangeData setDataType:](v41, "setDataType:", 1);
  -[HKInteractiveChartBloodPressureFormatter _formattedStringWithRange:displayUnit:](self, "_formattedStringWithRange:displayUnit:", v8, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v41, "setAttributedString:", v42);

  objc_msgSend(v8, "maxValue");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v41, "setValueAsNumber:", v43);

  v44 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
  -[HKSelectedRangeData setDataType:](v44, "setDataType:", 2);
  -[HKInteractiveChartBloodPressureFormatter _formattedStringWithRange:displayUnit:](self, "_formattedStringWithRange:displayUnit:", v7, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setAttributedString:](v44, "setAttributedString:", v45);

  objc_msgSend(v7, "maxValue");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKSelectedRangeData setValueAsNumber:](v44, "setValueAsNumber:", v46);

  v57[0] = v41;
  v57[1] = v44;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v49;
LABEL_30:

  return v47;
}

- (id)_stringFromRange:(id)a3 numberFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  void *v32;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  HKLocalizedNoDataString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v11, "presentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "minValue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "adjustedValueForDaemonValue:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "presentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "maxValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "adjustedValueForDaemonValue:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      if (v19)
      {
        objc_msgSend(v16, "doubleValue");
        v21 = v20;
        objc_msgSend(v19, "doubleValue");
        v23 = vabdd_f64(v21, v22);
        objc_msgSend(v10, "stringFromNumber:displayType:unitController:", v16, v11, v12);
        v24 = objc_claimAutoreleasedReturnValue();
        if (v23 >= 0.00000011920929)
        {
          objc_msgSend(v10, "stringFromNumber:displayType:unitController:", v19, v11, v12);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("RANGE_STRING %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "stringWithFormat:", v26, v24, v25);
          v31 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v24;
          v24 = v31;
        }
        goto LABEL_10;
      }
      v27 = v10;
      v28 = v16;
    }
    else
    {
      if (!v19)
      {
LABEL_11:

        goto LABEL_12;
      }
      v27 = v10;
      v28 = v19;
    }
    objc_msgSend(v27, "stringFromNumber:displayType:unitController:", v28, v11, v12);
    v24 = objc_claimAutoreleasedReturnValue();
LABEL_10:

    v13 = (void *)v24;
    goto LABEL_11;
  }
LABEL_12:

  return v13;
}

@end
