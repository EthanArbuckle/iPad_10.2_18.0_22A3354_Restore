@implementation CKConversationListCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationListCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_fromLabel"), "CKLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_dateLabel"), "CKDateLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_summaryLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKConversationListCell"), CFSTR("_closeButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCell"), CFSTR("avatarView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCell"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCell"), CFSTR("conversation"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("shouldShowVerifiedCheckmark"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UILabel"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKConversation"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("hasUnreadMessages"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("isMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("chat"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("wantsLabelForDSDS"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("IMCTSubscriptionUtilities"));
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("IMCTSubscriptionUtilities"), CFSTR("sharedInstance"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMCTSubscriptionUtilities"), CFSTR("ctSubscriptionInfo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMCTXPCServiceSubscriptionInfo"), CFSTR("subscriptions"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CTXPCServiceSubscriptionContext"), CFSTR("labelID"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CTXPCServiceSubscriptionContext"), CFSTR("label"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMChat"), CFSTR("lastAddressedSIMID"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("chat"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMChat"), CFSTR("chatSummary"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v27;
  _QWORD v28[4];
  id v29;
  char v30;

  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCellAccessibility _axFromString](self, "_axFromString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKConversationListCellAccessibility _axIsVerified](self, "_axIsVerified"))
  {
    accessibilityLocalizedString(CFSTR("conversation.verified"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }
  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_summaryLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeStringForKey:", CFSTR("text"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "safeBoolForKey:", CFSTR("wantsLabelForDSDS")))
  {
    v27 = v4;
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("chat.lastAddressedSIMID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = 0;
    objc_opt_class();
    -[objc_class safeValueForKeyPath:](NSClassFromString(CFSTR("IMCTSubscriptionUtilities")), "safeValueForKeyPath:", CFSTR("sharedInstance.ctSubscriptionInfo.subscriptions"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = __57__CKConversationListCellAccessibility_accessibilityLabel__block_invoke;
    v28[3] = &unk_2501B21B0;
    v29 = v10;
    v13 = v10;
    objc_msgSend(v12, "ax_firstObjectUsingBlock:", v28);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("sim.type"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "safeStringForKey:", CFSTR("label"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = v27;
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("hasUnreadMessages"));
  v20 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isMuted"));
  objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("chat.chatSummary"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    accessibilityLocalizedString(CFSTR("apple.intelligence.summary"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
      goto LABEL_9;
LABEL_12:
    v23 = 0;
    if (!v19)
      goto LABEL_10;
LABEL_13:
    accessibilityLocalizedString(CFSTR("unread.messages"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_14;
  }
  v22 = 0;
  if (!v20)
    goto LABEL_12;
LABEL_9:
  accessibilityLocalizedString(CFSTR("conversation.muted"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
    goto LABEL_13;
LABEL_10:
  v24 = 0;
LABEL_14:
  __UIAXStringForVariables();
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

uint64_t __57__CKConversationListCellAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "safeStringForKey:", CFSTR("labelID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

- (BOOL)_accessibilityRetainsCustomRotorActionSetting
{
  return 1;
}

- (id)_accessibilityCustomActionGroupIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKConversationListCellAccessibility;
  -[CKConversationListCellAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("avatarView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityElementsHidden:", 1);

  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_closeButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

}

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[CKConversationListCellAccessibility _axFromString](self, "_axFromString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490A6E4]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)updateContentsForConversation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCellAccessibility;
  -[CKConversationListCellAccessibility updateContentsForConversation:](&v4, sel_updateContentsForConversation_, a3);
  -[CKConversationListCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axFromString
{
  void *v2;
  void *v3;
  void *v4;

  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_fromLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAXApplyPhoneContextTokenToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axIsVerified
{
  void *v2;
  char v3;

  -[CKConversationListCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("shouldShowVerifiedCheckmark"));

  return v3;
}

@end
