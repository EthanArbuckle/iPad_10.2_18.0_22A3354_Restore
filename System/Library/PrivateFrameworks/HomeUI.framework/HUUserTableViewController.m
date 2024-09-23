@implementation HUUserTableViewController

- (HUUserTableViewController)initWithUserItemManager:(id)a3 home:(id)a4
{
  id v7;
  id v8;
  HUUserTableViewController *v9;
  HUUserTableViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HUUserTableViewController;
  v9 = -[HUItemTableViewController initWithItemManager:tableViewStyle:](&v15, sel_initWithItemManager_tableViewStyle_, v7, 1);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userItemManager, a3);
    objc_storeStrong((id *)&v10->_home, a4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_applicationWillEnterForeground, *MEMORY[0x1E0CEB350], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_applicationDidEnterBackground, *MEMORY[0x1E0CEB288], 0);

    objc_msgSend(MEMORY[0x1E0D31430], "sharedDispatcher");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addUserObserver:", v10);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[HUUserTableViewController mediaAccountFuture](self, "mediaAccountFuture");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancel");

  v5.receiver = self;
  v5.super_class = (Class)HUUserTableViewController;
  -[HUUserTableViewController dealloc](&v5, sel_dealloc);
}

- (void)applicationWillEnterForeground
{
  -[HUUserTableViewController _presentMediaAccountErrorsIfNeeded:](self, "_presentMediaAccountErrorsIfNeeded:", 1);
}

- (void)applicationDidEnterBackground
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "beginUpdates");

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissMultiUserTokenFixUI");

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissSplitAccountView");

  -[HUUserTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endUpdates");

}

- (id)itemTableHeaderView
{
  void *v3;
  _HUUserAvatarHeaderView *v4;
  void *v5;
  void *v6;
  _HUUserAvatarHeaderView *v7;
  void *v8;
  void *v9;

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = [_HUUserAvatarHeaderView alloc];
    -[HUUserTableViewController user](self, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserTableViewController home](self, "home");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[_HUUserAvatarHeaderView initWithUser:home:delegate:](v4, "initWithUser:home:delegate:", v5, v6, self);
    -[HUUserTableViewController setUserAvatarHeaderView:](self, "setUserAvatarHeaderView:", v7);

    -[HUUserTableViewController headerMessage](self, "headerMessage");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMessage:", v8);

    -[HUUserTableViewController _presentMediaAccountErrorsIfNeeded:](self, "_presentMediaAccountErrorsIfNeeded:", 1);
  }
  return -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
}

- (id)user
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserTableViewController.m"), 123, CFSTR("%s is an abstract method that must be overriden by subclass %@"), "-[HUUserTableViewController user]", objc_opt_class());

  return 0;
}

- (HFUserHandle)userHandle
{
  void *v3;
  void *v4;
  void *v5;

  -[HUUserTableViewController home](self, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserTableViewController user](self, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_handleForUser:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (HFUserHandle *)v5;
}

- (void)setHeaderMessage:(id)a3
{
  void *v5;
  NSAttributedString *v6;

  v6 = (NSAttributedString *)a3;
  if (self->_headerMessage != v6)
  {
    objc_storeStrong((id *)&self->_headerMessage, a3);
    -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMessage:", v6);

  }
}

- (void)performRemovalAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[5];

  v4 = a3;
  -[HUItemTableViewController itemManager](self, "itemManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUUserTableViewController userItemManager](self, "userItemManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathForItem:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUUserTableViewController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cellForRowAtIndexPath:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setShowSpinner:", 1);
  v11 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __50__HUUserTableViewController_performRemovalAction___block_invoke;
  v17[3] = &unk_1E6F4E2B0;
  v17[4] = self;
  v12 = (id)objc_msgSend(v4, "addSuccessBlock:", v17);
  v15[0] = v11;
  v15[1] = 3221225472;
  v15[2] = __50__HUUserTableViewController_performRemovalAction___block_invoke_2;
  v15[3] = &unk_1E6F4E2D8;
  v16 = v10;
  v13 = v10;
  v14 = (id)objc_msgSend(v4, "addFailureBlock:", v15);

}

void __50__HUUserTableViewController_performRemovalAction___block_invoke(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __50__HUUserTableViewController_performRemovalAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "setShowSpinner:", 0);
  objc_msgSend(MEMORY[0x1E0D313A0], "sharedHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleError:operationType:options:retryBlock:cancelBlock:", v3, *MEMORY[0x1E0D30A10], 0, 0, 0);

}

- (void)user:(id)a3 didUpdateNeedsiTunesMultiUserRepair:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;

  v4 = a4;
  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dismissSplitAccountView");

  if (v4)
    -[HUUserTableViewController _presentMediaAccountErrorsIfNeeded:](self, "_presentMediaAccountErrorsIfNeeded:", 0);
}

- (void)_presentMediaAccountErrorsIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  char v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];

  v3 = a3;
  -[HUUserTableViewController userHandle](self, "userHandle");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "type"))
  {

  }
  else
  {
    v5 = objc_msgSend(MEMORY[0x1E0D319D0], "isAMac");

    if ((v5 & 1) == 0)
    {
      -[HUUserTableViewController home](self, "home");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "currentUser");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "needsiTunesMultiUserRepair");

      if (v8)
      {
        -[HUUserTableViewController home](self, "home");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[HUUserTableViewController _fetchAccountsForHome:forceCloudKitFetch:](self, "_fetchAccountsForHome:forceCloudKitFetch:", v9, v3);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke;
        v13[3] = &unk_1E6F4C708;
        v13[4] = self;
        v11 = (id)objc_msgSend(v10, "addCompletionBlock:", v13);

      }
      else
      {
        -[HUUserTableViewController _refreshSplitAccountsHeaderViewIfNeeded:](self, "_refreshSplitAccountsHeaderViewIfNeeded:", v3);
      }
    }
  }
}

void __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = v5;
  if (!a3 && (unint64_t)objc_msgSend(v5, "count") >= 2)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2;
    v10[3] = &unk_1E6F4D600;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v10[0], 3221225472, __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2, &unk_1E6F4D600, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "futureWithBlock:scheduler:", v10, v8);

  }
}

void __64__HUUserTableViewController__presentMediaAccountErrorsIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = *(void **)(a1 + 32);
  v11 = a2;
  objc_msgSend(v3, "userAvatarHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "beginUpdates");

  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_presentMultiUserTokenFixUIForAccount:", v8);

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endUpdates");

  objc_msgSend(v11, "finishWithNoResult");
}

- (void)_presentMultiUserTokenFixUIForAccount:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[HUUserTableViewController home](self, "home");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentMultiUserTokenFixUIForMediaAccount:inHome:", v4, v5);

}

- (void)_refreshSplitAccountsHeaderViewIfNeeded:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];

  v3 = a3;
  -[HUUserTableViewController userHandle](self, "userHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "type");

  if (!v6)
  {
    -[HUUserTableViewController home](self, "home");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUUserTableViewController _fetchAccountsForHome:forceCloudKitFetch:](self, "_fetchAccountsForHome:forceCloudKitFetch:", v7, v3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke;
    v10[3] = &unk_1E6F4C708;
    v10[4] = self;
    v9 = (id)objc_msgSend(v8, "addCompletionBlock:", v10);

  }
}

void __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  uint64_t v11;
  id v12;

  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2;
    v10[3] = &unk_1E6F4D600;
    v11 = *(_QWORD *)(a1 + 32);
    v12 = v5;
    objc_msgSend(MEMORY[0x1E0D519E8], "mainThreadScheduler", v10[0], 3221225472, __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2, &unk_1E6F4D600, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v7, "futureWithBlock:scheduler:", v10, v8);

  }
}

void __69__HUUserTableViewController__refreshSplitAccountsHeaderViewIfNeeded___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v13 = a2;
  objc_msgSend(v3, "userAvatarHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "home");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccounts:forHome:", v5, v6);

  objc_msgSend(*(id *)(a1 + 32), "userAvatarHeaderView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  objc_msgSend(*(id *)(a1 + 32), "userAvatarHeaderView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "showSplitAccountViewIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layoutIfNeeded");

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endUpdates");

  objc_msgSend(v13, "finishWithNoResult");
}

- (id)_fetchAccountsForHome:(id)a3 forceCloudKitFetch:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;
  id v15;
  SEL v16;
  BOOL v17;

  v7 = a3;
  v8 = (void *)MEMORY[0x1E0D519C0];
  v14 = MEMORY[0x1E0C809B0];
  v15 = v7;
  v17 = a4;
  v16 = a2;
  v9 = (void *)MEMORY[0x1E0D519E8];
  v10 = v7;
  objc_msgSend(v9, "globalAsyncScheduler", v14, 3221225472, __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke, &unk_1E6F562E8, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "futureWithBlock:scheduler:", &v14, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "userHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "userHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uniqueIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "mediaAccountForHomeIdentifier:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 && !*(_BYTE *)(a1 + 56))
  {
    HFLogForCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      v38 = v30;
      v39 = 2112;
      v40 = v12;
      v41 = 2112;
      v42 = v31;
      _os_log_error_impl(&dword_1B8E1E000, v26, OS_LOG_TYPE_ERROR, "%@ Found amsMediaAccount [%@] for home [%@]", buf, 0x20u);

    }
    objc_msgSend(v4, "addObject:", v12);
    if (objc_msgSend(v4, "count"))
    {
      HFLogForCategory();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(*(SEL *)(a1 + 48));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v38 = v28;
        v39 = 2112;
        v40 = v4;
        _os_log_impl(&dword_1B8E1E000, v27, OS_LOG_TYPE_DEFAULT, "%@ Found accounts [%@]", buf, 0x16u);

      }
      objc_msgSend(v3, "finishWithResult:", v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 55);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "finishWithError:", v29);

    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "mediaAccountFuture");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      objc_msgSend(*(id *)(a1 + 32), "mediaAccountFuture");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "isCancelled"))
      {

      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "mediaAccountFuture");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "isFinished");

        if (!v17)
          goto LABEL_12;
      }
    }
    HFLogForCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v38 = v19;
      v39 = 2112;
      v40 = v20;
      _os_log_impl(&dword_1B8E1E000, v18, OS_LOG_TYPE_DEFAULT, "%@ Kicking of AMS fetch for Media Account for Home [%@]", buf, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "executeHomeMediaAccountFetchForHome:", *(_QWORD *)(a1 + 40));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setMediaAccountFuture:", v22);

    objc_msgSend(*(id *)(a1 + 32), "mediaAccountFuture");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke_23;
    v32[3] = &unk_1E6F562C0;
    v24 = *(void **)(a1 + 40);
    v36 = *(_QWORD *)(a1 + 48);
    v33 = v24;
    v34 = v4;
    v35 = v3;
    v25 = (id)objc_msgSend(v23, "addCompletionBlock:", v32);

  }
LABEL_12:

}

void __70__HUUserTableViewController__fetchAccountsForHome_forceCloudKitFetch___block_invoke_23(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  NSObject *v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  HFLogForCategory();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v8)
      goto LABEL_12;
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(void **)(a1 + 32);
    v21 = 138412546;
    v22 = v9;
    v23 = 2112;
    v24 = v10;
    _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Error fetching Media Account for Home [%@]", (uint8_t *)&v21, 0x16u);
  }
  else
  {
    if (v8)
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v11 = objc_claimAutoreleasedReturnValue();
      v21 = 138412546;
      v22 = v11;
      v23 = 2112;
      v24 = v5;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Successfuly fetched Media Account [%@]", (uint8_t *)&v21, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 32), "uniqueIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    v7 = v14;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v15 = v7;
    else
      v15 = 0;
    v9 = v15;

    if (v9)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);
  }

LABEL_12:
  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    HFLogForCategory();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = *(void **)(a1 + 40);
      v21 = 138412546;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      _os_log_impl(&dword_1B8E1E000, v16, OS_LOG_TYPE_DEFAULT, "%@ Found accounts [%@]", (uint8_t *)&v21, 0x16u);

    }
    objc_msgSend(*(id *)(a1 + 48), "finishWithResult:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v19 = *(void **)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 55);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "finishWithError:", v20);

  }
}

- (void)setAMSiTunesAccount:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[5];
  id v22;
  id v23;

  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D31190], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HUUserTableViewController_setAMSiTunesAccount_forHome___block_invoke;
  v21[3] = &unk_1E6F56310;
  v21[4] = self;
  v22 = v6;
  v23 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "setAMSiTunesAccount:forHome:completion:", v10, v9, v21);

  v11 = objc_alloc(MEMORY[0x1E0D31988]);
  objc_msgSend(v9, "currentUser");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithHome:user:nameStyle:", v9, v12, 0);

  v14 = (id)objc_msgSend(v13, "setDismissUserSplitMediaAccountWarning:", 1);
  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "beginUpdates");

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "dismissSplitAccountView");

  -[HUUserTableViewController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "endUpdates");

}

void __57__HUUserTableViewController_setAMSiTunesAccount_forHome___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    HFLogForCategory();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_1B8E1E000, v4, OS_LOG_TYPE_DEFAULT, "Error setting AMS iTunes Account - [%@] for Home - [%@] - [%@]", (uint8_t *)&v7, 0x20u);
    }

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_refreshSplitAccountsHeaderViewIfNeeded:", 0);
  }

}

- (void)signIniTunesAccount:(id)a3 forHome:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  HUUserTableViewController *v23;
  SEL v24;

  v7 = a4;
  v8 = a3;
  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "beginUpdates");

  -[HUUserTableViewController userAvatarHeaderView](self, "userAvatarHeaderView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "dismissMultiUserTokenFixUI");

  -[HUUserTableViewController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutIfNeeded");

  -[HUUserTableViewController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "endUpdates");

  v15 = objc_alloc(MEMORY[0x1E0CFDED0]);
  objc_msgSend(v7, "uniqueIdentifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithAccount:homeIdentifier:viewController:", v8, v16, self);

  -[HUUserTableViewController setMultiUserTokenFixTask:](self, "setMultiUserTokenFixTask:", v17);
  -[HUUserTableViewController multiUserTokenFixTask](self, "multiUserTokenFixTask");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "performTask");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke;
  v21[3] = &unk_1E6F51438;
  v23 = self;
  v24 = a2;
  v22 = v7;
  v20 = v7;
  objc_msgSend(v19, "addFinishBlock:", v21);

}

void __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t (*v8)(uint64_t);
  uint64_t *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  HFLogForCategory();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v14;
      _os_log_error_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_ERROR, "%@ Error in fixing MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);

    }
    v16 = MEMORY[0x1E0C809B0];
    v8 = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_28;
    v9 = &v16;
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v18 = v10;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_1B8E1E000, v7, OS_LOG_TYPE_DEFAULT, "%@ Successfully fixed MultiUser Token for MediaAccount [%@] in Home [%@]", buf, 0x20u);

    }
    v15 = MEMORY[0x1E0C809B0];
    v8 = __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_30;
    v9 = &v15;
  }
  v9[1] = 3221225472;
  v9[2] = (uint64_t)v8;
  v12 = *(_QWORD *)(a1 + 40);
  v9[3] = (uint64_t)&unk_1E6F4D988;
  v9[4] = v12;
  dispatch_async(MEMORY[0x1E0C80D38], v9);

}

uint64_t __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_28(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentMediaAccountErrorsIfNeeded:", 0);
}

uint64_t __57__HUUserTableViewController_signIniTunesAccount_forHome___block_invoke_30(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_refreshSplitAccountsHeaderViewIfNeeded:", 1);
}

- (Class)cellClassForItem:(id)a3 indexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[HUUserTableViewController userItemManager](self, "userItemManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (v9)
  {
    objc_opt_class();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HUUserTableViewController.m"), 391, CFSTR("Couldn't find a cell class for item: %@"), v6);

    v10 = 0;
  }

  return (Class)v10;
}

- (void)setupCell:(id)a3 forItem:(id)a4 indexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;

  v12 = a3;
  v7 = a4;
  -[HUUserTableViewController userItemManager](self, "userItemManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    v11 = v12;
    objc_msgSend(v11, "setDestructive:", 1);
    objc_msgSend(v11, "setUseFullWidthSeparator:", 0);

  }
}

- (HUUserItemManager)userItemManager
{
  return self->_userItemManager;
}

- (NSAttributedString)headerMessage
{
  return self->_headerMessage;
}

- (_HUUserAvatarHeaderView)userAvatarHeaderView
{
  return self->_userAvatarHeaderView;
}

- (void)setUserAvatarHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_userAvatarHeaderView, a3);
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
  objc_storeStrong((id *)&self->_home, a3);
}

- (NAFuture)mediaAccountFuture
{
  return self->_mediaAccountFuture;
}

- (void)setMediaAccountFuture:(id)a3
{
  objc_storeStrong((id *)&self->_mediaAccountFuture, a3);
}

- (AMSUIUpdateMultiUserTokenTask)multiUserTokenFixTask
{
  return self->_multiUserTokenFixTask;
}

- (void)setMultiUserTokenFixTask:(id)a3
{
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiUserTokenFixTask, 0);
  objc_storeStrong((id *)&self->_mediaAccountFuture, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_userAvatarHeaderView, 0);
  objc_storeStrong((id *)&self->_headerMessage, 0);
  objc_storeStrong((id *)&self->_userItemManager, 0);
}

@end
