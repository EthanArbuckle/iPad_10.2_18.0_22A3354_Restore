@implementation HOTitleDescriptionAlertActionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HOTitleDescriptionAlertActionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HOTitleDescriptionAlertActionViewController"), CFSTR("_titleDescriptionView"), "HOTitleDescriptionView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HOTitleDescriptionView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HOTitleDescriptionView"), CFSTR("descriptionLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HOTitleDescriptionAlertActionViewController"), CFSTR("initWithTitle:titleColor:description:descriptionColor:"), "@", "@", "@", "@", "@", 0);

}

- (HOTitleDescriptionAlertActionViewControllerAccessibility)initWithTitle:(id)a3 titleColor:(id)a4 description:(id)a5 descriptionColor:(id)a6
{
  HOTitleDescriptionAlertActionViewControllerAccessibility *v6;
  HOTitleDescriptionAlertActionViewControllerAccessibility *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HOTitleDescriptionAlertActionViewControllerAccessibility;
  v6 = -[HOTitleDescriptionAlertActionViewControllerAccessibility initWithTitle:titleColor:description:descriptionColor:](&v9, sel_initWithTitle_titleColor_description_descriptionColor_, a3, a4, a5, a6);
  v7 = v6;
  if (v6)
    -[HOTitleDescriptionAlertActionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](v6, "_accessibilityLoadAccessibilityInformation");
  return v7;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HOTitleDescriptionAlertActionViewControllerAccessibility;
  -[HOTitleDescriptionAlertActionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[HOTitleDescriptionAlertActionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleDescriptionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  objc_msgSend(v3, "safeValueForKey:", CFSTR("titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("descriptionLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v6, v5, CFSTR("__AXStringForVariablesSentinel"));

  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
}

@end
