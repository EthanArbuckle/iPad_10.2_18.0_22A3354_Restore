@implementation SearchTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Arcade.SearchTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchTextFieldAccessibility;
  return *MEMORY[0x24BDF73F8] | -[SearchTextFieldAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (unint64_t)_accessibilityAutomationType
{
  return 45;
}

@end
