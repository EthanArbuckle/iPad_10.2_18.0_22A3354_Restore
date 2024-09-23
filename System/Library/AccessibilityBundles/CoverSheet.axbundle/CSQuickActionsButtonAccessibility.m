@implementation CSQuickActionsButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSQuickActionsButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickActionsButton"), CFSTR("action"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CSFlashlightQuickAction"));
  objc_msgSend(v3, "validateClass:", CFSTR("CSCameraQuickAction"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickAction"), CFSTR("isSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CSAction"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSQuickActionsButton"), CFSTR("CSProminentButtonControl"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSProminentButtonControl"), CFSTR("_backgroundEffectView"), "UIVisualEffectView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickActionsButton"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickActionsView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickActionsViewController"), CFSTR("coverSheetViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewController"), CFSTR("isPasscodeLockVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickActionsViewController"), CFSTR("_resetIdleTimer"), "v", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CSAction"), CFSTR("actionWithType:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSQuickActionsViewController"), CFSTR("CSCoverSheetViewControllerBase"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSCoverSheetViewControllerBase"), CFSTR("sendAction:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CSQuickActionsButton"), CFSTR("CSProminentButtonControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSProminentButtonControl"), CFSTR("setSelected:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickAction"), CFSTR("supportsSelection"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSQuickAction"), CFSTR("fireAction"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSSystemQuickAction"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CHUISControlViewModel"), CFSTR("title"));

}

- (BOOL)isAccessibilityElement
{
  return !-[CSQuickActionsButtonAccessibility _accessibilityIsPasscodeLockVisible](self, "_accessibilityIsPasscodeLockVisible");
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  void *v8;
  objc_super v9;

  -[CSQuickActionsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CSFlashlightQuickAction"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("flashlight");
LABEL_5:
    accessibilitySBLocalizedString(v4);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  NSClassFromString(CFSTR("CSCameraQuickAction"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = CFSTR("camera");
    goto LABEL_5;
  }
  NSClassFromString(CFSTR("CSSystemQuickAction"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("viewModel"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeStringForKey:", CFSTR("title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_7;
  }
  v9.receiver = self;
  v9.super_class = (Class)CSQuickActionsButtonAccessibility;
  -[CSQuickActionsButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_6:
  v6 = (void *)v5;
LABEL_7:

  return v6;
}

- (id)accessibilityValue
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[CSQuickActionsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("action"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CSQuickAction"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSelected")))
      v4 = CFSTR("quickaction.state.on");
    else
      v4 = CFSTR("quickaction.state.off");
    accessibilitySBLocalizedString(v4);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CSQuickActionsButtonAccessibility;
    -[CSQuickActionsButtonAccessibility accessibilityValue](&v8, sel_accessibilityValue);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSQuickActionsButtonAccessibility;
  return -[CSQuickActionsButtonAccessibility accessibilityTraits](&v3, sel_accessibilityTraits) & ~*MEMORY[0x24BDF7400] | *MEMORY[0x24BDF73B0];
}

- (BOOL)accessibilityActivate
{
  AXPerformSafeBlock();
  return 1;
}

void __58__CSQuickActionsButtonAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("action"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fireAction");
  if ((objc_msgSend(v5, "supportsSelection") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setSelected:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_axDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_resetIdleTimer");

  objc_msgSend(*(id *)(a1 + 32), "_axDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class actionWithType:](NSClassFromString(CFSTR("CSAction")), "actionWithType:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendAction:", v4);

}

- (id)accessibilityPath
{
  void *v2;
  void *v3;

  -[CSQuickActionsButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_backgroundEffectView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityCirclePathBasedOnBoundsWidth");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axDelegate
{
  return (id)-[CSQuickActionsButtonAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate"));
}

- (BOOL)_accessibilityIsPasscodeLockVisible
{
  void *v2;
  void *v3;
  char v4;

  -[CSQuickActionsButtonAccessibility _axDelegate](self, "_axDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("coverSheetViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPasscodeLockVisible"));

  return v4;
}

@end
