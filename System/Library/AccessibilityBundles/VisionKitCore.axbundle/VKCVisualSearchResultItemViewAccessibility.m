@implementation VKCVisualSearchResultItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCVisualSearchResultItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)axPositionInButtonsList
{
  JUMPOUT(0x23492485CLL);
}

- (void)_axSetPositionInButtonsList:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItemView"), CFSTR("_symbolNameForItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItemView"), CFSTR("visualSearchResultItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItem"), CFSTR("resultItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MADVIVisualSearchGatingResultItem"), CFSTR("domains"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MADVIVisualSearchGatingDomainInfo"), CFSTR("domain"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItemView"), CFSTR("lookupButton"), "@", 0);

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

  -[VKCVisualSearchResultItemViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_symbolNameForItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("visualSearchResultItem.resultItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeArrayForKey:", CFSTR("domains"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("domain"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  accessibilityLookupButtonName(v3, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)_accessibilityShouldIncludeParentCustomActions
{
  return 0;
}

- (BOOL)_accessibilityShouldIncludeParentCustomContent
{
  return 0;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("lookup.role.description"));
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCVisualSearchResultItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("lookupButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isHidden");

  if ((v6 & 1) == 0)
    objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

@end
