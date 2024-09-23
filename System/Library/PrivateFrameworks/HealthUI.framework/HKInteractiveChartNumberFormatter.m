@implementation HKInteractiveChartNumberFormatter

- (HKInteractiveChartNumberFormatter)init
{
  HKInteractiveChartNumberFormatter *v2;
  HKInteractiveChartNumberFormatter *v3;
  NSString *unitFormatString;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKInteractiveChartNumberFormatter;
  v2 = -[HKInteractiveChartNumberFormatter init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    unitFormatString = v2->_unitFormatString;
    v2->_unitFormatString = 0;

  }
  return v3;
}

- (id)_formattedStringWithValue:(id)a3 formatter:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "stringFromNumber:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0CB3498]);
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
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  void *v13;
  double v14;
  void *v15;
  HKSelectedRangeData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  HKSelectedRangeData *v40;
  _QWORD v41[2];
  _QWORD v42[2];
  _QWORD v43[2];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v7 = v6;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v37;
      v11 = 0.0;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v37 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * i), "value");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "doubleValue");
          v11 = v11 + v14;

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
      }
      while (v9);
    }
    else
    {
      v11 = 0.0;
    }

    v16 = -[HKSelectedRangeData initWithStatisticsType:]([HKSelectedRangeData alloc], "initWithStatisticsType:", 0);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "numberFormatter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartNumberFormatter _formattedStringWithValue:formatter:](self, "_formattedStringWithValue:formatter:", v17, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKInteractiveChartNumberFormatter unitFormatString](self, "unitFormatString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v22 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKInteractiveChartNumberFormatter unitFormatString](self, "unitFormatString");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringWithFormat:", v25, *(_QWORD *)&v11);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      v27 = objc_alloc(MEMORY[0x1E0CB3498]);
      v42[0] = *MEMORY[0x1E0DC1138];
      -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v28;
      v42[1] = *MEMORY[0x1E0DC1140];
      objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v27, "initWithString:attributes:", v26, v30);

      v41[0] = v20;
      v41[1] = v31;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      HKUIJoinAttributedStringsWithFormat(v32, CFSTR("%1$@ %2$@"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[HKSelectedRangeData setAttributedString:](v16, "setAttributedString:", v33);

    }
    else
    {
      -[HKSelectedRangeData setAttributedString:](v16, "setAttributedString:", v20);
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKSelectedRangeData setValueAsNumber:](v16, "setValueAsNumber:", v34);

    v40 = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v15;
}

- (NSString)unitFormatString
{
  return self->_unitFormatString;
}

- (void)setUnitFormatString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unitFormatString, 0);
}

@end
