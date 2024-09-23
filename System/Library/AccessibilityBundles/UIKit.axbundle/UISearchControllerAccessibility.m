@implementation UISearchControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  const __CFString *v5;
  const char *v6;
  const char *v7;
  id v8;
  id *v9;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v9 = location;
  v8 = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = CFSTR("UISearchController");
  objc_msgSend(location[0], "validateClass:hasInstanceVariable:withType:");
  v7 = "@";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchController"), CFSTR("searchBar"), 0);
  v3 = CFSTR("UISearchBar");
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("searchTextField"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UISearchTextField"), CFSTR("tokens"), v7, 0);
  v4 = "B";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("showsSearchResultsController"), 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_showResultsForEmptySearch"), v4, 0);
  v6 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_searchBarSearchButtonClicked:"), v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v5, CFSTR("_updateVisibilityOfSearchResultsForSearchBar:"), v6, v7, 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("_contentOrObservableScrollViewForEdge:"), v7, "Q", 0);
  objc_storeStrong(v9, v8);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  int v9;
  BOOL (*v10)(id *);
  void *v11;
  id v12;
  id location;
  id v14;
  objc_super v15;
  SEL v16;
  UISearchControllerAccessibility *v17;

  v17 = self;
  v16 = a2;
  v15.receiver = self;
  v15.super_class = (Class)UISearchControllerAccessibility;
  -[UISearchControllerAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  v14 = (id)-[UISearchControllerAccessibility safeValueForKey:](v17, "safeValueForKey:", CFSTR("_resultsControllerViewContainer"));
  objc_initWeak(&location, v17);
  v5 = v14;
  v7 = MEMORY[0x24BDAC760];
  v8 = -1073741824;
  v9 = 0;
  v10 = __77__UISearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v11 = &unk_24FF3DA88;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v5, "_setIsAccessibilityElementBlock:", &v7);
  v4 = v14;
  v3 = accessibilityLocalizedString(CFSTR("double.tap.dismiss"));
  objc_msgSend(v4, "setAccessibilityLabel:");

  objc_msgSend(v14, "accessibilitySetIdentification:", CFSTR("AXUISearchControllerDimmingView"));
  v6 = (id)-[UISearchControllerAccessibility _contentOrObservableScrollViewForEdge:](v17, "_contentOrObservableScrollViewForEdge:", 1);
  v2 = accessibilityLocalizedString(CFSTR("search.results"));
  objc_msgSend(v6, "setAccessibilityLabel:");

  objc_storeStrong(&v6, 0);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
  objc_storeStrong(&v14, 0);
}

BOOL __77__UISearchControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(id *a1)
{
  id WeakRetained;
  char v3;
  BOOL v4;
  int v5;
  id v7;
  id v8;
  char v9;
  char v10;
  id v11;
  char v12;
  id v13;
  char v14;
  id v15;
  char v16;
  id v17;
  char v18;
  id v19;
  id location;
  id v21[3];

  v21[2] = a1;
  v21[1] = a1;
  v21[0] = objc_loadWeakRetained(a1 + 4);
  v7 = (id)objc_msgSend(v21[0], "searchBar");
  location = (id)objc_msgSend(v7, "searchTextField");

  v8 = (id)objc_msgSend(location, "text");
  v18 = 0;
  v16 = 0;
  v14 = 0;
  v12 = 0;
  v10 = 0;
  v9 = 0;
  if (!objc_msgSend(v8, "length"))
  {
    v19 = (id)objc_msgSend(location, "safeArrayForKey:", CFSTR("tokens"));
    v18 = 1;
    v9 = 0;
    if (!objc_msgSend(v19, "count"))
    {
      v9 = 0;
      if ((objc_msgSend(v21[0], "safeBoolForKey:", CFSTR("_showResultsForEmptySearch")) & 1) == 0)
      {
        v17 = (id)objc_msgSend(v21[0], "searchResultsController");
        v16 = 1;
        v15 = (id)objc_msgSend(v17, "view");
        v14 = 1;
        LOBYTE(v5) = 0;
        if (v15)
        {
          v13 = (id)objc_msgSend(v21[0], "searchResultsController");
          v12 = 1;
          v11 = (id)objc_msgSend(v13, "view");
          v10 = 1;
          v5 = objc_msgSend(v11, "isHidden") ^ 1;
        }
        v9 = v5;
      }
    }
  }
  if ((v10 & 1) != 0)

  if ((v12 & 1) != 0)
  if ((v14 & 1) != 0)

  if ((v16 & 1) != 0)
  if ((v18 & 1) != 0)

  WeakRetained = objc_loadWeakRetained(a1 + 4);
  v3 = objc_msgSend(WeakRetained, "safeBoolForKey:", CFSTR("showsSearchResultsController"));

  v4 = 0;
  if ((v9 & 1) != 0)
    v4 = !(v3 & 1);
  objc_storeStrong(&location, 0);
  objc_storeStrong(v21, 0);
  return v4;
}

- (void)_updateVisibilityOfSearchResultsForSearchBar:(id)a3
{
  objc_super v3;
  id location[2];
  UISearchControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISearchControllerAccessibility;
  -[UISearchControllerAccessibility _updateVisibilityOfSearchResultsForSearchBar:](&v3, sel__updateVisibilityOfSearchResultsForSearchBar_, location[0]);
  -[UISearchControllerAccessibility _accessibilityLoadAccessibilityInformation](v5, "_accessibilityLoadAccessibilityInformation");
  objc_storeStrong(location, 0);
}

- (void)viewDidLoad
{
  objc_super v2;
  SEL v3;
  UISearchControllerAccessibility *v4;

  v4 = self;
  v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)UISearchControllerAccessibility;
  -[UISearchControllerAccessibility viewDidLoad](&v2, sel_viewDidLoad);
  -[UISearchControllerAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
}

- (void)setActive:(BOOL)a3
{
  objc_super v3;
  BOOL v4;
  SEL v5;
  UISearchControllerAccessibility *v6;

  v6 = self;
  v5 = a2;
  v4 = a3;
  v3.receiver = self;
  v3.super_class = (Class)UISearchControllerAccessibility;
  -[UISearchControllerAccessibility setActive:](&v3, sel_setActive_, a3);
  -[UISearchControllerAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
}

- (void)_searchBarSearchButtonClicked:(id)a3
{
  objc_super v3;
  id location[2];
  UISearchControllerAccessibility *v5;

  v5 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3.receiver = v5;
  v3.super_class = (Class)UISearchControllerAccessibility;
  -[UISearchControllerAccessibility _searchBarSearchButtonClicked:](&v3, sel__searchBarSearchButtonClicked_, location[0]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
  objc_storeStrong(location, 0);
}

@end
