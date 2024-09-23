@implementation SearchHeaderCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MobilePhone.SearchHeaderCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MobilePhone.SearchHeaderCell"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("MobilePhone.SearchHeaderCell"), CFSTR("titleLabel"), "UILabel");

}

- (void)_axUpdateTraits
{
  void *v3;
  void *v4;

  objc_opt_class();
  -[SearchHeaderCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityTraits:", *MEMORY[0x24BDF73C0]);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchHeaderCellAccessibility;
  -[SearchHeaderCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[SearchHeaderCellAccessibility _axUpdateTraits](self, "_axUpdateTraits");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SearchHeaderCellAccessibility;
  -[SearchHeaderCellAccessibility layoutSubviews](&v3, sel_layoutSubviews);
  -[SearchHeaderCellAccessibility _axUpdateTraits](self, "_axUpdateTraits");
}

@end
