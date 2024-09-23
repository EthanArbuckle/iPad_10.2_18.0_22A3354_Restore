@implementation STUIStatusBarCellularCondensedItemAccessibility

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  -[STUIStatusBarCellularCondensedItemAccessibility applyUpdate:toDisplayItem:](&v7, sel_applyUpdate_toDisplayItem_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[STUIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  -[STUIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[STUIStatusBarCellularCondensedItemAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dualSignalView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("topSignalView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeUIViewForKey:", CFSTR("bottomSignalView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", CFSTR("status.signal.bars"), CFSTR("AccessibilityStatusBarSignalViewLabelKey"));

}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarCellularCondensedItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularCondensedItem"), CFSTR("applyUpdate:toDisplayItem:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarCellularCondensedItem"), CFSTR("dualSignalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDualCellularSignalView"), CFSTR("topSignalView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDualCellularSignalView"), CFSTR("bottomSignalView"), "@", 0);

}

- (STUIStatusBarCellularCondensedItemAccessibility)init
{
  STUIStatusBarCellularCondensedItemAccessibility *v2;
  STUIStatusBarCellularCondensedItemAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarCellularCondensedItemAccessibility;
  v2 = -[STUIStatusBarCellularCondensedItemAccessibility init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[STUIStatusBarCellularCondensedItemAccessibility _accessibilityLoadAccessibilityInformation](v2, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
