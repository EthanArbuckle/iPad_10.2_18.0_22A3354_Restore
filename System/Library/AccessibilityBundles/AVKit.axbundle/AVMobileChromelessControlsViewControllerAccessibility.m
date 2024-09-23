@implementation AVMobileChromelessControlsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVMobileChromelessControlsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("toggleVisibility:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("flashControlsWithDuration:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("_temporarilyVisibile"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("_view"), "AVMobileChromelessControlsView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("_needsControlsVisibilityStateUpdate"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessControlsView"), CFSTR("_playbackControlsView"), "AVMobileChromelessPlaybackControlsView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessPlaybackControlsView"), CFSTR("_playPauseButton"), "AVMobileChromelessPlaybackControlButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("_visibilityTimer"), "NSTimer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerController"), CFSTR("isPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("_updateControlsVisibilityStateIfNeededAnimated:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("AVMobileChromelessControlsViewController"), CFSTR("playerController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVMobileChromelessPlaybackControlsView"), CFSTR("playPauseButtonShowsPlayIcon"), "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  -[AVMobileChromelessControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[AVMobileChromelessControlsViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_view._playbackControlsView._playPauseButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __99__AVMobileChromelessControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_250141278;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);

}

id __99__AVMobileChromelessControlsViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_view"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_playbackControlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("playPauseButtonShowsPlayIcon"));

  if (v4)
    v5 = CFSTR("play.button");
  else
    v5 = CFSTR("pause.button");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  -[AVMobileChromelessControlsViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[AVMobileChromelessControlsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)toggleVisibility:(id)a3
{
  id v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  v4 = a3;
  v5 = -[AVMobileChromelessControlsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_temporarilyVisibile"));
  v15.receiver = self;
  v15.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  -[AVMobileChromelessControlsViewControllerAccessibility toggleVisibility:](&v15, sel_toggleVisibility_, v4);

  v6 = -[AVMobileChromelessControlsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_temporarilyVisibile"));
  if (v5 != v6)
  {
    v7 = v6;
    -[AVMobileChromelessControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("isPlaying"));

    if (((v9 | v7) & 1) == 0)
    {
      accessibilityLocalizedString(CFSTR("hiding.media.controls.announcement"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakOrQueueIfNeeded();

    }
    -[AVMobileChromelessControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_view"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("_playbackControlsView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "safeValueForKey:", CFSTR("_playPauseButton"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v14 = v13;
    else
      v14 = 0;
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v14);

  }
}

- (void)flashControlsWithDuration:(double)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  -[AVMobileChromelessControlsViewControllerAccessibility flashControlsWithDuration:](&v6, sel_flashControlsWithDuration_, a3);
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _UIAccessibilityFullKeyboardAccessEnabled())
  {
    -[AVMobileChromelessControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibilityTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "invalidate");
  }
}

- (void)_updateControlsVisibilityStateIfNeededAnimated:(id)a3
{
  id v4;
  int v5;
  char v6;
  UIAccessibilityNotifications v7;
  void *v8;
  objc_super v9;

  v4 = a3;
  v5 = -[AVMobileChromelessControlsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_needsControlsVisibilityStateUpdate"));
  v6 = -[AVMobileChromelessControlsViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_temporarilyVisibile"));
  if (v5 && (v6 & 1) == 0)
  {
    v7 = *MEMORY[0x24BDF72C8];
    -[AVMobileChromelessControlsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playerController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v7, v8);

  }
  v9.receiver = self;
  v9.super_class = (Class)AVMobileChromelessControlsViewControllerAccessibility;
  -[AVMobileChromelessControlsViewControllerAccessibility _updateControlsVisibilityStateIfNeededAnimated:](&v9, sel__updateControlsVisibilityStateIfNeededAnimated_, v4);

}

@end
