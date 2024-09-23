@implementation PKDashboardViewControllerFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKDashboardViewControllerFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("leadingTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("leadingDetail"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("trailingTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("trailingDetail"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKDashboardViewControllerFooterView"), CFSTR("_payButton"), "PKContinuousButton");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[PKDashboardViewControllerFooterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("leadingTitle, leadingDetail"));
}

- (id)accessibilityValue
{
  return (id)-[PKDashboardViewControllerFooterViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("trailingTitle, trailingDetail"));
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCE30];
  -[PKDashboardViewControllerFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_payButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axArrayByIgnoringNilElementsWithCount:", 1, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
