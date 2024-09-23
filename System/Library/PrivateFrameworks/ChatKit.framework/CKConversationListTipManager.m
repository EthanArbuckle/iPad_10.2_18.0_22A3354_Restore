@implementation CKConversationListTipManager

- (void)conversationListControllerDidAppear
{
  -[CKConversationListTipManagerSwift conversationListControllerDidAppear](self->_swiftManager, "conversationListControllerDidAppear");
}

- (int64_t)presentedTip
{
  return -[CKConversationListTipManagerSwift presentedTip](self->_swiftManager, "presentedTip");
}

- (CKConversationListTipManager)initWithConversationListController:(id)a3
{
  id v4;
  CKConversationListTipManager *v5;
  CKConversationListTipManagerSwift *v6;
  CKConversationListTipManagerSwift *swiftManager;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKConversationListTipManager;
  v5 = -[CKConversationListTipManager init](&v9, sel_init);
  if (v5)
  {
    v6 = -[CKConversationListTipManagerSwift initWithConversationListController:]([CKConversationListTipManagerSwift alloc], "initWithConversationListController:", v4);
    swiftManager = v5->_swiftManager;
    v5->_swiftManager = v6;

  }
  return v5;
}

- (id)miniTipUIView
{
  return -[CKConversationListTipManagerSwift miniTipUIView](self->_swiftManager, "miniTipUIView");
}

- (void)conversationListControllerDidDisappear
{
  -[CKConversationListTipManagerSwift conversationListControllerDidDisappear](self->_swiftManager, "conversationListControllerDidDisappear");
}

- (void)userDidPinConversation
{
  -[CKConversationListTipManagerSwift userDidPinConversation](self->_swiftManager, "userDidPinConversation");
}

- (void)updateKtTipRules
{
  -[CKConversationListTipManagerSwift updateKtTipRules](self->_swiftManager, "updateKtTipRules");
}

- (void)updateCloudTipRulesForDescriptor:(id)a3
{
  -[CKConversationListTipManagerSwift updateCloudTipRulesFor:](self->_swiftManager, "updateCloudTipRulesFor:", a3);
}

- (CKConversationListTipManagerSwift)swiftManager
{
  return self->_swiftManager;
}

- (void)setSwiftManager:(id)a3
{
  objc_storeStrong((id *)&self->_swiftManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_swiftManager, 0);
}

@end
