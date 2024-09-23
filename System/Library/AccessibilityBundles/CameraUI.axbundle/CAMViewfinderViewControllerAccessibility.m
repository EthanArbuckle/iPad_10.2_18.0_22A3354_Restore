@implementation CAMViewfinderViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMViewfinderViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CAMPreviewView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMPortraitModeInstructionLabel"), CFSTR("CAMInstructionLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_shallowDepthOfFieldStatus"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_portraitModeInstructionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentGraphConfiguration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_setCurrentGraphConfiguration:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_motionController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMInstructionLabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderView"), CFSTR("previewView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_captureController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleFilterButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleShutterButtonPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleShutterButtonReleased:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_updateForShallowDepthOfFieldStatusChangedAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_currentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_updateBadgeVisibilityAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_shouldHideFlashBadgeForGraphConfiguration:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("viewfinderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_presentCameraRollViewControllerAnimated:interactive:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_isShowingCameraRoll"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureGraphConfiguration"), CFSTR("device"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureGraphConfiguration"), CFSTR("mode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_embedDescriptionOverlayView:forMode:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_shouldHideZoomControlForGraphConfiguration:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("controlStatusBar:didReceiveTapInIndicatorForType:"), "v", "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_controlDrawer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_startCapturingVideoWithRequest:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_stopCapturingVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_dynamicShutterControl"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMDynamicShutterControl"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("externalButtonPressedWithBehavior:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMDynamicShutterControl"), CFSTR("externalButtonReleased"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_descriptionOverlayViewByMode"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMCaptureGraphConfiguration"), CFSTR("mode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("_handleSmartStylePadValueChanged:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMViewfinderViewController"), CFSTR("fullscreenViewfinder"), "@", 0);

}

- (BOOL)_startCapturingVideoWithRequest:(id)a3
{
  BOOL v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  v3 = -[CAMViewfinderViewControllerAccessibility _startCapturingVideoWithRequest:](&v5, sel__startCapturingVideoWithRequest_, a3);
  AXPerformBlockAsynchronouslyOnMainThread();
  return v3;
}

uint64_t __76__CAMViewfinderViewControllerAccessibility__startCapturingVideoWithRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axUpdateInternalMotionManager");
}

- (BOOL)_stopCapturingVideo
{
  BOOL v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  v2 = -[CAMViewfinderViewControllerAccessibility _stopCapturingVideo](&v4, sel__stopCapturingVideo);
  AXPerformBlockAsynchronouslyOnMainThread();
  return v2;
}

uint64_t __63__CAMViewfinderViewControllerAccessibility__stopCapturingVideo__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axUpdateInternalMotionManager");
}

- (BOOL)accessibilityPerformMagicTap
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  id v11;
  id v12;

  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dynamicShutterControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("__shutterButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v3)
  {
    if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isEnabled")))
    {
      -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bottomBar"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("isEnabled"));

      if (v8)
      {
        v11 = v5;
        AXPerformSafeBlock();
        v6 = v11;
        goto LABEL_7;
      }
    }
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  if (!objc_msgSend(v3, "safeBoolForKey:", CFSTR("isEnabled")))
    goto LABEL_8;
  v12 = v3;
  AXPerformSafeBlock();
  v6 = v12;
LABEL_7:

  v9 = 1;
LABEL_9:

  return v9;
}

uint64_t __72__CAMViewfinderViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "externalButtonPressedWithBehavior:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "externalButtonReleased");
}

uint64_t __72__CAMViewfinderViewControllerAccessibility_accessibilityPerformMagicTap__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleShutterButtonPressed:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_handleShutterButtonReleased:", *(_QWORD *)(a1 + 40));
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
  -[CAMViewfinderViewControllerAccessibility _axUpdateForGraphConfiguration](self, "_axUpdateForGraphConfiguration");
}

- (void)_updateLevelMotionTracking
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _updateLevelMotionTracking](&v3, sel__updateLevelMotionTracking);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
}

- (void)_presentCameraRollViewControllerAnimated:(BOOL)a3 interactive:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _presentCameraRollViewControllerAnimated:interactive:](&v5, sel__presentCameraRollViewControllerAnimated_interactive_, a3, a4);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
}

- (void)_embedDescriptionOverlayView:(id)a3 forMode:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _embedDescriptionOverlayView:forMode:](&v5, sel__embedDescriptionOverlayView_forMode_, a3, a4);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
}

- (BOOL)_shouldHideZoomControlForGraphConfiguration:(id)a3
{
  BOOL v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  v4 = -[CAMViewfinderViewControllerAccessibility _shouldHideZoomControlForGraphConfiguration:](&v6, sel__shouldHideZoomControlForGraphConfiguration_, a3);
  -[CAMViewfinderViewControllerAccessibility _axUpdateInternalMotionManager](self, "_axUpdateInternalMotionManager");
  return v4;
}

- (void)_axUpdateInternalMotionManager
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  LOBYTE(v20) = 0;
  objc_opt_class();
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentGraphConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "applicationState");

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v7 = v4;
  AXPerformSafeBlock();
  v8 = *((unsigned __int8 *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAppActive:", v6 == 0);

  LOBYTE(v20) = 0;
  objc_opt_class();
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_motionController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v20)
    goto LABEL_13;
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_captureController"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v20) = 0;
  objc_opt_class();
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_descriptionOverlayViewByMode"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v20)
    goto LABEL_13;
  LOBYTE(v20) = 0;
  objc_opt_class();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v7, "mode"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v20)
LABEL_13:
    abort();
  v18 = objc_msgSend(v17, "_accessibilityViewIsVisible");
  if ((objc_msgSend(v12, "safeBoolForKey:", CFSTR("isCapturingVideo")) & 1) != 0
    || (v19 = objc_msgSend(v12, "safeBoolForKey:", CFSTR("isCapturingStandardVideo")), v8)
    || v6
    || (v19 & 1) != 0
    || ((-[CAMViewfinderViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isShowingCameraRoll")) | v18) & 1) != 0)
  {
    objc_msgSend(v11, "axStopInternalMotionManager");
  }
  else
  {
    objc_msgSend(v11, "axStartInternalMotionManagerIfNecessary");
  }

}

uint64_t __74__CAMViewfinderViewControllerAccessibility__axUpdateInternalMotionManager__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldMonitorDeviceMotionForGraphConfiguration:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_handleFilterButtonTapped:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _handleFilterButtonTapped:](&v3, sel__handleFilterButtonTapped_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_updateForShallowDepthOfFieldStatusChangedAnimated:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _updateForShallowDepthOfFieldStatusChangedAnimated:](&v8, sel__updateForShallowDepthOfFieldStatusChangedAnimated_, a3);
  if (-[CAMViewfinderViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_currentMode")) == 6)
  {
    if ((-[CAMViewfinderViewControllerAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_shallowDepthOfFieldStatus")) & 0xFFFFFFFFFFFFFFF7) == 1)
    {
      accessibilityCameraUILocalizedString(CFSTR("depth.enabled"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();
    }
    else
    {
      objc_opt_class();
      -[CAMViewfinderViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_portraitModeInstructionLabel.text"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      accessibilityCameraUILocalizedString(CFSTR("depth.disabled"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __AXStringForVariables();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeak();

    }
  }
}

- (void)_updateBadgeVisibilityAnimated:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _updateBadgeVisibilityAnimated:](&v3, sel__updateBadgeVisibilityAnimated_, a3);
  AXPerformSafeBlock();
}

void __75__CAMViewfinderViewControllerAccessibility__updateBadgeVisibilityAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_currentGraphConfiguration"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("viewfinderView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("previewView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348BFB60](CFSTR("CAMPreviewView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
      objc_msgSend(v5, "_accessibilitySetBoolValue:forKey:", objc_msgSend(*(id *)(a1 + 32), "_shouldHideFlashBadgeForGraphConfiguration:", v3) ^ 1, CFSTR("AXCameraWillUseFlashKey"));

  }
}

- (void)_setCurrentGraphConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _setCurrentGraphConfiguration:](&v4, sel__setCurrentGraphConfiguration_, a3);
  -[CAMViewfinderViewControllerAccessibility _axUpdateForGraphConfiguration](self, "_axUpdateForGraphConfiguration");
}

- (void)_axUpdateForGraphConfiguration
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_opt_class();
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentGraphConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "device");
  v6 = objc_msgSend(v4, "mode");
  if ((unint64_t)(v5 - 1) > 0xA)
    v7 = 0;
  else
    v7 = qword_230B57998[v5 - 1];
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setCaptureDevicePosition:mode:", v7, v6);

}

- (void)controlStatusBar:(id)a3 didReceiveTapInIndicatorForType:(unint64_t)a4
{
  UIAccessibilityNotifications v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility controlStatusBar:didReceiveTapInIndicatorForType:](&v8, sel_controlStatusBar_didReceiveTapInIndicatorForType_, a3);
  if (a4 >= 3)
  {
    v6 = *MEMORY[0x24BDF7328];
    -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_controlDrawer"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v6, v7);

  }
}

- (void)_handleSmartStylePadValueChanged:(CGPoint)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMViewfinderViewControllerAccessibility;
  -[CAMViewfinderViewControllerAccessibility _handleSmartStylePadValueChanged:](&v5, sel__handleSmartStylePadValueChanged_, a3.x, a3.y);
  -[CAMViewfinderViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("fullscreenViewfinder"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilityLoadAccessibilityInformation");

}

@end
