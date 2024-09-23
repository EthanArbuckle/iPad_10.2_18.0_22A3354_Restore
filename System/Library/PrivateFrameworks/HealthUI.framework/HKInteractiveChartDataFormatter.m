@implementation HKInteractiveChartDataFormatter

- (id)formattedStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[3];

  v5 = a5;
  v27[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "presentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "adjustedDoubleForDaemonDouble:", a3);
    a3 = v12;

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter attributedStringForValue:](self, "attributedStringForValue:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && objc_msgSend(v8, "length"))
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    v26[0] = *MEMORY[0x1E0DC1138];
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    v26[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v15, "initWithString:attributes:", v8, v18);

    v25[0] = v14;
    v25[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsWithFormat(v20, v22);
    v23 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v23 = v14;
  }

  return v23;
}

- (id)_formattedPercentageStringWithValue:(double)a3 unitString:(id)a4 showUnit:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[3];

  v5 = a5;
  v28[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = v8;
  if (v5 && objc_msgSend(v8, "length"))
  {
    -[HKInteractiveChartDataFormatter displayType](self, "displayType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      -[HKInteractiveChartDataFormatter displayType](self, "displayType");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "adjustedDoubleForDaemonDouble:", a3);
      a3 = v13;

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKInteractiveChartDataFormatter attributedStringForValue:](self, "attributedStringForValue:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_alloc(MEMORY[0x1E0CB3498]);
    v27[0] = *MEMORY[0x1E0DC1138];
    -[HKInteractiveChartDataFormatter minorFont](self, "minorFont");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v17;
    v27[1] = *MEMORY[0x1E0DC1140];
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v16, "initWithString:attributes:", v9, v19);

    v26[0] = v15;
    v26[1] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsWithFormat(v21, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[HKInteractiveChartDataFormatter formattedStringWithValue:unitString:showUnit:](self, "formattedStringWithValue:unitString:showUnit:", v9, v5, a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v24;
}

- (id)unitStringFromUnit:(id)a3 number:(id)a4
{
  id v6;
  void *v7;
  char *v8;
  void *v9;

  v6 = a4;
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  if (a3)
    objc_msgSend(v7, "localizedDisplayNameForDisplayType:value:", v8, v6);
  else
    HKUIUnitDisplayName(v7, v8, (uint64_t)v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)attributedStringWithValue:(double)a3 unit:(id)a4 showUnit:(BOOL)a5
{
  _BOOL8 v5;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a5;
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = a4;
  objc_msgSend(v8, "numberWithDouble:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitStringFromUnit:number:](self, "unitStringFromUnit:number:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB6CD0], "percentUnit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "isEqual:", v12);

  if (v13)
    -[HKInteractiveChartDataFormatter _formattedPercentageStringWithValue:unitString:showUnit:](self, "_formattedPercentageStringWithValue:unitString:showUnit:", v11, v5, a3);
  else
    -[HKInteractiveChartDataFormatter formattedStringWithValue:unitString:showUnit:](self, "formattedStringWithValue:unitString:showUnit:", v11, v5, a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)attributedStringForValue:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  -[HKInteractiveChartDataFormatter valueStringFromNumber:](self, "valueStringFromNumber:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc(MEMORY[0x1E0CB3498]);
  v11[0] = *MEMORY[0x1E0DC1138];
  -[HKInteractiveChartDataFormatter majorFont](self, "majorFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = *MEMORY[0x1E0DC1140];
  objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v5, "initWithString:attributes:", v4, v8);

  return v9;
}

- (id)valueStringFromNumber:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[HKInteractiveChartDataFormatter displayType](self, "displayType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKInteractiveChartDataFormatter unitController](self, "unitController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HKFormattedStringFromValue(v4, v5, v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (UIFont)majorFont
{
  return self->_majorFont;
}

- (void)setMajorFont:(id)a3
{
  objc_storeStrong((id *)&self->_majorFont, a3);
}

- (UIFont)minorFont
{
  return self->_minorFont;
}

- (void)setMinorFont:(id)a3
{
  objc_storeStrong((id *)&self->_minorFont, a3);
}

- (HKUnitPreferenceController)unitController
{
  return self->_unitController;
}

- (void)setUnitController:(id)a3
{
  objc_storeStrong((id *)&self->_unitController, a3);
}

- (HKDisplayType)displayType
{
  return (HKDisplayType *)objc_loadWeakRetained((id *)&self->_displayType);
}

- (void)setDisplayType:(id)a3
{
  objc_storeWeak((id *)&self->_displayType, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_displayType);
  objc_storeStrong((id *)&self->_unitController, 0);
  objc_storeStrong((id *)&self->_minorFont, 0);
  objc_storeStrong((id *)&self->_majorFont, 0);
}

- (id)formattedSelectedRangeLabelDataWithChartData:(id)a3 context:(int64_t)a4
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return (id)MEMORY[0x1E0C9AA60];
}

@end
