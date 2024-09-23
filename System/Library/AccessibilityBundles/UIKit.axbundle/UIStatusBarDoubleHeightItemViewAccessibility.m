@implementation UIStatusBarDoubleHeightItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIStatusBarDoubleHeightItemView");
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
  return (id)-[UIStatusBarDoubleHeightItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentsString"), a2, self);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;
  SEL v4;
  UIStatusBarDoubleHeightItemViewAccessibility *v5;

  v5 = self;
  v4 = a2;
  v3.receiver = self;
  v3.super_class = (Class)UIStatusBarDoubleHeightItemViewAccessibility;
  return -[UIStatusBarDoubleHeightItemViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB180];
}

@end
