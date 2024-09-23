@implementation CSHomeAffordanceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSHomeAffordanceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73E8];
}

- (id)accessibilityLabel
{
  return accessibilitySBLocalizedString(CFSTR("home.affordance"));
}

- (id)accessibilityHint
{
  return accessibilitySBLocalizedString(CFSTR("home.affordance.coversheet.hint"));
}

@end
