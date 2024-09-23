@implementation GKServiceFriendRequestViewController

- (GKServiceFriendRequestViewController)init
{
  GKServiceFriendRequestViewController *v2;
  GKServiceFriendRequestViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKServiceFriendRequestViewController;
  v2 = -[GKServiceViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKServiceViewController setAlwaysShowDoneButton:](v2, "setAlwaysShowDoneButton:", 1);
  return v3;
}

- (BOOL)_useBackdropViewForWindowBackground
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)GKServiceFriendRequestViewController;
  -[GKServiceViewController viewWillAppear:](&v9, sel_viewWillAppear_, a3);
  -[GKServiceFriendRequestViewController navigationBar](self, "navigationBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  objc_msgSend(MEMORY[0x1E0D25AE0], "sharedPalette");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "colorWithAlphaComponent:", 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceFriendRequestViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setBackgroundColor:", v7);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKServiceFriendRequestViewController;
  -[GKServiceViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "recordPageWithID:pageContext:pageType:", CFSTR("MessageCompose"), &stru_1E59EB978, CFSTR("inviteFriend"));

  -[GKServiceFriendRequestViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_rootSheetPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setShouldScaleDownBehindDescendantSheets:", 0);

}

- (void)setInitialState:(id)a3 withReply:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  objc_super v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GKFriendCodeKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceFriendRequestViewController setFriendCode:](self, "setFriendCode:", v8);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GKFriendSupportPageURLKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceFriendRequestViewController setFriendSupportPageURL:](self, "setFriendSupportPageURL:", v9);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GKFriendRecipientsKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceFriendRequestViewController setRecipients:](self, "setRecipients:", v10);

  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("GKChatGUIDKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKServiceFriendRequestViewController setChatGUID:](self, "setChatGUID:", v11);

  v12.receiver = self;
  v12.super_class = (Class)GKServiceFriendRequestViewController;
  -[GKServiceViewController setInitialState:withReply:](&v12, sel_setInitialState_withReply_, v7, v6);

}

- (BOOL)shouldAnimatePresentationForPrivateViewController:(id)a3
{
  return 1;
}

- (void)constructPrivateViewController
{
  GKMessageComposeViewController *v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  -[GKServiceFriendRequestViewController setMessageComposeSent:](self, "setMessageComposeSent:", 0);
  v3 = objc_alloc_init(GKMessageComposeViewController);
  -[GKServiceFriendRequestViewController setComposeController:](self, "setComposeController:", v3);
  -[GKServiceViewController setPrivateViewController:](self, "setPrivateViewController:", v3);
  -[GKMessageComposeViewController setMessageComposeDelegate:](v3, "setMessageComposeDelegate:", self);
  -[GKMessageComposeViewController setGkComposeDelegate:](v3, "setGkComposeDelegate:", self);
  -[GKServiceFriendRequestViewController friendSupportPageURL](self, "friendSupportPageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[GKServiceFriendRequestViewController friendCode](self, "friendCode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = (void *)objc_opt_new();
      -[GKServiceFriendRequestViewController friendSupportPageURL](self, "friendSupportPageURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFriendSupportPageURL:", v7);

      -[GKServiceFriendRequestViewController friendCode](self, "friendCode");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setFriendCode:", v8);

      objc_msgSend(v6, "setFriendRequestState:", CFSTR("1"));
      objc_msgSend(MEMORY[0x1E0D25330], "local");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setInitiator:", v9);

      objc_msgSend(v6, "setFriendRequestVersion:", CFSTR("1"));
      objc_msgSend(MEMORY[0x1E0C99E98], "_gkGenerateFriendRequestURL:", v6);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v4 = 0;
    }
  }
  v10 = (void *)MEMORY[0x1E0CC6930];
  v11 = (void *)objc_opt_new();
  objc_msgSend(v10, "friendInviteMessageWithUrl:session:", v4, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKMessageComposeViewController setMessage:](v3, "setMessage:", v12);
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[GKServiceFriendRequestViewController chatGUID](self, "chatGUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[GKServiceFriendRequestViewController chatGUID](self, "chatGUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMessageComposeViewController setChatGUID:](v3, "setChatGUID:", v15);

  }
  else
  {
    v26 = v12;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    -[GKServiceFriendRequestViewController recipients](self, "recipients");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v29 != v19)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v21, "suggestedHandle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v21, "suggestedHandle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v23);
          }
          else
          {
            +[GKUnifiedRecipient recipientForContact:](GKUnifiedRecipient, "recipientForContact:", v21);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "handle");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              objc_msgSend(v23, "handle");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v25);

            }
          }

        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v18);
    }

    -[GKMessageComposeViewController setRecipients:](v3, "setRecipients:", v13);
    v12 = v26;
  }
  v27.receiver = self;
  v27.super_class = (Class)GKServiceFriendRequestViewController;
  -[GKServiceViewController constructPrivateViewController](&v27, sel_constructPrivateViewController);

}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  v6 = a3;
  switch(a4)
  {
    case 2:
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C60]);

      objc_msgSend(MEMORY[0x1E0D25238], "reporter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = CFSTR("error");
LABEL_10:
      objc_msgSend(v13, "recordClickWithAction:targetId:targetType:pageId:pageType:", v14, v14, CFSTR("button"), CFSTR("MessageCompose"), CFSTR("inviteFriend"));
      goto LABEL_11;
    case 1:
      -[GKServiceFriendRequestViewController setMessageComposeSent:](self, "setMessageComposeSent:", 1);
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C78]);

      objc_msgSend(MEMORY[0x1E0D25238], "reporter");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v14 = CFSTR("send");
      goto LABEL_10;
    case 0:
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C40]);

      if (!-[GKServiceFriendRequestViewController messageComposeSent](self, "messageComposeSent"))
      {
        objc_msgSend(MEMORY[0x1E0D25238], "reporter");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "recordClickWithAction:targetId:targetType:pageId:pageType:", CFSTR("cancel"), CFSTR("cancel"), CFSTR("button"), CFSTR("MessageCompose"), CFSTR("inviteFriend"));

        objc_msgSend(MEMORY[0x1E0D25330], "local");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v9, "isAuthenticated") & 1) == 0)
        {
LABEL_11:

          break;
        }
        -[GKServiceFriendRequestViewController friendCode](self, "friendCode");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0D25330], "local");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          -[GKServiceFriendRequestViewController friendCode](self, "friendCode");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke;
          v17[3] = &unk_1E59C45D8;
          v17[4] = self;
          objc_msgSend(v9, "cancelFriendRequestWithIdentifier:handler:", v11, v17);

          goto LABEL_11;
        }
      }
      break;
  }
  -[GKServiceFriendRequestViewController composeController](self, "composeController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "dismissViewControllerAnimated:completion:", 1, 0);

  -[GKServiceFriendRequestViewController setComposeController:](self, "setComposeController:", 0);
}

void __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  if (v3)
  {
    if (!*MEMORY[0x1E0D25460])
      v4 = (id)GKOSLoggers();
    v5 = *MEMORY[0x1E0D25450];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25450], OS_LOG_TYPE_ERROR))
      __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke_cold_1((uint64_t)v3, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25078], *MEMORY[0x1E0D24C48]);

    objc_msgSend(*(id *)(a1 + 32), "setFriendCode:", 0);
  }

}

- (void)displayAlertWithTitle:(id)a3 andMessage:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  v6 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __73__GKServiceFriendRequestViewController_displayAlertWithTitle_andMessage___block_invoke;
  v9[3] = &unk_1E59C4708;
  v10 = v5;
  v11 = v6;
  v7 = v6;
  v8 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

void __73__GKServiceFriendRequestViewController_displayAlertWithTitle_andMessage___block_invoke(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  void *v3;
  __CFString *v4;
  CFOptionFlags v5;

  v5 = 0;
  v1 = *(const __CFString **)(a1 + 32);
  v2 = *(const __CFString **)(a1 + 40);
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFUserNotificationDisplayAlert(30.0, 0, 0, 0, 0, v1, v2, v4, 0, 0, &v5);

}

- (MFMessageComposeViewController)composeController
{
  return self->_composeController;
}

- (void)setComposeController:(id)a3
{
  objc_storeStrong((id *)&self->_composeController, a3);
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

- (BOOL)messageComposeSent
{
  return self->_messageComposeSent;
}

- (void)setMessageComposeSent:(BOOL)a3
{
  self->_messageComposeSent = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chatGUID, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_friendSupportPageURL, 0);
  objc_storeStrong((id *)&self->_friendCode, 0);
  objc_storeStrong((id *)&self->_composeController, 0);
}

void __89__GKServiceFriendRequestViewController_messageComposeViewController_didFinishWithResult___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AB361000, a2, OS_LOG_TYPE_ERROR, "cancelFriendRequest error: %@", (uint8_t *)&v2, 0xCu);
}

@end
