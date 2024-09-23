@implementation SBSlideOverTongueViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBSlideOverTongueView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_switcherControllerForDisplayItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_deviceApplicationSceneHandleForDisplayItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSlideOverTongueView"), CFSTR("state"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSlideOverTongueView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMainSwitcherRootSwitcherModifier"), CFSTR("SBSwitcherModifier"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBSwitcherModifier"), CFSTR("SBSwitcherMultitaskingQueryProviding"));
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("SBSwitcherMultitaskingQueryProviding"), CFSTR("SBSwitcherQueryProviding"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBSwitcherQueryProviding"), CFSTR("appLayoutToAttachSlideOverTongue"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("allItems"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeviceApplicationSceneHandle"), CFSTR("SBApplicationSceneHandle"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationSceneHandle"), CFSTR("application"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBSlideOverTongueViewAccessibility _accessibilitySlideOverApplication](self, "_accessibilitySlideOverApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("displayName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("app.pip.nib.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("app.pip.slide.over.tongue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBSlideOverTongueViewAccessibility;
  v3 = -[SBSlideOverTongueViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  -[SBSlideOverTongueViewAccessibility _accessibilitySlideOverApplication](self, "_accessibilitySlideOverApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDF73B0];
  if (v4)
    v5 = 0;
  v6 = v5 | v3;

  return v6;
}

- (id)accessibilityHint
{
  void *v2;

  if (-[SBSlideOverTongueViewAccessibility _accessibilityState](self, "_accessibilityState") == 1)
  {
    accessibilityLocalizedString(CFSTR("app.pip.slide.over.tongue.hint"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (id)accessibilityIdentification
{
  void *v2;
  void *v3;

  -[SBSlideOverTongueViewAccessibility _accessibilitySlideOverApplication](self, "_accessibilitySlideOverApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGRect)accessibilityFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBSlideOverTongueViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_tongueContainerView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v3;
  char v4;
  objc_super v6;

  if (a3 == 1)
  {
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "performMedusaGesture:", 16);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], &stru_25036C388);
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBSlideOverTongueViewAccessibility;
    return -[SBSlideOverTongueViewAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
  }
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  AXSpringBoardFloatingBundleID();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (-[SBSlideOverTongueViewAccessibility accessibilityIdentification](self, "accessibilityIdentification"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", v3),
        v4,
        v5))
  {
    -[SBSlideOverTongueViewAccessibility _accessibilityActionsForSlideOverApp](self, "_accessibilityActionsForSlideOverApp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SBSlideOverTongueViewAccessibility;
    -[SBSlideOverTongueViewAccessibility accessibilityCustomActions](&v10, sel_accessibilityCustomActions);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return v8;
}

- (id)_accessibilitySlideOverApplication
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  -[SBSlideOverTongueViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKeyPath:", CFSTR("rootModifier.appLayoutToAttachSlideOverTongue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("allItems"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = v5;
  AXPerformSafeBlock();
  v6 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v10 = v6;
  v11 = v13;
  AXPerformSafeBlock();
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  objc_msgSend(v7, "safeValueForKey:", CFSTR("application"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __72__SBSlideOverTongueViewAccessibility__accessibilitySlideOverApplication__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_switcherControllerForDisplayItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __72__SBSlideOverTongueViewAccessibility__accessibilitySlideOverApplication__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_deviceApplicationSceneHandleForDisplayItem:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityActionsForSlideOverApp
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  AXSBSideAppCustomAction *v21;
  void *v22;
  uint64_t v23;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  AXSpringBoardFloatingAppLabel();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allowedMedusaGestures");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v29 = objc_msgSend((id)*MEMORY[0x24BDF74F8], "userInterfaceLayoutDirection");
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v33;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v33 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v9), "integerValue");
        switch(v10)
        {
          case 5:
          case 6:
            v11 = (void *)MEMORY[0x24BDD17C8];
            accessibilityLocalizedString(CFSTR("app.pip.nib.action.create.split.view.app"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "stringWithFormat:", v12, v2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (v13)
              goto LABEL_18;
            break;
          case 9:
            v15 = (void *)MEMORY[0x24BDD17C8];
            if (v29 == 1)
            {
              accessibilityLocalizedString(CFSTR("app.pip.nib.action.move.app.left"));
              v16 = objc_claimAutoreleasedReturnValue();
              v28 = (void *)v16;
            }
            else
            {
              accessibilityLocalizedString(CFSTR("app.pip.nib.action.move.app.right"));
              v16 = objc_claimAutoreleasedReturnValue();
              v27 = (void *)v16;
            }
            objc_msgSend(v15, "stringWithFormat:", v16, v2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29 == 1)
              v22 = v28;
            else
              v22 = v27;
            goto LABEL_29;
          case 10:
            v17 = (void *)MEMORY[0x24BDD17C8];
            if (v29 == 1)
            {
              accessibilityLocalizedString(CFSTR("app.pip.nib.action.move.app.right"));
              v18 = objc_claimAutoreleasedReturnValue();
              v26 = (void *)v18;
            }
            else
            {
              accessibilityLocalizedString(CFSTR("app.pip.nib.action.move.app.left"));
              v18 = objc_claimAutoreleasedReturnValue();
              v25 = (void *)v18;
            }
            objc_msgSend(v17, "stringWithFormat:", v18, v2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v29 == 1)
              v22 = v26;
            else
              v22 = v25;
LABEL_29:

            if (!v13)
              break;
            goto LABEL_18;
          case 14:
            v19 = (void *)MEMORY[0x24BDD17C8];
            accessibilityLocalizedString(CFSTR("app.pip.nib.action.dismiss.app"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "stringWithFormat:", v20, v2);
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v13)
              break;
            goto LABEL_18;
          case 15:
            v14 = CFSTR("app.pip.open.floating.switcher");
            goto LABEL_17;
          case 16:
            v14 = CFSTR("app.pip.swipe.right.floating.switcher");
LABEL_17:
            accessibilityLocalizedString(v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (v13)
            {
LABEL_18:
              v21 = -[AXSBSideAppCustomAction initWithName:gesture:target:selector:]([AXSBSideAppCustomAction alloc], "initWithName:gesture:target:selector:", v13, v10, self, sel__axPerformGestureForAction_);
              objc_msgSend(v31, "axSafelyAddObject:", v21);

            }
            break;
          default:
            break;
        }
        ++v9;
      }
      while (v7 != v9);
      v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      v7 = v23;
    }
    while (v23);
  }

  return v31;
}

- (BOOL)_axPerformGestureForAction:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = (void *)MEMORY[0x24BE006F0];
  v4 = a3;
  objc_msgSend(v3, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "gesture");

  LOBYTE(v4) = objc_msgSend(v5, "performMedusaGesture:", v6);
  return (char)v4;
}

- (unint64_t)_accessibilityState
{
  return -[SBSlideOverTongueViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("state"));
}

@end
