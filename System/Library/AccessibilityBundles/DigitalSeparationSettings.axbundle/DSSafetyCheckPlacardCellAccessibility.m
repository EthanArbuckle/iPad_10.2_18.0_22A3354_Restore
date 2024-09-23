@implementation DSSafetyCheckPlacardCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DigitalSeparationSettings.DSSafetyCheckPlacardCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E0];
}

@end
