@implementation _UIStatusBarCellularCondensedItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarCellularCondensedItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const char *v5;
  id v6;
  id *v7;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v7 = location;
  v6 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = "@";
  v3 = CFSTR("_UIStatusBarCellularCondensedItem");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", "@", "@", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("dualSignalView"), v5, 0);
  v4 = CFSTR("_UIStatusBarDualCellularSignalView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("bottomSignalView"), v5, 0);
  objc_storeStrong(v7, v6);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  objc_super v5;
  SEL v6;
  _UIStatusBarCellularCondensedItemAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  -[_UIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  v4 = (id)-[_UIStatusBarCellularCondensedItemAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("dualSignalView"));
  v3 = (id)objc_msgSend(v4, "safeUIViewForKey:", CFSTR("topSignalView"));
  v2 = (id)objc_msgSend(v4, "safeUIViewForKey:", CFSTR("bottomSignalView"));
  objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:");
  objc_msgSend(v2, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  objc_storeStrong(&v2, 0);
  objc_storeStrong(&v3, 0);
  objc_storeStrong(&v4, 0);
}

- (_UIStatusBarCellularCondensedItemAccessibility)init
{
  _UIStatusBarCellularCondensedItemAccessibility *v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarCellularCondensedItemAccessibility *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  v6 = -[_UIStatusBarCellularCondensedItemAccessibility init](&v4, sel_init);
  objc_storeStrong((id *)&v6, v6);
  if (v6)
    -[_UIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6;
  objc_super v7;
  id v8;
  id v9;
  id location[2];
  _UIStatusBarCellularCondensedItemAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarCellularCondensedItemAccessibility;
  v8 = -[_UIStatusBarCellularCondensedItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, location[0], v9);
  -[_UIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](v11, "_accessibilityLoadAccessibilityInformation");
  v6 = v8;
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
  return v6;
}

@end
