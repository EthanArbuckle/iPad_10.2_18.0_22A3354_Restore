@implementation ARQuickLookOverlayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AssetViewer.ARQuickLookOverlayController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("dismissButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("shareButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVButton"), CFSTR("button"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("startAutoHideControlsTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("enableWorldModeControl:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("updateStatusPill"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("statusPill"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVTrackingStateStatusLabel"), CFSTR("text"), "@", 0);

}

- (void)axUpdateAutoHideControlsTimer
{
  AXPerformSafeBlock();
}

uint64_t __74__ARQuickLookOverlayControllerAccessibility_axUpdateAutoHideControlsTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startAutoHideControlsTimer");
}

- (BOOL)axShouldDisableAutoHidingControls
{
  return UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  -[ARQuickLookOverlayControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[ARQuickLookOverlayControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("CLOSE_BUTTON"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  -[ARQuickLookOverlayControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("shareButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("SHARE_BUTTON"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

- (void)startAutoHideControlsTimer
{
  objc_super v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  void *v7;
  ARQuickLookOverlayControllerAccessibility *v8;

  if (-[ARQuickLookOverlayControllerAccessibility axShouldDisableAutoHidingControls](self, "axShouldDisableAutoHidingControls"))
  {
    v4 = MEMORY[0x24BDAC760];
    v5 = 3221225472;
    v6 = __71__ARQuickLookOverlayControllerAccessibility_startAutoHideControlsTimer__block_invoke;
    v7 = &unk_25017AC30;
    v8 = self;
    AXPerformSafeBlock();
  }
  else
  {
    v3.receiver = self;
    v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
    -[ARQuickLookOverlayControllerAccessibility startAutoHideControlsTimer](&v3, sel_startAutoHideControlsTimer);
  }
}

uint64_t __71__ARQuickLookOverlayControllerAccessibility_startAutoHideControlsTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopAutoHideControlsTimerWithShouldRestart:", 0);
}

- (void)enableWorldModeControl:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  -[ARQuickLookOverlayControllerAccessibility enableWorldModeControl:](&v3, sel_enableWorldModeControl_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_axSpeakUpdateToStatusPill
{
  void *v2;
  double v3;
  void *v4;
  id v5;

  -[ARQuickLookOverlayControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("statusPill"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  v2 = v5;
  if (v3 > 0.0)
  {
    objc_msgSend(v5, "safeStringForKey:", CFSTR("text"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "length"))
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);

    v2 = v5;
  }

}

- (void)updateStatusPill
{
  objc_super v3;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__axSpeakUpdateToStatusPill, 0);
  v3.receiver = self;
  v3.super_class = (Class)ARQuickLookOverlayControllerAccessibility;
  -[ARQuickLookOverlayControllerAccessibility updateStatusPill](&v3, sel_updateStatusPill);
  -[ARQuickLookOverlayControllerAccessibility performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__axSpeakUpdateToStatusPill, 0, 0.5);
}

@end
