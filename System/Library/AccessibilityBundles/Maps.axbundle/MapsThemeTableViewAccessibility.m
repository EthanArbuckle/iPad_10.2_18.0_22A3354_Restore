@implementation MapsThemeTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MapsThemeTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CardView"));
  objc_msgSend(v3, "validateClass:", CFSTR("SearchViewController"));

}

- (id)_axSearchResultsViewController
{
  void *v2;
  void *v3;
  id v4;

  -[MapsThemeTableViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349135AC](CFSTR("CardView"), a2));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  MEMORY[0x2349135AC](CFSTR("SearchViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (UIEdgeInsets)_accessibilityVisibleContentInset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  UIEdgeInsets result;

  v16.receiver = self;
  v16.super_class = (Class)MapsThemeTableViewAccessibility;
  -[MapsThemeTableViewAccessibility _accessibilityVisibleContentInset](&v16, sel__accessibilityVisibleContentInset);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[MapsThemeTableViewAccessibility _axSearchResultsViewController](self, "_axSearchResultsViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0.0;
  if (!v11)
    v12 = v4;
  v13 = v6;
  v14 = v8;
  v15 = v10;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

@end
