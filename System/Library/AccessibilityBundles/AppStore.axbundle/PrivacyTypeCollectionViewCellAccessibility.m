@implementation PrivacyTypeCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.PrivacyTypeCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.PrivacyTypeCollectionViewCell"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.PrivacyTypeCollectionViewCell"), CFSTR("accessibilityDetailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.PrivacyTypeCollectionViewCell"), CFSTR("accessibilityCategoryViews"), "@", 0);

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
  void *v7;

  -[PrivacyTypeCollectionViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilityDetailLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PrivacyTypeCollectionViewCellAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityCategoryViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
