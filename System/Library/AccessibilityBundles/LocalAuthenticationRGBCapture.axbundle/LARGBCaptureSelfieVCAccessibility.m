@implementation LARGBCaptureSelfieVCAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LARGBCaptureSelfieVC");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("captureSelfieWillMonitorGesture:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_dispatchSkipButtonTimers"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_toggleFlash:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("captureSelfieDidFinishGestureMonitoring"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_restartSelfieCapture:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_gesturePrompt"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_cameraFeed"), "LARGBCameraPreview");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_didSkipLastGesture"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_hasPresentedFirstGesture"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("LARGBCaptureSelfieVC"), CFSTR("_flashButton"), "UIBarButtonItem");

}

- (void)_toggleFlash:(id)a3
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  -[LARGBCaptureSelfieVCAccessibility _toggleFlash:](&v9, sel__toggleFlash_, a3);
  v4 = *MEMORY[0x24BDF73B0];
  v5 = -[LARGBCaptureSelfieVCAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_useFlash"));
  v6 = *MEMORY[0x24BDF7400];
  if (!v5)
    v6 = 0;
  v7 = v6 | v4;
  -[LARGBCaptureSelfieVCAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_flashButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityTraits:", v7);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_restartSelfieCapture:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  -[LARGBCaptureSelfieVCAccessibility _restartSelfieCapture:](&v3, sel__restartSelfieCapture_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_axAnnounceSuccess
{
  UIAccessibilityNotifications v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v3 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("selfie.success"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[LARGBCaptureSelfieVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_gesturePrompt"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v5);

}

- (void)captureSelfieWillMonitorGesture:(int64_t)a3
{
  char v5;
  objc_super v6;

  if (-[LARGBCaptureSelfieVCAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_hasPresentedFirstGesture")))
  {
    v5 = -[LARGBCaptureSelfieVCAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_didSkipLastGesture"));
    v6.receiver = self;
    v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
    -[LARGBCaptureSelfieVCAccessibility captureSelfieWillMonitorGesture:](&v6, sel_captureSelfieWillMonitorGesture_, a3);
    if ((v5 & 1) == 0)
      -[LARGBCaptureSelfieVCAccessibility _axAnnounceSuccess](self, "_axAnnounceSuccess");
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
    -[LARGBCaptureSelfieVCAccessibility captureSelfieWillMonitorGesture:](&v6, sel_captureSelfieWillMonitorGesture_, a3);
  }
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)captureSelfieDidFinishGestureMonitoring
{
  char v3;
  objc_super v4;

  v3 = -[LARGBCaptureSelfieVCAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_didSkipLastGesture"));
  v4.receiver = self;
  v4.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  -[LARGBCaptureSelfieVCAccessibility captureSelfieDidFinishGestureMonitoring](&v4, sel_captureSelfieDidFinishGestureMonitoring);
  if ((v3 & 1) == 0)
    -[LARGBCaptureSelfieVCAccessibility _axAnnounceSuccess](self, "_axAnnounceSuccess");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_dispatchSkipButtonTimers
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)LARGBCaptureSelfieVCAccessibility;
  -[LARGBCaptureSelfieVCAccessibility _dispatchSkipButtonTimers](&v6, sel__dispatchSkipButtonTimers);
  -[LARGBCaptureSelfieVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_gesturePrompt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[LARGBCaptureSelfieVCAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_cameraFeed"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityHint:", v4);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
