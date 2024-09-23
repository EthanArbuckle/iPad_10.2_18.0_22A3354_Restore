@implementation ShowMetadataViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.ShowMetadataView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ShowMetadataView"), CFSTR("label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ShowMetadataView"), CFSTR("rating"), "Float");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ShelfKitCollectionViews.ShowMetadataView"), CFSTR("numberFormatter"), "NSNumberFormatter");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  float v6;
  float v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  objc_opt_class();
  -[ShowMetadataViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ShowMetadataViewAccessibility safeSwiftFloatForKey:](self, "safeSwiftFloatForKey:", CFSTR("rating"));
  v7 = v6;
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("stars.count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", v9, (float)(roundf(v7 * 10.0) / 10.0));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ShowMetadataViewAccessibility safeSwiftIntForKey:](self, "safeSwiftIntForKey:", CFSTR("numberOfRatings"));
  v12 = v11 + 50 - (unsigned __int16)(v11 + 50) % 0x64u;
  if (v11 < 1000)
    v12 = v11;
  if (v11 >= 10000)
    v13 = 1000 * ((v11 + 500) / 1000);
  else
    v13 = v12;
  v14 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("ratings.count"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("·"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v10, v16, 0);
  if (objc_msgSend(v17, "count"))
  {
    objc_msgSend(v17, "subarrayWithRange:", 1, objc_msgSend(v17, "count") - 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "axSafelyAddObjectsFromArray:", v19);

  }
  objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (id)ratingFormatter
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v2, "setNumberStyle:", 1);
  return v2;
}

@end
