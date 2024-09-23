@implementation _FCUIActivityPickerOnboardingDismissControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_FCUIActivityPickerOnboardingDismissControl");
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
  return accessibilityLocalizedString(CFSTR("close.button"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)accessibilityActivate
{
  _BOOL4 v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_FCUIActivityPickerOnboardingDismissControlAccessibility;
  v2 = -[_FCUIActivityPickerOnboardingDismissControlAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
  if (v2)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  return v2;
}

@end
