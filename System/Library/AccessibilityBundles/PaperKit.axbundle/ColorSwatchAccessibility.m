@implementation ColorSwatchAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PaperKit.ColorSwatch");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("PaperKit.ColorSwatch"), CFSTR("selectedColor"), "Optional<UIColor>");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("color.swatch"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[ColorSwatchAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("selectedColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    AXColorStringForColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

@end
