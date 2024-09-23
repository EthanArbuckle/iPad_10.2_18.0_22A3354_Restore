@implementation _UIStatusBarNavigationItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarNavigationItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id v5;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  v5 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarNavigationItem");
  v4 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("applyUpdate:toDisplayItem:"), v4, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarItemUpdate"), CFSTR("data"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarData"), CFSTR("backNavigationEntry"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDataStringEntry"), CFSTR("stringValue"), v4, 0);
  objc_storeStrong(v6, v5);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  objc_super v3;
  SEL v4;
  _UIStatusBarNavigationItemAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  -[_UIStatusBarNavigationItemAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[_UIStatusBarNavigationItemAccessibility safeUIViewForKey:](v5, "safeUIViewForKey:", CFSTR("nameView"));
  objc_msgSend(v2, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AccessibilityStatusBarStringIsBreadcrumb"));
  objc_msgSend(v2, "setAccessibilityRespondsToUserInteraction:", 1);
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BEBB180] | *MEMORY[0x24BDF73B0]);
  objc_storeStrong(&v2, 0);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  objc_super v14;
  id v15;
  id v16;
  id location[2];
  _UIStatusBarNavigationItemAccessibility *v18;

  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v14.receiver = v18;
  v14.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  v15 = -[_UIStatusBarNavigationItemAccessibility applyUpdate:toDisplayItem:](&v14, sel_applyUpdate_toDisplayItem_, location[0], v16);
  v7 = (id)objc_msgSend(location[0], "safeValueForKey:", CFSTR("data"));
  v6 = (id)objc_msgSend(v7, "safeValueForKey:", CFSTR("backNavigationEntry"));
  v13 = (id)objc_msgSend(v6, "safeStringForKey:", CFSTR("stringValue"));

  v11 = (id)-[_UIStatusBarNavigationItemAccessibility safeUIViewForKey:](v18, "safeUIViewForKey:", CFSTR("nameView"));
  v8 = (void *)MEMORY[0x24BDD17C8];
  v10 = accessibilityLocalizedString(CFSTR("breadcrumb.return.to.app"));
  v9 = (id)objc_msgSend(v8, "stringWithFormat:", v13);
  objc_msgSend(v11, "setAccessibilityLabel:");

  v12 = v15;
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
  return v12;
}

- (_UIStatusBarNavigationItemAccessibility)init
{
  _UIStatusBarNavigationItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarNavigationItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarNavigationItemAccessibility;
  v6 = -[_UIStatusBarNavigationItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarNavigationItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

@end
