@implementation GKFriendRequestComposeViewController

- (GKFriendRequestComposeViewController)init
{
  GKFriendRequestComposeViewController *v2;
  GKFriendRequestComposeViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GKFriendRequestComposeViewController;
  v2 = -[GKFriendRequestComposeViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[GKFriendRequestComposeViewController _setupChildViewController](v2, "_setupChildViewController");
  return v3;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)GKFriendRequestComposeViewController;
  -[GKFriendRequestComposeViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKFriendRequestComposeViewController;
  -[GKFriendRequestComposeViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[GKFriendRequestComposeViewController alertController](self, "alertController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[GKFriendRequestComposeViewController alertController](self, "alertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKFriendRequestComposeViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, &__block_literal_global_16);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GKFriendRequestComposeViewController;
  -[GKFriendRequestComposeViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[GKFriendRequestComposeViewController setViewControllers:](self, "setViewControllers:", MEMORY[0x1E0C9AA60]);
}

- (void)_setupChildViewController
{
  void *v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__GKFriendRequestComposeViewController__setupChildViewController__block_invoke;
  v4[3] = &unk_1E59C4148;
  v4[4] = self;
  -[GKFriendRequestComposeViewController _gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:](self, "_gkInGameUIUnavailableAlertWithRestrictionMode:dismissHandler:", 1, v4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKFriendRequestComposeViewController setAlertController:](self, "setAlertController:", v3);

}

uint64_t __65__GKFriendRequestComposeViewController__setupChildViewController__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(*(id *)(a1 + 32), "sendFinishedMessageToDelegateCancelled:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "setViewControllers:", MEMORY[0x1E0C9AA60]);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  uint64_t v3;
  void *v5;
  uint64_t v6;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  BOOL v13;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1 && (!*MEMORY[0x1E0D253F8] || *MEMORY[0x1E0D25B68] != 0))
    return 30;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    v10 = v9;
    v12 = v11;

    v13 = v10 < 414.0 || v12 < 736.0;
    if (!v13 || v10 >= 736.0 && v12 >= 414.0)
      return 30;
  }
  if (objc_msgSend(MEMORY[0x1E0D252C0], "isGameCenter"))
    return 2;
  return 30;
}

- (BOOL)automaticallyForwardAppearanceAndRotationMethodsToChildViewControllers
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardRotationMethods
{
  return 1;
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 1;
}

+ (NSUInteger)maxNumberOfRecipients
{
  return 3;
}

- (unsigned)rid
{
  return self->_rid;
}

- (void)setRid:(unsigned int)a3
{
  self->_rid = a3;
}

- (void)setMessage:(NSString *)message
{
  NSString *v4;
  NSString *v5;
  NSString *v6;

  v6 = message;
  if (!-[NSString isEqualToString:](self->_message, "isEqualToString:"))
  {
    v4 = (NSString *)-[NSString copy](v6, "copy");
    v5 = self->_message;
    self->_message = v4;

  }
}

- (void)prepareForNewRecipients:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  if (self->_recipientCount + objc_msgSend(v9, "count") >= 4)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("can't add more than %d recipients"), 3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/API/GKFriendRequestComposeViewController.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "lastPathComponent");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ ([additionalRecipients count] + _recipientCount <= MAX_RECIPIENTS)\n[%s (%s:%d)]"), v5, "-[GKFriendRequestComposeViewController prepareForNewRecipients:]", objc_msgSend(v7, "UTF8String"), 154);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v8);
  }
  self->_recipientCount += objc_msgSend(v9, "count");

}

- (void)sendFinishedMessageToDelegateCancelled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  NSObject *v7;

  v3 = a3;
  -[GKFriendRequestComposeViewController composeViewDelegate](self, "composeViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = *MEMORY[0x1E0D25468];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25468], OS_LOG_TYPE_DEBUG))
  {
    -[GKFriendRequestComposeViewController sendFinishedMessageToDelegateCancelled:].cold.1(v3, v7);
    if (!v3)
      goto LABEL_8;
  }
  else if (!v3)
  {
    goto LABEL_8;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "friendRequestComposeViewControllerWasCancelled:", self);
    goto LABEL_10;
  }
LABEL_8:
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "friendRequestComposeViewControllerDidFinish:", self);
LABEL_10:

}

- (id)composeViewDelegate
{
  return objc_loadWeakRetained((id *)&self->_composeViewDelegate);
}

- (void)setComposeViewDelegate:(id)composeViewDelegate
{
  objc_storeWeak((id *)&self->_composeViewDelegate, composeViewDelegate);
}

- (NSString)message
{
  return self->_message;
}

- (unint64_t)recipientCount
{
  return self->_recipientCount;
}

- (void)setRecipientCount:(unint64_t)a3
{
  self->_recipientCount = a3;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_composeViewDelegate);
}

- (void)sendFinishedMessageToDelegateCancelled:(char)a1 .cold.1(char a1, NSObject *a2)
{
  const __CFString *v2;
  int v3;
  const __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CFSTR("NO");
  if ((a1 & 1) != 0)
    v2 = CFSTR("YES");
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1AB361000, a2, OS_LOG_TYPE_DEBUG, "SEND FINISHED MESSAGE TO DELEGATE (canceled:%@)", (uint8_t *)&v3, 0xCu);
}

@end
