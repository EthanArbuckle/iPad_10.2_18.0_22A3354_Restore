@implementation CCUIIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIIconScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

@end
