@implementation PKLabeledValueAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PKLabeledValue");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKLabeledValue"), CFSTR("_label"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PKLabeledValue"), CFSTR("_value"), "NSString");

}

- (id)accessibilityLabel
{
  return (id)-[PKLabeledValueAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_label, _value"));
}

@end
