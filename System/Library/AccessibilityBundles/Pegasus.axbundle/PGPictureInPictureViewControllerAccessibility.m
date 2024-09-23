@implementation PGPictureInPictureViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGPictureInPictureViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PGPictureInPictureViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PGControlsContainerView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PGLayerHostView"));
  objc_msgSend(v3, "validateClass:", CFSTR("_UIRemoteView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGPictureInPictureViewController"), CFSTR("_controlsContainerView"), "PGControlsContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGPictureInPictureViewController"), CFSTR("_contentView"), "PGLayerHostView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGLayerHostView"), CFSTR("_remoteView"), "_UIRemoteView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("_UIHostedWindowHostingHandle"), CFSTR("_pid"), "i");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureViewController"), CFSTR("setStashed:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGPictureInPictureViewController"), CFSTR("setHostedWindowHostingHandle:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  -[PGPictureInPictureViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PGPictureInPictureViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_controlsContainerView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityLoadAccessibilityInformation");

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  -[PGPictureInPictureViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PGPictureInPictureViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setHostedWindowHostingHandle:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGPictureInPictureViewControllerAccessibility;
  -[PGPictureInPictureViewControllerAccessibility setHostedWindowHostingHandle:](&v10, sel_setHostedWindowHostingHandle_, v4);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "safeIntForKey:", CFSTR("_pid"));
  -[PGPictureInPictureViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_contentView._remoteView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("ax-pid"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", _AXUIElementRemoteBridgeMachPortForAXServer());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilitySetRetainedValue:forKey:", v9, CFSTR("ax-machport"));

}

@end
