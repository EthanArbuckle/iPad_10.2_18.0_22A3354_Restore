@implementation MTActionButtonContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTActionButtonContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 1;
}

@end
