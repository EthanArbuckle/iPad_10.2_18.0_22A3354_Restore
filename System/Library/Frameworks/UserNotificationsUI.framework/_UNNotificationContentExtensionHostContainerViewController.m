@implementation _UNNotificationContentExtensionHostContainerViewController

- (_UNNotificationContentExtensionHostContainerViewController)initWithExtension:(id)a3 notification:(id)a4 actions:(id)a5
{
  id v9;
  id v10;
  id v11;
  _UNNotificationContentExtensionHostContainerViewController *v12;
  _UNNotificationContentExtensionHostContainerViewController *v13;
  void *v14;
  uint64_t v15;
  NSString *notificationRequestIdentifier;
  void *v17;
  void *v18;
  uint64_t v19;
  NSMutableArray *queuedNotifications;
  double v21;
  char v22;
  _UNBlockTouchesView *v23;
  uint64_t v24;
  UIView *blockingView;
  UIView *v26;
  void *v27;
  objc_super v29;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  v12 = -[_UNNotificationContentExtensionHostContainerViewController initWithNibName:bundle:](&v29, sel_initWithNibName_bundle_, 0, 0);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_extension, a3);
    objc_msgSend(v10, "request");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = objc_claimAutoreleasedReturnValue();
    notificationRequestIdentifier = v13->_notificationRequestIdentifier;
    v13->_notificationRequestIdentifier = (NSString *)v15;

    objc_msgSend(v10, "request");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "content");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13->_screenCaptureProhibited = objc_msgSend(v18, "screenCaptureProhibited");

    v19 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v10, 0);
    queuedNotifications = v13->_queuedNotifications;
    v13->_queuedNotifications = (NSMutableArray *)v19;

    objc_storeStrong((id *)&v13->_actions, a5);
    objc_msgSend(v9, "un_effectiveContentSizeRatio");
    v13->_contentSizeRatio = v21;
    v13->_defaultContentHidden = objc_msgSend(v9, "un_isDefaultContentHidden");
    v13->_defaultTitleOverridden = objc_msgSend(v9, "un_isDefaultTitleOverridden");
    v22 = objc_msgSend(v9, "un_isUserInteractionEnabled");
    v13->_userInteractionEnabled = v22;
    if ((v22 & 1) == 0)
    {
      v23 = [_UNBlockTouchesView alloc];
      v24 = -[_UNBlockTouchesView initWithFrame:](v23, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      blockingView = v13->_blockingView;
      v13->_blockingView = (UIView *)v24;

      -[UIView setAutoresizingMask:](v13->_blockingView, "setAutoresizingMask:", 18);
      v26 = v13->_blockingView;
      objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v26, "setBackgroundColor:", v27);

    }
  }

  return v13;
}

+ (BOOL)isMediaSafetyNetEnabled
{
  if (isMediaSafetyNetEnabled_onceToken != -1)
    dispatch_once(&isMediaSafetyNetEnabled_onceToken, &__block_literal_global_1);
  return isMediaSafetyNetEnabled_enabled;
}

- (void)dealloc
{
  objc_super v3;

  -[_UNNotificationContentExtensionHostContainerViewController _teardownExtension](self, "_teardownExtension");
  v3.receiver = self;
  v3.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController dealloc](&v3, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[_UNNotificationContentExtensionHostContainerViewController blockingView](self, "blockingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    objc_msgSend(v3, "setFrame:");

    -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addSubview:", v3);

  }
  if (self->_defaultTitleOverridden)
    -[_UNNotificationContentExtensionHostContainerViewController setTitle:](self, "setTitle:", 0);
  -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "nc_setScreenCaptureProhibited:", self->_screenCaptureProhibited);

}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewWillAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
  -[_UNNotificationContentExtensionHostContainerViewController _loadExtensionViewController](self, "_loadExtensionViewController");
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewDidAppear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController viewDidAppear:](&v6, sel_viewDidAppear_, v3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewWillDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  objc_super v6;
  uint8_t buf[4];
  const char *v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  v5 = UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v8 = "-[_UNNotificationContentExtensionHostContainerViewController viewDidDisappear:]";
    _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, v3);
}

- (void)setTitle:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController setTitle:](&v5, sel_setTitle_, a3);
  -[_UNNotificationContentExtensionHostContainerViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "extensionViewControllerDidUpdateTitle:", self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UNNotificationContentExtensionHostContainerViewController;
  -[_UNNotificationContentExtensionHostContainerViewController preferredContentSizeDidChangeForChildContentContainer:](&v12, sel_preferredContentSizeDidChangeForChildContentContainer_, v4);
  -[_UNNotificationContentExtensionHostContainerViewController preferredContentSize](self, "preferredContentSize");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "preferredContentSize");
  if (v6 != v10 || v8 != v9)
  {
    objc_msgSend(v4, "preferredContentSize");
    -[_UNNotificationContentExtensionHostContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }

}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double width;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v12;
  double v13;
  double v14;
  CGSize result;

  width = a4.width;
  -[_UNNotificationContentExtensionHostContainerViewController extensionViewController](self, "extensionViewController", a3, a4.width, a4.height);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSize");
  v8 = v7;
  v10 = v9;

  if (v8 == *MEMORY[0x24BDBF148] && v10 == *(double *)(MEMORY[0x24BDBF148] + 8))
  {
    -[_UNNotificationContentExtensionHostContainerViewController _contentHeightForWidth:](self, "_contentHeightForWidth:", width);
    v10 = v12;
  }
  v13 = width;
  v14 = v10;
  result.height = v14;
  result.width = v13;
  return result;
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  void *v4;
  char v5;

  -[_UNNotificationContentExtensionHostContainerViewController extensionViewController](self, "extensionViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "canBecomeFirstResponder"))
  {
    -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "wantsToBecomeFirstResponder");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)becomeFirstResponder
{
  void *v2;
  char v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionViewController](self, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "becomeFirstResponder");

  return v3;
}

- (BOOL)canResignFirstResponder
{
  void *v2;
  char v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionViewController](self, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "canResignFirstResponder");

  return v3;
}

- (BOOL)resignFirstResponder
{
  void *v2;
  char v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionViewController](self, "extensionViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "resignFirstResponder");

  return v3;
}

- (void)didReceiveNotification:(id)a3
{
  _UNNotificationContentExtensionHostContainerViewController *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[_UNNotificationContentExtensionHostContainerViewController queuedNotifications](v4, "queuedNotifications");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v7);

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](v4, "extensionHostContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    -[_UNNotificationContentExtensionHostContainerViewController _flushQueuedRequests](v4, "_flushQueuedRequests");
  objc_sync_exit(v4);

}

- (void)didReceiveNotificationResponse:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *log;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)UNLogExtensionsHost;
  if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
  {
    log = v8;
    objc_msgSend(v6, "actionIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "notification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "request");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "un_logDigest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationContentExtensionHostContainerViewController extension](self, "extension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v19 = v16;
    v20 = 2114;
    v21 = v12;
    v22 = 2114;
    v23 = v14;
    _os_log_impl(&dword_216870000, log, OS_LOG_TYPE_DEFAULT, "Sending action %{public}@ for notification %{public}@ to extension %{public}@", buf, 0x20u);

  }
  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "didReceiveNotificationResponse:completionHandler:", v6, v7);

}

- (void)preserveInputViews
{
  void *v3;
  int v4;
  id v5;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsToBecomeFirstResponder");

  if (v4)
  {
    -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preserveInputViews");

  }
}

- (BOOL)restoreInputViews
{
  void *v3;
  int v4;
  void *v5;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "wantsToBecomeFirstResponder");

  if (v4)
  {
    -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "restoreInputViews");

  }
  return v4;
}

- (BOOL)extensionWantsToReceiveActionResponses
{
  void *v2;
  char v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "wantsToReceiveActionResponses");

  return v3;
}

- (NSString)extensionIdentifier
{
  void *v2;
  void *v3;

  -[_UNNotificationContentExtensionHostContainerViewController extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)playMedia
{
  void *v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UNNotificationContentExtensionHostContainerViewController _playMediaIfPresented](self, "_playMediaIfPresented");
  else
    -[_UNNotificationContentExtensionHostContainerViewController setShouldPlayMediaAfterPresented:](self, "setShouldPlayMediaAfterPresented:", 1);
}

- (void)pauseMedia
{
  void *v3;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    -[_UNNotificationContentExtensionHostContainerViewController _pauseMediaIfPresented](self, "_pauseMediaIfPresented");
  else
    -[_UNNotificationContentExtensionHostContainerViewController setShouldPlayMediaAfterPresented:](self, "setShouldPlayMediaAfterPresented:", 0);
}

- (id)cancelTouchesForCurrentEventInExtension
{
  return -[_UIRemoteViewController _cancelTouchesForCurrentEventInHostedContent](self->_extensionViewController, "_cancelTouchesForCurrentEventInHostedContent");
}

- (void)notificationExtension:(id)a3 didUpdateTitle:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a4;
  if (-[_UNNotificationContentExtensionHostContainerViewController isDefaultTitleOverridden](self, "isDefaultTitleOverridden"))
  {
    if (objc_msgSend(v7, "length"))
    {
      -[_UNNotificationContentExtensionHostContainerViewController title](self, "title");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v7, "isEqual:", v5);

      if ((v6 & 1) == 0)
        -[_UNNotificationContentExtensionHostContainerViewController setTitle:](self, "setTitle:", v7);
    }
  }

}

- (void)notificationExtension:(id)a3 didUpdateNotificationActions:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a4;
  -[_UNNotificationContentExtensionHostContainerViewController actions](self, "actions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToArray:", v9);

  v7 = v9;
  if ((v6 & 1) == 0)
  {
    -[_UNNotificationContentExtensionHostContainerViewController setActions:](self, "setActions:", v9);
    -[_UNNotificationContentExtensionHostContainerViewController delegate](self, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "extensionViewControllerDidUpdateActions:", self);

    v7 = v9;
  }

}

- (void)notificationExtensionMediaPlayingDidStart:(id)a3
{
  void *v4;
  id v5;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateMediaPlayPauseButton");

  -[_UNNotificationContentExtensionHostContainerViewController mediaPlayPauseButton](self, "mediaPlayPauseButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 1);

}

- (void)notificationExtensionMediaPlayingDidPause:(id)a3
{
  void *v4;
  id v5;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateMediaPlayPauseButton");

  -[_UNNotificationContentExtensionHostContainerViewController mediaPlayPauseButton](self, "mediaPlayPauseButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSelected:", 0);

}

- (void)notificationExtensionRequestsDefaultAction:(id)a3
{
  id v4;

  -[_UNNotificationContentExtensionHostContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "extensionViewControllerRequestsDefaultAction:", self);

}

- (void)notificationExtensionRequestsDismiss:(id)a3
{
  id v4;

  -[_UNNotificationContentExtensionHostContainerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "extensionViewControllerRequestsDismiss:", self);

}

- (void)_playMediaIfPresented
{
  id v2;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaPlay");

}

- (void)_pauseMediaIfPresented
{
  id v2;

  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "mediaPause");

}

- (void)_flushQueuedRequests
{
  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_0_0(&dword_216870000, a4, a3, "Received unexpected notification for section %{public}@ while displaying notification for extension %{public}@", (uint8_t *)a3);

}

- (void)_setupMediaButton
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_216870000, log, OS_LOG_TYPE_ERROR, "Got an invalid type for the media button", v1, 2u);
}

- (void)_mediaPlayPauseButtonTapped:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "isSelected");
  -[_UNNotificationContentExtensionHostContainerViewController extensionHostContext](self, "extensionHostContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "mediaPause");
  else
    objc_msgSend(v5, "mediaPlay");

  objc_msgSend(v7, "setSelected:", objc_msgSend(v7, "isSelected") ^ 1);
}

- (void)_setupExtensionViewController:(id)a3
{
  id v4;
  _UNNotificationContentExtensionHostContainerViewController *v5;
  int v6;
  void *v7;
  NSString *notificationRequestIdentifier;
  NSObject *v9;
  void *v10;
  double v11;
  double v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "parentViewController");
  v5 = (_UNNotificationContentExtensionHostContainerViewController *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UNNotificationContentExtensionHostContainerViewController isViewLoaded](self, "isViewLoaded");
  if (v4 && v6 && v5 != self)
  {
    v7 = (void *)UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      notificationRequestIdentifier = self->_notificationRequestIdentifier;
      v9 = v7;
      -[NSString un_logDigest](notificationRequestIdentifier, "un_logDigest");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v10;
      _os_log_impl(&dword_216870000, v9, OS_LOG_TYPE_DEFAULT, "Setting up extension view controller for notification %{public}@", (uint8_t *)&v14, 0xCu);

    }
    objc_msgSend(v4, "setServiceViewShouldShareTouchesWithHost:", 1);
    objc_msgSend(v4, "preferredContentSize");
    if (v12 != *MEMORY[0x24BDBF148] || v11 != *(double *)(MEMORY[0x24BDBF148] + 8))
      -[_UNNotificationContentExtensionHostContainerViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    if (v5)
    {
      objc_msgSend(v4, "willMoveToParentViewController:", 0);
      objc_msgSend(v4, "removeFromParentViewController");
    }
    objc_msgSend(v4, "setInheritsSecurity:", 1);
    -[_UNNotificationContentExtensionHostContainerViewController addChildViewController:](self, "addChildViewController:", v4);
    if ((-[_UNNotificationContentExtensionHostContainerViewController _appearState](self, "_appearState") == 1
       || -[_UNNotificationContentExtensionHostContainerViewController _appearState](self, "_appearState") == 2)
      && objc_msgSend(v4, "_appearState") != 1
      && objc_msgSend(v4, "_appearState") != 2)
    {
      objc_msgSend(v4, "beginAppearanceTransition:animated:", 1, 0);
      -[_UNNotificationContentExtensionHostContainerViewController _addExtensionViewFromViewController:](self, "_addExtensionViewFromViewController:", v4);
      objc_msgSend(v4, "didMoveToParentViewController:", self);
      if (objc_msgSend(v4, "_appearState") == 1)
        objc_msgSend(v4, "endAppearanceTransition");
    }
    else
    {
      -[_UNNotificationContentExtensionHostContainerViewController _addExtensionViewFromViewController:](self, "_addExtensionViewFromViewController:", v4);
      objc_msgSend(v4, "didMoveToParentViewController:", self);
    }
    -[_UNNotificationContentExtensionHostContainerViewController _flushQueuedRequests](self, "_flushQueuedRequests");
    if (-[_UNNotificationContentExtensionHostContainerViewController shouldPlayMediaAfterPresented](self, "shouldPlayMediaAfterPresented"))
    {
      -[_UNNotificationContentExtensionHostContainerViewController _playMediaIfPresented](self, "_playMediaIfPresented");
    }
  }

}

- (void)_teardownExtension
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(a1 + 992);
  v3 = a2;
  objc_msgSend(v2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_216870000, v3, OS_LOG_TYPE_ERROR, "Killing the process of a remote view controller that failed to load, %@", (uint8_t *)&v5, 0xCu);

}

- (void)_addExtensionViewFromViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  objc_msgSend(a3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAutoresizingMask:", 18);
  -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  objc_msgSend(v4, "setFrame:");

  -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v4);

  -[_UNNotificationContentExtensionHostContainerViewController blockingView](self, "blockingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[_UNNotificationContentExtensionHostContainerViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationContentExtensionHostContainerViewController blockingView](self, "blockingView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "insertSubview:belowSubview:", v4, v9);

  }
  objc_msgSend(v4, "setAlpha:", 0.0);
  v10 = (void *)MEMORY[0x24BDF6F90];
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __98___UNNotificationContentExtensionHostContainerViewController__addExtensionViewFromViewController___block_invoke;
  v12[3] = &unk_24D5BB060;
  v13 = v4;
  v11 = v4;
  objc_msgSend(v10, "animateWithDuration:delay:options:animations:completion:", 4, v12, 0, 0.25, 0.0);

}

- (void)_loadExtensionViewController
{
  NSString *v3;
  _UIRemoteViewController *v4;
  NSObject *v5;
  _UIRemoteViewController *extensionViewController;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _UIRemoteViewController *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _UIRemoteViewController *v20;
  id v21;
  NSString *v22;
  id v23;
  id location;
  id v25;
  uint8_t buf[4];
  _UIRemoteViewController *v27;
  __int16 v28;
  _UIRemoteViewController *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v3 = self->_notificationRequestIdentifier;
  -[NSString un_logDigest](v3, "un_logDigest");
  v4 = (_UIRemoteViewController *)objc_claimAutoreleasedReturnValue();
  if (self->_extensionViewController)
  {
    v5 = UNLogExtensionsHost;
    if (os_log_type_enabled((os_log_t)UNLogExtensionsHost, OS_LOG_TYPE_DEFAULT))
    {
      extensionViewController = self->_extensionViewController;
      *(_DWORD *)buf = 138543618;
      v27 = v4;
      v28 = 2114;
      v29 = extensionViewController;
      _os_log_impl(&dword_216870000, v5, OS_LOG_TYPE_DEFAULT, "Already have extension view controller for notification request %{public}@: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    -[_UNNotificationContentExtensionHostContainerViewController actions](self, "actions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v7, 1, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_setSafeObject:forKey:", v8, CFSTR("actions"));
    v10 = objc_alloc_init(MEMORY[0x24BDD1560]);
    objc_msgSend(v10, "setUserInfo:", v9);
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UNNotificationContentExtensionHostContainerViewController extension](self, "extension");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v13 = (id)UNLogExtensionsHost;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v12, "identifier");
      v14 = (_UIRemoteViewController *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v14;
      v28 = 2114;
      v29 = v4;
      _os_log_impl(&dword_216870000, v13, OS_LOG_TYPE_DEFAULT, "Loading host view controller from extension %{public}@ for notification request %{public}@", buf, 0x16u);

    }
    v25 = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v25, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __90___UNNotificationContentExtensionHostContainerViewController__loadExtensionViewController__block_invoke;
    v18[3] = &unk_24D5BB088;
    objc_copyWeak(&v23, &location);
    v16 = v12;
    v19 = v16;
    v20 = v4;
    v17 = v11;
    v21 = v17;
    v22 = v3;
    objc_msgSend(v16, "instantiateViewControllerWithInputItems:connectionHandler:", v15, v18);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

- (double)_contentHeightForWidth:(double)a3
{
  return self->_contentSizeRatio * a3;
}

- (_UNNotificationContentExtensionHostContainerViewControllerDelegate)delegate
{
  return (_UNNotificationContentExtensionHostContainerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)actions
{
  return self->_actions;
}

- (void)setActions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 984);
}

- (BOOL)isDefaultContentHidden
{
  return self->_defaultContentHidden;
}

- (void)setDefaultContentHidden:(BOOL)a3
{
  self->_defaultContentHidden = a3;
}

- (BOOL)isDefaultTitleOverridden
{
  return self->_defaultTitleOverridden;
}

- (void)setDefaultTitleOverridden:(BOOL)a3
{
  self->_defaultTitleOverridden = a3;
}

- (BOOL)isUserInteractionEnabled
{
  return self->_userInteractionEnabled;
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  self->_userInteractionEnabled = a3;
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (double)contentSizeRatio
{
  return self->_contentSizeRatio;
}

- (void)setContentSizeRatio:(double)a3
{
  self->_contentSizeRatio = a3;
}

- (NSString)notificationRequestIdentifier
{
  return self->_notificationRequestIdentifier;
}

- (void)setNotificationRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1008);
}

- (BOOL)screenCaptureProhibited
{
  return self->_screenCaptureProhibited;
}

- (void)setScreenCaptureProhibited:(BOOL)a3
{
  self->_screenCaptureProhibited = a3;
}

- (_UIRemoteViewController)extensionViewController
{
  return self->_extensionViewController;
}

- (void)setExtensionViewController:(id)a3
{
  objc_storeStrong((id *)&self->_extensionViewController, a3);
}

- (_UNNotificationContentExtensionHostContext)extensionHostContext
{
  return self->_extensionHostContext;
}

- (void)setExtensionHostContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionHostContext, a3);
}

- (UIView)blockingView
{
  return self->_blockingView;
}

- (void)setBlockingView:(id)a3
{
  objc_storeStrong((id *)&self->_blockingView, a3);
}

- (_UNMediaPlayPauseButton)mediaPlayPauseButton
{
  return self->_mediaPlayPauseButton;
}

- (void)setMediaPlayPauseButton:(id)a3
{
  objc_storeStrong((id *)&self->_mediaPlayPauseButton, a3);
}

- (BOOL)allowManualDismiss
{
  return self->_allowManualDismiss;
}

- (void)setAllowManualDismiss:(BOOL)a3
{
  self->_allowManualDismiss = a3;
}

- (NSMutableArray)queuedNotifications
{
  return self->_queuedNotifications;
}

- (void)setQueuedNotifications:(id)a3
{
  objc_storeStrong((id *)&self->_queuedNotifications, a3);
}

- (BOOL)shouldPlayMediaAfterPresented
{
  return self->_shouldPlayMediaAfterPresented;
}

- (void)setShouldPlayMediaAfterPresented:(BOOL)a3
{
  self->_shouldPlayMediaAfterPresented = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedNotifications, 0);
  objc_storeStrong((id *)&self->_mediaPlayPauseButton, 0);
  objc_storeStrong((id *)&self->_blockingView, 0);
  objc_storeStrong((id *)&self->_extensionHostContext, 0);
  objc_storeStrong((id *)&self->_extensionViewController, 0);
  objc_storeStrong((id *)&self->_notificationRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (uint64_t)_teardownExtension
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[_UNNotificationContentExtensionHostContainerViewController _teardownExtension].cold.2(v0);
}

@end
