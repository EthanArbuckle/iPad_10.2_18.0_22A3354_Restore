@implementation InteractiveTimelineLegendLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.InteractiveTimelineLegendLabel");
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
