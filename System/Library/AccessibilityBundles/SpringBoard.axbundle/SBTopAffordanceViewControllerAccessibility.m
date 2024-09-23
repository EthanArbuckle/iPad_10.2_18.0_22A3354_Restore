@implementation SBTopAffordanceViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBTopAffordanceViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBTopAffordanceViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBTopAffordanceViewController"), CFSTR("dotsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleShelves"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherShelfViewController"), CFSTR("_contentViewController"), "SBFluidSwitcherViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("contentView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTopAffordanceViewControllerAccessibility;
  -[SBTopAffordanceViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBTopAffordanceViewControllerAccessibility _axMarkupView](self, "_axMarkupView");
}

- (void)_axMarkupView
{
  void *v2;
  void *v3;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "_setAccessibilityCustomActionsBlock:", &__block_literal_global_14);
}

id __59__SBTopAffordanceViewControllerAccessibility__axMarkupView__block_invoke()
{
  void *v0;
  int v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isShelfSwitcherVisible");

  if (!v1)
    return 0;
  v2 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityLocalizedString(CFSTR("top.affordance.button.dismiss.shelf"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithName:actionHandler:", v3, &__block_literal_global_210);

  v7[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __59__SBTopAffordanceViewControllerAccessibility__axMarkupView__block_invoke_2()
{
  void *v0;

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "dismissShelfSwitcher");

  return 1;
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBTopAffordanceViewControllerAccessibility;
  -[SBTopAffordanceViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SBTopAffordanceViewControllerAccessibility _axMarkupView](self, "_axMarkupView");
}

- (id)_axMainSwitcher
{
  void *v2;
  void *v3;

  objc_opt_class();
  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
