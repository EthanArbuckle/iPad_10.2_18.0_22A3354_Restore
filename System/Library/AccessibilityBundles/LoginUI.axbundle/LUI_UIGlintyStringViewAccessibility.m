@implementation LUI_UIGlintyStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIGlintyStringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
