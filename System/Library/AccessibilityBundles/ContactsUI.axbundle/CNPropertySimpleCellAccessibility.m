@implementation CNPropertySimpleCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNPropertySimpleCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPropertySimpleCell"), CFSTR("_labelLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNPropertySimpleCell"), CFSTR("_valueLabel"), "UILabel");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CNPropertySimpleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_labelLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CNPropertySimpleCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_valueLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
