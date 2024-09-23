@implementation ABCarouselViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ABCarouselView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

@end
