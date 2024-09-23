@implementation PKSpendingSingleSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSpendingSingleSummaryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSingleSummaryViewController"), CFSTR("viewDidLoad"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PKSpendingSingleSummaryViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSingleSummaryViewController"), CFSTR("_configureFooter"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSingleSummaryViewController"), CFSTR("_currentFooter"), "PKDashboardViewControllerFooterView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("_payButtonImage"), "UIImage");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("_payButton"), "PKContinuousButton");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  -[PKSpendingSingleSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[PKSpendingSingleSummaryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setAccessibilityFauxCollectionViewCellsDisabled:", 1);

  -[PKSpendingSingleSummaryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentFooter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("_payButtonImage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    accessibilityLocalizedString(CFSTR("completed.button"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKSpendingSingleSummaryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_currentFooter"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeUIViewForKey:", CFSTR("_payButton"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAccessibilityLabel:", v6);

  }
}

- (void)_configureFooter
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  -[PKSpendingSingleSummaryViewControllerAccessibility _configureFooter](&v3, sel__configureFooter);
  -[PKSpendingSingleSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PKSpendingSingleSummaryViewControllerAccessibility;
  -[PKSpendingSingleSummaryViewControllerAccessibility viewDidLoad](&v3, sel_viewDidLoad);
  -[PKSpendingSingleSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
