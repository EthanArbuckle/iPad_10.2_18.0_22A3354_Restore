@implementation STUIStatusBarAccessibility

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](&v6, sel__updateDisplayedItemsWithData_styleAttributes_extraAnimations_, a3, a4, a5);
  if (-[STUIStatusBarAccessibility _axElementWithinFocused](self, "_axElementWithinFocused"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (BOOL)_axElementWithinFocused
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  _UIAccessibilityFocusedElements();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    v7 = MEMORY[0x24BDAC760];
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v13[0] = v7;
        v13[1] = 3221225472;
        v13[2] = __53__STUIStatusBarAccessibility__axElementWithinFocused__block_invoke;
        v13[3] = &unk_25039D840;
        v13[4] = self;
        objc_msgSend(v9, "_accessibilityFindAncestor:startWithSelf:", v13, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v5)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id obj;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[4];
  id v31;
  id location;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _accessibilityLoadAccessibilityInformation](&v37, sel__accessibilityLoadAccessibilityInformation);
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[STUIStatusBarAccessibility safeDictionaryForKey:](self, "safeDictionaryForKey:", CFSTR("_regions"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v7, "safeUIViewForKey:", CFSTR("contentView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_initWeak(&location, v7);
        v30[0] = MEMORY[0x24BDAC760];
        v30[1] = 3221225472;
        v30[2] = __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v30[3] = &unk_25039D7F0;
        objc_copyWeak(&v31, &location);
        objc_msgSend(v8, "_setAccessibilityElementsHiddenBlock:", v30);
        objc_destroyWeak(&v31);
        objc_destroyWeak(&location);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    }
    while (v4);
  }

  -[STUIStatusBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("visualProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "_accessibilityLoadAccessibilityInformation");
  LOBYTE(location) = 0;
  objc_opt_class();
  -[STUIStatusBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("items"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)location)
    abort();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v21, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v27;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v27 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * j);
        LOBYTE(location) = 0;
        __UIAccessibilitySafeClass();
        v14 = objc_claimAutoreleasedReturnValue();
        if ((_BYTE)location)
          abort();
        v15 = (void *)v14;
        if (v14)
        {
          LOBYTE(location) = 0;
          objc_opt_class();
          -[STUIStatusBarAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayItemStates"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_BYTE)location)
            abort();
          objc_msgSend(v13, "safeValueForKey:", CFSTR("identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(location) = 0;
          objc_msgSend(v17, "objectForKey:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilitySafeClass();
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_BYTE)location)
            abort();
          if (v20)
          {
            v25 = v20;
            AXPerformSafeBlock();

          }
          objc_msgSend(v13, "_accessibilityLoadAccessibilityInformation");

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
    }
    while (v10);
  }

}

- (void)_prepareVisualProviderIfNeeded
{
  void *v3;
  objc_super v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_initWeak(&location, self);
  -[STUIStatusBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("foregroundView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__STUIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke;
  v5[3] = &unk_25039D7F0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityElementsHiddenBlock:", v5);

  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _prepareVisualProviderIfNeeded](&v4, sel__prepareVisualProviderIfNeeded);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarDisplayItem"));
  objc_msgSend(v3, "validateClass:", CFSTR("STUIStatusBarDisplayItemState"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("items"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("displayItemStates"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("currentAggregatedData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("styleAttributes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("visualProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("foregroundView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("_prepareVisualProviderIfNeeded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItem"), CFSTR("displayItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarItem"), CFSTR("identifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItem"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItem"), CFSTR("view"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItemState"), CFSTR("enabilityStatus"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItemPlacementState"), CFSTR("region"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarRegion"), CFSTR("overriddenStyleAttributes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("STUIStatusBar"), CFSTR("_regions"), "NSDictionary");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarRegion"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarRegion"), CFSTR("isEnabled"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("_updateDisplayedItemsWithData:styleAttributes:extraAnimations:"), "v", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItemState"), CFSTR("currentPlacementState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItemState"), CFSTR("_updateForUpdatedData:updatedStyleAttributes:updatedEnability:"), "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarStyleAttributes"), CFSTR("styleAttributesWithOverrides:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBar"), CFSTR("_frameForActionable:actionInsets:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", "{UIEdgeInsets=dddd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarRegion"), CFSTR("displayItems"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STUIStatusBarDisplayItem"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarNavigationItem"), CFSTR("STUIStatusBarItem"));

}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

uint64_t __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("isEnabled")) ^ 1;

  return v2;
}

void __72__STUIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(id *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v2 = objc_msgSend(a1[4], "safeIntegerForKey:", CFSTR("enabilityStatus"));
  if (v2 == 3)
  {
    objc_msgSend(a1[4], "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", 0, 0, MEMORY[0x24BDBD1C0]);
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
LABEL_4:
      v9 = (id)v7;
      objc_msgSend(a1[6], "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("AccessibilityStatusBarUpdateData"));

    }
  }
  else if (v2 == 2)
  {
    objc_msgSend(a1[5], "safeValueForKey:", CFSTR("currentAggregatedData"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "safeValueForKeyPath:", CFSTR("currentPlacementState.region.overriddenStyleAttributes"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[5], "safeValueForKey:", CFSTR("styleAttributes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "styleAttributesWithOverrides:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "_updateForUpdatedData:updatedStyleAttributes:updatedEnability:", v3, v6, MEMORY[0x24BDBD1C8]);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = (uint64_t)v8;
    if (v8)
      goto LABEL_4;
  }
}

- (void)_axSetIsHitTesting:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  STUIStatusBarAccessibility *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  unint64_t v47;
  double v48;
  void *v50;
  void *v51;
  id v52;
  STUIStatusBarAccessibility *v54;
  uint64_t v55;
  uint64_t v56;
  id obj;
  void *v58;
  uint64_t v59;
  id v60;
  void *v61;
  objc_super v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  char v71;
  objc_super v72;
  _BYTE v73[128];
  _BYTE v74[128];
  uint64_t v75;
  CGPoint v76;
  CGRect v77;
  CGRect v78;

  y = a3.y;
  x = a3.x;
  v75 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[STUIStatusBarAccessibility _axSetIsHitTesting:](self, "_axSetIsHitTesting:", 1);
  v72.receiver = self;
  v72.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v72, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = self;
    -[STUIStatusBarAccessibility superview](v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "convertPoint:toView:", v9, x, y);
    v12 = v11;
    v14 = v13;

    -[STUIStatusBarAccessibility frame](v9, "frame");
    v76.x = v12;
    v76.y = v14;
    if (CGRectContainsPoint(v77, v76))
    {
      v71 = 0;
      objc_opt_class();
      -[STUIStatusBarAccessibility safeValueForKey:](v9, "safeValueForKey:", CFSTR("items"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v60 = v7;
      v54 = self;
      v67 = 0u;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      objc_msgSend(v16, "allValues");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      if (v17)
      {
        v18 = v17;
        v61 = 0;
        v19 = *(_QWORD *)v68;
        v20 = 1.79769313e308;
        v55 = *(_QWORD *)v68;
        do
        {
          v21 = 0;
          v56 = v18;
          do
          {
            if (*(_QWORD *)v68 != v19)
              objc_enumerationMutation(obj);
            v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v21);
            MEMORY[0x2349217D4](CFSTR("STUIStatusBarItem"));
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v71 = 0;
              objc_opt_class();
              objc_msgSend(v22, "safeValueForKey:", CFSTR("displayItems"));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              __UIAccessibilityCastAsClass();
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (v71)
                abort();
              v58 = v24;
              v59 = v21;
              v63 = 0u;
              v64 = 0u;
              v65 = 0u;
              v66 = 0u;
              objc_msgSend(v24, "allValues");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
              if (v26)
              {
                v27 = v26;
                v28 = *(_QWORD *)v64;
                do
                {
                  for (i = 0; i != v27; ++i)
                  {
                    if (*(_QWORD *)v64 != v28)
                      objc_enumerationMutation(v25);
                    v30 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * i);
                    MEMORY[0x2349217D4](CFSTR("STUIStatusBarDisplayItem"));
                    if ((objc_opt_isKindOfClass() & 1) != 0
                      && objc_msgSend(v30, "safeBoolForKey:", CFSTR("isEnabled")))
                    {
                      objc_msgSend(v30, "safeUIViewForKey:", CFSTR("view"));
                      v31 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
                      v32 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v32, "coordinateSpace");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "center");
                      v35 = v34;
                      v37 = v36;
                      objc_msgSend(v31, "superview");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "convertPoint:fromCoordinateSpace:", v38, v35, v37);
                      v40 = v39;
                      v42 = v41;

                      AX_CGPointGetDistanceToPoint();
                      v44 = v43;
                      objc_msgSend(MEMORY[0x24BE006F0], "server");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v45, "medusaApps");
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      v47 = objc_msgSend(v46, "count");

                      if (v47 < 2)
                      {
                        v48 = 1.79769313e308;
                      }
                      else
                      {
                        objc_msgSend(v31, "frame");
                        v48 = fmax(CGRectGetWidth(v78), 50.0);
                      }
                      if (v44 <= v48 && v44 < v20)
                      {
                        v62.receiver = v9;
                        v62.super_class = (Class)STUIStatusBarAccessibility;
                        -[STUIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v62, sel__accessibilityHitTest_withEvent_, v60, v40, v42);
                        v50 = (void *)objc_claimAutoreleasedReturnValue();
                        v51 = v50;
                        if (v50)
                        {
                          v52 = v50;

                          v61 = v52;
                          v20 = v44;
                        }

                      }
                    }
                  }
                  v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v63, v73, 16);
                }
                while (v27);
              }

              v19 = v55;
              v18 = v56;
              v21 = v59;
            }
            ++v21;
          }
          while (v21 != v18);
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
        }
        while (v18);
      }
      else
      {
        v61 = 0;
      }

      self = v54;
      v7 = v60;
    }
    else
    {
      v61 = 0;
    }

    v8 = v61;
  }
  -[STUIStatusBarAccessibility _axSetIsHitTesting:](self, "_axSetIsHitTesting:", 0);

  return v8;
}

- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5
{
  return 1;
}

uint64_t __60__STUIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;

  if (AXRequestingClient() != 3)
    return 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ((objc_msgSend(WeakRetained, "_axElementWithinFocused") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    v5 = objc_loadWeakRetained(v2);
    if (v5)
      v4 = __UIAccessibilityGetAssociatedBool() ^ 1;
    else
      v4 = 1;

  }
  return v4;
}

BOOL __53__STUIStatusBarAccessibility__axElementWithinFocused__block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2;
}

- (id)accessibilityElements
{
  void *v3;
  objc_super v5;

  if (AXProcessIsSpringBoard() && AXDeviceHasJindo() && UIAccessibilityIsVoiceOverRunning())
  {
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "_accessibilityStatusBarElements:sorted:", 1, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[STUIStatusBarAccessibility _axElementWithinFocused](self, "_axElementWithinFocused"))
  {
    v5.receiver = self;
    v5.super_class = (Class)STUIStatusBarAccessibility;
    -[STUIStatusBarAccessibility accessibilityElements](&v5, sel_accessibilityElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (CGRect)_frameForActionable:(id)a3 actionInsets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  char isKindOfClass;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  char v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect result;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v38 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v36 = 0;
    objc_opt_class();
    objc_msgSend(v9, "safeValueForKey:", CFSTR("displayItems"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v33;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v33 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * i), "safeValueForKey:", CFSTR("item"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          MEMORY[0x2349217D4](CFSTR("STUIStatusBarNavigationItem"));
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            top = *MEMORY[0x24BDF7718];
            left = *(double *)(MEMORY[0x24BDF7718] + 8);
            bottom = *(double *)(MEMORY[0x24BDF7718] + 16);
            right = *(double *)(MEMORY[0x24BDF7718] + 24);
            goto LABEL_12;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_12:

  }
  v31.receiver = self;
  v31.super_class = (Class)STUIStatusBarAccessibility;
  -[STUIStatusBarAccessibility _frameForActionable:actionInsets:](&v31, sel__frameForActionable_actionInsets_, v9, top, left, bottom, right);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  v27 = v20;
  v28 = v22;
  v29 = v24;
  v30 = v26;
  result.size.height = v30;
  result.size.width = v29;
  result.origin.y = v28;
  result.origin.x = v27;
  return result;
}

@end
