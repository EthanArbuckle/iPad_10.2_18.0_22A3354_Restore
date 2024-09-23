@implementation SBAppClipOverlayViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBAppClipOverlayViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppClipOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppClipOverlayViewController"), CFSTR("overlayViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppClipOverlayViewController"), CFSTR("setSceneActivationState:animated:"), "v", "q", "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CPSClipOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSClipOverlayViewController"), CFSTR("_banner"), "CPSAppAttributionBanner");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSAppAttributionBanner"), CFSTR("_titleLabel"), "CPSLabelWithPlaceholder");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSAppAttributionBanner"), CFSTR("_subtitleLabel"), "CPSLabelWithPlaceholder");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CPSAppAttributionBanner"), CFSTR("tapAction"), "@?", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBAppClipOverlayViewControllerAccessibility;
  -[SBAppClipOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v20, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(location) = 0;
  objc_opt_class();
  -[SBAppClipOverlayViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("overlayViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKey:", CFSTR("_banner"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("_titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("appClip.poweredBy.banner.label"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("appClip.appStore.button.label"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v16, v11, v15, CFSTR("__AXStringForVariablesSentinel"));

  objc_initWeak(&location, v7);
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v17[3] = &unk_250368110;
  objc_copyWeak(&v18, &location);
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", v17);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);

}

uint64_t __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  uint64_t v3;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("tapAction"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v2;
    AXPerformSafeBlock();

    v3 = 1;
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __89__SBAppClipOverlayViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSceneActivationState:(int64_t)a3 animated:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBAppClipOverlayViewControllerAccessibility;
  -[SBAppClipOverlayViewControllerAccessibility setSceneActivationState:animated:](&v5, sel_setSceneActivationState_animated_, a3, a4);
  -[SBAppClipOverlayViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
