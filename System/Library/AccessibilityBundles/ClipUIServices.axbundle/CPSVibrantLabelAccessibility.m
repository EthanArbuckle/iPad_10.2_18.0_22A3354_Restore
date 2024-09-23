@implementation CPSVibrantLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CPSVibrantLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("CPSVibrantLabel"), CFSTR("_label"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[CPSVibrantLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
