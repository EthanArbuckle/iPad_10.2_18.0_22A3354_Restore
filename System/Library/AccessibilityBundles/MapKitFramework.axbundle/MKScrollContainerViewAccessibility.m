@implementation MKScrollContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKScrollContainerView");
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
