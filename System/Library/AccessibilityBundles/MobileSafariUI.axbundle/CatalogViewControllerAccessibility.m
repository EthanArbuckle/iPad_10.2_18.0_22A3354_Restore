@implementation CatalogViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CatalogViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("unifiedField:moveCompletionSelectionByRowOffset:"), "v", "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("completionList: topHitDidBecomeReadyForString:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CatalogViewController"), CFSTR("_completionsViewController"), "CompletionListTableViewController");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CompletionListTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CatalogViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CompletionListTableViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("traitCollection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("usesPopoverStyleForFavorites"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("navigationBar"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("universalSearchFirstTimeExperienceViewController"), "@", 0);
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CatalogViewController"), CFSTR("_keyboardFrame"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("isShowingUniversalSearchFirstTimeExperience"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("isShowingCompletions"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("_setShowingCompletions:popoverDismissalReason:completionHandler:"), "v", "B", "q", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("showUniversalSearchFirstTimeExperienceIfNotShowing"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AbstractCatalogViewController"), CFSTR("startPageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CatalogViewController"), CFSTR("AbstractCatalogViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFStartPageViewController"), CFSTR("_navigationController"), "UINavigationController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BrowserController"), CFSTR("_scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("browserController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CatalogViewController"), CFSTR("setNavigationBar:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CatalogViewControllerAccessibility;
  -[CatalogViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CatalogViewControllerAccessibility _axUpdateAccessibilityElements](self, "_axUpdateAccessibilityElements");
}

- (void)_axUpdateAccessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  char v18;
  _QWORD v19[4];
  id v20;
  id location;
  CGRect v22;

  LOBYTE(location) = 0;
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "horizontalSizeClass");

  if (v5 == 1
    && (-[CatalogViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("usesPopoverStyleForFavorites")) & 1) == 0)
  {
    objc_initWeak(&location, self);
    -[CatalogViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("browserController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeUIViewForKey:", CFSTR("_scrollView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke;
    v19[3] = &unk_25029F030;
    objc_copyWeak(&v20, &location);
    objc_msgSend(v7, "_setAccessibilityElementsHiddenBlock:", v19);

    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = 0;
    objc_opt_class();
    -[CatalogViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_completionsViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[CatalogViewControllerAccessibility safeCGRectForKey:](self, "safeCGRectForKey:", CFSTR("_keyboardFrame"));
    objc_msgSend(v13, "_accessibilitySetVisibleContentInset:", 0.0, 0.0, CGRectGetHeight(v22), 0.0);
    v15[0] = v8;
    v15[1] = 3221225472;
    v15[2] = __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke_2;
    v15[3] = &unk_25029F058;
    objc_copyWeak(&v17, &location);
    v14 = v13;
    v16 = v14;
    objc_msgSend(v10, "_setAccessibilityElementsBlock:", v15);

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
}

BOOL __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  char v8;
  id v10;
  void *v11;
  uint64_t v12;

  if (AXDoesRequestingClientDeserveAutomation())
    return 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v2);
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "horizontalSizeClass");

  if (v6 != 1)
    return 0;
  v7 = objc_loadWeakRetained(v2);
  v8 = objc_msgSend(v7, "safeBoolForKey:", CFSTR("usesPopoverStyleForFavorites"));

  if ((v8 & 1) != 0)
    return 0;
  v10 = objc_loadWeakRetained(v2);
  objc_msgSend(v10, "safeValueForKey:", CFSTR("browserController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "safeIntegerForKey:", CFSTR("favoritesState"));

  return (unint64_t)(v12 - 1) < 2;
}

id __68__CatalogViewControllerAccessibility__axUpdateAccessibilityElements__block_invoke_2(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  int v16;
  void *v17;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "init");
  objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "safeValueForKey:", CFSTR("_startPageViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("_navigationController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v9, "safeValueForKey:", CFSTR("universalSearchFirstTimeExperienceViewController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_loadWeakRetained((id *)(a1 + 40));
  LOBYTE(v9) = objc_msgSend(v13, "safeBoolForKey:", CFSTR("isShowingUniversalSearchFirstTimeExperience"));

  v14 = v12;
  if ((v9 & 1) == 0)
  {
    v15 = objc_loadWeakRetained((id *)(a1 + 40));
    v16 = objc_msgSend(v15, "safeBoolForKey:", CFSTR("isShowingCompletions"));

    v14 = v8;
    if (v16)
    {
      objc_msgSend(v7, "navigationBar", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "axSafelyAddObject:", v17);

      v14 = *(void **)(a1 + 32);
    }
  }
  objc_msgSend(v2, "axSafelyAddObject:", v14);

  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CatalogViewControllerAccessibility;
  -[CatalogViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CatalogViewControllerAccessibility _axUpdateAccessibilityElements](self, "_axUpdateAccessibilityElements");
}

- (void)showUniversalSearchFirstTimeExperienceIfNotShowing
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CatalogViewControllerAccessibility;
  -[CatalogViewControllerAccessibility showUniversalSearchFirstTimeExperienceIfNotShowing](&v3, sel_showUniversalSearchFirstTimeExperienceIfNotShowing);
  -[CatalogViewControllerAccessibility _axUpdateAccessibilityElements](self, "_axUpdateAccessibilityElements");
}

- (void)_setShowingCompletions:(BOOL)a3 popoverDismissalReason:(int64_t)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  char v9;
  uint64_t v10;
  id v11;
  id v12;
  objc_super v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[5];
  BOOL v18;

  v6 = a3;
  v8 = a5;
  v9 = -[CatalogViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isShowingCompletions"));
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke;
  v17[3] = &unk_25029F080;
  v18 = v9 ^ v6;
  v17[4] = self;
  v14[1] = 3221225472;
  v14[2] = __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2;
  v14[3] = &unk_25029F0A8;
  v15 = v8;
  v16 = (id)MEMORY[0x234915E8C](v17);
  v13.receiver = self;
  v13.super_class = (Class)CatalogViewControllerAccessibility;
  v14[0] = v10;
  v11 = v16;
  v12 = v8;
  -[CatalogViewControllerAccessibility _setShowingCompletions:popoverDismissalReason:completionHandler:](&v13, sel__setShowingCompletions_popoverDismissalReason_completionHandler_, v6, a4, v14);

}

uint64_t __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke(uint64_t result)
{
  if (*(_BYTE *)(result + 40))
    return objc_msgSend(*(id *)(result + 32), "_axUpdateAccessibilityElements");
  return result;
}

uint64_t __102__CatalogViewControllerAccessibility__setShowingCompletions_popoverDismissalReason_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)unifiedField:(id)a3 moveCompletionSelectionByRowOffset:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v6 = a3;
  -[CatalogViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_completionsViewController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("tableView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "indexPathForSelectedRow");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)CatalogViewControllerAccessibility;
  -[CatalogViewControllerAccessibility unifiedField:moveCompletionSelectionByRowOffset:](&v10, sel_unifiedField_moveCompletionSelectionByRowOffset_, v6, a4);

  -[CatalogViewControllerAccessibility _accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:](self, "_accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:", v9);
}

- (id)_axAnnounceTimer
{
  JUMPOUT(0x234915CD0);
}

- (void)_axSetAnnounceTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)completionList:(id)a3 topHitDidBecomeReadyForString:(id)a4
{
  void *v5;
  id v6;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CatalogViewControllerAccessibility;
  -[CatalogViewControllerAccessibility completionList:topHitDidBecomeReadyForString:](&v8, sel_completionList_topHitDidBecomeReadyForString_, a3, a4);
  -[CatalogViewControllerAccessibility _axAnnounceTimer](self, "_axAnnounceTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cancel");
  if (!v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE005F0]);
    v5 = (void *)objc_msgSend(v6, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    -[CatalogViewControllerAccessibility _axSetAnnounceTimer:](self, "_axSetAnnounceTimer:", v5);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __83__CatalogViewControllerAccessibility_completionList_topHitDidBecomeReadyForString___block_invoke;
  v7[3] = &unk_25029F0D0;
  v7[4] = self;
  objc_msgSend(v5, "afterDelay:processBlock:", v7, 1.0);

}

uint64_t __83__CatalogViewControllerAccessibility_completionList_topHitDidBecomeReadyForString___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_axSetAnnounceTimer:", 0);
}

- (void)_accessibilityAnnounceNewKeyboardCompletionWithPreviousIndexPath:(id)a3
{
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
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  UIAccessibilityNotifications v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  v23 = a3;
  -[CatalogViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_completionsViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("tableView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "indexPathForSelectedRow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "row") != 0x7FFFFFFFFFFFFFFFLL)
  {
    -[CatalogViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_completionsViewController"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "indexPathForSelectedRow");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v23, "section");
    v22 = v8;
    if (v11 == objc_msgSend(v9, "section"))
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v8, "headerViewForSection:", objc_msgSend(v9, "section"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x24BDFEA60]);
      objc_msgSend(v13, "accessibilityLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)objc_msgSend(v14, "initWithString:", v15);

      objc_msgSend(v12, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBC8]);
    }
    if ((objc_msgSend(v10, "isAccessibilityElement") & 1) != 0)
    {
      objc_msgSend(v10, "accessibilityLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v10, "accessibilityElementCount") < 1)
    {
      v16 = 0;
    }
    else
    {
      v17 = 0;
      v18 = 0;
      do
      {
        objc_msgSend(v10, "accessibilityElementAtIndex:", v17);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        ++v17;
        v18 = v16;
      }
      while (v17 < objc_msgSend(v10, "accessibilityElementCount", v21, CFSTR("__AXStringForVariablesSentinel"), v22));
    }
    v19 = *MEMORY[0x24BDF71E8];
    __UIAXStringForVariables();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityPostNotification(v19, v20);

  }
}

@end
