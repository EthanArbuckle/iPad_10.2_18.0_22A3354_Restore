@implementation CKBusinessChatController

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  -[CKChatController loadView](&v3, sel_loadView);
  -[CKBusinessChatController setupBizNavBarIfNecessary](self, "setupBizNavBarIfNecessary");
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBusinessChatController;
  -[CKChatController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  -[CKBusinessChatController cleanUpBizNavBarIfNecessary](self, "cleanUpBizNavBarIfNecessary");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  -[CKChatController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[CKBusinessChatController setupBizNavBarIfNecessary](self, "setupBizNavBarIfNecessary");
}

- (int64_t)preferredStatusBarStyle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int64_t v7;

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "theme");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKCoreChatController conversation](self, "conversation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "statusBarStyleForBusinessChat:", v6);

  return v7;
}

- (void)_handleAddressBookChangedNotification:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBusinessChatController;
  -[CKChatController _handleAddressBookChangedNotification:](&v4, sel__handleAddressBookChangedNotification_, a3);
  -[CKBusinessChatController setupBizNavBarIfNecessary](self, "setupBizNavBarIfNecessary");
}

- (void)setupBizNavBarIfNecessary
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKBusinessChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "theme");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "chat");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "secondaryBrandColorForBusinessChat:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v11);

    -[CKBusinessChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "conversationIdentityView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "theme");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "chat");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setStyle:", objc_msgSend(v15, "navBarTextStyleForBusinessChat:", v17));

    -[CKBusinessChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "updateDefaultLabelIfNecessary");

    -[CKBusinessChatController navigationController](self, "navigationController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "navigationBar");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "chat");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "enableBranding:forBusinessChat:", 1, v22);

    -[CKBusinessChatController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (void)_updateNavigationUI
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKBusinessChatController;
  -[CKChatController _updateNavigationUI](&v3, sel__updateNavigationUI);
  -[CKBusinessChatController setupBizNavBarIfNecessary](self, "setupBizNavBarIfNecessary");
}

- (void)cleanUpBizNavBarIfNecessary
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

  -[CKCoreChatController conversation](self, "conversation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "chat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[CKBusinessChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", 0);

    -[CKBusinessChatController navbarCanvasViewController](self, "navbarCanvasViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "conversationIdentityView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setStyle:", 4);

    -[CKBusinessChatController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "navigationBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKCoreChatController conversation](self, "conversation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "chat");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enableBranding:forBusinessChat:", 0, v12);

    -[CKBusinessChatController setNeedsStatusBarAppearanceUpdate](self, "setNeedsStatusBarAppearanceUpdate");
  }
}

- (BOOL)shouldListParticipantsInTitle
{
  return 0;
}

- (BOOL)canShowBusinessOnboarding
{
  void *v2;
  char v3;

  -[CKCoreChatController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isChatBot") ^ 1;

  return v3;
}

- (CKNavbarCanvasViewController)navbarCanvasViewController
{
  return self->_navbarCanvasViewController;
}

- (void)setNavbarCanvasViewController:(id)a3
{
  objc_storeStrong((id *)&self->_navbarCanvasViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navbarCanvasViewController, 0);
}

@end
