@implementation AccountActionSectionFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.AccountActionSectionFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASMessagesProvider.AccountActionSectionFooterView"), CFSTR("accessibilityTextLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AppStoreKit.DynamicTypeLabel"), CFSTR("UILabel"));

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[AccountActionSectionFooterViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTextLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length") != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityLabel
{
  return (id)-[AccountActionSectionFooterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityTextLabel"));
}

@end
