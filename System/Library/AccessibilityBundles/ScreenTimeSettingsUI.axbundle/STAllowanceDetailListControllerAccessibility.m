@implementation STAllowanceDetailListControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STAllowanceDetailListController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STAllowanceDetailListController"), CFSTR("_showOrHidePickerSpecifierForSpecifier:highlight:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STAllowanceDetailListController"), CFSTR("timeSpecifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("STAllowanceDetailListController"), CFSTR("selectedTimeSpecifier"), "@", 0);

}

- (void)_accessibilityMarkSelectedSpecifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_opt_class();
  -[STAllowanceDetailListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[STAllowanceDetailListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("selectedTimeSpecifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetIsExpandedSTUICell:", v4 == v6);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  -[STAllowanceDetailListControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[STAllowanceDetailListControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("timeSpecifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_accessibilitySetIsExpandableSTUICell:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  -[STAllowanceDetailListControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[STAllowanceDetailListControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_showOrHidePickerSpecifierForSpecifier:(id)a3 highlight:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STAllowanceDetailListControllerAccessibility;
  -[STAllowanceDetailListControllerAccessibility _showOrHidePickerSpecifierForSpecifier:highlight:](&v5, sel__showOrHidePickerSpecifierForSpecifier_highlight_, a3, a4);
  -[STAllowanceDetailListControllerAccessibility _accessibilityMarkSelectedSpecifier](self, "_accessibilityMarkSelectedSpecifier");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
