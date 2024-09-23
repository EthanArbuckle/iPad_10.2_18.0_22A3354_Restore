@implementation WDElectrocardiogramSetupWatchImageViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDElectrocardiogramSetupWatchImageView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("simulated.watch.ecg"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
