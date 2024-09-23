@implementation SBIconScrollViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconScrollView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("presentSpotlightFromSource:animated:completionHandler:"), "B", "Q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isShowingLeadingCustomView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("isShowingSpotlightOrLeadingCustomView"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconViewForIcon:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("setCurrentPageIndex: animated: completion:"), "B", "q", "B", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("iconListViewAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("_depth"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("minimumPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("firstIconPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("pageCount"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("currentPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderView"), CFSTR("leadingCustomViewPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBIconScrollView"), CFSTR("BSUIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BSUIScrollView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBRootFolderController"), CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderController"), CFSTR("firstIconPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBRootFolderController"), CFSTR("isDisplayingWidgetIntroductionOnPage:"), "B", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderController"), CFSTR("_contentView"), "SBFolderView");

}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)accessibilityViewIsModal
{
  void *v2;
  BOOL v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  -[SBIconScrollViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("delegate.delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeIntegerForKey:", CFSTR("firstIconPageIndex"));
  NSClassFromString(CFSTR("ControlCenterUI.IconListRootFolderController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x2020000000;
    v9 = 0;
    v5 = v2;
    AXPerformSafeBlock();
    v3 = *((_BYTE *)v7 + 24) != 0;

    _Block_object_dispose(&v6, 8);
  }

  return v3;
}

uint64_t __57__SBIconScrollViewAccessibility_accessibilityViewIsModal__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isDisplayingWidgetIntroductionOnPage:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (BOOL)accessibilityScrollToTopSupported
{
  return 0;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)_accessibilityCurrentFolderIconForPage:(int64_t)a3
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentFolderController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (NSClassFromString(CFSTR("SBRootFolderController")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    v19 = 0;
    v13 = v4;
    AXPerformSafeBlock();
    v6 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
    LOBYTE(v14) = 0;
    objc_opt_class();
    objc_msgSend(v6, "icons");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_BYTE)v14)
      abort();
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__7;
    v18 = __Block_byref_object_dispose__7;
    v19 = 0;
    v11 = v6;
    v12 = v9;
    AXPerformSafeBlock();
    v5 = (id)v15[5];

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __72__SBIconScrollViewAccessibility__accessibilityCurrentFolderIconForPage___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconListViewAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __72__SBIconScrollViewAccessibility__accessibilityCurrentFolderIconForPage___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "iconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityScrollStatus:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;

  v3 = a3;
  AXSBIconControllerSharedInstance();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityIconListIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  if (!v3)
  {
    if (v6 >= 2)
    {
      v9 = -1;
      goto LABEL_6;
    }
LABEL_10:
    v14 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityIconListCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue") - 1;

  if (v6 >= v8)
    goto LABEL_10;
  v9 = 1;
LABEL_6:
  v10 = v6 + v9;
  AXSBHIconManagerFromSharedIconController();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "safeBoolForKey:", CFSTR("isShowingLeadingCustomView"));

  if (v12)
    v13 = -1;
  else
    v13 = v10;
  AXSBScrollDescriptionForCurrentPage(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v14;
}

- (id)automationElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentFolderController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_iconListViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_accessibilityScrollStatus
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_accessibilityIconListIndex"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  AXSBScrollDescriptionForCurrentPage(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)accessibilityScrollUpPageSupported
{
  void *v2;
  char v3;

  AXSBHIconManagerFromSharedIconController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isShowingSpotlightOrLeadingCustomView"));

  return v3 ^ 1;
}

- (BOOL)accessibilityScrollUpPage
{
  void *v3;
  char v4;

  if (-[SBIconScrollViewAccessibility _axIsControlCenter](self, "_axIsControlCenter"))
    return 0;
  AXSBHIconManagerFromSharedIconController();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isShowingSpotlightOrLeadingCustomView"));

  if ((v4 & 1) != 0)
    return 0;
  -[SBIconScrollViewAccessibility _accessibilityActivateSpotlight](self, "_accessibilityActivateSpotlight");
  return 1;
}

- (BOOL)_axIsControlCenter
{
  NSClassFromString(CFSTR("CCUIIconScrollView"));
  return objc_opt_isKindOfClass() & 1;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v6;
  void *v7;
  uint64_t v8;
  _BOOL4 v9;

  if (-[SBIconScrollViewAccessibility _axIsControlCenter](self, "_axIsControlCenter"))
  {
    if (a3 == 4)
      return -[SBIconScrollViewAccessibility _accessibilityCCScrollToNextPage](self, "_accessibilityCCScrollToNextPage");
    if (a3 == 3)
      return -[SBIconScrollViewAccessibility _accessibilityCCScrollToPreviousPage](self, "_accessibilityCCScrollToPreviousPage");
    return 0;
  }
  if (-[SBIconScrollViewAccessibility _accessibilityApplicationIsRTL](self, "_accessibilityApplicationIsRTL"))
  {
    if (a3 != 2)
    {
      if (a3 != 1)
        goto LABEL_14;
      return -[SBIconScrollViewAccessibility _accessibilitySBScrollToNextPage](self, "_accessibilitySBScrollToNextPage");
    }
    return -[SBIconScrollViewAccessibility _accessibilitySBScrollToPreviousPage](self, "_accessibilitySBScrollToPreviousPage");
  }
  if (a3 == 2)
    return -[SBIconScrollViewAccessibility _accessibilitySBScrollToNextPage](self, "_accessibilitySBScrollToNextPage");
  if (a3 == 1)
    return -[SBIconScrollViewAccessibility _accessibilitySBScrollToPreviousPage](self, "_accessibilitySBScrollToPreviousPage");
LABEL_14:
  AXSBIconControllerSharedInstance();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("_accessibilityIconListCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");
  if (a3 == 3 && v8 == 1)
  {
    v9 = -[SBIconScrollViewAccessibility accessibilityScrollUpPageSupported](self, "accessibilityScrollUpPageSupported");

    if (v9)
      return -[SBIconScrollViewAccessibility accessibilityScrollUpPage](self, "accessibilityScrollUpPage");
  }
  else
  {

  }
  return 0;
}

- (void)_accessibilityActivateSpotlight
{
  void *v2;
  id v3;

  accessibilityLocalizedString(CFSTR("spotlight.visible"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  objc_msgSend(MEMORY[0x24BE006F0], "server");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "toggleSpotlight");

}

- (BOOL)_accessibilitySBScrollToNextPage
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;

  -[SBIconScrollViewAccessibility _accessibilityFolderContentView](self, "_accessibilityFolderContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("currentPageIndex"));

  v8 = v4;
  v5 = -[SBIconScrollViewAccessibility _accessibilityPageActionForNextGesture:](self, "_accessibilityPageActionForNextGesture:", &v8);
  switch(v5)
  {
    case 3uLL:
      AXSBIconControllerSharedInstance();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_axShowAppLibrary");
LABEL_7:

      return 1;
    case 2uLL:
      AXSBIconControllerSharedInstance();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_axHideTodayView");
      goto LABEL_7;
    case 0uLL:
      -[SBIconScrollViewAccessibility _accessibilityScrollToPage:](self, "_accessibilityScrollToPage:", v8);
      return 1;
  }
  return 0;
}

- (BOOL)_accessibilitySBScrollToPreviousPage
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  uint64_t v8;

  -[SBIconScrollViewAccessibility _accessibilityFolderContentView](self, "_accessibilityFolderContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("currentPageIndex"));

  v8 = v4;
  v5 = -[SBIconScrollViewAccessibility _accessibilityPageActionForPreviousGesture:](self, "_accessibilityPageActionForPreviousGesture:", &v8);
  switch(v5)
  {
    case 4uLL:
      AXSBIconControllerSharedInstance();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_axHideAppLibrary");
LABEL_7:

      return 1;
    case 1uLL:
      AXSBIconControllerSharedInstance();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_axShowTodayView");
      goto LABEL_7;
    case 0uLL:
      -[SBIconScrollViewAccessibility _accessibilityScrollToPage:](self, "_accessibilityScrollToPage:", v8);
      return 1;
  }
  return 0;
}

- (BOOL)_accessibilityCCScrollToNextPage
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  -[SBIconScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("minimumPageIndex"));
  v4 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("currentPageIndex")) + 1 - v3;
  v5 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("pageCount"));
  if (v4 < v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    v10 = v2;
    AXPerformSafeBlock();
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    v9 = v10;
    v7 = v6;
    AXPerformSafeBlock();

  }
  return v4 < v5;
}

void __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indicatorDescriptionForPageIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_3;
  v6[3] = &unk_250383ED0;
  v9 = *(_OWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "setCurrentPageIndex:animated:completion:", v2, 1, v6);

}

void __65__SBIconScrollViewAccessibility__accessibilityCCScrollToNextPage__block_invoke_3(uint64_t a1)
{
  void *v2;

  AXControlCenterPageStatus(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

- (BOOL)_accessibilityCCScrollToPreviousPage
{
  void *v2;
  uint64_t v3;
  id v4;
  int v5;
  id v6;
  id v7;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  uint64_t *v22;
  uint64_t v23;

  -[SBIconScrollViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeIntegerForKey:", CFSTR("minimumPageIndex"));
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("currentPageIndex")) - 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  LOBYTE(v14) = 0;
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke;
  v20 = &unk_250383D48;
  v22 = &v11;
  v4 = v2;
  v21 = v4;
  v23 = v3;
  AXPerformSafeBlock();
  v5 = *((unsigned __int8 *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  if (v5)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__7;
    v15 = __Block_byref_object_dispose__7;
    v16 = 0;
    v10 = v4;
    AXPerformSafeBlock();
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
    objc_msgSend(v10, "safeIntegerForKey:", CFSTR("pageCount"));
    v9 = v10;
    v7 = v6;
    AXPerformSafeBlock();

  }
  return v5 != 0;
}

uint64_t __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isValidPageIndex:", *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "indicatorDescriptionForPageIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  __int128 v9;

  v2 = *(_QWORD *)(a1 + 56);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_4;
  v6[3] = &unk_250383ED0;
  v9 = *(_OWORD *)(a1 + 64);
  v3 = *(void **)(a1 + 32);
  v4 = *(id *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v7 = v4;
  v8 = v5;
  objc_msgSend(v3, "setCurrentPageIndex:animated:completion:", v2, 1, v6);

}

void __69__SBIconScrollViewAccessibility__accessibilityCCScrollToPreviousPage__block_invoke_4(uint64_t a1)
{
  void *v2;

  AXControlCenterPageStatus(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], *(id *)(a1 + 40));
}

- (BOOL)_accessibilityRemembersLastFocusedChild
{
  return 0;
}

- (unint64_t)_accessibilityPageActionForPreviousGesture:(int64_t *)a3
{
  void *v5;
  char v6;
  void *v8;
  uint64_t v9;
  int64_t v10;
  int64_t v11;
  int v12;
  _BOOL4 IsRootFolder;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  AXSBIconControllerSharedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_axIsShowingAppLibrary");

  if ((v6 & 1) != 0)
    return 4;
  -[SBIconScrollViewAccessibility _accessibilityFolderContentView](self, "_accessibilityFolderContentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safeIntegerForKey:", CFSTR("minimumPageIndex"));

  v10 = *a3;
  v11 = *a3 - 1;
  *a3 = v11;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  AXPerformSafeBlock();
  v12 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  IsRootFolder = AXSBFolderControllerIsRootFolder();
  if (v12)
    return IsRootFolder && AXDeviceIsPhone() && v11 == v9;
  if (IsRootFolder && AXDeviceIsPad() && v10 <= v9)
    return 1;
  return 5;
}

void __76__SBIconScrollViewAccessibility__accessibilityPageActionForPreviousGesture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFolderContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_isValidPageIndex:", *(_QWORD *)(a1 + 48));

}

- (unint64_t)_accessibilityPageActionForNextGesture:(int64_t *)a3
{
  void *v5;
  char v6;
  int64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  AXSBIconControllerSharedInstance();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_axNeedsToDismissHomeScreenTodayView");

  if ((v6 & 1) != 0)
    return 2;
  v8 = *a3 + 1;
  *a3 = v8;
  AXSBIconControllerSharedInstance();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "safeIntegerForKey:", CFSTR("_accessibilityIconListCount"));

  -[SBIconScrollViewAccessibility _accessibilityFolderContentView](self, "_accessibilityFolderContentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "safeIntegerForKey:", CFSTR("minimumPageIndex"));

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  AXPerformSafeBlock();
  v13 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  if (!v13)
    return 5;
  if (AXSBFolderControllerIsRootFolder())
  {
    v14 = v8 - v12;
    if (AXDeviceIsPhone())
    {
      if (v14 > v10)
        return 3;
    }
    if (AXDeviceIsPad() && v14 == v10)
      return 3;
  }
  return 0;
}

void __72__SBIconScrollViewAccessibility__accessibilityPageActionForNextGesture___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFolderContentView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "_isValidPageIndex:", *(_QWORD *)(a1 + 48));

}

- (int64_t)_accessibilityAdjustedPageIndexForPageIndex:(int64_t)a3
{
  if ((AXDeviceIsPad() & 1) != 0 || !AXSBFolderControllerIsRootFolder())
    ++a3;
  return a3;
}

- (id)_accessibilityCurrentFolderController
{
  void *v2;
  void *v3;

  AXSBIconControllerSharedInstance();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentFolderController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityFolderContentView
{
  void *v2;
  void *v3;

  -[SBIconScrollViewAccessibility _accessibilityCurrentFolderController](self, "_accessibilityCurrentFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_contentView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)_accessibilityScrollToPage:(int64_t)a3
{
  AXPerformSafeBlock();
}

void __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityCurrentFolderController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x24BDAC760];
  v4 = 3221225472;
  v5 = __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2;
  v6 = &unk_250383D70;
  objc_msgSend(v2, "setCurrentPageIndex:animated:completion:", MEMORY[0x24BDAC760], 3221225472, __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2, &unk_250383D70, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60__SBIconScrollViewAccessibility__accessibilityScrollToPage___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFolderContentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("minimumPageIndex"));

  AXSBScrollDescriptionForCurrentPage(objc_msgSend(*(id *)(a1 + 32), "_accessibilityAdjustedPageIndexForPageIndex:", *(_QWORD *)(a1 + 40)) - v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeakAndDoNotBeInterrupted();

  LODWORD(v4) = *MEMORY[0x24BDF7328];
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityCurrentFolderIconForPage:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification((UIAccessibilityNotifications)v4, v5);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEEB0]);
}

@end
