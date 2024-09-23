@implementation _UIStatusBarActivityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarActivityView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("status.activity.inprogress"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIStatusBarActivityViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarActivityViewAccessibility;
  return -[_UIStatusBarActivityViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

@end
