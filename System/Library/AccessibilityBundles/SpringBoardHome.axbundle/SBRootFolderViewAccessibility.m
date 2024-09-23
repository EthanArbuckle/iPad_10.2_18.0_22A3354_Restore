@implementation SBRootFolderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBRootFolderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBRootFolderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("_SBRootFolderLayoutWrapperView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBRootFolderViewPageManagementLayoutManager"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRootFolderView"), CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("firstIconListView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("widgetIntroductionPopover"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderView"), CFSTR("_scrollView"), "SBIconScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderView"), CFSTR("_searchableLeadingCustomWrapperView"), "_SBRootFolderLayoutWrapperView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderView"), CFSTR("_searchPulldownWrapperView"), "_SBRootFolderLayoutWrapperView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderView"), CFSTR("_searchableTrailingCustomWrapperView"), "_SBRootFolderLayoutWrapperView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("setIdleText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBHPageManagementCellViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBRootFolderViewPageManagementLayoutManager"), CFSTR("_iconViewControllersByIcon"), "NSMapTable");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBViewControllerTransitionContext"), CFSTR("animator"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFramewiseInteractiveTransitionAnimator"), CFSTR("isPresenting"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("isPageManagementUIVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("specialLayoutManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("todayViewVisibilityProgress"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("widgetButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("doneButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("scrollAccessoryView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("setSpecialLayoutManager:completionHandler:"), "v", "@", "@?", 0);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  void *v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  char v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchPulldownWrapperView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "addObject:", v4);
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchableLeadingCustomWrapperView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "addObject:", v5);
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_searchableTrailingCustomWrapperView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "addObject:", v6);
  if (-[SBRootFolderViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isPageManagementUIVisible")))
  {
    v27 = v5;
    v28 = v4;
    v33 = 0;
    objc_opt_class();
    -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("specialLayoutManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_iconViewControllersByIcon"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v10 = v9;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v10, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v27, v28, (_QWORD)v29);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "safeValueForKey:", CFSTR("view"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "axSafelyAddObject:", v16);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v12);
    }

    v5 = v27;
    v4 = v28;
  }
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("widgetButton"), v27, v28);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v17);

  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("doneButton"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v18);

  -[SBRootFolderViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("firstIconListView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeUIViewForKey:", CFSTR("widgetIntroductionPopover"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "_accessibilityViewIsVisible"))
    objc_msgSend(v3, "addObject:", v20);
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("folder"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "automationElements");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v22);

  if (AXDeviceIsPad())
    v23 = CFSTR("pageControl");
  else
    v23 = CFSTR("scrollAccessoryView");
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v24);

  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dockView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v25);

  return v3;
}

- (id)_accessibilitySubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  -[SBRootFolderViewAccessibility subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_idleTextView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "indexOfObject:", v5);
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v4, "count") - 1, v6);

  return v4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilityCompareElement:(id)a3 toElement:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int64_t v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBDockView")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBDockView")));
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8 || v9)
  {
    if (v8 || !v9)
    {
      v13.receiver = self;
      v13.super_class = (Class)SBRootFolderViewAccessibility;
      v11 = -[SBRootFolderViewAccessibility _accessibilityCompareElement:toElement:](&v13, sel__accessibilityCompareElement_toElement_, v6, v7);
    }
    else
    {
      v11 = -1;
    }
  }
  else
  {
    v11 = 1;
  }

  return v11;
}

- (id)_accessibilityHitTestSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[SBRootFolderViewAccessibility subviews](self, "subviews");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_idleTextView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "indexOfObject:", v5);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(v4, "exchangeObjectAtIndex:withObjectAtIndex:", objc_msgSend(v4, "count") - 1, v6);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolderViewAccessibility;
    -[SBRootFolderViewAccessibility _accessibilityHitTestSubviews](&v8, sel__accessibilityHitTestSubviews);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;
  id v10;
  objc_super v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__9;
  v16 = __Block_byref_object_dispose__9;
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderViewAccessibility;
  -[SBRootFolderViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v7;
  AXPerformSafeBlock();
  v8 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v8;
}

void __65__SBRootFolderViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  char isKindOfClass;
  void *v3;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if ((isKindOfClass & 1) != 0 || !v3)
  {
    v9 = v3;
    objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_scrollView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "safeCGFloatForKey:", CFSTR("todayViewVisibilityProgress"));
    if (v5 > 0.0 && (objc_msgSend(v9, "isDescendantOfView:", v4) & 1) == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "safeUIViewForKey:", CFSTR("_searchableLeadingCustomWrapperView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "convertPoint:toView:", v6, *(double *)(a1 + 56), *(double *)(a1 + 64));
      objc_msgSend(v6, "_accessibilityHitTest:withEvent:", *(_QWORD *)(a1 + 40));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        v8 = v7;
      else
        v8 = v9;
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v8);

    }
  }
}

- (void)setIdleText:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBRootFolderViewAccessibility;
  -[SBRootFolderViewAccessibility setIdleText:](&v7, sel_setIdleText_, a3);
  -[SBRootFolderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_idleTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "setIsAccessibilityElement:", 1);
    objc_msgSend(v5, "safeValueForKey:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v6);

  }
}

- (void)setSpecialLayoutManager:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __75__SBRootFolderViewAccessibility_setSpecialLayoutManager_completionHandler___block_invoke;
  v12[3] = &unk_2503840E8;
  v13 = v6;
  v14 = v7;
  v8 = v6;
  v9 = v7;
  v10 = (void *)MEMORY[0x23492034C](v12);
  v11.receiver = self;
  v11.super_class = (Class)SBRootFolderViewAccessibility;
  -[SBRootFolderViewAccessibility setSpecialLayoutManager:completionHandler:](&v11, sel_setSpecialLayoutManager_completionHandler_, v8, v10);

}

void __75__SBRootFolderViewAccessibility_setSpecialLayoutManager_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  if (v1)
    (*(void (**)(void))(v1 + 16))();
  NSClassFromString(CFSTR("SBRootFolderViewPageManagementLayoutManager"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("page.management.showing"));
    v2 = (id)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

@end
