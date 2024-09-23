@implementation HUQuickControlViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HUQuickControlViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("activeControlView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFItem"), CFSTR("latestResults"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HFServiceNameComponents"), CFSTR("serviceName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlStepperViewAccessibility"), CFSTR("_accessibilityFirstQuickControlElementForFocus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlColorViewAccessibility"), CFSTR("_accessibilityFirstQuickControlElementForFocus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerViewController"), CFSTR("controlContainerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HUQuickControlContainerView"), CFSTR("activeControlView"), "@", 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlViewControllerAccessibility;
  -[HUQuickControlViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[HUQuickControlViewControllerAccessibility _accessibilityControlsContainerView](self, "_accessibilityControlsContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("activeControlView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v5);

}

- (id)_accessibilityControlsContainerView
{
  void *v2;
  void *v3;

  -[HUQuickControlViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234911848](CFSTR("HUQuickControlContainerViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("controlContainerView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (void)_accessibilityMoveToActiveControl
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  -[HUQuickControlViewControllerAccessibility _accessibilityControlsContainerView](self, "_accessibilityControlsContainerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("activeControlView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v4 = v3;
  AXPerformSafeBlock();
  v5 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  if (v5)
    v6 = v5;
  else
    v6 = v4;
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v6);

}

void __78__HUQuickControlViewControllerAccessibility__accessibilityMoveToActiveControl__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFirstQuickControlElementForFocus");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityControlServiceName
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[HUQuickControlViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("item"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("latestResults"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE4CF68]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("serviceName"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
