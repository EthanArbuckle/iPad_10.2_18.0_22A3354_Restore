@implementation CKConversationListCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKConversationListCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKConversationListCollectionViewConversationCell"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKConversationListCollectionViewController"), CFSTR("UICollectionViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("_updateToolbarItems"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("isShowingSwipeDeleteConfirmation"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("composeButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("optionsButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("CKConversationListCollectionViewController"), CFSTR("UICollectionViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("unpinConversation:withReason:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKConversationListCollectionViewController"), CFSTR("pinConversation:withReason:"), "v", "@", "@", 0);

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
  v9.super_class = (Class)CKConversationListCollectionViewControllerAccessibility;
  -[CKConversationListCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v9, sel__accessibilityLoadAccessibilityInformation);
  -[CKConversationListCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("group.conversations.table"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

  accessibilityLocalizedString(CFSTR("compose.button.text"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKConversationListCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("composeButtonItem"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v5);

  -[CKConversationListCollectionViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("optionsButtonItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("more.button.text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewControllerAccessibility;
  -[CKConversationListCollectionViewControllerAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[CKConversationListCollectionViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_updateToolbarItems
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKConversationListCollectionViewControllerAccessibility;
  -[CKConversationListCollectionViewControllerAccessibility _updateToolbarItems](&v2, sel__updateToolbarItems);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)unpinConversation:(id)a3 withReason:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewControllerAccessibility;
  -[CKConversationListCollectionViewControllerAccessibility unpinConversation:withReason:](&v4, sel_unpinConversation_withReason_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)pinConversation:(id)a3 withReason:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKConversationListCollectionViewControllerAccessibility;
  -[CKConversationListCollectionViewControllerAccessibility pinConversation:withReason:](&v4, sel_pinConversation_withReason_, a3, a4);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

@end
