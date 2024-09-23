@implementation HKPercentageDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return -[HKPercentageDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:", a3, a4, a5, a6, a7, 1);
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  return -[HKPercentageDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:", a3, a4, a5, a6, a7, a8, 0);
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
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("PERCENTAGE_QUANTITY_VALUE_FORMAT_STRING"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:formatString:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:unitFormatString:formatString:", v22, v21, v20, v19, v18, v9, v17, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
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
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PERCENTAGE_QUANTITY_TYPE_DISPLAY_FORMAT %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKQuantityDisplayTypeValueFormatter stringFromValue:displayType:unitController:formatString:](self, "stringFromValue:displayType:unitController:formatString:", v11, v10, v9, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

@end
