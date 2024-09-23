@implementation CAMIntensityButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMIntensityButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("cam.intensity.button"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMIntensityButtonAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMIntensityButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
