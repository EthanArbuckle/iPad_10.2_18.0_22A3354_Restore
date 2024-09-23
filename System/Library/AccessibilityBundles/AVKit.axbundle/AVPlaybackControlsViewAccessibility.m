@implementation AVPlaybackControlsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlaybackControlsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsView"), CFSTR("volumeButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_scrubber"), "AVScrubber");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_volumeSlider"), "AVVolumeSlider");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_skipBackButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_skipForwardButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_mediaSelectionButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_fullScreenButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_standardPlayPauseButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_pictureInPictureButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_prominentPlayButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_standardPlayPauseButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlaybackControlsView"), CFSTR("_doneButton"), "AVButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlaybackControlsView"), CFSTR("hasVisibleSubview"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVButton"), CFSTR("imageName"), "@", 0);

}

- (id)_accessibilityNextResponderOfClass:(Class)a3
{
  void *v3;
  uint64_t v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    do
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v3, "nextResponder");
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    while (v4);
  }
  return v3;
}

- (id)_accessibilityFullScreenViewController
{
  if (_accessibilityFullScreenViewController_onceToken != -1)
    dispatch_once(&_accessibilityFullScreenViewController_onceToken, &__block_literal_global);
  return -[AVPlaybackControlsViewAccessibility _accessibilityNextResponderOfClass:](self, "_accessibilityNextResponderOfClass:", _accessibilityFullScreenViewController_AVFullScreenViewControllerClass);
}

Class __77__AVPlaybackControlsViewAccessibility__accessibilityFullScreenViewController__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("AVFullScreenViewController"));
  _accessibilityFullScreenViewController_AVFullScreenViewControllerClass = (uint64_t)result;
  return result;
}

- (id)_accessibilityPlayerViewController
{
  void *v3;
  void *v4;
  void *v5;

  if (_accessibilityPlayerViewController_onceToken != -1)
    dispatch_once(&_accessibilityPlayerViewController_onceToken, &__block_literal_global_225);
  -[AVPlaybackControlsViewAccessibility _accessibilityNextResponderOfClass:](self, "_accessibilityNextResponderOfClass:", _accessibilityPlayerViewController_AVPlayerViewControllerClass);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AVPlaybackControlsViewAccessibility _accessibilityFullScreenViewController](self, "_accessibilityFullScreenViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

Class __73__AVPlaybackControlsViewAccessibility__accessibilityPlayerViewController__block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("AVPlayerViewController"));
  _accessibilityPlayerViewController_AVPlayerViewControllerClass = (uint64_t)result;
  return result;
}

- (id)_accessibilityPlaybackControlsVisibilityController
{
  void *v2;
  void *v3;
  void *v4;

  -[AVPlaybackControlsViewAccessibility _accessibilityPlayerViewController](self, "_accessibilityPlayerViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_playbackControlsVisibilityController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityAllControlsAreHidden
{
  return -[AVPlaybackControlsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("hasVisibleSubview")) ^ 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  objc_super v4;

  if (-[AVPlaybackControlsViewAccessibility _accessibilityAllControlsAreHidden](self, "_accessibilityAllControlsAreHidden"))
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsViewAccessibility;
  return -[AVPlaybackControlsViewAccessibility _accessibilityViewIsVisible](&v4, sel__accessibilityViewIsVisible);
}

- (BOOL)accessibilityElementsHidden
{
  objc_super v4;

  if (-[AVPlaybackControlsViewAccessibility _accessibilityAllControlsAreHidden](self, "_accessibilityAllControlsAreHidden"))
  {
    return 1;
  }
  v4.receiver = self;
  v4.super_class = (Class)AVPlaybackControlsViewAccessibility;
  return -[AVPlaybackControlsViewAccessibility accessibilityElementsHidden](&v4, sel_accessibilityElementsHidden);
}

- (void)setFullScreen:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AVPlaybackControlsViewAccessibility;
  -[AVPlaybackControlsViewAccessibility setFullScreen:](&v8, sel_setFullScreen_);
  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fullScreenButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v6 = CFSTR("exitfullscreen.button");
  else
    v6 = CFSTR("fullscreen.button");
  accessibilityLocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v7);

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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id location;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)AVPlaybackControlsViewAccessibility;
  -[AVPlaybackControlsViewAccessibility _accessibilityLoadAccessibilityInformation](&v34, sel__accessibilityLoadAccessibilityInformation);
  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubber"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("time.position.scrubber"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_volumeSlider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("volume.slider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_skipBackButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("media.skip.backwards"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringWithFormat:", v9, 0x402E000000000000);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v10);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_skipForwardButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("media.skip.forward"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, 0x402E000000000000);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v14);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mediaSelectionButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("media.selection"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAccessibilityLabel:", v16);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pictureInPictureButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pictureInPicture.button"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAccessibilityLabel:", v18);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_prominentPlayButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("play.button"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAccessibilityLabel:", v20);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_doneButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("close.button"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setAccessibilityLabel:", v22);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("volumeButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("volume.button"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityLabel:", v24);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_standardPlayPauseButton"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "accessibilitySetIdentification:", CFSTR("axPlayPauseButton"));

  LODWORD(v25) = -[AVPlaybackControlsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isFullScreen"));
  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fullScreenButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_DWORD)v25)
    v27 = CFSTR("exitfullscreen.button");
  else
    v27 = CFSTR("fullscreen.button");
  accessibilityLocalizedString(v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAccessibilityLabel:", v28);

  -[AVPlaybackControlsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoGravityButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v29);

  v30 = objc_loadWeakRetained(&location);
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = __81__AVPlaybackControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v31[3] = &unk_250141278;
  objc_copyWeak(&v32, &location);
  objc_msgSend(v30, "_setAccessibilityLabelBlock:", v31);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

id __81__AVPlaybackControlsViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;
  __CFString *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("imageName"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = v2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rectangle.portrait.arrowtriangle.2.inward")) & 1) != 0)
  {
    v4 = CFSTR("scale.to.fit.portrait");
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rectangle.portrait.arrowtriangle.2.outward")) & 1) != 0)
  {
    v4 = CFSTR("scale.to.fill.portrait");
  }
  else
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("rectangle.arrowtriangle.2.inward")) & 1) == 0
      && !objc_msgSend(v3, "isEqualToString:", CFSTR("rectangle.arrowtriangle.2.outward")))
    {
      v5 = 0;
      goto LABEL_9;
    }
    v4 = CFSTR("scale.to.fit.landscape");
  }
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v5;
}

@end
