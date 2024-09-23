@implementation SBElasticSliderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBElasticSliderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return AXDoesRequestingClientDeserveAutomation() == 0;
}

@end
