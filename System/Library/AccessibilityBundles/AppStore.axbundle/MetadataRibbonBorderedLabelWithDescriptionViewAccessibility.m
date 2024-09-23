@implementation MetadataRibbonBorderedLabelWithDescriptionViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.MetadataRibbonBorderedLabelWithDescriptionView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonBorderedLabelWithDescriptionView"), CFSTR("accessibilityBorderedLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.MetadataRibbonBorderedLabelWithDescriptionView"), CFSTR("accessibilityDescriptionLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[MetadataRibbonBorderedLabelWithDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityBorderedLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MetadataRibbonBorderedLabelWithDescriptionViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDescriptionLabel"));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v3)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    __UIAXStringForVariables();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    accessibilityAppStoreLocalizedString(CFSTR("ranking.with.category"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

@end
