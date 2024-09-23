@implementation UISplitViewControllerPanelImplAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISplitViewControllerPanelImpl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  const __CFString *v7;
  const char *v8;
  const char *v9;
  id v10;
  id *v11;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v11 = location;
  v10 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("UISplitViewControllerPanelImpl");
  v8 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  v3 = CFSTR("panelController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_unspecifiedCompositionDisplayModeButtonItem"), v8, 0);
  v4 = "q";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_effectiveTargetDisplayMode"), 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("loadView"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("setViewControllers:"), v6, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_svc"), "UISplitViewController");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_sidebarToggleButtonItem"), "_UIFloatableBarButtonItem");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v5, CFSTR("_secondaryOnlyShortcutButtonItem"), "UIBarButtonItem");
  v9 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("viewDidAppear:"), v6, "B", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("displayMode"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("style"), v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v3, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_handleFocusMovementDidFail:"), v6, v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("showColumn:"), v6, v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("hideColumn:"), v6, v4, 0);
  v7 = CFSTR("UIPanelController");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v7, CFSTR("mainViewController"), v8, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIBarButtonItem"), CFSTR("_showsChevron"), v9, 0);
  objc_storeStrong(v11, v10);
}

- (void)loadView
{
  id v2;
  id v3;
  objc_super v4;
  SEL v5;
  UISplitViewControllerPanelImplAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  -[UISplitViewControllerPanelImplAccessibility loadView](&v4, sel_loadView);
  objc_opt_class();
  v2 = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_svc"));
  v3 = (id)__UIAccessibilityCastAsSafeCategory();

  -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v3);
  objc_storeStrong(&v3, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UISplitViewControllerPanelImplAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  -[UISplitViewControllerPanelImplAccessibility viewDidAppear:](&v3, sel_viewDidAppear_, a3);
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdatePanelController](v6, "_accessibilityUpdatePanelController");
}

- (void)setViewControllers:(id)a3
{
  id v3;
  id v4;
  objc_super v5;
  id location[2];
  UISplitViewControllerPanelImplAccessibility *v7;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5.receiver = v7;
  v5.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  -[UISplitViewControllerPanelImplAccessibility setViewControllers:](&v5, sel_setViewControllers_, location[0]);
  objc_opt_class();
  v3 = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKey:](v7, "safeValueForKey:", CFSTR("_svc"));
  v4 = (id)__UIAccessibilityCastAsSafeCategory();

  if ((objc_msgSend(v4, "isViewLoaded") & 1) != 0)
    -[UISplitViewControllerAccessibility _axModalizeViewControllerViews](v4);
  objc_storeStrong(&v4, 0);
  objc_storeStrong(location, 0);
}

- (id)displayModeButtonItem
{
  id v3;
  objc_super v4;
  id v5[2];
  UISplitViewControllerPanelImplAccessibility *v6;

  v6 = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  v5[0] = -[UISplitViewControllerPanelImplAccessibility displayModeButtonItem](&v4, sel_displayModeButtonItem);
  -[UISplitViewControllerPanelImplAccessibility _axApplyDisplayModeLabelToButtonItem:](v6, v5[0]);
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)_axApplyDisplayModeLabelToButtonItem:(void *)a1
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  char v6;
  id location;
  id v8;

  v8 = a1;
  location = 0;
  objc_storeStrong(&location, a2);
  if (v8 && location)
  {
    v6 = 0;
    if (objc_msgSend(v8, "safeIntegerForKey:", CFSTR("style")) == 1)
    {
      v4 = (id)objc_msgSend(v8, "safeValueForKey:", CFSTR("_effectiveTargetDisplayMode"));
      v5 = objc_msgSend(v4, "integerValue");

      if (v5 == 1)
      {
        v2 = location;
        v3 = (id)accessibilityUIKitLocalizedString();
        objc_msgSend(v2, "setAccessibilityLabel:");

        objc_msgSend(location, "accessibilitySetIdentification:", CFSTR("DisplayMode"));
        objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
        v6 = 1;
      }
    }
    if ((v6 & 1) == 0)
    {
      objc_msgSend(location, "setAccessibilityLabel:");
      objc_msgSend(location, "accessibilitySetIdentification:", 0);
      objc_msgSend(location, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB100]);
    }
  }
  objc_storeStrong(&location, 0);
}

- (void)_updateDisplayModeButtonItem
{
  objc_super v2;
  SEL v3;
  UISplitViewControllerPanelImplAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  -[UISplitViewControllerPanelImplAccessibility _updateDisplayModeButtonItem](&v2, sel__updateDisplayModeButtonItem);
  -[UISplitViewControllerPanelImplAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdatePanelController](v4, "_accessibilityUpdatePanelController");
}

- (void)_accessibilityUpdateSideBarToggleButtonItem
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;

  v16 = a1;
  if (a1)
  {
    v14 = 0;
    objc_opt_class();
    v4 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_sidebarToggleButtonItem"));
    v13 = (id)__UIAccessibilityCastAsClass();

    v12 = v13;
    objc_storeStrong(&v13, 0);
    v15 = v12;
    if ((objc_msgSend(v12, "safeBoolForKey:", CFSTR("_showsChevron")) & 1) != 0)
    {
      objc_msgSend(v15, "_setAccessibilityLabelBlock:");
      objc_msgSend(v15, "setAccessibilityIdentifier:", 0);
      objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | *MEMORY[0x24BEBB100]);
    }
    else
    {
      objc_initWeak(&v11, v16);
      v3 = v15;
      v5 = MEMORY[0x24BDAC760];
      v6 = -1073741824;
      v7 = 0;
      v8 = __90__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSideBarToggleButtonItem__block_invoke;
      v9 = &unk_24FF3DC00;
      objc_copyWeak(&v10, &v11);
      objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v5);
      v2 = v15;
      v1 = AXNoLoc(CFSTR("ToggleSidebar"));
      objc_msgSend(v2, "setAccessibilityIdentifier:");

      objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
      objc_destroyWeak(&v10);
      objc_destroyWeak(&v11);
    }
    objc_storeStrong(&v15, 0);
  }
}

id __90__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSideBarToggleButtonItem__block_invoke(uint64_t a1)
{
  id v2;
  BOOL v3;
  char v4;
  char v5;
  BOOL v6;
  char v7;
  char v8;
  id WeakRetained;
  uint64_t v10;
  id v12;
  uint64_t v13;
  id location;
  char v15;
  char v16;
  BOOL v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v22 = a1;
  v21 = a1;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v10 = objc_msgSend(WeakRetained, "safeUnsignedIntegerForKey:", CFSTR("displayMode"));

  v20 = v10;
  v12 = objc_loadWeakRetained((id *)(a1 + 32));
  v13 = objc_msgSend(v12, "safeIntegerForKey:", CFSTR("style"));

  v19 = v13;
  v18 = v13 == 1;
  v17 = v13 == 2;
  v16 = 0;
  if (v13 != 1 || (v8 = 1, v20 != 2))
  {
    v7 = 0;
    if (v17)
    {
      v6 = 1;
      if (v20 != 4)
        v6 = v20 == 5;
      v7 = v6;
    }
    v8 = v7;
  }
  v16 = v8;
  v15 = 0;
  if (!v18 || (v5 = 1, v20 != 1))
  {
    v4 = 0;
    if (v17)
    {
      v3 = 1;
      if (v20 != 2)
      {
        v3 = 1;
        if (v20 != 1)
        {
          v3 = 1;
          if (v20 != 3)
            v3 = v20 == 6;
        }
      }
      v4 = v3;
    }
    v5 = v4;
  }
  v15 = v5;
  location = 0;
  if ((v16 & 1) != 0)
  {
    objc_storeStrong(&location, CFSTR("hide.sidebar"));
  }
  else if ((v15 & 1) != 0)
  {
    objc_storeStrong(&location, CFSTR("show.sidebar"));
  }
  v2 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)_accessibilityUpdateSecondaryOnlyShortcutButtonItem
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  int v6;
  int v7;
  id (*v8)(id *);
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  char v14;
  id v15;
  id v16;

  v16 = a1;
  if (a1)
  {
    v14 = 0;
    objc_opt_class();
    v4 = (id)objc_msgSend(v16, "safeValueForKey:", CFSTR("_secondaryOnlyShortcutButtonItem"));
    v13 = (id)__UIAccessibilityCastAsClass();

    v12 = v13;
    objc_storeStrong(&v13, 0);
    v15 = v12;
    objc_initWeak(&v11, v16);
    v3 = v15;
    v5 = MEMORY[0x24BDAC760];
    v6 = -1073741824;
    v7 = 0;
    v8 = __98__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSecondaryOnlyShortcutButtonItem__block_invoke;
    v9 = &unk_24FF3DC00;
    objc_copyWeak(&v10, &v11);
    objc_msgSend(v3, "_setAccessibilityLabelBlock:", &v5);
    v2 = v15;
    v1 = AXNoLoc(CFSTR("ToggleFullscreen"));
    objc_msgSend(v2, "setAccessibilityIdentifier:");

    objc_msgSend(v15, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v11);
    objc_storeStrong(&v15, 0);
  }
}

id __98__UISplitViewControllerPanelImplAccessibility__accessibilityUpdateSecondaryOnlyShortcutButtonItem__block_invoke(id *a1)
{
  __CFString *v1;
  id WeakRetained;
  void *v4;
  id v5;
  id v6[4];

  v6[3] = a1;
  v6[2] = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v4 = (void *)objc_msgSend(WeakRetained, "safeUnsignedIntegerForKey:", CFSTR("displayMode"));

  v6[1] = v4;
  if (v4 == (void *)1)
    v1 = CFSTR("exit.fullscreen");
  else
    v1 = CFSTR("enter.fullscreen");
  v6[0] = v1;
  v5 = (id)UIKitAccessibilityLocalizedString();
  objc_storeStrong(v6, 0);
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  UISplitViewControllerPanelImplAccessibility *v2;
  id v3;
  objc_super v4;
  SEL v5;
  UISplitViewControllerPanelImplAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4.receiver = self;
  v4.super_class = (Class)UISplitViewControllerPanelImplAccessibility;
  -[UISplitViewControllerPanelImplAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdateSideBarToggleButtonItem](v6);
  -[UISplitViewControllerPanelImplAccessibility _accessibilityUpdateSecondaryOnlyShortcutButtonItem](v6);
  v2 = v6;
  v3 = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("_unspecifiedCompositionDisplayModeButtonItem"));
  -[UISplitViewControllerPanelImplAccessibility _axApplyDisplayModeLabelToButtonItem:](v2, v3);

}

- (id)_accessibilitySpeakThisViewController
{
  id v3;
  id v4;
  id v5;
  char v6;
  id v7[2];
  UISplitViewControllerPanelImplAccessibility *v8;

  v8 = self;
  v7[1] = (id)a2;
  v7[0] = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("panelController.collapsedViewController"));
  if (!v7[0])
  {
    v7[0] = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKeyPath:](v8, "safeValueForKeyPath:", CFSTR("panelController.mainViewController"));

  }
  v6 = 0;
  objc_opt_class();
  v5 = (id)__UIAccessibilityCastAsSafeCategory();
  v4 = v5;
  objc_storeStrong(&v5, 0);
  v3 = (id)objc_msgSend(v4, "_accessibilitySpeakThisViewController");

  objc_storeStrong(v7, 0);
  return v3;
}

- (void)_accessibilityUpdatePanelController
{
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = (id)-[UISplitViewControllerPanelImplAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("panelController"));
  NSClassFromString(CFSTR("UIPanelController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(location[0], "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

@end
