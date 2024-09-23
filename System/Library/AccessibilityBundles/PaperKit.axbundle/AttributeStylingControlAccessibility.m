@implementation AttributeStylingControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PaperKit.AttributeStylingControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PaperKit.AttributeStylingControl"), CFSTR("titleLabel"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
