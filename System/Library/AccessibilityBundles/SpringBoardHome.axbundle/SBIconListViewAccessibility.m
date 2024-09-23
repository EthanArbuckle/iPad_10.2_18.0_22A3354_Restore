@implementation SBIconListViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBIconListView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBDockIconListView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBIconListView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBIconListView"), CFSTR("_model"), "SBIconListModel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("layoutIconsNow"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconViewForIcon:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("isLayoutReversed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("rowAtPoint:"), "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("columnAtPoint:"), "Q", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("indexForCoordinate:forOrientation:"), "Q", "{SBIconCoordinate=qq}", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconImageSize"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("iconAtIndex:"), "@", "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIconListModel"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("icons"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SBIcon"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("isPlaceholder"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("orientation"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("coordinateForIconAtIndex:"), "{SBIconCoordinate=qq}", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconRowsForCurrentOrientation"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIcon"), CFSTR("gridSizeClass"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListView"), CFSTR("iconGridSizeForClass:"), "{SBHIconGridSize=SS}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconListModel"), CFSTR("indexForIcon:"), "Q", "@", 0);

}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  id v12;
  objc_super v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v15 = 0;
  objc_opt_class();
  -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("icons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v11 = (id)-[SBIconListViewAccessibility iconViewForIcon:](self, "iconViewForIcon:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  v12 = (id)-[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layoutIconsNow"));
  v14.receiver = self;
  v14.super_class = (Class)SBIconListViewAccessibility;
  -[SBIconListViewAccessibility automationElements](&v14, sel_automationElements);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t);
  void *v38;
  SBIconListViewAccessibility *v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  SBIconListViewAccessibility *v47;
  uint64_t *v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t);
  void *v54;
  SBIconListViewAccessibility *v55;
  uint64_t *v56;
  double v57;
  double v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t);
  void *v62;
  SBIconListViewAccessibility *v63;
  uint64_t *v64;
  double v65;
  double v66;
  objc_super v67;
  CGRect v68;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  LOBYTE(v29) = 0;
  objc_opt_class();
  -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("icons"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (objc_msgSend(v11, "pointInside:withEvent:", v7, x, y))
  {
    NSClassFromString(CFSTR("SBIconListView"));
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (objc_msgSend(v10, "count"))
      {
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        v13 = MEMORY[0x24BDAC760];
        v51 = MEMORY[0x24BDAC760];
        v52 = 3221225472;
        v53 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2;
        v54 = &unk_250383C88;
        v55 = self;
        v56 = &v29;
        v57 = x;
        v58 = y;
        AXPerformSafeBlock();
        v14 = v30[3];
        _Block_object_dispose(&v29, 8);
        v29 = 0;
        v30 = &v29;
        v31 = 0x2020000000;
        v32 = 0;
        v43 = v13;
        v44 = 3221225472;
        v45 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3;
        v46 = &unk_250383C88;
        v47 = self;
        v48 = &v29;
        v49 = x;
        v50 = y;
        AXPerformSafeBlock();
        v15 = v30[3];
        _Block_object_dispose(&v29, 8);
        if (!-[SBIconListViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isLayoutReversed")))
        {
          v21 = v14;
LABEL_18:
          v29 = 0;
          v30 = &v29;
          v31 = 0x2020000000;
          v32 = 0;
          v35 = MEMORY[0x24BDAC760];
          v36 = 3221225472;
          v37 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_4;
          v38 = &unk_250383C88;
          v39 = self;
          v40 = &v29;
          v41 = v15;
          v42 = v21;
          AXPerformSafeBlock();
          _Block_object_dispose(&v29, 8);
          v29 = 0;
          v30 = &v29;
          v31 = 0x3032000000;
          v32 = __Block_byref_object_copy__5;
          v33 = __Block_byref_object_dispose__5;
          v34 = 0;
          AXPerformSafeBlock();
          v27 = (id)v30[5];
          _Block_object_dispose(&v29, 8);

          v29 = 0;
          v30 = &v29;
          v31 = 0x3032000000;
          v32 = __Block_byref_object_copy__5;
          v33 = __Block_byref_object_dispose__5;
          v34 = 0;
          v25 = v27;
          AXPerformSafeBlock();
          v22 = (id)v30[5];

          _Block_object_dispose(&v29, 8);
LABEL_19:

          goto LABEL_20;
        }
        -[SBIconListViewAccessibility window](self, "window");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "windowScene");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "interfaceOrientation") - 3;

        if (v18 > 1)
        {
          LOBYTE(v29) = 0;
          objc_opt_class();
          -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icons"));
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!(_BYTE)v29)
          {
            v21 = objc_msgSend(v20, "count") + ~v14;
            goto LABEL_17;
          }
        }
        else
        {
          LOBYTE(v29) = 0;
          objc_opt_class();
          -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("icons"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!(_BYTE)v29)
          {
            v15 = objc_msgSend(v20, "count") + ~v15;
            v21 = v14;
LABEL_17:

            goto LABEL_18;
          }
        }
LABEL_21:
        abort();
      }
    }
  }
  v67.receiver = self;
  v67.super_class = (Class)SBIconListViewAccessibility;
  -[SBIconListViewAccessibility _accessibilityHitTest:withEvent:](&v67, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v59 = MEMORY[0x24BDAC760];
  v60 = 3221225472;
  v61 = __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
  v62 = &unk_250383C88;
  v63 = self;
  v64 = &v29;
  v65 = x;
  v66 = y;
  AXPerformSafeBlock();
  v23 = v30[3];
  _Block_object_dispose(&v29, 8);
  if (!v23)
  {
    LOBYTE(v29) = 0;
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(_BYTE)v29)
    {
      v25 = v24;
      objc_msgSend(v24, "bounds");
      objc_msgSend(v25, "convertRect:toView:", v12);
      if (CGRectGetMinY(v68) > y)
      {

        v22 = 0;
      }
      goto LABEL_19;
    }
    goto LABEL_21;
  }
LABEL_20:

  return v22;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "rowAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "columnAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "rowAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_4(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "indexForCoordinate:forOrientation:", *(_QWORD *)(a1 + 48) + 1, *(_QWORD *)(a1 + 56) + 1, objc_msgSend(*(id *)(a1 + 32), "safeIntegerForKey:", CFSTR("_orientation")));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

void __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_244(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_model"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconAtIndex:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __63__SBIconListViewAccessibility__accessibilityHitTest_withEvent___block_invoke_2_245(uint64_t a1)
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

- (id)_accessibilityScannerGroupElements
{
  void *v3;
  unint64_t v4;
  unint64_t i;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  SBIconListViewAccessibility *v23;
  _QWORD v24[5];
  id v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  SBIconListViewAccessibility *v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void *v38;
  int v39;
  _QWORD v40[5];
  id v41;
  unint64_t v42;
  _QWORD v43[5];
  id v44;
  uint64_t *v45;
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = 0;
  objc_opt_class();
  objc_msgSend(v19, "safeValueForKey:", CFSTR("icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[SBIconListViewAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("iconRowsForCurrentOrientation"));
  if (v4 >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v35 = 0;
    v36 = &v35;
    v37 = 0x2020000000;
    v38 = 0;
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke;
    v43[3] = &unk_250383DC0;
    v43[4] = self;
    v44 = v19;
    v45 = &v35;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v43);
    v4 = v36[3];

    _Block_object_dispose(&v35, 8);
  }
  if (v4)
  {
    for (i = 1; i <= v4; i += v12)
    {
      v40[0] = MEMORY[0x24BDAC760];
      v40[1] = 3221225472;
      v40[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_3;
      v40[3] = &unk_250383DE8;
      v40[4] = self;
      v6 = v19;
      v41 = v6;
      v42 = i;
      objc_msgSend(v20, "ax_filteredArrayUsingBlock:", v40);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "sortedArrayUsingComparator:", &__block_literal_global_4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "safeStringForKey:", CFSTR("gridSizeClass"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = 0;
      v36 = &v35;
      v37 = 0x2810000000;
      v38 = &unk_232A885F5;
      v39 = 0;
      v28 = MEMORY[0x24BDAC760];
      v29 = 3221225472;
      v30 = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_6;
      v31 = &unk_250383B98;
      v34 = &v35;
      v32 = self;
      v11 = v10;
      v33 = v11;
      AXPerformSafeBlock();
      v12 = *((unsigned __int16 *)v36 + 17);

      _Block_object_dispose(&v35, 8);
      v24[0] = MEMORY[0x24BDAC760];
      v24[1] = 3221225472;
      v24[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_7;
      v24[3] = &unk_250383E30;
      v24[4] = self;
      v25 = v6;
      v26 = i;
      v27 = i + v12 - 1;
      objc_msgSend(v20, "ax_filteredArrayUsingBlock:", v24);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3221225472;
      v21[2] = __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_9;
      v21[3] = &unk_250383E58;
      v22 = v14;
      v23 = self;
      v15 = v14;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v21);
      v46[0] = CFSTR("GroupTraits");
      v46[1] = CFSTR("GroupElements");
      v47[0] = &unk_25038F680;
      v47[1] = v15;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "axSafelyAddObject:", v16);

    }
  }

  return v18;
}

void __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_232A885F5;
  v7 = *(id *)(a1 + 40);
  v4 = v3;
  AXPerformSafeBlock();
  v5 = v9[5];

  _Block_object_dispose(&v8, 8);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v5 > *(_QWORD *)(v6 + 24))
    *(_QWORD *)(v6 + 24) = v5;

}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_2(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(_QWORD *)(a1 + 48)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = v4;
  return result;
}

BOOL __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _BOOL8 v5;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_232A885F5;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  AXPerformSafeBlock();
  v4 = v10[5];

  _Block_object_dispose(&v9, 8);
  v5 = v4 == *(_QWORD *)(a1 + 48);

  return v5;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(_QWORD *)(a1 + 48)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = v4;
  return result;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "safeStringForKey:", CFSTR("gridSizeClass"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("gridSizeClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = SBAccessibilityGridSizeComparison(v5, v6);
  return v7;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_6(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "iconGridSizeForClass:", *(_QWORD *)(a1 + 40));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = result;
  return result;
}

BOOL __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_7(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v3 = a2;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = &unk_232A885F5;
  v8 = *(id *)(a1 + 40);
  v4 = v3;
  AXPerformSafeBlock();
  v5 = v10[5];

  _Block_object_dispose(&v9, 8);
  v6 = v5 >= *(_QWORD *)(a1 + 48) && v5 <= *(_QWORD *)(a1 + 56);

  return v6;
}

uint64_t __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*(id *)(a1 + 32), "coordinateForIconAtIndex:", objc_msgSend(*(id *)(a1 + 40), "indexForIcon:", *(_QWORD *)(a1 + 48)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  *(_QWORD *)(v3 + 32) = result;
  *(_QWORD *)(v3 + 40) = v4;
  return result;
}

void __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v3 = a2;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = 0;
  v4 = *(void **)(a1 + 32);
  v6 = v3;
  AXPerformSafeBlock();
  v5 = (id)v8[5];

  _Block_object_dispose(&v7, 8);
  objc_msgSend(v4, "axSafelyAddObject:", v5);

}

void __65__SBIconListViewAccessibility__accessibilityScannerGroupElements__block_invoke_10(uint64_t a1)
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

- (BOOL)_accessibilityProvidesScannerGroupElements
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  BOOL v5;

  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axDragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "_axIsIconDragging"))
    v5 = -[SBIconListViewAccessibility _accessibilityIsListViewEmptyForDragAndDrop](self, "_accessibilityIsListViewEmptyForDragAndDrop");
  else
    v5 = 0;

  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  __CFString *v6;

  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axDragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "_axIsIconDragging"))
  {

    goto LABEL_5;
  }
  v5 = -[SBIconListViewAccessibility _accessibilityIsListViewEmptyForDragAndDrop](self, "_accessibilityIsListViewEmptyForDragAndDrop");

  if (!v5)
  {
LABEL_5:
    v6 = &stru_250385500;
    return v6;
  }
  accessibilityLocalizedString(CFSTR("empty.page"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v6;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  AXSBIconControllerSharedInstance();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_axDragManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v4, "_axIsIconDragging"))
  {

    goto LABEL_5;
  }
  v5 = -[SBIconListViewAccessibility _accessibilityIsListViewEmptyForDragAndDrop](self, "_accessibilityIsListViewEmptyForDragAndDrop");

  if (!v5)
  {
LABEL_5:
    v15 = (void *)MEMORY[0x24BDBD1A8];
    return v15;
  }
  AXSBIconControllerSharedInstance();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_axDragManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_axGrabbedIconsLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDD17C8];
  -[SBIconListViewAccessibility _accessibilityEmptyListDropString](self, "_accessibilityEmptyListDropString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDF67B0]);
  objc_msgSend(v12, "bounds");
  UIRectGetCenter();
  v14 = (void *)objc_msgSend(v13, "initWithName:point:inView:", v11, v12);
  v17[0] = v14;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)_accessibilityEmptyListDropString
{
  return accessibilityLocalizedString(CFSTR("move.to.new.page"));
}

- (BOOL)_accessibilityIsListViewEmptyForDragAndDrop
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_opt_class();
  -[SBIconListViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_model"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("icons"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v9 &= objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "safeBoolForKey:", CFSTR("isPlaceholder"));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  else
  {
    LOBYTE(v9) = 1;
  }

  return v9;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (double)_accessibilityMaxFuzzyHitTestDistance
{
  double v2;

  -[SBIconListViewAccessibility safeCGSizeForKey:](self, "safeCGSizeForKey:", CFSTR("iconImageSize"));
  return v2 * 1.5;
}

@end
