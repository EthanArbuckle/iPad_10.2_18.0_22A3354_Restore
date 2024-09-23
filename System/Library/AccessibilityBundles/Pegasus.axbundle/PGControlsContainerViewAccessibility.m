@implementation PGControlsContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PGControlsContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsContainerView"), CFSTR("_setPrefersControlsHidden:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsContainerView"), CFSTR("_setControlsHidden:animated:"), "v", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsContainerView"), CFSTR("_controlsShouldAutoHide"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PGControlsView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsContainerView"), CFSTR("_controlsView"), "PGControlsView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsView"), CFSTR("prefersControlsHidden"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PGControlsViewModel"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsContainerView"), CFSTR("_viewModel"), "PGControlsViewModel");
  objc_msgSend(v3, "validateClass:", CFSTR("PGControlsViewModelValues"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsViewModel"), CFSTR("_values"), "PGControlsViewModelValues");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsViewModelValues"), CFSTR("restoreButtonAccessibilityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsViewModelValues"), CFSTR("cancelButtonAccessibilityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsViewModelValues"), CFSTR("actionButtonAccessibilityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsViewModelValues"), CFSTR("skipBackButtonAccessibilityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PGControlsViewModelValues"), CFSTR("skipForwardButtonAccessibilityIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PGButtonView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_restoreButton"), "PGButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_cancelButton"), "PGButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_skipBackButton"), "PGButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_actionButton"), "PGButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_skipForwardButton"), "PGButtonView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PGControlsView"), CFSTR("_liveIndicatorBadgeButton"), "PGButtonView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
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
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[4];
  id v29;
  _QWORD v30[4];
  id v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  id location;
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v39.receiver = self;
  v39.super_class = (Class)PGControlsContainerViewAccessibility;
  -[PGControlsContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v39, sel__accessibilityLoadAccessibilityInformation);
  -[PGControlsContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_controlsView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_cancelButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v36[3] = &unk_2502F4148;
  objc_copyWeak(&v37, &location);
  objc_msgSend(v4, "_setAccessibilityLabelBlock:", v36);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_skipBackButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = v5;
  v34[1] = 3221225472;
  v34[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v34[3] = &unk_2502F4148;
  objc_copyWeak(&v35, &location);
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v34);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_skipForwardButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v5;
  v32[1] = 3221225472;
  v32[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3;
  v32[3] = &unk_2502F4148;
  objc_copyWeak(&v33, &location);
  objc_msgSend(v7, "_setAccessibilityLabelBlock:", v32);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_restoreButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v5;
  v30[1] = 3221225472;
  v30[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4;
  v30[3] = &unk_2502F4148;
  objc_copyWeak(&v31, &location);
  objc_msgSend(v8, "_setAccessibilityLabelBlock:", v30);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_actionButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5;
  v28[3] = &unk_2502F4148;
  objc_copyWeak(&v29, &location);
  objc_msgSend(v9, "_setAccessibilityLabelBlock:", v28);

  objc_msgSend(v3, "safeValueForKey:", CFSTR("_liveIndicatorBadgeButton"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("pip.live"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityLabel:", v11);

  v12 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_cancelButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_skipBackButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_skipForwardButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_restoreButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_actionButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "axArrayByIgnoringNilElementsWithCount:", 5, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v18;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v25;
    v22 = *MEMORY[0x24BDF73B0];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "setAccessibilityTraits:", v22 | objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "accessibilityTraits"));
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v40, 16);
    }
    while (v20);
  }

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v33);
  objc_destroyWeak(&v35);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&location);

}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("cancelButtonAccessibilityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("skipBackButtonAccessibilityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("skipForwardButtonAccessibilityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("restoreButtonAccessibilityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __82__PGControlsContainerViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_viewModel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_values"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("actionButtonAccessibilityIdentifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_setPrefersControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  int v8;
  id v9;
  objc_super v10;

  v4 = a4;
  v5 = a3;
  -[PGControlsContainerViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_controlsView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("prefersControlsHidden"));
  v10.receiver = self;
  v10.super_class = (Class)PGControlsContainerViewAccessibility;
  -[PGControlsContainerViewAccessibility _setPrefersControlsHidden:animated:](&v10, sel__setPrefersControlsHidden_animated_, v5, v4);
  if (!v5 && v8)
  {
    v9 = v7;
    AXPerformBlockOnMainThreadAfterDelay();

  }
}

void __75__PGControlsContainerViewAccessibility__setPrefersControlsHidden_animated___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_cancelButton"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(*MEMORY[0x24BEBB030], v1);

}

- (void)_setControlsHidden:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  void *v7;
  id v8;
  objc_super v9;

  v4 = a4;
  v5 = a3;
  -[PGControlsContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_controlsView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeBoolForKey:", CFSTR("isHidden"));
  v9.receiver = self;
  v9.super_class = (Class)PGControlsContainerViewAccessibility;
  -[PGControlsContainerViewAccessibility _setControlsHidden:animated:](&v9, sel__setControlsHidden_animated_, v5, v4);
  v8 = v7;
  AXPerformBlockOnMainThreadAfterDelay();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

void __68__PGControlsContainerViewAccessibility__setControlsHidden_animated___block_invoke(uint64_t a1)
{
  int v2;
  __CFString *v3;
  id v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "safeBoolForKey:", CFSTR("isHidden"));
  if (*(unsigned __int8 *)(a1 + 40) != v2)
  {
    if (v2)
      v3 = CFSTR("pip.controls.hidden");
    else
      v3 = CFSTR("pip.controls.visible");
    accessibilityLocalizedString(v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v4);

  }
}

- (BOOL)_controlsShouldAutoHide
{
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (_UIAccessibilityFullKeyboardAccessEnabled() & 1) != 0)
  {
    return 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)PGControlsContainerViewAccessibility;
  return -[PGControlsContainerViewAccessibility _controlsShouldAutoHide](&v4, sel__controlsShouldAutoHide);
}

@end
