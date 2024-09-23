@implementation QRCodeOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicCoreUI.QRCodeOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MusicCoreUI.QRCodeOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.QRCodeOverlayViewController"), CFSTR("titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MusicCoreUI.QRCodeOverlayViewController"), CFSTR("subtitleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicCoreUI.QRCodeOverlayViewController"), CFSTR("dismissAnimated"), "v", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[QRCodeOverlayViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityActivateBlock:", &__block_literal_global_0);
  -[QRCodeOverlayViewControllerAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityActivateBlock:", &__block_literal_global_192);
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityElements:", v7);
  v8.receiver = self;
  v8.super_class = (Class)QRCodeOverlayViewControllerAccessibility;
  -[QRCodeOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);

}

uint64_t __86__QRCodeOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  return 1;
}

uint64_t __86__QRCodeOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)QRCodeOverlayViewControllerAccessibility;
  -[QRCodeOverlayViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[QRCodeOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)accessibilityPerformEscape
{
  AXPerformSafeBlock();
  return 1;
}

uint64_t __70__QRCodeOverlayViewControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissAnimated");
}

@end
