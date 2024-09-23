@implementation MainWindowRootViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MainWindowRootViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("MainWindowControlHeaderView"));
  objc_msgSend(v3, "validateClass:", CFSTR("RootNavigationController"));
  objc_msgSend(v3, "validateClass:", CFSTR("MainWindowContentContainerViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_headerView"), "MainWindowControlHeaderView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_searchBar"), "UISearchBar");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_searchButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_splitViewController"), "UISplitViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_rootNavigationController"), "RootNavigationController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_secondaryContainerVC"), "MainWindowContentContainerViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowContentContainerViewController"), CFSTR("_splitViewController"), "UISplitViewController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MainWindowRootViewController"), CFSTR("_isSearching"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowRootViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateProtocol:hasOptionalInstanceMethod:", CFSTR("UISplitViewControllerDelegate"), CFSTR("splitViewController:willChangeToDisplayMode:"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("MainWindowRootViewController"), CFSTR("UISplitViewControllerDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowRootViewController"), CFSTR("setupSearchControlForTraitCollection:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowRootViewController"), CFSTR("searchBegan"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MainWindowRootViewController"), CFSTR("searchEnded"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RootNavigationController"), CFSTR("viewSwitcher"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowRootViewControllerAccessibility;
  -[MainWindowRootViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MainWindowRootViewControllerAccessibility _accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:](self, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowRootViewControllerAccessibility;
  -[MainWindowRootViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[MainWindowRootViewControllerAccessibility _accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:](self, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  -[MainWindowRootViewControllerAccessibility _accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:](self, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", a4, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)setupSearchControlForTraitCollection:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MainWindowRootViewControllerAccessibility;
  -[MainWindowRootViewControllerAccessibility setupSearchControlForTraitCollection:](&v4, sel_setupSearchControlForTraitCollection_, a3);
  -[MainWindowRootViewControllerAccessibility _accessibilityRefreshSearchElementIfNeeded](self, "_accessibilityRefreshSearchElementIfNeeded");
}

- (void)searchBegan
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowRootViewControllerAccessibility;
  -[MainWindowRootViewControllerAccessibility searchBegan](&v3, sel_searchBegan);
  -[MainWindowRootViewControllerAccessibility _accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:](self, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)searchEnded
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MainWindowRootViewControllerAccessibility;
  -[MainWindowRootViewControllerAccessibility searchEnded](&v3, sel_searchEnded);
  -[MainWindowRootViewControllerAccessibility _accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:](self, "_accessibilitySetAccessibilityElementsForDisplayMode:searchDisplayMode:", 0x7FFFFFFFFFFFFFFFLL, 0x7FFFFFFFFFFFFFFFLL);
}

- (void)_accessibilitySetAccessibilityElementsForDisplayMode:(int64_t)a3 searchDisplayMode:(int64_t)a4
{
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
  void *v23;

  v7 = (void *)objc_opt_new();
  -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_headerView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v7, "addObject:", v9);
    objc_opt_class();
    -[MainWindowRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_splitViewController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[MainWindowRootViewControllerAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isSearching")))
    {
      objc_opt_class();
      -[MainWindowRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_secondaryContainerVC"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safeValueForKey:", CFSTR("_splitViewController"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4 == 0x7FFFFFFFFFFFFFFFLL)
        a4 = objc_msgSend(v15, "displayMode");
      objc_msgSend(v15, "viewControllerForColumn:", 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16 && a4 == 3)
      {
        -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_searchBar"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "removeAllObjects");
        objc_msgSend(v7, "axSafelyAddObject:", v17);
        objc_msgSend(v12, "viewControllerForColumn:", 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "safeUIViewForKey:", CFSTR("view"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v7, "axSafelyAddObject:", v19);
        objc_msgSend(v8, "setAccessibilityElements:", v7);

LABEL_18:
        goto LABEL_19;
      }

    }
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
      a3 = objc_msgSend(v12, "displayMode");
    objc_msgSend(v12, "safeUIViewForKey:", CFSTR("view"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (a3 == 2)
    {
      objc_msgSend(v12, "viewControllerForColumn:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "safeUIViewForKey:", CFSTR("view"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "axSafelyAddObject:", v21);
      -[MainWindowRootViewControllerAccessibility _accessibilityAddSwitcherSearchToAccessibilityViews:](self, "_accessibilityAddSwitcherSearchToAccessibilityViews:", v7);
      objc_msgSend(v12, "viewControllerForColumn:", 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "safeUIViewForKey:", CFSTR("view"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "axSafelyAddObject:", v23);
    }
    else
    {
      if (a3 == 1)
        -[MainWindowRootViewControllerAccessibility _accessibilityAddSwitcherSearchToAccessibilityViews:](self, "_accessibilityAddSwitcherSearchToAccessibilityViews:", v7);
      objc_msgSend(v7, "axSafelyAddObject:", v15);
    }
    objc_msgSend(v8, "setAccessibilityElements:", v7);
    goto LABEL_18;
  }
  objc_msgSend(v8, "setAccessibilityElements:", 0);
LABEL_19:

}

- (void)_accessibilityAddSwitcherSearchToAccessibilityViews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[MainWindowRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rootNavigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("viewSwitcher"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v7, "addObject:", v5);
  -[MainWindowRootViewControllerAccessibility _accessibilityAddSearchToAccessibilityViews:](self, "_accessibilityAddSearchToAccessibilityViews:", v7);

}

- (BOOL)_accessibilityAddSearchToAccessibilityViews:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[MainWindowRootViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_rootNavigationController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("viewSwitcher"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = objc_msgSend(v4, "indexOfObject:", v6);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = 0;
    }
    else
    {
      v9 = v7;
      -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_searchBar"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_searchButton"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "indexOfObject:", v10);
      v13 = objc_msgSend(v4, "indexOfObject:", v11);
      -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "superview");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v10;
      v17 = v11;
      if ((v15 == v14
         || (objc_msgSend(v11, "superview"),
             v18 = (void *)objc_claimAutoreleasedReturnValue(),
             v18,
             v16 = v11,
             v17 = v10,
             v18 == v14))
        && (v19 = v16, objc_msgSend(v4, "removeObject:", v17), v19))
      {
        if (objc_msgSend(v4, "indexOfObject:", v19) == 0x7FFFFFFFFFFFFFFFLL)
        {
          v20 = v9 + 1;
          if (v20 == objc_msgSend(v4, "count"))
            objc_msgSend(v4, "addObject:", v19);
          else
            objc_msgSend(v4, "insertObject:atIndex:", v19, v20);
          v8 = 1;
        }
        else
        {
          v8 = 0;
        }
      }
      else
      {
        objc_msgSend(v4, "removeObject:", v10);
        objc_msgSend(v4, "removeObject:", v11);
        v19 = 0;
        v8 = v12 != 0x7FFFFFFFFFFFFFFFLL || v13 != 0x7FFFFFFFFFFFFFFFLL;
      }

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_accessibilityRefreshSearchElementIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[MainWindowRootViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("view"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[MainWindowRootViewControllerAccessibility _accessibilityAddSearchToAccessibilityViews:](self, "_accessibilityAddSearchToAccessibilityViews:", v4))
  {
    objc_msgSend(v5, "setAccessibilityElements:", v4);
  }

}

@end
