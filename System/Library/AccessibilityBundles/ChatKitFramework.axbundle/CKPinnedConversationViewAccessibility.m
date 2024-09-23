@implementation CKPinnedConversationViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKPinnedConversationView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPinnedConversationView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("CKPinnedConversationSummaryBubble"));
  objc_msgSend(v3, "validateClass:", CFSTR("CKConversation"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("hasUnreadMessages"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversation"), CFSTR("isMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPinnedConversationView"), CFSTR("activityView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPinnedConversationActivityView"), CFSTR("activityItemViews"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKPinnedConversationSummaryBubble"), CFSTR("summaryLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  -[CKPinnedConversationViewAccessibility _axFromString](self, "_axFromString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKPinnedConversationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("hasUnreadMessages"));
  if (objc_msgSend(v4, "safeBoolForKey:", CFSTR("isMuted")))
  {
    accessibilityLocalizedString(CFSTR("conversation.muted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  if (v5)
  {
    -[CKPinnedConversationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("activityView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("activityItemViews"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "ax_filteredArrayUsingBlock:", &__block_literal_global_5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firstObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "safeValueForKey:", CFSTR("summaryLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    accessibilityLocalizedString(CFSTR("unread.messages"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  accessibilityLocalizedString(CFSTR("pinned.label"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __59__CKPinnedConversationViewAccessibility_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("CKPinnedConversationSummaryBubble"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
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

- (id)accessibilityUserInputLabels
{
  void *v2;
  void *v3;

  -[CKPinnedConversationViewAccessibility _axFromString](self, "_axFromString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x23490A6E4]();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axFromString
{
  void *v2;
  void *v3;
  void *v4;

  -[CKPinnedConversationViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  UIAXApplyPhoneContextTokenToString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
