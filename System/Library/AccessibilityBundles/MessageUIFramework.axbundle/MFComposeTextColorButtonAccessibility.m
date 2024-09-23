@implementation MFComposeTextColorButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFComposeTextColorButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFComposeTextColorButton"), CFSTR("color"), "@", 0);
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("text.color.button"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[MFComposeTextColorButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("color"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  AXColorStringForColor();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
