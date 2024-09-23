@implementation MetadataRibbonStarRatingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.MetadataRibbonStarRatingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonStarRatingView"), CFSTR("accessibilityStarRatingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonStarRatingView"), CFSTR("accessibilityRatingCountLabel"), "@", 0);

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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;

  -[MetadataRibbonStarRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRatingCountLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetadataRibbonStarRatingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityStarRatingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityAppStoreLocalizedString(CFSTR("user.ratings"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = &stru_2501601F8;
  }

  return v10;
}

@end
