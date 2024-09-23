@implementation SBSwitcherShelfViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSwitcherShelfViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherShelfViewController"), CFSTR("_contentViewController"), "SBFluidSwitcherViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherShelfViewController"), CFSTR("initWithShelf:dataSource:delegate:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherShelfViewController"), CFSTR("viewWillAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSwitcherShelfViewController"), CFSTR("SBAttentionAwarenessClientDelegate"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBAttentionAwarenessClientDelegate"), CFSTR("clientDidResetForUserAttention:withEvent:"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  -[SBSwitcherShelfViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBSwitcherShelfViewControllerAccessibility _axSetupShelfSwitcherViewController](self, "_axSetupShelfSwitcherViewController");
}

- (SBSwitcherShelfViewControllerAccessibility)initWithShelf:(id)a3 dataSource:(id)a4 delegate:(id)a5
{
  SBSwitcherShelfViewControllerAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  v5 = -[SBSwitcherShelfViewControllerAccessibility initWithShelf:dataSource:delegate:](&v7, sel_initWithShelf_dataSource_delegate_, a3, a4, a5);
  -[SBSwitcherShelfViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
  -[SBSwitcherShelfViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBSwitcherShelfViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_axSetupShelfSwitcherViewController
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBSwitcherShelfViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_setAXSwitcherType:", &__block_literal_global_4);
}

uint64_t __81__SBSwitcherShelfViewControllerAccessibility__axSetupShelfSwitcherViewController__block_invoke()
{
  return 3;
}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  id v6;
  id v7;
  objc_super v8;

  v6 = a3;
  v7 = a4;
  if (!UIAccessibilityIsVoiceOverRunning()
    && (-[SBSwitcherShelfViewControllerAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem") & 1) == 0)
  {
    v8.receiver = self;
    v8.super_class = (Class)SBSwitcherShelfViewControllerAccessibility;
    -[SBSwitcherShelfViewControllerAccessibility clientDidResetForUserAttention:withEvent:](&v8, sel_clientDidResetForUserAttention_withEvent_, v6, v7);
  }

}

@end
