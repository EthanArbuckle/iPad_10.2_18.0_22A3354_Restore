@implementation SBFluidSwitcherItemContainerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherItemContainer");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("isKillable"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("_delegate"), "<SBFluidSwitcherItemContainerDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_scrollToAppLayout:animated:alignment:completion:"), "v", "@", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("_appLayout"), "SBAppLayout");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBContinuityDisplayItem"), CFSTR("appSuggestion"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBestAppSuggestion"), CFSTR("originatingDeviceType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBBestAppSuggestion"), CFSTR("isLocallyGeneratedSuggestion"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("isOrContainsAppLayout:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherSpaceTitleItem"), CFSTR("titleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherSpaceTitleItem"), CFSTR("subtitleText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherSpaceTitleItem"), CFSTR("showsMultiWindowIndicator"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherItemContainer"), CFSTR("_pageView"), "SBAppSwitcherPageView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppSwitcherPageView"), CFSTR("cornerRadii"), "{UIRectCornerRadii=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayoutAccessibility"), CFSTR("_axLabelForInCallService"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("killContainer:forReason:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplicationController"), CFSTR("applicationWithBundleIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("enumerate:"), "v", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("environment"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("type"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("itemForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleUnderlayAccessoryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("layoutRoleForItem:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleOverlayAccessoryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainerHeaderView"), CFSTR("titleItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherItemContainerFooterView"), CFSTR("_titleItems"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherItemContainerHeaderView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherSpaceUnderlayAccessoryView"), CFSTR("itemContainerHeaderView:didSelectTitleItem:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherSpaceUnderlayAccessoryView"), CFSTR("_headerView"), "SBFluidSwitcherItemContainerHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherSpaceOverlayAccessoryView"), CFSTR("_footerView"), "SBFluidSwitcherItemContainerFooterView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("leafAppLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherItemContainer"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("isChamoisWindowingUIEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("didSelectContainer:modifierFlags:"), "v", "@", "q", 0);

}

- (id)_axBundleIdentifier
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axBundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsInAppSwitcher
{
  return 1;
}

- (id)accessibilityPath
{
  void *v2;
  UIBezierPath *v3;
  void *v4;
  uint64_t v6;
  UIView *v7;
  _QWORD v8[4];
  __int128 v9;
  __int128 v10;

  -[SBFluidSwitcherItemContainerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_pageView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x4010000000;
  v8[3] = &unk_232A4B969;
  v9 = 0u;
  v10 = 0u;
  v6 = MEMORY[0x24BDAC760];
  v7 = v2;
  AXPerformSafeBlock();

  _Block_object_dispose(v8, 8);
  -[UIView bounds](v7, "bounds", v6, 3221225472, __62__SBFluidSwitcherItemContainerAccessibility_accessibilityPath__block_invoke, &unk_250367C18);
  UIRectInsetEdges();
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithRoundedRect:byRoundingCorners:cornerRadii:", -1);
  v3 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v3, v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __62__SBFluidSwitcherItemContainerAccessibility_accessibilityPath__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "cornerRadii");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDFE078]);

  if (v5)
  {
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__5;
    v28 = __Block_byref_object_dispose__5;
    v29 = 0;
    v23 = v3;
    AXPerformSafeBlock();
    v6 = (__CFString *)(id)v25[5];

    _Block_object_dispose(&v24, 8);
    if (-[__CFString length](v6, "length"))
    {
      v7 = v6;
      goto LABEL_15;
    }
  }
  else
  {
    v6 = &stru_25036C388;
  }
  -[SBFluidSwitcherItemContainerAccessibility _accessibilityTitleItem](self, "_accessibilityTitleItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("titleText"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("subtitleText"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFluidSwitcherItemContainerAccessibility _accessibilityItemContainerHeaderView](self, "_accessibilityItemContainerHeaderView", v22, CFSTR("__AXStringForVariablesSentinel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safeArrayForKey:", CFSTR("_titleItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "_axIsAppSwitcherPeeking"))
    goto LABEL_11;
  v14 = objc_msgSend(v12, "count");

  if (v14)
  {
    objc_msgSend(v12, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeValueForKey:", CFSTR("titleText"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "_axIsAppSwitcherPeekingSlideOver"))
      v17 = CFSTR("temporary.slide.over");
    else
      v17 = CFSTR("temporary.split.view");
    accessibilityLocalizedString(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", v18, v13);
    v19 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v19;
LABEL_11:

  }
  if (!objc_msgSend(v10, "length"))
  {
    objc_msgSend(v3, "_axDisplayName");
    v20 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v20;
  }
  v7 = v10;

LABEL_15:
  return v7;
}

void __63__SBFluidSwitcherItemContainerAccessibility_accessibilityLabel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_axLabelForInCallService");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)accessibilityValue
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  __CFString *v11;
  id v12;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  id v27;
  uint64_t *v28;

  -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_axIsChamoisSwitcherVisible");

  if ((v4 & 1) == 0)
  {
    -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherItemContainerAccessibility _axParentAppLayout](self, "_axParentAppLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v22 = MEMORY[0x24BDAC760];
    v23 = 3221225472;
    v24 = __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke;
    v25 = &unk_250367BF0;
    v28 = &v16;
    v8 = v7;
    v26 = v8;
    v9 = v6;
    v27 = v9;
    AXPerformSafeBlock();
    v10 = v17[3];

    _Block_object_dispose(&v16, 8);
    if (v10 == 1)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x3032000000;
      v19 = __Block_byref_object_copy__5;
      v20 = __Block_byref_object_dispose__5;
      v21 = 0;
      v15 = v8;
      AXPerformSafeBlock();
      v12 = (id)v17[5];

      _Block_object_dispose(&v16, 8);
      if (v12)
      {
        v11 = CFSTR("affordance.split.view.left");
        goto LABEL_10;
      }
    }
    else if (v10 == 2)
    {
      v11 = CFSTR("affordance.split.view.right");
      goto LABEL_10;
    }
    if (!-[SBFluidSwitcherItemContainerAccessibility _accessibilityIsSlideOver](self, "_accessibilityIsSlideOver"))
    {
      v5 = 0;
      goto LABEL_12;
    }
    v11 = CFSTR("affordance.slide.over");
LABEL_10:
    accessibilityLocalizedString(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_12:
    return v5;
  }
  v5 = 0;
  return v5;
}

void __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "itemForLayoutRole:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "layoutRoleForItem:", v3);

}

void __63__SBFluidSwitcherItemContainerAccessibility_accessibilityValue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityIsNotFirstElement
{
  void *v2;
  char v3;

  -[SBFluidSwitcherItemContainerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXBundleIdentifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x24BDFE420]);

  return v3;
}

- (BOOL)_accessibilityCanCloseApp
{
  return -[SBFluidSwitcherItemContainerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isKillable"));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  id location;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFluidSwitcherItemContainerAccessibility _accessibilityCanCloseApp](self, "_accessibilityCanCloseApp"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("close.app.from.switcher.title"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherItemContainerAccessibility accessibilityLabel](self, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAttribute:forKey:", CFSTR("AXCloseApp"), *MEMORY[0x24BDFEAA0]);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v8, self, sel__accessibilityCloseApp_);
    objc_msgSend(v9, "_accessibilitySetInternalCustomActionIdentifier:", CFSTR("AX_CLOSE"));
    objc_msgSend(v3, "addObject:", v9);

  }
  if (-[SBFluidSwitcherItemContainerAccessibility _accessibilityHasMultipleWindows](self, "_accessibilityHasMultipleWindows"))
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("show.all.shelf.windows"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke;
    v21[3] = &unk_250367F40;
    objc_copyWeak(&v22, &location);
    v12 = (void *)objc_msgSend(v10, "initWithName:actionHandler:", v11, v21);

    objc_msgSend(v3, "axSafelyAddObject:", v12);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "_axIsChamoisSwitcherVisible");

  if (v14)
  {
    objc_initWeak(&location, self);
    v15 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("fluid.switcher.item.container.add.to.center.stage"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_3;
    v19[3] = &unk_250367F40;
    objc_copyWeak(&v20, &location);
    v17 = (void *)objc_msgSend(v15, "initWithName:actionHandler:", v16, v19);

    objc_msgSend(v3, "axSafelyAddObject:", v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_accessibilityItemContainerHeaderView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "_accessibilityItemContainerHeaderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_loadWeakRetained(v1);
  objc_msgSend(v6, "_accessibilityTitleItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "itemContainerHeaderView:didSelectTitleItem:", v5, v7);

}

uint64_t __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __71__SBFluidSwitcherItemContainerAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id *v1;
  void *v2;
  id v3;
  id WeakRetained;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v2, "didSelectContainer:modifierFlags:", v3, 0x20000);

}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("appLayouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "indexOfObject:", v5);

  objc_msgSend(v4, "count");
  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("app.switcher.location"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFluidSwitcherItemContainerAccessibility;
  v3 = -[SBFluidSwitcherItemContainerAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[SBFluidSwitcherItemContainerAccessibility _accessibilityIsNewWindowContainer](self, "_accessibilityIsNewWindowContainer");
  v5 = *MEMORY[0x24BDF73B0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)_accessibilityCloseApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;

  -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LastCustomActionAppQuitFromSwitch = CFAbsoluteTimeGetCurrent();
  v5 = v3;
  v4 = v3;
  AXPerformSafeBlock();
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  __CFString *v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  v10 = __Block_byref_object_dispose__5;
  v11 = &stru_25036C388;
  v1 = *(void **)(a1 + 32);
  if (v1)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_2;
    v5[3] = &unk_250367F68;
    v5[4] = &v6;
    objc_msgSend(v1, "enumerate:", v5);
  }
  if (objc_msgSend((id)v7[5], "length"))
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("closing.app"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v3, v7[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
  _Block_object_dispose(&v6, 8);

}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXSBApplicationControllerSharedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("bundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "applicationWithBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safeStringForKey:", CFSTR("bundleIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v7, "safeStringForKey:", CFSTR("displayName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v15 = v9;
      v16 = CFSTR("__AXStringForVariablesSentinel");
      __AXStringForVariables();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v15, v16);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = CFSTR("SBAppSwitcherQuitAppBundleIdentifierKey");
    v18[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "postNotificationName:object:userInfo:", CFSTR("AXInternalAppSwitcherAppRemove"), 0, v14);

  }
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityCloseApp___block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "killContainer:forReason:", *(_QWORD *)(a1 + 32), 0);

}

- (BOOL)_accessibilityScrollToVisible
{
  void *v3;
  void *v4;
  void *v5;
  id v7;
  id v8;

  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("appLayouts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5 || objc_msgSend(v4, "indexOfObject:", v5) != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = v3;
      v8 = v5;
      AXPerformSafeBlock();

    }
  }

  return 1;
}

uint64_t __74__SBFluidSwitcherItemContainerAccessibility__accessibilityScrollToVisible__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scrollToAppLayout:animated:alignment:completion:", *(_QWORD *)(a1 + 40), 0, 2, 0);
}

- (CGRect)_accessibilityVisibleFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  -[SBFluidSwitcherItemContainerAccessibility accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBFluidSwitcherItemContainerAccessibility window](self, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v27.origin.x = v12;
  v27.origin.y = v13;
  v27.size.width = v14;
  v27.size.height = v15;
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  v25 = CGRectIntersection(v24, v27);
  x = v25.origin.x;
  y = v25.origin.y;
  width = v25.size.width;
  height = v25.size.height;

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = height;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  BOOL v4;
  objc_super v6;

  if (a3 == 4)
  {
    if (-[SBFluidSwitcherItemContainerAccessibility _accessibilityCanCloseApp](self, "_accessibilityCanCloseApp"))
    {
      v4 = 1;
      -[SBFluidSwitcherItemContainerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("AppDeleted"));
      -[SBFluidSwitcherItemContainerAccessibility _accessibilityCloseApp:](self, "_accessibilityCloseApp:", 0);
      -[SBFluidSwitcherItemContainerAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("AppDeleted"));
      if (AXDeviceIsPad())
        UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)SBFluidSwitcherItemContainerAccessibility;
    return -[SBFluidSwitcherItemContainerAccessibility accessibilityScroll:](&v6, sel_accessibilityScroll_);
  }
  return v4;
}

- (id)accessibilityHint
{
  __CFString *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t (**v10)(void);
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  char v16;
  __CFString *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v22;
  const __CFString *v23;

  if (-[SBFluidSwitcherItemContainerAccessibility _accessibilityCanCloseApp](self, "_accessibilityCanCloseApp"))
  {
    if (-[SBFluidSwitcherItemContainerAccessibility _accessibilityIsSlideOver](self, "_accessibilityIsSlideOver"))
      v3 = CFSTR("swipe.up.to.hide.slide.over.hint");
    else
      v3 = CFSTR("swipe.up.to.hide.hint");
    accessibilityLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  if (AXDeviceIsPad())
  {
    -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "_axSwitcherType");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_axSwitcherType");
        v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v11 = v10[2]();

        if (v11 == 1)
        {
          -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          AXSwitcherController(CFSTR("activeDisplayWindowScene"), v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v13, "safeBoolForKey:", CFSTR("isChamoisWindowingUIEnabled")) & 1) == 0)
          {
            accessibilityLocalizedString(CFSTR("app.icon.reorder.hint"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v14 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v14;
          }

        }
      }
    }
  }
  -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher", v22, v23);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "_axIsAppSwitcherPeekingSlideOver");

  if ((v16 & 1) != 0)
  {
    v17 = CFSTR("temporary.slide.over.hint");
LABEL_18:
    accessibilityLocalizedString(v17);
    v20 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v20;
    return v4;
  }
  -[SBFluidSwitcherItemContainerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "_axIsAppSwitcherPeekingSplitView");

  if (v19)
  {
    v17 = CFSTR("temporary.split.view.hint");
    goto LABEL_18;
  }
  return v4;
}

- (BOOL)_accessibilityElementVisibilityAffectsLayout
{
  return 1;
}

- (BOOL)_accessibilityCanPerformAction:(int)a3
{
  return (a3 & 0xFFFFFFFE) == 2008;
}

- (id)_accessibilityPreferredScrollActions
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];

  v9[2] = *MEMORY[0x24BDAC8D0];
  v2 = -[SBFluidSwitcherItemContainerAccessibility _accessibilityApplicationIsRTL](self, "_accessibilityApplicationIsRTL");
  if (v2)
    v3 = 2009;
  else
    v3 = 2008;
  if (v2)
    v4 = 2008;
  else
    v4 = 2009;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityItemContainerHeaderView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeDictionaryForKey:", CFSTR("visibleUnderlayAccessoryViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherItemContainerAccessibility _axParentAppLayout](self, "_axParentAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_headerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityItemContainerFooterView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeDictionaryForKey:", CFSTR("visibleOverlayAccessoryViews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherItemContainerAccessibility _axParentAppLayout](self, "_axParentAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_footerView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_accessibilityTitleItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t (**v7)(void);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SBFluidSwitcherItemContainerAccessibility *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_axSwitcherType");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_axSwitcherType");
      v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
      if (v7[2]() == 3)
        -[SBFluidSwitcherItemContainerAccessibility _accessibilityItemContainerFooterView](self, "_accessibilityItemContainerFooterView");
      else
        -[SBFluidSwitcherItemContainerAccessibility _accessibilityItemContainerHeaderView](self, "_accessibilityItemContainerHeaderView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v3 = 0;
    }
  }
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("_titleItems"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__5;
  v26 = __Block_byref_object_dispose__5;
  v27 = 0;
  v16 = MEMORY[0x24BDAC760];
  v17 = 3221225472;
  v18 = __68__SBFluidSwitcherItemContainerAccessibility__accessibilityTitleItem__block_invoke;
  v19 = &unk_250367C18;
  v20 = self;
  v21 = &v22;
  AXPerformSafeBlock();
  v9 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  if (v9
    && (-[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout", v16, 3221225472, __68__SBFluidSwitcherItemContainerAccessibility__accessibilityTitleItem__block_invoke, &unk_250367C18, self, &v22), v10 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v10, "_axDisplayItems"), v11 = (void *)objc_claimAutoreleasedReturnValue(), v12 = objc_msgSend(v11, "containsObject:", v9), v11, v10, v12))
  {
    objc_msgSend(v8, "lastObject");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!objc_msgSend(v8, "count", v16, v17, v18, v19, v20, v21))
    {
      v14 = 0;
      goto LABEL_15;
    }
    objc_msgSend(v8, "firstObject");
    v13 = objc_claimAutoreleasedReturnValue();
  }
  v14 = (void *)v13;
LABEL_15:

  return v14;
}

void __68__SBFluidSwitcherItemContainerAccessibility__accessibilityTitleItem__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axParentAppLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axParentAppLayout
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  id v9;
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("appLayouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  obj = v3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v12 = 0;
        v13 = &v12;
        v14 = 0x2020000000;
        v15 = 0;
        AXPerformSafeBlock();
        v8 = *((unsigned __int8 *)v13 + 24);
        _Block_object_dispose(&v12, 8);
        if (v8)
        {
          v9 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v4)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

void __63__SBFluidSwitcherItemContainerAccessibility__axParentAppLayout__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_axAppLayout");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "isOrContainsAppLayout:", v3);

}

- (BOOL)_accessibilityIsShelfItemContainer
{
  void *v2;
  uint64_t (**v3)(void);
  BOOL v4;

  -[SBFluidSwitcherItemContainerAccessibility _axFluidSwitcher](self, "_axFluidSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_axSwitcherType");
  v3 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v4 = v3[2]() == 3;

  return v4;
}

- (BOOL)_accessibilityHasMultipleWindows
{
  void *v2;
  char v3;

  -[SBFluidSwitcherItemContainerAccessibility _accessibilityTitleItem](self, "_accessibilityTitleItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("showsMultiWindowIndicator"));

  return v3;
}

- (BOOL)_accessibilityIsNewWindowContainer
{
  id v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v5 = MEMORY[0x24BDAC760];
  AXPerformSafeBlock();
  v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("type"), v5, 3221225472, __79__SBFluidSwitcherItemContainerAccessibility__accessibilityIsNewWindowContainer__block_invoke, &unk_250367C18, self, &v7);
  return v3 == 6;
}

void __79__SBFluidSwitcherItemContainerAccessibility__accessibilityIsNewWindowContainer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axAppLayout");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemForLayoutRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_axAppLayout
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_appLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axMainSwitcher
{
  void *v2;
  void *v3;

  objc_opt_class();
  AXSBMainSwitcherControllerCoordinatorSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axFluidSwitcher
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBFluidSwitcherItemContainerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityIsSlideOver
{
  void *v2;
  BOOL v3;

  -[SBFluidSwitcherItemContainerAccessibility _axAppLayout](self, "_axAppLayout");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("environment")) == 2;

  return v3;
}

- (id)_viewToAddFocusLayer
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBFluidSwitcherItemContainerAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFluidSwitcherItemContainer")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("ax-focusLayerView"));
  return v4;
}

@end
