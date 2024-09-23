@implementation HKInteractiveChartNumberRangeFormatter

- (id)stringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitPreferenceController:(id)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;

  v10 = (void *)MEMORY[0x1E0DC1350];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v10, "systemFontOfSize:", 12.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v19) = 0;
  -[HKInteractiveChartNumberRangeFormatter attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:", v14, v13, v12, v11, v15, v15, v19);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "string");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  uint64_t v10;

  LOBYTE(v10) = a9;
  return -[HKInteractiveChartNumberRangeFormatter attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:resultIsSingleValue:](self, "attributedStringForMinimumValue:maximumValue:displayType:unitController:valueFont:unitFont:formatForChart:resultIsSingleValue:", a3, a4, a5, a6, a7, a8, v10, 0);
}

- (id)attributedStringForMinimumValue:(id)a3 maximumValue:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9 resultIsSingleValue:(BOOL *)a10
{
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;

  v17 = (unint64_t)a3;
  v18 = (unint64_t)a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKInteractiveChartNumberRangeFormatter.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("displayType != nil"));

  }
  if (v17 | v18)
  {
    objc_msgSend(v20, "unitForDisplayType:", v19);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_valueFormatterForUnit:");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      LOBYTE(v31) = a9;
      -[HKInteractiveChartNumberRangeFormatter _attributedStringFromValue:withValueFormatter:displayType:unitController:valueFont:unitFont:formatForChart:](self, "_attributedStringFromValue:withValueFormatter:displayType:unitController:valueFont:unitFont:formatForChart:", v17, v23, v19, v20, v21, v22, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedDisplayNameForDisplayType:value:", v19, v17);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v32 = 0;
      v24 = 0;
    }
    v35 = v22;
    v33 = (void *)v23;
    if (v18)
    {
      v26 = a9;
      LOBYTE(v31) = a9;
      -[HKInteractiveChartNumberRangeFormatter _attributedStringFromValue:withValueFormatter:displayType:unitController:valueFont:unitFont:formatForChart:](self, "_attributedStringFromValue:withValueFormatter:displayType:unitController:valueFont:unitFont:formatForChart:", v18, v23, v19, v20, v21, v22, v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedDisplayNameForDisplayType:value:", v19, v18);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = 0;
      v28 = 0;
      v26 = a9;
    }
    -[HKInteractiveChartNumberRangeFormatter attributedStringForMinimumString:maximumString:minimumUnitString:maximumUnitString:valueFont:formatForChart:resultIsASingleValue:](self, "attributedStringForMinimumString:maximumString:minimumUnitString:maximumUnitString:valueFont:formatForChart:resultIsASingleValue:", v32, v27, v24, v28, v21, v26, a10);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v35;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (id)attributedStringForMinimumString:(id)a3 maximumString:(id)a4 minimumUnitString:(id)a5 maximumUnitString:(id)a6 valueFont:(id)a7 formatForChart:(BOOL)a8 resultIsASingleValue:(BOOL *)a9
{
  _BOOL4 v9;
  BOOL *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  char v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  _BOOL4 v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  id v48;

  v9 = a8;
  v15 = a9;
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  if (!v16 || !v17)
  {
    if (v16)
    {
      v24 = v16;
      v25 = 1;
      v16 = v24;
      if (!a9)
        goto LABEL_21;
    }
    else if (v17)
    {
      v24 = v17;
      v16 = 0;
      v25 = 1;
      v17 = v24;
      if (!a9)
        goto LABEL_21;
    }
    else
    {
      v24 = 0;
      v16 = 0;
      v25 = 1;
      if (!a9)
        goto LABEL_21;
    }
    goto LABEL_20;
  }
  objc_msgSend(v16, "string");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v21, "isEqualToString:", v22);

  if (v23)
  {
    v24 = v16;
    v25 = 1;
    v16 = v24;
    v15 = a9;
    if (!a9)
      goto LABEL_21;
    goto LABEL_20;
  }
  objc_msgSend(v16, "string");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = -[HKInteractiveChartNumberRangeFormatter _shouldRemoveUnit:fromMinimumFormattedValue:](self, "_shouldRemoveUnit:fromMinimumFormattedValue:", v18, v26);

  if (v27)
  {
    v28 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v28, "mutableString");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_hk_trimString:", v18);

    objc_msgSend(v28, "mutableString");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "_hk_trimCharactersInSet:", v31);

    v32 = objc_msgSend(v28, "copy");
    v16 = (id)v32;
  }
  objc_msgSend(v17, "string");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[HKInteractiveChartNumberRangeFormatter _shouldRemoveUnit:fromMaximumFormattedValue:](self, "_shouldRemoveUnit:fromMaximumFormattedValue:", v19, v33);

  if (v34)
  {
    v35 = (void *)objc_msgSend(v17, "mutableCopy");
    objc_msgSend(v35, "mutableString");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_hk_trimString:", v19);

    objc_msgSend(v35, "mutableString");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_hk_trimCharactersInSet:", v38);

    v39 = objc_msgSend(v35, "copy");
    v17 = (id)v39;
  }
  v48 = v18;
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v40 = 0;
  }
  v41 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("OVERLAY_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  HKAttributedStringAttributesForFont(v20, v40);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = v20;
  v46 = (void *)objc_msgSend(v41, "initWithString:attributes:", v43, v44);

  v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithFormat:options:locale:", v46, 1, 0, v16, v17);
  v20 = v45;

  v25 = 0;
  v18 = v48;
  v15 = a9;
  if (a9)
LABEL_20:
    *v15 = v25;
LABEL_21:

  return v24;
}

- (BOOL)_shouldRemoveUnit:(id)a3 fromMinimumFormattedValue:(id)a4
{
  id v5;
  id v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) == 1)
  {
    v7 = 1;
  }
  else
  {
    v8 = objc_msgSend(v6, "rangeOfString:options:", v5, 4);
    v7 = v8 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v6, "length") == v8 + v9;
  }

  return v7;
}

- (BOOL)_shouldRemoveUnit:(id)a3 fromMaximumFormattedValue:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", 0) != 1
    && objc_msgSend(v6, "rangeOfString:", v5) == 0;

  return v7;
}

- (id)_attributedStringFromValue:(id)a3 withValueFormatter:(id)a4 displayType:(id)a5 unitController:(id)a6 valueFont:(id)a7 unitFont:(id)a8 formatForChart:(BOOL)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v29;

  v29 = a8;
  v14 = a7;
  v15 = a6;
  v16 = a5;
  v17 = a3;
  objc_msgSend(a4, "stringFromValue:displayType:unitController:", v17, v16, v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopValueColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  v20 = objc_alloc(MEMORY[0x1E0CB3778]);
  HKAttributedStringAttributesForFont(v14, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)objc_msgSend(v20, "initWithString:attributes:", v18, v21);
  objc_msgSend(v15, "localizedDisplayNameForDisplayType:value:", v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (a9)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "hk_chartLollipopLabelColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  HKAttributedStringAttributesForFont(v29, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v18, "rangeOfString:", v23);
  objc_msgSend(v22, "addAttributes:range:", v25, v26, v27);

  return v22;
}

@end
