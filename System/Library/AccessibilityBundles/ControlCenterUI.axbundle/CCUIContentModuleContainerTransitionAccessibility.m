@implementation CCUIContentModuleContainerTransitionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIContentModuleContainerTransition");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerTransition"), CFSTR("transitionDidEnd:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerTransition"), CFSTR("viewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerTransition"), CFSTR("isAppearanceTransition"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_UIInteractiveHighlightContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("CCUIContentModuleContainerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CCUIContentModuleContainerViewController"), CFSTR("moduleContentView"), "@", 0);

}

- (void)transitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CCUIContentModuleContainerTransitionAccessibility;
  -[CCUIContentModuleContainerTransitionAccessibility transitionDidEnd:](&v10, sel_transitionDidEnd_);
  if (v3)
  {
    objc_opt_class();
    -[CCUIContentModuleContainerTransitionAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("viewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[CCUIContentModuleContainerTransitionAccessibility _axElementToFocusForViewController:](self, "_axElementToFocusForViewController:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[CCUIContentModuleContainerTransitionAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isAppearanceTransition"));
    -[CCUIContentModuleContainerTransitionAccessibility _axExpandedPlatterModalParentOfView:](self, "_axExpandedPlatterModalParentOfView:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityViewIsModal:", v8);
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v7);

  }
}

- (id)_axExpandedPlatterModalParentOfView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  _QWORD v7[5];

  v3 = a3;
  v4 = MEMORY[0x23490BCB8](CFSTR("_UIInteractiveHighlightContentView"));
  if (v4)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __89__CCUIContentModuleContainerTransitionAccessibility__axExpandedPlatterModalParentOfView___block_invoke;
    v7[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v7[4] = v4;
    objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", v7, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __89__CCUIContentModuleContainerTransitionAccessibility__axExpandedPlatterModalParentOfView___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (id)_axElementToFocusForViewController:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("expanded")))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("moduleContentView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v5, "_accessibilityControlCenterElementToFocusAfterClose"),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("moduleContentView"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  return v4;
}

@end
