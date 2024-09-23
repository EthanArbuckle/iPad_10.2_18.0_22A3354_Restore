@implementation SBTransientOverlayWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBTransientOverlayWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRemoteTransientOverlayHostContentAdapter"), CFSTR("_performButtonEvents:"), "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRemoteTransientOverlayHostContentAdapter"), CFSTR("_hostRemoteViewController"), "SBRemoteTransientOverlayHostViewController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIRemoteViewController"), CFSTR("serviceBundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBTransientOverlayWindow"), CFSTR("UIWindow"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRemoteTransientOverlayViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRemoteTransientOverlayHostViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRemoteTransientOverlayViewController"), CFSTR("_hostContentAdapter"), "SBRemoteTransientOverlayHostContentAdapter");

}

- (BOOL)accessibilityViewIsModal
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  int v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTransientOverlayWindowAccessibility;
  -[SBTransientOverlayWindowAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[SBTransientOverlayWindowAccessibility _axRemoteServiceBundleIdentifier](self, "_axRemoteServiceBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime"));

  if (v4)
  {
    -[SBTransientOverlayWindowAccessibility _axAdditionalElements](self, "_axAdditionalElements");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayWindowAccessibility _accessibilitySetAdditionalElements:](self, "_accessibilitySetAdditionalElements:", v5);

  }
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;
  int v3;

  -[SBTransientOverlayWindowAccessibility _axRemoteServiceBundleIdentifier](self, "_axRemoteServiceBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.shortcuts.runtime"));

  if (v3)
    AXPerformSafeBlock();
  return v3;
}

void __67__SBTransientOverlayWindowAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axRemoteContentViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_performButtonEvents:", 16);

}

- (id)_axAdditionalElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke;
  v10[3] = &unk_250368268;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "_setAccessibilityFrameBlock:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke_2;
  v8[3] = &unk_250368110;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "_setAccessibilityActivateBlock:", v8);
  objc_msgSend(v4, "_accessibilitySetSortPriority:", -1);
  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  accessibilityLocalizedString(CFSTR("springboard.shortcutmenu.dismiss"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  objc_msgSend(v3, "axSafelyAddObject:", v4);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v3;
}

double __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  UIAccessibilityFrameForBounds();
  v4 = v3;

  return v4;
}

uint64_t __62__SBTransientOverlayWindowAccessibility__axAdditionalElements__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "accessibilityPerformEscape");

  return 1;
}

- (id)_axRemoteServiceBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBTransientOverlayWindowAccessibility _axRemoteContentViewController](self, "_axRemoteContentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("serviceBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axRemoteContentViewController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SBRemoteTransientOverlayViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKeyPath:", CFSTR("_hostContentAdapter._hostRemoteViewController"));
  }
  else
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_hostRemoteViewController"));
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_accessibilityIsInWidgetStack
{
  void *v3;
  void *v4;
  char isKindOfClass;

  objc_opt_class();
  -[SBTransientOverlayWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SBAmbientTransientOverlayViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
