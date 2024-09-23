@implementation PhoneRootViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PhoneRootView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityAllowsSiblingsWhenOvergrown
{
  return 1;
}

@end
