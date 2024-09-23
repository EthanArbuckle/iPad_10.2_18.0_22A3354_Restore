@implementation AVPlayerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVPlayerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPictureInPictureController"), CFSTR("isPictureInPictureActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVPlayerViewController"), CFSTR("_togglePictureInPicture"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AVPlayerViewController"), CFSTR("_playerLayerView"), "__AVPlayerLayerView");

}

- (void)_axObservePIPStateNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axPIPStop_, AXPIPStoppedNotification, 0);

}

- (void)_axPIPStop:(id)a3
{
  id v3;

  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playerLayerView"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);

}

- (void)_axSetupVideoLayerView
{
  void *v3;
  id v4;

  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playerLayerView"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pictureInPictureController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPictureInPictureActive")) ^ 1);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id location;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AVPlayerViewControllerAccessibility;
  -[AVPlayerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[AVPlayerViewControllerAccessibility _axSetupVideoLayerView](self, "_axSetupVideoLayerView");
  -[AVPlayerViewControllerAccessibility _axObservePIPStateNotifications](self, "_axObservePIPStateNotifications");
  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pictureInPictureController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v5);

  v6 = objc_loadWeakRetained(&location);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__AVPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v7[3] = &unk_250141390;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v6, "_setAccessibilityElementsHiddenBlock:", v7);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

}

BOOL __81__AVPlayerViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  _BOOL8 v4;

  if (!_AXSAutomationEnabled())
    return 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", AXPIPStoppedNotification);

  v4.receiver = self;
  v4.super_class = (Class)AVPlayerViewControllerAccessibility;
  -[AVPlayerViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (void)_togglePictureInPicture
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)AVPlayerViewControllerAccessibility;
  -[AVPlayerViewControllerAccessibility _togglePictureInPicture](&v5, sel__togglePictureInPicture);
  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_playerLayerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVPlayerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pictureInPictureController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", objc_msgSend(v4, "safeBoolForKey:", CFSTR("isPictureInPictureActive")));

}

@end
