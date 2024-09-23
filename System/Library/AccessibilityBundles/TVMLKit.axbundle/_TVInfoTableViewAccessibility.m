@implementation _TVInfoTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVInfoTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoTableView"), CFSTR("headerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoTableView"), CFSTR("infoViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVInfoTableView"), CFSTR("footerView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_TVProductBannerView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVProductBannerView"), CFSTR("stackView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("_TVProductStackView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_TVProductStackView"), CFSTR("titleView"), "@", 0);

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_TVInfoTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("headerView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v4);

  -[_TVInfoTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("infoViews"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v5);

  -[_TVInfoTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("footerView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v6);

  return v3;
}

- (BOOL)shouldGroupAccessibilityChildren
{
  return 1;
}

@end
