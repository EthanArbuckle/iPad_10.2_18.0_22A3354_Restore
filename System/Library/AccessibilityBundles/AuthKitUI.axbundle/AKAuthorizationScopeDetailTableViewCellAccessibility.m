@implementation AKAuthorizationScopeDetailTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKAuthorizationScopeDetailTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("isChecked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("scopeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("mainLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("mainDetailLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("checkmarkStyle"), "Q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AKAuthorizationScopeDetailTableViewCell"), CFSTR("UITableViewCell"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKAuthorizationScopeDetailTableViewCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[AKAuthorizationScopeDetailTableViewCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[AKAuthorizationScopeDetailTableViewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isChecked"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (id)accessibilityLabel
{
  return (id)-[AKAuthorizationScopeDetailTableViewCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("scopeLabel, mainLabel, mainDetailLabel"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v4;
  void *v5;
  objc_super v6;

  if (-[AKAuthorizationScopeDetailTableViewCellAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("checkmarkStyle")))
  {
    v6.receiver = self;
    v6.super_class = (Class)AKAuthorizationScopeDetailTableViewCellAccessibility;
    -[AKAuthorizationScopeDetailTableViewCellAccessibility _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[AKAuthorizationScopeDetailTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessoryView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
}

@end
