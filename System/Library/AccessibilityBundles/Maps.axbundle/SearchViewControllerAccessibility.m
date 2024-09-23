@implementation SearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SearchViewController"), CFSTR("_contentTableView"), "UITableView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SearchViewController"), CFSTR("_collectionView"), "UICollectionView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchViewController"), CFSTR("setCurrentDataSource:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchViewController"), CFSTR("showDropDown:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SearchViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SearchViewController"), CFSTR("_userProfileButton"), "UIButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SearchViewControllerAccessibility;
  -[SearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[SearchViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_userProfileButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("PROFILE"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (void)_axAnnotateSubviews
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SearchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_contentTableView"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("table.search.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v3);

  -[SearchViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXMapsLocString(CFSTR("collection.search.label"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchViewControllerAccessibility;
  -[SearchViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[SearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("AXCollapseMapsChromeNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SearchViewControllerAccessibility;
  -[SearchViewControllerAccessibility dealloc](&v4, sel_dealloc);
}

- (void)setCurrentDataSource:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SearchViewControllerAccessibility;
  -[SearchViewControllerAccessibility setCurrentDataSource:](&v4, sel_setCurrentDataSource_, a3);
  -[SearchViewControllerAccessibility _axAnnotateSubviews](self, "_axAnnotateSubviews");
}

@end
