@implementation CCUISensorAttributionExpandedViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUISensorAttributionExpandedViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionExpandedViewController"), CFSTR("isExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUISensorAttributionExpandedViewController"), CFSTR("_privacyHeaderView"), "CCUISensorAttributionPrivacyHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionExpandedViewController"), CFSTR("setExpanded:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUISensorAttributionExpandedViewController"), CFSTR("scrollView"), "B", 0);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  -[CCUISensorAttributionExpandedViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[CCUISensorAttributionExpandedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityMoveToPrivacyHeaderView
{
  id argument;

  -[CCUISensorAttributionExpandedViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_privacyHeaderView"));
  argument = (id)objc_claimAutoreleasedReturnValue();
  if (-[CCUISensorAttributionExpandedViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExpanded"))&& objc_msgSend(argument, "_accessibilityViewIsVisible"))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], argument);
  }

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  -[CCUISensorAttributionExpandedViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CCUISensorAttributionExpandedViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2501E15C0;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "_setAccessibilityViewIsModalBlock:", v4);

  AXPerformBlockOnMainThreadAfterDelay();
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

uint64_t __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded"));

  return v2;
}

uint64_t __102__CCUISensorAttributionExpandedViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityMoveToPrivacyHeaderView");
}

- (void)setExpanded:(BOOL)a3 animated:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUISensorAttributionExpandedViewControllerAccessibility;
  -[CCUISensorAttributionExpandedViewControllerAccessibility setExpanded:animated:](&v4, sel_setExpanded_animated_, a3, a4);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __81__CCUISensorAttributionExpandedViewControllerAccessibility_setExpanded_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityMoveToPrivacyHeaderView");
}

@end
