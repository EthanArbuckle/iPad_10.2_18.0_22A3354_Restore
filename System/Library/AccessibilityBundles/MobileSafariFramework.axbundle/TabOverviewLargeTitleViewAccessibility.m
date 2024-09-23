@implementation TabOverviewLargeTitleViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.TabOverviewLargeTitleView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabOverviewLargeTitleView"), CFSTR("collaborationButtonWrapper"), "CollaborationButtonWrapper");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TabOverviewLargeTitleViewAccessibility;
  -[TabOverviewLargeTitleViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[TabOverviewLargeTitleViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("collaborationButtonWrapper"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMobileSafariLocalizedString(CFSTR("collaborate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("Collaborate"));
}

@end
