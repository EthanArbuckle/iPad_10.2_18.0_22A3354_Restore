@implementation CNComposeRecipientTextViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNComposeRecipientTextView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNComposeRecipientTextView"), CFSTR("_inactiveTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("_ensureInactiveTextView"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CNComposeRecipientTextView"), CFSTR("CNComposeHeaderView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeHeaderView"), CFSTR("labelView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("textView"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CNComposeRecipientAtom"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNComposeRecipientAtom"), CFSTR("_recipient"), "CNComposeRecipient");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipient"), CFSTR("displayString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CNComposeRecipientTextView"), CFSTR("_atomViews"), "NSMutableArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNComposeRecipientTextView"), CFSTR("addButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  -[CNComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[CNComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  -[CNComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_inactiveTextView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_accessibilitySetTextViewShouldBreakUpParagraphs:", 0);

  -[CNComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (id)automationElements
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  -[CNComposeRecipientTextViewAccessibility automationElements](&v8, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mutableCopy");
  if (v4)
  {
    v5 = (void *)v4;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[CNComposeRecipientTextViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("labelView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "axSafelyAddObject:", v6);

  return v5;
}

- (void)_ensureInactiveTextView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  -[CNComposeRecipientTextViewAccessibility _ensureInactiveTextView](&v3, sel__ensureInactiveTextView);
  -[CNComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (CNComposeRecipientTextViewAccessibility)initWithFrame:(CGRect)a3
{
  CNComposeRecipientTextViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CNComposeRecipientTextViewAccessibility;
  v3 = -[CNComposeRecipientTextViewAccessibility initWithFrame:](&v5, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[CNComposeRecipientTextViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");

  return v3;
}

@end
