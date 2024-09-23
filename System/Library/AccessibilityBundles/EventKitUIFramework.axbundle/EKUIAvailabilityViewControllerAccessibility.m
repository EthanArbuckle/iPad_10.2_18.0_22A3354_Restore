@implementation EKUIAvailabilityViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKUIAvailabilityViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("EKUIAvailabilityViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIAvailabilityViewController"), CFSTR("freeSpanViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKUIAvailabilityViewController"), CFSTR("participantList"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  -[EKUIAvailabilityViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[EKUIAvailabilityViewControllerAccessibility _accessibilitySetup](self, "_accessibilitySetup");
}

- (void)_accessibilitySetup
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  char v6;

  v6 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__EKUIAvailabilityViewControllerAccessibility__accessibilitySetup__block_invoke;
  v5[3] = &unk_2501FCC18;
  v5[4] = self;
  objc_msgSend(v4, "_setAccessibilityElementsBlock:", v5);

}

id __66__EKUIAvailabilityViewControllerAccessibility__accessibilitySetup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "safeArrayForKey:", CFSTR("freeSpanViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("participantList"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  return v3;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  -[EKUIAvailabilityViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[EKUIAvailabilityViewControllerAccessibility _accessibilitySetup](self, "_accessibilitySetup");
}

- (void)layout
{
  UIAccessibilityNotifications v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)EKUIAvailabilityViewControllerAccessibility;
  -[EKUIAvailabilityViewControllerAccessibility layout](&v5, sel_layout);
  v3 = *MEMORY[0x24BDF72C8];
  -[EKUIAvailabilityViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v3, v4);

}

@end
