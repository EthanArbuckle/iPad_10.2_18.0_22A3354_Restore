@implementation PREditorRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PREditorRootViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PREditorRootViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRComplicationSceneHostViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditorRootViewController"), CFSTR("pageControl"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("updatePageControlCurrentPage"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("currentLook"), "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("PREditingLook"), CFSTR("displayName"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("inlineComplicationReticleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("titleReticleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("complicationRowReticleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("complicationSidebarReticleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("reticleVibrancyView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("cancelButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("editor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditor"), CFSTR("posterRole"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("isDepthEffectDisabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("leadingMenuElementViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("_updateMenuElements"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PREditorRootViewController"), CFSTR("quickActionsHostViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PRQuickActionsSceneHostViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  -[PREditorRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[PREditorRootViewControllerAccessibility _axSetPageControlValue](self, "_axSetPageControlValue");
  -[PREditorRootViewControllerAccessibility _axSetAccessibilityElements](self, "_axSetAccessibilityElements");
}

- (void)viewDidAppear:(BOOL)a3
{
  UIAccessibilityNotifications v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PREditorRootViewControllerAccessibility;
  -[PREditorRootViewControllerAccessibility viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[PREditorRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  v4 = *MEMORY[0x24BDF72C8];
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("cancelButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v4, v5);

}

- (void)updatePageControlCurrentPage
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  -[PREditorRootViewControllerAccessibility updatePageControlCurrentPage](&v3, sel_updatePageControlCurrentPage);
  -[PREditorRootViewControllerAccessibility _axSetPageControlValue](self, "_axSetPageControlValue");
}

- (void)_updateMenuElements
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PREditorRootViewControllerAccessibility;
  -[PREditorRootViewControllerAccessibility _updateMenuElements](&v3, sel__updateMenuElements);
  -[PREditorRootViewControllerAccessibility _axSetDepthEffectButton](self, "_axSetDepthEffectButton");
}

- (void)_axSetPageControlValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pageControl"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PREditorRootViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("currentLook.displayName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentPage");
  objc_msgSend(v4, "numberOfPages");
  accessibilityLocalizedString(CFSTR("page.control.format.text"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXCFormattedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v9, v8, CFSTR("__AXStringForVariablesSentinel"));

}

- (void)_axSetAccessibilityElements
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
  __CFString **v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id from;
  id location;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inlineComplicationReticleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleReticleView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PREditorRootViewControllerAccessibility valueForKey:](self, "valueForKey:", CFSTR("editor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeStringForKey:", CFSTR("posterRole"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("complicationRowReticleView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(location) = 0;
  objc_opt_class();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("complicationSidebarReticleView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("inline-widget-reticle-view"));
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("PRPosterRoleLockScreen")) & 1) != 0)
  {
    v12 = AXClockReticleViewID;
LABEL_5:
    objc_msgSend(v5, "setAccessibilityIdentifier:", *v12);
    goto LABEL_6;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("PRPosterRoleIncomingCall")))
  {
    v12 = AXContactReticleViewID;
    goto LABEL_5;
  }
LABEL_6:
  objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("grouped-widgets-reticle-view"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("grouped-widgets-reticle-sidebar-view"));
  objc_msgSend(v9, "_axSetPosterEditorViewController:", v3);
  objc_msgSend(v11, "_axSetPosterEditorViewController:", v3);
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("reticleVibrancyView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke;
  v28[3] = &unk_25030BB60;
  v15 = v4;
  v29 = v15;
  v16 = v5;
  v30 = v16;
  v17 = v9;
  v31 = v17;
  objc_msgSend(v13, "setAccessibilityFrameBlock:", v28);

  -[PREditorRootViewControllerAccessibility _axSetDepthEffectButton](self, "_axSetDepthEffectButton");
  v22 = v3;
  objc_msgSend(v3, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v18);
  objc_initWeak(&from, self);
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke_2;
  v23[3] = &unk_25030BB88;
  objc_copyWeak(&v24, &location);
  objc_copyWeak(&v25, &from);
  objc_msgSend(v18, "setAccessibilityElementsBlock:", v23);
  objc_opt_class();
  -[PREditorRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("quickActionsHostViewController"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "view");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "_accessibilitySetSortPriority:", -100);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

double __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke(id *a1)
{
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double result;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  objc_msgSend(a1[4], "accessibilityFrame");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(a1[5], "accessibilityFrame");
  v26.origin.x = v10;
  v26.origin.y = v11;
  v26.size.width = v12;
  v26.size.height = v13;
  v23.origin.x = v3;
  v23.origin.y = v5;
  v23.size.width = v7;
  v23.size.height = v9;
  v24 = CGRectUnion(v23, v26);
  x = v24.origin.x;
  y = v24.origin.y;
  width = v24.size.width;
  height = v24.size.height;
  objc_msgSend(a1[6], "accessibilityFrame");
  v27.origin.x = v18;
  v27.origin.y = v19;
  v27.size.width = v20;
  v27.size.height = v21;
  v25.origin.x = x;
  v25.origin.y = y;
  v25.size.width = width;
  v25.size.height = height;
  *(_QWORD *)&result = (unint64_t)CGRectUnion(v25, v27);
  return result;
}

id __70__PREditorRootViewControllerAccessibility__axSetAccessibilityElements__block_invoke_2(id *a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v1 = a1;
  WeakRetained = objc_loadWeakRetained(a1 + 4);
  objc_msgSend(WeakRetained, "_accessibilitySubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v1 += 5;
  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "safeValueForKey:", CFSTR("scrollView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v6);

  v7 = objc_loadWeakRetained(v1);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("reticleVibrancyView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v4, "containsObject:", v8) & 1) == 0)
    objc_msgSend(v4, "axSafelyAddObject:", v8);
  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)_axSetDepthEffectButton
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PREditorRootViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("leadingMenuElementViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "accessibilityLabel");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v8, "isEqualToString:", CFSTR("square.2.stack.3d")) & 1) != 0
          || (objc_msgSend(v8, "isEqualToString:", CFSTR("square.2.layers.3d")) & 1) != 0
          || objc_msgSend(v8, "isEqualToString:", CFSTR("square.2.layers.3d.fill")))
        {
          accessibilityLocalizedString(CFSTR("primary.action.button.depth.effect.label"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setAccessibilityLabel:", v9);

          objc_initWeak(&location, self);
          v10[0] = MEMORY[0x24BDAC760];
          v10[1] = 3221225472;
          v10[2] = __66__PREditorRootViewControllerAccessibility__axSetDepthEffectButton__block_invoke;
          v10[3] = &unk_25030B980;
          objc_copyWeak(&v11, &location);
          objc_msgSend(v7, "setAccessibilityValueBlock:", v10);
          objc_destroyWeak(&v11);
          objc_destroyWeak(&location);
        }

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v4);
  }

}

id __66__PREditorRootViewControllerAccessibility__axSetDepthEffectButton__block_invoke(uint64_t a1)
{
  id WeakRetained;
  int v2;
  __CFString *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isDepthEffectDisabled"));

  if (v2)
    v3 = CFSTR("depth.effect.disabled");
  else
    v3 = CFSTR("depth.effect.enabled");
  accessibilityLocalizedString(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
