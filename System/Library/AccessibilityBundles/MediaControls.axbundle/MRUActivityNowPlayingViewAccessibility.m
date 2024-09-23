@implementation MRUActivityNowPlayingViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUActivityNowPlayingView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityNowPlayingView"), CFSTR("leadingView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityNowPlayingView"), CFSTR("trailingView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MRUActivityNowPlayingViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUActivityNowPlayingViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("SBUISystemApertureElementContextProviding"), CFSTR("systemApertureElementContext"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("SBUISystemApertureElementContext"), CFSTR("setElementNeedsUpdate"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("SBUISA_layoutMode"), "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUActivityNowPlayingView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityNowPlayingView"), CFSTR("updateVisibilty"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUActivityTrailingAccessoryView"), CFSTR("routeImage"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  objc_super v16;
  char v17;

  -[MRUActivityNowPlayingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v17 = 0;
    objc_opt_class();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("routeImage"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v6);

  }
  objc_msgSend(MEMORY[0x24BDDB958], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "musicHapticsEnabled");

  if (v8)
  {
    -[MRUActivityNowPlayingViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("trailingView"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityLabelBlock:", &__block_literal_global);

  }
  v16.receiver = self;
  v16.super_class = (Class)MRUActivityNowPlayingViewAccessibility;
  -[MRUActivityNowPlayingViewAccessibility _accessibilityLoadAccessibilityInformation](&v16, sel__accessibilityLoadAccessibilityInformation);
  -[MRUActivityNowPlayingViewAccessibility _accessibilityFindViewAncestor:startWithSelf:](self, "_accessibilityFindViewAncestor:startWithSelf:", &__block_literal_global_221, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_accessibilityViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "safeValueForKey:", CFSTR("systemApertureElementContext"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v15;
      AXPerformSafeBlock();

    }
  }

}

id __84__MRUActivityNowPlayingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  __CFString *v1;
  void *v2;

  objc_msgSend(MEMORY[0x24BE006C0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "hapticMusicActive"))
    v1 = CFSTR("music.haptics.active");
  else
    v1 = CFSTR("music.haptics.inactive");
  accessibilityLocalizedString(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __84__MRUActivityNowPlayingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MRUActivityNowPlayingViewController"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __84__MRUActivityNowPlayingViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setElementNeedsUpdate");
}

- (void)updateVisibilty
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MRUActivityNowPlayingViewAccessibility;
  -[MRUActivityNowPlayingViewAccessibility updateVisibilty](&v3, sel_updateVisibilty);
  if (-[MRUActivityNowPlayingViewAccessibility safeIntForKey:](self, "safeIntForKey:", CFSTR("SBUISA_layoutMode")) == 4)UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

@end
