@implementation HKHeightDisplayTypeValueFormatter

- (BOOL)_unitsAreFeetWithDisplayType:(id)a3 unitController:(id)a4
{
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a4, "unitForDisplayType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6CD0], "footUnit");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  return v6;
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return -[HKHeightDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:", a3, a4, a5, a6, a7, 1);
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  objc_super v29;

  v8 = a8;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a3;
  if (-[HKHeightDisplayTypeValueFormatter _unitsAreFeetWithDisplayType:unitController:](self, "_unitsAreFeetWithDisplayType:unitController:", v14, v15))
  {
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    HKFormattedFeetAndInches(v20);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    HKGenerateAttributedStringsWithUnitValue(v28, &stru_1E9C4C428, v16, v17, 0, v8);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E9C4C428);
    objc_msgSend(v21, "addObject:", v22);
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:", &stru_1E9C4C428);
    objc_msgSend(v21, "addObject:", v23);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("QUANTITY_VALUE_FORMAT_STRING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    HKUIJoinAttributedStringsWithFormat(v21, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v29.receiver = self;
    v29.super_class = (Class)HKHeightDisplayTypeValueFormatter;
    -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:](&v29, sel_attributedStringFromValue_displayType_unitController_valueFont_unitFont_formatForChart_, v18, v14, v15, v16, v17, v8);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v26;
}

- (id)stringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (-[HKHeightDisplayTypeValueFormatter _unitsAreFeetWithDisplayType:unitController:](self, "_unitsAreFeetWithDisplayType:unitController:", v9, v10))
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKHeightDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:", v8, v9, v10, v11, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "string");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15.receiver = self;
    v15.super_class = (Class)HKHeightDisplayTypeValueFormatter;
    -[HKQuantityDisplayTypeValueFormatter stringFromValue:displayType:unitController:](&v15, sel_stringFromValue_displayType_unitController_, v8, v9, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

@end
