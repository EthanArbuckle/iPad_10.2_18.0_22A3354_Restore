@implementation MRUNowPlayingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUNowPlayingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUNowPlayingView"), CFSTR("layout"), "q", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("media.controls.container.label"));
}

- (int64_t)accessibilityContainerType
{
  return 4
       * (-[MRUNowPlayingViewAccessibility _accessibilityNowPlayingLayout](self, "_accessibilityNowPlayingLayout") == 0);
}

- (int64_t)_accessibilityNowPlayingLayout
{
  return -[MRUNowPlayingViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("layout"));
}

@end
