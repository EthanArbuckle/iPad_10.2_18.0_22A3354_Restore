@implementation PSFooterHyperlinkViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PSFooterHyperlinkView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PSFooterHyperlinkView"), CFSTR("_textView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PSFooterHyperlinkView"), CFSTR("initWithSpecifier:"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PSFooterHyperlinkViewAccessibility;
  -[PSFooterHyperlinkViewAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[PSFooterHyperlinkViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 1);

}

- (id)isAccessibilityUserDefinedElement
{
  return (id)MEMORY[0x24BDBD1C0];
}

- (PSFooterHyperlinkViewAccessibility)initWithSpecifier:(id)a3
{
  PSFooterHyperlinkViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PSFooterHyperlinkViewAccessibility;
  v3 = -[PSFooterHyperlinkViewAccessibility initWithSpecifier:](&v5, sel_initWithSpecifier_, a3);
  -[PSFooterHyperlinkViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
