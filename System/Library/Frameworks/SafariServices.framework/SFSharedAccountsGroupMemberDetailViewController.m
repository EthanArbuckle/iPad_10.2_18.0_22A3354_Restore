@implementation SFSharedAccountsGroupMemberDetailViewController

- (SFSharedAccountsGroupMemberDetailViewController)initWithGroupMemberData:(id)a3 group:(id)a4 groupMemberDataForCurrentUser:(id)a5 persona:(unint64_t)a6
{
  id v11;
  id v12;
  id v13;
  SFSharedAccountsGroupMemberDetailViewController *v14;
  SFSharedAccountsGroupMemberDetailViewController *v15;
  id v16;
  void *v17;
  uint64_t v18;
  SFTableViewDiffableDataSource *diffableDataSource;
  void *v20;
  void *v21;
  SFSharedAccountsGroupMemberDetailViewController *v22;
  uint64_t v24;
  uint64_t v25;
  id (*v26)(uint64_t, uint64_t, uint64_t, void *);
  void *v27;
  id v28;
  id location;
  objc_super v30;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v30.receiver = self;
  v30.super_class = (Class)SFSharedAccountsGroupMemberDetailViewController;
  v14 = -[SFSharedAccountsGroupMemberDetailViewController initWithStyle:](&v30, sel_initWithStyle_, 2);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_groupMemberData, a3);
    objc_storeStrong((id *)&v15->_group, a4);
    objc_storeStrong((id *)&v15->_currentUserGroupMemberData, a5);
    v15->_persona = a6;
    objc_initWeak(&location, v15);
    v16 = objc_alloc(MEMORY[0x1E0D4EE40]);
    -[SFSharedAccountsGroupMemberDetailViewController tableView](v15, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = MEMORY[0x1E0C809B0];
    v25 = 3221225472;
    v26 = __119__SFSharedAccountsGroupMemberDetailViewController_initWithGroupMemberData_group_groupMemberDataForCurrentUser_persona___block_invoke;
    v27 = &unk_1E4ABFD40;
    objc_copyWeak(&v28, &location);
    v18 = objc_msgSend(v16, "initWithTableView:cellProvider:", v17, &v24);
    diffableDataSource = v15->_diffableDataSource;
    v15->_diffableDataSource = (SFTableViewDiffableDataSource *)v18;

    -[SFTableViewDiffableDataSource setDelegate:](v15->_diffableDataSource, "setDelegate:", v15, v24, v25, v26, v27);
    _WBSLocalizedString();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupMemberDetailViewController navigationItem](v15, "navigationItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTitle:", v20);

    v22 = v15;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

  return v15;
}

id __119__SFSharedAccountsGroupMemberDetailViewController_initWithGroupMemberData_group_groupMemberDataForCurrentUser_persona___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
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
  UIEditMenuInteraction *v3;
  UIEditMenuInteraction *editMenuInteraction;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFSharedAccountsGroupMemberDetailViewController;
  -[SFSharedAccountsGroupMemberDetailViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = (UIEditMenuInteraction *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC37A0]), "initWithDelegate:", self);
  editMenuInteraction = self->_editMenuInteraction;
  self->_editMenuInteraction = v3;

  -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addInteraction:", self->_editMenuInteraction);

  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubscriber:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFSharedAccountsGroupMemberDetailViewController;
  -[SFSharedAccountsGroupMemberDetailViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SFSharedAccountsGroupMemberDetailViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
}

- (void)_reloadDiffableDataSource
{
  void *v3;
  id v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v4 = objc_alloc_init(MEMORY[0x1E0DC3398]);
  objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E4B271C0);
  objc_msgSend(v4, "appendItemsWithIdentifiers:", &unk_1E4B271D8);
  -[_ASAccountSharingGroupMemberData contact](self->_groupMemberData, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else if ((-[_ASAccountSharingGroupMemberData isMeParticipant](self->_groupMemberData, "isMeParticipant") & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "appendItemsWithIdentifiers:", &unk_1E4B271F0);
LABEL_5:
  if (_os_feature_enabled_impl())
  {
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E4B27208);
    objc_msgSend(v4, "appendItemsWithIdentifiers:", &unk_1E4B27220);
    objc_msgSend(v4, "reconfigureItemsWithIdentifiers:", &unk_1E4B27238);
  }
  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_currentUserGroupMemberData, "groupPermissionLevel") == 2&& (-[_ASAccountSharingGroupMemberData isMeParticipant](self->_groupMemberData, "isMeParticipant") & 1) == 0)
  {
    objc_msgSend(v4, "appendSectionsWithIdentifiers:", &unk_1E4B27250);
    objc_msgSend(v4, "appendItemsWithIdentifiers:", &unk_1E4B27268);
  }
  -[SFTableViewDiffableDataSource applySnapshot:animatingDifferences:](self->_diffableDataSource, "applySnapshot:animatingDifferences:", v4, 0);

}

- (id)_cellForItemIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;

  switch(objc_msgSend(a3, "integerValue"))
  {
    case 0:
      -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dequeueReusableCellWithIdentifier:", CFSTR("MemberHeaderCell"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v5;
      if (v5)
        v7 = v5;
      else
        v7 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("MemberHeaderCell"));
      v8 = v7;

      v25 = -[SFSharedAccountsGroupMemberDetailViewController _configureMemberHeaderCell:](self, "_configureMemberHeaderCell:", v8);
      break;
    case 1:
      -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "dequeueReusableCellWithIdentifier:", CFSTR("MemberDetailsCell"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
        v12 = v10;
      else
        v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("MemberDetailsCell"));
      v8 = v12;

      v26 = -[SFSharedAccountsGroupMemberDetailViewController _configureMemberDetailsCell:](self, "_configureMemberDetailsCell:", v8);
      break;
    case 2:
      -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dequeueReusableCellWithIdentifier:", CFSTR("PermissionLevelCell"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v14;
      if (v14)
        v16 = v14;
      else
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PermissionLevelCell"));
      v8 = v16;

      -[SFSharedAccountsGroupMemberDetailViewController _configureCanMakeChangesCell:](self, "_configureCanMakeChangesCell:", v8);
      break;
    case 3:
      -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "dequeueReusableCellWithIdentifier:", CFSTR("PermissionLevelCell"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      if (v18)
        v20 = v18;
      else
        v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PermissionLevelCell"));
      v8 = v20;

      -[SFSharedAccountsGroupMemberDetailViewController _configureViewOnlyCell:](self, "_configureViewOnlyCell:", v8);
      break;
    case 4:
      -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "dequeueReusableCellWithIdentifier:", CFSTR("RemoveMemberCell"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
        v24 = v22;
      else
        v24 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("RemoveMemberCell"));
      v8 = v24;

      -[SFSharedAccountsGroupMemberDetailViewController _configureRemoveMemberCell:](self, "_configureRemoveMemberCell:", v8);
      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (id)_configureMemberHeaderCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData displayName](self->_groupMemberData, "displayName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[_ASAccountSharingGroupMemberData avatarImageForGroupMemberCell](self->_groupMemberData, "avatarImageForGroupMemberCell");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v7);

  objc_msgSend(v4, "setAccessoryType:", -[SFSharedAccountsGroupMemberDetailViewController _shouldShowContactDetails](self, "_shouldShowContactDetails"));
  objc_msgSend(v4, "setContentConfiguration:", v5);

  return v4;
}

- (id)_configureMemberDetailsCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData handleForDisplay](self->_groupMemberData, "handleForDisplay");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D13B00], "isStringPhoneNumber:", v6);
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v7);

  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFont:", v8);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setColor:", v10);

  objc_msgSend(v5, "setSecondaryText:", v6);
  objc_msgSend(MEMORY[0x1E0DC37E8], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v12);

  objc_msgSend(v4, "setContentConfiguration:", v5);
  return v4;
}

- (void)_configureRemoveMemberCell:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)MEMORY[0x1E0DC39A8];
  v4 = a3;
  objc_msgSend(v3, "cellConfiguration");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlignment:", 1);

  _WBSLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "textProperties");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setColor:", v7);

  objc_msgSend(v4, "setContentConfiguration:", v9);
}

- (void)_configureCanMakeChangesCell:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberData, "groupPermissionLevel"))
    v6 = 3;
  else
    v6 = 0;
  objc_msgSend(v10, "setAccessoryType:", v6);
  if (self->_persona == 1)
  {
    v7 = -[SFSharedAccountsGroupMemberDetailViewController _canChangeGroupMemberPermissionLevel](self, "_canChangeGroupMemberPermissionLevel");
    objc_msgSend(v10, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v7);

    if (v7)
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

  }
}

- (void)_configureViewOnlyCell:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  _WBSLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberData, "groupPermissionLevel"))
    v6 = 0;
  else
    v6 = 3;
  objc_msgSend(v10, "setAccessoryType:", v6);
  if (self->_persona == 1)
  {
    v7 = -[SFSharedAccountsGroupMemberDetailViewController _canChangeGroupMemberPermissionLevel](self, "_canChangeGroupMemberPermissionLevel");
    objc_msgSend(v10, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnabled:", v7);

    if (v7)
      objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "lightGrayColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

  }
}

- (void)_presentRemoveMemberConfirmationAlert
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  _QWORD v20[4];
  id v21;

  -[_ASAccountSharingGroupMemberData displayName](self->_groupMemberData, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertTitleForRemovingGroupMemberWithName:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData participantID](self->_groupMemberData, "participantID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_hasPersonWithParticipantID:contributedSavedAccountsToGroupWithID:", v6, v7);

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0D6C058], "confirmationAlertSubtitleForRemovingGroupMemberWithName:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  _WBSLocalizedString();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v4, v9, _SFDeviceAlertStyle());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)v4;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __88__SFSharedAccountsGroupMemberDetailViewController__presentRemoveMemberConfirmationAlert__block_invoke;
  v20[3] = &unk_1E4AC0010;
  v21 = v11;
  v15 = v11;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 1, v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v16);

  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __88__SFSharedAccountsGroupMemberDetailViewController__presentRemoveMemberConfirmationAlert__block_invoke_2;
  v19[3] = &unk_1E4AC0010;
  v19[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", v10, 2, v19);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v17);

  -[SFSharedAccountsGroupMemberDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v15, 1, 0);
}

uint64_t __88__SFSharedAccountsGroupMemberDetailViewController__presentRemoveMemberConfirmationAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __88__SFSharedAccountsGroupMemberDetailViewController__presentRemoveMemberConfirmationAlert__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_removeGroupMember");
  return objc_msgSend(*(id *)(a1 + 32), "_presentAlertTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccounts");
}

- (void)_presentAlertTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccounts
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[_ASAccountSharingGroupMemberData displayName](self->_groupMemberData, "displayName");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "warningAlertTitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:", v9);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D6C058], "warningAlertSubtitleTellingUserThatRemovedGroupMemberMightStillHaveAccessToAccountsAfterRemoval:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v3, v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v8);

  -[SFSharedAccountsGroupMemberDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void)_removeGroupMember
{
  id WeakRetained;
  id v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "groupMemberDetailViewController:removedGroupMember:", self, self->_groupMemberData);

  -[SFSharedAccountsGroupMemberDetailViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (void)_changeGroupMemberPermissionToPermissionLevel:(int64_t)a3
{
  unint64_t persona;
  id WeakRetained;

  persona = self->_persona;
  if (persona == 1)
  {
    -[SFSharedAccountsGroupMemberDetailViewController _updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:](self, "_updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:", a3);
  }
  else if (!persona)
  {
    -[_ASAccountSharingGroupMemberData setGroupPermissionLevel:](self->_groupMemberData, "setGroupPermissionLevel:", a3);
    -[SFSharedAccountsGroupMemberDetailViewController _reloadDiffableDataSource](self, "_reloadDiffableDataSource");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "groupMemberDetailViewController:changedPermissionForGroupMember:toPermissionLevel:", self, self->_groupMemberData, a3);

  }
}

- (void)_updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[5];

  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_currentUserGroupMemberData, "groupPermissionLevel") == 2)
  {
    v5 = (void *)-[KCSharingGroup copy](self->_group, "copy");
    objc_msgSend(v5, "participants");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke;
    v22[3] = &unk_1E4AC1CE0;
    v22[4] = self;
    objc_msgSend(v6, "safari_firstObjectPassingTest:", v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setPermissionLevel:", a3);
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5C60]), "initWithUpdatedGroup:", v5);
    -[SFSharedAccountsGroupMemberDetailViewController _showPendingRequestUI:](self, "_showPendingRequestUI:", 1);
    objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_2;
    v20[3] = &unk_1E4AC1BD0;
    v20[4] = self;
    v21 = v5;
    v11 = v5;
    objc_msgSend(v10, "updateGroupWithRequest:completion:", v9, v20);

  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[SFSharedAccountsGroupMemberDetailViewController _updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
  }
}

uint64_t __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

void __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;
  id v13;

  v5 = a2;
  v6 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_3;
  v10[3] = &unk_1E4AC06B8;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

void __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_3(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[5];
  _QWORD v15[5];

  v2 = objc_alloc_init(MEMORY[0x1E0D8AC10]);
  v3 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_4;
  v15[3] = &unk_1E4ABFE00;
  v15[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "setHandler:", v15);
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 1040);
    *(_QWORD *)(v6 + 1040) = v5;

    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "groupMemberDataForGroup:", *(_QWORD *)(a1 + 56));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v14[0] = v3;
    v14[1] = 3221225472;
    v14[2] = __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_80;
    v14[3] = &unk_1E4AC2598;
    v14[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v9, "safari_firstObjectPassingTest:", v14);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(void **)(v11 + 1024);
    *(_QWORD *)(v11 + 1024) = v10;

    objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
  }
  else if (*(_QWORD *)(a1 + 48))
  {
    v13 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_3_cold_1((void **)(a1 + 48), v13);
    objc_msgSend(*(id *)(a1 + 32), "_presentFailedToUpdatePermissionLevelAlertWithError:", *(_QWORD *)(a1 + 48));
  }

}

uint64_t __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showPendingRequestUI:", 0);
}

uint64_t __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_80(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (void)_presentFailedToUpdatePermissionLevelAlertWithError:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v4 = (void *)MEMORY[0x1E0DC3450];
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToUpdateGroupWithError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, 0, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __103__SFSharedAccountsGroupMemberDetailViewController__presentFailedToUpdatePermissionLevelAlertWithError___block_invoke;
  v11[3] = &unk_1E4AC0010;
  v12 = v6;
  v9 = v6;
  objc_msgSend(v7, "actionWithTitle:style:handler:", v8, 0, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v10);

  -[SFSharedAccountsGroupMemberDetailViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

uint64_t __103__SFSharedAccountsGroupMemberDetailViewController__presentFailedToUpdatePermissionLevelAlertWithError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)_showPendingRequestUI:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
    objc_msgSend(v5, "startAnimating");
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
    -[SFSharedAccountsGroupMemberDetailViewController navigationItem](self, "navigationItem");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRightBarButtonItem:", v6);

  }
  else
  {
    -[SFSharedAccountsGroupMemberDetailViewController navigationItem](self, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRightBarButtonItem:", 0);
  }

  v8 = !v3;
  -[SFSharedAccountsGroupMemberDetailViewController navigationItem](self, "navigationItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "leftBarButtonItem");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v8);

  -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setUserInteractionEnabled:", v8);

}

- (BOOL)_canChangeGroupMemberPermissionLevel
{
  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_currentUserGroupMemberData, "groupPermissionLevel") == 2&& (-[_ASAccountSharingGroupMemberData isMeParticipant](self->_groupMemberData, "isMeParticipant") & 1) == 0)
  {
    return !-[SFSharedAccountsGroupMemberDetailViewController _shouldPreventGroupMemberPermissionFromChangingToReadOnly](self, "_shouldPreventGroupMemberPermissionFromChangingToReadOnly");
  }
  else
  {
    return 0;
  }
}

- (BOOL)_shouldPreventGroupMemberPermissionFromChangingToReadOnly
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_currentUserGroupMemberData, "groupPermissionLevel") != 2|| -[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberData, "groupPermissionLevel") == 2)
  {
    return 0;
  }
  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ASAccountSharingGroupMemberData participantID](self->_groupMemberData, "participantID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "_hasPersonWithParticipantID:contributedSavedAccountsToGroupWithID:", v5, v6);

  return v7;
}

- (void)_presentContactViewController
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
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[_ASAccountSharingGroupMemberData contact](self->_groupMemberData, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0C974D8];
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForContact:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C97200];
    -[_ASAccountSharingGroupMemberData handle](self->_groupMemberData, "handle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "contactWithDisplayName:handleStrings:", 0, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewControllerForUnknownContact:", v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "contactStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setContactStore:", v11);

  objc_msgSend(v5, "navigationItem");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setBackButtonDisplayMode:", 1);

  -[SFSharedAccountsGroupMemberDetailViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v5, 1);

}

- (BOOL)_shouldShowContactDetails
{
  void *v3;
  int v4;

  -[_ASAccountSharingGroupMemberData contact](self->_groupMemberData, "contact");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    LOBYTE(v4) = 1;
  else
    v4 = -[_ASAccountSharingGroupMemberData isMeParticipant](self->_groupMemberData, "isMeParticipant") ^ 1;

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  SFSharedAccountsGroupMemberDetailViewController *v11;
  uint64_t v12;
  unint64_t persona;
  id v14;

  v14 = a3;
  v6 = a4;
  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  switch(v8)
  {
    case 0:
      if (-[SFSharedAccountsGroupMemberDetailViewController _shouldShowContactDetails](self, "_shouldShowContactDetails"))
      {
        -[SFSharedAccountsGroupMemberDetailViewController _presentContactViewController](self, "_presentContactViewController");
      }
      break;
    case 1:
      -[UIEditMenuInteraction dismissMenu](self->_editMenuInteraction, "dismissMenu");
      v9 = (void *)MEMORY[0x1E0DC3798];
      objc_msgSend(v14, "rectForRowAtIndexPath:", v6);
      UIRectGetCenter();
      objc_msgSend(v9, "configurationWithIdentifier:sourcePoint:", v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIEditMenuInteraction presentEditMenuWithConfiguration:](self->_editMenuInteraction, "presentEditMenuWithConfiguration:", v10);
      goto LABEL_9;
    case 2:
      v11 = self;
      v12 = 1;
      goto LABEL_7;
    case 3:
      v11 = self;
      v12 = 0;
LABEL_7:
      -[SFSharedAccountsGroupMemberDetailViewController _changeGroupMemberPermissionToPermissionLevel:](v11, "_changeGroupMemberPermissionToPermissionLevel:", v12);
      break;
    case 4:
      persona = self->_persona;
      if (persona == 1)
      {
        -[SFSharedAccountsGroupMemberDetailViewController _presentRemoveMemberConfirmationAlert](self, "_presentRemoveMemberConfirmationAlert");
      }
      else if (!persona)
      {
        -[SFSharedAccountsGroupMemberDetailViewController _removeGroupMember](self, "_removeGroupMember");
      }
      break;
    default:
      break;
  }
  -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 1);
LABEL_9:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;

  -[SFTableViewDiffableDataSource itemIdentifierForIndexPath:](self->_diffableDataSource, "itemIdentifierForIndexPath:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  if ((unint64_t)(v6 - 2) >= 2)
  {
    if (!v6)
      return -[SFSharedAccountsGroupMemberDetailViewController _shouldShowContactDetails](self, "_shouldShowContactDetails");
  }
  else if (self->_persona == 1)
  {
    return -[SFSharedAccountsGroupMemberDetailViewController _canChangeGroupMemberPermissionLevel](self, "_canChangeGroupMemberPermissionLevel");
  }
  return 1;
}

- (id)dataSource:(id)a3 headerTextForSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sectionIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndexedSubscript:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 1)
  {
    _WBSLocalizedString();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)dataSource:(id)a3 footerTextForSection:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[SFTableViewDiffableDataSource snapshot](self->_diffableDataSource, "snapshot", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sectionIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndexedSubscript:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "integerValue");

  if (v9 != 1)
    goto LABEL_6;
  if (-[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_currentUserGroupMemberData, "groupPermissionLevel") != 2&& -[_ASAccountSharingGroupMemberData groupPermissionLevel](self->_groupMemberData, "groupPermissionLevel") != 2)
  {
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    return v10;
  }
  if (-[SFSharedAccountsGroupMemberDetailViewController _shouldPreventGroupMemberPermissionFromChangingToReadOnly](self, "_shouldPreventGroupMemberPermissionFromChangingToReadOnly"))
  {
    objc_msgSend(MEMORY[0x1E0D6C060], "preventReadOnlyPermissionForGroupMemberThatHasContributedPasswordsExplanationFooter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    v10 = 0;
  }
  return v10;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id location;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E0DC39D0];
  v12 = (void *)MEMORY[0x1E0DC3428];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("doc.on.doc"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __109__SFSharedAccountsGroupMemberDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke;
  v22 = &unk_1E4ABFFC0;
  objc_copyWeak(&v23, &location);
  objc_msgSend(v12, "actionWithTitle:image:identifier:handler:", v13, v14, 0, &v19);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1, v19, v20, v21, v22);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "menuWithChildren:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v17;
}

void __109__SFSharedAccountsGroupMemberDetailViewController_editMenuInteraction_menuForConfiguration_suggestedActions___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained[128], "handle");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setString:", v2);

  }
}

- (void)editMenuInteraction:(id)a3 willDismissMenuForConfiguration:(id)a4 animator:(id)a5
{
  void *v6;
  id v7;

  -[SFSharedAccountsGroupMemberDetailViewController _indexPathForEditMenuInteraction:withConfiguration:](self, "_indexPathForEditMenuInteraction:withConfiguration:", a3, a4, a5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

  }
}

- (id)_indexPathForEditMenuInteraction:(id)a3 withConfiguration:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a4, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v7;
  }
  else
  {
    -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFSharedAccountsGroupMemberDetailViewController tableView](self, "tableView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "locationInView:", v10);
    objc_msgSend(v9, "indexPathForRowAtPoint:");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (void)groupProviderReceivedUpdates:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke;
  block[3] = &unk_1E4ABFE00;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[5];

  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupMemberDataForGroup:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1040));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke_2;
  v13[3] = &unk_1E4AC2598;
  v13[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "safari_firstObjectPassingTest:", v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if ((objc_msgSend(v4, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1024)) & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1024), v4);
      objc_msgSend(*(id *)(a1 + 32), "_reloadDiffableDataSource");
    }
  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }

}

uint64_t __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "handle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1024), "handle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (SFSharedAccountsGroupMemberDetailViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupMemberDetailViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_editMenuInteraction, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_currentUserGroupMemberData, 0);
  objc_storeStrong((id *)&self->_groupMemberData, 0);
  objc_storeStrong((id *)&self->_diffableDataSource, 0);
}

- (void)_updatePermissionOnExistingGroupForGroupMemberToPermissionLevel:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "User tried to update group member permission level but is not the owner.", a5, a6, a7, a8, 0);
}

void __115__SFSharedAccountsGroupMemberDetailViewController__updatePermissionOnExistingGroupForGroupMemberToPermissionLevel___block_invoke_3_cold_1(void **a1, void *a2)
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
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to update group member permission level with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

void __80__SFSharedAccountsGroupMemberDetailViewController_groupProviderReceivedUpdates___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to find updated group member data for group member detail view.", a5, a6, a7, a8, 0);
}

@end
