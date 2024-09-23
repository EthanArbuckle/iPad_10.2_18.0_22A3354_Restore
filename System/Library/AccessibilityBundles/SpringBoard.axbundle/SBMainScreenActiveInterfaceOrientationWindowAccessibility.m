@implementation SBMainScreenActiveInterfaceOrientationWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMainScreenActiveInterfaceOrientationWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWindowScene"), CFSTR("floatingDockController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("floatingDockWindow"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("isPresentingFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFloatingDockController"), CFSTR("dismissPresentedFolderAnimated:completion:"), "v", "B", "@?", 0);

}

- (BOOL)accessibilityElementsHidden
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if (-[SBMainScreenActiveInterfaceOrientationWindowAccessibility _axIsFloatingDockWindow](self, "_axIsFloatingDockWindow"))
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "isDockVisible"))
    {
      objc_msgSend(MEMORY[0x24BE006F0], "server");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "isControlCenterVisible");

    }
    else
    {
      v5 = 1;
    }

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return -[SBMainScreenActiveInterfaceOrientationWindowAccessibility accessibilityElementsHidden](&v7, sel_accessibilityElementsHidden);
  }
  return v5;
}

- (BOOL)_accessibilityWindowVisible
{
  void *v3;
  char v4;
  objc_super v6;

  if (-[SBMainScreenActiveInterfaceOrientationWindowAccessibility _axIsFloatingDockWindow](self, "_axIsFloatingDockWindow"))
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isDockVisible");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return -[SBMainScreenActiveInterfaceOrientationWindowAccessibility _accessibilityWindowVisible](&v6, sel__accessibilityWindowVisible);
  }
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  BOOL v4;
  objc_super v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  id v11;
  objc_super v12;

  if (-[SBMainScreenActiveInterfaceOrientationWindowAccessibility _axIsFloatingDockWindow](self, "_axIsFloatingDockWindow"))
  {
    -[SBMainScreenActiveInterfaceOrientationWindowAccessibility _axFloatingDockController](self, "_axFloatingDockController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPresentingFolder")))
    {
      v7 = MEMORY[0x24BDAC760];
      v8 = 3221225472;
      v9 = __87__SBMainScreenActiveInterfaceOrientationWindowAccessibility_accessibilityPerformEscape__block_invoke;
      v10 = &unk_250367AD0;
      v11 = v3;
      AXPerformSafeBlock();

      v4 = 1;
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
      v4 = -[SBMainScreenActiveInterfaceOrientationWindowAccessibility accessibilityPerformEscape](&v6, sel_accessibilityPerformEscape);
    }

  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBMainScreenActiveInterfaceOrientationWindowAccessibility;
    return -[SBMainScreenActiveInterfaceOrientationWindowAccessibility accessibilityPerformEscape](&v12, sel_accessibilityPerformEscape);
  }
  return v4;
}

uint64_t __87__SBMainScreenActiveInterfaceOrientationWindowAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissPresentedFolderAnimated:completion:", 1, 0);
}

- (BOOL)_axIsFloatingDockWindow
{
  void *v3;
  SBMainScreenActiveInterfaceOrientationWindowAccessibility *v4;
  BOOL v5;

  if (!AXDeviceIsPad())
    return 0;
  -[SBMainScreenActiveInterfaceOrientationWindowAccessibility _axFloatingDockController](self, "_axFloatingDockController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("floatingDockWindow"));
  v4 = (SBMainScreenActiveInterfaceOrientationWindowAccessibility *)objc_claimAutoreleasedReturnValue();
  v5 = v4 == self;

  return v5;
}

- (id)_axFloatingDockController
{
  void *v2;
  void *v3;

  AXWindowScene(CFSTR("activeDisplayWindowScene"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("floatingDockController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
