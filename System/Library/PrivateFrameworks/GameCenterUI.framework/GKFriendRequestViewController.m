@implementation GKFriendRequestViewController

- (GKFriendRequestViewController)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKFriendRequestViewController;
  return -[GKHostedViewController init](&v3, sel_init);
}

- (id)serviceSideViewControllerClassName
{
  return CFSTR("GKServiceFriendRequestViewController");
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKFriendRequestViewController;
  -[GKHostedViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsShowingFriendRequestUI:", 0);

}

- (void)notifyDelegateOnWillFinish
{
  id v3;

  -[GKFriendRequestViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "friendRequestControllerDidFinish:", self);

}

- (id)_presentingViewController
{
  return objc_loadWeakRetained((id *)&self->_requestingViewController);
}

+ (void)addFriends:(id)a3
{
  objc_msgSend(a1, "addFriends:recipients:", a3, MEMORY[0x1E0C9AA60]);
}

+ (void)addFriends:(id)a3 recipients:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
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
  int v21;
  uint64_t v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v5 = a3;
  v6 = a4;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "keyWindow");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "rootViewController");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!objc_msgSend(MEMORY[0x1E0CC68C8], "canSendText"))
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C50]);

    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isAddingFriendsRestricted");

  if ((v10 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C70]);

    GKGameCenterUIFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_7:
    GKGetLocalizedStringFromTableInBundle();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKFriendRequestViewController presentAlertControllerOn:withMessage:andTitle:](GKFriendRequestViewController, "presentAlertControllerOn:withMessage:andTitle:", v5, v14, v16);

    goto LABEL_12;
  }
  v17 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/Hosted UI/GKFriendRequestViewController.m", 85, "+[GKFriendRequestViewController addFriends:recipients:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dispatchGroupWithName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fetchFriendCodeInExtensionEnabled");

  v22 = MEMORY[0x1E0C809B0];
  if (v21)
  {
    +[GKFriendRequestViewController presentFriendRequestOn:forRecipients:withFriendCode:andFriendSupportPageURL:](GKFriendRequestViewController, "presentFriendRequestOn:forRecipients:withFriendCode:andFriendSupportPageURL:", v5, v6, 0, 0);
  }
  else
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke;
    v28[3] = &unk_1E59C4A28;
    v29 = v19;
    objc_msgSend(v29, "perform:", v28);

  }
  v24[0] = v22;
  v24[1] = 3221225472;
  v24[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_22;
  v24[3] = &unk_1E59C54B8;
  v25 = v19;
  v26 = v5;
  v27 = v6;
  v23 = v19;
  objc_msgSend(v23, "notifyOnMainQueueWithBlock:", v24);

LABEL_12:
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0D25330], "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2;
  v8[3] = &unk_1E59C73A0;
  v9 = *(id *)(a1 + 32);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v4, "createFriendRequestWithIdentifier:handler:", v6, v8);

}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v9)
  {
    if (!*MEMORY[0x1E0D25460])
      v10 = (id)GKOSLoggers();
    v11 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2_cold_1((uint64_t)v9, v11);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C58]);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("friendCode"));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("friendSupportPageURL"));
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_22(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendCode"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "local");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setIsShowingFriendRequestUI:", 1);

    v5 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendCode"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friendSupportPageURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKFriendRequestViewController presentFriendRequestOn:forRecipients:withFriendCode:andFriendSupportPageURL:](GKFriendRequestViewController, "presentFriendRequestOn:forRecipients:withFriendCode:andFriendSupportPageURL:", v5, v4, v10, v6);
  }
  else
  {
    v7 = *(_QWORD *)(a1 + 40);
    GKGameCenterUIFrameworkBundle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKFriendRequestViewController presentAlertControllerOn:withMessage:andTitle:](GKFriendRequestViewController, "presentAlertControllerOn:withMessage:andTitle:", v7, v6, v9);

  }
}

+ (void)presentFriendRequestOn:(id)a3 forRecipients:(id)a4 withFriendCode:(id)a5 andFriendSupportPageURL:(id)a6
{
  id v9;
  id v10;
  id v11;
  GKFriendRequestViewController *v12;
  id v13;

  v13 = a3;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc_init(GKFriendRequestViewController);
  -[GKFriendRequestViewController setRequestingViewController:](v12, "setRequestingViewController:", v13);
  -[GKFriendRequestViewController setFriendCode:](v12, "setFriendCode:", v10);

  -[GKFriendRequestViewController setFriendSupportPageURL:](v12, "setFriendSupportPageURL:", v9);
  -[GKFriendRequestViewController setRecipients:](v12, "setRecipients:", v11);

  if (objc_msgSend(v13, "conformsToProtocol:", &unk_1EECD57E0))
    -[GKFriendRequestViewController setDelegate:](v12, "setDelegate:", v13);
  objc_msgSend(v13, "_gkPresentViewController:animated:", v12, 1);

}

+ (void)presentAlertControllerOn:(id)a3 withMessage:(id)a4 andTitle:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a5, a4, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DC3448];
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "actionWithTitle:style:handler:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v11);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v15, "presentViewController:animated:completion:", v7, 1, 0);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "keyWindow");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "presentViewController:animated:completion:", v7, 1, 0);
  }

}

- (GKFriendRequestViewControllerDelegate)delegate
{
  return (GKFriendRequestViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)friendCode
{
  return self->_friendCode;
}

- (void)setFriendCode:(id)a3
{
  objc_storeStrong((id *)&self->_friendCode, a3);
}

- (NSString)friendSupportPageURL
{
  return self->_friendSupportPageURL;
}

- (void)setFriendSupportPageURL:(id)a3
{
  objc_storeStrong((id *)&self->_friendSupportPageURL, a3);
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
  objc_storeStrong((id *)&self->_recipients, a3);
}

- (NSString)chatGUID
{
  return self->_chatGUID;
}

- (void)setChatGUID:(id)a3
{
  objc_storeStrong((id *)&self->_chatGUID, a3);
}

- (UIViewController)requestingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_requestingViewController);
}

- (void)setRequestingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_requestingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_requestingViewController);
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __55__GKFriendRequestViewController_addFriends_recipients___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "createFriendRequest error: %@", (uint8_t *)&v2, 0xCu);
}

@end
