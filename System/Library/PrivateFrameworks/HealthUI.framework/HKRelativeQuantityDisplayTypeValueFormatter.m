@implementation HKRelativeQuantityDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8 unitFormatString:(id)a9 formatString:(id)a10
{
  _BOOL8 v10;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  double v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id *v32;
  uint64_t *v33;
  double v34;
  id v35;
  id v36;
  void *v37;
  id v39;
  void *v40;
  id v41;
  id v42;
  objc_super v43;
  uint64_t v44;
  id v45;
  uint64_t v46;
  _QWORD v47[2];

  v10 = a8;
  v47[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  v22 = a10;
  objc_msgSend(v16, "doubleValue");
  if (v23 == 1.79769313e308)
  {
    v41 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("ESTABLISHING_BASELINE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v25 = v21;
    v26 = v22;
    v27 = v20;
    v28 = v18;
    v29 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = *MEMORY[0x1E0DC1138];
    v47[0] = v19;
    v31 = (void *)MEMORY[0x1E0C99D80];
    v32 = (id *)v47;
    v33 = &v46;
LABEL_5:
    objc_msgSend(v31, "dictionaryWithObjects:forKeys:count:", v32, v33, 1);
    v35 = v16;
    v36 = v19;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = (id)objc_msgSend(v41, "initWithString:attributes:", v30, v37);

    v19 = v36;
    v16 = v35;

    v17 = v29;
    v18 = v28;
    v20 = v27;
    v22 = v26;
    v21 = v25;

    goto LABEL_6;
  }
  objc_msgSend(v16, "doubleValue");
  if (v34 == -1.79769313e308)
  {
    v41 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("NOT_ENOUGH_DATA"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v25 = v21;
    v26 = v22;
    v27 = v20;
    v28 = v18;
    v29 = v17;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0DC1138];
    v45 = v19;
    v31 = (void *)MEMORY[0x1E0C99D80];
    v32 = &v45;
    v33 = &v44;
    goto LABEL_5;
  }
  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v39 = v19;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "localizedStringForKey:value:table:", CFSTR("%@_DEGREES_FROM_BASELINE_UNIT"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
    v21 = (id)objc_claimAutoreleasedReturnValue();

    v19 = v39;
  }
  v43.receiver = self;
  v43.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
  -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:formatString:](&v43, sel_attributedStringFromValue_displayType_unitController_valueFont_unitFont_formatForChart_unitFormatString_formatString_, v16, v17, v18, v19, v20, v10, v21, v22);
  v42 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v42;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 formatString:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  void *v15;
  void *v16;
  const __CFString *v17;
  double v18;
  void *v19;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v10, "doubleValue");
  if (v14 == 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("ESTABLISHING_BASELINE");
  }
  else
  {
    objc_msgSend(v10, "doubleValue");
    if (v18 != -1.79769313e308)
    {
      v21.receiver = self;
      v21.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
      -[HKQuantityDisplayTypeValueFormatter stringFromValue:displayType:unitController:formatString:](&v21, sel_stringFromValue_displayType_unitController_formatString_, v10, v11, v12, v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    v17 = CFSTR("NOT_ENOUGH_DATA");
  }
  objc_msgSend(v15, "localizedStringForKey:value:table:", v17, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v19;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  double v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  double v15;
  void *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v8, "doubleValue");
  if (v11 == 1.79769313e308)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("ESTABLISHING_BASELINE");
  }
  else
  {
    objc_msgSend(v8, "doubleValue");
    if (v15 != -1.79769313e308)
    {
      v18.receiver = self;
      v18.super_class = (Class)HKRelativeQuantityDisplayTypeValueFormatter;
      -[HKQuantityDisplayTypeValueFormatter stringFromValue:displayType:unitController:](&v18, sel_stringFromValue_displayType_unitController_, v8, v9, v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = CFSTR("NOT_ENOUGH_DATA");
  }
  objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E9C4C428, CFSTR("HealthUI-Localizable-Kali"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v16;
}

@end
