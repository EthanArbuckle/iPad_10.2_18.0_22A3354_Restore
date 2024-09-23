@implementation VideosDetailHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VideosDetailHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VideosDetailHeaderView"), CFSTR("playButton"), "@", 0);
}

- (void)_axApplyPlayButtonLabel
{
  void *v2;
  id v3;

  -[VideosDetailHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("play.button"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v2);

  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("PlayButton"));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VideosDetailHeaderViewAccessibility;
  -[VideosDetailHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VideosDetailHeaderViewAccessibility _axApplyPlayButtonLabel](self, "_axApplyPlayButtonLabel");
}

- (id)playButton
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)VideosDetailHeaderViewAccessibility;
  -[VideosDetailHeaderViewAccessibility playButton](&v5, sel_playButton);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VideosDetailHeaderViewAccessibility _axApplyPlayButtonLabel](self, "_axApplyPlayButtonLabel");
  return v3;
}

@end
