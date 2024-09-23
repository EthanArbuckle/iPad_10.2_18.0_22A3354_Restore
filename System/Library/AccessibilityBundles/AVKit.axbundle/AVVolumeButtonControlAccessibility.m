@implementation AVVolumeButtonControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVVolumeButtonControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("AVVolumeButtonControl"), CFSTR("UIControl"));
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("volume.button"));
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVVolumeButtonControlAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AVVolumeButtonControlAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
