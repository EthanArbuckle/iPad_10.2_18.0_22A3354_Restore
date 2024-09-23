@implementation NowPlayingControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicNowPlayingControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)axMediaCommandNotificationRegistered
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)axSetMediaCommandNotificationRegistered:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)axAudioRouteNotificationRegistered
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)axSetAudioRouteNotificationRegistered:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)axLikedStateNotificationRegistered
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)axSetLikedStateNotificationRegistered:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("contextButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("leftButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("playPauseStopButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("rightButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("subtitleButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("dismissButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseItem"), CFSTR("likeCommand"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseItem"), CFSTR("dislikeCommand"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("MPCPlayerFeedbackCommand"), CFSTR("value"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("accessibilityNowPlayingResponse"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("setControlsHidden:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("tracklist"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponse"), CFSTR("state"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("accessibilityLyricsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("accessibilityQueueButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("shuffleType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("repeatType"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("playingItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseItem"), CFSTR("isAutoPlay"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPCPlayerResponseTracklist"), CFSTR("actionAtQueueEnd"), "q", 0);
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("areControlsHidden"), "Bool");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicNowPlayingControlsViewController"), CFSTR("accessibilityPlayingItemAudioTraitButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
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
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  id location[2];

  objc_opt_class();
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("AXNowPlayingTitleLabel"));
  LOBYTE(location[0]) = 0;
  objc_opt_class();
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subtitleButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = v6;
  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("AXNowPlayingSubtitleButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dismissButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityMusicLocalizedString(CFSTR("dismiss.now.playing.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  v19 = v7;
  objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("NowPlayingDismissButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("contextButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setIsAccessibilityElement:", 1);
  accessibilityMusicLocalizedString(CFSTR("more.button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("NowPlayingMoreButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("leftButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, self);
  v12 = MEMORY[0x24BDAC760];
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v30[3] = &unk_2502C9670;
  objc_copyWeak(&v31, location);
  objc_msgSend(v11, "_setAccessibilityLabelBlock:", v30);
  v18 = v4;
  v28[0] = v12;
  v28[1] = 3221225472;
  v28[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v28[3] = &unk_2502C9670;
  objc_copyWeak(&v29, location);
  objc_msgSend(v11, "_setAccessibilityValueBlock:", v28);
  v13 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v11, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("NowPlayingLeftButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playPauseStopButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v12;
  v26[1] = 3221225472;
  v26[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v26[3] = &unk_2502C9670;
  objc_copyWeak(&v27, location);
  objc_msgSend(v14, "_setAccessibilityLabelBlock:", v26);
  objc_msgSend(v14, "setAccessibilityIdentifier:", CFSTR("NowPlayingPlayPauseStopButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rightButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v12;
  v24[1] = 3221225472;
  v24[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v24[3] = &unk_2502C9670;
  objc_copyWeak(&v25, location);
  objc_msgSend(v15, "_setAccessibilityLabelBlock:", v24);
  objc_msgSend(v15, "setAccessibilityTraits:", v13);
  objc_msgSend(v15, "setAccessibilityIdentifier:", CFSTR("NowPlayingRightButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityLyricsButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_setAccessibilityLabelBlock:", &__block_literal_global_15);
  objc_msgSend(v16, "setAccessibilityIdentifier:", CFSTR("NowPlayingLyricsButton"));
  -[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityQueueButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_setAccessibilityLabelBlock:", &__block_literal_global_269);
  v22[0] = v12;
  v22[1] = 3221225472;
  v22[2] = __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7;
  v22[3] = &unk_2502C9670;
  objc_copyWeak(&v23, location);
  objc_msgSend(v17, "_setAccessibilityValueBlock:", v22);
  objc_msgSend(v17, "setAccessibilityIdentifier:", CFSTR("NowPlayingUpNextButton"));
  -[NowPlayingControlsViewControllerAccessibility setControlsHidden:animated:](self, "setControlsHidden:animated:", -[NowPlayingControlsViewControllerAccessibility safeSwiftBoolForKey:](self, "safeSwiftBoolForKey:", CFSTR("areControlsHidden")), 1);
  v21.receiver = self;
  v21.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  -[NowPlayingControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v21, sel__accessibilityLoadAccessibilityInformation);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityResponseForViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 2, v2) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 2, v2);
  else
    accessibilityMusicLocalizedString(CFSTR("button.prev.text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityLeftbuttonValueString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityResponseForViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityPlayPauseStopButtonString:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityResponseForViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilityIsSeekEnabledInDirection:forResponse:", 1, v2) & 1) != 0)
    objc_msgSend(MEMORY[0x24BEDCDF0], "accessibilitySeekButtonStringInDirection:response:", 1, v2);
  else
    accessibilityMusicLocalizedString(CFSTR("button.next.text"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5()
{
  return accessibilityMusicLocalizedString(CFSTR("lyrics.button"));
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_6()
{
  return accessibilityMusicLocalizedString(CFSTR("upnext.button"));
}

id __91__NowPlayingControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_7(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axUpNextBadgeValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __75__NowPlayingControlsViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (id)_axLikedBannedValueForState:(int64_t)a3
{
  if ((unint64_t)a3 > 3)
    return 0;
  accessibilityMusicLocalizedString(off_2502C96D0[a3]);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  -[NowPlayingControlsViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[NowPlayingControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilityLeftbuttonValueString
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  int v8;
  const __CFString *v9;
  __CFString *v10;
  void *v11;

  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseTracklistPlayingItem](self, "_accessibilityResponseTracklistPlayingItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("likeCommand"));
  v4 = objc_claimAutoreleasedReturnValue();

  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseTracklistPlayingItem](self, "_accessibilityResponseTracklistPlayingItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("dislikeCommand"));
  v6 = objc_claimAutoreleasedReturnValue();

  if (v4 | v6)
  {
    v7 = objc_msgSend((id)v4, "safeBoolForKey:", CFSTR("value"));
    v8 = objc_msgSend((id)v6, "safeBoolForKey:", CFSTR("value"));
    v9 = CFSTR("favorite.not.set");
    if (v8)
      v9 = CFSTR("favorite.off");
    if (v7)
      v10 = CFSTR("favorite.on");
    else
      v10 = (__CFString *)v9;
    accessibilityMusicLocalizedString(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_axUpNextBadgeValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  const __CFString *v24;

  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseTracklist](self, "_accessibilityResponseTracklist");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("repeatType"));
  if (v5 == 2)
  {
    v6 = CFSTR("repeat.all");
  }
  else
  {
    if (v5 != 1)
      goto LABEL_7;
    v6 = CFSTR("repeat.one");
  }
  accessibilityMusicLocalizedString(v6);
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    accessibilityMusicLocalizedString(CFSTR("repeat.button"));
    v20 = v8;
    v23 = CFSTR("__AXStringForVariablesSentinel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
LABEL_7:
  if ((unint64_t)(objc_msgSend(v4, "safeIntegerForKey:", CFSTR("shuffleType"), v18, v20, v23) - 1) <= 1)
  {
    accessibilityMusicLocalizedString(CFSTR("shuffle.on"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      accessibilityMusicLocalizedString(CFSTR("shuffle.button"));
      v21 = v11;
      v24 = CFSTR("__AXStringForVariablesSentinel");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v12 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v12;
    }
  }
  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseTracklistPlayingItem](self, "_accessibilityResponseTracklistPlayingItem", v19, v21, v24);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("isAutoPlay"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14 && objc_msgSend(v4, "safeIntegerForKey:", CFSTR("actionAtQueueEnd")) == 3)
  {
    accessibilityMusicLocalizedString(CFSTR("autoplay.button"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityMusicLocalizedString(CFSTR("autoplay.on"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v16 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v16;
  }

  return v3;
}

- (id)_accessibilityResponseForViewController
{
  return (id)-[NowPlayingControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityNowPlayingResponse"));
}

- (id)_accessibilityResponseTracklist
{
  void *v2;
  void *v3;

  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseForViewController](self, "_accessibilityResponseForViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("tracklist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityResponseTracklistPlayingItem
{
  void *v2;
  void *v3;

  -[NowPlayingControlsViewControllerAccessibility _accessibilityResponseTracklist](self, "_accessibilityResponseTracklist");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("playingItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
    v5 = 0;
  v7.receiver = self;
  v7.super_class = (Class)NowPlayingControlsViewControllerAccessibility;
  -[NowPlayingControlsViewControllerAccessibility setControlsHidden:animated:](&v7, sel_setControlsHidden_animated_, v5, v4);
}

@end
