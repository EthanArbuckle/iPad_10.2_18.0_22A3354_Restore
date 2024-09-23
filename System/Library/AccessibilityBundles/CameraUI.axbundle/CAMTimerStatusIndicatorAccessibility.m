@implementation CAMTimerStatusIndicatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMTimerStatusIndicator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMTimerStatusIndicator"), CFSTR("timerDuration"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityCameraKitLocalizedString(CFSTR("timer.button"));
}

- (id)accessibilityValue
{
  uint64_t v2;
  __n128 v3;

  v2 = -[CAMTimerStatusIndicatorAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("timerDuration"));
  return accessibilityStringForTimeDuration(v2, v3);
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMTimerStatusIndicatorAccessibility;
  return *MEMORY[0x24BDF73B0] | -[CAMTimerStatusIndicatorAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
