@implementation EpisodeInfoViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ShelfKitCollectionViews.EpisodeInfoView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityIsNowPlayingIndicatorVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityEyebrowLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ShelfKitCollectionViews.EpisodeInfoView"), CFSTR("accessibilityFooterLabel"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;

  if (-[EpisodeInfoViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsNowPlayingIndicatorVisible")))
  {
    -[EpisodeInfoViewAccessibility _accessibilityLabelForPlaybackState:](self, "_accessibilityLabelForPlaybackState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  -[EpisodeInfoViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityEyebrowLabel, accessibilityTitleLabel, accessibilityFooterLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityStripUnfavorableCharacters(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_accessibilityLabelForPlaybackState:(BOOL)a3
{
  __CFString *v3;

  if (a3)
    v3 = CFSTR("now.playing");
  else
    v3 = CFSTR("paused");
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
