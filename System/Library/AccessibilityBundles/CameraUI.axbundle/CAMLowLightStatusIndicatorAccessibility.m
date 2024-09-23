@implementation CAMLowLightStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMLowLightStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMLowLightStatusIndicator"), CFSTR("duration"), "d", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraUILocalizedString(CFSTR("lowlight.button"));
}

- (id)accessibilityValue
{
  -[CAMLowLightStatusIndicatorAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  return (id)AXDurationStringForDuration();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMLowLightStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMLowLightStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
