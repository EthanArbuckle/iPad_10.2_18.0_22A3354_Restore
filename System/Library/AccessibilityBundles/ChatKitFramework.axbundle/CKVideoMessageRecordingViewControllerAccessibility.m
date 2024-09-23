@implementation CKVideoMessageRecordingViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKVideoMessageRecordingViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("presentVideoActionMenuController"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("videoActionMenuController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuItem"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKActionMenuItem"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("swapCameraButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("cameraViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKVideoMessageRecordingViewController"), CFSTR("swapCamera:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  -[CKVideoMessageRecordingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v10, sel__accessibilityLoadAccessibilityInformation);
  -[CKVideoMessageRecordingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cameraViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "cameraDevice");
  -[CKVideoMessageRecordingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("swapCameraButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityCameraKitLocalizedString(CFSTR("camera.chooser.button.text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

  objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("FrontBackFacingCameraChooser"));
  if (v5 == 1)
    v8 = CFSTR("camera.chooser.front.text");
  else
    v8 = CFSTR("camera.chooser.back.text");
  accessibilityCameraKitLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityValue:", v9);

}

- (void)swapCamera:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  -[CKVideoMessageRecordingViewControllerAccessibility swapCamera:](&v4, sel_swapCamera_, a3);
  -[CKVideoMessageRecordingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  -[CKVideoMessageRecordingViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CKVideoMessageRecordingViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)presentVideoActionMenuController
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKVideoMessageRecordingViewControllerAccessibility;
  -[CKVideoMessageRecordingViewControllerAccessibility presentVideoActionMenuController](&v6, sel_presentVideoActionMenuController);
  -[CKVideoMessageRecordingViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("videoActionMenuController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("actionMenuItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &__block_literal_global_7);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], (id)*MEMORY[0x24BDFEE30]);

}

void __86__CKVideoMessageRecordingViewControllerAccessibility_presentVideoActionMenuController__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v4 = a2;
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("view"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setIsAccessibilityElement:", 1);
  v7 = *MEMORY[0x24BDF73B0];
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("label"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setIsAccessibilityElement:", 0);
  if (a3 == 2)
  {
    accessibilityLocalizedString(CFSTR("cancel.button"));
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v13 = (void *)v11;
    objc_msgSend(v6, "setAccessibilityLabel:", v11);

    goto LABEL_10;
  }
  if (a3 == 1)
  {
    accessibilityLocalizedString(CFSTR("media.message.picture"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v12);

    goto LABEL_7;
  }
  if (a3)
  {
    objc_msgSend(v9, "accessibilityLabel");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  accessibilityLocalizedString(CFSTR("media.message.video"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v10);

  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF7408] | v7);
LABEL_7:
  objc_msgSend(v6, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AXShouldBypassAXActivate"));
LABEL_10:

}

@end
