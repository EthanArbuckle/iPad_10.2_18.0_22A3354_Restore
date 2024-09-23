@implementation NavbarConversationTitleAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ChatKit.NavbarConversationTitle");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.NavbarConversationTitle"), CFSTR("titleLabel"), "CKLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ChatKit.NavbarConversationTitle"), CFSTR("title"), "String");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)NavbarConversationTitleAccessibility;
  -[NavbarConversationTitleAccessibility _accessibilityLoadAccessibilityInformation](&v4, sel__accessibilityLoadAccessibilityInformation);
  -[NavbarConversationTitleAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[NavbarConversationTitleAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v4, "titleIconImageType");
  if (v5 == 1)
  {
    accessibilityLocalizedString(CFSTR("conversation.verified"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[NavbarConversationTitleAccessibility safeSwiftStringForKey:](self, "safeSwiftStringForKey:", CFSTR("title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)accessibilityHint
{
  void *v3;

  -[NavbarConversationTitleAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[NavbarConversationTitleAccessibility accessibilityUserDefinedHint](self, "accessibilityUserDefinedHint");
  else
    accessibilityLocalizedString(CFSTR("multi.person.header.hint"));
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
