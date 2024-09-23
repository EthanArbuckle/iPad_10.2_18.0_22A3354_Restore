@implementation SAUIElementViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SAUIElementViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SAUIElementViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIElementViewController"), CFSTR("_elementView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUILayoutSpecifyingElementViewController"), CFSTR("layoutMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SAUIElementView"), CFSTR("elementViewProvider"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SAUIElementViewProviding"), CFSTR("minimalView"));

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (void)_accessibilityLoadLayoutInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  BOOL v8;
  const __CFString *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;

  v13 = 0;
  objc_opt_class();
  -[SAUIElementViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_elementView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("elementViewProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("minimalView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[SAUIElementViewControllerAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("layoutMode"));
  if (v6)
    v8 = v7 == 1;
  else
    v8 = 0;
  if (v8)
    v9 = CFSTR("minimal.view");
  else
    v9 = CFSTR("regular.view");
  objc_msgSend(v4, "setAccessibilityIdentifier:", v9);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __77__SAUIElementViewControllerAccessibility__accessibilityLoadLayoutInformation__block_invoke;
  v11[3] = &unk_25039C8B0;
  v12 = v4;
  v10 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);

}

uint64_t __77__SAUIElementViewControllerAccessibility__accessibilityLoadLayoutInformation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityPrefetchPropertiesIfNecessary");
}

- (void)_axShiftFocusToElementViewForPowerAlerts
{
  AXPerformBlockOnMainThreadAfterDelay();
}

void __82__SAUIElementViewControllerAccessibility__axShiftFocusToElementViewForPowerAlerts__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_elementView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("elementViewProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234921524](CFSTR("SBPowerAlertElement"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v3);

}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAUIElementViewControllerAccessibility;
  -[SAUIElementViewControllerAccessibility viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SAUIElementViewControllerAccessibility _accessibilityLoadLayoutInformation](self, "_accessibilityLoadLayoutInformation");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SAUIElementViewControllerAccessibility;
  -[SAUIElementViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SAUIElementViewControllerAccessibility _axShiftFocusToElementViewForPowerAlerts](self, "_axShiftFocusToElementViewForPowerAlerts");
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SAUIElementViewControllerAccessibility;
  -[SAUIElementViewControllerAccessibility viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[SAUIElementViewControllerAccessibility _axShiftFocusToElementViewForPowerAlerts](self, "_axShiftFocusToElementViewForPowerAlerts");
}

@end
