@implementation SBMainSwitcherWindowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMainSwitcherWindow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMainSwitcherWindow"), CFSTR("UIWindow"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIWindow"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMainSwitcherControllerCoordinator"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_slideOverTongue"), "SBSlideOverTongueView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleUnderlayAccessoryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherSpaceUnderlayAccessoryView"), CFSTR("_resizeGrabber"), "SBSeparatorView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("isAnySwitcherVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentLayoutState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBControlCenterController"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("sharedInstanceIfExists"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBControlCenterController"), CFSTR("isPresented"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBSwitcherViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherViewController"), CFSTR("delegate"), "@", 0);

}

- (id)_axTongueGrabber
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXSwitcherController(CFSTR("activeDisplayWindowScene"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("_slideOverTongue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axSideAppDivider
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXSwitcherController(CFSTR("activeDisplayWindowScene"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(v4, "safeDictionaryForKey:", CFSTR("visibleUnderlayAccessoryViews"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v9)
        objc_enumerationMutation(v6);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "safeUIViewForKey:", CFSTR("_resizeGrabber"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "_accessibilityViewIsVisible") & 1) != 0)
        break;

      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (BOOL)_axMultiAppNubletsVisible
{
  void *v3;
  char v4;
  void *v5;

  -[SBMainSwitcherWindowAccessibility _axTongueGrabber](self, "_axTongueGrabber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_accessibilityViewIsVisible") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[SBMainSwitcherWindowAccessibility _axSideAppDivider](self, "_axSideAppDivider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "_accessibilityViewIsVisible");

  }
  return v4;
}

- (BOOL)_axIsAnySwitcherVisible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  void *v11;

  -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isAnySwitcherVisible"));

  -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AXSwitcherController(CFSTR("activeDisplayWindowScene"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "safeValueForKeyPath:", CFSTR("_currentLayoutState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode"));

  v9 = 1;
  if ((v4 & 1) == 0 && v8 != 3)
  {
    -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v10, "_axIsShelfSwitcherVisible") & 1) == 0)
    {
      -[SBMainSwitcherWindowAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v11, "_axIsAppSwitcherPeeking");

    }
  }

  return v9;
}

- (BOOL)_axIsVisible
{
  return -[SBMainSwitcherWindowAccessibility _axIsAnySwitcherVisible](self, "_axIsAnySwitcherVisible")
      || -[SBMainSwitcherWindowAccessibility _axMultiAppNubletsVisible](self, "_axMultiAppNubletsVisible");
}

- (BOOL)_axIsControlCenterVisible
{
  void *v2;
  char v3;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBControlCenterController")), "safeValueForKey:", CFSTR("sharedInstanceIfExists"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isPresented"));

  return v3;
}

- (int64_t)_accessibilityInterfaceOrientationForScreenCoordinates
{
  return 1;
}

- (BOOL)_accessibilityUseWindowBoundsForOutOfBoundsChecking
{
  return 1;
}

- (id)_axMainSwitcher
{
  void *v2;
  uint64_t v3;
  void *v4;

  -[SBMainSwitcherWindowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBSwitcherViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
