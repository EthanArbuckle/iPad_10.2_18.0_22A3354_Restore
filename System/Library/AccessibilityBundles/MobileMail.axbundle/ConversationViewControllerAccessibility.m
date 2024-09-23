@implementation ConversationViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ConversationViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axSkipNextFocusOnMessage
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetSkipNextFocusOnMessage:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("_scrollToInitialPosition"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("messageViewController:didTapRevealActionsButton:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("_visibleIndexPathForMessageViewController:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("invalidateAutomaticMarkAsReadForAllMessages"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("cancelAutomaticMarkAsReadForCellViewModel:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("scheduleAutomaticMarkAsReadForMessage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("_shouldAutomaticallyMarkAsReadMessage:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("swipableCollectionViewLayout:leadingSwipeActionsConfigurationForItemAtIndexPath:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("_referenceDisplayMessage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("collectionViewDataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewController"), CFSTR("_messageAtIndexPath:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationViewController"), CFSTR("ConversationViewControllerBase"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ConversationViewControllerBase"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("arrowControlsView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("deleteButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("archiveButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("moveButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("replyButtonItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("_shrinkMessagesToBarButton:withInteraction:completionHandler:"), "v", "@", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("conversationSubject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("arrowControlsView:didTapButtonWithDirection:"), "v", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("conversationLayout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("conversationHeaderView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("ConversationViewControllerBase"), CFSTR("_conversationView"), "_MFConversationViewCollectionView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("displayMetrics"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("_updateFooterViewFrameForCell:atIndexPath:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("_selectNextMessageCommandInvoked:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("_selectPreviousMessageCommandInvoked:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("referenceMessageListItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFConversationViewCell"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationCellViewModel"), CFSTR("messageLoadingContext"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationCellViewModel"), CFSTR("messageContentRequest"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageLoadingContext"), CFSTR("messageBody"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageLoadingContext"), CFSTR("hasLoadedSomeContent"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageLoadingContext"), CFSTR("hasLoadedCompleteMessage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageLoadingContext"), CFSTR("message"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageContentRepresentationRequest"), CFSTR("hasStarted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageContentRepresentationRequest"), CFSTR("isFinished"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMimeBody"), CFSTR("totalTextSize"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFExpandedMessageCell"), CFSTR("messageViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageViewController"), CFSTR("messageContentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MFMessageContentView"), CFSTR("_footerView"), "MFConversationItemFooterView");
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("flags"));
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("EMMessageListItem"), CFSTR("displayMessageItemID"));
  objc_msgSend(v3, "validateProtocol:conformsToProtocol:", CFSTR("EMMessageListItem"), CFSTR("EMCollectionItem"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executePreHandlerWithView:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIContextualAction"), CFSTR("executeHandlerWithView:completionHandler:"), "v", "@", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationHeaderView"), CFSTR("contentView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationHeaderContentView"), CFSTR("textLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageHeaderSubjectBlock"), CFSTR("subjectTextView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFMessageDisplayMetrics"), CFSTR("estimatedFooterViewHeight"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MessageListViewController"), CFSTR("conversationViewController:advanceToNextConversationWithDirection:"), "v", "@", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUIMessageListViewController"), CFSTR("collectionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ECSubject"), CFSTR("subjectString"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("WKContentView"));
  objc_msgSend(v3, "validateClass:", CFSTR("MFModernAddressAtom"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ConversationViewControllerBase"), CFSTR("barItemsManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MobileMail.ConversationNavigationBarItemsManager"), CFSTR("revealActionsButtonItem"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
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
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("deleteButtonItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("archiveButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("message.action.delete"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v5);

  accessibilityLocalizedString(CFSTR("archive.button"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("moveButtonItem"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("transfer.mail.button"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityLabel:", v8);

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("replyButtonItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("reply.button"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityLabel:", v10);

  -[ConversationViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("barItemsManager.revealActionsButtonItem"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("reveal.more.button"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setAccessibilityLabel:", v12);

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_setAccessibilityLinkedUIElementsBlock:", &__block_literal_global_1);

  -[ConversationViewControllerAccessibility _accessibilitySetConversationViewInsets](self, "_accessibilitySetConversationViewInsets");
}

id __85__ConversationViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BDBCE30];
  AXMobileMailGetSelectedMessageCellElement();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "axArrayByIgnoringNilElementsWithCount:", 1, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  ConversationViewControllerAccessibility *v12;
  char v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v13 = 0;
  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "numberOfSections") < 1)
  {
    v5 = 0;
  }
  else
  {
    v5 = 0;
    if (objc_msgSend(v4, "numberOfItemsInSection:", 0) >= 2)
    {
      -[ConversationViewControllerAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("MailConversationRotor"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v7 = objc_alloc(MEMORY[0x24BDF6790]);
        accessibilityLocalizedString(CFSTR("thread.message.rotor.title"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = MEMORY[0x24BDAC760];
        v10[1] = 3221225472;
        v10[2] = __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke;
        v10[3] = &unk_250285810;
        v11 = v4;
        v12 = self;
        v6 = (void *)objc_msgSend(v7, "initWithName:itemSearchBlock:", v8, v10);

        -[ConversationViewControllerAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("MailConversationRotor"));
      }
      v14[0] = v6;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v5;
}

id __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "numberOfSections") < 1)
    v4 = -1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "numberOfItemsInSection:", 0) - 1;
  objc_msgSend(v3, "currentItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "targetElement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_367, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "indexPathForCell:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v9 = (void *)v8;
  v10 = objc_msgSend(v3, "searchDirection");
  v11 = objc_msgSend(v9, "row");
  if (v10)
  {
    if (v11 >= v4)
      goto LABEL_12;
    v12 = (void *)MEMORY[0x24BDD15D8];
    v13 = objc_msgSend(v9, "row") + 1;
  }
  else
  {
    if (v11 < 1)
      goto LABEL_12;
    v12 = (void *)MEMORY[0x24BDD15D8];
    v13 = objc_msgSend(v9, "row") - 1;
  }
  objc_msgSend(v12, "indexPathForRow:inSection:", v13, 0);
  v14 = objc_claimAutoreleasedReturnValue();

  v9 = (void *)v14;
LABEL_12:
  objc_msgSend(*(id *)(a1 + 40), "_axSetSkipNextFocusOnMessage:", 1);
  objc_msgSend(*(id *)(a1 + 32), "scrollToItemAtIndexPath:atScrollPosition:animated:", v9, 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "cellForItemAtIndexPath:", v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_axElementForFocusInCell:shouldAllowCollapsedCell:", v15, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:", v16, 0);
  else
    v17 = 0;

  return v17;
}

uint64_t __68__ConversationViewControllerAccessibility_accessibilityCustomRotors__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFConversationViewCell"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axElementForFocusInCell:(id)a3 shouldAllowCollapsedCell:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  int v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  id v16;

  v4 = a4;
  v5 = a3;
  objc_msgSend(v5, "safeValueForKey:", CFSTR("viewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safeValueForKey:", CFSTR("messageLoadingContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "safeValueForKey:", CFSTR("messageBody"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "safeUnsignedIntegerForKey:", CFSTR("totalTextSize"));
    v11 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("hasLoadedSomeContent"));
    v12 = objc_msgSend(v8, "safeBoolForKey:", CFSTR("hasLoadedCompleteMessage"));

    if (v10 < 2 || ((v12 | v11) & 1) == 0)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(v6, "safeValueForKey:", CFSTR("messageContentRequest"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "safeBoolForKey:", CFSTR("hasStarted")))
    {

    }
    else
    {
      v14 = objc_msgSend(v13, "safeBoolForKey:", CFSTR("isFinished"));

      if (!v14)
        goto LABEL_12;
    }
  }
  objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", &__block_literal_global_371);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "accessibilityElementCount") <= 0)
  {

  }
  else
  {
    objc_msgSend(v15, "accessibilityElementAtIndex:", 0);
    v16 = (id)objc_claimAutoreleasedReturnValue();

    if (v16)
      goto LABEL_15;
  }
LABEL_12:
  objc_msgSend(v5, "_accessibilityFindSubviewDescendant:", &__block_literal_global_372);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  if (!v16 && v4)
    v16 = v5;
LABEL_15:

  return v16;
}

uint64_t __93__ConversationViewControllerAccessibility__axElementForFocusInCell_shouldAllowCollapsedCell___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("WKContentView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __93__ConversationViewControllerAccessibility__axElementForFocusInCell_shouldAllowCollapsedCell___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MFModernAddressAtom"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityFirstElementForFocus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionViewDataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[ConversationViewControllerAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("referenceMessageListItem.displayMessageItemID")), v6 = (void *)objc_claimAutoreleasedReturnValue(), objc_msgSend(v5, "indexPathForItemIdentifier:", v6), v7 = (void *)objc_claimAutoreleasedReturnValue(), v6, v7))
  {
    objc_msgSend(v4, "cellForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ConversationViewControllerAccessibility _axFirstVisibleExpandedCell](self, "_axFirstVisibleExpandedCell");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ConversationViewControllerAccessibility _axElementForFocusInCell:shouldAllowCollapsedCell:](self, "_axElementForFocusInCell:shouldAllowCollapsedCell:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_axFirstVisibleExpandedCell
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  v17 = 0;
  objc_msgSend(v4, "visibleCells");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__ConversationViewControllerAccessibility__axFirstVisibleExpandedCell__block_invoke;
  v11[3] = &unk_250285878;
  v11[4] = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v11);

  v6 = (void *)v13[5];
  if (!v6)
  {
    -[ConversationViewControllerAccessibility _axFirstVisibleCell](self, "_axFirstVisibleCell");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v13[5];
    v13[5] = v7;

    v6 = (void *)v13[5];
  }
  v9 = v6;
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __70__ConversationViewControllerAccessibility__axFirstVisibleExpandedCell__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  NSClassFromString(CFSTR("MFExpandedMessageCell"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (id)_axFirstVisibleCell
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "contentOffset");
  v10 = v9;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  objc_msgSend(v4, "visibleCells");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__ConversationViewControllerAccessibility__axFirstVisibleCell__block_invoke;
  v14[3] = &unk_2502858A0;
  v14[5] = v6;
  *(double *)&v14[6] = v10;
  *(double *)&v14[7] = v8;
  *(double *)&v14[8] = v10 + v8;
  v14[4] = &v15;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v14);

  v12 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void __62__ConversationViewControllerAccessibility__axFirstVisibleCell__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  id v11;
  CGRect v12;

  v11 = a2;
  objc_msgSend(v11, "frame");
  v12.origin.x = v7;
  v12.origin.y = v8;
  v12.size.width = v9;
  v12.size.height = v10;
  if (CGRectIntersectsRect(*(CGRect *)(a1 + 40), v12))
  {
    *a4 = 1;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  }

}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  char v8;

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_conversationView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  switch(a3)
  {
    case 1:
    case 6:
      v7 = 1;
      -[ConversationViewControllerAccessibility _axSimulateTapArrowButtonWithDirection:](self, "_axSimulateTapArrowButtonWithDirection:", 1);
      break;
    case 2:
    case 5:
      -[ConversationViewControllerAccessibility _axSimulateTapArrowButtonWithDirection:](self, "_axSimulateTapArrowButtonWithDirection:", 0xFFFFFFFFLL);
      v7 = 1;
      break;
    case 3:
      v8 = objc_msgSend(v5, "accessibilityScrollUpPage");
      goto LABEL_7;
    case 4:
      v8 = objc_msgSend(v5, "accessibilityScrollDownPage");
LABEL_7:
      v7 = v8;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)_accessibilityScrollAncestor
{
  return (id)-[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_conversationView"));
}

- (void)_axSimulateTapArrowButtonWithDirection:(int)a3
{
  AXPerformSafeBlock();
  AXPerformBlockOnMainThreadAfterDelay();
}

void __82__ConversationViewControllerAccessibility__axSimulateTapArrowButtonWithDirection___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("delegate"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversationViewController:advanceToNextConversationWithDirection:", *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));

}

void __82__ConversationViewControllerAccessibility__axSimulateTapArrowButtonWithDirection___block_invoke_2(uint64_t a1)
{
  UIAccessibilityNotifications v1;
  id v2;

  v1 = *MEMORY[0x24BDF7328];
  objc_msgSend(*(id *)(a1 + 32), "_axMessageSubjectView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v1, v2);

}

- (id)_axMessageSubjectView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_conversationView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendant:", &__block_literal_global_379);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeValueForKey:", CFSTR("subjectTextView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversationHeaderView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("contentView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("textLabel"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __64__ConversationViewControllerAccessibility__axMessageSubjectView__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MessageHeaderSubjectBlock"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)_accessibilityPerformLeadingActionWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  char v24;

  v4 = a3;
  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathForCell:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("conversationLayout"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_opt_class();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v9 = v8;
  v10 = v7;
  AXPerformSafeBlock();
  v11 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  __UIAccessibilityCastAsClass();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
    abort();
  objc_msgSend(v12, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "firstObject");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v4;
  v15 = v4;
  v16 = v14;
  AXPerformSafeBlock();

}

void __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "swipableCollectionViewLayout:leadingSwipeActionsConfigurationForItemAtIndexPath:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "executePreHandlerWithView:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "executeHandlerWithView:completionHandler:", *(_QWORD *)(a1 + 40), &__block_literal_global_382);
}

void __86__ConversationViewControllerAccessibility__accessibilityPerformLeadingActionWithCell___block_invoke_3()
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_scrollToInitialPosition
{
  void *v3;
  void *v4;
  int v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _scrollToInitialPosition](&v6, sel__scrollToInitialPosition);
  if (-[ConversationViewControllerAccessibility _axSkipNextFocusOnMessage](self, "_axSkipNextFocusOnMessage"))
  {
    -[ConversationViewControllerAccessibility _axSetSkipNextFocusOnMessage:](self, "_axSetSkipNextFocusOnMessage:", 0);
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

    if (v5)
      AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __67__ConversationViewControllerAccessibility__scrollToInitialPosition__block_invoke(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFirstElementForFocus");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF7328], 0);
}

- (void)_shrinkMessagesToBarButton:(id)a3 withInteraction:(id)a4 completionHandler:(id)a5
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _shrinkMessagesToBarButton:withInteraction:completionHandler:](&v5, sel__shrinkMessagesToBarButton_withInteraction_completionHandler_, a3, a4, a5);
  AXPerformBlockOnMainThreadAfterDelay();
}

void __104__ConversationViewControllerAccessibility__shrinkMessagesToBarButton_withInteraction_completionHandler___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("conversationSubject"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safeValueForKey:", CFSTR("subjectString"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v2 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("now.showing.message"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringWithFormat:", v3, v5);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilitySpeakAndDoNotBeInterrupted();
  }

}

- (id)arrowControlsView
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility arrowControlsView](&v5, sel_arrowControlsView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ConversationViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

- (void)arrowControlsView:(id)a3 didTapButtonWithDirection:(int)a4
{
  uint64_t v4;
  id v6;
  objc_super v7;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  -[ConversationViewControllerAccessibility _axSetSkipNextFocusOnMessage:](self, "_axSetSkipNextFocusOnMessage:", 1);
  v7.receiver = self;
  v7.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility arrowControlsView:didTapButtonWithDirection:](&v7, sel_arrowControlsView_didTapButtonWithDirection_, v6, v4);

  AXPerformBlockOnMainThreadAfterDelay();
}

void __87__ConversationViewControllerAccessibility_arrowControlsView_didTapButtonWithDirection___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_axMessageSubjectView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __AXStringForVariables();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilitySpeak();

}

- (void)_selectNextMessageCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[ConversationViewControllerAccessibility _axSetSkipNextFocusOnMessage:](self, "_axSetSkipNextFocusOnMessage:", 1);
  v12.receiver = self;
  v12.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _selectNextMessageCommandInvoked:](&v12, sel__selectNextMessageCommandInvoked_, v4);
  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BEBB030];
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v8, v11);

}

- (void)_selectPreviousMessageCommandInvoked:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UIAccessibilityNotifications v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v4 = a3;
  -[ConversationViewControllerAccessibility _axSetSkipNextFocusOnMessage:](self, "_axSetSkipNextFocusOnMessage:", 1);
  v12.receiver = self;
  v12.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _selectPreviousMessageCommandInvoked:](&v12, sel__selectPreviousMessageCommandInvoked_, v4);
  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *MEMORY[0x24BEBB030];
  objc_msgSend(v7, "indexPathsForSelectedItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForItemAtIndexPath:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v8, v11);

}

- (void)messageViewController:(id)a3 didTapRevealActionsButton:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  char v22;
  objc_super v23;

  v6 = a3;
  v7 = a4;
  v23.receiver = self;
  v23.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility messageViewController:didTapRevealActionsButton:](&v23, sel_messageViewController_didTapRevealActionsButton_, v6, v7);
  v22 = 0;
  objc_opt_class();
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy_;
  v20 = __Block_byref_object_dispose_;
  v21 = 0;
  v15 = MEMORY[0x24BDAC760];
  v8 = v6;
  AXPerformSafeBlock();
  v9 = (id)v17[5];

  _Block_object_dispose(&v16, 8);
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    goto LABEL_6;
  if (v10)
  {
    LOBYTE(v16) = 0;
    objc_opt_class();
    -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"), v15, 3221225472, __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke, &unk_2502859A0, self);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!(_BYTE)v16)
    {
      objc_msgSend(v12, "cellForItemAtIndexPath:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_accessibilityFindSubviewDescendant:", &__block_literal_global_403);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v14);

      goto LABEL_5;
    }
LABEL_6:
    abort();
  }
LABEL_5:

}

void __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_visibleIndexPathForMessageViewController:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __91__ConversationViewControllerAccessibility_messageViewController_didTapRevealActionsButton___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axAutomaticallyMarkReadTimer
{
  JUMPOUT(0x234914E5CLL);
}

- (void)_axSetAutomaticallyMarkReadTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)invalidateAutomaticMarkAsReadForAllMessages
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility invalidateAutomaticMarkAsReadForAllMessages](&v3, sel_invalidateAutomaticMarkAsReadForAllMessages);
  -[ConversationViewControllerAccessibility _axCancelMarkAsReadTimer](self, "_axCancelMarkAsReadTimer");
}

- (void)cancelAutomaticMarkAsReadForCellViewModel:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility cancelAutomaticMarkAsReadForCellViewModel:](&v4, sel_cancelAutomaticMarkAsReadForCellViewModel_, a3);
  -[ConversationViewControllerAccessibility _axCancelMarkAsReadTimer](self, "_axCancelMarkAsReadTimer");
}

- (void)_axCancelMarkAsReadTimer
{
  id v3;

  -[ConversationViewControllerAccessibility _axAutomaticallyMarkReadTimer](self, "_axAutomaticallyMarkReadTimer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancel");
  -[ConversationViewControllerAccessibility _axSetAutomaticallyMarkReadTimer:](self, "_axSetAutomaticallyMarkReadTimer:", 0);

}

- (void)scheduleAutomaticMarkAsReadForMessage:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  ConversationViewControllerAccessibility *v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  objc_super v23;

  v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility scheduleAutomaticMarkAsReadForMessage:](&v23, sel_scheduleAutomaticMarkAsReadForMessage_, v4);
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v5 = MEMORY[0x24BDAC760];
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke;
  v15 = &unk_2502859A0;
  v18 = &v19;
  v16 = self;
  v6 = v4;
  v17 = v6;
  AXPerformSafeBlock();
  v7 = *((unsigned __int8 *)v20 + 24);

  _Block_object_dispose(&v19, 8);
  if (v7)
  {
    -[ConversationViewControllerAccessibility _axAutomaticallyMarkReadTimer](self, "_axAutomaticallyMarkReadTimer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "cancel");
    if (!v8)
    {
      v9 = objc_alloc(MEMORY[0x24BDFE490]);
      v8 = (void *)objc_msgSend(v9, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
      -[ConversationViewControllerAccessibility _axSetAutomaticallyMarkReadTimer:](self, "_axSetAutomaticallyMarkReadTimer:", v8);
    }
    v10[0] = v5;
    v10[1] = 3221225472;
    v10[2] = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_2;
    v10[3] = &unk_250285978;
    v10[4] = self;
    v11 = v6;
    objc_msgSend(v8, "afterDelay:processBlock:", v10, 0.7);

  }
}

uint64_t __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_shouldAutomaticallyMarkAsReadMessage:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  char v10;

  v10 = 0;
  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("collectionView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "visibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_3;
  v7[3] = &unk_2502859E8;
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
  objc_msgSend(*(id *)(a1 + 32), "_axSetAutomaticallyMarkReadTimer:", 0);

}

void __81__ConversationViewControllerAccessibility_scheduleAutomaticMarkAsReadForMessage___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("viewModel.messageLoadingContext.message"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == *(void **)(a1 + 32))
  {
    NSClassFromString(CFSTR("MFExpandedMessageCell"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "safeValueForKey:", CFSTR("messageViewController"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "safeValueForKey:", CFSTR("messageContentView"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_footerView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 40), "_accessibilityTitleForLeadingActionWithCell:", v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "_accessibilityUpdateLeadingActionTitle:", v7);

      }
    }
  }

}

- (id)_accessibilityTitleForLeadingActionWithCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  int v12;
  __CFString *v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  ConversationViewControllerAccessibility *v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  char v28;

  v4 = a3;
  LOBYTE(v22) = 0;
  objc_opt_class();
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "indexPathForCell:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v28 = 0;
    objc_opt_class();
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy_;
    v26 = __Block_byref_object_dispose_;
    v27 = 0;
    v16 = MEMORY[0x24BDAC760];
    v17 = 3221225472;
    v18 = __87__ConversationViewControllerAccessibility__accessibilityTitleForLeadingActionWithCell___block_invoke;
    v19 = &unk_2502859A0;
    v20 = self;
    v21 = v7;
    AXPerformSafeBlock();
    v8 = (id)v23[5];

    _Block_object_dispose(&v22, 8);
    __UIAccessibilityCastAsClass();
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
      abort();
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v9, "flags", v16, v17, v18, v19, v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "read");
  if (v9)
    v12 = v11;
  else
    v12 = 1;
  if (v12)
    v13 = CFSTR("message.action.mark.unread");
  else
    v13 = CFSTR("message.action.mark.read");
  accessibilityLocalizedString(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __87__ConversationViewControllerAccessibility__accessibilityTitleForLeadingActionWithCell___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_messageAtIndexPath:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateFooterViewFrameForCell:(id)a3 atIndexPath:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ConversationViewControllerAccessibility;
  -[ConversationViewControllerAccessibility _updateFooterViewFrameForCell:atIndexPath:](&v5, sel__updateFooterViewFrameForCell_atIndexPath_, a3, a4);
  -[ConversationViewControllerAccessibility _accessibilitySetConversationViewInsets](self, "_accessibilitySetConversationViewInsets");
}

- (void)_accessibilitySetConversationViewInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_conversationView"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_accessibilityNavigationControllerInset");
  v4 = v3;
  v6 = v5;
  -[ConversationViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("displayMetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeCGFloatForKey:", CFSTR("estimatedFooterViewHeight"));
  v9 = v8;

  objc_msgSend(v10, "_accessibilitySetNavigationControllerInset:", v9 + v9, v4, v9 * 3.0, v6);
}

@end
