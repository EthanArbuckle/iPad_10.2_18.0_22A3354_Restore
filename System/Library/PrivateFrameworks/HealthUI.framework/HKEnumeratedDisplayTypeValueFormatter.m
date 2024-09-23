@implementation HKEnumeratedDisplayTypeValueFormatter

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7
{
  return -[HKEnumeratedDisplayTypeValueFormatter attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:](self, "attributedStringFromValue:displayType:unitController:valueFont:unitFont:formatForChart:", a3, a4, a5, a6, a7, 1);
}

- (id)attributedStringFromValue:(id)a3 displayType:(id)a4 unitController:(id)a5 valueFont:(id)a6 unitFont:(id)a7 formatForChart:(BOOL)a8
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a6;
  v12 = a4;
  objc_msgSend(v10, "numberWithInteger:", objc_msgSend(a3, "integerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_enumeratedValueLabels");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "objectForKeyedSubscript:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    HKLocalizedNoDataString();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v16 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  HKAttributedStringAttributesForFont(v11, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = (void *)objc_msgSend(v16, "initWithString:attributes:", v15, v18);
  return v19;
}

@end
