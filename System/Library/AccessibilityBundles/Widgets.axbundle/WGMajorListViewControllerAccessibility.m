@implementation WGMajorListViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WGMajorListViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WGMajorListViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGMajorListViewController"), CFSTR("footerView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WGWidgetListFooterView"), CFSTR("customizeButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WGMajorListViewControllerAccessibility;
  -[WGMajorListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityIdentifier:", CFSTR("WGMajorListViewControllerView"));

  -[WGMajorListViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("footerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("customizeButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("customize.button.label"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGMajorListViewControllerAccessibility;
  -[WGMajorListViewControllerAccessibility loadView](&v3, sel_loadView);
  -[WGMajorListViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
