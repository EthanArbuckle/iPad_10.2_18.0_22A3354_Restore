@implementation COSSOSTriggerAnimationCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSSOSTriggerAnimationCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("emergency.trigger.animation"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
