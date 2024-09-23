@implementation CAMIntensityStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMIntensityStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("intensity.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMIntensityStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMIntensityStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
