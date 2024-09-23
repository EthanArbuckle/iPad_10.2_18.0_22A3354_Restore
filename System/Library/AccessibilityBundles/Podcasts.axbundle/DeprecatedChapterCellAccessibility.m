@implementation DeprecatedChapterCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.DeprecatedChapterCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.DeprecatedChapterCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.DeprecatedChapterCell"), CFSTR("accessibilityDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.DeprecatedChapterCell"), CFSTR("accessibilityWantsNowPlayingIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.DeprecatedChapterCell"), CFSTR("accessibilityPlaybackState"), "q", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v10;

  objc_opt_class();
  -[DeprecatedChapterCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DeprecatedChapterCellAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityDuration"));
  if (v5 <= 0.00000011920929)
  {
    v6 = 0;
  }
  else
  {
    AXDurationStringForDuration();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[DeprecatedChapterCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityWantsNowPlayingIndicator")))v7 = -[DeprecatedChapterCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityPlaybackState"));
  else
    v7 = 0;
  -[DeprecatedChapterCellAccessibility _accessibilityLabelForPlaybackState:](self, "_accessibilityLabelForPlaybackState:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_accessibilityLabelForPlaybackState:(int64_t)a3
{
  __CFString *v3;

  if (a3 == 2)
  {
    v3 = CFSTR("paused");
  }
  else
  {
    if (a3 != 1)
      return 0;
    v3 = CFSTR("now.playing");
  }
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DeprecatedChapterCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[DeprecatedChapterCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
