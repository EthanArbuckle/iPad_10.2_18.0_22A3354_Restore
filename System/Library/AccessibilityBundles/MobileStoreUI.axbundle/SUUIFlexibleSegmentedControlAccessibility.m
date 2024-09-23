@implementation SUUIFlexibleSegmentedControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIFlexibleSegmentedControl");
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
