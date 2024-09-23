@implementation UIStatusBarItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id obj;
  id *v4;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v4 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIStatusBarItemView"), CFSTR("isVisible"), "B", 0);
  objc_storeStrong(v4, obj);
}

- (id)_accessibilityAddToDragSessionCustomAction
{
  return 0;
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (BOOL)accessibilityElementsHidden
{
  objc_super v3;
  SEL v4;
  UIStatusBarItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarItemViewAccessibility;
  if (-[UIStatusBarItemViewAccessibility accessibilityElementsHidden](&v3, sel_accessibilityElementsHidden))
    return 1;
  else
    return (-[UIStatusBarItemViewAccessibility safeBoolForKey:](v5, "safeBoolForKey:", CFSTR("isVisible")) ^ 1) & 1;
}

- (BOOL)_accessibilityIsNotFirstElement
{
  return 1;
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarItemViewAccessibility;
  return -[UIStatusBarItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
