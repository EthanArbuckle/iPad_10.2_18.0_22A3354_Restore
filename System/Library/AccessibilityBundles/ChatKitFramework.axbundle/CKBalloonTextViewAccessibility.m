@implementation CKBalloonTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKBalloonTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKBalloonTextView"), CFSTR("UITextView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("selectedRange"), "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonTextView"), CFSTR("_selectedRange"), "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UITextView"), CFSTR("accessibilityContainsOneLink"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityValue
{
  return (id)-[CKBalloonTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityGetValue"));
}

- (BOOL)_accessibilityTextViewShouldBreakUpParagraphs
{
  return 0;
}

@end
