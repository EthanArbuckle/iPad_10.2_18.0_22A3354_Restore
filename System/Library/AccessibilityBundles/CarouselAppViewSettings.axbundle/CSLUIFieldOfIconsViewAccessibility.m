@implementation CSLUIFieldOfIconsViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CSLUIFieldOfIconsView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("hexAppGraph: addedNodes: removedNodes: movedNodes:"), "v", "@", "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("contentOffsetToCenterHex:"), "{CGPoint=dd}", "{Hex=ii}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIIconView"), CFSTR("node"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLHexAppNode"), CFSTR("hex"), "{Hex=ii}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("setContentOffset:animated:"), "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("isEditing"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("setLayout: percentComplete: animated: options:"), "v", "@", "d", "B", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("inertialUpdater:willDecelerateWithTarget:"), "{CGPoint=dd}", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("_inertialUpdater"), "CSLUIInertialUpdater");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLUIInertialUpdater"), CFSTR("addDragDelta:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("_didPanDrag"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CSLHexAppGraph"), CFSTR("moveNode: toHex: final:"), "v", "@", "{Hex=ii}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("_iconGraph"), "CSLHexAppGraph");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CSLUIFieldOfIconsView"), CFSTR("_actionDelegate"), "<CSLUIHexIconActionDelegate>");
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CSLUIHexIconActionDelegate"), CFSTR("handleLongPress"), 1, 1);

}

- (BOOL)accessibilityScrollToVisibleWithChild:(id)a3
{
  return -[CSLUIFieldOfIconsViewAccessibility _accessibilityScrollToChild:animated:](self, "_accessibilityScrollToChild:animated:", a3, 0);
}

- (BOOL)_accessibilityScrollToChild:(id)a3 animated:(BOOL)a4
{
  id v4;
  char v5;
  id v7;

  v4 = a3;
  NSSelectorFromString(CFSTR("node"));
  v5 = objc_opt_respondsToSelector();
  if ((v5 & 1) != 0)
  {
    v7 = v4;
    AXPerformSafeBlock();

  }
  return v5 & 1;
}

uint64_t __75__CSLUIFieldOfIconsViewAccessibility__accessibilityScrollToChild_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "contentOffsetToCenterHex:", objc_msgSend(*(id *)(a1 + 32), "_axHexForIconView:", *(_QWORD *)(a1 + 40)));
  return objc_msgSend(*(id *)(a1 + 32), "setContentOffset:animated:", *(unsigned __int8 *)(a1 + 48));
}

- (CGSize)_accessibilityScrollSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[CSLUIFieldOfIconsViewAccessibility bounds](self, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (BOOL)_accessibilityIsScrollAncestor
{
  return 1;
}

- (BOOL)accessibilityScrollUpPage
{
  uint64_t v3;
  double v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  CSLUIFieldOfIconsViewAccessibility *v17;
  uint64_t v18;
  double v19;

  -[CSLUIFieldOfIconsViewAccessibility safeCGPointForKey:](self, "safeCGPointForKey:", CFSTR("_contentOffset"));
  if (v4 == 0.0)
  {
    v13 = MEMORY[0x24BDAC760];
    v14 = 3221225472;
    v15 = __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke;
    v16 = &unk_2501ADDF0;
    v17 = self;
    v18 = v3;
    v19 = v4;
  }
  else
  {
    v6 = 0;
    v7 = &v6;
    v8 = 0x3010000000;
    v10 = 0;
    v11 = 0;
    v9 = "";
    AXPerformSafeBlock();
    v12 = *((_OWORD *)v7 + 2);
    _Block_object_dispose(&v6, 8);
  }
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
  return 1;
}

uint64_t __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke(uint64_t a1)
{
  void *v1;
  double v2;
  double v3;

  v1 = *(void **)(a1 + 32);
  v2 = *(double *)(a1 + 40);
  objc_msgSend(v1, "_accessibilityScrollSize");
  return objc_msgSend(v1, "setContentOffset:animated:", 0, v2, -v3);
}

uint64_t __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke_2(uint64_t a1)
{
  void *v2;
  double v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_accessibilityScrollSize");
  result = objc_msgSend(v2, "inertialUpdater:willDecelerateWithTarget:", 0, 0.0, -v3);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v5 + 32) = v6;
  *(_QWORD *)(v5 + 40) = v7;
  return result;
}

void __63__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollUpPage__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_inertialUpdater"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addDragDelta:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (BOOL)accessibilityScrollDownPage
{
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3010000000;
  v7 = 0;
  v8 = 0;
  v6 = "";
  AXPerformSafeBlock();
  v9 = *((_OWORD *)v4 + 2);
  _Block_object_dispose(&v3, 8);
  AXPerformSafeBlock();
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)*MEMORY[0x24BDFEF20]);
  return 1;
}

uint64_t __65__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollDownPage__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "_accessibilityScrollSize");
  result = objc_msgSend(v2, "inertialUpdater:willDecelerateWithTarget:", 0, 0.0);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 40) = v6;
  return result;
}

void __65__CSLUIFieldOfIconsViewAccessibility_accessibilityScrollDownPage__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_inertialUpdater"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addDragDelta:", *(double *)(a1 + 40), *(double *)(a1 + 48));

}

- (Hex)_axHexForIconView:(id)a3
{
  void *v3;
  Hex *v4;

  objc_msgSend(a3, "safeValueForKey:", CFSTR("node"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (Hex *)objc_msgSend(v3, "safeIvarForKey:", CFSTR("_hex"));

  if (v4)
    return *v4;
  else
    return (Hex)0;
}

- (void)_axUpdateIconElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  id obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[5];
  void *v36;
  _QWORD v37[2];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  if ((-[CSLUIFieldOfIconsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_didPanDrag")) & 1) == 0)
  {
    -[CSLUIFieldOfIconsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconViewDict"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = MEMORY[0x24BDAC760];
    v35[1] = 3221225472;
    v35[2] = __59__CSLUIFieldOfIconsViewAccessibility__axUpdateIconElements__block_invoke;
    v35[3] = &unk_2501ADE40;
    v35[4] = self;
    objc_msgSend(v4, "sortedArrayUsingComparator:", v35);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    obj = v5;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v32;
      v9 = CFSTR("isEditing");
      v10 = 0x24BDF6000uLL;
      do
      {
        v11 = 0;
        v29 = sel__accessibilityMoveIconRight_;
        do
        {
          if (*(_QWORD *)v32 != v8)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v11);
          v13 = -[CSLUIFieldOfIconsViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", v9, v29);
          v14 = objc_alloc(*(Class *)(v10 + 1928));
          if (v13)
          {
            accessibilityLocalizedString(CFSTR("app.move.left"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithName:target:selector:", v15, self, sel__accessibilityMoveIconLeft_);

            objc_msgSend(v16, "_accessibilitySetAssignedValue:forKey:", v12, CFSTR("kAXOwningElement"));
            v17 = objc_alloc(*(Class *)(v10 + 1928));
            accessibilityLocalizedString(CFSTR("app.move.right"));
            v18 = v7;
            v19 = v8;
            v20 = v10;
            v21 = v9;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = (void *)objc_msgSend(v17, "initWithName:target:selector:", v22, self, v29);

            objc_msgSend(v23, "_accessibilitySetAssignedValue:forKey:", v12, CFSTR("kAXOwningElement"));
            v37[0] = v16;
            v37[1] = v23;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v37, 2);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setAccessibilityCustomActions:", v24);

            v9 = v21;
            v10 = v20;
            v8 = v19;
            v7 = v18;

          }
          else
          {
            accessibilityLocalizedString(CFSTR("apps.arrange"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = (void *)objc_msgSend(v14, "initWithName:target:selector:", v25, self, sel__accessibilityStartJiggleMode_);

            v36 = v16;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "setAccessibilityCustomActions:", v26);

            objc_msgSend(v16, "_accessibilitySetAssignedValue:forKey:", v12, CFSTR("kAXOwningElement"));
          }

          ++v11;
        }
        while (v7 != v11);
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v38, 16);
      }
      while (v7);
    }

    v27 = (void *)objc_msgSend(obj, "mutableCopy");
    -[CSLUIFieldOfIconsViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v27, CFSTR("AccessibilityElementsKey"));
    -[CSLUIFieldOfIconsViewAccessibility _accessibilityFirstElementForFocus](self, "_accessibilityFirstElementForFocus");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_setAccessibilityServesAsFirstElement:", 1);

    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  }
}

uint64_t __59__CSLUIFieldOfIconsViewAccessibility__axUpdateIconElements__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  unint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  BOOL v12;
  uint64_t v13;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = objc_msgSend(v5, "_axHexForIconView:", a2);
  v8 = v7;
  v9 = HIDWORD(v7);
  v10 = objc_msgSend(*(id *)(a1 + 32), "_axHexForIconView:", v6);

  if ((float)((float)SHIDWORD(v10) + -0.00000011921) > (float)(int)v9)
    return -1;
  if ((float)((float)SHIDWORD(v10) + 0.00000011921) < (float)(int)v9)
    return 1;
  if ((float)((float)(int)v10 + -0.00000011921) <= (float)v8)
  {
    if ((float)((float)(int)v10 + 0.00000011921) >= (float)v8)
      return 0;
    v12 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsRTL") == 0;
    v13 = -1;
  }
  else
  {
    v12 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityIsRTL") == 0;
    v13 = 1;
  }
  if (v12)
    return -v13;
  else
    return v13;
}

- (id)accessibilityElements
{
  void *v3;

  -[CSLUIFieldOfIconsViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityElementsKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[CSLUIFieldOfIconsViewAccessibility _axUpdateIconElements](self, "_axUpdateIconElements");
    -[CSLUIFieldOfIconsViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityElementsKey"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)hexAppGraph:(id)a3 addedNodes:(id)a4 removedNodes:(id)a5 movedNodes:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  -[CSLUIFieldOfIconsViewAccessibility hexAppGraph:addedNodes:removedNodes:movedNodes:](&v7, sel_hexAppGraph_addedNodes_removedNodes_movedNodes_, a3, a4, a5, a6);
  -[CSLUIFieldOfIconsViewAccessibility _axUpdateIconElements](self, "_axUpdateIconElements");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  -[CSLUIFieldOfIconsViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CSLUIFieldOfIconsViewAccessibility _axUpdateIconElements](self, "_axUpdateIconElements");
}

- (id)_accessibilityHitTestSubviews
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_opt_class();
  -[CSLUIFieldOfIconsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("subviews"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "subviews");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v3, "addObjectsFromArray:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityIdentifier
{
  return CFSTR("CSLLauncherView");
}

- (void)_accessibilityStartJiggleMode:(id)a3
{
  id v3;
  id v4;

  -[CSLUIFieldOfIconsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_actionDelegate"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("handleLongPress"));

}

- (void)_accessibilityMoveElement:(id)a3 left:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;

  v4 = a4;
  v6 = a3;
  -[CSLUIFieldOfIconsViewAccessibility accessibilityElements](self, "accessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfObject:", v6);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = v8;
    if (v8 && v4)
    {
      v10 = v8 - 1;
    }
    else
    {
      if (v4 || v8 >= objc_msgSend(v7, "count") - 1)
        goto LABEL_10;
      v10 = v9 + 1;
    }
    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v6, "safeValueForKey:", CFSTR("node"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CSLUIFieldOfIconsViewAccessibility _axHexForIconView:](self, "_axHexForIconView:", v12);

      v16 = v11;
      v13 = v11;
      AXPerformSafeBlock();
      -[CSLUIFieldOfIconsViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconGraph"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (id)objc_msgSend(v14, "safeValueForKey:", CFSTR("commitMove"));

    }
  }
LABEL_10:
  -[CSLUIFieldOfIconsViewAccessibility accessibilityScrollToVisibleWithChild:](self, "accessibilityScrollToVisibleWithChild:", v6);
  -[CSLUIFieldOfIconsViewAccessibility _accessibilityAnnounceUpdatedPositionForElement:](self, "_accessibilityAnnounceUpdatedPositionForElement:", v6);

}

void __69__CSLUIFieldOfIconsViewAccessibility__accessibilityMoveElement_left___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_iconGraph"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "moveNode:toHex:final:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), 1);

}

- (void)_accessibilityMoveIconLeft:(id)a3
{
  id v4;

  objc_msgSend(a3, "_accessibilityValueForKey:", CFSTR("kAXOwningElement"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSLUIFieldOfIconsViewAccessibility _accessibilityMoveElement:left:](self, "_accessibilityMoveElement:left:", v4, 1);

}

- (void)_accessibilityMoveIconRight:(id)a3
{
  id v4;

  objc_msgSend(a3, "_accessibilityValueForKey:", CFSTR("kAXOwningElement"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CSLUIFieldOfIconsViewAccessibility _accessibilityMoveElement:left:](self, "_accessibilityMoveElement:left:", v4, 0);
  -[CSLUIFieldOfIconsViewAccessibility accessibilityScrollToVisibleWithChild:](self, "accessibilityScrollToVisibleWithChild:", v4);
  -[CSLUIFieldOfIconsViewAccessibility _accessibilityAnnounceUpdatedPositionForElement:](self, "_accessibilityAnnounceUpdatedPositionForElement:", v4);

}

- (void)_accessibilityAnnounceUpdatedPositionForElement:(id)a3
{
  id v4;
  char *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  UIAccessibilityNotifications v15;
  void *v16;
  id v17;

  v4 = a3;
  -[CSLUIFieldOfIconsViewAccessibility accessibilityElements](self, "accessibilityElements");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (char *)objc_msgSend(v17, "indexOfObject:", v4);

  if ((unint64_t)v5 < objc_msgSend(v17, "count") - 1)
  {
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("app.moved.before"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v5 + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_6;
    goto LABEL_5;
  }
  v10 = 0;
  if (v5)
  {
LABEL_5:
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("app.moved.after"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndex:", v5 - 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v12, v14);
    v5 = (char *)objc_claimAutoreleasedReturnValue();

  }
LABEL_6:
  if (objc_msgSend(v5, "length") || objc_msgSend(v10, "length"))
  {
    v15 = *MEMORY[0x24BDF71E8];
    __UIAXStringForVariables();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v15, v16);

  }
}

- (void)setLayout:(id)a3 percentComplete:(double)a4 animated:(BOOL)a5 options:(unint64_t)a6
{
  UIAccessibilityNotifications v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSLUIFieldOfIconsViewAccessibility;
  -[CSLUIFieldOfIconsViewAccessibility setLayout:percentComplete:animated:options:](&v10, sel_setLayout_percentComplete_animated_options_, a3, a5, a6);
  -[CSLUIFieldOfIconsViewAccessibility _axUpdateIconElements](self, "_axUpdateIconElements");
  if (a4 == 1.0)
  {
    v8 = *MEMORY[0x24BDF72C8];
    -[CSLUIFieldOfIconsViewAccessibility _accessibilityFirstElementForFocus](self, "_accessibilityFirstElementForFocus");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v8, v9);

  }
}

@end
