@implementation CheckmarkChoiceViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CheckmarkChoiceView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CheckmarkChoiceView"), CFSTR("_label"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CheckmarkChoiceView"), CFSTR("_checkmark"), "UIImageView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[CheckmarkChoiceViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_label"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CheckmarkChoiceViewAccessibility;
  v3 = -[CheckmarkChoiceViewAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
  objc_opt_class();
  -[CheckmarkChoiceViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_checkmark"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *MEMORY[0x24BDF73B0] | v3;
  objc_msgSend(v5, "image");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BDF7400];
  if (!v7)
    v8 = 0;
  v9 = v6 | v8;

  return v9;
}

@end
