@implementation SBDockIconListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDockIconListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListModel"));
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDockIconListView"), CFSTR("SBIconListView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListView"), CFSTR("_model"), "SBIconListModel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("isEmpty"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("visibleIcons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconLocation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("displayedIconViewForIcon:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListViewAccessibility"), CFSTR("_accessibilityEmptyListDropString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFloatingDockViewController"), CFSTR("_libraryPodIconView"), "SBIconView");

}

- (id)_accessibilityEmptyListDropString
{
  return accessibilityLocalizedString(CFSTR("move.to.dock"));
}

- (id)accessibilityLabel
{
  void *v2;
  __CFString *v3;
  void *v4;

  -[SBDockIconListViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("iconLocation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isEqualToString:", CFSTR("SBIconLocationFloatingDockSuggestions")))
    v3 = CFSTR("suggestions");
  else
    v3 = CFSTR("dock");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  return 0;
}

- (int64_t)accessibilityContainerType
{
  return 4;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (double)_accessibilityAllowedGeometryOverlap
{
  return 15.0;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  if (AXDeviceIsPad()
    && (NSClassFromString(CFSTR("SBDockSuggestionsIconListView")), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v11.receiver = self;
    v11.super_class = (Class)SBDockIconListViewAccessibility;
    -[SBDockIconListViewAccessibility _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBDockIconListViewAccessibility _accessibilityBaseHitTest:withEvent:](self, "_accessibilityBaseHitTest:withEvent:", v7, x, y);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;

  return v9;
}

- (id)accessibilityElements
{
  void *v2;
  void *v3;

  -[SBDockIconListViewAccessibility _accessibilitySubviews](self, "_accessibilitySubviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id obj;
  void *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[2];
  _QWORD v28[2];
  void *v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBDockIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("icons"));
  obj = (id)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v5)
          objc_enumerationMutation(obj);
        v17 = 0;
        v18 = &v17;
        v19 = 0x3032000000;
        v20 = __Block_byref_object_copy__1;
        v21 = __Block_byref_object_dispose__1;
        v22 = 0;
        AXPerformSafeBlock();
        v7 = (id)v18[5];
        _Block_object_dispose(&v17, 8);

        objc_msgSend(v16, "axSafelyAddObject:", v7);
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v30, 16);
    }
    while (v4);
  }

  NSClassFromString(CFSTR("SBDockSuggestionsIconListView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SBDockIconListViewAccessibility _accessibilityViewController](self, "_accessibilityViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("floatingDockViewController"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "safeValueForKey:", CFSTR("_libraryPodIconView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "axSafelyAddObject:", v10);

  }
  objc_msgSend(v16, "sortedArrayUsingSelector:", sel_accessibilityCompareGeometry_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = CFSTR("GroupTraits");
  v27[1] = CFSTR("GroupElements");
  v28[0] = &unk_25038F650;
  v28[1] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v29, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void __69__SBDockIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "displayedIconViewForIcon:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

@end
