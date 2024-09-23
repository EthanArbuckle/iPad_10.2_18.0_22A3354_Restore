@implementation WDClinicalOnboardingLocationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WDClinicalOnboardingLocationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF7410];
}

@end
