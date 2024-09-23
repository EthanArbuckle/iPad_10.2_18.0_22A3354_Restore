@implementation _UIStatusBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_UIStatusBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  const char *v7;
  const __CFString *v8;
  const char *v9;
  const __CFString *v10;
  const char *v11;
  id v12;
  id *v13;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v13 = location;
  v12 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("_UIStatusBarItem");
  objc_msgSend(location[0], "validateClass:");
  v4 = CFSTR("_UIStatusBarDisplayItem");
  objc_msgSend(location[0], "validateClass:");
  v10 = CFSTR("_UIStatusBarDisplayItemState");
  objc_msgSend(location[0], "validateClass:");
  v8 = CFSTR("_UIStatusBar");
  v11 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("displayItemStates"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("currentAggregatedData"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("styleAttributes"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("visualProvider"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("foregroundView"), v11, 0);
  v9 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_prepareVisualProviderIfNeeded"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("displayItems"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("identifier"), v11, 0);
  v6 = CFSTR("isEnabled");
  v7 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v4, CFSTR("view"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("enabilityStatus"), "q", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarDisplayItemPlacementState"), CFSTR("region"), v11, 0);
  v5 = CFSTR("_UIStatusBarRegion");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:", v8, CFSTR("_regions"), "NSDictionary");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("contentView"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, v6, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v8, CFSTR("_updateDisplayedItemsWithData:styleAttributes:extraAnimations:"), v9, v11, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("currentPlacementState"), v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v10, CFSTR("_updateForUpdatedData:updatedStyleAttributes:updatedEnability:"), v11, v11, v11, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_UIStatusBarStyleAttributes"), CFSTR("styleAttributesWithOverrides:"), v11, 0);
  objc_storeStrong(v13, v12);
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  id obj;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  id v30;
  id v31;
  id v32;
  char v33;
  id v34;
  _QWORD v35[8];
  id v36;
  id v37;
  id v38;
  char v39;
  id v40;
  id v41;
  uint64_t v42;
  int v43;
  int v44;
  uint64_t (*v45)(uint64_t);
  void *v46;
  id v47;
  id location;
  id v49;
  _QWORD __b[8];
  id val;
  objc_super v52;
  SEL v53;
  id v54;
  _BYTE v55[128];
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v54 = self;
  v53 = a2;
  v52.receiver = self;
  v52.super_class = (Class)_UIStatusBarAccessibility;
  -[_UIStatusBarAccessibility _accessibilityLoadAccessibilityInformation](&v52, sel__accessibilityLoadAccessibilityInformation);
  memset(__b, 0, sizeof(__b));
  v18 = (id)objc_msgSend(v54, "safeDictionaryForKey:", CFSTR("_regions"));
  obj = (id)objc_msgSend(v18, "allValues");

  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
  if (v16)
  {
    v13 = *(_QWORD *)__b[2];
    v14 = 0;
    v15 = v16;
    while (1)
    {
      v12 = v14;
      if (*(_QWORD *)__b[2] != v13)
        objc_enumerationMutation(obj);
      val = *(id *)(__b[1] + 8 * v14);
      v49 = (id)objc_msgSend(val, "safeUIViewForKey:", CFSTR("contentView"));
      objc_initWeak(&location, val);
      v11 = v49;
      v42 = MEMORY[0x24BDAC760];
      v43 = -1073741824;
      v44 = 0;
      v45 = __71___UIStatusBarAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
      v46 = &unk_24FF3DA88;
      objc_copyWeak(&v47, &location);
      objc_msgSend(v11, "_setAccessibilityElementsHiddenBlock:", &v42);
      objc_destroyWeak(&v47);
      objc_destroyWeak(&location);
      objc_storeStrong(&v49, 0);
      ++v14;
      if (v12 + 1 >= v15)
      {
        v14 = 0;
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v56, 16);
        if (!v15)
          break;
      }
    }
  }

  v41 = (id)objc_msgSend(v54, "safeValueForKey:", CFSTR("visualProvider"));
  objc_msgSend(v41, "_accessibilityLoadAccessibilityInformation");
  v39 = 0;
  objc_opt_class();
  v10 = (id)objc_msgSend(v54, "safeValueForKey:", CFSTR("items"));
  v38 = (id)__UIAccessibilityCastAsClass();

  v37 = v38;
  objc_storeStrong(&v38, 0);
  v40 = v37;
  memset(v35, 0, sizeof(v35));
  v8 = (id)objc_msgSend(v37, "allValues");
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v35, v55, 16);
  if (v9)
  {
    v5 = *(_QWORD *)v35[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)v35[2] != v5)
        objc_enumerationMutation(v8);
      v36 = *(id *)(v35[1] + 8 * v6);
      v33 = 0;
      v32 = (id)__UIAccessibilitySafeClass();
      if ((v33 & 1) != 0)
        abort();
      v31 = v32;
      objc_storeStrong(&v32, 0);
      v34 = v31;
      if (v31)
      {
        v29 = 0;
        objc_opt_class();
        v3 = (id)objc_msgSend(v54, "safeValueForKey:", CFSTR("displayItemStates"));
        v28 = (id)__UIAccessibilityCastAsClass();

        if ((v29 & 1) != 0)
          abort();
        v27 = v28;
        objc_storeStrong(&v28, 0);
        v30 = v27;
        v26 = (id)objc_msgSend(v36, "safeValueForKey:", CFSTR("identifier"));
        v24 = 0;
        v2 = (id)objc_msgSend(v30, "objectForKey:", v26);
        v23 = (id)__UIAccessibilitySafeClass();

        if ((v24 & 1) != 0)
          abort();
        v22 = v23;
        objc_storeStrong(&v23, 0);
        v25 = v22;
        if (v22)
        {
          v19 = v25;
          v20 = v54;
          v21 = v36;
          AXPerformSafeBlock();
          objc_storeStrong(&v21, 0);
          objc_storeStrong(&v20, 0);
          objc_storeStrong(&v19, 0);
        }
        objc_msgSend(v36, "_accessibilityLoadAccessibilityInformation");
        objc_storeStrong(&v25, 0);
        objc_storeStrong(&v26, 0);
        objc_storeStrong(&v30, 0);
      }
      objc_storeStrong(&v34, 0);
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", v35, v55, 16);
        if (!v7)
          break;
      }
    }
  }

  objc_storeStrong(&v40, 0);
  objc_storeStrong(&v41, 0);
}

- (uint64_t)_axGetIsHitTesting
{
  char v2;

  if (a1)
    v2 = __UIAccessibilityGetAssociatedBool() & 1;
  else
    v2 = 0;
  return v2 & 1;
}

- (void)_axSetIsHitTesting:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat v4;
  CGFloat v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double Width;
  id v13;
  double v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  id obj;
  uint64_t v32;
  id v33;
  id v34;
  objc_super v35;
  id v36;
  CGRect v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  id v45;
  _QWORD v46[8];
  id v47;
  id v48;
  id v49;
  char v50;
  id v51;
  _QWORD __b[8];
  id v53;
  id v54;
  id v55;
  char v56;
  id v57;
  double v58;
  CGRect rect;
  CGPoint point;
  id v61;
  objc_super v62;
  id v63;
  id location[2];
  id v65;
  CGPoint v66;
  double v67;
  uint64_t v68;
  _BYTE v69[128];
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;

  v71 = *MEMORY[0x24BDAC8D0];
  v66 = a3;
  v65 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a4);
  objc_msgSend(v65, "_axSetIsHitTesting:", 1);
  v62.receiver = v65;
  v62.super_class = (Class)_UIStatusBarAccessibility;
  v63 = -[_UIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v62, sel__accessibilityHitTest_withEvent_, location[0], v66.x, v66.y);
  if (!v63)
  {
    v61 = v65;
    v34 = (id)objc_msgSend(v61, "superview");
    objc_msgSend(v34, "convertPoint:toView:", v61, v66.x, v66.y);
    point.x = v4;
    point.y = v5;

    objc_msgSend(v61, "frame");
    rect = v72;
    if (CGRectContainsPoint(v72, point))
    {
      v58 = 1.79769313e308;
      v56 = 0;
      objc_opt_class();
      v33 = (id)objc_msgSend(v65, "safeValueForKey:", CFSTR("items"));
      v55 = (id)__UIAccessibilityCastAsClass();

      v54 = v55;
      objc_storeStrong(&v55, 0);
      v57 = v54;
      memset(__b, 0, sizeof(__b));
      obj = (id)objc_msgSend(v54, "allValues");
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
      if (v32)
      {
        v28 = *(_QWORD *)__b[2];
        v29 = 0;
        v30 = v32;
        while (1)
        {
          v27 = v29;
          if (*(_QWORD *)__b[2] != v28)
            objc_enumerationMutation(obj);
          v53 = *(id *)(__b[1] + 8 * v29);
          NSClassFromString(CFSTR("_UIStatusBarItem"));
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v50 = 0;
            objc_opt_class();
            v26 = (id)objc_msgSend(v53, "safeValueForKey:", CFSTR("displayItems"));
            v49 = (id)__UIAccessibilityCastAsClass();

            if ((v50 & 1) != 0)
              abort();
            v48 = v49;
            objc_storeStrong(&v49, 0);
            v51 = v48;
            memset(v46, 0, sizeof(v46));
            v24 = (id)objc_msgSend(v48, "allValues");
            v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v46, v69, 16);
            if (v25)
            {
              v21 = *(_QWORD *)v46[2];
              v22 = 0;
              v23 = v25;
              while (1)
              {
                v20 = v22;
                if (*(_QWORD *)v46[2] != v21)
                  objc_enumerationMutation(v24);
                v47 = *(id *)(v46[1] + 8 * v22);
                NSClassFromString(CFSTR("_UIStatusBarDisplayItem"));
                if ((objc_opt_isKindOfClass() & 1) != 0
                  && (objc_msgSend(v47, "safeBoolForKey:", CFSTR("isEnabled")) & 1) != 0)
                {
                  v45 = (id)objc_msgSend(v47, "safeUIViewForKey:", CFSTR("view"));
                  v43 = 0.0;
                  v44 = 0.0;
                  v17 = (id)objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
                  v16 = (id)objc_msgSend(v17, "coordinateSpace");
                  objc_msgSend(v45, "center");
                  v41 = v6;
                  v42 = v7;
                  v15 = (id)objc_msgSend(v45, "superview");
                  objc_msgSend(v16, "convertPoint:fromCoordinateSpace:", v41, v42);
                  v43 = v8;
                  v44 = v9;

                  v40 = 0.0;
                  AX_CGPointGetDistanceToPoint();
                  v40 = v10;
                  v39 = 0.0;
                  v19 = (id)objc_msgSend(MEMORY[0x24BE006F0], "server");
                  v18 = (id)objc_msgSend(v19, "medusaApps");
                  v39 = (double)(unint64_t)objc_msgSend(v18, "count");

                  v38 = 0.0;
                  if (v39 <= 1.0)
                  {
                    v14 = 1.79769313e308;
                  }
                  else
                  {
                    objc_msgSend(v45, "frame", v39);
                    v37 = v73;
                    Width = CGRectGetWidth(v73);
                    v68 = 0x4049000000000000;
                    v67 = Width;
                    v14 = fmax(50.0, Width);
                  }
                  v38 = v14;
                  if (v40 <= v14 && v40 < v58)
                  {
                    v35.receiver = v65;
                    v35.super_class = (Class)_UIStatusBarAccessibility;
                    v36 = -[_UIStatusBarAccessibility _accessibilityHitTest:withEvent:](&v35, sel__accessibilityHitTest_withEvent_, location[0], v43, v44);
                    if (v36)
                    {
                      objc_storeStrong(&v63, v36);
                      v58 = v40;
                    }
                    objc_storeStrong(&v36, 0);
                  }
                  objc_storeStrong(&v45, 0);
                }
                ++v22;
                if (v20 + 1 >= v23)
                {
                  v22 = 0;
                  v23 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", v46, v69, 16);
                  if (!v23)
                    break;
                }
              }
            }

            objc_storeStrong(&v51, 0);
          }
          ++v29;
          if (v27 + 1 >= v30)
          {
            v29 = 0;
            v30 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v70, 16);
            if (!v30)
              break;
          }
        }
      }

      objc_storeStrong(&v57, 0);
    }
    objc_storeStrong(&v61, 0);
  }
  objc_msgSend(v65, "_axSetIsHitTesting:", 0);
  v13 = v63;
  objc_storeStrong(&v63, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (BOOL)_accessibilityEnumerateSiblingsWithParent:(id *)a3 options:(id)a4 usingBlock:(id)a5
{
  id v7;
  id location[4];

  location[3] = self;
  location[2] = (id)a2;
  location[1] = a3;
  location[0] = 0;
  objc_storeStrong(location, a4);
  v7 = 0;
  objc_storeStrong(&v7, a5);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
  return 1;
}

- (void)_prepareVisualProviderIfNeeded
{
  id v2;
  objc_super v3;
  uint64_t v4;
  int v5;
  int v6;
  BOOL (*v7)(uint64_t);
  void *v8;
  id v9[3];
  id location[2];
  _UIStatusBarAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  objc_initWeak(location, self);
  v2 = (id)-[_UIStatusBarAccessibility safeUIViewForKey:](v11, "safeUIViewForKey:", CFSTR("foregroundView"));
  v4 = MEMORY[0x24BDAC760];
  v5 = -1073741824;
  v6 = 0;
  v7 = __59___UIStatusBarAccessibility__prepareVisualProviderIfNeeded__block_invoke;
  v8 = &unk_24FF3DA88;
  objc_copyWeak(v9, location);
  objc_msgSend(v2, "_setAccessibilityElementsHiddenBlock:", &v4);

  v3.receiver = v11;
  v3.super_class = (Class)_UIStatusBarAccessibility;
  -[_UIStatusBarAccessibility _prepareVisualProviderIfNeeded](&v3, sel__prepareVisualProviderIfNeeded);
  objc_destroyWeak(v9);
  objc_destroyWeak(location);
}

- (BOOL)_axElementWithinFocused
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id obj;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  BOOL (*v14)(id *, void *);
  void *v15;
  _UIStatusBarAccessibility *v16;
  id location;
  _QWORD __b[8];
  void *v19;
  SEL v20;
  _UIStatusBarAccessibility *v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v21 = self;
  v20 = a2;
  memset(__b, 0, sizeof(__b));
  obj = (id)_UIAccessibilityFocusedElements();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
  if (v9)
  {
    v5 = *(_QWORD *)__b[2];
    v6 = 0;
    v7 = v9;
    while (1)
    {
      v4 = v6;
      if (*(_QWORD *)__b[2] != v5)
        objc_enumerationMutation(obj);
      v19 = *(void **)(__b[1] + 8 * v6);
      v3 = v19;
      v11 = MEMORY[0x24BDAC760];
      v12 = -1073741824;
      v13 = 0;
      v14 = __52___UIStatusBarAccessibility__axElementWithinFocused__block_invoke;
      v15 = &unk_24FF3E2D0;
      v16 = v21;
      location = (id)objc_msgSend(v3, "_accessibilityFindAncestor:startWithSelf:", &v11, 0);
      if (location)
      {
        v22 = 1;
        v10 = 1;
      }
      else
      {
        v10 = 0;
      }
      objc_storeStrong(&location, 0);
      objc_storeStrong((id *)&v16, 0);
      if (v10)
        break;
      ++v6;
      if (v4 + 1 >= v7)
      {
        v6 = 0;
        v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __b, v23, 16);
        if (!v7)
          goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    v10 = 0;
  }

  if (!v10)
    v22 = 0;
  return v22 & 1;
}

- (id)accessibilityElements
{
  id v3;
  id v4;
  char v5;
  SEL v6;
  _UIStatusBarAccessibility *v7;
  id v8;

  v7 = self;
  v6 = a2;
  if (-[_UIStatusBarAccessibility _axElementWithinFocused](self, "_axElementWithinFocused"))
  {
    v5 = 0;
    objc_opt_class();
    v4 = (id)__UIAccessibilityCastAsClass();
    v3 = v4;
    objc_storeStrong(&v4, 0);
    v8 = (id)objc_msgSend(v3, "subviews");

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)_updateDisplayedItemsWithData:(id)a3 styleAttributes:(id)a4 extraAnimations:(id)a5
{
  objc_super v7;
  id v8;
  id v9;
  id location[2];
  _UIStatusBarAccessibility *v11;

  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7.receiver = v11;
  v7.super_class = (Class)_UIStatusBarAccessibility;
  -[_UIStatusBarAccessibility _updateDisplayedItemsWithData:styleAttributes:extraAnimations:](&v7, sel__updateDisplayedItemsWithData_styleAttributes_extraAnimations_, location[0], v9, v8);
  if (-[_UIStatusBarAccessibility _axElementWithinFocused](v11, "_axElementWithinFocused"))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end
