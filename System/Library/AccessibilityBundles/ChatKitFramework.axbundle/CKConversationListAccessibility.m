@implementation CKConversationListAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationList");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationList"), CFSTR("deleteConversations:"), "v", "@", 0);
}

- (void)deleteConversations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CKConversationListAccessibility;
  v3 = a3;
  -[CKConversationListAccessibility deleteConversations:](&v10, sel_deleteConversations_, v3);
  v4 = (void *)MEMORY[0x24BDFEA60];
  v5 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("deleted.conversations.count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v3, "count");

  objc_msgSend(v5, "localizedStringWithFormat:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axAttributedStringWithString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setAttribute:forKey:", &unk_2501CE2A0, *MEMORY[0x24BDFEAD8]);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v9);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

}

@end
