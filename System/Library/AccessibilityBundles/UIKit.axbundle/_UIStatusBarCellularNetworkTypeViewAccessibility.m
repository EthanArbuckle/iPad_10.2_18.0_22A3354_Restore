@implementation _UIStatusBarCellularNetworkTypeViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarCellularNetworkTypeView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:isKindOfClass:");
  objc_msgSend(location[0], "validateClass:hasProperty:withType:", CFSTR("_UIStatusBarCellularNetworkTypeView"), CFSTR("type"), "q");
  objc_storeStrong(location, 0);
}

- (id)accessibilityLabel
{
  id v3;
  id obj;
  void *v5;
  SEL v6;
  _UIStatusBarCellularNetworkTypeViewAccessibility *v7;

  v7 = self;
  v6 = a2;
  v5 = (void *)-[_UIStatusBarCellularNetworkTypeViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("type"));
  obj = axAnnotateDataNetworkViewWithType(v5);
  v3 = accessibilityLocalizedString(obj);
  objc_storeStrong(&obj, 0);
  return v3;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIStatusBarCellularNetworkTypeViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarCellularNetworkTypeViewAccessibility;
  return -[_UIStatusBarCellularNetworkTypeViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
