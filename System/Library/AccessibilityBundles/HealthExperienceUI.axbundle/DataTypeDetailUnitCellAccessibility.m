@implementation DataTypeDetailUnitCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.DataTypeDetailUnitCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end
