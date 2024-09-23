@implementation HSPCCameraScanViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HSPCCameraScanViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCCameraScanViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCCameraScanViewController"), CFSTR("_handleSetupCode:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCCameraScanViewController"), CFSTR("cameraReader"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CRCameraReader"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HSPCCameraScanViewController"), CFSTR("_contentView"), "PRXCardContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PRXCardContentView"), CFSTR("subtitleLabel"), "@", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  -[HSPCCameraScanViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[HSPCCameraScanViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
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
  v9.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  -[HSPCCameraScanViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[HSPCCameraScanViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraReader"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("camera.scan.setupcode.hint"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v5);

  -[HSPCCameraScanViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("subtitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setAccessibilityTraits:", *MEMORY[0x24BDF73D8]);
  accessibilityLocalizedString(CFSTR("hint.activate.embedded.link"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityHint:", v8);

}

- (void)_handleSetupCode:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HSPCCameraScanViewControllerAccessibility;
  v3 = a3;
  -[HSPCCameraScanViewControllerAccessibility _handleSetupCode:](&v7, sel__handleSetupCode_, v3);
  v4 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("setupcode.complete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v5, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);
}

@end
