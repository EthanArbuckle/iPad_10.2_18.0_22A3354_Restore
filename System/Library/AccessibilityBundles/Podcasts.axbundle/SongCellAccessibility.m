@implementation SongCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("NowPlayingUI.SongCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityTrackNumberString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityArtistName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityAlbumTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityDuration"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityIsExplicit"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityIsPopular"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityIsAddButtonSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityIsVideoTrack"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityWantsNowPlayingIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NowPlayingUI.SongCell"), CFSTR("accessibilityPlaybackState"), "q", 0);
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("UICollectionViewTableCell"), CFSTR("tableLayout"), CFSTR("_tableLayout"), 0, "@");
  objc_msgSend(v3, "validateClass:", CFSTR("NowPlayingUI.CompositeCollectionViewAwareTableCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NowPlayingUI.SongCell"), CFSTR("NowPlayingUI.CompositeCollectionViewAwareTableCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("NowPlayingUI.SongCell"), CFSTR("UICollectionViewTableCell"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("NowPlayingUI.CompositeCollectionViewAwareTableCell"), CFSTR("collectionView"), "@");

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
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v19;

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTrackNumberString"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsVideoTrack")))
  {
    accessibilityLocalizedString(CFSTR("video.artwork"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityArtistName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAlbumTitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SongCellAccessibility safeDoubleForKey:](self, "safeDoubleForKey:", CFSTR("accessibilityDuration"));
  if (v12 <= 0.00000011920929)
  {
    v13 = 0;
  }
  else
  {
    AXDurationStringForDuration();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExplicit")))
  {
    accessibilityLocalizedString(CFSTR("explicit"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsPopular")))
  {
    accessibilityLocalizedString(CFSTR("popular"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  if (-[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityWantsNowPlayingIndicator")))v16 = -[SongCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("accessibilityPlaybackState"));
  else
    v16 = 0;
  -[SongCellAccessibility _accessibilityLabelForPlaybackState:](self, "_accessibilityLabelForPlaybackState:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
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
  unint64_t v3;
  int v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SongCellAccessibility;
  v3 = *MEMORY[0x24BDF73B0] | -[SongCellAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SongCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsAddButtonSelected"));
  v5 = *MEMORY[0x24BDF7400];
  if (!v4)
    v5 = 0;
  return v3 | v5;
}

- (BOOL)_axPerformCustomAction:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXSongCellActionKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v7 = v5;
    AXPerformSafeBlock();

  }
  return 1;
}

void __48__SongCellAccessibility__axPerformCustomAction___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "handler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *))v3 + 2))(v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), &__block_literal_global_3);

  }
}

- (id)_accessibilityIndexPathForCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexPathForCell:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_privateAccessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SongCellAccessibility _accessibilityIndexPathForCell](self, "_accessibilityIndexPathForCell");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SongCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tableLayout"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7 = v4 == 0;
  else
    v7 = 1;
  if (!v7 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "contextualActionForDeletingRowAtIndexPath:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "title");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = objc_alloc(MEMORY[0x24BDF6788]);
        objc_msgSend(v9, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v12, "initWithName:target:selector:", v13, self, sel__axPerformCustomAction_);

        objc_msgSend(v14, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("AXSongCellActionKey"));
        objc_msgSend(v3, "axSafelyAddObject:", v14);

      }
    }

  }
  return v3;
}

@end
