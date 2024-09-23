@implementation TabSwitcherAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobileSafari.TabSwitcher");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobileSafari.TabSwitcher"), CFSTR("tabOverviewDisplayItem"), "TabOverviewDisplayItem");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TabSwitcherAccessibility;
  -[TabSwitcherAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[TabSwitcherAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("$__lazy_storage_$_tabOverviewDisplayItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

@end
