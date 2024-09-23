@implementation CKMessagesControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKMessagesController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKMessagesController"), CFSTR("UISplitViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessagesController"), CFSTR("chatController"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagesController"), CFSTR("setChatController:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKMessagesController"), CFSTR("conversationListController"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKConversationListCollectionViewController"), CFSTR("collectionView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKMessagesController"), CFSTR("conversationListController"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListCollectionViewController"), CFSTR("UIViewController"));

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKMessagesControllerAccessibility;
  -[CKMessagesControllerAccessibility _accessibilityLoadAccessibilityInformation](&v7, sel__accessibilityLoadAccessibilityInformation);
  -[CKMessagesControllerAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("AXChatMainWindow"));

  -[CKMessagesControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversationListController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("navigationItem"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || _AXSFullKeyboardAccessEnabled()
    || _AXSCommandAndControlEnabled())
  {
    objc_msgSend(v6, "setHidesSearchBarWhenScrolling:", 0);
  }
  -[CKMessagesControllerAccessibility _accessibilityReloadElementRelations:](self, "_accessibilityReloadElementRelations:", 1);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKMessagesControllerAccessibility;
  -[CKMessagesControllerAccessibility loadView](&v3, sel_loadView);
  -[CKMessagesControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)setChatController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;
  char v8;

  v4 = a3;
  v8 = 0;
  objc_opt_class();
  -[CKMessagesControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("chatController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7.receiver = self;
  v7.super_class = (Class)CKMessagesControllerAccessibility;
  -[CKMessagesControllerAccessibility setChatController:](&v7, sel_setChatController_, v4);
  objc_msgSend(v6, "_accessibilityReloadElementRelations:", 0);
  if (v4)
    AXPerformBlockOnMainThreadAfterDelay();
  else
    -[CKMessagesControllerAccessibility _accessibilityReloadElementRelations:](self, "_accessibilityReloadElementRelations:", 0);

}

uint64_t __55__CKMessagesControllerAccessibility_setChatController___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilityReloadElementRelations:", 1);
}

@end
