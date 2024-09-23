@implementation UISearchResultsTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UISearchResultsTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)accessibilityElementsHidden
{
  return 0;
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  id location[2];
  UISearchResultsTableViewAccessibility *v6;
  id v7;

  v6 = self;
  location[1] = (id)a2;
  if (-[UISearchResultsTableViewAccessibility accessibilityElementCount](self, "accessibilityElementCount"))
  {
    v7 = accessibilityLocalizedString(CFSTR("search.results"));
  }
  else
  {
    v4 = (id)-[UISearchResultsTableViewAccessibility safeValueForKey:](v6, "safeValueForKey:", CFSTR("controller"));
    v3 = (id)objc_msgSend(v4, "safeValueForKey:", CFSTR("_noResultsLabel"));
    location[0] = (id)objc_msgSend(v3, "accessibilityLabel");

    if (objc_msgSend(location[0], "length"))
      v7 = location[0];
    else
      v7 = accessibilityLocalizedString(CFSTR("no.search.results"));
    objc_storeStrong(location, 0);
  }
  return v7;
}

@end
