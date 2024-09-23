@implementation HKQuantityDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  return -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:", a3, a4, a5, a6, a7, a8, 0);
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9
{
  _BOOL8 v9;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;

  v9 = a8;
  v16 = (void *)MEMORY[0x1E0CB34D0];
  v17 = a9;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  objc_msgSend(v16, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("QUANTITY_VALUE_FORMAT_STRING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:formatString:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:formatString:", v22, v21, v20, v19, v18, v9, v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  id v15;
  id v16;
  HKNumberFormatter *numberFormatter;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  HKQuantityDisplayTypeValueFormatter *v29;
  _BOOL4 v30;

  v30 = a8;
  v15 = a4;
  v16 = a9;
  v29 = self;
  numberFormatter = self->super._numberFormatter;
  v18 = a10;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  HKFormattedStringFromValue(v22, v15, v21, 1, numberFormatter);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localizedDisplayNameForDisplayType:value:", v15, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v24);
    v25 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v25;
  }
  objc_msgSend(v15, "unitIcon");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDisplayTypeValueFormatter attributedStringFromValueString:valueFont:unitString:unitFont:unitIcon:formatForChart:formatString:](v29, "attributedStringFromValueString:valueFont:unitString:unitFont:unitIcon:formatForChart:formatString:", v23, v20, v24, v19, v26, v30, v18);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)attributedStringFromValueString:(id)a3 valueFont:(id)a4 unitString:(id)a5 unitFont:(id)a6 unitIcon:(id)a7 formatForChart:(BOOL)a8 formatString:(id)a9
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;

  v9 = a8;
  v14 = a4;
  v15 = a7;
  v16 = a9;
  HKGenerateAttributedStringsWithUnitValue(a3, a5, v14, a6, 2, v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "ascender");
    v19 = v18;
    objc_msgSend(v14, "descender");
    v21 = v19 + v20;
    objc_msgSend(v15, "size");
    v23 = v21 - v22;
    objc_msgSend(MEMORY[0x1E0CB3498], "hk_attributedStringForSpacing:", 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&stru_1E9C4C428, "hk_attributedStringPrefixedWithImage:baselineAdjusted:spacing:", v15, v23, 0.0);
    v25 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E9C4C428);
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E9C4C428);
  }
  v26 = (void *)v25;
  objc_msgSend(v17, "addObject:", v24);
  objc_msgSend(v17, "addObject:", v26);
  HKUIJoinAttributedStringsWithFormat(v17, v16);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:", a3, a4, a5, a6, a7, 1);
}

- (id)attributedStringFromValue:(id)a3 unit:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  id v15;
  id v16;
  id v17;
  HKNumberFormatter *numberFormatter;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v27;
  id v28;

  v27 = a8;
  v28 = a6;
  v15 = a7;
  v16 = a9;
  v17 = a10;
  numberFormatter = self->super._numberFormatter;
  v19 = a5;
  v20 = a4;
  v21 = a3;
  HKFormattedStringFromValue(v21, 0, v19, 1, numberFormatter);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "localizedDisplayNameForUnit:value:", v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v16, CFSTR("%@"), 0, v23);
    v24 = objc_claimAutoreleasedReturnValue();

    v23 = (void *)v24;
  }
  -[HKQuantityDisplayTypeValueFormatter attributedStringFromValueString:valueFont:unitString:unitFont:unitIcon:formatForChart:formatString:](self, "attributedStringFromValueString:valueFont:unitString:unitFont:unitIcon:formatForChart:formatString:", v22, v28, v23, v15, 0, v27, v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6
{
  id v10;
  HKNumberFormatter *numberFormatter;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;

  v10 = a6;
  numberFormatter = self->super._numberFormatter;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  HKFormattedStringFromValue(v14, v13, v12, 1, numberFormatter);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedDisplayNameForDisplayType:value:", v13, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v16, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v10, v15, v16);
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = v15;
  }
  v18 = v17;

  return v18;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = (void *)MEMORY[0x1E0CB34D0];
  v9 = a5;
  v10 = a4;
  v11 = a3;
  objc_msgSend(v8, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDisplayTypeValueFormatter stringFromValue:displayType:unitController:formatString:](self, "stringFromValue:displayType:unitController:formatString:", v11, v10, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
