@implementation SBIconListPageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconListPageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListPageControl"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBIconListPageControl"), CFSTR("UIPageControl"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListPageControl"), CFSTR("_delegate"), "<SBIconListPageControlDelegate>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBHIconManager"), CFSTR("hasOpenFolder"), "B", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBIconListPageControl"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBFolderController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderController"), CFSTR("_contentView"), "SBFolderView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListPageControl"), CFSTR("actsAsButton"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("currentPageIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFolderView"), CFSTR("minimumPageIndex"), "q", 0);

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  SBIconListPageControlAccessibility *v8;
  SBIconListPageControlAccessibility *v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;
  CGRect v14;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[SBIconListPageControlAccessibility bounds](self, "bounds");
    v14 = CGRectInset(v13, 0.0, -25.0);
    v12.x = x;
    v12.y = y;
    if (!CGRectContainsPoint(v14, v12))
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = self;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)SBIconListPageControlAccessibility;
    -[SBIconListPageControlAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = (SBIconListPageControlAccessibility *)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)_accessibilityScrollAncestor
{
  void *v2;
  void *v3;

  -[SBIconListPageControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFolderView")));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsLastPage
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter"))
  {
    v3 = -[SBIconListPageControlAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex");
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "numberOfPages");
  }
  else
  {
    AXSBIconControllerSharedInstance();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityIconListIndex"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "safeValueForKey:", CFSTR("_accessibilityIconListCount"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v7, "integerValue");

  }
  return v3 + 1 >= v5;
}

- (id)_axDelegate
{
  void *v2;
  id v3;
  void *v4;

  -[SBIconListPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ControlCenterUI.IconListRootFolderView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = v2;
  }
  else
  {
    AXSBIconControllerSharedInstance();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (BOOL)_axIsControlCenter
{
  void *v2;
  char isKindOfClass;

  -[SBIconListPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("ControlCenterUI.IconListRootFolderView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if ((-[SBIconListPageControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("actsAsButton")) & 1) != 0)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)SBIconListPageControlAccessibility;
  return -[SBIconListPageControlAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
}

- (BOOL)_accessibilityGoToNextPage
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  uint64_t v7;

  if (!-[SBIconListPageControlAccessibility _axIsLastPage](self, "_axIsLastPage"))
  {
    -[SBIconListPageControlAccessibility _axDelegate](self, "_axDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter")
      || -[SBIconListPageControlAccessibility _axHasOpenFolder](self, "_axHasOpenFolder")
      || (objc_msgSend(v4, "_axNeedsToDismissHomeScreenTodayView") & 1) == 0)
    {
      v5 = -[SBIconListPageControlAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex");
      objc_opt_class();
      __UIAccessibilityCastAsClass();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "numberOfPages");

      if (v5 >= v7)
      {

        return 0;
      }
      -[SBIconListPageControlAccessibility _axSetNewPage:](self, "_axSetNewPage:", v5 + 1);
    }
    else
    {
      objc_msgSend(v4, "_axHideTodayView");
    }

    return 1;
  }
  if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter")
    || -[SBIconListPageControlAccessibility _axHasOpenFolder](self, "_axHasOpenFolder"))
  {
    return 0;
  }
  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "_axIsShowingHomeScreenTodayView"))
  {
    objc_msgSend(v3, "_axShowAppLibrary");

    return 1;
  }

  return 0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  if (a3 == 1)
  {
    -[SBIconListPageControlAccessibility accessibilityDecrement](self, "accessibilityDecrement");
    return 1;
  }
  if (a3 == 2)
  {
    -[SBIconListPageControlAccessibility accessibilityIncrement](self, "accessibilityIncrement");
    return 1;
  }
  return 0;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (BOOL)_accessibilityViewIsVisible
{
  objc_super v4;

  if (_AXSAutomationEnabled())
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SBIconListPageControlAccessibility;
  return -[SBIconListPageControlAccessibility _accessibilityViewIsVisible](&v4, sel__accessibilityViewIsVisible);
}

- (void)accessibilityDecrement
{
  uint64_t v3;
  uint64_t v4;
  id v5;

  v3 = -[SBIconListPageControlAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex");
  v4 = v3 - 1;
  if (v3 < 1)
  {
    if (!-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter", v4)
      && !-[SBIconListPageControlAccessibility _axHasOpenFolder](self, "_axHasOpenFolder"))
    {
      AXSBIconControllerSharedInstance();
      v5 = (id)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "_axIsShowingHomeScreenTodayView") & 1) == 0)
        objc_msgSend(v5, "_axShowTodayView");

    }
  }
  else
  {
    -[SBIconListPageControlAccessibility _axSetNewPage:](self, "_axSetNewPage:", v4);
  }
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73A0];
}

- (id)accessibilityLabel
{
  return 0;
}

- (id)accessibilityHint
{
  void *v3;
  void *v5;
  __CFString *v6;

  if (-[SBIconListPageControlAccessibility _axHasOpenFolder](self, "_axHasOpenFolder"))
    goto LABEL_2;
  if (-[SBIconListPageControlAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("actsAsButton")))
  {
    accessibilityLocalizedString(CFSTR("page.management.hint"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter")
    || -[SBIconListPageControlAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex"))
  {
LABEL_2:
    v3 = 0;
  }
  else
  {
    AXSBIconControllerSharedInstance();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "_axIsShowingHomeScreenTodayView"))
      v6 = CFSTR("will.hide.today.view.hint");
    else
      v6 = CFSTR("will.show.today.view.hint");
    accessibilityLocalizedString(v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (int64_t)_accessibilityCurrentPageIndex
{
  void *v3;
  int64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;

  if (AXProcessIsCarPlay())
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "currentPage") + 1;
  }
  else
  {
    if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter"))
    {
      -[SBIconListPageControlAccessibility _axDelegate](self, "_axDelegate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      AXSBIconControllerSharedInstance();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_currentFolderController"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v6 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("minimumPageIndex"));
    -[SBIconListPageControlAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "safeIntegerForKey:", CFSTR("currentPageIndex"));

    v4 = v8 - v6;
  }

  return v4;
}

- (id)accessibilityValue
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v3 = -[SBIconListPageControlAccessibility _accessibilityCurrentPageIndex](self, "_accessibilityCurrentPageIndex");
  LOBYTE(v12) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfPages");

  v6 = v5 & ~(v5 >> 63);
  if (-[SBIconListPageControlAccessibility _axIsControlCenter](self, "_axIsControlCenter"))
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__4;
    v16 = __Block_byref_object_dispose__4;
    v17 = 0;
    AXPerformSafeBlock();
    v7 = (id)v13[5];
    _Block_object_dispose(&v12, 8);

    AXControlCenterPageStatus(v3, v5 & ~(v5 >> 63), v7);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (-[SBIconListPageControlAccessibility _axHasOpenFolder](self, "_axHasOpenFolder")
      || AXDeviceIsPad())
    {
      ++v3;
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("springboard.page.status"));
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v7, v3, v6);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  return v10;
}

void __56__SBIconListPageControlAccessibility_accessibilityValue__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "_axDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indicatorDescriptionForPageIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axSetNewPage:(int64_t)a3
{
  AXPerformBlockOnMainThreadAfterDelay();
}

void __52__SBIconListPageControlAccessibility__axSetNewPage___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  if ((objc_msgSend(*(id *)(a1 + 32), "_axIsControlCenter") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_axDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    AXSBIconControllerSharedInstance();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_currentFolderController"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v3, "setCurrentPageIndex:animated:", objc_msgSend(v3, "safeIntegerForKey:", CFSTR("minimumPageIndex")) + *(_QWORD *)(a1 + 40), 1);
  MEMORY[0x2349200C4](*MEMORY[0x24BDF7328]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], &stru_250385500);

}

- (BOOL)_axHasOpenFolder
{
  void *v2;
  char v3;

  AXSBHIconManagerFromSharedIconController();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("hasOpenFolder"));

  return v3;
}

- (BOOL)_accessibilityShouldIncludeArrowKeyCommandsForDirectionalFocusMovement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  if (-[SBIconListPageControlAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))
  {
    AXSBIconControllerSharedInstance();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_currentFolderController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_contentView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListPageControlAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFolderView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 == v6;

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)SBIconListPageControlAccessibility;
    return -[SBIconListPageControlAccessibility canBecomeFocused](&v9, sel_canBecomeFocused);
  }
  return v7;
}

@end
