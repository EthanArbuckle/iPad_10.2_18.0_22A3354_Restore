@implementation SurfaceSideMeasurementStackAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Measure.SurfaceSideMeasurementStack");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
