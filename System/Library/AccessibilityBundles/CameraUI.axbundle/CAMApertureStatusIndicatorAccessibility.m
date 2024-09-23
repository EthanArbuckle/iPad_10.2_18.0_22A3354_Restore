@implementation CAMApertureStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMApertureStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("depth.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMApertureStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMApertureStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
