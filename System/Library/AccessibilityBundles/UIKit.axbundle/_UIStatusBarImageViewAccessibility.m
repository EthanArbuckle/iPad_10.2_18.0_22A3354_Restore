@implementation _UIStatusBarImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBarImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  _UIStatusBarImageViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarImageViewAccessibility;
  return -[_UIStatusBarImageViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180] | *MEMORY[0x24BEBB0F8];
}

- (id)accessibilityHint
{
  return AXStatusBarItemHint(self);
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

@end
