@implementation AVPlayerViewControllerContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlayerViewControllerContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewControllerContentView"), CFSTR("playbackControlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("AVPlaybackControlsView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_doneButton"), "AVButton");

}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  void *v3;
  char v4;

  -[AVPlayerViewControllerContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playbackControlsView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_doneButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityActivate");

  return v4;
}

@end
