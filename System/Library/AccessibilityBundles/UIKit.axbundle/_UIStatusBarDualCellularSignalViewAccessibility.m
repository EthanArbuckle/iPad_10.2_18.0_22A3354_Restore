@implementation _UIStatusBarDualCellularSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarDualCellularSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarDualCellularSignalView");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v4 = "_UIStatusBarCellularSignalView";
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_topSignalView"));
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v3, CFSTR("_bottomSignalView"), v4);
  objc_storeStrong(v6, obj);
}

- (void)_commonInit
{
  objc_super v2;
  SEL v3;
  _UIStatusBarDualCellularSignalViewAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)_UIStatusBarDualCellularSignalViewAccessibility;
  -[_UIStatusBarDualCellularSignalViewAccessibility _commonInit](&v2, sel__commonInit);
  -[_UIStatusBarDualCellularSignalViewAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  _UIStatusBarDualCellularSignalViewAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)_UIStatusBarDualCellularSignalViewAccessibility;
  -[_UIStatusBarDualCellularSignalViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  v2 = (id)-[_UIStatusBarDualCellularSignalViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_topSignalView"));
  objc_msgSend(v2, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("PrimaryCellular"));

  v3 = (id)-[_UIStatusBarDualCellularSignalViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_bottomSignalView"));
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("SecondaryCellular"));

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
