@implementation AVTurboModePlaybackControlsPlaceholderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTurboModePlaybackControlsPlaceholderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTurboModePlaybackControlsPlaceholderView"), CFSTR("prominentPlayButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTurboModePlaybackControlsPlaceholderView"), CFSTR("_makeProminentPlayButtonAndContainer"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTurboModePlaybackControlsPlaceholderViewAccessibility;
  -[AVTurboModePlaybackControlsPlaceholderViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("play.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("prominentPlayButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v3);

}

- (id)_makeProminentPlayButtonAndContainer
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVTurboModePlaybackControlsPlaceholderViewAccessibility;
  -[AVTurboModePlaybackControlsPlaceholderViewAccessibility _makeProminentPlayButtonAndContainer](&v5, sel__makeProminentPlayButtonAndContainer);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTurboModePlaybackControlsPlaceholderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end
