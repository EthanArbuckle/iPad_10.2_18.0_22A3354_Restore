@implementation CFXEffectBrowserViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CFXEffectBrowserViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectBrowserViewController"), CFSTR("didSelectAppWithBundleIdentifier:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXEffectBrowserViewController"), CFSTR("selectedAppIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXCameraViewController"), CFSTR("cameraControlsViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CFXPreviewViewController"), CFSTR("bottomControlsDrawer"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _BOOL8 v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXEffectBrowserViewControllerAccessibility;
  -[CFXEffectBrowserViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CFXEffectBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedAppIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  -[CFXEffectBrowserViewControllerAccessibility _axHideAppropriateElements:](self, "_axHideAppropriateElements:", v4);
}

- (void)didSelectAppWithBundleIdentifier:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CFXEffectBrowserViewControllerAccessibility;
  -[CFXEffectBrowserViewControllerAccessibility didSelectAppWithBundleIdentifier:](&v5, sel_didSelectAppWithBundleIdentifier_);
  -[CFXEffectBrowserViewControllerAccessibility _axHideAppropriateElements:](self, "_axHideAppropriateElements:", a3 != 0);
}

- (void)_axHideAppropriateElements:(BOOL)a3
{
  _BOOL8 v3;
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
  _QWORD v16[4];
  id v17;
  id location;

  v3 = a3;
  LOBYTE(location) = 0;
  objc_opt_class();
  -[CFXEffectBrowserViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("parentViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x234909C04](CFSTR("CNKFaceTimeInCallControlsViewController"));
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((AXDeviceIsPad() & 1) != 0)
      goto LABEL_13;
    -[CFXEffectBrowserViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilityViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "_accessibilityFindSubviewDescendant:", &__block_literal_global_208);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityElementsHidden:", v3);
    if (v10)
    {
      MEMORY[0x234909C04](CFSTR("CFXCameraViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "safeValueForKeyPath:", CFSTR("cameraControlsViewController.view"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:
        v15 = v12;
        objc_msgSend(v12, "setAccessibilityElementsHidden:", v3);

        goto LABEL_12;
      }
      MEMORY[0x234909C04](CFSTR("CFXPreviewViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v10, "safeValueForKey:", CFSTR("bottomControlsDrawer"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_11;
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v3)
  {
    objc_initWeak(&location, v6);
    objc_msgSend(v6, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke;
    v16[3] = &unk_2501A9FD8;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v7, "_setAccessibilityElementsHiddenBlock:", v16);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v6, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_setAccessibilityElementsHiddenBlock:", 0);

    objc_msgSend(v6, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setAccessibilityElementsHidden:", 0);

  }
LABEL_13:
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);

}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isExpanded")) ^ 1;

  return v2;
}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  char isKindOfClass;
  void *v5;

  v2 = a2;
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x234909C04](CFSTR("CFXCameraViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isKindOfClass = 1;
  }
  else
  {
    objc_msgSend(v2, "_accessibilityViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x234909C04](CFSTR("CFXPreviewViewController"));
    isKindOfClass = objc_opt_isKindOfClass();

  }
  return isKindOfClass & 1;
}

uint64_t __74__CFXEffectBrowserViewControllerAccessibility__axHideAppropriateElements___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x234909C04](CFSTR("CKBrowserSwitcherFooterView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

@end
