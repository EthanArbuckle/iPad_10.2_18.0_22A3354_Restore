@implementation DataTypeNoDataAvailableCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HealthExperienceUI.DataTypeNoDataAvailableCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DataTypeNoDataAvailableCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[DataTypeNoDataAvailableCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
