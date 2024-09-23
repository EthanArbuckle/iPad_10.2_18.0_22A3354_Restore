@implementation SKUIFlexibleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIFlexibleSegmentedControl");
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
