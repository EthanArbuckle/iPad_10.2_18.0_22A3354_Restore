@implementation SFAccountDetailViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAccountDetailViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAccountDetailViewController"), CFSTR("_passwordCell"), "SFEditableTableViewCell");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SFAccountDetailViewController"), CFSTR("_cellForIdentifier:indexPath:"), "@", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SFAccountDetailViewControllerAccessibility;
  -[SFAccountDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  accessibilitySafariServicesLocalizedString(CFSTR("password.cell.hint"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_passwordCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityHint:", v3);

}

- (id)_cellForIdentifier:(id)a3 indexPath:(id)a4
{
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFAccountDetailViewControllerAccessibility;
  -[SFAccountDetailViewControllerAccessibility _cellForIdentifier:indexPath:](&v7, sel__cellForIdentifier_indexPath_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFAccountDetailViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v5;
}

@end
