@implementation CSCoverSheetViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSCoverSheetViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("dateViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("dateView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_presentModalViewController:shouldDismissOverlays:animated:completion:"), "v", "@", "B", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("isPasscodeLockVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSCoverSheetViewController"), CFSTR("_posterSwitcherGestureRecognizer"), "UILongPressGestureRecognizer");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_isPresentingPosterSwitcher"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("_handlePosterSwitcherActivation:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CSCoverSheetViewController"), CFSTR("activeBehavior"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("activateTodayViewWithCompletion:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("deactivateTodayViewWithCompletion:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("activateCameraViewAnimated:sendingActions:completion:"), "v", "B", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSBehavior"), CFSTR("areRestrictedCapabilities:"), "B", "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  -[CSCoverSheetViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[CSCoverSheetViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("dateViewController.dateView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetAssignedValue:forKey:", self, CFSTR("AXSBFDateViewDashboardController"));

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  -[CSCoverSheetViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CSCoverSheetViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_presentModalViewController:(id)a3 shouldDismissOverlays:(BOOL)a4 animated:(BOOL)a5 completion:(id)a6
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSCoverSheetViewControllerAccessibility;
  -[CSCoverSheetViewControllerAccessibility _presentModalViewController:shouldDismissOverlays:animated:completion:](&v6, sel__presentModalViewController_shouldDismissOverlays_animated_completion_, a3, a4, a5, a6);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __113__CSCoverSheetViewControllerAccessibility__presentModalViewController_shouldDismissOverlays_animated_completion___block_invoke()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  objc_super v17;

  if (!_AXSAssistiveTouchScannerEnabled())
  {
    v17.receiver = self;
    v17.super_class = (Class)CSCoverSheetViewControllerAccessibility;
    -[CSCoverSheetViewControllerAccessibility accessibilityCustomActions](&v17, sel_accessibilityCustomActions);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (-[CSCoverSheetViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPasscodeLockVisible")))
  {
    v3 = (void *)objc_opt_new();
    return v3;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_posterSwitcherGestureRecognizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("wallpaper.collections"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__accessibilityShowWallpaperCollections);

    objc_msgSend(v9, "setIgnoreWhenVoiceOverTouches:", 1);
    objc_msgSend(v9, "setShouldSuppressActionHint:", 1);
    objc_msgSend(v5, "addObject:", v9);

  }
  if (!-[CSCoverSheetViewControllerAccessibility _axIsCapabilityRestricted:](self, "_axIsCapabilityRestricted:", 64))
  {
    v10 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("today.visible.key"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithName:target:selector:", v11, self, sel__axShowTodayView);

    objc_msgSend(v12, "setIgnoreWhenVoiceOverTouches:", 1);
    objc_msgSend(v5, "addObject:", v12);

  }
  if (!-[CSCoverSheetViewControllerAccessibility _axIsCapabilityRestricted:](self, "_axIsCapabilityRestricted:", 4))
  {
    v13 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("camera.visible"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)objc_msgSend(v13, "initWithName:target:selector:", v14, self, sel__axShowCameraView);

    objc_msgSend(v15, "setIgnoreWhenVoiceOverTouches:", 1);
    objc_msgSend(v5, "addObject:", v15);

  }
  if (objc_msgSend(v5, "count"))
    v16 = v5;
  else
    v16 = 0;

  return v16;
}

- (BOOL)_axShowTodayView
{
  _BOOL4 v3;
  void *v4;

  if (-[CSCoverSheetViewControllerAccessibility _axIsTodayViewShowing](self, "_axIsTodayViewShowing"))
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    AXPerformSafeBlock();
    v3 = -[CSCoverSheetViewControllerAccessibility _axIsTodayViewShowing](self, "_axIsTodayViewShowing");
    if (v3)
    {
      accessibilityLocalizedString(CFSTR("did.show.today.view.announcement"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
  }
  return v3;
}

uint64_t __59__CSCoverSheetViewControllerAccessibility__axShowTodayView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateTodayViewWithCompletion:", &__block_literal_global_241);
}

- (BOOL)_axDismissTodayView
{
  _BOOL4 v3;

  v3 = -[CSCoverSheetViewControllerAccessibility _axIsTodayViewShowing](self, "_axIsTodayViewShowing");
  if (v3)
  {
    AXPerformSafeBlock();
    LOBYTE(v3) = !-[CSCoverSheetViewControllerAccessibility _axIsTodayViewShowing](self, "_axIsTodayViewShowing");
  }
  return v3;
}

uint64_t __62__CSCoverSheetViewControllerAccessibility__axDismissTodayView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deactivateTodayViewWithCompletion:", &__block_literal_global_244);
}

- (BOOL)_axIsTodayViewShowing
{
  return -[CSCoverSheetViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isTodayViewOverlayShowing"));
}

- (BOOL)_axShowCameraView
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __60__CSCoverSheetViewControllerAccessibility__axShowCameraView__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "activateCameraViewAnimated:sendingActions:completion:", 1, 0, &__block_literal_global_248);
}

- (BOOL)_accessibilityShowWallpaperCollections
{
  id v2;
  id v3;
  void *v4;
  BOOL v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = objc_alloc_init(MEMORY[0x24BDF6BA0]);
  objc_msgSend(v2, "setState:", 1);
  v3 = v2;
  AXPerformSafeBlock();
  if (*((_BYTE *)v8 + 24))
  {
    accessibilityLocalizedString(CFSTR("wallpaper.collections"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    v5 = *((_BYTE *)v8 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }

  _Block_object_dispose(&v7, 8);
  return v5;
}

uint64_t __81__CSCoverSheetViewControllerAccessibility__accessibilityShowWallpaperCollections__block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_handlePosterSwitcherActivation:", *(_QWORD *)(a1 + 40));
  result = objc_msgSend(*(id *)(a1 + 32), "_isPresentingPosterSwitcher");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)_axIsCapabilityRestricted:(unint64_t)a3
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  -[CSCoverSheetViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activeBehavior"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  v3 = *((_BYTE *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __69__CSCoverSheetViewControllerAccessibility__axIsCapabilityRestricted___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "areRestrictedCapabilities:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end
