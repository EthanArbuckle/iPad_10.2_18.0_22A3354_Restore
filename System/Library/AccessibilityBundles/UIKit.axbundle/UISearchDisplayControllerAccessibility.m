@implementation UISearchDisplayControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchDisplayController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  const __CFString *v3;
  const char *v4;
  id obj;
  id *v6;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  v6 = location;
  obj = 0;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = CFSTR("UITableView");
  v4 = "v";
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", 0);
  objc_msgSend(location[0], "validateClass:hasInstanceMethod:withFullSignature:", v3, CFSTR("_setAccessibilitySearchTableViewHidden"), v4, 0);
  objc_storeStrong(v6, obj);
}

- (void)_setTableViewVisible:(BOOL)a3 inView:(id)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;
  id v10;
  id location;
  BOOL v12;
  SEL v13;
  UISearchDisplayControllerAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  location = 0;
  objc_storeStrong(&location, a4);
  v8 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_dimmingView"));
  v10 = _containerForDimmingView(v8);

  v9.receiver = v14;
  v9.super_class = (Class)UISearchDisplayControllerAccessibility;
  -[UISearchDisplayControllerAccessibility _setTableViewVisible:inView:](&v9, sel__setTableViewVisible_inView_, v12, location);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v12)
      v4 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_setAccessibilitySearchTableViewVisible"));
    else
      v6 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_setAccessibilitySearchTableViewHidden"));
    v5 = (id)objc_msgSend(location, "safeValueForKey:", CFSTR("_setAccessibilitySearchControllerDimmingViewHidden"));
  }
  v7 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_dimmingView"));
  _toggleDimmingView(v7, v10);

  objc_storeStrong(&v10, 0);
  objc_storeStrong(&location, 0);
}

- (id)searchResultsTableView
{
  id v3;
  objc_super v4;
  id v5[3];

  v5[2] = self;
  v5[1] = (id)a2;
  v4.receiver = self;
  v4.super_class = (Class)UISearchDisplayControllerAccessibility;
  v5[0] = -[UISearchDisplayControllerAccessibility searchResultsTableView](&v4, sel_searchResultsTableView);
  objc_msgSend(v5[0], "accessibilitySetIdentification:", CFSTR("SearchResultsTableView"));
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

- (void)setActive:(BOOL)a3 animated:(BOOL)a4
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v9;
  id v10;
  BOOL v11;
  BOOL v12;
  SEL v13;
  UISearchDisplayControllerAccessibility *v14;

  v14 = self;
  v13 = a2;
  v12 = a3;
  v11 = a4;
  v4 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](self, "safeValueForKey:");
  v10 = _containerForDimmingView(v4);

  v9.receiver = v14;
  v9.super_class = (Class)UISearchDisplayControllerAccessibility;
  -[UISearchDisplayControllerAccessibility setActive:animated:](&v9, sel_setActive_animated_, v12, v11);
  v5 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_dimmingView"));
  objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("UISearchControlDimmingView"));

  v7 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_dimmingView"));
  v6 = accessibilityLocalizedString(CFSTR("double.tap.dismiss"));
  objc_msgSend(v7, "setAccessibilityLabel:");

  v8 = (id)-[UISearchDisplayControllerAccessibility safeValueForKey:](v14, "safeValueForKey:", CFSTR("_dimmingView"));
  _toggleDimmingView(v8, v10);

  objc_storeStrong(&v10, 0);
}

@end
