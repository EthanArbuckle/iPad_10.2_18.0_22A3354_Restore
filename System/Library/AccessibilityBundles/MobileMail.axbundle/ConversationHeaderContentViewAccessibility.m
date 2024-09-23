@implementation ConversationHeaderContentViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationHeaderContentView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationHeaderContentView"), CFSTR("_createPrimaryViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationHeaderContentView"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationHeaderContentView"), CFSTR("setText:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ConversationHeaderContentViewAccessibility;
  -[ConversationHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[ConversationHeaderContentViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("textLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("subject"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "text");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __AXStringForVariables();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v8, v7, CFSTR("__AXStringForVariablesSentinel"));

  }
  else
  {
    objc_msgSend(v4, "setAccessibilityLabel:", v6);
  }

}

- (void)_createPrimaryViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationHeaderContentViewAccessibility;
  -[ConversationHeaderContentViewAccessibility _createPrimaryViews](&v3, sel__createPrimaryViews);
  -[ConversationHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationHeaderContentViewAccessibility;
  -[ConversationHeaderContentViewAccessibility setText:](&v4, sel_setText_, a3);
  -[ConversationHeaderContentViewAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
