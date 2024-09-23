@implementation StoryCardCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AppInstallExtension.StoryCardCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.StoryCardCollectionViewCell"), CFSTR("infoLayer"), "TodayCardInfoLayerView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.TodayCardInfoLayerView"), CFSTR("overlay"), "Optional<AnyTodayCardCellOverlay>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.TodayCardInfoLayerView"), CFSTR("labelsView"), "TodayCardLabelsView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.StoryCardCollectionViewCell"), CFSTR("mediaBackgroundView"), "StoryCardMediaView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.StoryCardMediaView"), CFSTR("revealingVideoView"), "RevealingVideoView");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.RevealingVideoView"), CFSTR("videoView"), "Optional<TodayCardVideoView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppInstallExtension.VideoView"), CFSTR("playButton"), "PlayButton");
  objc_msgSend(v3, "validateClass:", CFSTR("AVVolumeButtonControl"));

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[StoryCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("mediaBackgroundView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftValueForKey:", CFSTR("revealingVideoView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeSwiftValueForKey:", CFSTR("videoView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeSwiftValueForKey:", CFSTR("playButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeCGFloatForKey:", CFSTR("alpha"));
  if (v8 > 0.0)
    objc_msgSend(v3, "axSafelyAddObject:", v7);
  objc_msgSend(v6, "_accessibilityDescendantOfType:", MEMORY[0x234905BBC](CFSTR("AVVolumeButtonControl")));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v9);
  -[StoryCardCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("infoLayer"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeSwiftValueForKey:", CFSTR("labelsView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIsAccessibilityElement:", 1);
  objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
  objc_msgSend(v3, "axSafelyAddObject:", v11);
  objc_msgSend(v10, "safeSwiftValueForKey:", CFSTR("overlay"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v12);

  return v3;
}

@end
