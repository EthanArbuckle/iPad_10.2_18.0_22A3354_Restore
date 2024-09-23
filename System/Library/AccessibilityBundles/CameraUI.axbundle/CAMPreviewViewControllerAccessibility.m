@implementation CAMPreviewViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CAMPreviewViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CAMPreviewViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewViewController"), CFSTR("_setUserLockedFocusAndExposure: shouldAnimate:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewViewController"), CFSTR("captureControllerWillResetFocusAndExposure:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewViewController"), CFSTR("previewView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewViewController"), CFSTR("_device"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CAMPreviewViewController"), CFSTR("_setGraphConfiguration:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  -[CAMPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSceneObjectElementContainerView:", v3);

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CAMPreviewViewControllerAccessibility _axUpdateForCaptureDevice](self, "_axUpdateForCaptureDevice");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[CAMPreviewViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  +[AXCameraVisionEngine sharedEngine](AXCameraVisionEngine, "sharedEngine");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSceneObjectElementContainerView:", 0);

}

- (void)_setUserLockedFocusAndExposure:(BOOL)a3 shouldAnimate:(BOOL)a4
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility _setUserLockedFocusAndExposure:shouldAnimate:](&v6, sel__setUserLockedFocusAndExposure_shouldAnimate_, a3, a4);
  -[CAMPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("AXCameraIsFocusedKey"));

}

- (void)captureControllerWillResetFocusAndExposure:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility captureControllerWillResetFocusAndExposure:](&v5, sel_captureControllerWillResetFocusAndExposure_, a3);
  -[CAMPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C0], CFSTR("AXCameraIsFocusedKey"));

}

- (void)_setGraphConfiguration:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CAMPreviewViewControllerAccessibility;
  -[CAMPreviewViewControllerAccessibility _setGraphConfiguration:](&v4, sel__setGraphConfiguration_, a3);
  -[CAMPreviewViewControllerAccessibility _axUpdateForCaptureDevice](self, "_axUpdateForCaptureDevice");
}

- (void)_axUpdateForCaptureDevice
{
  uint64_t v3;
  void *v5;
  uint64_t v6;
  id v7;

  v3 = -[CAMPreviewViewControllerAccessibility _device](self, "_device");
  if ((unint64_t)(v3 - 8) < 4 || v3 == 1)
  {
    -[CAMPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDBD1C0];
  }
  else
  {
    -[CAMPreviewViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("previewView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDBD1C8];
  }
  v7 = v5;
  objc_msgSend(v5, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AXIsBackCamera"));

}

@end
