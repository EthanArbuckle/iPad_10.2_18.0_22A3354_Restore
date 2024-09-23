@implementation SongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SongCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("accessibilityTrackNumberString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("artistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("albumTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("duration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("accessibilityIsExplicit"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("isPopular"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("isDisabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SongCell"), CFSTR("accessibilityIsVideoTrack"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("wantsNowPlayingIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("accessibilityLibraryStatusControl"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicApplication.SongCell"), CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("accessibilityMediaPickerAddButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIImageAsset"), CFSTR("assetName"), "@", 0);
  objc_msgSend(v3, "validateSwiftEnum:", CFSTR("MusicApplication.PlaybackIndicator[class].View"));
  objc_msgSend(v3, "validateSwiftEnum:hasCase:withSwiftType:", CFSTR("MusicApplication.PlaybackIndicator[class].View"), CFSTR("liveWaveform"), "WaveformPlayIndicator");
  objc_msgSend(v3, "validateSwiftEnum:", CFSTR("MusicCoreUI.WaveformPlayIndicator[class].Mode"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.WaveformPlayIndicator"), CFSTR("mode"), "Mode");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicApplication.HorizontalLockupCollectionViewCell"), CFSTR("playbackIndicatorView"), "Optional<View>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  id v23;
  void *v24;

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTrackNumberString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = objc_claimAutoreleasedReturnValue();

  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsVideoTrack")))
  {
    accessibilityMusicLocalizedString(CFSTR("video.artwork"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v24 = 0;
  }
  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("artistName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("albumTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)v8;
  -[SongCellAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("duration"));
  v12 = (void *)v6;
  if (v13 <= 0.00000011920929)
  {
    v14 = 0;
  }
  else
  {
    AXDurationStringForDuration();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v4;
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")))
  {
    accessibilityMusicLocalizedString(CFSTR("explicit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPopular")))
  {
    accessibilityMusicLocalizedString(CFSTR("popular"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isDisabled")))
  {
    accessibilityMusicLocalizedString(CFSTR("unavailable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = 0;
  }
  v18 = (void *)v10;
  if (-[SongCellAccessibility _isSongDownloaded](self, "_isSongDownloaded"))
  {
    accessibilityMusicLocalizedString(CFSTR("downloaded"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  -[SongCellAccessibility _axPlaybackStateLabel](self, "_axPlaybackStateLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v23 = (id)objc_claimAutoreleasedReturnValue();

  return v23;
}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2349175B8]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLibraryStatusControl"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SongCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SongCellAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityMediaPickerAddButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("selected"));

  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  v7 = v3 | v6;
  -[SongCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityLibraryStatusControl"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "_accessibilityViewIsVisible"))
    v7 |= objc_msgSend(v8, "accessibilityTraits");

  return v7;
}

- (BOOL)_isSongDownloaded
{
  void *v2;
  BOOL v3;

  -[SongCellAccessibility _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __42__SongCellAccessibility__isSongDownloaded__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v2 = a2;
  MEMORY[0x234917594](CFSTR("MusicCoreUI.SymbolButton"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("accessibilityImageView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "image");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "imageAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("assetName"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("arrow.down.circle.fill"));
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_axPlaybackStateLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  void *v7;

  -[SongCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("playbackIndicatorView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeSwiftEnumAssociatedObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("mode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeSwiftEnumCase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = CFSTR("paused");
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("paused")) & 1) == 0)
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("playing")) & 1) != 0
      || (objc_msgSend(v5, "isEqualToString:", CFSTR("simulated")) & 1) != 0)
    {
      v6 = CFSTR("now.playing");
    }
    else
    {
      v6 = CFSTR("buffering");
      if (!objc_msgSend(v5, "isEqualToString:", CFSTR("buffering")))
      {
        v7 = 0;
        goto LABEL_6;
      }
    }
  }
  accessibilityMusicLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v7;
}

@end
