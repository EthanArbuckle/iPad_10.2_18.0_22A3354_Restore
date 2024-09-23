@implementation SUUISearchFieldTableViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUISearchFieldTableView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUISearchFieldTableView"), CFSTR("trendingSearchesVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUISearchFieldTableView"), CFSTR("_pageView"), "SUUITrendingSearchPageView");

}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if ((-[SUUISearchFieldTableViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("trendingSearchesVisible")) & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)SUUISearchFieldTableViewAccessibility;
  return -[SUUISearchFieldTableViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  if (-[SUUISearchFieldTableViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("trendingSearchesVisible")))
  {
    v3 = (void *)MEMORY[0x24BDBCE30];
    -[SUUISearchFieldTableViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_pageView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "axArrayByIgnoringNilElementsWithCount:", 1, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return v5;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SUUISearchFieldTableViewAccessibility;
    -[SUUISearchFieldTableViewAccessibility accessibilityElements](&v7, sel_accessibilityElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end
