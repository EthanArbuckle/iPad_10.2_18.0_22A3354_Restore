@implementation SBDeviceApplicationSceneClassicAccessoryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDeviceApplicationSceneClassicAccessoryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_updateZoomButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_isZoomed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_updateRotationButton"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_zoomButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_counterClockWiseRotationButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_clockWiseRotationButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeviceApplicationSceneClassicAccessoryView"), CFSTR("_buttonOrientation"), "NSInteger");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_zoomButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBDeviceApplicationSceneClassicAccessoryViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isZoomed")))v4 = CFSTR("fullscreen.zoom");
  else
    v4 = CFSTR("normal.zoom");
  accessibilityLocalizedString(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_clockWiseRotationButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("clockwise.rotation.button"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_counterClockWiseRotationButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("counter.clockwise.rotation.button"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAccessibilityLabel:", v9);

}

- (void)_updateRotationButton
{
  unint64_t v3;
  __CFString *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility _updateRotationButton](&v5, sel__updateRotationButton);
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v3 = -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("buttonOrientation"))- 1;
  if (v3 > 3)
  {
    v4 = &stru_25036C388;
  }
  else
  {
    accessibilityLocalizedString(off_250368550[v3]);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  if (-[__CFString length](v4, "length"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);

}

- (void)_updateZoomButton
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeviceApplicationSceneClassicAccessoryViewAccessibility;
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility _updateZoomButton](&v3, sel__updateZoomButton);
  -[SBDeviceApplicationSceneClassicAccessoryViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
