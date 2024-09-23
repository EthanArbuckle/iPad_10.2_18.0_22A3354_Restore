@implementation HKInteractiveChartTimePeriodFormatter

- (id)_formattedStringWithData:(id)a3 roundToHours:(BOOL)a4 displayUnit:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  HKTimePeriodDisplayTypeValueFormatter *timePeriodFormatter;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  HKTimePeriodDisplayTypeValueFormatter *v14;
  HKTimePeriodDisplayTypeValueFormatter *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v24;

  v5 = a4;
  v7 = a3;
  timePeriodFormatter = self->_timePeriodFormatter;
  if (!timePeriodFormatter)
  {
    -[HKInteractiveChartDataFormatter unitController](self, "unitController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "unitForDisplayType:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "hk_numberFormatterForUnit:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = -[HKDisplayTypeValueFormatter initWithNumberFormatter:]([HKTimePeriodDisplayTypeValueFormatter alloc], "initWithNumberFormatter:", v13);
    v15 = self->_timePeriodFormatter;
    self->_timePeriodFormatter = v14;

    timePeriodFormatter = self->_timePeriodFormatter;
  }
  v16 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timePeriod");
  objc_msgSend(v16, "numberWithDouble:");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = 1;
  -[HKTimePeriodDisplayTypeValueFormatter attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:](timePeriodFormatter, "attributedStringFromValue:roundToHours:displayType:unitController:valueFont:unitFont:formatForChart:", v17, v5, v18, v19, v20, v21, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5
{
  return -[HKInteractiveChartTimePeriodFormatter _formattedSelectedRangeLabelDataWithChartData:items:customDataType:boundedValueRange:](self, "_formattedSelectedRangeLabelDataWithChartData:items:customDataType:boundedValueRange:", a3, a4, a5, 0);
}

- (id)_formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 boundedValueRange:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  HKSelectedRangeData *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  HKSelectedRangeData *v26;
  HKSelectedRangeData *v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  double v32;
  HKSelectedRangeData *v33;
  double v34;
  HKSelectedRangeData *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  double v39;
  _BOOL4 v40;
  double v41;
  id v42;
  id v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  HKSelectedRangeData *v50;
  HKInteractiveChartTimePeriodData *v51;
  void *v52;
  void *v53;
  _BOOL8 v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  HKSelectedRangeData *v59;
  void *v60;
  void *v61;
  _BOOL8 v62;
  HKSelectedRangeData *v63;
  void *v64;
  void *v65;
  double v66;
  void *v67;
  void *v68;
  _BOOL8 v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  uint64_t v75;
  void *v77;
  id v78;
  id v79;
  int v80;
  id v81;
  int64_t v82;
  HKSelectedRangeData *v83;
  id obj;
  id v85;
  id v86;
  id v87;
  HKSelectedRangeData *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  id v99;
  _BYTE v100[128];
  _BYTE v101[128];
  _QWORD v102[3];

  v102[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  if (v9 && objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "firstObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 1)
    {
      v13 = objc_msgSend(v12, "recordCount");
      if (!v11 && v13 <= 1)
      {
        v14 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
        -[HKSelectedRangeData setDataType:](v14, "setDataType:", a5);
        -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v12, 0, 1);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSelectedRangeData setAttributedString:](v14, "setAttributedString:", v15);

        v16 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "timePeriod");
        objc_msgSend(v16, "numberWithDouble:");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSelectedRangeData setValueAsNumber:](v14, "setValueAsNumber:", v17);

        v102[0] = v14;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 1);
        v81 = (id)objc_claimAutoreleasedReturnValue();
LABEL_58:

        goto LABEL_59;
      }
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v81 = (id)MEMORY[0x1E0C9AA60];
LABEL_59:

      goto LABEL_60;
    }
    v14 = v12;
    v94 = 0u;
    v95 = 0u;
    v96 = 0u;
    v97 = 0u;
    v18 = v9;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
    v87 = v11;
    v78 = v9;
    v79 = v10;
    v77 = v12;
    obj = v18;
    if (v19)
    {
      v20 = v19;
      v82 = a5;
      v21 = 0;
      v22 = 0;
      v85 = *(id *)v95;
      v23 = (double)(unint64_t)*MEMORY[0x1E0CB4788];
      v24 = 0.0;
      v25 = 0.0;
      v26 = v14;
      v27 = v14;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(id *)v95 != v85)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
          objc_msgSend(v29, "timePeriod");
          if (v11)
            -[HKInteractiveChartTimePeriodFormatter _boundedTimePeriodFromDataPoint:boundedValueRange:](self, "_boundedTimePeriodFromDataPoint:boundedValueRange:", v29, v11);
          v31 = v30;
          -[HKSelectedRangeData timePeriod](v26, "timePeriod");
          if (v31 - v32 < 2.22044605e-16)
          {
            v33 = v29;

            v26 = v33;
          }
          -[HKSelectedRangeData timePeriod](v27, "timePeriod");
          if (v31 - v34 <= 2.22044605e-16)
          {
            v89 = v27;
          }
          else
          {
            v35 = v29;

            v89 = v35;
          }
          v36 = objc_msgSend(v29, "recordCount");
          v37 = objc_msgSend(v29, "recordCount");
          objc_msgSend(v29, "statisticsInterval");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "hk_approximateDuration");
          v40 = HKUIEqualDoubles(v39, v23);

          if (v40)
          {
            v24 = v24 + v31 * (double)objc_msgSend(v29, "recordCount");
            v22 += objc_msgSend(v29, "recordCount");
          }
          else
          {
            v22 = 0;
          }
          v11 = v87;
          v25 = v25 + v31 * (double)v36;
          v21 += v37;
          v27 = v89;
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v101, 16);
      }
      while (v20);

      v41 = v25 / (double)v21;
      v10 = v79;
      if (v22 < 1)
      {
        v80 = 0;
      }
      else
      {
        v24 = v24 / (double)v22;
        v80 = 1;
      }
      a5 = v82;
      v14 = v26;
    }
    else
    {

      v80 = 0;
      v25 = 0.0;
      v41 = NAN;
      v89 = v14;
      v24 = 0.0;
    }
    v42 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v90 = 0u;
    v91 = 0u;
    v92 = 0u;
    v93 = 0u;
    v43 = v10;
    v44 = v42;
    v86 = v43;
    v45 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
    v81 = v42;
    if (!v45)
    {
LABEL_57:

      v11 = v87;
      v9 = v78;
      v10 = v79;
      v12 = v77;
      goto LABEL_58;
    }
    v46 = v45;
    v47 = *(_QWORD *)v91;
    v83 = v14;
LABEL_34:
    v48 = 0;
    while (1)
    {
      if (*(_QWORD *)v91 != v47)
        objc_enumerationMutation(v86);
      v49 = objc_msgSend(*(id *)(*((_QWORD *)&v90 + 1) + 8 * v48), "integerValue");
      if (v49 <= 7)
      {
        if (v49 == 2)
        {
          v50 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 1);
          -[HKSelectedRangeData setDataType:](v50, "setDataType:", a5);
          -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v14, 0, 0);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSelectedRangeData setAttributedString:](v50, "setAttributedString:", v72);

          v58 = (void *)MEMORY[0x1E0CB37E8];
          v59 = v14;
LABEL_50:
          -[HKSelectedRangeData timePeriod](v59, "timePeriod");
          objc_msgSend(v58, "numberWithDouble:");
          v73 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSelectedRangeData setValueAsNumber:](v50, "setValueAsNumber:", v73);

          objc_msgSend(v44, "addObject:", v50);
LABEL_51:

          goto LABEL_52;
        }
        if (v49 == 4)
        {
          v50 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 2);
          -[HKSelectedRangeData setDataType:](v50, "setDataType:", a5);
          -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v89, 0, 0);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          -[HKSelectedRangeData setAttributedString:](v50, "setAttributedString:", v57);

          v58 = (void *)MEMORY[0x1E0CB37E8];
          v59 = v89;
          v44 = v81;
          goto LABEL_50;
        }
      }
      else
      {
        switch(v49)
        {
          case 8:
            v50 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            -[HKSelectedRangeData setTimePeriod:](v50, "setTimePeriod:", v41);
            -[HKSelectedRangeData timePeriodPrefix](v14, "timePeriodPrefix");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setTimePeriodPrefix:](v50, "setTimePeriodPrefix:", v60);

            -[HKInteractiveChartDataFormatter displayType](self, "displayType");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend(v61, "displayTypeIdentifier") == 70;

            v63 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 3);
            -[HKSelectedRangeData setDataType:](v63, "setDataType:", a5);
            -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v50, v62, 0);
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setAttributedString:](v63, "setAttributedString:", v64);

            v65 = (void *)MEMORY[0x1E0CB37E8];
            v66 = v41;
LABEL_48:
            objc_msgSend(v65, "numberWithDouble:", v66);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setValueAsNumber:](v63, "setValueAsNumber:", v71);

            v14 = v83;
            objc_msgSend(v44, "addObject:", v63);

            goto LABEL_51;
          case 16:
            v50 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            -[HKSelectedRangeData setTimePeriod:](v50, "setTimePeriod:", v25);
            -[HKSelectedRangeData timePeriodPrefix](v14, "timePeriodPrefix");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setTimePeriodPrefix:](v50, "setTimePeriodPrefix:", v67);

            -[HKInteractiveChartDataFormatter displayType](self, "displayType");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v69 = objc_msgSend(v68, "displayTypeIdentifier") == 70;

            v63 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 5);
            -[HKSelectedRangeData setDataType:](v63, "setDataType:", a5);
            -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v50, v69, 0);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setAttributedString:](v63, "setAttributedString:", v70);

            v65 = (void *)MEMORY[0x1E0CB37E8];
            v66 = v25;
            goto LABEL_48;
          case 128:
            if (!v80)
            {
              _HKInitializeLogging();
              v74 = *MEMORY[0x1E0CB5378];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5378], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v99 = obj;
                _os_log_error_impl(&dword_1D7813000, v74, OS_LOG_TYPE_ERROR, "Error formatting daily average with incoming chart data: %@", buf, 0xCu);
              }
              break;
            }
            v50 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 8);
            -[HKSelectedRangeData setDataType:](v50, "setDataType:", a5);
            v51 = objc_alloc_init(HKInteractiveChartTimePeriodData);
            -[HKInteractiveChartTimePeriodData setTimePeriod:](v51, "setTimePeriod:", v24);
            -[HKSelectedRangeData timePeriodPrefix](v83, "timePeriodPrefix");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKInteractiveChartTimePeriodData setTimePeriodPrefix:](v51, "setTimePeriodPrefix:", v52);

            -[HKInteractiveChartDataFormatter displayType](self, "displayType");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            v54 = objc_msgSend(v53, "displayTypeIdentifier") == 70;

            v44 = v81;
            -[HKInteractiveChartTimePeriodFormatter _formattedStringWithData:roundToHours:displayUnit:](self, "_formattedStringWithData:roundToHours:displayUnit:", v51, v54, 0);
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setAttributedString:](v50, "setAttributedString:", v55);

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v24);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            -[HKSelectedRangeData setValueAsNumber:](v50, "setValueAsNumber:", v56);

            objc_msgSend(v81, "addObject:", v50);
            v14 = v83;
            goto LABEL_51;
        }
      }
LABEL_52:
      if (v46 == ++v48)
      {
        v75 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v90, v100, 16);
        v46 = v75;
        if (!v75)
          goto LABEL_57;
        goto LABEL_34;
      }
    }
  }
  v81 = (id)MEMORY[0x1E0C9AA60];
LABEL_60:

  return v81;
}

- (double)_boundedTimePeriodFromDataPoint:(id)a3 boundedValueRange:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "startDate");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = 0.0;
  v9 = 0.0;
  if (v7)
  {
    v10 = (void *)v7;
    objc_msgSend(v6, "startDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "hk_isAfterDate:", v12);

    if (v13)
    {
      objc_msgSend(v6, "startDate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "startDate");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "timeIntervalSinceDate:", v15);
      v9 = v16;

    }
  }
  objc_msgSend(v5, "endDate");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    objc_msgSend(v6, "endDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endDate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "hk_isBeforeDate:", v20);

    if (v21)
    {
      objc_msgSend(v5, "endDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "endDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "timeIntervalSinceDate:", v23);
      v8 = v24;

    }
  }
  objc_msgSend(v5, "timePeriod");
  v26 = v25 - v9 - v8;

  return v26;
}

- (id)formattedBoundedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4 customDataType:(int64_t)a5 chartRangeProvider:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;

  v10 = a4;
  v11 = a3;
  objc_msgSend(a6, "actualVisibleRange");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartTimePeriodFormatter _formattedSelectedRangeLabelDataWithChartData:items:customDataType:boundedValueRange:](self, "_formattedSelectedRangeLabelDataWithChartData:items:customDataType:boundedValueRange:", v11, v10, a5, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 items:(id)a4
{
  return -[HKInteractiveChartTimePeriodFormatter formattedSelectedRangeLabelDataWithChartData:items:customDataType:](self, "formattedSelectedRangeLabelDataWithChartData:items:customDataType:", a3, a4, 0);
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  return -[HKInteractiveChartTimePeriodFormatter formattedSelectedRangeLabelDataWithChartData:items:](self, "formattedSelectedRangeLabelDataWithChartData:items:", a3, &unk_1E9CE9D88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timePeriodFormatter, 0);
}

@end
