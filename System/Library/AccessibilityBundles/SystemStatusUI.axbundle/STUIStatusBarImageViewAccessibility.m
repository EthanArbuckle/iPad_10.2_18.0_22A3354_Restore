@implementation STUIStatusBarImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)STUIStatusBarImageViewAccessibility;
  return *MEMORY[0x24BEBB180] | -[STUIStatusBarImageViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) | *MEMORY[0x24BEBB0F8];
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

@end
