@implementation VKCCornerLookupButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKCCornerLookupButton");
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
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCCornerLookupButton"), CFSTR("_symbolNameForItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCCornerLookupButton"), CFSTR("resultItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKCVisualSearchResultItem"), CFSTR("domainInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MADVIVisualSearchGatingDomainInfo"), CFSTR("domain"), "@", 0);

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

  -[VKCCornerLookupButtonAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("_symbolNameForItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKCCornerLookupButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("resultItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("domainInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "safeStringForKey:", CFSTR("domain"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLookupButtonName(v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_accessibilityIncludeRoleDescription
{
  return 1;
}

- (id)_accessibilityRoleDescription
{
  return accessibilityLocalizedString(CFSTR("lookup.role.description"));
}

@end
