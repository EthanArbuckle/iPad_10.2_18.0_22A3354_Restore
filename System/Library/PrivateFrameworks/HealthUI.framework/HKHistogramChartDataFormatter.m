@implementation HKHistogramChartDataFormatter

- (HKHistogramChartDataFormatter)initWithUnit:(id)a3
{
  id v5;
  HKHistogramChartDataFormatter *v6;
  HKHistogramChartDataFormatter *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HKHistogramChartDataFormatter;
  v6 = -[HKHistogramChartDataFormatter init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_unit, a3);
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopValueFont");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter setMajorFont:](v7, "setMajorFont:", v8);

    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartLollipopKeyFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter setMinorFont:](v7, "setMinorFont:", v9);

    -[HKInteractiveChartDataFormatter setDisplayType:](v7, "setDisplayType:", 0);
  }

  return v7;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  HKSelectedRangeData *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  HKSelectedRangeData *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_13;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (!v7)
    goto LABEL_13;
  v8 = v7;
  v9 = 0;
  v10 = *(_QWORD *)v22;
  do
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v22 != v10)
        objc_enumerationMutation(v6);
      v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v13 = v12;

        v9 = v13;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  }
  while (v8);
  if (v9)
  {
    v14 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    -[HKSelectedRangeData setDataType:](v14, "setDataType:", 0);
    objc_msgSend(v9, "yValue");
    v16 = v15;
    -[HKHistogramChartDataFormatter unit](self, "unit");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHistogramChartDataFormatter _formattedStringWithValue:unit:showUnit:](self, "_formattedStringWithValue:unit:showUnit:", v17, 1, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setAttributedString:](v14, "setAttributedString:", v18);

    v25 = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_13:
    v19 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v19;
}

- (id)_formattedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[3];
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  _QWORD v35[2];

  v5 = a5;
  v35[1] = *MEMORY[0x1E0C80C00];
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "unitString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "stringValue");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x1E0CB3498]);
  v14 = *MEMORY[0x1E0DC1138];
  v34 = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithString:attributes:", v12, v16);

  if (v5 && objc_msgSend(v11, "length"))
  {
    v18 = objc_alloc(MEMORY[0x1E0CB3498]);
    v32 = v14;
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v18, "initWithString:attributes:", CFSTR(" "), v20);

    v22 = objc_alloc(MEMORY[0x1E0CB3498]);
    v30 = v14;
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v23;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithString:attributes:", v11, v24);

    v29[0] = v17;
    v29[1] = v21;
    v29[2] = v25;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 3);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsForLocale(v26);
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = v17;
  }

  return v27;
}

- (HKUnit)unit
{
  return self->_unit;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
}

@end
