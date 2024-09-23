@implementation PKBorderedButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKBorderedButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73D0] | *MEMORY[0x24BDF73F0];
}

@end
