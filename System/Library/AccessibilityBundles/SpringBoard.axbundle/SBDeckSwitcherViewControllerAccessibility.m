@implementation SBDeckSwitcherViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBDeckSwitcherViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeckSwitcherViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeckSwitcherViewController"), CFSTR("SBFluidSwitcherViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("appLayouts"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFluidSwitcherViewController"), CFSTR("_scrollToAppLayout:animated:alignment:completion:"), "v", "@", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeckSwitcherViewController"), CFSTR("_scrollView"), "SBAppSwitcherScrollView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBAppSwitcherScrollView"), CFSTR("UIScrollView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBDeckSwitcherViewController"), CFSTR("_visibleItemContainers"), "NSMutableDictionary");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBDeckSwitcherViewController"), CFSTR("SBFluidSwitcherViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconModel"), CFSTR("expectedIconForDisplayIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBIconController"), CFSTR("model"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBAppLayout"), CFSTR("itemForLayoutRole:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBDisplayItem"), CFSTR("bundleIdentifier"), "@", 0);

}

- (void)dealloc
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  objc_super v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  id v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[SBDeckSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleItemContainers"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    v7 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        v17 = 0;
        __UIAccessibilitySafeClass();
        v12 = v7;
        v13 = 3221225472;
        v14 = __52__SBDeckSwitcherViewControllerAccessibility_dealloc__block_invoke;
        v15 = &unk_250367AD0;
        v16 = (id)objc_claimAutoreleasedReturnValue();
        v9 = v16;
        AXPerformSafeBlock();

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }

  v11.receiver = self;
  v11.super_class = (Class)SBDeckSwitcherViewControllerAccessibility;
  -[SBDeckSwitcherViewControllerAccessibility dealloc](&v11, sel_dealloc);
}

uint64_t __52__SBDeckSwitcherViewControllerAccessibility_dealloc__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setDelegate:", 0);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBDeckSwitcherViewControllerAccessibility;
  -[SBDeckSwitcherViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SBDeckSwitcherViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_accessibilityNonVisibleElements:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  int v14;
  SBAXFakeAppSwitcherAccessibilityElement *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  BOOL v28;
  id v29;
  void *v30;
  id v31;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v40;
  id v41;
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v38 = a3;
  v54 = *MEMORY[0x24BDAC8D0];
  -[SBDeckSwitcherViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("appLayouts"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBDeckSwitcherViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_visibleItemContainers"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("AXFakeElements-%d"), v38);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeckSwitcherViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v43) = 0;
  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("SBIconController")), "safeValueForKey:", CFSTR("sharedInstance"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("model"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  objc_msgSend(v33, "reverseObjectEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v50;
    v10 = v38;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v50 != v9)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
        objc_msgSend(v40, "allKeys");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "containsObject:", v12);

        if (v14)
        {
          if (v38)
            goto LABEL_15;
          goto LABEL_11;
        }
        if ((v10 & 1) != 0)
        {
          v15 = -[SBAXFakeAppSwitcherAccessibilityElement initWithAccessibilityContainer:]([SBAXFakeAppSwitcherAccessibilityElement alloc], "initWithAccessibilityContainer:", self);
          v43 = 0;
          v44 = &v43;
          v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__3;
          v47 = __Block_byref_object_dispose__3;
          v48 = 0;
          AXPerformSafeBlock();
          v16 = (id)v44[5];
          _Block_object_dispose(&v43, 8);

          objc_msgSend(v16, "safeStringForKey:", CFSTR("bundleIdentifier"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 0;
          v44 = &v43;
          v45 = 0x3032000000;
          v46 = __Block_byref_object_copy__3;
          v47 = __Block_byref_object_dispose__3;
          v48 = 0;
          v41 = v36;
          v42 = v17;
          AXPerformSafeBlock();
          v18 = (id)v44[5];

          _Block_object_dispose(&v43, 8);
          objc_msgSend(v18, "accessibilityLabel");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBAXFakeAppSwitcherAccessibilityElement setAccessibilityLabel:](v15, "setAccessibilityLabel:", v19);

          -[SBAXFakeAppSwitcherAccessibilityElement setAppLayout:](v15, "setAppLayout:", v12);
          -[SBAXFakeAppSwitcherAccessibilityElement setDeckSwitcherDelegate:](v15, "setDeckSwitcherDelegate:", self);
          objc_msgSend(v37, "addObject:", v15);

LABEL_11:
          v10 = 1;
          continue;
        }
        v10 = 0;
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v49, v53, 16);
    }
    while (v8);
  }
LABEL_15:

  v20 = objc_msgSend(v37, "count");
  if (v20 == objc_msgSend(v35, "count"))
  {
    v21 = objc_msgSend(v37, "count");
    v22 = v37;
    if (v21 < 1)
    {
LABEL_20:
      v29 = v35;

      v30 = v29;
      goto LABEL_23;
    }
    v23 = 0;
    while (1)
    {
      objc_msgSend(v22, "objectAtIndexedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "appLayout");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "appLayout");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v25 == v27;

      if (!v28)
        break;
      ++v23;
      v22 = v37;
      if (v21 == v23)
        goto LABEL_20;
    }
  }
  v30 = v37;
  if (v37 != v35)
  {
    -[SBDeckSwitcherViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v37, v34);
    v30 = v37;
  }
LABEL_23:
  v31 = v30;

  return v31;
}

void __78__SBDeckSwitcherViewControllerAccessibility__accessibilityNonVisibleElements___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "itemForLayoutRole:", 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __78__SBDeckSwitcherViewControllerAccessibility__accessibilityNonVisibleElements___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "expectedIconForDisplayIdentifier:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityNonVisibleElementsBeforeVisible
{
  return -[SBDeckSwitcherViewControllerAccessibility _accessibilityNonVisibleElements:](self, "_accessibilityNonVisibleElements:", 1);
}

- (id)_accessibilityNonVisibleElementsAfterVisible
{
  return -[SBDeckSwitcherViewControllerAccessibility _accessibilityNonVisibleElements:](self, "_accessibilityNonVisibleElements:", 0);
}

@end
