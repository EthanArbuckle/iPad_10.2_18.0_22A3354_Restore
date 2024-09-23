@implementation DockContainerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("DockContainerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("_accessibilitySpeakThisViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("DockContainerViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("activeViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("dockedViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("isExposeModeActivated"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("activateExposeModeAnimated:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("setActiveTiltedTabViewController:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("presentViewController:animated:completion:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("_configureNewDockedView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("initWithPersistence:scene:rootViewController:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("_minimizeKeyCommandPressed:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("DockContainerViewController"), CFSTR("_setDockVisible:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("ComposeNavigationController"));

}

- (id)_axViewContainingDraftsElement
{
  JUMPOUT(0x234914E5CLL);
}

- (void)_axSetViewContainingDraftsElement:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (double)_axGetDraftsElementHeight
{
  double result;

  __UIAccessibilityGetAssociatedCGFloat();
  return result;
}

- (void)_axSetDraftsElementHeight:(double)a3
{
  __UIAccessibilitySetAssociatedCGFloat();
}

- (DockContainerViewControllerAccessibility)initWithPersistence:(id)a3 scene:(id)a4 rootViewController:(id)a5
{
  DockContainerViewControllerAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DockContainerViewControllerAccessibility;
  v5 = -[DockContainerViewControllerAccessibility initWithPersistence:scene:rootViewController:](&v7, sel_initWithPersistence_scene_rootViewController_, a3, a4, a5);
  -[DockContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DockContainerViewControllerAccessibility;
  -[DockContainerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[DockContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("kAXApplicationSceneViewIdentifier"));
  objc_msgSend(v3, "_accessibilitySetAssignedValue:forKey:", self, CFSTR("kAXApplicationSceneKey"));
  -[DockContainerViewControllerAccessibility _accessibilityUpdateDraftElements](self, "_accessibilityUpdateDraftElements");
  objc_opt_class();
  -[DockContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activeViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[DockContainerViewControllerAccessibility _axAddDraftsElementIfNecessaryUsingVC:](self, "_axAddDraftsElementIfNecessaryUsingVC:", v5);
}

- (id)_accessibilitySpeakThisViewController
{
  void *v2;
  void *v3;

  -[DockContainerViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activeViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilitySpeakThisViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_axAddDraftsElementIfNecessaryUsingVC:(id)a3
{
  id v4;
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
  double MaxY;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[2];
  CGRect v24;

  v23[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  NSClassFromString(CFSTR("ComposeNavigationController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __82__DockContainerViewControllerAccessibility__axAddDraftsElementIfNecessaryUsingVC___block_invoke;
    v22[3] = &unk_250285A10;
    v22[4] = self;
    objc_msgSend(v5, "_accessibilityFindAncestor:startWithSelf:", v22, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[DockContainerViewControllerAccessibility _axDismissDraftElement](self, "_axDismissDraftElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityContainer:", v6);

    -[DockContainerViewControllerAccessibility _axDismissDraftElement](self, "_axDismissDraftElement");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_accessibilitySetAdditionalElements:", v9);

    -[DockContainerViewControllerAccessibility _axSetViewContainingDraftsElement:](self, "_axSetViewContainingDraftsElement:", v6);
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "windowScene");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "statusBarManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusBarFrame");
    MaxY = CGRectGetMaxY(v24);

    objc_msgSend(v4, "view");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "superview");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "frame");
    objc_msgSend(v17, "convertRect:toView:", 0);
    v20 = v19;

    -[DockContainerViewControllerAccessibility _axSetDraftsElementHeight:](self, "_axSetDraftsElementHeight:", v20 - MaxY);
  }
  else
  {
    -[DockContainerViewControllerAccessibility _axViewContainingDraftsElement](self, "_axViewContainingDraftsElement");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "_accessibilitySetAdditionalElements:", 0);

    -[DockContainerViewControllerAccessibility _axSetDraftsElementHeight:](self, "_axSetDraftsElementHeight:", 0.0);
  }

}

BOOL __82__DockContainerViewControllerAccessibility__axAddDraftsElementIfNecessaryUsingVC___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  _BOOL8 v16;
  CGPoint v18;
  CGRect v19;

  v3 = a2;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityFrame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(*(id *)(a1 + 32), "_axDismissDraftElement");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "accessibilityFrame");
  v18.x = v14;
  v18.y = v15;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  v16 = CGRectContainsPoint(v19, v18);

  return v16;
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(v8, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setAccessibilityViewIsModal:", 1);

  v14[1] = 3221225472;
  v14[2] = __86__DockContainerViewControllerAccessibility_presentViewController_animated_completion___block_invoke;
  v14[3] = &unk_250285A38;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v13.receiver = self;
  v13.super_class = (Class)DockContainerViewControllerAccessibility;
  v14[0] = MEMORY[0x24BDAC760];
  v11 = v9;
  v12 = v8;
  -[DockContainerViewControllerAccessibility presentViewController:animated:completion:](&v13, sel_presentViewController_animated_completion_, v12, v6, v14);

}

uint64_t __86__DockContainerViewControllerAccessibility_presentViewController_animated_completion___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_axAddDraftsElementIfNecessaryUsingVC:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_configureNewDockedView:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  -[DockContainerViewControllerAccessibility _configureNewDockedView:](&v4, sel__configureNewDockedView_, a3);
  -[DockContainerViewControllerAccessibility _accessibilityUpdateDraftElements](self, "_accessibilityUpdateDraftElements");
}

- (void)activateExposeModeAnimated:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  -[DockContainerViewControllerAccessibility activateExposeModeAnimated:](&v4, sel_activateExposeModeAnimated_, a3);
  -[DockContainerViewControllerAccessibility _accessibilityUpdateDraftElements](self, "_accessibilityUpdateDraftElements");
}

- (void)setActiveTiltedTabViewController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  -[DockContainerViewControllerAccessibility setActiveTiltedTabViewController:](&v4, sel_setActiveTiltedTabViewController_, a3);
  -[DockContainerViewControllerAccessibility _accessibilityUpdateDraftElements](self, "_accessibilityUpdateDraftElements");
}

- (void)_accessibilityUpdateDraftElements
{
  void *v3;
  void *v4;
  int v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  char v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[DockContainerViewControllerAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("dockedViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[DockContainerViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isExposeModeActivated"));
  v6 = objc_msgSend(v4, "count");
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0;
  objc_opt_class();
  objc_msgSend(v4, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v9) = v6 != 0;
  objc_msgSend(v8, "superview");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  objc_msgSend(v11, "convertRect:toView:", 0);
  v13 = v12;

  objc_msgSend(v10, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  objc_msgSend(v14, "convertRect:toView:", 0);
  v16 = v15;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v9 & ~v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v17, CFSTR("kAXShowDraftsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v4, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v18, CFSTR("kAXNumberOfDraftsKey"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v13 - v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v19, CFSTR("kAXDraftHeightKey"));

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v20 = v4;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v26 != v23)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "setAccessibilityElementsHidden:", 1, (_QWORD)v25);
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v22);
  }

}

- (CGRect)_axFrameForDismissDraftsElement
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect result;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "statusBarManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "statusBarFrame");
  v13 = v12;

  -[DockContainerViewControllerAccessibility _axGetDraftsElementHeight](self, "_axGetDraftsElementHeight");
  v15 = v14;

  v16 = v6;
  v17 = v13;
  v18 = v8;
  v19 = v15;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (id)_axDismissDraftElement
{
  UIAccessibilityDismissDraftElement *v3;
  UIAccessibilityDismissDraftElement *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  double (*v10)(uint64_t);
  void *v11;
  id v12;
  id location;

  -[DockContainerViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXDismissDraftElement"));
  v3 = (UIAccessibilityDismissDraftElement *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = [UIAccessibilityDismissDraftElement alloc];
    -[DockContainerViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = -[UIAccessibilityDismissDraftElement initWithAccessibilityContainer:](v4, "initWithAccessibilityContainer:", v5);

    objc_initWeak(&location, self);
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __66__DockContainerViewControllerAccessibility__axDismissDraftElement__block_invoke;
    v11 = &unk_250285A60;
    objc_copyWeak(&v12, &location);
    -[UIAccessibilityDismissDraftElement _setAccessibilityFrameBlock:](v3, "_setAccessibilityFrameBlock:", &v8);
    -[UIAccessibilityDismissDraftElement setIsAccessibilityElement:](v3, "setIsAccessibilityElement:", 1, v8, v9, v10, v11);
    accessibilityLocalizedString(CFSTR("minimize.draft"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIAccessibilityDismissDraftElement setAccessibilityLabel:](v3, "setAccessibilityLabel:", v6);

    -[UIAccessibilityDismissDraftElement setMailApplicationScene:](v3, "setMailApplicationScene:", self);
    -[UIAccessibilityDismissDraftElement setAccessibilityTraits:](v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    -[DockContainerViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXDismissDraftElement"));
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

double __66__DockContainerViewControllerAccessibility__axDismissDraftElement__block_invoke(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axFrameForDismissDraftsElement");
  v3 = v2;

  return v3;
}

- (void)_setDockVisible:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)DockContainerViewControllerAccessibility;
  -[DockContainerViewControllerAccessibility _setDockVisible:](&v4, sel__setDockVisible_, a3);
  -[DockContainerViewControllerAccessibility _accessibilityUpdateDraftElements](self, "_accessibilityUpdateDraftElements");
}

- (BOOL)_accessibilityShouldAttemptToAddDismissalElement
{
  return 0;
}

@end
