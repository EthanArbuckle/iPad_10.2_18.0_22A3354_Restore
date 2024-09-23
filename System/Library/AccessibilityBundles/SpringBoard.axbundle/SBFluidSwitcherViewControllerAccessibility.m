@implementation SBFluidSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherViewController");
}

- (void)_addVisibleItemContainerForAppLayout:(id)a3 reusingItemContainerIfExists:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility _addVisibleItemContainerForAppLayout:reusingItemContainerIfExists:](&v12, sel__addVisibleItemContainerForAppLayout_reusingItemContainerIfExists_, v6, v7);
  -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visibleItemContainers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKey:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_axAddVisibleItemContainer:forAppLayout:", v11, v6);

}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  objc_super v16;
  _QWORD v17[5];
  id v18;
  id v19;
  uint64_t v20;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  objc_msgSend(v9, "safeValueForKey:", CFSTR("previousLayoutState"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safeIntegerForKey:", CFSTR("unlockedEnvironmentMode"));
  -[SBFluidSwitcherViewControllerAccessibility _axIdentifierOfAppInLayoutState:](self, "_axIdentifierOfAppInLayoutState:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  -[SBFluidSwitcherViewControllerAccessibility _axCreateAppElements](self, "_axCreateAppElements");
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke;
  v17[3] = &unk_250368058;
  v17[4] = self;
  v18 = v12;
  v19 = v8;
  v20 = v11;
  v13 = v8;
  v14 = v12;
  v15 = (void *)MEMORY[0x23491FAEC](v17);
  v16.receiver = self;
  v16.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility performTransitionWithContext:animated:completion:](&v16, sel_performTransitionWithContext_animated_completion_, v9, v5, v15);

}

- (id)_axIdentifierOfAppInLayoutState:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("elements"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("uniqueIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double Current;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  uint64_t v31;
  id v32;

  objc_msgSend(*(id *)(a1 + 32), "_axContentView");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 32), "_axIsVisible")
    && (objc_msgSend(*(id *)(a1 + 32), "_axMainSwitcher"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "_axIsChamoisSwitcherVisible"),
        v4,
        (v5 & 1) == 0))
  {
    objc_msgSend(v32, "accessibilityElements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "ax_filteredArrayUsingBlock:", &__block_literal_global_6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = *(void **)(a1 + 32);
    objc_msgSend(v13, "_axCollectedVisibleItemContainers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "allValues");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_axUpdateElements:withVisibleItemContainers:", v12, v15);

    Current = CFAbsoluteTimeGetCurrent();
    if (Current - *(double *)&AXAppSwitcherViewControllerKey_block_invoke_LastAnnouncement > 1.0
      && (AXSpringBoardIsAssistantVisible() & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_axMainSwitcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "_axIsMainSwitcherVisible");

      if (v18)
      {
        v19 = objc_allocWithZone(MEMORY[0x24BDBCE70]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = (void *)objc_msgSend(v19, "initWithObjectsAndKeys:", v20, *MEMORY[0x24BDFEAD8], 0);

        v22 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        accessibilityLocalizedString(CFSTR("app.switcher.announce"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v22, "initWithString:attributes:", v23, v21);

        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v24);
        AXAppSwitcherViewControllerKey_block_invoke_LastAnnouncement = *(_QWORD *)&Current;

      }
    }
    v25 = *(_QWORD *)(a1 + 56);
    if (v25 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_axCollectedAppLayouts");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "firstObject");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else if (v25 == 3)
    {
      objc_msgSend(*(id *)(a1 + 32), "_axAppLayoutForAppIdentifier:", *(_QWORD *)(a1 + 40));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(v32, "_axElementForAppLayout:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "_axMainSwitcher");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "_axIsMainSwitcherVisible");

    if (v30)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], v28);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_axContentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_axSwitcherViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "_axIsVisible");

    if ((v8 & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "_axMainSwitcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "_axIsShelfSwitcherVisible");

      if ((v10 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 32), "_axCreateAppElementsForLayouts:visibleItemContainers:", 0, 0);
    }
  }
  v31 = *(_QWORD *)(a1 + 48);
  if (v31)
    (*(void (**)(uint64_t, uint64_t))(v31 + 16))(v31, a2);

}

- (void)_axCreateAppElements
{
  _BOOL4 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v15;
  id v16;
  id v17;

  v3 = -[SBFluidSwitcherViewControllerAccessibility _axIsVisible](self, "_axIsVisible");
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v17, "count");
  if (v3)
  {
    if (!v4)
      goto LABEL_13;
LABEL_5:
    -[SBFluidSwitcherViewControllerAccessibility _axCollectedVisibleItemContainers](self, "_axCollectedVisibleItemContainers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_axIsAppSwitcherPeekingSlideOver");

    -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
    {
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      AXSwitcherController(CFSTR("activeDisplayWindowScene"), v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKeyPath:", CFSTR("_currentLayoutState.floatingAppLayout"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_appLayoutContainingDisplayItem:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = objc_msgSend(v8, "_axIsAppSwitcherPeekingSplitView");

      if (!v14)
        goto LABEL_11;
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      AXSwitcherController(CFSTR("activeDisplayWindowScene"), v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKeyPath:", CFSTR("_currentLayoutState.appLayout"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }

    if (v13)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 1, v13);
      v15 = objc_claimAutoreleasedReturnValue();

      v16 = (id)v15;
LABEL_12:
      v17 = v16;
      -[SBFluidSwitcherViewControllerAccessibility _axCreateAppElementsForLayouts:visibleItemContainers:](self, "_axCreateAppElementsForLayouts:visibleItemContainers:", v16, v5);

      goto LABEL_13;
    }
LABEL_11:
    v16 = v17;
    goto LABEL_12;
  }
  if (!v4)
    goto LABEL_5;
LABEL_13:

}

- (BOOL)_axIsVisible
{
  void *v3;
  void *v4;
  uint64_t (**v5)(void);
  uint64_t v6;
  void *v7;
  char v8;

  -[SBFluidSwitcherViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_stashedContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    goto LABEL_2;
  -[SBFluidSwitcherViewControllerAccessibility _axSwitcherType](self, "_axSwitcherType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return (char)v4;
  -[SBFluidSwitcherViewControllerAccessibility _axSwitcherType](self, "_axSwitcherType");
  v5 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v6 = v5[2]();

  switch(v6)
  {
    case 3:
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_axIsShelfSwitcherVisible");
      goto LABEL_10;
    case 2:
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_axIsFloatingSwitcherVisible");
      goto LABEL_10;
    case 1:
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "_axIsTypeOfMainSwitcherVisible");
LABEL_10:
      LOBYTE(v4) = v8;

      return (char)v4;
  }
LABEL_2:
  LOBYTE(v4) = 0;
  return (char)v4;
}

- (id)_axSwitcherType
{
  JUMPOUT(0x23491F7D4);
}

- (void)_updatePlusButtonPresence
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility _updatePlusButtonPresence](&v5, sel__updatePlusButtonPresence);
  -[SBFluidSwitcherViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_plusButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("fluid.switcher.plus.button.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axCreateAppElementsForLayouts:(id)a3 visibleItemContainers:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  SBAppSwitcherAppAccessibilityElement *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  uint64_t v34;
  void *v35;
  void *v36;
  SBFluidSwitcherViewControllerAccessibility *v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  SBFluidSwitcherViewControllerAccessibility *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v6 && v8)
  {
    v42 = (void *)v8;
    v43 = v7;
    v45 = self;
    v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", objc_msgSend(v6, "count"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v41 = v6;
    v12 = v6;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v55;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v55 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
          objc_msgSend(v17, "safeArrayForKey:", CFSTR("leafAppLayouts"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v18, "count") < 2)
          {
            objc_msgSend(v11, "axSafelyAddObject:", v17);
          }
          else
          {
            objc_msgSend(v18, "reverseObjectEnumerator");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "allObjects");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "axSafelyAddObjectsFromArray:", v20);

          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
      }
      while (v14);
    }

    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v21 = v11;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
    v9 = v42;
    if (v22)
    {
      v23 = v22;
      v24 = 0;
      v25 = *(_QWORD *)v51;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v51 != v25)
            objc_enumerationMutation(v21);
          v27 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * j);
          v28 = -[SBAppSwitcherAppAccessibilityElement initWithAccessibilityContainer:]([SBAppSwitcherAppAccessibilityElement alloc], "initWithAccessibilityContainer:", v42);
          -[SBAppSwitcherAppAccessibilityElement setContentView:](v28, "setContentView:", v42);
          -[SBAppSwitcherAppAccessibilityElement setAppLayout:](v28, "setAppLayout:", v27);
          -[SBAppSwitcherAppAccessibilityElement setDelegate:](v28, "setDelegate:", v45);
          -[SBAppSwitcherAppAccessibilityElement _setAccessibilityIsNotFirstElement:](v28, "_setAccessibilityIsNotFirstElement:", v24 & 1);
          objc_msgSend(v44, "addObject:", v28);
          objc_msgSend(v10, "setObject:forKeyedSubscript:", v28, v27);

          v24 = 1;
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      }
      while (v23);
    }

    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    v7 = v43;
    objc_msgSend(v43, "allKeys");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v47;
      do
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v47 != v32)
            objc_enumerationMutation(v29);
          v34 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * k);
          objc_msgSend(v43, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", v34);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setItemContainer:", v35);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v31);
    }

    if (UIAccessibilityIsSwitchControlRunning())
    {
      v38 = v44;
      v37 = v45;
      -[SBFluidSwitcherViewControllerAccessibility _axSortedElementArray:](v45, "_axSortedElementArray:", v44);
      v39 = (id)objc_claimAutoreleasedReturnValue();
      v6 = v41;
    }
    else
    {
      v37 = v45;
      v6 = v41;
      v38 = v44;
      if (-[SBFluidSwitcherViewControllerAccessibility _axShouldReverseElements](v45, "_axShouldReverseElements"))
      {
        objc_msgSend(v44, "reverseObjectEnumerator");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "allObjects");
        v39 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v39 = v44;
      }
    }
    -[SBFluidSwitcherViewControllerAccessibility _accessibilityRegisterAppQuitNotifications](v37, "_accessibilityRegisterAppQuitNotifications");

  }
  else
  {
    -[SBFluidSwitcherViewControllerAccessibility _accessibilityUnregisterAppQuitNotifications](self, "_accessibilityUnregisterAppQuitNotifications");
    v10 = 0;
    v39 = 0;
  }
  objc_msgSend(v9, "_axSetElementsArray:dictionary:", v39, v10);

}

- (id)_axContentView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stashedContentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentView"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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

- (BOOL)_axShouldReverseElements
{
  return 1;
}

- (void)_accessibilitySetAppQuitNotificationsRegistered:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityRegisterAppQuitNotifications
{
  void *v3;
  void *v4;

  if (!-[SBFluidSwitcherViewControllerAccessibility _accessibilityAppQuitNotificationsRegistered](self, "_accessibilityAppQuitNotificationsRegistered"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axDidQuitApp_, CFSTR("SBAppSwitcherQuitAppNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__axDidQuitApp_, CFSTR("AXInternalAppSwitcherAppRemove"), 0);

    -[SBFluidSwitcherViewControllerAccessibility _accessibilitySetAppQuitNotificationsRegistered:](self, "_accessibilitySetAppQuitNotificationsRegistered:", 1);
  }
}

- (BOOL)_accessibilityAppQuitNotificationsRegistered
{
  return __UIAccessibilityGetAssociatedBool();
}

- (id)_axCollectedAppLayouts
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherViewControllerAccessibility _axAppLayouts](self, "_axAppLayouts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AXGuaranteedMutableArray();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axAppLayouts
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("appLayouts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AppSwitcherContentView"));
  objc_msgSend(v3, "_accessibilitySetAssignedValue:forKey:", self, CFSTR("AppSwitcherViewController"));
  -[SBFluidSwitcherViewControllerAccessibility _axCreateInitialAppElements](self, "_axCreateInitialAppElements");

}

- (void)_axCreateInitialAppElements
{
  -[SBFluidSwitcherViewControllerAccessibility _axCreateAppElementsForLayouts:visibleItemContainers:](self, "_axCreateAppElementsForLayouts:visibleItemContainers:", MEMORY[0x24BDBD1A8], MEMORY[0x24BDBD1B8]);
}

- (id)_axCollectedVisibleItemContainers
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherViewControllerAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("_visibleItemContainers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  return v3;
}

- (void)_accessibilityUnregisterAppQuitNotifications
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBAppSwitcherQuitAppNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("AXInternalAppSwitcherAppRemove"), 0);

  -[SBFluidSwitcherViewControllerAccessibility _accessibilitySetAppQuitNotificationsRegistered:](self, "_accessibilitySetAppQuitNotificationsRegistered:", 0);
}

- (void)_setAXSwitcherType:(id)a3
{
  id v3;

  v3 = (id)MEMORY[0x23491FAEC](a3, a2);
  __UIAccessibilitySetAssociatedCopiedObject();

}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFluidSwitcherViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_setupContentAndTransientViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_contentView"), "SBFluidSwitcherContentView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_stashedContentView"), "SBFluidSwitcherContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_performEventResponse:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleItemContainers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("layoutContext"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_updateVisibleItems"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_removeVisibleItemContainerForAppLayout:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_addVisibleItemContainerForAppLayout:reusingItemContainerIfExists:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_scrollToAppLayout:animated:alignment:completion:"), "v", "@", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("performTransitionWithContext:animated:completion:"), "v", "@", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_updatePlusButtonPresence"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherRootSwitcherModifier"), CFSTR("multitaskingModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBGridSwitcherModifier"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGridSwitcherModifier"), CFSTR("gridLayoutModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherLayoutContext"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherLayoutContext"), CFSTR("layoutState"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBLayoutState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("elements"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("elementWithRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBMainDisplayLayoutState"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBMainDisplayLayoutState"), CFSTR("SBLayoutState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("unlockedEnvironmentMode"), "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBLayoutElement"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("SBLayoutElement"), CFSTR("SBLayoutElementDescriptor"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutElement"), CFSTR("viewControllerClass"), "#", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBLayoutElementDescriptor"), CFSTR("uniqueIdentifier"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBGridLayoutSwitcherModifier"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGridLayoutSwitcherModifier"), CFSTR("_columnForIndex:"), "Q", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBGridLayoutSwitcherModifier"), CFSTR("_numberOfColumns"), "Q", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("SBSwitcherMultitaskingQueryProviding"), CFSTR("contentOffsetForIndex:alignment:"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBWorkspaceApplicationSceneTransitionContext"), CFSTR("previousLayoutState"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBAppLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("allItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("environment"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("leafAppLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBDisplayItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_reopenClosedWindowsButton"), "SBFluidSwitcherTitledButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_rootModifier"), "SBSwitcherModifier");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("handleReopenClosedWindowsButtonTapped:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("numberOfHiddenAppLayoutsForBundleIdentifier:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherModifier"), CFSTR("appExposeAccessoryButtonsBundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBApplication"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBLayoutState"), CFSTR("appLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("rootModifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBSwitcherController"), CFSTR("_currentLayoutState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainSwitcherControllerCoordinator"), CFSTR("_appLayoutContainingDisplayItem:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBMainDisplayLayoutState"), CFSTR("floatingAppLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBDismissForEmptySwitcherSwitcherEventResponse"));

}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  uint64_t (**v4)(void);
  uint64_t v5;
  void *v6;

  -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "_axIsShelfSwitcherVisible") & 1) == 0)
  {

    goto LABEL_5;
  }
  -[SBFluidSwitcherViewControllerAccessibility _axSwitcherType](self, "_axSwitcherType");
  v4 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
  v5 = v4[2]();

  if (v5 != 3)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x24BE006F0], "server");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissAppSwitcher");
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissShelfSwitcher");
LABEL_6:

  return 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  char IsPad;
  unint64_t v6;
  void *v7;
  objc_super v9;
  _QWORD v10[5];

  IsPad = AXDeviceIsPad();
  if ((unint64_t)(a3 - 3) >= 0xFFFFFFFFFFFFFFFELL && (IsPad & 1) == 0)
  {
    v6 = -[SBFluidSwitcherViewControllerAccessibility _axAdjustedIndex:forScrollDirection:](self, "_axAdjustedIndex:forScrollDirection:", -[SBFluidSwitcherViewControllerAccessibility _axCurrentAppLayoutIndex](self, "_axCurrentAppLayoutIndex"), a3);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__SBFluidSwitcherViewControllerAccessibility_accessibilityScroll___block_invoke;
    v10[3] = &unk_250367AD0;
    v10[4] = self;
    v7 = (void *)MEMORY[0x23491FAEC](v10);
    LOBYTE(v6) = -[SBFluidSwitcherViewControllerAccessibility _axPerformScrollToIndex:completion:](self, "_axPerformScrollToIndex:completion:", v6, v7);

    if ((v6 & 1) != 0)
      return 1;
  }
  v9.receiver = self;
  v9.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  return -[SBFluidSwitcherViewControllerAccessibility accessibilityScroll:](&v9, sel_accessibilityScroll_, a3);
}

uint64_t __66__SBFluidSwitcherViewControllerAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axUpdateElementOrderingIfNecessary");
}

- (BOOL)_axPerformScrollToIndex:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;

  v6 = a4;
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 > a3)
  {
    -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndexedSubscript:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherViewControllerAccessibility _axScrollToAppLayout:completion:](self, "_axScrollToAppLayout:completion:", v10, v6);
  }

  return v8 > a3;
}

- (void)_axScrollToAppLayout:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  if (UIAccessibilityIsSwitchControlRunning())
  {
    v8 = 0;
  }
  else
  {
    -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_axElementForAppLayout:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v13 = v6;
  v14 = v7;
  v10 = v8;
  v11 = v7;
  v12 = v6;
  AXPerformSafeBlock();

}

void __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke_2;
  v4[3] = &unk_250367FC8;
  v6 = *(id *)(a1 + 56);
  v5 = *(id *)(a1 + 48);
  objc_msgSend(v2, "_scrollToAppLayout:animated:alignment:completion:", v3, 1, 2, v4);

}

void __78__SBFluidSwitcherViewControllerAccessibility__axScrollToAppLayout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  UIAccessibilityNotifications v3;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *MEMORY[0x24BDF72C8];
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
  UIAccessibilityPostNotification(v3, *(id *)(a1 + 32));
}

- (void)_performEventResponse:(id)a3
{
  id v3;
  char isKindOfClass;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  v3 = a3;
  -[SBFluidSwitcherViewControllerAccessibility _performEventResponse:](&v6, sel__performEventResponse_, v3);
  NSClassFromString(CFSTR("SBDismissForEmptySwitcherSwitcherEventResponse"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("app.switcher.no.items"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)handleReopenClosedWindowsButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  SBFluidSwitcherViewControllerAccessibility *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility handleReopenClosedWindowsButtonTapped:](&v20, sel_handleReopenClosedWindowsButtonTapped_, v4);
  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rootModifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("appExposeAccessoryButtonsBundleIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "length"))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2020000000;
    v19 = 0;
    v13 = MEMORY[0x24BDAC760];
    v14 = self;
    v15 = v6;
    AXPerformSafeBlock();
    v7 = v17[3];

    _Block_object_dispose(&v16, 8);
    if (v7 < 2)
    {
      AXSBApplicationWithIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("fluid.switcher.reopen.closed.window"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "safeStringForKey:", CFSTR("displayName"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", v10, v11, v13, 3221225472, __84__SBFluidSwitcherViewControllerAccessibility_handleReopenClosedWindowsButtonTapped___block_invoke, &unk_250367BF0, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilitySpeakAndDoNotBeInterrupted();

    }
    else
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
  }

}

uint64_t __84__SBFluidSwitcherViewControllerAccessibility_handleReopenClosedWindowsButtonTapped___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "numberOfHiddenAppLayoutsForBundleIdentifier:", *(_QWORD *)(a1 + 40));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_setupContentAndTransientViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility _setupContentAndTransientViews](&v3, sel__setupContentAndTransientViews);
  -[SBFluidSwitcherViewControllerAccessibility _axCreateAppElements](self, "_axCreateAppElements");
}

- (BOOL)_removeVisibleItemContainerForAppLayout:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  v4 = a3;
  v5 = -[SBFluidSwitcherViewControllerAccessibility _removeVisibleItemContainerForAppLayout:](&v8, sel__removeVisibleItemContainerForAppLayout_, v4);
  -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView", v8.receiver, v8.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_axRemoveVisibleItemContainerForAppLayout:", v4);

  if ((AXDeviceIsPad() & 1) == 0)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);

  return v5;
}

uint64_t __95__SBFluidSwitcherViewControllerAccessibility_performTransitionWithContext_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axAppLayoutForAppIdentifier:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  id v17;
  uint64_t v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v19)
  {
    v6 = *(_QWORD *)v27;
    v20 = v5;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v25 = 0;
        objc_opt_class();
        objc_msgSend(v8, "safeValueForKey:", CFSTR("allItems"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAccessibilityCastAsClass();
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
          abort();
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v22 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "safeStringForKey:", CFSTR("bundleIdentifier"), v19);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              if ((objc_msgSend(v4, "isEqualToString:", v16) & 1) != 0)
              {
                v17 = v8;

                v5 = v20;
                goto LABEL_20;
              }

            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v21, v30, 16);
            if (v13)
              continue;
            break;
          }
        }

        v5 = v20;
      }
      v17 = 0;
      v19 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v19);
  }
  else
  {
    v17 = 0;
  }
LABEL_20:

  return v17;
}

- (id)_axChamoisActiveAppLayouts
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  char v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedVisibleItemContainers](self, "_axCollectedVisibleItemContainers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v4, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isSelectable");

        if ((v12 & 1) == 0)
          objc_msgSend(v3, "axSafelyAddObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)_axChamoisActiveApps
{
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
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherViewControllerAccessibility _axChamoisActiveAppLayouts](self, "_axChamoisActiveAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
          -[SBFluidSwitcherViewControllerAccessibility _axCollectedVisibleItemContainers](self, "_axCollectedVisibleItemContainers", (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "axSafelyAddObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

  }
  return v3;
}

- (id)_axVisibleAppLayouts
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherViewControllerAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("visibleItemContainers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int64_t)_axEnvironmentMode
{
  void *v2;
  int64_t v3;

  -[SBFluidSwitcherViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("layoutContext.layoutState.unlockedEnvironmentMode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unsignedIntegerValue");

  return v3;
}

- (id)_axScrollStatusForIndex:(unint64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  if (a3
    && (v5 = -[SBFluidSwitcherViewControllerAccessibility _axPageForIndex:](self, "_axPageForIndex:", -[SBFluidSwitcherViewControllerAccessibility _axCurrentAppLayoutIndex](self, "_axCurrentAppLayoutIndex")), v5 != -[SBFluidSwitcherViewControllerAccessibility _axPageForIndex:](self, "_axPageForIndex:", a3)))
  {
    accessibilityLocalizedString(CFSTR("springboard.page.status"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBFluidSwitcherViewControllerAccessibility _axPageForIndex:](self, "_axPageForIndex:", a3) + 1;
    v9 = -[SBFluidSwitcherViewControllerAccessibility _axNumberOfPages](self, "_axNumberOfPages");
    objc_msgSend(MEMORY[0x24BDD17C8], "localizedStringWithFormat:", v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "axSafeObjectAtIndex:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "_axElementForAppLayout:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_axGridLayoutModifierIfExists
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rootModifier"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("multitaskingModifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  NSClassFromString(CFSTR("SBGridSwitcherModifier"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("gridLayoutModifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)_axPageForIndex:(unint64_t)a3
{
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  -[SBFluidSwitcherViewControllerAccessibility _axGridLayoutModifierIfExists](self, "_axGridLayoutModifierIfExists");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x2020000000;
    v10 = 0;
    v6 = v4;
    AXPerformSafeBlock();
    a3 = v8[3];

    _Block_object_dispose(&v7, 8);
  }

  return a3;
}

uint64_t __62__SBFluidSwitcherViewControllerAccessibility__axPageForIndex___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_columnForIndex:", *(_QWORD *)(a1 + 48) - 1);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (unint64_t)_axNumberOfPages
{
  void *v3;
  unint64_t v4;
  void *v5;

  -[SBFluidSwitcherViewControllerAccessibility _axGridLayoutModifierIfExists](self, "_axGridLayoutModifierIfExists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "safeUnsignedIntegerForKey:", CFSTR("_numberOfColumns"));
  }
  else
  {
    -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "count");

  }
  return v4;
}

- (BOOL)_axHasMultirowLayout
{
  unint64_t v3;
  void *v4;

  v3 = -[SBFluidSwitcherViewControllerAccessibility _axNumberOfPages](self, "_axNumberOfPages");
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v3 < objc_msgSend(v4, "count");

  return v3;
}

- (unint64_t)_axAdjustedIndex:(unint64_t)a3 forScrollDirection:(int64_t)a4
{
  _BOOL4 v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v6 = -[SBFluidSwitcherViewControllerAccessibility _axHasMultirowLayout](self, "_axHasMultirowLayout");
  v7 = 1;
  if (v6)
    v7 = 2;
  v8 = a3 - v7;
  v9 = v7 + a3;
  if (a4 != 1)
    v9 = a3;
  if (a4 == 2)
    return v8;
  else
    return v9;
}

- (unint64_t)_axCurrentAppLayoutIndex
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;

  UIAccessibilityFocusedElement(0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "appLayout");
  else
    -[SBFluidSwitcherViewControllerAccessibility _accessibilityAppLayoutAtCurrentContentOffset](self, "_accessibilityAppLayoutAtCurrentContentOffset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (void)_axUpdateElements:(id)a3 withVisibleItemContainers:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v19 = a4;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v5;
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v21 = v6;
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v19;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v12);
              objc_msgSend(v7, "appLayout");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "safeValueForKey:", CFSTR("appLayout"));
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v14, "isEqual:", v15);

              if (v16)
                objc_msgSend(v7, "setItemContainer:", v13);
              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v10);
        }

        v6 = v21 + 1;
      }
      while (v21 + 1 != v20);
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v20);
  }

}

- (void)_axUpdateElementOrderingIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (UIAccessibilityIsSwitchControlRunning())
  {
    -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_axAppElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v8, "_axAppElementsDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    -[SBFluidSwitcherViewControllerAccessibility _axSortedElementArray:](self, "_axSortedElementArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_axSetElementsArray:dictionary:", v7, v6);

  }
}

- (void)dealloc
{
  objc_super v3;

  -[SBFluidSwitcherViewControllerAccessibility _accessibilityUnregisterAppQuitNotifications](self, "_accessibilityUnregisterAppQuitNotifications");
  v3.receiver = self;
  v3.super_class = (Class)SBFluidSwitcherViewControllerAccessibility;
  -[SBFluidSwitcherViewControllerAccessibility dealloc](&v3, sel_dealloc);
}

- (id)_axSortedElementArray:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __68__SBFluidSwitcherViewControllerAccessibility__axSortedElementArray___block_invoke;
  v7[3] = &unk_250368080;
  objc_copyWeak(&v8, &location);
  objc_msgSend(v4, "sortedArrayUsingComparator:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

uint64_t __68__SBFluidSwitcherViewControllerAccessibility__axSortedElementArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  uint64_t result;
  id WeakRetained;
  int v26;
  CGFloat v27;
  CGFloat v28;
  double MinX;
  double v30;
  CGFloat v31;
  double v32;
  double v33;
  double rectb;
  double rectc;
  double rectd;
  double recte;
  CGFloat rect;
  CGFloat recta;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  v5 = a3;
  objc_msgSend(a2, "accessibilityFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "accessibilityFrame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v22 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v23 = v11 == *MEMORY[0x24BDBF148];
  if (v13 != v22)
    v23 = 0;
  if (v19 == *MEMORY[0x24BDBF148] && v21 == v22)
    result = 1;
  else
    result = -1;
  if ((v19 != *MEMORY[0x24BDBF148] || v21 != v22) && !v23)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v26 = objc_msgSend(WeakRetained, "_axShouldReverseElements");

    if (v26)
    {
      if ((AXDeviceIsPad() & 1) == 0)
        goto LABEL_14;
      v40.origin.x = v7;
      v40.origin.y = v9;
      v40.size.width = v11;
      v40.size.height = v13;
      rectb = CGRectGetMinY(v40);
      v41.origin.x = v15;
      v41.origin.y = v17;
      v41.size.width = v19;
      v41.size.height = v21;
      if (rectb > CGRectGetMinY(v41))
        return -1;
      v42.origin.x = v7;
      v42.origin.y = v9;
      v42.size.width = v11;
      v42.size.height = v13;
      rectc = CGRectGetMinY(v42);
      v43.origin.x = v15;
      v43.origin.y = v17;
      v43.size.width = v19;
      v43.size.height = v21;
      if (rectc >= CGRectGetMinY(v43))
      {
        v44.origin.x = v7;
        v44.origin.y = v9;
        v44.size.width = v11;
        v44.size.height = v13;
        rectd = CGRectGetMinX(v44);
        v45.origin.x = v15;
        v45.origin.y = v17;
        v45.size.width = v19;
        v45.size.height = v21;
        if (rectd > CGRectGetMinX(v45))
          return -1;
        v46.origin.x = v7;
        v46.origin.y = v9;
        v46.size.width = v11;
        v46.size.height = v13;
        recte = CGRectGetMinX(v46);
        v47.origin.x = v15;
        v47.origin.y = v17;
        v47.size.width = v19;
        v47.size.height = v21;
        if (recte >= CGRectGetMinX(v47))
        {
LABEL_14:
          v48.origin.x = v7;
          v48.origin.y = v9;
          v48.size.width = v11;
          v48.size.height = v13;
          rect = v9;
          v27 = v15;
          v28 = v17;
          MinX = CGRectGetMinX(v48);
          v49.origin.x = v27;
          v49.origin.y = v28;
          v49.size.width = v19;
          v49.size.height = v21;
          if (MinX >= CGRectGetMinX(v49))
          {
            v50.origin.x = v7;
            v50.origin.y = rect;
            v50.size.width = v11;
            v50.size.height = v13;
            v30 = CGRectGetMinX(v50);
            v51.origin.x = v27;
            v51.origin.y = v28;
            v51.size.width = v19;
            v51.size.height = v21;
            return v30 > CGRectGetMinX(v51);
          }
          return -1;
        }
      }
    }
    else
    {
      v52.origin.x = v7;
      v52.origin.y = v9;
      v52.size.width = v11;
      v52.size.height = v13;
      recta = v9;
      v31 = v17;
      v32 = CGRectGetMinX(v52);
      v53.origin.x = v15;
      v53.origin.y = v31;
      v53.size.width = v19;
      v53.size.height = v21;
      if (v32 > CGRectGetMinX(v53))
        return -1;
      v54.origin.x = v7;
      v54.origin.y = recta;
      v54.size.width = v11;
      v54.size.height = v13;
      v33 = CGRectGetMinX(v54);
      v55.origin.x = v15;
      v55.origin.y = v31;
      v55.size.width = v19;
      v55.size.height = v21;
      if (v33 >= CGRectGetMinX(v55))
        return 0;
    }
    return 1;
  }
  return result;
}

- (id)_accessibilityAppLayoutAtCurrentContentOffset
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  double v13;
  id v14;
  id obj;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  -[SBFluidSwitcherViewControllerAccessibility _axCollectedAppLayouts](self, "_axCollectedAppLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = 0;
  objc_opt_class();
  -[SBFluidSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("scrollView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "contentOffset");
  v7 = v6;

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBFluidSwitcherViewControllerAccessibility _axVisibleAppLayouts](self, "_axVisibleAppLayouts");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v3, "indexOfObject:", v12);
        v17 = 0;
        v18 = (double *)&v17;
        v19 = 0x3010000000;
        v20 = &unk_232A4B969;
        v21 = 0;
        v22 = 0;
        AXPerformSafeBlock();
        v13 = v18[4];
        _Block_object_dispose(&v17, 8);
        if (vabdd_f64(v7, v13) < 0.001)
        {
          v14 = v12;

          v8 = v14;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v9);
  }

  return v8;
}

void __91__SBFluidSwitcherViewControllerAccessibility__accessibilityAppLayoutAtCurrentContentOffset__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("rootModifier"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentOffsetForIndex:alignment:", *(_QWORD *)(a1 + 48), 2);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 32) = v3;
  *(_QWORD *)(v2 + 40) = v4;

}

- (void)_axDidQuitApp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SBAppSwitcherQuitAppBundleIdentifierKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFluidSwitcherViewControllerAccessibility _axCreateAppElements](self, "_axCreateAppElements");
  -[SBFluidSwitcherViewControllerAccessibility _axContentView](self, "_axContentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_axAppElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  objc_msgSend(v6, "_axAppElementsDictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");

  if (objc_msgSend(v8, "count"))
  {
    v11 = 0;
    while (1)
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "appLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_axBundleIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isEqualToString:", v5);

      if (v15)
        break;

      if (++v11 >= (unint64_t)objc_msgSend(v8, "count"))
        goto LABEL_15;
    }
    objc_msgSend(v8, "removeObjectAtIndex:", v11);
    objc_msgSend(v12, "appLayout");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectForKey:", v16);

    if (objc_msgSend(v8, "count"))
    {
      if (v11)
        v17 = v11 - 1;
      else
        v17 = 0;
      objc_msgSend(v8, "objectAtIndexedSubscript:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }
    if (CFAbsoluteTimeGetCurrent() - *(double *)&LastCustomActionAppQuitFromSwitch > 2.0)
    {
      v19 = v18;
      AXPerformBlockOnMainThreadAfterDelay();

    }
  }
LABEL_15:
  objc_msgSend(v6, "_axSetElementsArray:dictionary:", v8, v10);

}

void __60__SBFluidSwitcherViewControllerAccessibility__axDidQuitApp___block_invoke(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 32));
}

- (BOOL)appElementIsAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  uint64_t (**v10)(void);
  uint64_t v11;
  void *v12;
  uint64_t (**v13)(void);
  uint64_t v14;
  void *v15;
  char v16;
  int v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "appLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("environment"));

  switch(v6)
  {
    case 0:
    case 3:
      AXLogSpringboardServer();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        v18 = 134218242;
        v19 = v6;
        v20 = 2112;
        v21 = v4;
        _os_log_impl(&dword_232A0A000, v7, OS_LOG_TYPE_INFO, "Invalid app switcher environment {%ld} found on element %@", (uint8_t *)&v18, 0x16u);
      }

      goto LABEL_5;
    case 1:
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v9, "_axIsShelfSwitcherVisible") & 1) != 0)
      {
        -[SBFluidSwitcherViewControllerAccessibility _axSwitcherType](self, "_axSwitcherType");
        v10 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v11 = v10[2]();

        if (v11 == 3)
          goto LABEL_11;
      }
      else
      {

      }
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_axIsTypeOfMainSwitcherVisible");
      goto LABEL_16;
    case 2:
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v12, "_axIsTypeOfMainSwitcherVisible") & 1) != 0)
      {
        -[SBFluidSwitcherViewControllerAccessibility _axSwitcherType](self, "_axSwitcherType");
        v13 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
        v14 = v13[2]();

        if (v14 == 1)
        {
LABEL_11:
          v8 = 1;
          goto LABEL_17;
        }
      }
      else
      {

      }
      -[SBFluidSwitcherViewControllerAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "_axIsFloatingSwitcherVisible");
LABEL_16:
      v8 = v16;

LABEL_17:
      return v8;
    default:
LABEL_5:
      v8 = 0;
      goto LABEL_17;
  }
}

@end
