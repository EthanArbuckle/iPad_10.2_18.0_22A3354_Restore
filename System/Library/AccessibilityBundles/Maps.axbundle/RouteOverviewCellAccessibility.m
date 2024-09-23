@implementation RouteOverviewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("RouteOverviewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_primaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteOverviewCell"), CFSTR("detailsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_secondaryLabel"), "MapsThemeMultiPartLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_tertiaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_elevationGraphView"), "DirectionsElevationGraphView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_advisoriesView"), "RouteAdvisoriesView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_goButton"), "MapsProgressButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_bookButton"), "BackgroundColorButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_stepsButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_artworkList"), "TransitArtworkListView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_detailsButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_tertiaryLabelVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_artworkListVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_elevationGraphViewVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_advisoriesViewVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("RouteOverviewCell"), CFSTR("_detailsButtonVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteOverviewCell"), CFSTR("artworkList"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteOverviewCell"), CFSTR("tertiaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TransitArtworkListView"), CFSTR("artworkData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteOverviewCell"), CFSTR("detailsButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RouteAdvisoryView"), CFSTR("advisoryDetailPressed"), "v", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("RouteOverviewCellDelegate"), CFSTR("didTapDetailsButtonForRouteOverviewCell:"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_new();
  -[RouteOverviewCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_goButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_detailsButtonVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("detailsButton"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axSafelyAddObject:", v5);

  }
  return v3;
}

- (id)accessibilityHint
{
  return AXMapsLocString(CFSTR("ROUTE_LIST_HINT"));
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)accessibilityActivate
{
  void *v2;
  char v3;
  id v5;

  -[RouteOverviewCellAccessibility valueForKey:](self, "valueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();
  if ((v3 & 1) != 0)
  {
    v5 = v2;
    AXPerformSafeBlock();

  }
  return v3 & 1;
}

uint64_t __55__RouteOverviewCellAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "didTapDetailsButtonForRouteOverviewCell:", *(_QWORD *)(a1 + 40));
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v21;
  id obj;
  _QWORD v23[4];
  id v24;
  id location;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility _axAdvisoryViews](self, "_axAdvisoryViews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v4;
  v5 = v4;
  if (v4)
  {
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v4;
    v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v9, "safeValueForKey:", CFSTR("actionHandler"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v10 == 0;

          if (!v11)
          {
            LOBYTE(location) = 0;
            objc_opt_class();
            objc_msgSend(v9, "safeValueForKey:", CFSTR("_advisoryLabel"));
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v13 = (void *)objc_claimAutoreleasedReturnValue();

            if ((_BYTE)location)
              abort();
            v14 = (void *)MEMORY[0x24BDD17C8];
            AXMapsLocString(CFSTR("ROUTE_ADVISORY_BUTTON_DETAILS"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "text");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_initWeak(&location, v9);
            v18 = objc_alloc(MEMORY[0x24BDF6788]);
            v23[0] = MEMORY[0x24BDAC760];
            v23[1] = 3221225472;
            v23[2] = __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke;
            v23[3] = &unk_250258EA8;
            objc_copyWeak(&v24, &location);
            v19 = (void *)objc_msgSend(v18, "initWithName:actionHandler:", v17, v23);
            objc_msgSend(v3, "addObject:", v19);

            objc_destroyWeak(&v24);
            objc_destroyWeak(&location);

          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v6);
    }

    v5 = v21;
  }

  return v3;
}

uint64_t __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __60__RouteOverviewCellAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "advisoryDetailPressed");

}

- (void)accessibilityElementDidBecomeFocused
{
  void *v2;
  id v3;
  void *v4;

  -[RouteOverviewCellAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_7, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

uint64_t __70__RouteOverviewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  MEMORY[0x2349135AC](CFSTR("UIDropShadowView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __70__RouteOverviewCellAccessibility_accessibilityElementDidBecomeFocused__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axExpandCard");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RouteOverviewCellAccessibility;
  -[RouteOverviewCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[RouteOverviewCellAccessibility _axAnnotateLabels](self, "_axAnnotateLabels");
}

- (id)_axTextForElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  const __CFString *v32;
  const __CFString *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t);
  void *v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t);
  void *v48;
  RouteOverviewCellAccessibility *v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  char v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsStringReplacingMiddleDots();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsStringReplacingMiddleDots();
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_tertiaryLabelVisible"), v28, CFSTR("__AXStringForVariablesSentinel")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tertiaryLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXMapsStringReplacingMiddleDots();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_artworkListVisible"), v29, v32))
  {
    v57 = 0;
    objc_opt_class();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__2;
    v55 = __Block_byref_object_dispose__2;
    v56 = 0;
    v12 = MEMORY[0x24BDAC760];
    v45 = MEMORY[0x24BDAC760];
    v46 = 3221225472;
    v47 = __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke;
    v48 = &unk_250259130;
    v49 = self;
    v50 = &v51;
    AXPerformSafeBlock();
    v13 = (id)v52[5];
    _Block_object_dispose(&v51, 8);

    __UIAccessibilityCastAsClass();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v57)
      abort();
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__2;
    v55 = __Block_byref_object_dispose__2;
    v56 = 0;
    v39 = v12;
    v40 = 3221225472;
    v41 = __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke_2;
    v42 = &unk_250259130;
    v44 = &v51;
    v43 = v14;
    AXPerformSafeBlock();
    v15 = (id)v52[5];

    _Block_object_dispose(&v51, 8);
    v30 = v15;
    v33 = CFSTR("__AXStringForVariablesSentinel");
    __AXStringForVariables();
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v16;
  }
  -[RouteOverviewCellAccessibility _axAdvisoryViews](self, "_axAdvisoryViews", v30, v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v17;
  v18 = v17;
  if (v17)
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v58, 16);
    if (v20)
    {
      v21 = *(_QWORD *)v36;
      do
      {
        v22 = 0;
        v23 = v8;
        do
        {
          if (*(_QWORD *)v36 != v21)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * v22);
          LOBYTE(v51) = 0;
          objc_opt_class();
          objc_msgSend(v24, "safeValueForKey:", CFSTR("_advisoryLabel"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          if ((_BYTE)v51)
            abort();
          objc_msgSend(v26, "text");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          __AXStringForVariables();
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          ++v22;
          v23 = v8;
        }
        while (v20 != v22);
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v58, 16, v31, CFSTR("__AXStringForVariablesSentinel"));
      }
      while (v20);
    }

    v18 = v34;
  }

  return v8;
}

void __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_artworkList"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __51__RouteOverviewCellAccessibility__axTextForElement__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE3CBA0], "_accessibilityTransitArtworkTextForDataList:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axAnnotateLabels
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = (void *)MEMORY[0x24BDBCE30];
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tertiaryLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artworkList"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 4, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "setAccessibilityElementsHidden:", 1);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

}

- (id)_axAdvisoryViews
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (!-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_advisoriesViewVisible")))return 0;
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_advisoriesView"));
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
    return 0;
  v4 = (void *)v3;
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("advisoryStackView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v6, "arrangedSubviews");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v8;

  return v10;
}

- (id)tertiaryLabel
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteOverviewCellAccessibility;
  -[RouteOverviewCellAccessibility tertiaryLabel](&v5, sel_tertiaryLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility _axAnnotateLabels](self, "_axAnnotateLabels");
  return v3;
}

- (id)artworkList
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)RouteOverviewCellAccessibility;
  -[RouteOverviewCellAccessibility artworkList](&v5, sel_artworkList);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility _axAnnotateLabels](self, "_axAnnotateLabels");
  return v3;
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
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  void *v25;

  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("PrimaryLabel"));

  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("SecondaryLabel"));

  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_tertiaryLabelVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tertiaryLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("TertiaryLabel"));

  }
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_artworkListVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artworkList"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityIdentifier:", CFSTR("ArtworkList"));

  }
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_elevationGraphViewVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_elevationGraphView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityIdentifier:", CFSTR("ElevationGraph"));

  }
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_advisoriesViewVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_advisoriesView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("AdvisoriesView"));

  }
  if (-[RouteOverviewCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_buttonVisibility")) == 1)
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_goButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("GoButton"));

  }
  if (-[RouteOverviewCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_buttonVisibility")) == 2)
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", CFSTR("BookButton"));

  }
  if (-[RouteOverviewCellAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_buttonVisibility")) == 3)
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stepsButton"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAccessibilityIdentifier:", CFSTR("StepsButton"));

  }
  if (-[RouteOverviewCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_detailsButtonVisible")))
  {
    -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailsButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAccessibilityIdentifier:", CFSTR("DetailsButton"));

  }
  v25 = (void *)MEMORY[0x24BDBCE30];
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_primaryLabel"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryLabel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_tertiaryLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artworkList"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_detailsButton"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_elevationGraphView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_advisoriesView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_goButton"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_bookButton"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[RouteOverviewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_stepsButton"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "axArrayByIgnoringNilElementsWithCount:", 10, v24, v13, v14, v15, v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

@end
