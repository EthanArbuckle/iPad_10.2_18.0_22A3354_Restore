@implementation HKQuantity(Formatting)

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

- (uint64_t)unitStringForType:()Formatting parameters:
{
  return objc_msgSend(a4, "unitString:quantity:", a3, a1);
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

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "valueString:quantity:", v7, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString:quantity:", v7, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "hasSpaceBetweenValueAndUnit");
  HKFormatValueAndUnitWithSpaceBetweenValueAndUnit(v8, v9, (int)v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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
  int v14;
  void *v15;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "valueString:quantity:", v7, a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unitString:quantity:", v7, a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "valueFont");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v6, "valueFont");
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueValueFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "unitFont");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v6, "unitFont");
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "hk_chartCurrentValueUnitFont");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v6, "useColor");
  objc_msgSend(v6, "hasSpaceBetweenValueAndUnit");
  HKFormatAttributedValueAndUnitWithSpaceBetweenValueAndUnit(v8, v9, v11, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end
