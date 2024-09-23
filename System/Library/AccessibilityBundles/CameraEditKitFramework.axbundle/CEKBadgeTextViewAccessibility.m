@implementation CEKBadgeTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CEKBadgeTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CEKBadgeTextView"), CFSTR("_text"), "@", 0);
}

- (id)accessibilityLabel
{
  return (id)-[CEKBadgeTextViewAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_text"));
}

@end
