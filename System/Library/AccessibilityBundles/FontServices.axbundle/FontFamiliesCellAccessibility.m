@implementation FontFamiliesCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("FontFamiliesCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("FontFamiliesCell"), CFSTR("PSTableCell"));
}

- (void)_axAddLabelToButton
{
  void *v2;
  void *v3;
  void *v4;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("download.button"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setAccessibilityLabel:", v4);

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FontFamiliesCellAccessibility;
  -[FontFamiliesCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[FontFamiliesCellAccessibility _axAddLabelToButton](self, "_axAddLabelToButton");
}

- (FontFamiliesCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  FontFamiliesCellAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)FontFamiliesCellAccessibility;
  v5 = -[FontFamiliesCellAccessibility initWithStyle:reuseIdentifier:specifier:](&v7, sel_initWithStyle_reuseIdentifier_specifier_, a3, a4, a5);
  -[FontFamiliesCellAccessibility _axAddLabelToButton](v5, "_axAddLabelToButton");
  return v5;
}

@end
