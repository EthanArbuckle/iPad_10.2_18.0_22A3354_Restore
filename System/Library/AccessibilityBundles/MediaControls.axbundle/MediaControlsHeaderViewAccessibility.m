@implementation MediaControlsHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MediaControlsHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("initWithFrame:"), "@", "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("routingButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("doneButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("routeLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("secondaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("primaryMarqueeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("secondaryMarqueeView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("style"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("layoutSubviews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MediaControlsHeaderView"), CFSTR("launchNowPlayingAppButton"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MediaControlsPanelViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MPRouteLabel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MPRouteLabel"), CFSTR("titleLabel"), "@", 0);

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
  Class v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];
  id v27;
  id location;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)MediaControlsHeaderViewAccessibility;
  -[MediaControlsHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](&v29, sel__accessibilityLoadAccessibilityInformation);
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("doneButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("done.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  objc_opt_class();
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(location) = 0;
  objc_opt_class();
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MediaControlsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("primaryMarqueeView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("secondaryMarqueeView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("routeLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeValueForKey:", CFSTR("titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setIsAccessibilityElement:", 0);
  objc_msgSend(v8, "setIsAccessibilityElement:", 0);
  objc_msgSend(v11, "setIsAccessibilityElement:", 0);
  objc_msgSend(v12, "setIsAccessibilityElement:", 0);
  objc_msgSend(v9, "setAccessibilityElementsHidden:", 1);
  objc_msgSend(v10, "setAccessibilityElementsHidden:", 1);
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("launchNowPlayingAppButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIsAccessibilityElement:", 0);

  objc_initWeak(&location, self);
  v14 = NSClassFromString(CFSTR("MediaControlsPanelViewController"));
  v15 = MEMORY[0x24BDAC760];
  if (v14)
  {
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
    v26[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
    v26[4] = v14;
    -[MediaControlsHeaderViewAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v26, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&v27, v16);

    v17 = objc_loadWeakRetained(&v27);
    objc_msgSend(v17, "setAccessibilityContainerType:", 4);

    v18 = objc_loadWeakRetained(&v27);
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
    v24[3] = &unk_250272648;
    objc_copyWeak(&v25, &location);
    objc_msgSend(v18, "_setAccessibilityLabelBlock:", v24);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&v27);
  }
  -[MediaControlsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("routingButton"));
  v22[0] = v15;
  v22[1] = 3221225472;
  v22[2] = __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v22[3] = &unk_250272670;
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v23 = v19;
  v20 = (void *)MEMORY[0x234914208](v22);
  v21 = (void *)objc_msgSend(v20, "copy");
  objc_msgSend(v19, "_setAccessibilityPathBlock:", v21);

  objc_destroyWeak(&location);
}

uint64_t __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  char isKindOfClass;

  objc_msgSend(a2, "_accessibilityViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

id __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("primaryMarqueeView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  if (v3 >= 0.1)
  {
    objc_opt_class();
    objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("routeLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(WeakRetained, "safeIntegerForKey:", CFSTR("style")) != 2)
    {
      accessibilityLocalizedString(CFSTR("wha.panel.active"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v7 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v7;
    }

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __82__MediaControlsHeaderViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "accessibilityFrame");
  return objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:cornerRadius:");
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MediaControlsHeaderViewAccessibility _accessibilityCombinedTitleElement](self, "_accessibilityCombinedTitleElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("primaryMarqueeView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsHeaderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("secondaryMarqueeView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[MediaControlsHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v8, "removeObject:", v4);
  objc_msgSend(v8, "removeObject:", v5);
  objc_msgSend(v8, "insertObject:atIndex:", v3, 0);

  return v8;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MediaControlsHeaderViewAccessibility;
  -[MediaControlsHeaderViewAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[MediaControlsHeaderViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityCombinedTitleElement
{
  void *v3;
  uint64_t v4;
  _QWORD v6[6];
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[MediaControlsHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("combinedTitleElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_initWeak(&location, self);
    v4 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke;
    v11[3] = &unk_250272648;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", v11);
    v9[0] = v4;
    v9[1] = 3221225472;
    v9[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_2;
    v9[3] = &unk_250272698;
    objc_copyWeak(&v10, &location);
    objc_msgSend(v3, "_setAccessibilityFrameBlock:", v9);
    v7[0] = v4;
    v7[1] = 3221225472;
    v7[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_3;
    v7[3] = &unk_2502726C0;
    objc_copyWeak(&v8, &location);
    v7[4] = self;
    objc_msgSend(v3, "_setAccessibilityHintBlock:", v7);
    v6[0] = v4;
    v6[1] = 3221225472;
    v6[2] = __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_4;
    v6[3] = &unk_2502726E8;
    v6[4] = self;
    v6[5] = objc_msgSend(v3, "accessibilityTraits");
    objc_msgSend(v3, "_setAccessibilityTraitsBlock:", v6);
    -[MediaControlsHeaderViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("combinedTitleElement"));
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  objc_opt_class();
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("primaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  v6 = objc_loadWeakRetained(v2);
  objc_msgSend(v6, "safeValueForKey:", CFSTR("secondaryLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_loadWeakRetained(v2);
  objc_msgSend(v9, "safeValueForKey:", CFSTR("routeLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "accessibilityLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

double __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_2(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeUIViewForKey:", CFSTR("primaryMarqueeView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("secondaryMarqueeView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "safeUIViewForKey:", CFSTR("routeLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 3, v3, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXFrameForElements();
  v10 = v9;

  return v10;
}

id __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("routeLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("launchNowPlayingAppButton"));
  v5 = objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "isHidden");
  v7 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("style"));
  if ((v5 & 1) != 0)
  {
    if (v7 == 2)
    {
      v8 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("expand.collapsed.route.hint"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "accessibilityLabel");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    accessibilityLocalizedString(CFSTR("launch.now.playing.app.button.hint"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  UIAccessibilityControlCenterModuleExpandPlatterHint();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t __74__MediaControlsHeaderViewAccessibility__accessibilityCombinedTitleElement__block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("launchNowPlayingAppButton"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v2) = objc_msgSend(v3, "isHidden");
  v4 = objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("style"));
  v5 = (_QWORD *)MEMORY[0x24BDF73E0];
  if ((v2 & (v4 != 2)) == 0)
    v5 = (_QWORD *)MEMORY[0x24BDF73B0];
  return *v5 | *(_QWORD *)(a1 + 40);
}

@end
