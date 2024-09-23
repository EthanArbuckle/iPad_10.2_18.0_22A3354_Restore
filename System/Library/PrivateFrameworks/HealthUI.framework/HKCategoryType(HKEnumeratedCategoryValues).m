@implementation HKCategoryType(HKEnumeratedCategoryValues)

- (id)hk_enumeratedCategoryValueLabelsWithHealthStore:()HKEnumeratedCategoryValues
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = (void *)MEMORY[0x1E0CB6978];
  v5 = a3;
  objc_msgSend(a1, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "categoryTypeForIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HKDisplayTypeController sharedInstanceForHealthStore:](HKDisplayTypeController, "sharedInstanceForHealthStore:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "displayTypeForObjectType:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HKDisplayType hk_enumeratedValueLabelsWithDisplayTypeIdentifier:](HKDisplayType, "hk_enumeratedValueLabelsWithDisplayTypeIdentifier:", objc_msgSend(v9, "displayTypeIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end
