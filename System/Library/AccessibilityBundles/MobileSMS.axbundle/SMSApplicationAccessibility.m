@implementation SMSApplicationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SMSApplication");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("senderName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("chat"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMChat"), CFSTR("lastIncomingMessage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMMessage"), CFSTR("isTypingMessage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_accessibilitySoftwareKeyboardActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagesController"), CFSTR("isShowingChatController"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIApplication"), CFSTR("_accessibilityMainWindow"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKActionMenuWindow"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("CKActionMenuWindow"), CFSTR("sharedInstance"), "@", 0);

}

- (BOOL)_accessibilitySoftwareKeyboardActive
{
  void *v3;
  void *v4;
  BOOL v5;
  objc_super v7;
  char v8;

  v8 = 0;
  objc_opt_class();
  objc_msgSend((id)MEMORY[0x23491550C](CFSTR("CKActionMenuWindow")), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && !objc_msgSend(v4, "isHidden"))
  {
    v5 = 0;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SMSApplicationAccessibility;
    v5 = -[SMSApplicationAccessibility _accessibilitySoftwareKeyboardActive](&v7, sel__accessibilitySoftwareKeyboardActive);
  }

  return v5;
}

- (id)_accessibilityMainWindow
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SMSApplicationAccessibility;
  -[SMSApplicationAccessibility _accessibilityMainWindow](&v7, sel__accessibilityMainWindow);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6FF8], "keyWindow");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (!v2
    || (void *)v3 != v2
    && objc_msgSend(v2, "accessibilityViewIsModal")
    && objc_msgSend(v4, "accessibilityViewIsModal"))
  {
    v5 = v4;

    v2 = v5;
  }

  return v2;
}

@end
