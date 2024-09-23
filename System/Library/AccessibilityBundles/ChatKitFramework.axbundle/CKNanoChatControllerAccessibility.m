@implementation CKNanoChatControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoChatController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKNanoChatController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoChatController"), CFSTR("setConversation:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKNanoChatControllerAccessibility;
  -[CKNanoChatControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  accessibilityLocalizedString(CFSTR("contact.info"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rightBarButtonItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v2);

}

- (void)setConversation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNanoChatControllerAccessibility;
  -[CKNanoChatControllerAccessibility setConversation:](&v4, sel_setConversation_, a3);
  -[CKNanoChatControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end
