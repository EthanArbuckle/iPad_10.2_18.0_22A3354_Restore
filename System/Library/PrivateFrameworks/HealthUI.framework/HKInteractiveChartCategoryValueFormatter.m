@implementation HKInteractiveChartCategoryValueFormatter

- (HKInteractiveChartCategoryValueFormatter)initWithLocalizedCategoryName:(id)a3
{
  id v4;
  HKInteractiveChartCategoryValueFormatter *v5;
  HKInteractiveChartCategoryValueFormatter *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HKInteractiveChartCategoryValueFormatter;
  v5 = -[HKInteractiveChartCategoryValueFormatter init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[HKInteractiveChartCategoryValueFormatter setLocalizedCategoryName:](v5, "setLocalizedCategoryName:", v4);

  return v6;
}

- (id)_formattedStringWithValue:(int64_t)a3 useColorAttributes:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v4 = a4;
  v22[2] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hk_enumeratedValueLabels");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v21[0] = *MEMORY[0x1E0DC1138];
    -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v9;
    v21[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v22[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = *MEMORY[0x1E0DC1138];
    -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  if (v8)
  {
    v12 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v12, "initWithString:attributes:", v14, v11);

  }
  else
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localization");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v13, v11);
  }

  return v15;
}

- (id)_formattedStringWithCount:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("ENTRIES_NUMBERLESS_VALUE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "localizedStringWithFormat:", v6, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = *MEMORY[0x1E0DC1138];
  v9 = v29;
  -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v10;
  v30 = *MEMORY[0x1E0DC1140];
  v11 = v30;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v29, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v7, "initWithString:attributes:", v8, v13);

  HKIntegerFormatter();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringFromNumber:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_alloc(MEMORY[0x1E0CB3498]);
  v27[0] = v9;
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  v28[0] = v19;
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v18, "initWithString:attributes:", v17, v21);

  v26[0] = v22;
  v26[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  HKUIJoinAttributedStringsWithFormat(v23, CFSTR("%1$@ %2$@"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_formattedStringWithText:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = (objc_class *)MEMORY[0x1E0CB3498];
  v5 = a3;
  v6 = [v4 alloc];
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
  v10 = (void *)objc_msgSend(v6, "initWithString:attributes:", v5, v9);

  return v10;
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  HKSelectedRangeData *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v19;
  void *v20;
  void *v21;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count"))
  {
    -[HKInteractiveChartCategoryValueFormatter _uniqueChartPoints:](self, "_uniqueChartPoints:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "hk_enumeratedValueLabels");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "count") == 1)
    {
      v11 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
      if (v10)
      {
        objc_msgSend(v8, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartCategoryValueFormatter _formattedStringWithValue:useColorAttributes:](self, "_formattedStringWithValue:useColorAttributes:", objc_msgSend(v12, "value"), 1);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSelectedRangeData setAttributedString:](v11, "setAttributedString:", v13);

        -[HKInteractiveChartDataFormatter displayType](self, "displayType");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "displayCategory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "categoryID");

        if (v16 == 26)
          -[HKSelectedRangeData setStatisticsType:](v11, "setStatisticsType:", 20);
      }
      else
      {
        -[HKInteractiveChartCategoryValueFormatter localizedCategoryName](self, "localizedCategoryName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKInteractiveChartCategoryValueFormatter _formattedStringWithText:](self, "_formattedStringWithText:", v12);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[HKSelectedRangeData setAttributedString:](v11, "setAttributedString:", v21);

      }
    }
    else
    {
      if ((unint64_t)objc_msgSend(v8, "count") > 1 || a4 == 1)
        v19 = 5;
      else
        v19 = 0;
      v11 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", v19);
      -[HKInteractiveChartCategoryValueFormatter _formattedStringWithCount:](self, "_formattedStringWithCount:", objc_msgSend(v8, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setAttributedString:](v11, "setAttributedString:", v20);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setValueAsNumber:](v11, "setValueAsNumber:", v12);
    }

    v23[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v17 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v17;
}

- (id)_uniqueChartPoints:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v12 = v11;
          if ((objc_msgSend(v5, "containsObject:", v12, (_QWORD)v14) & 1) == 0)
          {
            objc_msgSend(v4, "addObject:", v12);
            objc_msgSend(v5, "addObject:", v12);
          }

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v4;
}

- (NSString)localizedCategoryName
{
  return self->_localizedCategoryName;
}

- (void)setLocalizedCategoryName:(id)a3
{
  objc_storeStrong((id *)&self->_localizedCategoryName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedCategoryName, 0);
}

@end
