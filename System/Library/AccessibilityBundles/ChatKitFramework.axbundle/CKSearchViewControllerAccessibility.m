@implementation CKSearchViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKSearchViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKSearchViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKSearchViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKSearchViewController"), CFSTR("setSearchText:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSearchViewControllerAccessibility;
  -[CKSearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKSearchViewControllerAccessibility setCollectionViewAXLabelForSearch:](self, "setCollectionViewAXLabelForSearch:", 0);
}

- (void)setCollectionViewAXLabelForSearch:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[CKSearchViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "length"))
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("group.search.collection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v7);

  }
  else
  {
    accessibilityLocalizedString(CFSTR("group.suggestions.collection"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);
  }

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKSearchViewControllerAccessibility;
  -[CKSearchViewControllerAccessibility loadView](&v3, sel_loadView);
  -[CKSearchViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setSearchText:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKSearchViewControllerAccessibility;
  v4 = a3;
  -[CKSearchViewControllerAccessibility setSearchText:](&v5, sel_setSearchText_, v4);
  -[CKSearchViewControllerAccessibility setCollectionViewAXLabelForSearch:](self, "setCollectionViewAXLabelForSearch:", v4, v5.receiver, v5.super_class);

}

@end
