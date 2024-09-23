@implementation HUCameraControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUCameraController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCameraController"), CFSTR("_dayLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCameraController"), CFSTR("_timeLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HULegibilityLabel"), CFSTR("_lookasideLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCameraController"), CFSTR("_cameraStatusView"), "HUCameraStatusOverlayView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraStatusOverlayView"), CFSTR("statusLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraController"), CFSTR("homeHasMultipleCameraProfiles"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraController"), CFSTR("nextControlItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HUCameraController"), CFSTR("_nextControlItem"), "AVHomeLoadingButtonControlItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVHomeLoadingButtonControlItem"), CFSTR("_loadingButtonView"), "AVLoadingButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVLoadingButtonView"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("hu_dismissViewControllerAnimated:"), "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewController"), CFSTR("customControlItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVControlItem"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUCameraController"), CFSTR("configureClipScrubberViewController"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id from;
  _QWORD v22[4];
  id v23;
  id location;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v29.receiver = self;
  v29.super_class = (Class)HUCameraControllerAccessibility;
  -[HUCameraControllerAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[HUCameraControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("customControlItems"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v26 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v6, "safeStringForKey:", CFSTR("title"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("Settings"));

        if (v8)
        {
          accessibilityHomeUILocalizedString(CFSTR("settings.button"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setAccessibilityLabel:", v9);

        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v3);
  }

  -[HUCameraControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cameraStatusView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v10);

  v11 = objc_loadWeakRetained(&location);
  objc_msgSend(v11, "_accessibilityFindSubviewDescendant:", &__block_literal_global_2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v22[3] = &unk_250234568;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v12, "_setAccessibilityLabelBlock:", v22);
  objc_initWeak(&from, self);
  v19[0] = v13;
  v19[1] = 3221225472;
  v19[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v19[3] = &unk_2502345F8;
  objc_copyWeak(&v20, &from);
  objc_msgSend(v12, "_setAccessibilityTraitsBlock:", v19);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v17[3] = &unk_250234568;
  objc_copyWeak(&v18, &from);
  objc_msgSend(v12, "_setAccessibilityHintBlock:", v17);
  -[HUCameraControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dayLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraControllerAccessibility _axLoadAccessibilityInformationForDayOrTimeLabel:](self, "_axLoadAccessibilityInformationForDayOrTimeLabel:", v14);

  -[HUCameraControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_timeLabel"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUCameraControllerAccessibility _axLoadAccessibilityInformationForDayOrTimeLabel:](self, "_axLoadAccessibilityInformationForDayOrTimeLabel:", v15);

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&location);
}

uint64_t __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("statusLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  int v2;
  uint64_t *v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("homeHasMultipleCameraProfiles"));
  v3 = (uint64_t *)MEMORY[0x24BDF73B0];
  if (!v2)
    v3 = (uint64_t *)MEMORY[0x24BDF73E0];
  v4 = *v3;

  return v4;
}

id __77__HUCameraControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("homeHasMultipleCameraProfiles")))
  {
    accessibilityHomeUILocalizedString(CFSTR("camera.picker.button"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)_axLoadAccessibilityInformationForDayOrTimeLabel:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  v3 = a3;
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_lookasideLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v4);

  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke;
  v8[3] = &unk_250234568;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v3, "_setAccessibilityLabelBlock:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke_2;
  v6[3] = &unk_250234660;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "_setAccessibilityFrameBlock:", v6);
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, AXHomeUIUseAccessibilityFrameForHitTest);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

id __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXAttributedStringForBetterPronuciation();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

double __84__HUCameraControllerAccessibility__axLoadAccessibilityInformationForDayOrTimeLabel___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityFrame");
  v3 = v2;
  v5 = v4;

  return v3 + v5 * 0.4 * 0.5;
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

void __61__HUCameraControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presentingViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "hu_dismissViewControllerAnimated:", 1);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCameraControllerAccessibility;
  -[HUCameraControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[HUCameraControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)configureClipScrubberViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUCameraControllerAccessibility;
  -[HUCameraControllerAccessibility configureClipScrubberViewController](&v3, sel_configureClipScrubberViewController);
  -[HUCameraControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)nextControlItem
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUCameraControllerAccessibility;
  -[HUCameraControllerAccessibility nextControlItem](&v6, sel_nextControlItem);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("AVHomeLoadingButtonControlItem"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("_loadingButtonView.button"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityHomeUILocalizedString(CFSTR("camera.clip.next.button.share"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityHint:", v4);

  }
  return v2;
}

@end
