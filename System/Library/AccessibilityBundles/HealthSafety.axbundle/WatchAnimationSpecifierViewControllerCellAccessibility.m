@implementation WatchAnimationSpecifierViewControllerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("Safety.WatchAnimationSpecifierViewControllerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("TRIGGER_ANIMATION_WATCH"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73C8];
}

@end
