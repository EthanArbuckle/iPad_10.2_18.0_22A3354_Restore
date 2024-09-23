@implementation CKBlackholeConversationListCommonViewController

- (CKBlackholeConversationListCommonViewController)init
{
  CKBlackholeConversationListCommonViewController *v2;
  void *v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  CKScheduledUpdater *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKBlackholeConversationListCommonViewController;
  v2 = -[CKBlackholeConversationListCommonViewController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, CFSTR("CKConversationListFinishedLoadingNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, CFSTR("CKConversationListChangedNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, CFSTR("CKConversationListConversationLeftNotification"), 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D35328], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D35440], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D354C0], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D35498], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D35490], 0);
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__updateConversationList, *MEMORY[0x1E0D354C8], 0);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_popToConversationListOnRestore, (CFStringRef)*MEMORY[0x1E0D35428], v2, CFNotificationSuspensionBehaviorDeliverImmediately);
    v5 = -[CKScheduledUpdater initWithTarget:action:]([CKScheduledUpdater alloc], "initWithTarget:action:", v2, sel__updateConversationList);
    -[CKBlackholeConversationListCommonViewController setUpdater:](v2, "setUpdater:", v5);

  }
  if (_IMWillLog())
    _IMAlwaysLog();
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  if (_IMWillLog())
    _IMAlwaysLog();
  CKRemoveDaemonListener(CFSTR("CKSettingsMessagesController"));
  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  -[CKBlackholeConversationListCommonViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CKBlackholeConversationListCommonViewController;
  -[CKBlackholeConversationListCommonViewController viewDidLoad](&v15, sel_viewDidLoad);
  CKFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_CONVERSATIONLIST_TITLE"), &stru_1E276D870, CFSTR("ChatKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlackholeConversationListCommonViewController setTitle:](self, "setTitle:", v4);

  -[CKBlackholeConversationListCommonViewController clearAllButton](self, "clearAllButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKBlackholeConversationListCommonViewController navigationItem](self, "navigationItem");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v8 = (void *)objc_msgSend(v7, "initWithFrame:style:", 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  -[CKBlackholeConversationListCommonViewController setTableView:](self, "setTableView:", v8);

  -[CKBlackholeConversationListCommonViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("identifiers"));

  v10 = objc_alloc(MEMORY[0x1E0CEAF18]);
  -[CKBlackholeConversationListCommonViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __62__CKBlackholeConversationListCommonViewController_viewDidLoad__block_invoke;
  v14[3] = &unk_1E27579C0;
  v14[4] = self;
  v12 = (void *)objc_msgSend(v10, "initWithTableView:cellProvider:", v11, v14);
  -[CKBlackholeConversationListCommonViewController setTableViewDataSource:](self, "setTableViewDataSource:", v12);

  if (_IMWillLog())
  {
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "isConnected");
    _IMAlwaysLog();

  }
}

id __62__CKBlackholeConversationListCommonViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "section"))
  {
    objc_msgSend(v6, "section");
    v8 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("identifiers"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "configureForConversation:", v7);
  }

  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKBlackholeConversationListCommonViewController;
  -[CKBlackholeConversationListCommonViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[CKBlackholeConversationListCommonViewController endHoldingConversationListUpdatesForKey:](self, "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));
  objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addListenerID:capabilities:", CFSTR("CKSettingsMessagesController"), (*MEMORY[0x1E0D36CE0] | *MEMORY[0x1E0D36CC0]) | *MEMORY[0x1E0D36CF8]);

  if (_IMWillLog())
  {
    objc_msgSend(MEMORY[0x1E0D357F0], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "hasListenerForID:", CFSTR("CKSettingsMessagesController"));
    _IMAlwaysLog();

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  -[CKBlackholeConversationListCommonViewController viewWillDisappear:](&v4, sel_viewWillDisappear_, a3);
  if (-[CKBlackholeConversationListCommonViewController isMovingFromParentViewController](self, "isMovingFromParentViewController"))
  {
    if (_IMWillLog())
    {
      -[CKBlackholeConversationListCommonViewController isMovingFromParentViewController](self, "isMovingFromParentViewController");
      _IMAlwaysLog();
    }
    CKRemoveDaemonListener(CFSTR("CKSettingsMessagesController"));
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  CKBlackholeTranscriptViewController *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  if (objc_msgSend(v10, "section"))
  {
    if (objc_msgSend(v10, "section") == 1)
      -[CKBlackholeConversationListCommonViewController _clearAllTapped](self, "_clearAllTapped");
  }
  else
  {
    -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v10, "row"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[CKBlackholeTranscriptViewController initWithConversation:]([CKBlackholeTranscriptViewController alloc], "initWithConversation:", v6);
    objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "trackSpamEvent:", 17);

    -[CKBlackholeConversationListCommonViewController navigationController](self, "navigationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushViewController:animated:", v7, 1);

  }
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  CKBlackholeConversationListCommonViewController *v22;
  id v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "row");

  objc_msgSend(v6, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x1E0CEA4C0];
  CKFrameworkBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE"), &stru_1E276D870, CFSTR("ChatKit"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __112__CKBlackholeConversationListCommonViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke;
  v21 = &unk_1E2755EF0;
  v22 = self;
  v23 = v8;
  v12 = v8;
  objc_msgSend(v9, "contextualActionWithStyle:title:handler:", 1, v11, &v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0CEAA28];
  v24[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1, v18, v19, v20, v21, v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "configurationWithActions:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "setPerformsFirstActionWithFullSwipe:", 0);
  return v16;
}

uint64_t __112__CKBlackholeConversationListCommonViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteConversation:", *(_QWORD *)(a1 + 40));
}

- (void)_deleteConversation:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[CKBlackholeConversationListCommonViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__CKBlackholeConversationListCommonViewController__deleteConversation___block_invoke;
  v6[3] = &unk_1E274A1B8;
  v6[4] = self;
  -[CKBlackholeConversationListCommonViewController _confirmDeleteConversation:view:withCompletionHandler:](self, "_confirmDeleteConversation:view:withCompletionHandler:", v4, v5, v6);

}

uint64_t __71__CKBlackholeConversationListCommonViewController__deleteConversation___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_updateConversationList");
  return result;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v5;

  -[CKBlackholeConversationListCommonViewController setEditing:](self, "setEditing:", 0, a4);
  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginHoldingUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));

}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  -[CKBlackholeConversationListCommonViewController endHoldingConversationListUpdatesForKey:](self, "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"), a4);
}

- (void)_confirmDeleteConversation:(id)a3 view:(id)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[5];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  CKBlackholeConversationListCommonViewController *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    -[CKBlackholeConversationListCommonViewController _alertTitleForDelete](self, "_alertTitleForDelete");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E274CC10;
    v17 = v8;
    v18 = self;
    v19 = v10;
    v13[0] = v12;
    v13[1] = 3221225472;
    v13[2] = __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2;
    v13[3] = &unk_1E274CC10;
    v13[4] = self;
    v14 = v17;
    v15 = v19;
    -[UITableViewController _confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:](self, "_confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:", v9, v11, 0, v16, v13, 0);

  }
  else if (_IMWillLog())
  {
    _IMAlwaysLog();
  }

}

uint64_t __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "chat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markAsSpam:", 31);

  return objc_msgSend(*(id *)(a1 + 40), "_deleteConversation:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
}

uint64_t __105__CKBlackholeConversationListCommonViewController__confirmDeleteConversation_view_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_deleteConversation:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)setVisibleConversations:(id)a3
{
  NSArray *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *visibleConversations;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = (NSArray *)a3;
  if (-[NSArray count](v4, "count"))
  {
    v5 = -[NSArray count](v4, "count");
    if (v5 != -[NSArray count](self->_visibleConversations, "count"))
    {
      objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = CFSTR("ReceivedJunkConversationCount");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](v4, "count"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11[0] = v7;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trackSpamEvent:withDictionary:", 26, v8);

    }
  }
  visibleConversations = self->_visibleConversations;
  self->_visibleConversations = v4;

}

- (void)_deleteConversation:(id)a3 withCompletionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void (**v12)(id, uint64_t);

  v12 = (void (**)(id, uint64_t))a4;
  v6 = a3;
  -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeConversation:", v6);

  -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteConversation:", v6);

  if (v12)
    v12[2](v12, 1);
  -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "conversations");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (!v11)
    -[CKBlackholeConversationListCommonViewController popViewControllerIfNecessary](self, "popViewControllerIfNecessary");

}

- (void)_clearAllTapped
{
  void *v3;
  _QWORD v4[5];

  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "beginHoldingUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __66__CKBlackholeConversationListCommonViewController__clearAllTapped__block_invoke;
  v4[3] = &unk_1E274A1B8;
  v4[4] = self;
  -[CKBlackholeConversationListCommonViewController _clearAllTappedWithCompletionHandler:](self, "_clearAllTappedWithCompletionHandler:", v4);
}

uint64_t __66__CKBlackholeConversationListCommonViewController__clearAllTapped__block_invoke(uint64_t a1, int a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "popViewControllerIfNecessary");
  return result;
}

- (void)popViewControllerIfNecessary
{
  id v3;
  id v4;

  if (!CKMessageUnknownFilteringEnabled())
  {
    -[CKBlackholeConversationListCommonViewController navigationController](self, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = (id)objc_msgSend(v4, "popViewControllerAnimated:", 1);

  }
}

- (void)_clearAllTappedWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[5];
  _QWORD v11[5];
  id v12;
  _QWORD v13[4];
  id v14;
  CKBlackholeConversationListCommonViewController *v15;
  id v16;

  v4 = a3;
  -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "count"))
  {
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController _alertTitleForClearAll](self, "_alertTitleForClearAll");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E274CC10;
    v14 = v6;
    v15 = self;
    v16 = v4;
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_1E274C2E0;
    v11[4] = self;
    v12 = v16;
    v10[0] = v9;
    v10[1] = 3221225472;
    v10[2] = __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_3;
    v10[3] = &unk_1E274A208;
    v10[4] = self;
    -[UITableViewController _confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:](self, "_confirmDeleteConversationFromView:alertTitle:forMultipleConversations:withReportSpamHander:withNotReportSpamHandler:withCancelHandler:", v7, v8, 1, v13, v11, v10);

  }
  else
  {
    -[CKBlackholeConversationListCommonViewController endHoldingConversationListUpdatesForKey:](self, "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));
    if (_IMWillLog())
      _IMAlwaysLog();
  }

}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "chat", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "markAsSpam:", 31);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "_batchDeleteConversationWithCompletionHandler:", *(_QWORD *)(a1 + 48));
}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_batchDeleteConversationWithCompletionHandler:", *(_QWORD *)(a1 + 40));
}

uint64_t __88__CKBlackholeConversationListCommonViewController__clearAllTappedWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "endHoldingConversationListUpdatesForKey:", CFSTR("kCKBlackholeConversationListHoldUpdatesForDeletion"));
}

- (void)_batchDeleteConversationWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t))a3;
  -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D39958], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("ClearedJunkConversationCount");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "trackSpamEvent:withDictionary:", 27, v8);

  +[CKCurrentConversationsManager sharedInstance](CKCurrentConversationsManager, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "purgeConversations:", v5);

  -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deleteConversations:", v5);

  if (v4)
    v4[2](v4, 1);

}

- (void)endHoldingConversationListUpdatesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "endHoldingAllUpdatesForKey:", v4);

  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNeedsUpdate");

  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateIfNeeded");

}

- (void)_updateConversationList
{
  void *v3;
  char v4;
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

  -[CKBlackholeConversationListCommonViewController updater](self, "updater");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isHoldingUpdates");

  if ((v4 & 1) == 0)
  {
    -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resort");

    -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateConversationListsAndSortIfEnabled");

    -[CKBlackholeConversationListCommonViewController _conversations](self, "_conversations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "copy");
    -[CKBlackholeConversationListCommonViewController setVisibleConversations:](self, "setVisibleConversations:", v8);

    -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[CKBlackholeConversationListCommonViewController tableViewDataSource](self, "tableViewDataSource");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "emptySnapshot");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v11, "appendSectionsWithIdentifiers:", &unk_1E286F940);
      -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, &unk_1E2870AC8);

      -[CKBlackholeConversationListCommonViewController tableViewDataSource](self, "tableViewDataSource");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applyDifferencesFromSnapshot:", v11);

      -[CKBlackholeConversationListCommonViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "reloadData");

    }
    -[CKBlackholeConversationListCommonViewController _updateConversationListEmptyLabel](self, "_updateConversationListEmptyLabel");
  }
}

- (void)_updateConversationListEmptyLabel
{
  void *v3;
  uint64_t v4;
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
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  CGRect v46;

  v45[3] = *MEMORY[0x1E0C80C00];
  -[CKBlackholeConversationListCommonViewController visibleConversations](self, "visibleConversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  -[CKBlackholeConversationListCommonViewController clearAllButton](self, "clearAllButton");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4 >= 1)
  {
    objc_msgSend(v5, "setEnabled:", 1);

    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeFromSuperview");

    goto LABEL_7;
  }
  objc_msgSend(v5, "setEnabled:", 0);

  -[CKBlackholeConversationListCommonViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  if (!CGRectIsEmpty(v46))
  {
    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superview");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      goto LABEL_7;
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addSubview:", v12);

    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v38 = (void *)MEMORY[0x1E0CB3718];
    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "centerXAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "centerXAnchor");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "constraintEqualToAnchor:", v41);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v40;
    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "leadingAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leadingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v45[1] = v15;
    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "trailingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "trailingAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintLessThanOrEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v45[2] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 3);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "activateConstraints:", v21);

    -[CKBlackholeConversationListCommonViewController navigationController](self, "navigationController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "navigationBar");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "frame");
    v25 = v24;
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "safeAreaInsets");
    v28 = v25 + v27;
    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "statusBarFrame");
    v31 = (v28 + v30) * -0.5;

    -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "centerYAnchor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKBlackholeConversationListCommonViewController view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, (double)(uint64_t)v31);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setActive:", 1);

  }
LABEL_7:
  if (_IMWillLog())
    _IMAlwaysLog();
}

- (void)viewSafeAreaInsetsDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKBlackholeConversationListCommonViewController;
  -[CKBlackholeConversationListCommonViewController viewSafeAreaInsetsDidChange](&v4, sel_viewSafeAreaInsetsDidChange);
  -[CKBlackholeConversationListCommonViewController emptyConversationListLabel](self, "emptyConversationListLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[CKBlackholeConversationListCommonViewController _updateConversationListEmptyLabel](self, "_updateConversationListEmptyLabel");
}

- (UIBarButtonItem)clearAllButton
{
  UIBarButtonItem *clearAllButton;
  id v4;
  void *v5;
  void *v6;
  UIBarButtonItem *v7;
  UIBarButtonItem *v8;

  clearAllButton = self->_clearAllButton;
  if (!clearAllButton)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA380]);
    CKFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_CONVERSATIONLIST_CLEAR_ALL"), &stru_1E276D870, CFSTR("ChatKit"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (UIBarButtonItem *)objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, sel__clearAllTapped);
    v8 = self->_clearAllButton;
    self->_clearAllButton = v7;

    clearAllButton = self->_clearAllButton;
  }
  return clearAllButton;
}

- (UILabel)emptyConversationListLabel
{
  UILabel *emptyConversationListLabel;
  id v4;
  UILabel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UILabel *v11;

  emptyConversationListLabel = self->_emptyConversationListLabel;
  if (!emptyConversationListLabel)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA700]);
    v5 = (UILabel *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    -[UILabel setAdjustsFontForContentSizeCategory:](v5, "setAdjustsFontForContentSizeCategory:", 1);
    CKFrameworkBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("BLACKHOLE_EMPTY_CONVERSATION_LIST_LABEL"), &stru_1E276D870, CFSTR("ChatKit"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5, "setText:", v7);

    -[UILabel setTextAlignment:](v5, "setTextAlignment:", 1);
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0CEB568]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v5, "setFont:", v8);

    -[UILabel setNumberOfLines:](v5, "setNumberOfLines:", 0);
    objc_msgSend(MEMORY[0x1E0CEA478], "tertiaryLabelColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5, "setTextColor:", v9);

    objc_msgSend(MEMORY[0x1E0CEA478], "clearColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setBackgroundColor:](v5, "setBackgroundColor:", v10);

    -[UILabel sizeToFit](v5, "sizeToFit");
    v11 = self->_emptyConversationListLabel;
    self->_emptyConversationListLabel = v5;

    emptyConversationListLabel = self->_emptyConversationListLabel;
  }
  return emptyConversationListLabel;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList](CKConversationList, "sharedConversationList");
}

- (id)_conversations
{
  void *v2;
  void *v3;

  -[CKBlackholeConversationListCommonViewController _conversationList](self, "_conversationList");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "conversations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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

- (id)_alertTitleForClearAll
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
    v6 = CFSTR("BLACKHOLE_BATCH_DELETE_PROMPT");
  else
    v6 = CFSTR("BLACKHOLE_BATCH_DELETE_PROMPT_ICLOUD");
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_1E276D870, CFSTR("ChatKit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)sizeForChildContentContainer:(id)a3 withParentContainerSize:(CGSize)a4
{
  double v4;
  double v5;
  CGSize result;

  v4 = *MEMORY[0x1E0C9D820];
  v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  result.height = v5;
  result.width = v4;
  return result;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 0;
}

- (_UITableViewDiffableDataSource)tableViewDataSource
{
  return self->_tableViewDataSource;
}

- (void)setTableViewDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_tableViewDataSource, a3);
}

- (void)setClearAllButton:(id)a3
{
  objc_storeStrong((id *)&self->_clearAllButton, a3);
}

- (void)setEmptyConversationListLabel:(id)a3
{
  objc_storeStrong((id *)&self->_emptyConversationListLabel, a3);
}

- (CKScheduledUpdater)updater
{
  return self->_updater;
}

- (void)setUpdater:(id)a3
{
  objc_storeStrong((id *)&self->_updater, a3);
}

- (NSArray)visibleConversations
{
  return self->_visibleConversations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleConversations, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_emptyConversationListLabel, 0);
  objc_storeStrong((id *)&self->_clearAllButton, 0);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
}

@end
