@implementation SBFluidSwitcherContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFluidSwitcherContentView");
}

- (void)_axAddVisibleItemContainer:(id)a3 forAppLayout:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBFluidSwitcherContentViewAccessibility _axAppElementsDictionary](self, "_axAppElementsDictionary");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setItemContainer:", v7);
}

- (void)_axSetElementsArray:(id)a3 dictionary:(id)a4
{
  id v6;

  v6 = a4;
  -[SBFluidSwitcherContentViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", a3, CFSTR("AppSwitcherElements"));
  -[SBFluidSwitcherContentViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("AppSwitcherElementsDictionary"));

}

- (NSMutableDictionary)_axAppElementsDictionary
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[SBFluidSwitcherContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AppSwitcherElementsDictionary"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_axCreateAppElements");

    -[SBFluidSwitcherContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AppSwitcherElementsDictionary"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return (NSMutableDictionary *)v3;
}

- (SBFluidSwitcherViewControllerAccessibility)_axSwitcherViewController
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AppSwitcherViewController"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFluidSwitcherViewControllerAccessibility *)v3;
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityHasVisibleFrame"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBFluidSwitcherViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_plusButton"), "SBFluidSwitcherButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_reopenClosedWindowsButton"), "SBFluidSwitcherTitledButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("visibleUnderlayAccessoryViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFluidSwitcherContentView"), CFSTR("_delegate"), "<SBFluidSwitcherContentViewDelegate>");

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBFluidSwitcherContentViewAccessibility _axElements:](self, "_axElements:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    -[SBFluidSwitcherContentViewAccessibility accessibilityElements](&v8, sel_accessibilityElements);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;

  -[SBFluidSwitcherContentViewAccessibility _axElements:](self, "_axElements:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    -[SBFluidSwitcherContentViewAccessibility automationElements](&v8, sel_automationElements);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)_axElements:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  uint64_t v14;
  void *v15;
  int v16;
  void *v17;
  _QWORD v19[4];
  char v20;

  v3 = a3;
  if (-[SBFluidSwitcherContentViewAccessibility _axSwitcherIsVisible](self, "_axSwitcherIsVisible"))
  {
    -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_reopenClosedWindowsButton"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "_accessibilityViewIsVisible"))
      objc_msgSend(v6, "axSafelyAddObject:", v7);
    objc_msgSend(v5, "safeUIViewForKey:", CFSTR("_plusButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axSafelyAddObject:", v8);
    if (v3)
    {
      -[SBFluidSwitcherContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_delegate"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeDictionaryForKey:", CFSTR("visibleUnderlayAccessoryViews"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allValues");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v11);
    }
    -[SBFluidSwitcherContentViewAccessibility _axAppElements](self, "_axAppElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (UIAccessibilityIsSwitchControlRunning() && AXDeviceIsPhoneIdiom())
    {
      v13 = -[SBFluidSwitcherContentViewAccessibility _accessibilityApplicationIsRTL](self, "_accessibilityApplicationIsRTL");
      v19[0] = MEMORY[0x24BDAC760];
      v19[1] = 3221225472;
      v19[2] = __55__SBFluidSwitcherContentViewAccessibility__axElements___block_invoke;
      v19[3] = &__block_descriptor_33_e49_B24__0__SBAppSwitcherAppAccessibilityElement_8Q16l;
      v20 = v13;
      objc_msgSend(v12, "axFilterObjectsUsingBlock:", v19);
      v14 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v14;
    }
    -[SBFluidSwitcherContentViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "_axIsChamoisSwitcherVisible");

    if (v16)
    {
      objc_msgSend(v5, "_axChamoisActiveApps");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v17);

    }
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v12);

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

BOOL __55__SBFluidSwitcherContentViewAccessibility__axElements___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double MaxX;
  void *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  CGRect v16;

  objc_msgSend(a2, "accessibilityFrame");
  v7 = v5;
  v8 = v6;
  v10 = *MEMORY[0x24BDBF148];
  v9 = *(double *)(MEMORY[0x24BDBF148] + 8);
  if (*(_BYTE *)(a1 + 32))
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v3);
    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v13 = MaxX > CGRectGetMaxX(v16);

  }
  else
  {
    v13 = CGRectGetMinX(*(CGRect *)&v3) < 0.0;
  }
  v14 = v7 == v10;
  if (v8 != v9)
    v14 = 0;
  return !v14 && !v13;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  char v6;
  objc_super v8;

  if (-[SBFluidSwitcherContentViewAccessibility _axSwitcherIsVisible](self, "_axSwitcherIsVisible"))
  {
    -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityScroll:", a3);

    return v6;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
    return -[SBFluidSwitcherContentViewAccessibility accessibilityScroll:](&v8, sel_accessibilityScroll_, a3);
  }
}

- (int64_t)_accessibilityPageCount
{
  void *v2;
  int64_t v3;

  -[SBFluidSwitcherContentViewAccessibility _axAppElements](self, "_axAppElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  objc_super v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;
  CGPoint v36;
  CGRect v37;

  y = a3.y;
  x = a3.x;
  v35 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (!-[SBFluidSwitcherContentViewAccessibility _axSwitcherIsVisible](self, "_axSwitcherIsVisible"))
    goto LABEL_17;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[SBFluidSwitcherContentViewAccessibility _axAppElements](self, "_axAppElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reverseObjectEnumerator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (!v10)
    goto LABEL_16;
  v11 = v10;
  v12 = *(_QWORD *)v31;
  while (2)
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v31 != v12)
        objc_enumerationMutation(v9);
      objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v13), "_accessibilityHitTest:withEvent:", v7, x, y);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_axChamoisActiveApps");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBFluidSwitcherContentViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "_axIsChamoisSwitcherVisible"))
      {
        v18 = objc_msgSend(v16, "count");

        if (v18 == 1)
        {
          objc_msgSend(v16, "objectAtIndex:", 0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "_accessibilityBounds");
          UIAccessibilityFrameForBounds();
          v21 = v20;
          v23 = v22;
          v25 = v24;
          v27 = v26;

          v37.origin.x = v21;
          v37.origin.y = v23;
          v37.size.width = v25;
          v37.size.height = v27;
          v36.x = x;
          v36.y = y;
          if (CGRectContainsPoint(v37, v36))
          {

            goto LABEL_14;
          }
        }
      }
      else
      {

      }
      if (v14)
      {

        goto LABEL_19;
      }
      v14 = v16;
LABEL_14:

      ++v13;
    }
    while (v11 != v13);
    v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    if (v11)
      continue;
    break;
  }
LABEL_16:

LABEL_17:
  v29.receiver = self;
  v29.super_class = (Class)SBFluidSwitcherContentViewAccessibility;
  -[SBFluidSwitcherContentViewAccessibility _accessibilityHitTest:withEvent:](&v29, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v14;
}

- (void)_axRemoveVisibleItemContainerForAppLayout:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[SBFluidSwitcherContentViewAccessibility _axAppElementsDictionary](self, "_axAppElementsDictionary");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setItemContainer:", 0);
}

- (id)_axElementForAppLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFluidSwitcherContentViewAccessibility _axAppElementsDictionary](self, "_axAppElementsDictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_axScrollToAppElement:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  _QWORD v11[5];

  v4 = a3;
  -[SBFluidSwitcherContentViewAccessibility _axAppElements](self, "_axAppElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    v7 = objc_msgSend(v5, "count") + ~v6;
  -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __65__SBFluidSwitcherContentViewAccessibility__axScrollToAppElement___block_invoke;
  v11[3] = &unk_250367AD0;
  v11[4] = self;
  v9 = objc_msgSend(v8, "_axPerformScrollToIndex:completion:", v7, v11);

  return v9;
}

void __65__SBFluidSwitcherContentViewAccessibility__axScrollToAppElement___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "_axSwitcherViewController");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_axUpdateElementOrderingIfNecessary");

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

- (NSArray)_axAppElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[SBFluidSwitcherContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AppSwitcherElements"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    objc_msgSend(v4, "_axCreateAppElements");
    -[SBFluidSwitcherContentViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AppSwitcherElements"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  -[SBFluidSwitcherContentViewAccessibility _axMainSwitcher](self, "_axMainSwitcher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "_axIsChamoisSwitcherVisible"))
  {
    v19 = v6;
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v4;
    objc_msgSend(v4, "_axChamoisActiveAppLayouts");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v3;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          objc_msgSend(v14, "appLayout");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v8, "containsObject:", v15);

          if ((v16 & 1) == 0)
            objc_msgSend(v7, "axSafelyAddObject:", v14);
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      }
      while (v11);
    }

    objc_msgSend(v7, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
    v17 = (id)objc_claimAutoreleasedReturnValue();

    v6 = v19;
    v4 = v20;
  }
  else
  {
    v17 = v3;
  }

  return (NSArray *)v17;
}

- (BOOL)_accessibilityCanDrag
{
  return 1;
}

- (BOOL)_axSwitcherIsVisible
{
  void *v2;
  char v3;

  -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_axIsVisible");

  return v3;
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v2;
  void *v3;

  -[SBFluidSwitcherContentViewAccessibility _axSwitcherViewController](self, "_axSwitcherViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
