@implementation AVNowPlayingPlaybackControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVNowPlayingPlaybackControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_setControlsContainerSubviewsVisible:animated:withCoordinators:"), "v", "B", "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("timeControlStatus"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("didPressLeftArrowB39"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("didPressRightArrowB39"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("scanForwardNext"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("scanBackwardNext"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsViewController"), CFSTR("playbackRate"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_timerFiredForHidingPlaybackControls:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_playbackMetadataViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_transportBar"), "UIView<AVTransportControlsProviding>");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVNowPlayingTransportBar"), CFSTR("_scrubNeedleTimeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("overlayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVxOverlayViewController"), CFSTR("collectionViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVxCollectionViewController"), CFSTR("leftItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVxCollectionViewController"), CFSTR("centerItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVxCollectionViewController"), CFSTR("rightItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVControlItem"), CFSTR("_sendActionWithSender:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVNowPlayingPlaybackControlsViewController"), CFSTR("_setPlaybackControlsState:animated:"), "v", "q", "B", 0);

}

- (void)_axUpdateAccessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  float v15;
  float v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id from;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id location;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("overlayViewController.collectionViewController"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "safeArrayForKey:", CFSTR("leftItems"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v3);

  objc_msgSend(v24, "safeArrayForKey:", CFSTR("centerItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v4);

  objc_msgSend(v24, "safeArrayForKey:", CFSTR("rightItems"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axSafelyAddObjectsFromArray:", v5);

  objc_initWeak(&location, self);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v6 = v2;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v36 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v10, "accessibilityLabel");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "length"))
        {
          objc_initWeak(&from, v10);
          v12 = objc_alloc(MEMORY[0x24BDF6788]);
          v31[0] = MEMORY[0x24BDAC760];
          v31[1] = 3221225472;
          v31[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke;
          v31[3] = &unk_2501411D8;
          objc_copyWeak(&v32, &from);
          objc_copyWeak(&v33, &location);
          v13 = (void *)objc_msgSend(v12, "initWithName:actionHandler:", v11, v31);
          objc_msgSend(v26, "addObject:", v13);

          objc_destroyWeak(&v33);
          objc_destroyWeak(&v32);
          objc_destroyWeak(&from);
        }

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v7);
  }

  -[AVNowPlayingPlaybackControlsViewControllerAccessibility setAccessibilityCustomActions:](self, "setAccessibilityCustomActions:", v26);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeFloatForKey:](self, "safeFloatForKey:", CFSTR("playbackRate"));
  v16 = v15;
  if (v15 <= 0.0)
  {
    v17 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("tv.player.fastforward"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_3;
    v29[3] = &unk_250141228;
    objc_copyWeak(&v30, &location);
    v19 = (void *)objc_msgSend(v17, "initWithName:actionHandler:", v18, v29);

    objc_msgSend(v14, "addObject:", v19);
    objc_destroyWeak(&v30);
  }
  if (v16 >= 0.0)
  {
    v20 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("tv.player.rewind"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_5;
    v27[3] = &unk_250141228;
    objc_copyWeak(&v28, &location);
    v22 = (void *)objc_msgSend(v20, "initWithName:actionHandler:", v21, v27);

    objc_msgSend(v14, "addObject:", v22);
    objc_destroyWeak(&v28);
  }
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transportBar"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityCustomActions:", v14);

  objc_destroyWeak(&location);
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;
  id v6;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  objc_copyWeak(&v6, (id *)(a1 + 40));
  AXPerformSafeBlock();
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_sendActionWithSender:", v2);

}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scanForwardNext");

}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__axUpdateAccessibilityCustomActions__block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scanBackwardNext");

}

- (void)_setControlsContainerSubviewsVisible:(BOOL)a3 animated:(BOOL)a4 withCoordinators:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;

  v5 = a4;
  v6 = a3;
  v8 = a5;
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_transportBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHidden");

  v17.receiver = self;
  v17.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility _setControlsContainerSubviewsVisible:animated:withCoordinators:](&v17, sel__setControlsContainerSubviewsVisible_animated_withCoordinators_, v6, v5, v8);
  v11 = -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("timeControlStatus"));
  if (v6)
  {
    objc_opt_class();
    -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playbackMetadataViewController"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "accessibilityHeaderElements");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234904978]();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakOrQueueIfNeeded();

  }
  if (v10 == v6)
  {
    if (!v11 && !v6)
    {
      accessibilityLocalizedString(CFSTR("hiding.media.controls.announcement"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakOrQueueIfNeeded();

    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }

}

- (void)_setPlaybackControlsState:(int64_t)a3 animated:(BOOL)a4
{
  dispatch_time_t v5;
  _QWORD block[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility _setPlaybackControlsState:animated:](&v7, sel__setPlaybackControlsState_animated_, a3, a4);
  v5 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__setPlaybackControlsState_animated___block_invoke;
  block[3] = &unk_250141250;
  block[4] = self;
  dispatch_after(v5, MEMORY[0x24BDAC9B8], block);
}

uint64_t __94__AVNowPlayingPlaybackControlsViewControllerAccessibility__setPlaybackControlsState_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axUpdateAccessibilityCustomActions");
}

- (void)_timerFiredForHidingPlaybackControls:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning() && !UIAccessibilityIsSwitchControlRunning()
    || -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("timeControlStatus")))
  {
    v5.receiver = self;
    v5.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
    -[AVNowPlayingPlaybackControlsViewControllerAccessibility _timerFiredForHidingPlaybackControls:](&v5, sel__timerFiredForHidingPlaybackControls_, v4);
  }

}

- (void)_axAnnounceCurrentScrubPosition
{
  void *v2;
  void *v3;
  id v4;

  -[AVNowPlayingPlaybackControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_transportBar"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("_scrubNeedleTimeLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "_accessibilityViewIsVisible"))
  {
    objc_msgSend(v2, "accessibilityLabel");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
      UIAccessibilitySpeak();

  }
}

- (void)didPressLeftArrowB39
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility didPressLeftArrowB39](&v3, sel_didPressLeftArrowB39);
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility _axAnnounceCurrentScrubPosition](self, "_axAnnounceCurrentScrubPosition");
}

- (void)didPressRightArrowB39
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVNowPlayingPlaybackControlsViewControllerAccessibility;
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility didPressRightArrowB39](&v3, sel_didPressRightArrowB39);
  -[AVNowPlayingPlaybackControlsViewControllerAccessibility _axAnnounceCurrentScrubPosition](self, "_axAnnounceCurrentScrubPosition");
}

@end
