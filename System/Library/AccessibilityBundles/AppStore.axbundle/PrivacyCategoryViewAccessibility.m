@implementation PrivacyCategoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppStore.PrivacyCategoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.PrivacyCategoryView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AppStore.PrivacyCategoryView"), CFSTR("accessibilityDataTypesLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  return (id)-[PrivacyCategoryViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTitleLabel, accessibilityDataTypesLabel"));
}

@end
