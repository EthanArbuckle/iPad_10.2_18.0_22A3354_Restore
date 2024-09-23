@implementation ABPostalNameContactEditingCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ABPostalNameContactEditingCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ABPostalNameContactEditingCell"), CFSTR("_editingTextField"), "UITextField");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ABPostalNameContactEditingCell"), CFSTR("setCardGroupItem:"), "v", "@", 0);

}

- (id)_accessibilityChildren
{
  double v3;
  double v4;
  objc_super v7;

  -[ABPostalNameContactEditingCellAccessibility frame](self, "frame");
  if (v4 < 1.0 || v3 < 1.0)
    return 0;
  v7.receiver = self;
  v7.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  -[ABPostalNameContactEditingCellAccessibility _accessibilityChildren](&v7, sel__accessibilityChildren);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  -[ABPostalNameContactEditingCellAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[ABPostalNameContactEditingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editingTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ABPostalNameContactEditingCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editingTextField"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("placeholder"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

}

- (void)setCardGroupItem:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  -[ABPostalNameContactEditingCellAccessibility setCardGroupItem:](&v4, sel_setCardGroupItem_, a3);
  -[ABPostalNameContactEditingCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (ABPostalNameContactEditingCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ABPostalNameContactEditingCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ABPostalNameContactEditingCellAccessibility;
  v4 = -[ABPostalNameContactEditingCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[ABPostalNameContactEditingCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

@end
