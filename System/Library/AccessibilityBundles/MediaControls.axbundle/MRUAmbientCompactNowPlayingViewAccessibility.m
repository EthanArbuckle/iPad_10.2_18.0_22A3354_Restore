@implementation MRUAmbientCompactNowPlayingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUAmbientCompactNowPlayingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("media.controls.container.label"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilityShouldUseHostContextIDForTap
{
  return 1;
}

- (BOOL)_accessibilityShouldUseHostContextIDForLongPress
{
  return 1;
}

@end
