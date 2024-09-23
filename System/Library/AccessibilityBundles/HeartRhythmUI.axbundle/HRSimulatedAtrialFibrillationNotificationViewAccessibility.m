@implementation HRSimulatedAtrialFibrillationNotificationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HRSimulatedAtrialFibrillationNotificationView");
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
  return accessibilityAntimonyLocalizedString(CFSTR("simulated.afib.notification"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
