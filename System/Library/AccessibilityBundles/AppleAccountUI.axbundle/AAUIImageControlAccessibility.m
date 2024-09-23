@implementation AAUIImageControlAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AAUIImageControl");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("AAUIImageControl"), CFSTR("_label"), "AAUILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AAUILabel"), CFSTR("UILabel"));

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("AccountImage"));
}

- (id)accessibilityValue
{
  return (id)-[AAUIImageControlAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_label"));
}

@end
