@implementation CNPropertySimpleEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertySimpleEditingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("_textField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("valueView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleCell"), CFSTR("labelView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("updateValueWithPropertyItem:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNPropertySimpleEditingCell"), CFSTR("CNPropertyEditingCell"));

}

- (id)valueView
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  -[CNPropertySimpleEditingCellAccessibility valueView](&v5, sel_valueView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)updateValueWithPropertyItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  -[CNPropertySimpleEditingCellAccessibility updateValueWithPropertyItem:](&v4, sel_updateValueWithPropertyItem_, a3);
  -[CNPropertySimpleEditingCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNPropertySimpleEditingCellAccessibility;
  -[CNPropertySimpleEditingCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CNPropertySimpleEditingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNPropertySimpleEditingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", v5);

}

@end
