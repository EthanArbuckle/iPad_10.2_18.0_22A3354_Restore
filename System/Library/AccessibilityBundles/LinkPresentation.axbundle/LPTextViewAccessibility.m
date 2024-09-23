@implementation LPTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("LPTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("LPTextView"), CFSTR("_textView"), "UILabel");
}

- (BOOL)isAccessibilityElement
{
  void *v2;
  BOOL v3;

  -[LPTextViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length") != 0;

  return v3;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[LPTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
