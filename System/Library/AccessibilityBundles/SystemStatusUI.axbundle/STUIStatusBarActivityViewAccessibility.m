@implementation STUIStatusBarActivityViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarActivityView");
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

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarActivityViewAccessibility;
  return *MEMORY[0x24BEBB180] | -[STUIStatusBarActivityViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB0F8];
}

@end
