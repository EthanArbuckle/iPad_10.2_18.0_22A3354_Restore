@implementation HKElectrocardiogramChartViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKElectrocardiogramChartView");
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
