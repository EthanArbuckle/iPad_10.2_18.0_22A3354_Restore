@implementation CKNotificationContentViewController

+ (void)initialize
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v2, OS_LOG_TYPE_INFO, "Intializing notification view controller", v4, 2u);
    }

  }
  dispatch_get_global_queue(2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v3, &__block_literal_global_275);

  dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_25);
}

uint64_t __49__CKNotificationContentViewController_initialize__block_invoke()
{
  uint64_t result;

  result = IMSharedHelperIsOlderDevice();
  if ((result & 1) == 0)
    return (uint64_t)(id)objc_msgSend(MEMORY[0x1E0D35770], "sharedInstance");
  return result;
}

uint64_t __49__CKNotificationContentViewController_initialize__block_invoke_2()
{
  +[CKNotificationChatController initialize](CKNotificationChatController, "initialize");
  return +[CKMessageEntryView initialize](CKMessageEntryView, "initialize");
}

+ (void)connectIfNeeded
{
  if (connectIfNeeded_token != -1)
    dispatch_once(&connectIfNeeded_token, &__block_literal_global_28_0);
}

void __54__CKNotificationContentViewController_connectIfNeeded__block_invoke()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
  objc_msgSend(v0, "startTimingForKey:", CFSTR("longlook-imagent-connection"));
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "addListenerID:capabilities:", CFSTR("MessagesNotificationExtension"), CKListenerPaginatedChatRegistryCapabilities());

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blockUntilConnected");

  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setBlocksConnectionAtResume:", 1);

  +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHUDStyle:", 2);

  objc_msgSend(v0, "stopTimingForKey:", CFSTR("longlook-imagent-connection"));
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 138412290;
      v7 = v0;
      _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Initialized IMAgent connection from long look notification: %@", (uint8_t *)&v6, 0xCu);
    }

  }
}

- (CKNotificationContentViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CKNotificationContentViewController *v4;
  CKNotificationContentViewController *v5;
  void *v6;
  dispatch_time_t v7;
  void *v8;
  int v9;
  id v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CKNotificationContentViewController;
  v4 = -[CKNotificationContentViewController initWithNibName:bundle:](&v12, sel_initWithNibName_bundle_, a3, a4);
  v5 = v4;
  if (v4)
  {
    -[CKNotificationContentViewController setCanUpdateContentExtensionSize:](v4, "setCanUpdateContentExtensionSize:", 1);
    objc_msgSend((id)objc_opt_class(), "connectIfNeeded");
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__displayNameUpdatedNotification_, *MEMORY[0x1E0D352F0], 0);
    v7 = dispatch_time(0, 0);
    dispatch_after(v7, MEMORY[0x1E0C80D38], &__block_literal_global_39_1);
    objc_msgSend(MEMORY[0x1E0D36A50], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isInternalInstall");

    if (v9)
    {
      objc_msgSend(v6, "addObserver:selector:name:object:", v5, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);
      v10 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
      objc_msgSend(v10, "startTimingForKey:", CFSTR("longlook-launch-to-keyboard"));
      -[CKNotificationContentViewController setLaunchTokeyboardBringUpTC:](v5, "setLaunchTokeyboardBringUpTC:", v10);

    }
  }
  return v5;
}

void __62__CKNotificationContentViewController_initWithNibName_bundle___block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_forceSuspended");

  objc_msgSend(MEMORY[0x1E0D36AD0], "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_forceResumed");

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController dealloc](&v4, sel_dealloc);
}

- (void)_displayNameUpdatedNotification:(id)a3
{
  CKConversation *v4;
  id v5;

  objc_msgSend(a3, "object");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v5);
  if (v4)
    -[CKNotificationContentViewController updateNotificationTitleFromConversation:](self, "updateNotificationTitleFromConversation:", v4);

}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController didReceiveMemoryWarning](&v2, sel_didReceiveMemoryWarning);
}

- (BOOL)canBecomeFirstResponder
{
  void *v2;
  char v3;

  -[CKNotificationContentViewController chatController](self, "chatController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldDisplayTextEntry");

  return v3;
}

- (void)viewDidLoad
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController viewDidLoad](&v2, sel_viewDidLoad);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setupAudioAccessoryViewForNotification:(id)a3
{
  id v4;
  NSObject *v5;
  CKNotificationAudioViewController *v6;
  CKNotificationAudioViewController *audioController;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_audioController)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_18DFCD000, v5, OS_LOG_TYPE_INFO, "Creating audio view controller", (uint8_t *)&v13, 2u);
      }

    }
    v6 = -[CKNotificationAudioViewController initWithNibName:bundle:]([CKNotificationAudioViewController alloc], "initWithNibName:bundle:", 0, 0);
    audioController = self->_audioController;
    self->_audioController = v6;

  }
  objc_msgSend(v4, "request");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "content");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("CKBBContextKeyMessageGUID"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v11;
      _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "Setup audio view controller for message: %@", (uint8_t *)&v13, 0xCu);
    }

  }
  -[CKNotificationAudioViewController loadMessage:](self->_audioController, "loadMessage:", v11);

}

- (void)updateContentExtensionSize
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t v16;
  NSSize v17;

  v16 = *MEMORY[0x1E0C80C00];
  if (-[CKNotificationContentViewController canUpdateContentExtensionSize](self, "canUpdateContentExtensionSize"))
  {
    -[CKNotificationContentViewController chatController](self, "chatController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "collectionView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "__ck_contentSize");
    v6 = v5;
    v8 = v7;

    -[CKNotificationContentViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10;

    if (v8 > v11)
      -[CKNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6, v8);
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        -[CKNotificationContentViewController preferredContentSize](self, "preferredContentSize");
        NSStringFromSize(v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v13;
        _os_log_impl(&dword_18DFCD000, v12, OS_LOG_TYPE_INFO, "updated content extension size: %@", (uint8_t *)&v14, 0xCu);

      }
    }
  }
}

- (void)mediaPlay
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Media play", v4, 2u);
    }

  }
  -[CKNotificationAudioViewController playOrPauseAudioMessage](self->_audioController, "playOrPauseAudioMessage");
}

- (void)mediaPause
{
  NSObject *v3;
  uint8_t v4[16];

  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "Media pause", v4, 2u);
    }

  }
  -[CKNotificationAudioViewController playOrPauseAudioMessage](self->_audioController, "playOrPauseAudioMessage");
}

- (void)updateNotificationTitleFromConversation:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(v9, "displayName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v9, "displayName");
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v5;
    -[CKNotificationContentViewController setTitle:](self, "setTitle:", v5);

    v7 = v9;
    goto LABEL_6;
  }
  objc_msgSend(v9, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = v9;
  if (v6)
  {
    objc_msgSend(v9, "name");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

- (void)_keyboardDidShow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKNotificationContentViewController launchTokeyboardBringUpTC](self, "launchTokeyboardBringUpTC");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[CKNotificationContentViewController launchTokeyboardBringUpTC](self, "launchTokeyboardBringUpTC");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stopTimingForKey:", CFSTR("longlook-launch-to-keyboard"));

    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        -[CKNotificationContentViewController launchTokeyboardBringUpTC](self, "launchTokeyboardBringUpTC");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138412290;
        v11 = v8;
        _os_log_impl(&dword_18DFCD000, v7, OS_LOG_TYPE_INFO, "From launch to keyboard bring up %@", (uint8_t *)&v10, 0xCu);

      }
    }
    -[CKNotificationContentViewController setLaunchTokeyboardBringUpTC:](self, "setLaunchTokeyboardBringUpTC:", 0);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB828], 0);

  }
}

- (void)didReceiveNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  CKConversation *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[CKNotificationContentViewController setNotification:](self, "setNotification:", v4);
  -[CKNotificationContentViewController setupAudioAccessoryViewForNotification:](self, "setupAudioAccessoryViewForNotification:", v4);
  if (objc_msgSend(MEMORY[0x1E0CEC7A0], "supportsContentExtensions"))
  {
    -[CKNotificationContentViewController chatController](self, "chatController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      objc_msgSend(v4, "request");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "content");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "threadIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (IMOSLoggingEnabled())
      {
        OSLogHandleForIMFoundationCategory();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          v15 = 138412290;
          v16 = v8;
          _os_log_impl(&dword_18DFCD000, v9, OS_LOG_TYPE_INFO, "Creating chat controller for identifier: %@", (uint8_t *)&v15, 0xCu);
        }

      }
      objc_msgSend(MEMORY[0x1E0D35798], "sharedRegistry");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "existingChatWithChatIdentifier:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = -[CKConversation initWithChat:]([CKConversation alloc], "initWithChat:", v11);
      -[CKNotificationContentViewController updateNotificationTitleFromConversation:](self, "updateNotificationTitleFromConversation:", v12);
      objc_msgSend(v11, "setNumberOfMessagesToKeepLoaded:", 0);
      objc_msgSend(v11, "clear");
      if (CKIsScreenLocked())
      {
        -[CKConversation setLoadedMessageCount:loadImmediately:](v12, "setLoadedMessageCount:loadImmediately:", 5, 0);
        objc_msgSend(v4, "request");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "identifier");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKConversation loadAllUnreadMessagesUpToMessageGUID:](v12, "loadAllUnreadMessagesUpToMessageGUID:", v14);

      }
      else
      {
        -[CKConversation setLoadedMessageCount:](v12, "setLoadedMessageCount:", 5);
      }
      -[CKNotificationContentViewController setupChatControllerForConversation:](self, "setupChatControllerForConversation:", v12);

    }
    -[CKNotificationContentViewController grabFocus](self, "grabFocus");
  }

}

- (void)setupChatControllerForConversation:(id)a3
{
  CKNotificationChatController *v4;
  void *v5;
  CKNotificationChatController *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  -[CKNotificationContentViewController chatController](self, "chatController");
  if (objc_claimAutoreleasedReturnValue())
    -[CKNotificationContentViewController setupChatControllerForConversation:].cold.1();
  v4 = [CKNotificationChatController alloc];
  -[CKNotificationContentViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[CKNotificationChatController initWithConversation:entryViewTraitCollection:](v4, "initWithConversation:entryViewTraitCollection:", v15, v5);

  -[CKCoreChatController setDelegate:](v6, "setDelegate:", self);
  objc_msgSend(MEMORY[0x1E0CEAC18], "keyWindow");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "windowScene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_enhancedWindowingEnabled");

  if ((v9 & 1) == 0)
    -[CKScrollViewController beginHoldingScrollGeometryUpdatesForReason:](v6, "beginHoldingScrollGeometryUpdatesForReason:", CFSTR("NotificationChatControllerFixedLayout"));
  -[CKNotificationChatController view](v6, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationContentViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  objc_msgSend(v10, "setFrame:");

  -[CKNotificationContentViewController extensionContext](self, "extensionContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController setUrlOpenContext:](v6, "setUrlOpenContext:", v12);

  -[CKNotificationContentViewController addChildViewController:](self, "addChildViewController:", v6);
  -[CKNotificationContentViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKNotificationChatController view](v6, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v14);

  -[CKNotificationChatController didMoveToParentViewController:](v6, "didMoveToParentViewController:", self);
  -[CKNotificationContentViewController setChatController:](self, "setChatController:", v6);

}

- (void)viewWillAppear:(BOOL)a3
{
  NSObject *v3;
  uint8_t v4[16];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController viewWillAppear:](&v5, sel_viewWillAppear_, a3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18DFCD000, v3, OS_LOG_TYPE_INFO, "CKNotificationContentViewController viewWillAppear", v4, 2u);
    }

  }
  +[CKApplicationState setActive:](CKApplicationState, "setActive:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController viewDidAppear:](&v8, sel_viewDidAppear_, a3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "CKNotificationContentViewController didAppear", v7, 2u);
    }

  }
  -[CKNotificationContentViewController chatController](self, "chatController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    -[CKNotificationContentViewController updateContentExtensionSize](self, "updateContentExtensionSize");
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setShouldStopWhenBackgrounded:", 0);

  -[CKNotificationContentViewController grabFocus](self, "grabFocus");
}

- (void)grabFocus
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  -[CKNotificationContentViewController chatController](self, "chatController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0D36AE8]);
    objc_msgSend(v4, "startTimingForKey:", CFSTR("longlook-becomeFirstResponder"));
    -[CKNotificationContentViewController chatController](self, "chatController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setHidden:", 0);

    -[CKNotificationContentViewController chatController](self, "chatController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "becomeFirstResponder");

    objc_msgSend(v4, "stopTimingForKey:", CFSTR("longlook-becomeFirstResponder"));
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = 138412290;
        v10 = v4;
        _os_log_impl(&dword_18DFCD000, v8, OS_LOG_TYPE_INFO, "Called becomeFirstResponder in long look notification %@", (uint8_t *)&v9, 0xCu);
      }

    }
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  NSObject *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  if (IMOSLoggingEnabled())
  {
    OSLogHandleForIMFoundationCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18DFCD000, v4, OS_LOG_TYPE_INFO, "CKNotificationContentViewController willDisappear", buf, 2u);
    }

  }
  +[CKImageAnimationTimer sharedTimer](CKImageAnimationTimer, "sharedTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setShouldStopWhenBackgrounded:", 1);

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__CKNotificationContentViewController_viewWillDisappear___block_invoke;
  v6[3] = &unk_1E274A208;
  v6[4] = self;
  objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v6, 0.25);
}

void __57__CKNotificationContentViewController_viewWillDisappear___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "chatController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entryView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setHidden:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKNotificationContentViewController;
  -[CKNotificationContentViewController viewDidDisappear:](&v3, sel_viewDidDisappear_, a3);
  +[CKApplicationState setActive:](CKApplicationState, "setActive:", 0);
}

- (void)chatController:(id)a3 willSendComposition:(id)a4 inConversation:(id)a5
{
  -[CKNotificationContentViewController setCanUpdateContentExtensionSize:](self, "setCanUpdateContentExtensionSize:", 0, a4, a5);
}

- (void)chatController:(id)a3 didSendCompositionInConversation:(id)a4
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __87__CKNotificationContentViewController_chatController_didSendCompositionInConversation___block_invoke;
  block[3] = &unk_1E274A208;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __87__CKNotificationContentViewController_chatController_didSendCompositionInConversation___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCanUpdateContentExtensionSize:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "updateContentExtensionSize");
}

- (UIEdgeInsets)initialSystemMinimumLayoutMarginsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (UIEdgeInsets)initialSafeAreaInsetsForChatController:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  v3 = *MEMORY[0x1E0CEB4B0];
  v4 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
  v5 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
  v6 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v3;
  return result;
}

- (void)transcriptBackgroundTapped:(id)a3
{
  id v3;

  -[CKNotificationContentViewController extensionContext](self, "extensionContext", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performNotificationDefaultAction");

}

- (void)notificationChatControllerRequestDismissNotificationContentExtension:(id)a3
{
  id v3;

  -[CKNotificationContentViewController extensionContext](self, "extensionContext", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissNotificationContentExtension");

}

- (CKNotificationAudioViewController)audioController
{
  return self->_audioController;
}

- (void)setAudioController:(id)a3
{
  objc_storeStrong((id *)&self->_audioController, a3);
}

- (UNNotification)notification
{
  return self->_notification;
}

- (void)setNotification:(id)a3
{
  objc_storeStrong((id *)&self->_notification, a3);
}

- (CKNotificationChatController)chatController
{
  return self->_chatController;
}

- (void)setChatController:(id)a3
{
  objc_storeStrong((id *)&self->_chatController, a3);
}

- (IMTimingCollection)launchTokeyboardBringUpTC
{
  return self->_launchTokeyboardBringUpTC;
}

- (void)setLaunchTokeyboardBringUpTC:(id)a3
{
  objc_storeStrong((id *)&self->_launchTokeyboardBringUpTC, a3);
}

- (BOOL)canUpdateContentExtensionSize
{
  return self->_canUpdateContentExtensionSize;
}

- (void)setCanUpdateContentExtensionSize:(BOOL)a3
{
  self->_canUpdateContentExtensionSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchTokeyboardBringUpTC, 0);
  objc_storeStrong((id *)&self->_chatController, 0);
  objc_storeStrong((id *)&self->_notification, 0);
  objc_storeStrong((id *)&self->_audioController, 0);
}

- (void)setupChatControllerForConversation:.cold.1()
{
  __assert_rtn("-[CKNotificationContentViewController setupChatControllerForConversation:]", "CKNotificationContentViewController.m", 242, "self.chatController == nil");
}

@end
