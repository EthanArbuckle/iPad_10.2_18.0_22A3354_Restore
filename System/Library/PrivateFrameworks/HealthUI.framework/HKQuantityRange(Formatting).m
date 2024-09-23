@implementation HKQuantityRange(Formatting)

- (id)unitStringForType:()Formatting
{
  id v4;
  HKQuantityFormattingParameters *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  objc_msgSend(a1, "unitStringForType:parameters:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)unitStringForType:()Formatting parameters:
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "maximum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString:quantity:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)localizedStringForType:()Formatting
{
  id v4;
  HKQuantityFormattingParameters *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  objc_msgSend(a1, "localizedStringForType:parameters:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedStringForType:()Formatting parameters:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_valueStringForType:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString:quantity:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "hasSpaceBetweenValueAndUnit");
  HKFormatValueAndUnitWithSpaceBetweenValueAndUnit(v8, v10, (int)v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)localizedAttributedStringForType:()Formatting
{
  id v4;
  HKQuantityFormattingParameters *v5;
  void *v6;

  v4 = a3;
  v5 = objc_alloc_init(HKQuantityFormattingParameters);
  objc_msgSend(a1, "localizedAttributedStringForType:parameters:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)localizedAttributedStringForType:()Formatting parameters:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "_valueStringForType:parameters:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "maximum");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString:quantity:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v6, "valueFont");
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unitFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    objc_msgSend(v6, "unitFont");
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v6, "useColor");
  objc_msgSend(v6, "hasSpaceBetweenValueAndUnit");
  HKFormatAttributedValueAndUnitWithSpaceBetweenValueAndUnit(v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)_valueStringForType:()Formatting parameters:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "minimum");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueString:quantity:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "maximum");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueString:quantity:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", v11))
  {
    v12 = v9;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("RANGE_STRING %@ %@"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", v15, v9, v11);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

@end
