@implementation BroadwayActivationDoneViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BroadwayActivationDoneViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BroadwayActivationDoneViewController"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BroadwayActivationDoneViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)BroadwayActivationDoneViewControllerAccessibility;
  -[BroadwayActivationDoneViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[BroadwayActivationDoneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  AXPerformBlockOnMainThreadAfterDelay();
}

void __68__BroadwayActivationDoneViewControllerAccessibility_viewWillAppear___block_invoke(uint64_t a1)
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
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BroadwayActivationDoneViewControllerAccessibility;
  -[BroadwayActivationDoneViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[BroadwayActivationDoneViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cardNameLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[BroadwayActivationDoneViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);

}

@end
