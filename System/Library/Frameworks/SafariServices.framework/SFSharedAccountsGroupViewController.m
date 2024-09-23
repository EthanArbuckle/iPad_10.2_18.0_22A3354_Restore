@implementation SFSharedAccountsGroupViewController

+ (id)groupCreationViewControllerWithInitialParticipants:(id)a3 prepopulatedName:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  v6 = (objc_class *)MEMORY[0x1E0CD5C28];
  v7 = a4;
  v8 = a3;
  v9 = [v6 alloc];
  if (v8)
    v10 = v8;
  else
    v10 = (id)MEMORY[0x1E0C9AA60];
  v11 = (void *)objc_msgSend(v9, "initWithParticipants:displayName:", v10, v7);

  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPersona:group:", 0, v11);
  return v12;
}

+ (id)groupManagementViewControllerForGroup:(id)a3 shouldStartAcceleratedAddMembersFlow:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BYTE *v7;

  v4 = a4;
  v6 = a3;
  v7 = (_BYTE *)objc_msgSend(objc_alloc((Class)a1), "_initWithPersona:group:", 1, v6);

  if (v4)
    v7[1065] = 1;
  return v7;
}

+ (id)groupManagementViewControllerForGroup:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithPersona:group:", 1, v4);

  return v5;
}

- (id)_initWithPersona:(unint64_t)a3 group:(id)a4
{
  id v6;
  SFSharedAccountsGroupViewController *v7;
  SFSharedAccountsGroupViewController *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v15;
  unint64_t persona;
  void *v17;
  void *v18;
  uint64_t v19;
  _ASAccountSharingGroupMemberData *groupMemberDataForCurrentUser;
  void *v21;
  uint64_t v22;
  _ASAccountSharingGroupMemberData *v23;
  SFSharedAccountsGroupViewController *v24;
  uint64_t v26;
  uint64_t v27;
  id (*v28)(uint64_t, uint64_t, uint64_t, void *);
  void *v29;
  id v30;
  id location;
  objc_super v32;

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)SFSharedAccountsGroupViewController;
  v7 = -[SFSharedAccountsGroupViewController initWithStyle:](&v32, sel_initWithStyle_, 2);
  v8 = v7;
  if (v7)
  {
    v7->_persona = a3;
    v9 = v6;
    if (!v6)
    {
      v10 = objc_alloc(MEMORY[0x1E0CD5C28]);
      v9 = (void *)objc_msgSend(v10, "initWithParticipants:displayName:", MEMORY[0x1E0C9AA60], &stru_1E4AC8470);
    }
    objc_storeStrong((id *)&v8->_group, v9);
    if (!v6)

    objc_initWeak(&location, v8);
    v11 = objc_alloc(MEMORY[0x1E0D4EE40]);
    -[SFSharedAccountsGroupViewController tableView](v8, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = MEMORY[0x1E0C809B0];
    v27 = 3221225472;
    v28 = __62__SFSharedAccountsGroupViewController__initWithPersona_group___block_invoke;
    v29 = &unk_1E4ABFD40;
    objc_copyWeak(&v30, &location);
    v13 = objc_msgSend(v11, "initWithTableView:cellProvider:", v12, &v26);
    diffableDataSource = v8->_diffableDataSource;
    v8->_diffableDataSource = (SFTableViewDiffableDataSource *)v13;

    -[SFTableViewDiffableDataSource setDelegate:](v8->_diffableDataSource, "setDelegate:", v8, v26, v27, v28, v29);
    v8->_isShowingActivityIndicator = 0;
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addSubscriber:", v8);

    persona = v8->_persona;
    if (persona)
    {
      if (persona == 1)
      {
        objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "groupMemberDataForGroup:", v8->_group);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "safari_firstObjectPassingTest:", &__block_literal_global_12);
        v19 = objc_claimAutoreleasedReturnValue();
        groupMemberDataForCurrentUser = v8->_groupMemberDataForCurrentUser;
        v8->_groupMemberDataForCurrentUser = (_ASAccountSharingGroupMemberData *)v19;

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "groupMemberDataForPrimaryAccount");
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v8->_groupMemberDataForCurrentUser;
      v8->_groupMemberDataForCurrentUser = (_ASAccountSharingGroupMemberData *)v22;

      -[_ASAccountSharingGroupMemberData setGroupPermissionLevel:](v8->_groupMemberDataForCurrentUser, "setGroupPermissionLevel:", 2);
    }
    v24 = v8;
    objc_destroyWeak(&v30);
    objc_destroyWeak(&location);
  }

  return v8;
}

id __62__SFSharedAccountsGroupViewController__initWithPersona_group___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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

uint64_t __62__SFSharedAccountsGroupViewController__initWithPersona_group___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMeParticipant");
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSharedAccountsGroupViewController;
  -[SFSharedAccountsGroupViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFSharedAccountsGroupViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
  -[SFSharedAccountsGroupViewController _configureNavigationBar](self, "_configureNavigationBar");
}

- (void)viewDidAppear:(BOOL)a3
{
  unint64_t persona;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SFSharedAccountsGroupViewController;
  -[SFSharedAccountsGroupViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  persona = self->_persona;
  if (persona == 1)
  {
    -[SFSharedAccountsGroupViewController _startAcceleratedAddMembersFlowIfNeeded](self, "_startAcceleratedAddMembersFlowIfNeeded");
  }
  else if (!persona)
  {
    -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "becomeFirstResponder");

  }
}

- (void)_configureNavigationBar
{
  unint64_t persona;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  persona = self->_persona;
  if (persona == 1)
  {
    -[SFSharedAccountsGroupViewController _configureNavigationBarForManagePersona](self, "_configureNavigationBarForManagePersona");
  }
  else if (!persona)
  {
    -[SFSharedAccountsGroupViewController _configureNavigationBarForCreatePersona](self, "_configureNavigationBarForCreatePersona");
  }
  if (self->_isShowingActivityIndicator)
  {
    v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v8, "startAnimating");
    objc_msgSend(v8, "setHidesWhenStopped:", 1);
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v8);
    -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", v4);

    -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leftBarButtonItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", 0);

  }
}

- (void)_configureNavigationBarForCreatePersona
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed);
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLeftBarButtonItem:", v3);

  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__createButtonPressed);
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);

  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "text");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length") != 0;
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "rightBarButtonItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEnabled:", v11);

  v15 = (id)objc_msgSend(MEMORY[0x1E0D6C060], "newGroupViewTitle");
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setTitle:", v15);

}

- (void)_configureNavigationBarForManagePersona
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  objc_class *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;

  -[KCSharingGroup displayName](self->_group, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitle:", v3);

  -[KCSharingGroup ownerParticipant](self->_group, "ownerParticipant");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup currentUserParticipant](self->_group, "currentUserParticipant");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  if ((v7 & 1) == 0)
  {
    v18 = (objc_class *)MEMORY[0x1E0DC34F0];
LABEL_7:
    v23 = (id)objc_msgSend([v18 alloc], "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonPressed);
    -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRightBarButtonItem:", v23);
    goto LABEL_10;
  }
  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isFirstResponder");

  v10 = objc_alloc(MEMORY[0x1E0DC34F0]);
  if ((v9 & 1) == 0)
  {
    v19 = (void *)objc_msgSend(v10, "initWithBarButtonSystemItem:target:action:", 2, self, sel__editButtonPressed);
    -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLeftBarButtonItem:", v19);

    v18 = (objc_class *)MEMORY[0x1E0DC34F0];
    goto LABEL_7;
  }
  v11 = (void *)objc_msgSend(v10, "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonPressed);
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setLeftBarButtonItem:", v11);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithBarButtonSystemItem:target:action:", 3, self, sel__saveButtonPressed);
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRightBarButtonItem:", v13);

  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "text");
  v23 = (id)objc_claimAutoreleasedReturnValue();

  -[KCSharingGroup displayName](self->_group, "displayName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (objc_msgSend(v23, "isEqualToString:", v16) & 1) == 0 && objc_msgSend(v23, "length") != 0;
  -[SFSharedAccountsGroupViewController navigationItem](self, "navigationItem");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "rightBarButtonItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEnabled:", v17);

LABEL_10:
}

- (void)_cancelButtonPressed
{
  unint64_t persona;
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  persona = self->_persona;
  if (persona == 1)
  {
    -[KCSharingGroup displayName](self->_group, "displayName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "resignFirstResponder");

    -[SFSharedAccountsGroupViewController _configureNavigationBar](self, "_configureNavigationBar");
  }
  else if (!persona)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "createGroupViewController:completedWithGroup:error:", self, 0, 0);

  }
}

- (void)_editButtonPressed
{
  id v2;

  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "becomeFirstResponder");

}

- (void)_doneButtonPressed
{
  id v2;

  -[SFSharedAccountsGroupViewController navigationController](self, "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (void)_saveButtonPressed
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
  _QWORD v12[5];
  id v13;

  -[KCSharingGroup displayName](self->_group, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[KCSharingGroup copy](self->_group, "copy");
  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDisplayName:", v7);

  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resignFirstResponder");

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C60]), "initWithUpdatedGroup:", v4);
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke;
  v12[3] = &unk_1E4AC1BD0;
  v12[4] = self;
  v13 = v3;
  v11 = v3;
  objc_msgSend(v10, "updateGroupWithRequest:completion:", v9, v12);

}

void __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;
  id v15;

  v5 = a2;
  v6 = a3;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke_2;
  v11[3] = &unk_1E4AC06B8;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v12 = v6;
  v13 = v7;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke_2_cold_1(v2, v3);
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1032), "editableTextField");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToUpdateGroupWithError:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_presentErrorAlertWithString:", v7);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1048), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_configureNavigationBar");
  }
}

- (void)_createButtonPressed
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];

  -[SFSharedAccountsGroupViewController _setIsRunningActivityForUserToWaitOn:](self, "_setIsRunningActivityForUserToWaitOn:", 1);
  -[KCSharingGroup participants](self->_group, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CD5C28]);
  -[UITableViewCell editableTextField](self->_groupNameTableViewCell, "editableTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_stringByTrimmingWhitespace");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v4, "initWithParticipants:displayName:", v3, v7);

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C30]), "initWithNewGroup:", v8);
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke;
  v11[3] = &unk_1E4AC1BF8;
  v11[4] = self;
  objc_msgSend(v10, "createGroupWithRequest:completion:", v9, v11);

}

void __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke_2;
  block[3] = &unk_1E4ABFC38;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id WeakRetained;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke_2_cold_1(v2, v3);
    objc_msgSend(*(id *)(a1 + 40), "_setIsRunningActivityForUserToWaitOn:", 0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1072));
  objc_msgSend(WeakRetained, "createGroupViewController:completedWithGroup:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)_setIsRunningActivityForUserToWaitOn:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v8;
  _QWORD v9[5];

  v3 = a3;
  self->_isShowingActivityIndicator = a3;
  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "itemIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconfigureItemsWithIdentifiers:", v6);
  diffableDataSource = self->_diffableDataSource;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__SFSharedAccountsGroupViewController__setIsRunningActivityForUserToWaitOn___block_invoke;
  v9[3] = &unk_1E4ABFE00;
  v9[4] = self;
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:completion:](diffableDataSource, "applySnapshot:animatingDifferences:completion:", v5, 0, v9);
  -[SFSharedAccountsGroupViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setUserInteractionEnabled:", !v3);

}

uint64_t __76__SFSharedAccountsGroupViewController__setIsRunningActivityForUserToWaitOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
}

- (void)_reloadDiffableDataSource
{
  void *v3;
  int v4;
  unint64_t persona;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v15 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  -[KCSharingGroup ownerParticipant](self->_group, "ownerParticipant");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCurrentUser");

  persona = self->_persona;
  if (!persona)
  {
    v7 = &unk_1E4B26FB0;
    v8 = &unk_1E4B26F98;
    goto LABEL_8;
  }
  if (persona == 1 && v4 != 0)
  {
    v7 = &unk_1E4B26FE0;
    v8 = &unk_1E4B26FC8;
LABEL_8:
    objc_msgSend(v15, "appendSectionsWithIdentifiers:", v8);
    objc_msgSend(v15, "appendItemsWithIdentifiers:", v7);
  }
  objc_msgSend(v15, "appendSectionsWithIdentifiers:", &unk_1E4B26FF8);
  if (!self->_persona)
    objc_msgSend(v15, "appendItemsWithIdentifiers:", &unk_1E4B27010);
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupMemberDataForGroup:", self->_group);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "appendItemsWithIdentifiers:", v10);
  v11 = self->_persona;
  if (!v11)
  {
    v13 = &unk_1E4B27028;
LABEL_18:
    objc_msgSend(v15, "appendItemsWithIdentifiers:", v13);
    goto LABEL_19;
  }
  if (v11 == 1)
  {
    if (v4)
    {
      objc_msgSend(v15, "appendItemsWithIdentifiers:", &unk_1E4B27040);
      v12 = v15;
      v13 = &unk_1E4B27070;
      v14 = &unk_1E4B27058;
    }
    else
    {
      v13 = &unk_1E4B270A0;
      v14 = &unk_1E4B27088;
      v12 = v15;
    }
    objc_msgSend(v12, "appendSectionsWithIdentifiers:", v14);
    goto LABEL_18;
  }
LABEL_19:
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v15, 0);

}

- (id)_cellForItemIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v4 = a3;
  switch(-[SFSharedAccountsGroupViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v4))
  {
    case 0:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "dequeueReusableCellWithIdentifier:", CFSTR("GroupNameTextFieldCell"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        -[SFSharedAccountsGroupViewController _groupNameTextFieldCell](self, "_groupNameTextFieldCell");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v8;

      if (self->_isShowingActivityIndicator)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "editableTextField");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setTextColor:", v30);

      v32 = !self->_isShowingActivityIndicator;
      objc_msgSend(v9, "editableTextField");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setUserInteractionEnabled:", v32);

      objc_storeStrong((id *)&self->_groupNameTableViewCell, v9);
      -[SFSharedAccountsGroupViewController _configureNavigationBar](self, "_configureNavigationBar");
      break;
    case 1:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dequeueReusableCellWithIdentifier:", CFSTR("GroupOwnerCell"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        v13 = v11;
      }
      else
      {
        -[SFSharedAccountsGroupViewController _groupOwnerCell](self, "_groupOwnerCell");
        v13 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v13;

      goto LABEL_22;
    case 2:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dequeueReusableCellWithIdentifier:", CFSTR("GroupMemberCell"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v15)
        v17 = v15;
      else
        v17 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("GroupMemberCell"));
      v9 = v17;

      -[SFSharedAccountsGroupViewController _configureGroupMemberCell:withData:](self, "_configureGroupMemberCell:withData:", v9, v4);
LABEL_22:
      objc_msgSend(v9, "contentConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = (void *)MEMORY[0x1E0DC3658];
      if (self->_isShowingActivityIndicator)
        goto LABEL_37;
      objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
      v27 = objc_claimAutoreleasedReturnValue();
      goto LABEL_38;
    case 3:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "dequeueReusableCellWithIdentifier:", CFSTR("AddGroupMembersCell"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        -[SFSharedAccountsGroupViewController _addGroupMembersCell](self, "_addGroupMembersCell");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v9 = v21;

      objc_msgSend(v9, "contentConfiguration");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (self->_isShowingActivityIndicator)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "imageProperties");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "setTintColor:", v34);

      if (self->_isShowingActivityIndicator)
      {
        v26 = (void *)MEMORY[0x1E0DC3658];
LABEL_37:
        objc_msgSend(v26, "secondaryLabelColor");
        v27 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        +[_SFAccountManagerAppearanceValues buttonCellTextColor](_SFAccountManagerAppearanceValues, "buttonCellTextColor");
        v27 = objc_claimAutoreleasedReturnValue();
      }
LABEL_38:
      v36 = (void *)v27;
      objc_msgSend(v25, "textProperties");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setColor:", v36);

      objc_msgSend(v9, "setContentConfiguration:", v25);
      break;
    case 4:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dequeueReusableCellWithIdentifier:", CFSTR("DeleteGroupCell"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
        goto LABEL_14;
      -[SFSharedAccountsGroupViewController _deleteGroupCell](self, "_deleteGroupCell");
      v24 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    case 5:
      -[SFSharedAccountsGroupViewController tableView](self, "tableView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "dequeueReusableCellWithIdentifier:", CFSTR("LeaveGroupCell"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
LABEL_14:
        v24 = v23;
      }
      else
      {
        -[SFSharedAccountsGroupViewController _leaveGroupCell](self, "_leaveGroupCell");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
LABEL_28:
      v9 = v24;

      if (self->_isShowingActivityIndicator)
        objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
      else
        objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "textLabel");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setTextColor:", v28);

      break;
    default:
      v9 = 0;
      break;
  }

  return v9;
}

- (int64_t)_itemTypeForIdentifier:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = 2;
  else
    v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (id)_groupNameTextFieldCell
{
  SFEditableTextFieldTableViewCell *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[SFEditableTextFieldTableViewCell initWithStyle:reuseIdentifier:]([SFEditableTextFieldTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("GroupNameTextFieldCell"));
  -[SFEditableTextFieldTableViewCell editableTextField](v3, "editableTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__groupNameTextFieldDidBeginEditing, 0x10000);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, sel__groupNameTextFieldChanged, 0x20000);
  _WBSLocalizedString();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlaceholder:", v5);

  objc_msgSend(v4, "setAdjustsFontSizeToFitWidth:", 1);
  objc_msgSend(v4, "setUserInteractionEnabled:", 1);
  -[KCSharingGroup displayName](self->_group, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v6);

  return v3;
}

- (void)_groupNameTextFieldDidBeginEditing
{
  if (self->_persona == 1)
    -[SFSharedAccountsGroupViewController _configureNavigationBar](self, "_configureNavigationBar");
}

- (id)_groupOwnerCell
{
  void *v2;
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

  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupMemberDataForPrimaryAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFont:", v6);

  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSecondaryText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTextProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "secondaryTextProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v11);

  objc_msgSend(v3, "avatarImageForGroupMemberCell");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v13);

  objc_msgSend(v4, "setImageToTextPadding:", 16.0);
  objc_msgSend(v4, "setTextToSecondaryTextVerticalPadding:", 1.0);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("GroupOwnerCell"));
  objc_msgSend(v14, "setContentConfiguration:", v4);

  return v14;
}

- (id)_addGroupMembersCell
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("plus"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setImage:", v3);

  v4 = *MEMORY[0x1E0C92580];
  v5 = *(double *)(MEMORY[0x1E0C92580] + 8);
  objc_msgSend(v2, "imageProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setReservedLayoutSize:", v4, v5);

  objc_msgSend(v2, "imageProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMaximumSize:", v4, v5);

  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setText:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setColor:", v9);

  objc_msgSend(v2, "setImageToTextPadding:", 16.0);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("AddGroupMembersCell"));
  objc_msgSend(v11, "setContentConfiguration:", v2);

  return v11;
}

- (void)_configureGroupMemberCell:(id)a3 withData:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  id v23;

  v23 = a4;
  v5 = (void *)MEMORY[0x1E0DC39A8];
  v6 = a3;
  objc_msgSend(v5, "cellConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "isMeParticipant"))
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v11);

  }
  else
  {
    objc_msgSend(v23, "displayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v9);
  }

  v12 = objc_msgSend(v23, "groupPermissionLevel");
  switch(v12)
  {
    case 0:
      if (objc_msgSend(v23, "inviteStatus") == 1 || _os_feature_enabled_impl())
        goto LABEL_12;
      goto LABEL_13;
    case 2:
      goto LABEL_12;
    case 1:
      if (objc_msgSend(v23, "inviteStatus") == 1)
      {
LABEL_12:
        _WBSLocalizedString();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSecondaryText:", v13);

        break;
      }
LABEL_13:
      objc_msgSend(v7, "setSecondaryText:", 0);
      break;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setColor:", v14);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setColor:", v18);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A98]);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "secondaryTextProperties");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFont:", v20);

  objc_msgSend(v23, "avatarImageForGroupMemberCell");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v22);

  objc_msgSend(v7, "setImageToTextPadding:", 16.0);
  objc_msgSend(v7, "setTextToSecondaryTextVerticalPadding:", 1.0);
  objc_msgSend(v6, "setContentConfiguration:", v7);
  objc_msgSend(v6, "setAccessoryType:", 1);

}

- (id)_deleteGroupCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("DeleteGroupCell"));
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  return v2;
}

- (id)_leaveGroupCell
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("LeaveGroupCell"));
  objc_msgSend(v2, "textLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setText:", v4);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTextColor:", v5);

  objc_msgSend(v3, "setTextAlignment:", 1);
  return v2;
}

- (void)_presentErrorAlertWithString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", a3, 0, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__SFSharedAccountsGroupViewController__presentErrorAlertWithString___block_invoke;
  v9[3] = &unk_1E4AC0010;
  v10 = v4;
  v7 = v4;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v6, 0, v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addAction:", v8);

  -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);
}

uint64_t __68__SFSharedAccountsGroupViewController__presentErrorAlertWithString___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentGroupMemberPickerViewController
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t persona;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[KCSharingGroup participants](self->_group, "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_156_0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v5);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D6C0A0]), "initWithAlreadyAddedAddresses:", v11);
  objc_msgSend(v6, "setDelegate:", self);
  persona = self->_persona;
  if (!persona)
  {
    v8 = 0;
    goto LABEL_5;
  }
  if (persona == 1)
  {
    v8 = 1;
LABEL_5:
    objc_msgSend(v6, "setShouldConfirmAddingRecipients:", v8);
  }
  objc_msgSend(v6, "setModalPresentationStyle:", 2);
  objc_msgSend(v6, "setModalInPresentation:", 1);
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v6);
  -[SFSharedAccountsGroupViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v9, 1, 0);

}

uint64_t __78__SFSharedAccountsGroupViewController__presentGroupMemberPickerViewController__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "handle");
}

- (void)_presentDeleteGroupConfirmationAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  SFSharedAccountsGroupViewController *v19;

  objc_msgSend(MEMORY[0x1E0D6C058], "groupDeletionConfirmationAlertTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "groupDeletionConfirmationAlertSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __75__SFSharedAccountsGroupViewController__presentDeleteGroupConfirmationAlert__block_invoke;
  v17[3] = &unk_1E4AC0128;
  v9 = v5;
  v18 = v9;
  v19 = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 2, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __75__SFSharedAccountsGroupViewController__presentDeleteGroupConfirmationAlert__block_invoke_2;
  v15[3] = &unk_1E4AC0010;
  v16 = v9;
  v13 = v9;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

uint64_t __75__SFSharedAccountsGroupViewController__presentDeleteGroupConfirmationAlert__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup");
}

uint64_t __75__SFSharedAccountsGroupViewController__presentDeleteGroupConfirmationAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_presentLeaveGroupConfirmationAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  SFSharedAccountsGroupViewController *v19;

  objc_msgSend(MEMORY[0x1E0D6C058], "leaveGroupConfirmationAlertTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "leaveGroupConfirmationAlertSubtitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __74__SFSharedAccountsGroupViewController__presentLeaveGroupConfirmationAlert__block_invoke;
  v17[3] = &unk_1E4AC0128;
  v9 = v5;
  v18 = v9;
  v19 = self;
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 2, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  v11 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __74__SFSharedAccountsGroupViewController__presentLeaveGroupConfirmationAlert__block_invoke_2;
  v15[3] = &unk_1E4AC0010;
  v16 = v9;
  v13 = v9;
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 1, v15);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addAction:", v14);

  -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v13, 1, 0);
}

uint64_t __74__SFSharedAccountsGroupViewController__presentLeaveGroupConfirmationAlert__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup");
}

uint64_t __74__SFSharedAccountsGroupViewController__presentLeaveGroupConfirmationAlert__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  SFSharedAccountsGroupViewController *v22;

  -[SFSharedAccountsGroupViewController _setIsRunningActivityForUserToWaitOn:](self, "_setIsRunningActivityForUserToWaitOn:", 1);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", v4, 0);

  if (v5)
  {
    -[SFSharedAccountsGroupViewController _deleteGroup](self, "_deleteGroup");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D6C058], "alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __102__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup__block_invoke;
    v20[3] = &unk_1E4AC0128;
    v11 = v7;
    v21 = v11;
    v22 = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __102__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup__block_invoke_2;
    v18[3] = &unk_1E4AC0128;
    v18[4] = self;
    v19 = v11;
    v15 = v11;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v16);

    -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  }
}

uint64_t __102__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_deleteGroup");
}

uint64_t __102__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndDeleteGroup__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_deleteGroup
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0CD5C38]);
  -[KCSharingGroup groupID](self->_group, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGroupID:", v4);

  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke;
  v7[3] = &unk_1E4AC1820;
  v7[4] = self;
  objc_msgSend(v6, "deleteGroupWithRequest:completion:", v5, v7);

}

void __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke_2;
  v5[3] = &unk_1E4ABFB20;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke_2_cold_1(a1 + 40, v3);
    objc_msgSend(*(id *)(a1 + 32), "_setIsRunningActivityForUserToWaitOn:", 0);
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToDeleteGroupWithError:", *(_QWORD *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentErrorAlertWithString:", v5);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "groupID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_recordGroupIdentifierForExitCleanup:completionHandler:", v7, &__block_literal_global_169);

    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1072));
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "groupMemberDataForGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1048));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_174);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "groupViewController:didDeleteGroupWithMemberNames:", *(_QWORD *)(a1 + 32), v11);
    }

  }
}

id __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke_2_172(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isMeParticipant") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_removeGroupMemberFromKCSharingGroup:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  -[KCSharingGroup participants](self->_group, "participants");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke;
  v13[3] = &unk_1E4AC1CE0;
  v14 = v4;
  v7 = v4;
  objc_msgSend(v5, "safari_firstObjectPassingTest:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)-[KCSharingGroup copy](self->_group, "copy");
  objc_msgSend(v9, "removeParticipant:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C60]), "initWithUpdatedGroup:", v9);
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_2;
  v12[3] = &unk_1E4AC1BF8;
  v12[4] = self;
  objc_msgSend(v11, "updateGroupWithRequest:completion:", v10, v12);

}

uint64_t __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_3;
  block[3] = &unk_1E4ABFC38;
  v7 = *(_QWORD *)(a1 + 32);
  v11 = v6;
  v12 = v7;
  v13 = v5;
  v8 = v5;
  v9 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  void *v4;
  void *v5;

  v2 = a1 + 32;
  if (*(_QWORD *)(a1 + 32))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_3_cold_1(v2, v3);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToRemoveGroupMemberWithError:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_presentErrorAlertWithString:", v5);

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1048), *(id *)(a1 + 48));
    objc_msgSend(*(id *)(a1 + 40), "_reloadDiffableDataSource");
  }
}

- (void)_moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  id v19;
  _QWORD v20[4];
  id v21;
  SFSharedAccountsGroupViewController *v22;

  -[SFSharedAccountsGroupViewController _setIsRunningActivityForUserToWaitOn:](self, "_setIsRunningActivityForUserToWaitOn:", 1);
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_moveSavedAccountsOriginallyContributedByCurrentUserToPersonalKeychainFromGroupID:isForAlreadyExitedGroup:", v4, 0);

  if (v5)
  {
    -[SFSharedAccountsGroupViewController _leaveGroup](self, "_leaveGroup");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D6C058], "alertSubtitleForFailingToMoveAccountsBackToPersonalKeychainWhileDeletingGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v17, v6, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __101__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup__block_invoke;
    v20[3] = &unk_1E4AC0128;
    v11 = v7;
    v21 = v11;
    v22 = self;
    objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v20);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addAction:", v12);

    v13 = (void *)MEMORY[0x1E0DC3448];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __101__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup__block_invoke_2;
    v18[3] = &unk_1E4AC0128;
    v18[4] = self;
    v19 = v11;
    v15 = v11;
    objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 1, v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addAction:", v16);

    -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
  }
}

uint64_t __101__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 40), "_leaveGroup");
}

uint64_t __101__SFSharedAccountsGroupViewController__moveContributedCredentialsBackToPersonalKeychainAndLeaveGroup__block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
  return objc_msgSend(*(id *)(a1 + 40), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_leaveGroup
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v3 = objc_alloc(MEMORY[0x1E0CD5C48]);
  -[KCSharingGroup groupID](self->_group, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithGroupID:", v4);

  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke;
  v7[3] = &unk_1E4AC1820;
  v7[4] = self;
  objc_msgSend(v6, "leaveGroupWithRequest:completion:", v5, v7);

}

void __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke_2;
  v5[3] = &unk_1E4ABFB20;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v5);

}

void __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke_2(uint64_t a1)
{
  id *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  NSObject *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  objc_msgSend(*v2, "_configureNavigationBar");
  v5 = *(_QWORD *)(a1 + 40);
  v4 = (id *)(a1 + 40);
  if (v5)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke_2_cold_1((uint64_t)v2, v6, v4);
    objc_msgSend(*v2, "_setIsRunningActivityForUserToWaitOn:", 0);
    objc_msgSend(*v2, "_configureNavigationBar");
    v7 = *v2;
    objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToLeaveGroupWithError:", *v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_presentErrorAlertWithString:", v8);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*((id *)*v2 + 131), "groupID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_recordGroupIdentifierForExitCleanup:completionHandler:", v10, &__block_literal_global_178);

    objc_msgSend(*v2, "navigationController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);

    WeakRetained = objc_loadWeakRetained((id *)*v2 + 134);
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "groupMemberDataForGroup:", *((_QWORD *)*v2 + 131));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_182);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(WeakRetained, "groupViewController:didLeaveGroupWithMemberNames:", *v2, v14);
    }

  }
}

id __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke_2_181(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isMeParticipant") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

- (void)_addGroupMembersToKCSharingGroup:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "KCSharingParticipantsFromGroupMembers:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)-[KCSharingGroup copy](self->_group, "copy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addParticipant:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C60]), "initWithUpdatedGroup:", v7);
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke;
  v16[3] = &unk_1E4AC1BD0;
  v16[4] = self;
  v17 = v4;
  v15 = v4;
  objc_msgSend(v14, "updateGroupWithRequest:completion:", v13, v16);

}

void __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id *v8;
  _QWORD v9[5];
  id v10;
  id v11;
  _QWORD block[5];
  id v13;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_cold_1(v7);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_183;
    block[3] = &unk_1E4ABFB20;
    block[4] = *(_QWORD *)(a1 + 32);
    v8 = &v13;
    v13 = v6;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_2;
    v9[3] = &unk_1E4ABFC38;
    v9[4] = *(_QWORD *)(a1 + 32);
    v8 = &v10;
    v10 = v5;
    v11 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], v9);

  }
}

void __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_183(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToAddGroupMemberWithError:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_presentErrorAlertWithString:", v2);

}

uint64_t __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_2(uint64_t a1)
{
  NSObject *v3;
  uint8_t v4[16];

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1048), *(id *)(a1 + 40));
  if ((objc_msgSend(MEMORY[0x1E0CC68C8], "isiMessageEnabled") & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
    return objc_msgSend(*(id *)(a1 + 32), "_showGroupInviteMessagePreviewForGroup:invitedGroupMembers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_DEFAULT, "iMessage is not enabled. Not prompting to send invite.", v4, 2u);
    }
    return objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
  }
}

- (void)_showGroupInviteMessagePreviewForGroup:(id)a3 invitedGroupMembers:(id)a4
{
  id v6;
  id v7;
  SFSharedAccountsGroupMessageInvitePreviewViewController *v8;
  NSObject *v9;
  uint8_t v10[16];

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CC68C8], "isiMessageEnabled") & 1) != 0)
  {
    v8 = -[SFSharedAccountsGroupMessageInvitePreviewViewController initWithGroup:invitedGroupMemberData:]([SFSharedAccountsGroupMessageInvitePreviewViewController alloc], "initWithGroup:invitedGroupMemberData:", v6, v7);
    -[SFSharedAccountsGroupMessageInvitePreviewViewController setDelegate:](v8, "setDelegate:", self);
    -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);

  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_DEFAULT, "iMessage is not enabled. Not prompting to send invite.", v10, 2u);
    }
  }

}

- (void)_showGroupInviteMessageComposeSheetForGroup:(id)a3 invitedGroupMemberData:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  SFSharedAccountsGroupInvitationMessageComposeViewController *v10;
  id v11;

  v6 = (void *)MEMORY[0x1E0C92620];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "sharedManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "KCSharingParticipantsFromGroupMembers:", v7);
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v10 = -[SFSharedAccountsGroupInvitationMessageComposeViewController initWithGroup:participantsToInvite:]([SFSharedAccountsGroupInvitationMessageComposeViewController alloc], "initWithGroup:participantsToInvite:", v8, v11);
  -[SFSharedAccountsGroupInvitationMessageComposeViewController setMessageComposeDelegate:](v10, "setMessageComposeDelegate:", self);
  -[SFSharedAccountsGroupViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);

}

- (void)_didSelectRowForGroupMemberData:(id)a3
{
  id v4;
  SFSharedAccountsGroupMemberDetailViewController *v5;
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
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberDataForCurrentUser, "groupPermissionLevel") == 2|| objc_msgSend(v4, "isMeParticipant"))
  {
    v5 = -[SFSharedAccountsGroupMemberDetailViewController initWithGroupMemberData:group:groupMemberDataForCurrentUser:persona:]([SFSharedAccountsGroupMemberDetailViewController alloc], "initWithGroupMemberData:group:groupMemberDataForCurrentUser:persona:", v4, self->_group, self->_groupMemberDataForCurrentUser, self->_persona != 0);
    -[SFSharedAccountsGroupMemberDetailViewController setDelegate:](v5, "setDelegate:", self);
    -[SFSharedAccountsGroupMemberDetailViewController navigationItem](v5, "navigationItem");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBackButtonDisplayMode:", 1);

    -[SFSharedAccountsGroupViewController navigationController](self, "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pushViewController:animated:", v5, 1);

  }
  else
  {
    objc_msgSend(v4, "contact");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0C974D8];
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = (void *)MEMORY[0x1E0C97200];
      objc_msgSend(v4, "handle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "contactWithDisplayName:handleStrings:", 0, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewControllerForUnknownContact:", v14);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "contactStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setContactStore:", v16);

    objc_msgSend(v10, "navigationItem");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackButtonDisplayMode:", 1);

    -[SFSharedAccountsGroupViewController navigationController](self, "navigationController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "pushViewController:animated:", v10, 1);

  }
}

- (void)_startAcceleratedAddMembersFlowIfNeeded
{
  if (self->_persona == 1 && self->_shouldStartAcceleratedAddMembersFlow)
  {
    self->_shouldStartAcceleratedAddMembersFlow = 0;
    -[SFSharedAccountsGroupViewController _presentGroupMemberPickerViewController](self, "_presentGroupMemberPickerViewController");
  }
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SFSharedAccountsGroupViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v5, 1);

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  switch(-[SFSharedAccountsGroupViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v7))
  {
    case 2:
      -[SFSharedAccountsGroupViewController _didSelectRowForGroupMemberData:](self, "_didSelectRowForGroupMemberData:", v7);
      break;
    case 3:
      -[SFSharedAccountsGroupViewController _presentGroupMemberPickerViewController](self, "_presentGroupMemberPickerViewController");
      break;
    case 4:
      -[SFSharedAccountsGroupViewController _presentDeleteGroupConfirmationAlert](self, "_presentDeleteGroupConfirmationAlert");
      break;
    case 5:
      -[SFSharedAccountsGroupViewController _presentLeaveGroupConfirmationAlert](self, "_presentLeaveGroupConfirmationAlert");
      break;
    default:
      break;
  }

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  BOOL v6;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (unint64_t)(-[SFSharedAccountsGroupViewController _itemTypeForIdentifier:](self, "_itemTypeForIdentifier:", v5)- 2) <= 3&& !self->_isShowingActivityIndicator;

  return v6;
}

- (void)memberPickerViewController:(id)a3 addedRecipients:(id)a4
{
  void *v5;
  void *v6;
  unint64_t persona;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  KCSharingGroup *v12;
  KCSharingGroup *group;
  void *v14;
  id v15;

  v15 = a4;
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "groupMemberDataForRecipients:", v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  persona = self->_persona;
  if (persona == 1)
  {
    if (objc_msgSend(v15, "count"))
      -[SFSharedAccountsGroupViewController _addGroupMembersToKCSharingGroup:](self, "_addGroupMembersToKCSharingGroup:", v6);
  }
  else if (!persona)
  {
    -[KCSharingGroup participants](self->_group, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "KCSharingParticipantsFromGroupMembers:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "addObjectsFromArray:", v11);
    v12 = (KCSharingGroup *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C28]), "initWithParticipants:displayName:", v9, &stru_1E4AC8470);
    group = self->_group;
    self->_group = v12;

    -[SFSharedAccountsGroupViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
  }
  -[SFSharedAccountsGroupViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[SFTableViewDiffableDataSource sectionIdentifierForIndex:](self->_diffableDataSource, "sectionIdentifierForIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v4, "integerValue") > 1)
  {
    v5 = 0;
  }
  else
  {
    _WBSLocalizedString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  void *v5;
  unint64_t persona;
  uint64_t v7;
  void *v8;

  -[SFTableViewDiffableDataSource sectionIdentifierForIndex:](self->_diffableDataSource, "sectionIdentifierForIndex:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "integerValue") == 1)
  {
    persona = self->_persona;
    if (persona == 1)
    {
      if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberDataForCurrentUser, "groupPermissionLevel") == 2)objc_msgSend(MEMORY[0x1E0D6C060], "groupManagementViewSubtitleStringForOwner");
      else
        objc_msgSend(MEMORY[0x1E0D6C060], "groupManagementViewSubtitleStringForNonOwner");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    if (!persona)
    {
      objc_msgSend(MEMORY[0x1E0D6C060], "groupCreationViewSubtitleString");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_10:
      v8 = (void *)v7;
      goto LABEL_11;
    }
  }
  v8 = 0;
LABEL_11:

  return v8;
}

- (void)groupMemberDetailViewController:(id)a3 removedGroupMember:(id)a4
{
  id v6;
  id v7;
  unint64_t persona;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  KCSharingGroup *v15;
  KCSharingGroup *group;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  persona = self->_persona;
  if (persona == 1)
  {
    -[SFSharedAccountsGroupViewController _removeGroupMemberFromKCSharingGroup:](self, "_removeGroupMemberFromKCSharingGroup:", v7);
  }
  else if (!persona)
  {
    -[KCSharingGroup participants](self->_group, "participants");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "KCSharingParticipantsFromGroupMembers:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "removeObject:", v14);
    v15 = (KCSharingGroup *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C28]), "initWithParticipants:displayName:", v10, &stru_1E4AC8470);
    group = self->_group;
    self->_group = v15;

    -[SFSharedAccountsGroupViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
  }

}

- (void)groupMemberDetailViewController:(id)a3 changedPermissionForGroupMember:(id)a4 toPermissionLevel:(int64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a4;
  if (!self->_persona)
  {
    v10 = v7;
    -[KCSharingGroup participants](self->_group, "participants");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __121__SFSharedAccountsGroupViewController_groupMemberDetailViewController_changedPermissionForGroupMember_toPermissionLevel___block_invoke;
    v11[3] = &unk_1E4AC1CE0;
    v12 = v10;
    objc_msgSend(v8, "safari_firstObjectPassingTest:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setPermissionLevel:", a5);
    v7 = v10;
  }

}

uint64_t __121__SFSharedAccountsGroupViewController_groupMemberDetailViewController_changedPermissionForGroupMember_toPermissionLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  NSObject *v7;
  int v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a4;
    _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Finished message compose with result: %ld", (uint8_t *)&v8, 0xCu);
  }
  -[SFSharedAccountsGroupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", a3 != 0, 0);
}

- (void)groupMessageInvitePreviewViewControllerDidSelectContinue:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__SFSharedAccountsGroupViewController_groupMessageInvitePreviewViewControllerDidSelectContinue___block_invoke;
  v6[3] = &unk_1E4ABFB20;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SFSharedAccountsGroupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v6);

}

void __96__SFSharedAccountsGroupViewController_groupMessageInvitePreviewViewControllerDidSelectContinue___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "group");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "invitedGroupMemberData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_showGroupInviteMessageComposeSheetForGroup:invitedGroupMemberData:", v4, v3);

}

- (void)groupMessageInvitePreviewViewControllerDidSelectCancel:(id)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  -[SFSharedAccountsGroupViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)groupProviderReceivedUpdates:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SFSharedAccountsGroupViewController_groupProviderReceivedUpdates___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __68__SFSharedAccountsGroupViewController_groupProviderReceivedUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1048), "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedGroupWithID:", v3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v8;
  if (v8)
  {
    v5 = objc_msgSend(v8, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1048);
    *(_QWORD *)(v6 + 1048) = v5;

    objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
    objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
    v4 = v8;
  }

}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  length = a4.length;
  v7 = a5;
  objc_msgSend(a3, "text");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");
  v10 = objc_msgSend(v7, "length");

  LOBYTE(length) = v9 - length + v10 <= *MEMORY[0x1E0D8B1B0];
  return length;
}

- (SFSharedAccountsGroupViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_groupMemberDataForCurrentUser, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_groupNameTableViewCell, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

void __57__SFSharedAccountsGroupViewController__saveButtonPressed__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v4, v5, "Failed to update group name with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

void __59__SFSharedAccountsGroupViewController__createButtonPressed__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v4, v5, "Failed to create KCSharing group with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

void __51__SFSharedAccountsGroupViewController__deleteGroup__block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v4, v5, "Failed to delete shared credentials group with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

void __76__SFSharedAccountsGroupViewController__removeGroupMemberFromKCSharingGroup___block_invoke_3_cold_1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  OUTLINED_FUNCTION_2_1(a1, a2);
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v4, v5, "Failed to remove member from group with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

void __50__SFSharedAccountsGroupViewController__leaveGroup__block_invoke_2_cold_1(uint64_t a1, void *a2, id *a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(*(_QWORD *)a1 + 1048);
  v5 = a2;
  objc_msgSend(v4, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*a3, "safari_privacyPreservingDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  _os_log_error_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_ERROR, "Failed to leave group (%@): %@", (uint8_t *)&v8, 0x16u);

}

void __72__SFSharedAccountsGroupViewController__addGroupMembersToKCSharingGroup___block_invoke_cold_1(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  v2 = a1;
  objc_msgSend((id)OUTLINED_FUNCTION_4_0(), "safari_privacyPreservingDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v4, v5, "Failed to add group members with error: %{public}@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_6();
}

@end
