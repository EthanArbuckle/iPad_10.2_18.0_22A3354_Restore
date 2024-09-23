@implementation SFCapsuleNavigationBarAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFCapsuleNavigationBar");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SFCapsuleCollectionView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleCollectionView"), CFSTR("delegate"), "@", 0);
  if (AXProcessIsSafari())
  {
    objc_msgSend(v3, "validateClass:", CFSTR("CapsuleNavigationBarViewController"));
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CapsuleNavigationBarViewController"), CFSTR("delegate"), "@", 0);
    objc_msgSend(v3, "validateClass:", CFSTR("BrowserRootViewController"));
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserRootViewController"), CFSTR("browserController"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("showTabView"), "v", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("nextTabKeyPressed:"), "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("previousTabKeyPressed:"), "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("navigationBarReaderButtonWasTapped:"), "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFCapsuleNavigationBar"), CFSTR("setTrailingButtons:"), "v", "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_tabController"), "TabController");
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("canReadThis"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("isReaderAvailable"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("currentTabs"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("indexOfSelectedTab"), "Q", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabController"), CFSTR("tabDocumentBeingActivated"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TabDocument"), CFSTR("suggestedTitleForCurrentURL"), "@", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("BrowserController"), CFSTR("isShowingReader"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SFReaderController"), CFSTR("isReaderAvailable"), "B", 0);
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFCapsuleNavigationBar"), CFSTR("_overlayView"), "SFURLFieldOverlayView");
    objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFURLFieldOverlayView"), CFSTR("_isShowing"), "B");
    objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("CollectionViewTab"), CFSTR("titleForNewBookmark"), 1, 1);
  }

}

- (id)_accessibilityBrowserController
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[SFCapsuleNavigationBarAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x23491571C](CFSTR("SFCapsuleCollectionView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23491571C](CFSTR("CapsuleNavigationBarViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x23491571C](CFSTR("BrowserRootViewController"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v4, "safeValueForKey:", CFSTR("browserController"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityCustomActions
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t (**v7)(_QWORD, _QWORD);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  int v12;
  __CFString *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location;
  _QWORD v42[4];
  id v43;

  -[SFCapsuleNavigationBarAccessibility _accessibilityBrowserController](self, "_accessibilityBrowserController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("_tabController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeArrayForKey:", CFSTR("currentTabs"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (int)objc_msgSend(v4, "safeIntForKey:", CFSTR("indexOfSelectedTab"));
    v42[0] = MEMORY[0x24BDAC760];
    v42[1] = 3221225472;
    v42[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke;
    v42[3] = &unk_250296A30;
    v34 = v5;
    v43 = v34;
    v7 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x234915950](v42);
    v8 = v7[2](v7, v6 + 1);
    v9 = v7[2](v7, v6 - 1);
    v10 = v9;
    if (v8 == v6 && v9 == v6)
    {
      v11 = 0;
    }
    else
    {
      v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
      objc_initWeak(&location, v3);
      if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("canReadThis")))
      {
        v12 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isShowingReader"));
        if ((v12 | objc_msgSend(v3, "safeBoolForKey:", CFSTR("isReaderAvailable"))) == 1)
        {
          if (v12)
            v13 = CFSTR("hide.reader.action");
          else
            v13 = CFSTR("show.reader.action");
          accessibilitySafariServicesLocalizedString(v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_alloc(MEMORY[0x24BDF6788]);
          v39[0] = MEMORY[0x24BDAC760];
          v39[1] = 3221225472;
          v39[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_2;
          v39[3] = &unk_250296978;
          objc_copyWeak(&v40, &location);
          v16 = (void *)objc_msgSend(v15, "initWithName:actionHandler:", v14, v39);
          objc_msgSend(v11, "addObject:", v16);

          objc_destroyWeak(&v40);
        }
      }
      if (v8 != v10)
      {
        objc_msgSend(v34, "objectAtIndex:", v10);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_alloc(MEMORY[0x24BDF6788]);
        v18 = (void *)MEMORY[0x24BDD17C8];
        accessibilityMobileSafariLocalizedString(CFSTR("previous.tab"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "safeStringForKey:", CFSTR("titleForNewBookmark"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "stringWithFormat:", v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v37[0] = MEMORY[0x24BDAC760];
        v37[1] = 3221225472;
        v37[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_4;
        v37[3] = &unk_250296978;
        objc_copyWeak(&v38, &location);
        v22 = (void *)objc_msgSend(v17, "initWithName:actionHandler:", v21, v37);

        accessibilityMobileSafariLocalizedString(CFSTR("previous.tab.short"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "_setShortName:", v23);

        objc_msgSend(v11, "addObject:", v22);
        objc_destroyWeak(&v38);

      }
      objc_msgSend(v34, "objectAtIndex:", v8);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc(MEMORY[0x24BDF6788]);
      v26 = (void *)MEMORY[0x24BDD17C8];
      accessibilityMobileSafariLocalizedString(CFSTR("next.tab"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "safeStringForKey:", CFSTR("titleForNewBookmark"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "stringWithFormat:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35[0] = MEMORY[0x24BDAC760];
      v35[1] = 3221225472;
      v35[2] = __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_6;
      v35[3] = &unk_250296978;
      objc_copyWeak(&v36, &location);
      v30 = (void *)objc_msgSend(v25, "initWithName:actionHandler:", v29, v35);

      accessibilityMobileSafariLocalizedString(CFSTR("next.tab.short"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_setShortName:", v31);

      objc_msgSend(v11, "addObject:", v30);
      objc_destroyWeak(&v36);

      objc_destroyWeak(&location);
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3 <= a2)
    v4 = 0;
  else
    v4 = a2;
  if (a2 >= 0)
    return v4;
  else
    return v3 - 1;
}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "navigationBarReaderButtonWasTapped:", 0);

}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_5(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "previousTabKeyPressed:", 0);

}

uint64_t __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_6(uint64_t a1, void *a2)
{
  id v3;
  id v5;

  v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v5);

  return 1;
}

void __65__SFCapsuleNavigationBarAccessibility_accessibilityCustomActions__block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "nextTabKeyPressed:", 0);

}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;

  -[SFCapsuleNavigationBarAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("_overlayView._isShowing"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SFCapsuleNavigationBarAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_overlayView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilitySortedElementsWithin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SFCapsuleNavigationBarAccessibility _accessibilitySortedElementsWithin](self, "_accessibilitySortedElementsWithin");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_accessibilityOnlyComparesByXAxis
{
  return 1;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

- (int64_t)_accessibilitySortPriority
{
  objc_super v4;

  if (AXRequestingClient() == 4)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)SFCapsuleNavigationBarAccessibility;
  return -[SFCapsuleNavigationBarAccessibility _accessibilitySortPriority](&v4, sel__accessibilitySortPriority);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  uint64_t *v12;
  uint64_t v14;
  _QWORD v15[9];
  id v16;

  -[SFCapsuleNavigationBarAccessibility _accessibilityBrowserController](self, "_accessibilityBrowserController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    if (a3 == 4)
    {
      v15[5] = MEMORY[0x24BDAC760];
      v15[6] = 3221225472;
      v15[7] = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke;
      v15[8] = &unk_2502969E8;
      v16 = v4;
      AXPerformSafeBlock();
      v6 = 1;
      v7 = v16;
LABEL_15:

      goto LABEL_16;
    }
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_tabController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeArrayForKey:", CFSTR("currentTabDocuments"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("tabDocumentBeingActivated"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "indexOfObject:", v9);

    if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (a3 == 1)
      {
        if (v10 >= 1)
        {
          v14 = MEMORY[0x24BDAC760];
          v11 = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_3;
          v12 = &v14;
          goto LABEL_12;
        }
      }
      else if (a3 == 2 && v10 + 1 < objc_msgSend(v8, "count"))
      {
        v15[0] = MEMORY[0x24BDAC760];
        v11 = __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_2;
        v12 = v15;
LABEL_12:
        v12[1] = 3221225472;
        v12[2] = (uint64_t)v11;
        v12[3] = (uint64_t)&unk_2502969E8;
        v12[4] = (uint64_t)v5;
        AXPerformSafeBlock();

        v6 = 1;
LABEL_14:

        goto LABEL_15;
      }
    }
    v6 = 0;
    goto LABEL_14;
  }
  v6 = 0;
LABEL_16:

  return v6;
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "showTabView");
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "nextTabKeyPressed:", 0);
}

uint64_t __59__SFCapsuleNavigationBarAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "previousTabKeyPressed:", 0);
}

- (void)setTrailingButtons:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFCapsuleNavigationBarAccessibility;
  -[SFCapsuleNavigationBarAccessibility setTrailingButtons:](&v3, sel_setTrailingButtons_, a3);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
