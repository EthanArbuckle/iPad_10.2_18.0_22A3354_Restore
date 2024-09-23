@implementation BroadwayActivationStartViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BroadwayActivationStartViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BroadwayActivationStartViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BroadwayActivationStartViewController"), CFSTR("_dismissButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BroadwayActivationStartViewController"), CFSTR("_titleLabel"), "UILabel");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationStartViewControllerAccessibility;
  -[BroadwayActivationStartViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[BroadwayActivationStartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  AXPerformBlockOnMainThreadAfterDelay();
}

void __69__BroadwayActivationStartViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF72C8];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BroadwayActivationStartViewControllerAccessibility;
  -[BroadwayActivationStartViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[BroadwayActivationStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("dismiss.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  -[BroadwayActivationStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dismissButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilitySetUserTestingIsCancelButton:", 1);

  -[BroadwayActivationStartViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
