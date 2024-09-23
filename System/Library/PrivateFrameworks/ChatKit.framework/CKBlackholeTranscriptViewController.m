@implementation CKBlackholeTranscriptViewController

- (CKBlackholeTranscriptViewController)initWithConversation:(id)a3
{
  id v5;
  CKBlackholeTranscriptViewController *v6;
  CKBlackholeTranscriptViewController *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)CKBlackholeTranscriptViewController;
  v6 = -[CKBlackholeTranscriptViewController init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_conversation, a3);
    if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
    {
      -[CKBlackholeTranscriptViewController removeLockoutControllerIfNeeded](v7, "removeLockoutControllerIfNeeded");
      -[CKConversation chat](v7->_conversation, "chat");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = *MEMORY[0x1E0D352D8];
        objc_msgSend(v10, "removeObserver:name:object:", v7, *MEMORY[0x1E0D352D8], v9);

        objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_chatAllowedByScreenTimeChanged_, v11, v9);

        -[CKBlackholeTranscriptViewController updateScreenTimeShieldIfNeededForChat:](v7, "updateScreenTimeShieldIfNeededForChat:", v9);
      }
    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v7, sel__updateTranscriptHistory, *MEMORY[0x1E0D35328], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v7, (CFNotificationCallback)_openRestoredChatInMessagesEventReceived, (CFStringRef)*MEMORY[0x1E0D35428], v7, CFNotificationSuspensionBehaviorDeliverImmediately);

  }
  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CKBlackholeTranscriptViewController;
  -[CKBlackholeTranscriptViewController viewDidLoad](&v11, sel_viewDidLoad);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_TRANSCRIPT_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlackholeTranscriptViewController setTitle:](self, "setTitle:", v4);

  v5 = objc_alloc(MEMORY[0x1E0CEAA58]);
  -[CKBlackholeTranscriptViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v7 = (void *)objc_msgSend(v5, "initWithFrame:style:", 1);
  -[CKBlackholeTranscriptViewController setTableView:](self, "setTableView:", v7);

  -[CKBlackholeTranscriptViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("action"));

  -[CKBlackholeTranscriptViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("history"));

  -[CKBlackholeTranscriptViewController generateHeader](self, "generateHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlackholeTranscriptViewController setHeaderTextView:](self, "setHeaderTextView:", v10);

}

- (void)viewDidLayoutSubviews
{
  double v3;
  double v4;
  UITextView *headerTextView;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  -[UITextView frame](self->_headerTextView, "frame");
  v4 = v3;
  headerTextView = self->_headerTextView;
  -[CKBlackholeTranscriptViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  -[UITextView sizeThatFits:](headerTextView, "sizeThatFits:", v7, 1.79769313e308);
  v9 = v8;
  v11 = v10;

  if (v4 != v11)
  {
    -[UITextView setFrame:](self->_headerTextView, "setFrame:", 0.0, 0.0, v9, v11);
    -[CKBlackholeTranscriptViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTableHeaderView:", self->_headerTextView);

    -[CKBlackholeTranscriptViewController tableView](self, "tableView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "layoutIfNeeded");

  }
  -[CKBlackholeTranscriptViewController layoutLockoutView](self, "layoutLockoutView");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBlackholeTranscriptViewController;
  -[CKBlackholeTranscriptViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  -[CKBlackholeTranscriptViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "navigationBar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPrefersLargeTitles:", 0);

  -[CKBlackholeTranscriptViewController _updateTranscriptHistory](self, "_updateTranscriptHistory");
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addListenerID:capabilities:", CFSTR("CKSettingsMessagesController"), (*MEMORY[0x1E0D36CE0] | *MEMORY[0x1E0D36CC0]) | *MEMORY[0x1E0D36CF8]);

}

- (void)viewWillDisappear:(BOOL)a3
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKBlackholeTranscriptViewController;
  -[CKBlackholeTranscriptViewController viewWillDisappear:](&v5, sel_viewWillDisappear_, a3);
  if (-[CKBlackholeTranscriptViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    if (_IMWillLog())
    {
      -[CKBlackholeTranscriptViewController isMovingFromParentViewController](self, "isMovingFromParentViewController");
      _IMAlwaysLog();
    }
    CKRemoveDaemonListener(CFSTR("CKSettingsMessagesController"));
  }
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, (CFNotificationName)*MEMORY[0x1E0D35428], 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeTranscriptViewController;
  -[CKBlackholeTranscriptViewController dealloc](&v4, sel_dealloc);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
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
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;

  v5 = a4;
  if (!objc_msgSend(v5, "section"))
  {
    -[CKBlackholeTranscriptViewController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "dequeueReusableCellWithIdentifier:", CFSTR("history"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndex:](self->_messages, "objectAtIndex:", objc_msgSend(v5, "row"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "row") < 1)
    {
      v20 = 1;
    }
    else
    {
      -[NSMutableArray objectAtIndex:](self->_messages, "objectAtIndex:", objc_msgSend(v5, "row") - 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "handle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v17, "isEqualToString:", v18);

      v20 = v19 ^ 1u;
    }
    objc_msgSend(v7, "configureForMessageItem:showSender:", v11, v20);
    goto LABEL_13;
  }
  if (objc_msgSend(v5, "section") < 1)
  {
    v7 = (void *)objc_opt_new();
  }
  else
  {
    -[CKBlackholeTranscriptViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("action"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextAlignment:", 1);

    if (objc_msgSend(v5, "section") == 1)
    {
      objc_msgSend(v7, "textLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setColor:", v10);

      objc_msgSend(v7, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("BLACKHOLE_TRANSCRIPT_RESTORE");
LABEL_10:
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_1E276D870, CFSTR("ChatKit"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setText:", v23);

LABEL_13:
      goto LABEL_14;
    }
    if (objc_msgSend(v5, "section") == 2)
    {
      objc_msgSend(v7, "textLabel");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "setColor:", v22);

      objc_msgSend(v7, "textLabel");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      CKFrameworkBundle();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      v14 = CFSTR("BLACKHOLE_TRANSCRIPT_DELETE");
      goto LABEL_10;
    }
  }
LABEL_14:

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
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
  void *v17;
  CKConversation *conversation;
  void *v19;
  _QWORD v20[4];
  id v21;
  id location;
  _QWORD v23[5];

  v6 = a3;
  v7 = a4;
  -[CKBlackholeTranscriptViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v7, 1);

  if (objc_msgSend(v7, "section") == 1)
  {
    CKFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_RESTORE_PROMPT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertController alertControllerWithTitle:message:preferredStyle:](CKAlertController, "alertControllerWithTitle:message:preferredStyle:", v10, 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    CKFrameworkBundle();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_RESTORE_PROMPT_CONFIRM"), &stru_1E276D870, CFSTR("ChatKit"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke;
    v23[3] = &unk_1E274B0D8;
    v23[4] = self;
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v13, 0, v23);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v14);
    CKFrameworkBundle();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_RESTORE_PROMPT_CANCEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[CKAlertAction actionWithTitle:style:handler:](CKAlertAction, "actionWithTitle:style:handler:", v16, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "addAction:", v17);
    objc_msgSend(v11, "presentFromViewController:animated:completion:", self, 1, 0);

  }
  else if (objc_msgSend(v7, "section") == 2)
  {
    location = 0;
    objc_initWeak(&location, self);
    conversation = self->_conversation;
    -[CKBlackholeTranscriptViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke_2;
    v20[3] = &unk_1E274DCB8;
    objc_copyWeak(&v21, &location);
    -[CKBlackholeTranscriptViewController _confirmDeleteConversation:view:withCompletionHandler:](self, "_confirmDeleteConversation:view:withCompletionHandler:", conversation, v19, v20);

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }

}

uint64_t __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_restoreConversation");
}

void __73__CKBlackholeTranscriptViewController_tableView_didSelectRowAtIndexPath___block_invoke_2(uint64_t a1, int a2)
{
  void *v2;
  id v3;
  id WeakRetained;

  if (a2)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "navigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

  }
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0CEBC10];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return a4 > 0;
  else
    return -[NSMutableArray count](self->_messages, "count", a3);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    location = 0;
    objc_initWeak(&location, self);
    -[CKBlackholeTranscriptViewController _alertTitleForDelete](self, "_alertTitleForDelete");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke;
    v19[3] = &unk_1E274DCE0;
    v13 = v8;
    v20 = v13;
    objc_copyWeak(&v22, &location);
    v14 = v10;
    v21 = v14;
    v15[0] = v12;
    v15[1] = 3221225472;
    v15[2] = __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2;
    v15[3] = &unk_1E274DD08;
    objc_copyWeak(&v18, &location);
    v16 = v13;
    v17 = v14;
    -[UITableViewController _confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:](self, "_confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:", v9, v11, 0, v19, v15, 0);

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v22);

    objc_destroyWeak(&location);
  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }

}

void __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsSpam:", 31);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteConversation:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __93__CKBlackholeTranscriptViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_deleteConversation:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_restoreConversation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  if (_IMWillLog())
  {
    -[CKConversation chat](self->_conversation, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  -[CKConversation chat](self->_conversation, "chat", v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateIsBlackholed:", 0);

  -[CKConversation chat](self->_conversation, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "isGroupChat");

  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  if ((_DWORD)v4)
    v7 = 19;
  else
    v7 = 18;
  objc_msgSend(v6, "trackSpamEvent:", v7);

}

- (void)_openRestoredChatInMessages
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (_IMWillLog())
  {
    -[CKConversation chat](self->_conversation, "chat");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "guid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _IMAlwaysLog();

  }
  v4 = (void *)MEMORY[0x1E0C99E98];
  -[CKConversation chat](self->_conversation, "chat", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "chatIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "__im_URLForChatIdentifier:entryBody:", v6, 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "openURL:withCompletionHandler:", v9, 0);

}

- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  v6 = a3;
  -[CKBlackholeTranscriptViewController _conversationList](self, "_conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeConversation:", v6);

  -[CKBlackholeTranscriptViewController _conversationList](self, "_conversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteConversation:", v6);

  v9 = v10;
  if (v10)
  {
    (*((void (**)(id, uint64_t))v10 + 2))(v10, 1);
    v9 = v10;
  }

}

- (id)_alertTitleForDelete
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D357C0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
    v6 = CFSTR("DELETE_ALERT_MESSAGE_ON_ICLOUD");
  else
    v6 = CFSTR("DELETE_ALERT_MESSAGE");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (void)_updateTranscriptHistory
{
  NSMutableArray *v3;
  NSMutableArray *messages;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  -[CKConversation setLoadedMessageCount:loadImmediately:](self->_conversation, "setLoadedMessageCount:loadImmediately:", 50, 1);
  v3 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 50);
  messages = self->_messages;
  self->_messages = v3;

  -[CKConversation chat](self->_conversation, "chat");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CKBlackholeTranscriptViewController__updateTranscriptHistory__block_invoke;
  v8[3] = &unk_1E274DD30;
  v8[4] = self;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v8);

  -[CKBlackholeTranscriptViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

}

void __63__CKBlackholeTranscriptViewController__updateTranscriptHistory__block_invoke(uint64_t a1, void *a2)
{
  char isKindOfClass;
  void *v4;
  id v5;
  id v6;

  v6 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v4 = v6;
  if ((isKindOfClass & 1) != 0)
  {
    v5 = v6;
    if (objc_msgSend(v5, "isFinished"))
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1032), "addObject:", v5);

    v4 = v6;
  }

}

- (void)layoutLockoutView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if (-[CKBlackholeTranscriptViewController isShowingLockoutView](self, "isShowingLockoutView"))
  {
    -[CKBlackholeTranscriptViewController lockoutView](self, "lockoutView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[CKBlackholeTranscriptViewController headerTextView](self, "headerTextView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setBounds:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));

      -[CKBlackholeTranscriptViewController lockoutView](self, "lockoutView");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      objc_msgSend(v6, "setFrame:");

    }
  }
}

- (void)chatAllowedByScreenTimeChanged:(id)a3
{
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled");
  v5 = v7;
  if (v4)
  {
    objc_msgSend(v7, "object");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      -[CKBlackholeTranscriptViewController updateScreenTimeShieldIfNeededForChat:](self, "updateScreenTimeShieldIfNeededForChat:", v6);

    v5 = v7;
  }

}

- (BOOL)isChatAllowedByScreenTime:(id)a3
{
  return objc_msgSend(a3, "allowedByScreenTime");
}

- (void)updateScreenTimeShieldIfNeededForChat:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (-[CKBlackholeTranscriptViewController isChatAllowedByScreenTime:](self, "isChatAllowedByScreenTime:", v4))
      -[CKBlackholeTranscriptViewController removeLockoutControllerIfNeeded](self, "removeLockoutControllerIfNeeded");
    else
      -[CKBlackholeTranscriptViewController showScreenTimeShieldIfNeeded](self, "showScreenTimeShieldIfNeeded");
    v4 = v5;
  }

}

- (BOOL)shouldPresentBlockingDowntimeViewController
{
  return 1;
}

- (void)removeLockoutControllerIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled"))
  {
    if (-[CKBlackholeTranscriptViewController isShowingLockoutView](self, "isShowingLockoutView"))
    {
      -[CKBlackholeTranscriptViewController lockoutViewController](self, "lockoutViewController");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeFromSuperview");

      objc_msgSend(v7, "removeFromParentViewController");
      -[CKBlackholeTranscriptViewController setLockoutViewController:](self, "setLockoutViewController:", 0);
      -[CKBlackholeTranscriptViewController setLockoutView:](self, "setLockoutView:", 0);
      -[CKBlackholeTranscriptViewController generateHeader](self, "generateHeader");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController setHeaderTextView:](self, "setHeaderTextView:", v4);

      -[CKBlackholeTranscriptViewController setIsShowingLockoutView:](self, "setIsShowingLockoutView:", 0);
      -[CKBlackholeTranscriptViewController conversation](self, "conversation");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController setConversation:](self, "setConversation:", v5);

      -[CKBlackholeTranscriptViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setScrollEnabled:", 1);

      -[CKBlackholeTranscriptViewController reloadInputViews](self, "reloadInputViews");
    }
  }
}

- (void)showScreenTimeShieldIfNeeded
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
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;

  if (objc_msgSend(MEMORY[0x1E0D35808], "isContactLimitsFeatureEnabled")
    && -[CKBlackholeTranscriptViewController shouldPresentBlockingDowntimeViewController](self, "shouldPresentBlockingDowntimeViewController")&& !-[CKBlackholeTranscriptViewController isShowingLockoutView](self, "isShowingLockoutView"))
  {
    objc_msgSend(MEMORY[0x1E0D397A8], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getContactStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0)
      showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0 = MEMORY[0x193FF3C18](CFSTR("STLockoutViewController"), CFSTR("ScreenTimeUI"));
    -[CKBlackholeTranscriptViewController conversation](self, "conversation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "chat");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      IMSharedDowntimeController();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController conversation](self, "conversation");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "chat");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "conversationContextForChat:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController setConversationContext:](self, "setConversationContext:", v10);

    }
    -[CKBlackholeTranscriptViewController conversationContext](self, "conversationContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)showScreenTimeShieldIfNeeded_CKSTLockoutViewController_0;
    if (v11 && v4)
    {
      -[CKBlackholeTranscriptViewController conversationContext](self, "conversationContext");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactNameByHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lockoutViewControllerWithConversationContext:bundleIdentifier:contactStore:applicationName:contactNameByHandle:", v13, CFSTR("com.apple.MobileSMS"), v4, 0, v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[CKBlackholeTranscriptViewController _handleIDsForCurrentConversation](self, "_handleIDsForCurrentConversation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKBlackholeTranscriptViewController conversation](self, "conversation");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "contactNameByHandle");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lockoutViewControllerWithBundleIdentifier:contactsHandles:contactNameByHandle:", CFSTR("com.apple.MobileSMS"), v13, v15);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v24 = (id)v16;

    objc_msgSend(v24, "setMainButtonAlwaysHidden:", 1);
    objc_msgSend(v24, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptViewController setLockoutView:](self, "setLockoutView:", v17);

    v18 = objc_alloc_init(MEMORY[0x1E0CEAB18]);
    -[CKBlackholeTranscriptViewController setHeaderTextView:](self, "setHeaderTextView:", v18);

    -[CKBlackholeTranscriptViewController setLockoutViewController:](self, "setLockoutViewController:", v24);
    -[CKBlackholeTranscriptViewController view](self, "view");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeTranscriptViewController lockoutView](self, "lockoutView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "addSubview:", v20);

    -[CKBlackholeTranscriptViewController addChildViewController:](self, "addChildViewController:", v24);
    -[CKBlackholeTranscriptViewController setIsShowingLockoutView:](self, "setIsShowingLockoutView:", 1);
    -[CKBlackholeTranscriptViewController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setScrollEnabled:", 0);

    -[CKBlackholeTranscriptViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNeedsLayout");

    -[CKBlackholeTranscriptViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "layoutIfNeeded");

    -[CKBlackholeTranscriptViewController reloadInputViews](self, "reloadInputViews");
  }
}

- (id)_handleIDsForCurrentConversation
{
  void *v2;
  void *v3;
  void *v4;

  -[CKBlackholeTranscriptViewController conversation](self, "conversation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipients");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "__imArrayByApplyingBlock:", &__block_literal_global_35);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __71__CKBlackholeTranscriptViewController__handleIDsForCurrentConversation__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "defaultIMHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)generateHeader
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x1E0CEAB18]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v3, "setSelectable:", 0);
  objc_msgSend(v3, "setEditable:", 0);
  objc_msgSend(v3, "setAdjustsFontForContentSizeCategory:", 1);
  CKFrameworkBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_TRANSCRIPT_DESCRIPTION"), &stru_1E276D870, CFSTR("ChatKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB558]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFont:", v6);

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v7);

  objc_msgSend(v3, "setBackgroundColor:", 0);
  objc_msgSend(v3, "setTextContainerInset:", 12.0, 24.0, 12.0, 24.0);
  return v3;
}

- (CKConversation)conversation
{
  return self->_conversation;
}

- (void)setConversation:(id)a3
{
  objc_storeStrong((id *)&self->_conversation, a3);
}

- (NSMutableArray)messages
{
  return self->_messages;
}

- (void)setMessages:(id)a3
{
  objc_storeStrong((id *)&self->_messages, a3);
}

- (UITextView)headerTextView
{
  return self->_headerTextView;
}

- (void)setHeaderTextView:(id)a3
{
  objc_storeStrong((id *)&self->_headerTextView, a3);
}

- (BOOL)isShowingLockoutView
{
  return self->_isShowingLockoutView;
}

- (void)setIsShowingLockoutView:(BOOL)a3
{
  self->_isShowingLockoutView = a3;
}

- (STLockoutViewController)lockoutViewController
{
  return self->_lockoutViewController;
}

- (void)setLockoutViewController:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutViewController, a3);
}

- (STConversationContext)conversationContext
{
  return self->_conversationContext;
}

- (void)setConversationContext:(id)a3
{
  objc_storeStrong((id *)&self->_conversationContext, a3);
}

- (UIView)lockoutView
{
  return self->_lockoutView;
}

- (void)setLockoutView:(id)a3
{
  objc_storeStrong((id *)&self->_lockoutView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockoutView, 0);
  objc_storeStrong((id *)&self->_conversationContext, 0);
  objc_storeStrong((id *)&self->_lockoutViewController, 0);
  objc_storeStrong((id *)&self->_headerTextView, 0);
  objc_storeStrong((id *)&self->_messages, 0);
  objc_storeStrong((id *)&self->_conversation, 0);
}

@end
