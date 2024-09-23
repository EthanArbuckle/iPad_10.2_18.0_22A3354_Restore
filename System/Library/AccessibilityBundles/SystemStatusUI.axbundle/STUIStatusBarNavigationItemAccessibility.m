@implementation STUIStatusBarNavigationItemAccessibility

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  -[STUIStatusBarNavigationItemAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarNavigationItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsBreadcrumb"));
  objc_msgSend(v3, "setAccessibilityRespondsToUserInteraction:", 1);
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB180]);

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarNavigationItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarNavigationItem"), CFSTR("nameView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarNavigationItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItemUpdate"), CFSTR("data"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarData"), CFSTR("backNavigationEntry"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STStatusBarDataStringEntry"), CFSTR("stringValue"), "@", 0);

}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  v6 = a3;
  -[STUIStatusBarNavigationItemAccessibility applyUpdate:toDisplayItem:](&v16, sel_applyUpdate_toDisplayItem_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("data"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("backNavigationEntry"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeStringForKey:", CFSTR("stringValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[STUIStatusBarNavigationItemAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("nameView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("breadcrumb.return.to.app"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v14);

  return v7;
}

- (STUIStatusBarNavigationItemAccessibility)init
{
  STUIStatusBarNavigationItemAccessibility *v2;
  STUIStatusBarNavigationItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarNavigationItemAccessibility;
  v2 = -[STUIStatusBarNavigationItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarNavigationItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
