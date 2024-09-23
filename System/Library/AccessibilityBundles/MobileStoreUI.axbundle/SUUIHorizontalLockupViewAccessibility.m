@implementation SUUIHorizontalLockupViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIHorizontalLockupView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_layout"), "SUUIHorizontalLockupLayout");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_viewElementViews"), "NSMapTable");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_lockupElement"), "SUUILockupViewElement");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalLockupLayout"), CFSTR("columns"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalLockupColumn"), CFSTR("childViewElements"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIImageView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUISectionHeaderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUITextBoxView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIStyledImageButton"));
  objc_msgSend(v3, "validateClass:", CFSTR("SUUIToggleButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_previewMediaURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_resolvePreviewStateAfterTransitionForFlipView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_previewState"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_previewProgressIndicator"), "SUUIPreviewProgressIndicator");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIHorizontalLockupView"), CFSTR("_previewFrontView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUILockupViewElement"), CFSTR("isSelectable"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[SUUIHorizontalLockupViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (BOOL)isAdvertisementView:(id)a3
{
  id v3;
  void *v4;
  char v5;
  BOOL v6;

  v3 = a3;
  NSClassFromString(CFSTR("SUUIStyledImageButton"));
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    NSProtocolFromString(CFSTR("SUUIAdvertisingPrivacyControlProtocol"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "conformsToProtocol:", v4);

    if ((v5 & 1) != 0)
      v6 = 1;
  }

  return v6;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v36;
  const __CFString *v37;
  id obj;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  int v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _QWORD v54[4];
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int16 v64;
  _BYTE v65[128];
  void *v66;
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v64 = 0;
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("columns"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  HIBYTE(v64) = 0;
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewElementViews"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v7 = v5;
  v40 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v40)
  {
    v8 = 0;
    v9 = 0;
    obj = v7;
    v39 = *(_QWORD *)v61;
    while (1)
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v61 != v39)
        {
          v11 = v10;
          objc_enumerationMutation(obj);
          v10 = v11;
        }
        v41 = v10;
        v64 = 0;
        __UIAccessibilitySafeClass();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v64
          || (v13 = v12,
              objc_msgSend(v12, "safeValueForKey:", CFSTR("childViewElements")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              HIBYTE(v64)))
        {
          abort();
        }
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        v59 = 0u;
        v42 = v15;
        v46 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
        if (v46)
        {
          v45 = *(_QWORD *)v57;
          do
          {
            v16 = 0;
            do
            {
              if (*(_QWORD *)v57 != v45)
                objc_enumerationMutation(v42);
              objc_msgSend(v43, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * v16));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = v17;
              v48 = v16;
              if (shouldIncludeElement(v17))
              {
                v66 = v17;
                objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
                v18 = objc_claimAutoreleasedReturnValue();
LABEL_23:
                v20 = (id)v18;
                goto LABEL_24;
              }
              NSClassFromString(CFSTR("SUUIAdornedImageView"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(v17, "safeValueForKey:", CFSTR("_reuseView"));
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_1);
                v20 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_24;
              }
              NSClassFromString(CFSTR("SUUISectionHeaderView"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = v17;
                v22 = &__block_literal_global_238;
                goto LABEL_22;
              }
              NSClassFromString(CFSTR("SUUITextBoxView"));
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                objc_msgSend(MEMORY[0x24BDBCEB8], "array");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v54[0] = MEMORY[0x24BDAC760];
                v54[1] = 3221225472;
                v54[2] = __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_3;
                v54[3] = &unk_2502A6BD0;
                v20 = v31;
                v55 = v20;
                objc_msgSend(v17, "accessibilityEnumerateContainerElementsUsingBlock:", v54);

              }
              else
              {
                NSClassFromString(CFSTR("SUUIAttributedStringWrapperView"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v21 = v17;
                  v22 = &__block_literal_global_243;
LABEL_22:
                  objc_msgSend(v21, "_accessibilityFindSubviewDescendantsPassingTest:", v22);
                  v18 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_23;
                }
                NSClassFromString(CFSTR("SUUIHorizontalListView"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  v21 = v17;
                  v22 = &__block_literal_global_246;
                  goto LABEL_22;
                }
                v20 = 0;
              }
LABEL_24:
              v49 = v8;
              v52 = 0u;
              v53 = 0u;
              v50 = 0u;
              v51 = 0u;
              v23 = v20;
              v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v65, 16);
              if (v24)
              {
                v25 = v24;
                v26 = *(_QWORD *)v51;
                do
                {
                  v27 = 0;
                  v28 = v9;
                  do
                  {
                    if (*(_QWORD *)v51 != v26)
                      objc_enumerationMutation(v23);
                    objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v27), "accessibilityLabel", v36, v37);
                    v29 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("•"), CFSTR(","));
                    v30 = (void *)objc_claimAutoreleasedReturnValue();

                    v36 = v30;
                    v37 = CFSTR("__AXStringForVariablesSentinel");
                    __UIAXStringForVariables();
                    v9 = (void *)objc_claimAutoreleasedReturnValue();

                    ++v27;
                    v28 = v9;
                  }
                  while (v25 != v27);
                  v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v50, v65, 16, v30, CFSTR("__AXStringForVariablesSentinel"));
                }
                while (v25);
              }

              v8 = -[SUUIHorizontalLockupViewAccessibility isAdvertisementView:](self, "isAdvertisementView:", v47) | v49;
              v16 = v48 + 1;
            }
            while (v48 + 1 != v46);
            v32 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
            v46 = v32;
          }
          while (v32);
        }

        v10 = v41 + 1;
      }
      while (v41 + 1 != v40);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      if (!v40)
      {
        v7 = obj;

        if ((v8 & 1) != 0)
        {
          accessibilityLocalizedString(CFSTR("Ad"));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v34 = objc_claimAutoreleasedReturnValue();

          v9 = (void *)v34;
          goto LABEL_46;
        }
        goto LABEL_47;
      }
    }
  }
  v9 = 0;
  v33 = v7;
LABEL_46:

LABEL_47:
  return v9;
}

uint64_t __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

uint64_t __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

void __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (shouldIncludeElement(v3))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

uint64_t __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_4(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

uint64_t __59__SUUIHorizontalLockupViewAccessibility_accessibilityLabel__block_invoke_5(uint64_t a1, void *a2)
{
  return shouldIncludeElement(a2);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  objc_super v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  y = a3.y;
  x = a3.x;
  v25 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryHeaderViews](self, "_accessibilitySupplementaryHeaderViews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViews](self, "_accessibilitySupplementaryFooterViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(v8, "arrayByAddingObjectsFromArray:", v9);
    v10 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v10;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    while (2)
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[SUUIHorizontalLockupViewAccessibility convertPoint:toView:](self, "convertPoint:toView:", v16, x, y);
        objc_msgSend(v16, "_accessibilityHitTest:withEvent:", v7);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v17, "isAccessibilityElement") & 1) != 0)
        {

          goto LABEL_13;
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
        continue;
      break;
    }
  }

  v19.receiver = self;
  v19.super_class = (Class)SUUIHorizontalLockupViewAccessibility;
  -[SUUIHorizontalLockupViewAccessibility _accessibilityHitTest:withEvent:](&v19, sel__accessibilityHitTest_withEvent_, v7, x, y);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_13:

  return v17;
}

- (id)_accessibilitySupplementaryHeaderViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  __CFString *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  SUUIHorizontalLockupViewAccessibility *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int16 v46;
  _BYTE v47[128];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeValueForKey:", CFSTR("columns"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  HIBYTE(v46) = 0;
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewElementViews"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v6;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
  if (v32)
  {
    v9 = CFSTR("_previewMediaURL");
    v31 = *(_QWORD *)v43;
    v10 = CFSTR("SUUIImageView");
    v34 = v8;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v43 != v31)
          objc_enumerationMutation(obj);
        v46 = 0;
        __UIAccessibilitySafeClass();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v46
          || (v13 = v12,
              objc_msgSend(v12, "safeValueForKey:", CFSTR("childViewElements")),
              v14 = (void *)objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v15 = (void *)objc_claimAutoreleasedReturnValue(),
              v14,
              v13,
              HIBYTE(v46)))
        {
          abort();
        }
        v33 = v11;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v41 = 0u;
        v37 = v15;
        v16 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v39;
          v36 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v39 != v18)
                objc_enumerationMutation(v37);
              objc_msgSend(v8, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", v9);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              NSClassFromString(&v10->isa);
              if ((objc_opt_isKindOfClass() & 1) != 0 && v21)
              {
                objc_msgSend(v35, "addObject:", v20);
                objc_msgSend(v20, "setIsAccessibilityElement:", 1);
                v22 = v10;
                v23 = v9;
                v24 = (void *)MEMORY[0x24BDD17C8];
                accessibilityLocalizedString(CFSTR("preview.button"));
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                -[SUUIHorizontalLockupViewAccessibility accessibilityLabel](self, "accessibilityLabel");
                v26 = self;
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v24, "stringWithFormat:", v25, v27);
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "setAccessibilityLabel:", v28);

                v9 = v23;
                v10 = v22;

                self = v26;
                v8 = v34;
                v18 = v36;
              }

            }
            v17 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
          }
          while (v17);
        }

        v11 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v48, 16);
    }
    while (v32);
  }

  return v35;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;
  CGRect result;

  v20 = *MEMORY[0x24BDAC8D0];
  -[SUUIHorizontalLockupViewAccessibility bounds](self, "bounds");
  v4 = v3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViews](self, "_accessibilitySupplementaryFooterViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "bounds");
        v4 = v4 - v10;
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  UIAccessibilityFrameForBounds();
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (id)_accessibilitySupplementaryFooterViewsIncludePlayButton:(BOOL)a3 includeStyledImageButton:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  const __CFString *v24;
  SUUIHorizontalLockupViewAccessibility *v25;
  void *v26;
  void *v27;
  void *v28;
  id obj;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL4 v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int16 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v34 = a4;
  v4 = a3;
  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_layout"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safeValueForKey:", CFSTR("columns"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_viewElementViews"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = v10;
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v32)
  {
    v31 = *(_QWORD *)v41;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v41 != v31)
          objc_enumerationMutation(obj);
        v44 = 0;
        __UIAccessibilitySafeClass();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_BYTE)v44
          || (v15 = v14,
              objc_msgSend(v14, "safeValueForKey:", CFSTR("childViewElements")),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              __UIAccessibilitySafeClass(),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v16,
              v15,
              HIBYTE(v44)))
        {
          abort();
        }
        v33 = v13;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v35 = v17;
        v18 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v37 != v20)
                objc_enumerationMutation(v35);
              objc_msgSend(v12, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v22, "isAccessibilityElement")
                && (NSClassFromString(CFSTR("SUUIStyledImageButton")), (objc_opt_isKindOfClass() & 1) != 0))
              {
                if (objc_msgSend(v22, "_accessibilityViewIsVisible"))
                {
                  if (!-[SUUIHorizontalLockupViewAccessibility isAdvertisementView:](self, "isAdvertisementView:", v22)
                    || (v23 = _AXSAutomationEnabled(), v24 = CFSTR("Ad"), !v23))
                  {
                    v24 = CFSTR("StyledImageButton");
                  }
                  objc_msgSend(v22, "setAccessibilityIdentifier:", v24);
                  if (v34)
LABEL_27:
                    objc_msgSend(v6, "axSafelyAddObject:", v22);
                }
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v22, "isAccessibilityElement") & 1) != 0
                  || (NSClassFromString(CFSTR("SUUIOfferView")), (objc_opt_isKindOfClass() & 1) != 0))
                {
                  objc_msgSend(v6, "addObject:", v22);
                }
                else
                {
                  NSClassFromString(CFSTR("SUUIVideoThumbnailView"));
                  if ((objc_opt_isKindOfClass() & 1) != 0
                    && objc_msgSend(v22, "_accessibilityViewIsVisible"))
                  {
                    goto LABEL_27;
                  }
                }
              }
              NSClassFromString(CFSTR("SUUIToggleButton"));
              if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v22, "_accessibilityViewIsVisible"))
                objc_msgSend(v6, "axSafelyAddObject:", v22);
              if (v4)
              {
                NSClassFromString(CFSTR("SUUIPlayButton"));
                if ((objc_opt_isKindOfClass() & 1) != 0)
                {
                  if (objc_msgSend(v22, "_accessibilityViewIsVisible"))
                  {
                    objc_msgSend(v22, "setAccessibilityIdentifier:", CFSTR("PlayButton"));
                    objc_msgSend(v6, "axSafelyAddObject:", v22);
                  }
                }
                else
                {
                  NSClassFromString(CFSTR("SUUIAdornedImageView"));
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    v25 = self;
                    objc_msgSend(v22, "safeValueForKey:", CFSTR("_reuseView"));
                    v26 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "safeValueForKey:", CFSTR("_playButton"));
                    v27 = (void *)objc_claimAutoreleasedReturnValue();

                    if (objc_msgSend(v27, "_accessibilityViewIsVisible"))
                    {
                      objc_msgSend(v27, "setAccessibilityIdentifier:", CFSTR("PlayButtonImage"));
                      objc_msgSend(v6, "axSafelyAddObject:", v27);
                    }

                    self = v25;
                  }
                }
              }

            }
            v19 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
          }
          while (v19);
        }

        v13 = v33 + 1;
      }
      while (v33 + 1 != v32);
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    }
    while (v32);
  }

  if (-[SUUIHorizontalLockupViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_previewState")) == 2)
  {
    -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewProgressIndicator"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
      objc_msgSend(v6, "axSafelyAddObject:", v28);

  }
  return v6;
}

- (id)accessibilityElements
{
  void *v3;

  if (-[SUUIHorizontalLockupViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
  {
    v3 = 0;
  }
  else
  {
    -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 0, 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilityFindPlayButton
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 1, 1);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v7, "accessibilityIdentifier", (_QWORD)v13);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "isEqualToString:", CFSTR("PlayButton")))
        {

LABEL_13:
          v11 = v7;
          goto LABEL_14;
        }
        objc_msgSend(v7, "accessibilityIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "isEqualToString:", CFSTR("PlayButtonImage"));

        if ((v10 & 1) != 0)
          goto LABEL_13;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_14:

  return v11;
}

- (id)_accessibilityFindStyledImageButton
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  char v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 0, 1);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v7, "accessibilityIdentifier", (_QWORD)v12);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("StyledImageButton"));

        if ((v9 & 1) != 0)
        {
          v10 = v7;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)_accessibilityFindToggleButton
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 0, 1);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v6);
        NSClassFromString(CFSTR("SUUIToggleButton"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v8 = v7;
          goto LABEL_11;
        }
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (BOOL)_toggleButtonAction:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  id v11;

  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindToggleButton](self, "_accessibilityFindToggleButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x24BDAC760];
    v11 = v4;
    AXPerformSafeBlock();
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("activated.toggle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v7, v5, v10, 3221225472, __61__SUUIHorizontalLockupViewAccessibility__toggleButtonAction___block_invoke, &unk_2502A6990);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v8);
  }

  return v4 != 0;
}

uint64_t __61__SUUIHorizontalLockupViewAccessibility__toggleButtonAction___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityActivate");
}

- (BOOL)_styledImageButtonAction:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindStyledImageButton](self, "_accessibilityFindStyledImageButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "accessibilityActivate");
  else
    v5 = 0;

  return v5;
}

- (BOOL)_playAction:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "accessibilityActivate");
  else
    v5 = 0;

  return v5;
}

- (id)accessibilityCustomActions
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
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      accessibilityLocalizedString(CFSTR("play.button"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel__playAction_);
    objc_msgSend(v3, "axSafelyAddObject:", v7);

  }
  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindStyledImageButton](self, "_accessibilityFindStyledImageButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
    {
      accessibilityLocalizedString(CFSTR("more.button"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (-[SUUIHorizontalLockupViewAccessibility isAdvertisementView:](self, "isAdvertisementView:", v9))
    {
      accessibilityLocalizedString(CFSTR("about.Ad"));
      v11 = objc_claimAutoreleasedReturnValue();

      v10 = (void *)v11;
    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v10, self, sel__styledImageButtonAction_);
    objc_msgSend(v3, "axSafelyAddObject:", v12);

  }
  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindToggleButton](self, "_accessibilityFindToggleButton");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v15, self, sel__toggleButtonAction_);
    objc_msgSend(v3, "axSafelyAddObject:", v16);

  }
  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;

  if (-[SUUIHorizontalLockupViewAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    && (-[SUUIHorizontalLockupViewAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 0, _AXSAutomationEnabled() != 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)automationElements
{
  return -[SUUIHorizontalLockupViewAccessibility _accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:](self, "_accessibilitySupplementaryFooterViewsIncludePlayButton:includeStyledImageButton:", 1, 1);
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  void *v5;
  id v6;
  unint64_t v7;
  _QWORD v9[5];
  objc_super v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  id v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v10.receiver = self;
  v10.super_class = (Class)SUUIHorizontalLockupViewAccessibility;
  v14 = -[SUUIHorizontalLockupViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lockupElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isSelectable"));

  if (v4)
  {
    -[SUUIHorizontalLockupViewAccessibility _accessibilityFindStyledImageButton](self, "_accessibilityFindStyledImageButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      v12[3] |= *MEMORY[0x24BDF73B0];
  }
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __60__SUUIHorizontalLockupViewAccessibility_accessibilityTraits__block_invoke;
  v9[3] = &unk_2502A6C98;
  v9[4] = &v11;
  v6 = (id)-[SUUIHorizontalLockupViewAccessibility _accessibilityFindSubviewDescendant:](self, "_accessibilityFindSubviewDescendant:", v9);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);
  return v7;
}

uint64_t __60__SUUIHorizontalLockupViewAccessibility_accessibilityTraits__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  uint64_t v6;

  v3 = a2;
  NSClassFromString(CFSTR("SUUIImageView"));
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v3, "accessibilityIdentifier"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("UIPreferencesBlueCheck")),
        v4,
        v5))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) |= *MEMORY[0x24BDF7400];
    v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  int v4;
  void *v5;

  -[SUUIHorizontalLockupViewAccessibility _accessibilityFindPlayButton](self, "_accessibilityFindPlayButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_indeterminate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("indeterminate.playback"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_resolvePreviewStateAfterTransitionForFlipView:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIHorizontalLockupViewAccessibility;
  -[SUUIHorizontalLockupViewAccessibility _resolvePreviewStateAfterTransitionForFlipView:](&v9, sel__resolvePreviewStateAfterTransitionForFlipView_, a3);
  v4 = -[SUUIHorizontalLockupViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_previewState"));
  if (v4)
  {
    if (v4 == 2)
    {
      -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewProgressIndicator"));
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = (void *)currentProgressIndicator;
      currentProgressIndicator = v5;

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], (id)currentProgressIndicator);
    }
  }
  else
  {
    if (objc_msgSend((id)currentProgressIndicator, "accessibilityElementIsFocused"))
    {
      -[SUUIHorizontalLockupViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previewFrontView"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v7);

    }
    v8 = (void *)currentProgressIndicator;
    currentProgressIndicator = 0;

  }
}

@end
