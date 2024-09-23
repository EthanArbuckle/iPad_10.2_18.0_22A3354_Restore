@implementation CKNanoConversationListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKNanoConversationListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKNanoConversationListCell"), CFSTR("updateContentsForConversation:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKNanoConversationListCell"), CFSTR("_dateLabel"), "UIDateLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKNanoConversationListCell"), CFSTR("_conversation"), "CKConversation");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("hasDisplayName"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("displayName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("previewText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("hasUnreadMessages"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("recipientCount"), "Q", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNanoConversationListCellAccessibility;
  -[CKNanoConversationListCellAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[CKNanoConversationListCellAccessibility _accessibilityUpdateConversationInfo](self, "_accessibilityUpdateConversationInfo");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (void)updateContentsForConversation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKNanoConversationListCellAccessibility;
  -[CKNanoConversationListCellAccessibility updateContentsForConversation:](&v4, sel_updateContentsForConversation_, a3);
  -[CKNanoConversationListCellAccessibility _accessibilityUpdateConversationInfo](self, "_accessibilityUpdateConversationInfo");
}

- (void)_accessibilityUpdateConversationInfo
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  -[CKNanoConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_conversation"));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "safeValueForKey:", CFSTR("recipientCount"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unsignedIntegerValue");

  if (v4 < 2)
  {
    v7 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("number.of.recipients.in.thread"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v19, "safeBoolForKey:", CFSTR("hasDisplayName")))
    v8 = CFSTR("displayName");
  else
    v8 = CFSTR("name");
  objc_msgSend(v19, "safeValueForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXApplyPhoneContextTokenToString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKNanoConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "safeValueForKey:", CFSTR("previewText"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v19, "safeBoolForKey:", CFSTR("hasUnreadMessages")) & 1) != 0)
  {
    accessibilityLocalizedString(CFSTR("unread.messages"));
    v18 = v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v12;
    v15 = v7;
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = v13;
    v16 = 0;
    v17 = v12;
    v15 = v7;
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[CKNanoConversationListCellAccessibility setAccessibilityLabel:](self, "setAccessibilityLabel:", v14, v15, v16, v17, v18, CFSTR("__AXStringForVariablesSentinel"));

}

@end
