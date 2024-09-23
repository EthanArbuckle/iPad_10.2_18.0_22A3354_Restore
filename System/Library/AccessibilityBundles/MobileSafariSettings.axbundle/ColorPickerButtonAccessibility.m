@implementation ColorPickerButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ColorPickerButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ColorPickerButton"), CFSTR("_color"), "UIColor");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ColorPickerButton"), CFSTR("_isOverflowColorsButton"), "BOOL");

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;

  if (-[ColorPickerButtonAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_isOverflowColorsButton")))
  {
    accessibilityLocalizedString(CFSTR("more.colors.button"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ColorPickerButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_color"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXColorStringForColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

@end
