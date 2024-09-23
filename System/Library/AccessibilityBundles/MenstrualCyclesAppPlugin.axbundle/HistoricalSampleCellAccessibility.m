@implementation HistoricalSampleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MenstrualCyclesAppPlugin.HistoricalSampleCell");
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
  v3.super_class = (Class)HistoricalSampleCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[HistoricalSampleCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
