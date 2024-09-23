@implementation SOSTriggerAnimationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SOSTriggerAnimationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("TRIGGER_ANIMATION"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
