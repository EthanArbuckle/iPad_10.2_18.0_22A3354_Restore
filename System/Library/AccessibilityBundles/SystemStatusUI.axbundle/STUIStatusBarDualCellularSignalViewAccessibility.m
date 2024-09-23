@implementation STUIStatusBarDualCellularSignalViewAccessibility

- (void)_commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarDualCellularSignalViewAccessibility;
  -[STUIStatusBarDualCellularSignalViewAccessibility _commonInit](&v3, sel__commonInit);
  -[STUIStatusBarDualCellularSignalViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarDualCellularSignalViewAccessibility;
  -[STUIStatusBarDualCellularSignalViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarDualCellularSignalViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_topSignalView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("PrimaryCellular"));

  -[STUIStatusBarDualCellularSignalViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bottomSignalView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("SecondaryCellular"));

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarDualCellularSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDualCellularSignalView"), CFSTR("_commonInit"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUIStatusBarDualCellularSignalView"), CFSTR("_topSignalView"), "STUIStatusBarCellularSignalView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUIStatusBarDualCellularSignalView"), CFSTR("_bottomSignalView"), "STUIStatusBarCellularSignalView");

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
