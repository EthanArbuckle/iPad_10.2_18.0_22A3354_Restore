@implementation PKSpendingSummaryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKSpendingSummaryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKSpendingSummaryViewController"), CFSTR("_scrollView"), "UIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKSpendingSummaryViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewControllerAccessibility;
  -[PKSpendingSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PKSpendingSummaryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetScrollAcrossPageBoundaries:", 0);
  objc_msgSend(v3, "_accessibilitySetPagingEnabled:", 1);
  objc_msgSend(v3, "_accessibilitySetAllowedPagingOverlap:", 30.0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PKSpendingSummaryViewControllerAccessibility;
  -[PKSpendingSummaryViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[PKSpendingSummaryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
