@implementation AKFontSizePickerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKFontSizePicker");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKFontSizePicker"), CFSTR("slider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AKFontSizePicker"), CFSTR("_value"), "d");

}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AKFontSizePickerAccessibility;
  v3 = -[AKFontSizePickerAccessibility isAccessibilityElement](&v6, sel_isAccessibilityElement);
  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4 || v3;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKFontSizePickerAccessibility;
  -[AKFontSizePickerAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    accessibilityLocalizedString(CFSTR("text.size"));
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AKFontSizePickerAccessibility;
  -[AKFontSizePickerAccessibility accessibilityValue](&v11, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("stroke.fontsize.value"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[AKFontSizePickerAccessibility safeCGFloatForKey:](self, "safeCGFloatForKey:", CFSTR("_value"));
    objc_msgSend(v7, "numberWithDouble:");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v9;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AKFontSizePickerAccessibility;
  v3 = -[AKFontSizePickerAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x24BDF73A0];
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (void)accessibilityDecrement
{
  id v2;

  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (void)accessibilityIncrement
{
  id v2;

  -[AKFontSizePickerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("slider"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

@end
