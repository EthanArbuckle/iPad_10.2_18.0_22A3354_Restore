@implementation HUClipScrubberViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUClipScrubberViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HUClipScrubberViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUClipScrubberViewController"), CFSTR("_scrubberUpdateDisplayLink"), "CADisplayLink");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberViewController"), CFSTR("didDoubleTap:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUClipScrubberViewController"), CFSTR("_playbackEngine"), "HFCameraPlaybackEngine");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUClipScrubberViewController"), CFSTR("_scrubberView"), "HUClipScrubberView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberView"), CFSTR("rightActionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUClipScrubberViewController"), CFSTR("nearbyAccessoriesButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUClipScrubberView"), CFSTR("_displayMode"), "NSUInteger");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id (*v13)(uint64_t);
  void *v14;
  HUClipScrubberViewControllerAccessibility *v15;
  id v16;
  _QWORD v17[5];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  -[HUClipScrubberViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v22, sel__accessibilityLoadAccessibilityInformation);
  -[HUClipScrubberViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_scrubberView.rightActionButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUClipScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("nearbyAccessoriesButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeUILocalizedString(CFSTR("camera.nearby.accessories"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  objc_initWeak(&location, self);
  v6 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v19[3] = &unk_250234568;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v19);
  v17[0] = v6;
  v17[1] = 3221225472;
  v17[2] = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v17[3] = &unk_250234688;
  v17[4] = self;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v17);
  v11 = v6;
  v12 = 3221225472;
  v13 = __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v14 = &unk_2502346B0;
  v15 = self;
  objc_copyWeak(&v16, &location);
  objc_msgSend(v3, "_setAccessibilityHintBlock:", &v11);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v11, v12, v13, v14, v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, AXToggleClipTimescaleNotification, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__axToggleClipTimescale_, AXToggleClipTimescaleNotification, 0);

  if (AXIsInternalInstall())
  {
    -[HUClipScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("feedbackButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityHomeUILocalizedString(CFSTR("internal.clipfeedback.button"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabel:", v10);

  }
  objc_destroyWeak(&v16);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

id __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  __CFString *v3;
  __CFString *v4;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_axIsEditingClips");
  v3 = CFSTR("camera.live.button");
  if (v2)
    v3 = CFSTR("camera.trash.button");
  v4 = v3;

  accessibilityHomeUILocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXAttributedStringForBetterPronuciation();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  char v2;
  uint64_t v3;
  id WeakRetained;
  int v5;
  _QWORD *v6;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_axIsEditingClips");
  v3 = *MEMORY[0x24BDF73B0];
  if ((v2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = objc_msgSend(WeakRetained, "_axIsStreamingLive");
    v6 = (_QWORD *)MEMORY[0x24BDF7400];
    if (!v5)
      v6 = (_QWORD *)MEMORY[0x24BDF73E8];
    v3 |= *v6;

  }
  return v3;
}

id __87__HUClipScrubberViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  int v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;

  if ((objc_msgSend(*(id *)(a1 + 32), "_axIsEditingClips") & 1) != 0)
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_axIsStreamingLive");
  v5 = CFSTR("camera.streaming.live.no");
  if (v4)
    v5 = CFSTR("camera.streaming.live.yes");
  v6 = v5;

  accessibilityHomeUILocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  AXAttributedStringForBetterPronuciation();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)_axToggleClipTimescale:(id)a3
{
  void *v4;
  int v5;
  __CFString *v6;
  void *v7;

  AXPerformSafeBlock();
  -[HUClipScrubberViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("dataSource.timeController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isAtMinimumZoom"));

  if (v5)
    v6 = CFSTR("scrubber.timescale.shrunk");
  else
    v6 = CFSTR("scrubber.timescale.expanded");
  accessibilityHomeUILocalizedString(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);

}

uint64_t __68__HUClipScrubberViewControllerAccessibility__axToggleClipTimescale___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didDoubleTap:", 0);
}

- (BOOL)_axIsEditingClips
{
  void *v2;
  BOOL v3;

  -[HUClipScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubberView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeUnsignedIntegerForKey:", CFSTR("_displayMode")) == 1;

  return v3;
}

- (BOOL)_axIsStreamingLive
{
  void *v3;
  int v4;
  void *v5;
  void *v6;

  -[HUClipScrubberViewControllerAccessibility _axPlaybackEngine](self, "_axPlaybackEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "engineMode"))
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    objc_opt_class();
    -[HUClipScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrubberUpdateDisplayLink"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v6, "isPaused") ^ 1;
  }

  return v4;
}

- (id)_axPlaybackEngine
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[HUClipScrubberViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("playbackEngine"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  -[HUClipScrubberViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUClipScrubberViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)selectionButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)HUClipScrubberViewControllerAccessibility;
  -[HUClipScrubberViewControllerAccessibility selectionButton](&v5, sel_selectionButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityHomeUILocalizedString(CFSTR("camera.clip.share.and.edit.button"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end
