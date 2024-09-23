@implementation SFSharedAccountsGroupInvitationsListViewController

- (SFSharedAccountsGroupInvitationsListViewController)initWithGroupToPresentInvitationForOnAppearance:(id)a3
{
  id v4;
  SFSharedAccountsGroupInvitationsListViewController *v5;
  uint64_t v6;
  KCSharingGroup *groupToPresentInvitationForOnAppearance;
  SFSharedAccountsGroupInvitationsListViewController *v8;

  v4 = a3;
  v5 = -[SFSharedAccountsGroupInvitationsListViewController init](self, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    groupToPresentInvitationForOnAppearance = v5->_groupToPresentInvitationForOnAppearance;
    v5->_groupToPresentInvitationForOnAppearance = (KCSharingGroup *)v6;

    v8 = v5;
  }

  return v5;
}

- (SFSharedAccountsGroupInvitationsListViewController)init
{
  SFSharedAccountsGroupInvitationsListViewController *v2;
  id v3;
  void *v4;
  uint64_t v5;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v7;
  SFSharedAccountsGroupInvitationsListViewController *v8;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, uint64_t, uint64_t, void *);
  void *v13;
  id v14;
  id location;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SFSharedAccountsGroupInvitationsListViewController;
  v2 = -[SFSharedAccountsGroupInvitationsListViewController initWithStyle:](&v16, sel_initWithStyle_, +[_SFAccountManagerAppearanceValues preferencesTableViewStyle](_SFAccountManagerAppearanceValues, "preferencesTableViewStyle"));
  if (v2)
  {
    objc_initWeak(&location, v2);
    v3 = objc_alloc(MEMORY[0x1E0D4EE40]);
    -[SFSharedAccountsGroupInvitationsListViewController tableView](v2, "tableView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v11 = 3221225472;
    v12 = __58__SFSharedAccountsGroupInvitationsListViewController_init__block_invoke;
    v13 = &unk_1E4ABFD40;
    objc_copyWeak(&v14, &location);
    v5 = objc_msgSend(v3, "initWithTableView:cellProvider:", v4, &v10);
    diffableDataSource = v2->_diffableDataSource;
    v2->_diffableDataSource = (SFTableViewDiffableDataSource *)v5;

    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider", v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addSubscriber:", v2);

    v8 = v2;
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v2;
}

id __58__SFSharedAccountsGroupInvitationsListViewController_init__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v4;
  id v5;
  id WeakRetained;
  void *v7;

  v4 = (id *)(a1 + 32);
  v5 = a4;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_cellForItemIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSharedAccountsGroupInvitationsListViewController;
  -[SFSharedAccountsGroupInvitationsListViewController viewDidLoad](&v4, sel_viewDidLoad);
  -[SFSharedAccountsGroupInvitationsListViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCellLayoutMarginsFollowReadableWidth:", 1);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  KCSharingGroup *groupToPresentInvitationForOnAppearance;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSharedAccountsGroupInvitationsListViewController;
  -[SFSharedAccountsGroupInvitationsListViewController viewWillAppear:](&v7, sel_viewWillAppear_, a3);
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupInvitationsListViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v4);

  -[SFSharedAccountsGroupInvitationsListViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
  if (self->_groupToPresentInvitationForOnAppearance)
  {
    -[SFSharedAccountsGroupInvitationsListViewController _presentAcceptInvitationResponseViewForGroup:](self, "_presentAcceptInvitationResponseViewForGroup:");
    groupToPresentInvitationForOnAppearance = self->_groupToPresentInvitationForOnAppearance;
    self->_groupToPresentInvitationForOnAppearance = 0;

  }
}

- (void)_reloadDiffableDataSource
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  SFViewSharedAccountsGroupInvitationButtonItem *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  SFViewSharedAccountsGroupInvitationButtonItem *v22;
  uint64_t v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cachedInvitations");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v4);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v17 = v4;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v19 != v9)
            objc_enumerationMutation(v6);
          v23 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          v11 = v23;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1, v17);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v12, v11);

          v13 = -[SFViewSharedAccountsGroupInvitationButtonItem initWithGroup:]([SFViewSharedAccountsGroupInvitationButtonItem alloc], "initWithGroup:", v11);
          v22 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v14, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v24, 16);
      }
      while (v8);
    }

    v4 = v17;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _WBSLocalizedString();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v16);

    -[SFSharedAccountsGroupInvitationsListViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v15);
  }
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v5, 0, v17);

}

- (id)_cellForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  SFSharedAccountsGroupInvitationCell *v8;
  void *v9;
  void *v10;
  void *v11;
  SFAccountManagerPlatterButtonCell *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFSharedAccountsGroupInvitationsListViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("invitationCellReuseIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = -[SFSharedAccountsGroupInvitationCell initWithStyle:reuseIdentifier:]([SFSharedAccountsGroupInvitationCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("invitationCellReuseIdentifier"));
    v14 = v8;

    objc_msgSend(v14, "configureWithGroup:", v4);
    objc_msgSend(v14, "setDelegate:", self);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[SFSharedAccountsGroupInvitationsListViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("viewSharedCredentialGroupInvitationButton"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = -[SFAccountManagerPlatterButtonCell initWithStyle:reuseIdentifier:]([SFAccountManagerPlatterButtonCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("viewSharedCredentialGroupInvitationButton"));
      v14 = v12;

      objc_msgSend(v4, "group");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "groupID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", self->_groupIDForInvitationBeingProcessed) ^ 1;

      _WBSLocalizedString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "configureWithButtonTitle:leadingContentInset:isEnabled:", v18, +[SFSharedAccountsGroupInvitationCell contentInset](SFSharedAccountsGroupInvitationCell, "contentInset"), v17);

    }
    else
    {
      v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[SFSharedAccountsGroupInvitationsListViewController _cellForItemIdentifier:].cold.1(v13);
      v14 = 0;
    }
  }

  return v14;
}

- (void)_presentDeclineGroupInvitationAlertForTableViewCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[5];
  id v30;
  id v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ownerParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "groupMemberDataForGroupParticipants:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "contact");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 != 0;

  v11 = (void *)MEMORY[0x1E0D6C058];
  objc_msgSend(v5, "displayName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "declineGroupInvitationAlertTitleForGroupWithName:fromKnownSender:", v12, v10);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v24, 0, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke;
  v29[3] = &unk_1E4AC09C8;
  v29[4] = self;
  v30 = v5;
  v17 = v4;
  v31 = v17;
  v18 = v5;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v15, 0, v29);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v19);

  v20 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v16;
  v27[1] = 3221225472;
  v27[2] = __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke_3;
  v27[3] = &unk_1E4AC0128;
  v27[4] = self;
  v28 = v17;
  v22 = v17;
  objc_msgSend(v20, "actionWithTitle:style:handler:", v21, 1, v27);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v23);

  -[SFSharedAccountsGroupInvitationsListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

void __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  objc_msgSend(a1[5], "groupID");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = (void *)v3[130];
  v3[130] = v2;

  objc_msgSend(a1[6], "setShowingActivityIndicator:", 1);
  objc_msgSend(a1[4], "_reloadDiffableDataSource");
  v6 = a1[4];
  v5 = a1[5];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke_2;
  v7[3] = &unk_1E4AC0038;
  v7[4] = v6;
  v8 = v5;
  objc_msgSend(v6, "_declineInvitationForGroup:withCompletionHandler:", v8, v7);

}

void __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToDeclineInvitationWithError:", a2);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_presentErrorAlertWithString:");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "_isRespondingToLastInvitation:", *(_QWORD *)(a1 + 40)))
      return;
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);
  }

}

uint64_t __106__SFSharedAccountsGroupInvitationsListViewController__presentDeclineGroupInvitationAlertForTableViewCell___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1040);
  *(_QWORD *)(v2 + 1040) = 0;

  objc_msgSend(*(id *)(a1 + 40), "setShowingActivityIndicator:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
}

- (void)_presentAcceptInvitationResponseViewForGroup:(id)a3
{
  id v4;
  UINavigationController *v5;
  UINavigationController *acceptInvitationResponseNavigationController;
  UINavigationController *v7;
  SFSharedAccountsGroupInvitationViewController *v8;

  v4 = a3;
  v8 = -[SFSharedAccountsGroupInvitationViewController initWithGroup:]([SFSharedAccountsGroupInvitationViewController alloc], "initWithGroup:", v4);

  -[SFSharedAccountsGroupInvitationViewController setDelegate:](v8, "setDelegate:", self);
  v5 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v8);
  -[UINavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
  -[UINavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
  acceptInvitationResponseNavigationController = self->_acceptInvitationResponseNavigationController;
  self->_acceptInvitationResponseNavigationController = v5;
  v7 = v5;

  -[SFSharedAccountsGroupInvitationsListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)_presentErrorAlertWithString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v6);

  -[SFSharedAccountsGroupInvitationsListViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v8, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupInvitationsListViewController _presentAcceptInvitationResponseViewForGroup:](self, "_presentAcceptInvitationResponseViewForGroup:", v7);

  }
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  int v8;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "group");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", self->_groupIDForInvitationBeingProcessed) ^ 1;

  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;

  v11 = a4;
  v7 = a5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "groupID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", self->_groupIDForInvitationBeingProcessed);

      if (v10)
        objc_msgSend(v11, "setShowingActivityIndicator:", 1);
    }

  }
}

- (void)groupProviderReceivedUpdates:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __83__SFSharedAccountsGroupInvitationsListViewController_groupProviderReceivedUpdates___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

uint64_t __83__SFSharedAccountsGroupInvitationsListViewController_groupProviderReceivedUpdates___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
}

- (void)invitationViewController:(id)a3 acceptedInvitationForGroup:(id)a4
{
  UINavigationController *acceptInvitationResponseNavigationController;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;

  v9 = a4;
  acceptInvitationResponseNavigationController = self->_acceptInvitationResponseNavigationController;
  self->_acceptInvitationResponseNavigationController = 0;

  -[SFSharedAccountsGroupInvitationsListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (-[SFSharedAccountsGroupInvitationsListViewController _isRespondingToLastInvitation:](self, "_isRespondingToLastInvitation:", v9))
  {
    -[SFSharedAccountsGroupInvitationsListViewController navigationController](self, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationsListViewController:acceptedInviteToGroup:", self, v9);

}

- (void)invitationViewController:(id)a3 failedToAcceptInvitationWithError:(id)a4
{
  UINavigationController *acceptInvitationResponseNavigationController;
  id v6;
  id v7;

  acceptInvitationResponseNavigationController = self->_acceptInvitationResponseNavigationController;
  self->_acceptInvitationResponseNavigationController = 0;
  v6 = a4;

  -[SFSharedAccountsGroupInvitationsListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToAcceptInvitationWithError:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SFSharedAccountsGroupInvitationsListViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v7);
}

- (void)invitationViewController:(id)a3 declinedInvitationForGroup:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __106__SFSharedAccountsGroupInvitationsListViewController_invitationViewController_declinedInvitationForGroup___block_invoke;
  v10[3] = &unk_1E4AC1400;
  v10[4] = self;
  v11 = v7;
  v12 = v6;
  v8 = v6;
  v9 = v7;
  -[SFSharedAccountsGroupInvitationsListViewController _declineInvitationForGroup:withCompletionHandler:](self, "_declineInvitationForGroup:withCompletionHandler:", v9, v10);

}

void __106__SFSharedAccountsGroupInvitationsListViewController_invitationViewController_declinedInvitationForGroup___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(_QWORD **)(a1 + 32);
  if (a2)
  {
    objc_msgSend(v3, "invitationViewController:failedToDeclineInvitationWithError:", *(_QWORD *)(a1 + 48), a2);
  }
  else
  {
    v4 = (void *)v3[128];
    v3[128] = 0;

    objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
    if (objc_msgSend(*(id *)(a1 + 32), "_isRespondingToLastInvitation:", *(_QWORD *)(a1 + 40)))
    {
      objc_msgSend(*(id *)(a1 + 32), "navigationController");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v5 = (id)objc_msgSend(v6, "popViewControllerAnimated:", 1);

    }
  }
}

- (void)_declineInvitationForGroup:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CD5C50];
  v7 = a3;
  objc_msgSend(v6, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "groupID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke;
  v11[3] = &unk_1E4AC1428;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v8, "declineInviteForGroupID:completion:", v9, v11);

}

void __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke_2;
  v6[3] = &unk_1E4AC13D8;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  void **v2;
  NSObject *v3;

  v2 = (void **)(a1 + 32);
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke_2_cold_1(v2, v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)invitationViewController:(id)a3 failedToDeclineInvitationWithError:(id)a4
{
  UINavigationController *acceptInvitationResponseNavigationController;
  id v6;
  id v7;

  acceptInvitationResponseNavigationController = self->_acceptInvitationResponseNavigationController;
  self->_acceptInvitationResponseNavigationController = 0;
  v6 = a4;

  -[SFSharedAccountsGroupInvitationsListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToDeclineInvitationWithError:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SFSharedAccountsGroupInvitationsListViewController _presentErrorAlertWithString:](self, "_presentErrorAlertWithString:", v7);
}

- (void)invitationViewControllerChoseNotToRespondToInvitation:(id)a3
{
  UINavigationController *acceptInvitationResponseNavigationController;

  acceptInvitationResponseNavigationController = self->_acceptInvitationResponseNavigationController;
  self->_acceptInvitationResponseNavigationController = 0;

  -[SFSharedAccountsGroupInvitationsListViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)_isRespondingToLastInvitation:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cachedInvitations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "count") == 1)
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "groupID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (objc_msgSend(v7, "isEqualToString:", v8) & 1) != 0 || objc_msgSend(v5, "count") == 0;

  }
  else
  {
    v9 = objc_msgSend(v5, "count") == 0;
  }

  return v9;
}

- (SFSharedAccountsGroupInvitationsListViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupInvitationsListViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupIDForInvitationBeingProcessed, 0);
  objc_storeStrong((id *)&self->_groupToPresentInvitationForOnAppearance, 0);
  objc_storeStrong((id *)&self->_acceptInvitationResponseNavigationController, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

- (void)_cellForItemIdentifier:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Received unknown type for sharing group invitations view", v1, 2u);
}

void __103__SFSharedAccountsGroupInvitationsListViewController__declineInvitationForGroup_withCompletionHandler___block_invoke_2_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to decline shared accounts group invite with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
