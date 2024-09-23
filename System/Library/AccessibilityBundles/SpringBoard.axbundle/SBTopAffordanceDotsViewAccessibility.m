@implementation SBTopAffordanceDotsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBTopAffordanceDotsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBTopAffordanceDotsView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"), CFSTR("_deviceApplicationSceneHandle"), "SBDeviceApplicationSceneHandle");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeviceApplicationSceneHandle"), CFSTR("SBSceneHandle"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSceneHandle"), CFSTR("sceneIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("continuousExposeStripTongueViewTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDefaultImplementationsSwitcherModifier"), CFSTR("isContinuousExposeStripVisible"), "B", 0);

}

- (id)_axApplicationDisplayName
{
  JUMPOUT(0x23491F7D4);
}

- (void)_axSetApplicationDisplayName:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;
  objc_super v7;

  -[SBTopAffordanceDotsViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_axIsChamoisSwitcherVisible");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    return -[SBTopAffordanceDotsViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    return *MEMORY[0x24BDFEFD8] | -[SBTopAffordanceDotsViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  }
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("top.affordance.button"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTopAffordanceDotsViewAccessibility _axApplicationDisplayName](self, "_axApplicationDisplayName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = &stru_25036C388;
  if (v5)
    v7 = (const __CFString *)v5;
  objc_msgSend(v3, "stringWithFormat:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  char v3;

  -[SBTopAffordanceDotsViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_axIsAppSwitcherPeeking");

  return v3 ^ 1;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  void *v5;
  objc_super v7;

  -[SBTopAffordanceDotsViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_axIsChamoisSwitcherVisible");

  if (v4)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    -[SBTopAffordanceDotsViewAccessibility accessibilityHint](&v7, sel_accessibilityHint);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    accessibilityLocalizedString(CFSTR("top.affordance.button.hint"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  objc_super v17;

  -[SBTopAffordanceDotsViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axFluidSwitcherViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("rootModifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isContinuousExposeStripVisible"));

  if (v6)
  {
    v17.receiver = self;
    v17.super_class = (Class)SBTopAffordanceDotsViewAccessibility;
    -[SBTopAffordanceDotsViewAccessibility accessibilityCustomActions](&v17, sel_accessibilityCustomActions);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("stage.manager.app.strip.custom.action.label"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke;
    v15 = &unk_250367AF8;
    v16 = v4;
    v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, &v12);

    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v10, v12, v13, v14, v15);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

uint64_t __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __66__SBTopAffordanceDotsViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "continuousExposeStripTongueViewTapped:", 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (id)_accessibilityRoleDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBTopAffordanceDotsViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("_deviceApplicationSceneHandle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeStringForKey:", CFSTR("sceneIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __69__SBTopAffordanceDotsViewAccessibility__accessibilityRoleDescription__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBMedusaDecoratedDeviceApplicationSceneViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGRect)axBounds
{
  CGRect v2;

  -[SBTopAffordanceDotsViewAccessibility bounds](self, "bounds");
  return CGRectInset(v2, -10.0, -10.0);
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

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

@end
