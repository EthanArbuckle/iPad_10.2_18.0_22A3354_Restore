@implementation STUIStatusBarCellularNetworkTypeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarCellularNetworkTypeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarCellularNetworkTypeView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("STUIStatusBarCellularNetworkTypeView"), CFSTR("type"), "q");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  AXAnnotateDataNetworkViewWithType(-[STUIStatusBarCellularNetworkTypeViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("type")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarCellularNetworkTypeViewAccessibility;
  return *MEMORY[0x24BEBB180] | -[STUIStatusBarCellularNetworkTypeViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
