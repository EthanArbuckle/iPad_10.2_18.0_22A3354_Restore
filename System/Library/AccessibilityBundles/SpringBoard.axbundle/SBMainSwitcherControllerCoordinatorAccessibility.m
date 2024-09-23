@implementation SBMainSwitcherControllerCoordinatorAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBMainSwitcherControllerCoordinator");
}

- (void)keyboardFocusController:(id)a3 externalSceneDidAcquireFocus:(id)a4
{
  id v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBMainSwitcherControllerCoordinatorAccessibility;
  v5 = a4;
  -[SBMainSwitcherControllerCoordinatorAccessibility keyboardFocusController:externalSceneDidAcquireFocus:](&v7, sel_keyboardFocusController_externalSceneDidAcquireFocus_, a3, v5);
  objc_msgSend(v5, "safeStringForKey:", CFSTR("identifier"), v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  UIAccessibilityPostNotification(*MEMORY[0x24BEBB008], v6);
}

uint64_t __83__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpSwitcherViewControllers__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_axIsTypeOfMainSwitcherVisible") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_loadWeakRetained(v1);
    if (objc_msgSend(v4, "_axIsFloatingSwitcherVisible"))
      v3 = 2;
    else
      v3 = 0;

  }
  return v3;
}

- (BOOL)_axIsTypeOfMainSwitcherVisible
{
  return -[SBMainSwitcherControllerCoordinatorAccessibility _axIsMainSwitcherVisible](self, "_axIsMainSwitcherVisible")
      || -[SBMainSwitcherControllerCoordinatorAccessibility _axIsAppSwitcherPeekingSplitView](self, "_axIsAppSwitcherPeekingSplitView");
}

- (BOOL)_axIsMainSwitcherVisible
{
  void *v4;
  char v5;

  if (-[SBMainSwitcherControllerCoordinatorAccessibility _axIsChamoisSwitcherVisible](self, "_axIsChamoisSwitcherVisible"))
  {
    return 1;
  }
  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("isMainSwitcherVisible"));

  return v5;
}

- (BOOL)_axIsFloatingSwitcherVisible
{
  void *v3;
  void *v4;
  BOOL v5;

  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentLayoutState"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isFloatingSwitcherVisible")) & 1) != 0
    || -[SBMainSwitcherControllerCoordinatorAccessibility _axIsAppSwitcherPeekingSlideOver](self, "_axIsAppSwitcherPeekingSlideOver");

  return v5;
}

- (BOOL)_axIsChamoisSwitcherVisible
{
  void *v2;
  void *v3;
  uint64_t v4;
  char v5;
  BOOL v6;

  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentLayoutState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode"));

  v5 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isChamoisWindowingUIEnabled"));
  if (v4 == 3)
    v6 = v5;
  else
    v6 = 0;

  return v6;
}

- (BOOL)_axIsAppSwitcherPeekingSlideOver
{
  void *v3;
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;

  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentMainAppLayout"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = 0;
  }
  else
  {
    -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_currentFloatingAppLayout"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (id)_activeDisplaySwitcherController
{
  return AXSwitcherController(CFSTR("activeDisplayWindowScene"), self);
}

- (BOOL)_axIsAppSwitcherPeekingSplitView
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentLayoutState"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("peekConfiguration"));

  return v4 > 1;
}

- (BOOL)_axIsShelfSwitcherVisible
{
  void *v2;
  void *v3;
  BOOL v4;

  -[SBMainSwitcherControllerCoordinatorAccessibility _axFluidSwitcherViewController](self, "_axFluidSwitcherViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeDictionaryForKey:", CFSTR("visibleShelves"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)_axFluidSwitcherViewController
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("contentViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBMainSwitcherControllerCoordinatorAccessibility;
  -[SBMainSwitcherControllerCoordinatorAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SBMainSwitcherControllerCoordinatorAccessibility _axSetUpWrapperViews](self, "_axSetUpWrapperViews");
  -[SBMainSwitcherControllerCoordinatorAccessibility _axSetUpSwitcherViewControllers](self, "_axSetUpSwitcherViewControllers");
}

- (void)_axSetUpWrapperViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  -[SBMainSwitcherControllerCoordinatorAccessibility _activeDisplaySwitcherController](self, "_activeDisplaySwitcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("switcherViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeUIViewForKey:", CFSTR("_contentWrapperView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __72__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpWrapperViews__block_invoke;
  v6[3] = &unk_250368110;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v5, "_setAccessibilityViewIsModalBlock:", v6);
  objc_destroyWeak(&v7);

  objc_destroyWeak(&location);
}

- (void)_axSetUpSwitcherViewControllers
{
  void *v3;
  uint64_t v4;
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4 = MEMORY[0x24BDAC760];
  objc_copyWeak(&v5, &location);
  -[SBMainSwitcherControllerCoordinatorAccessibility _axFluidSwitcherViewController](self, "_axFluidSwitcherViewController", v4, 3221225472, __83__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpSwitcherViewControllers__block_invoke, &unk_250368138);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAXSwitcherType:", &v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("NSObject"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBSwitcherViewController"), CFSTR("_contentWrapperView"), "BSUIOrientationTransformWrapperView");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("SBSwitcherController"), CFSTR("contentViewController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("isMainSwitcherVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleShelves"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("switcherViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentLayoutState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("isChamoisWindowingUIEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("isFloatingSwitcherVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIFocusSystem"), CFSTR("_isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentMainAppLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentFloatingAppLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("peekConfiguration"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("keyboardFocusController:externalSceneDidAcquireFocus:"), "v", "@", "@", 0);

}

uint64_t __72__SBMainSwitcherControllerCoordinatorAccessibility__axSetUpWrapperViews__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  uint64_t v3;
  id v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_axIsTypeOfMainSwitcherVisible") & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v4 = objc_loadWeakRetained(v1);
    v3 = objc_msgSend(v4, "_axIsFloatingSwitcherVisible");

  }
  return v3;
}

- (BOOL)_axIsAppSwitcherPeeking
{
  return -[SBMainSwitcherControllerCoordinatorAccessibility _axIsAppSwitcherPeekingSlideOver](self, "_axIsAppSwitcherPeekingSlideOver")|| -[SBMainSwitcherControllerCoordinatorAccessibility _axIsAppSwitcherPeekingSplitView](self, "_axIsAppSwitcherPeekingSplitView");
}

@end
