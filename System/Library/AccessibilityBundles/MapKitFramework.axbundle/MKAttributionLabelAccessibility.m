@implementation MKAttributionLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKAttributionLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKAttributionLabel"), CFSTR("_innerText"), "NSAttributedString");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[MKAttributionLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_innerText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKAttributionLabelAccessibility;
  return *MEMORY[0x24BDF73D8] | -[MKAttributionLabelAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end
