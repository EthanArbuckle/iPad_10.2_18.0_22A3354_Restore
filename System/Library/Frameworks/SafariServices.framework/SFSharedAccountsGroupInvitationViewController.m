@implementation SFSharedAccountsGroupInvitationViewController

- (SFSharedAccountsGroupInvitationViewController)initWithGroup:(id)a3
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SFSharedAccountsGroupInvitationViewController *v19;
  SFSharedAccountsGroupInvitationViewController *v20;
  uint64_t v21;
  NSArray *groupMembersData;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SFSharedAccountsGroupInvitationViewController *v35;
  void *v37;
  objc_super v38;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "participants");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "groupMemberDataForGroupParticipants:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "safari_firstObjectPassingTest:", &__block_literal_global_28);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  v12 = (void *)MEMORY[0x1E0C92610];
  if (v10)
  {
    objc_msgSend(v5, "displayName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "knownSenderHeaderTitleWithGroupName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0C92610];
    objc_msgSend(v5, "currentUserParticipant");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "knownSenderHeaderSubtitleForPermissionLevel:", objc_msgSend(v16, "permissionLevel"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C92610], "knownSenderHeaderImage");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderHeaderTitle");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderHeaderSubtitle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderHeaderImage");
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38.receiver = self;
  v38.super_class = (Class)SFSharedAccountsGroupInvitationViewController;
  v19 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v38, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v14, v17, v18, 1);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_group, a3);
    objc_msgSend(v8, "safari_filterObjectsUsingBlock:", &__block_literal_global_3);
    v21 = objc_claimAutoreleasedReturnValue();
    groupMembersData = v20->_groupMembersData;
    v20->_groupMembersData = (NSArray *)v21;

    v20->_persona = v11;
    v23 = objc_alloc(MEMORY[0x1E0DC3D48]);
    v24 = (void *)objc_msgSend(v23, "initWithFrame:style:", 2, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setBackgroundColor:", v25);

    objc_msgSend(v24, "setDelegate:", v20);
    objc_msgSend(v24, "setDataSource:", v20);
    -[OBTableWelcomeController setTableView:](v20, "setTableView:", v24);
    v26 = objc_alloc(MEMORY[0x1E0DC34F0]);
    objc_msgSend(MEMORY[0x1E0C92610], "cancelButtonTitle");
    v37 = v18;
    v27 = v17;
    v28 = v5;
    v29 = v14;
    v30 = v8;
    v31 = v9;
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = (void *)objc_msgSend(v26, "initWithTitle:style:target:action:", v32, 2, v20, sel__cancelButtonSelected);
    -[OBBaseWelcomeController navigationItem](v20, "navigationItem");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setLeftBarButtonItem:", v33);

    v9 = v31;
    v8 = v30;
    v14 = v29;
    v5 = v28;
    v17 = v27;
    v18 = v37;
    v35 = v20;

  }
  return v20;
}

BOOL __63__SFSharedAccountsGroupInvitationViewController_initWithGroup___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "groupPermissionLevel") == 2;
}

uint64_t __63__SFSharedAccountsGroupInvitationViewController_initWithGroup___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMeParticipant") ^ 1;
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFSharedAccountsGroupInvitationViewController;
  -[OBTableWelcomeController viewDidLoad](&v3, sel_viewDidLoad);
  -[SFSharedAccountsGroupInvitationViewController _addJoinAndCancelButtonsToButtonTray](self, "_addJoinAndCancelButtonsToButtonTray");
}

- (void)_addJoinAndCancelButtonsToButtonTray
{
  unint64_t persona;
  OBTrayButton *v4;
  OBTrayButton *v5;
  void *v6;
  OBTrayButton *v7;
  OBTrayButton *v8;
  void *v9;
  void *v10;
  OBTrayButton *v11;
  OBTrayButton *v12;
  OBTrayButton *acceptButton;
  void *v14;
  OBTrayButton *v15;
  OBTrayButton *declineButton;
  OBTrayButton *v17;
  void *v18;
  OBTrayButton *v19;
  void *v20;

  persona = self->_persona;
  if (!persona)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v12 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    acceptButton = self->_acceptButton;
    self->_acceptButton = v12;

    -[SFSharedAccountsGroupInvitationViewController buttonTray](self, "buttonTray");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addButton:", self->_acceptButton);

    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v15 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    declineButton = self->_declineButton;
    self->_declineButton = v15;

    -[SFSharedAccountsGroupInvitationViewController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = self->_declineButton;
    goto LABEL_5;
  }
  if (persona == 1)
  {
    objc_msgSend(MEMORY[0x1E0D65140], "boldButton");
    v4 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    v5 = self->_declineButton;
    self->_declineButton = v4;

    -[SFSharedAccountsGroupInvitationViewController buttonTray](self, "buttonTray");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addButton:", self->_declineButton);

    objc_msgSend(MEMORY[0x1E0D65170], "linkButton");
    v7 = (OBTrayButton *)objc_claimAutoreleasedReturnValue();
    v8 = self->_acceptButton;
    self->_acceptButton = v7;

    -[SFSharedAccountsGroupInvitationViewController buttonTray](self, "buttonTray");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = self->_acceptButton;
LABEL_5:
    objc_msgSend(v9, "addButton:", v11);

  }
  v17 = self->_acceptButton;
  objc_msgSend(MEMORY[0x1E0C92610], "acceptButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v17, "setTitle:forState:", v18, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_acceptButton, "addTarget:action:forControlEvents:", self, sel__acceptButtonSelected, 64);
  v19 = self->_declineButton;
  objc_msgSend(MEMORY[0x1E0C92610], "declineButtonTitle");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTrayButton setTitle:forState:](v19, "setTitle:forState:", v20, 0);

  -[OBTrayButton addTarget:action:forControlEvents:](self->_declineButton, "addTarget:action:forControlEvents:", self, sel__declineButtonSelected, 64);
}

- (void)_addLoadingIndicatorAndMakeButtonsInactive
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3438]), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v5, "startAnimating");
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", v5);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRightBarButtonItem:", v3);

  -[OBTrayButton setEnabled:](self->_acceptButton, "setEnabled:", 0);
  -[OBTrayButton setEnabled:](self->_declineButton, "setEnabled:", 0);

}

- (void)_acceptButtonSelected
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];

  -[SFSharedAccountsGroupInvitationViewController _addLoadingIndicatorAndMakeButtonsInactive](self, "_addLoadingIndicatorAndMakeButtonsInactive");
  objc_msgSend(MEMORY[0x1E0CD5C50], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupInvitationViewController group](self, "group");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke;
  v6[3] = &unk_1E4AC1BF8;
  v6[4] = self;
  objc_msgSend(v3, "acceptInviteForGroupID:completion:", v5, v6);

}

void __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2;
  block[3] = &unk_1E4ABFC38;
  block[4] = *(_QWORD *)(a1 + 32);
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1256));
  if (*(_QWORD *)(a1 + 40))
  {
    v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2_cold_2((void **)(a1 + 40), v3);
    objc_msgSend(WeakRetained, "invitationViewController:failedToAcceptInvitationWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4 = *(void **)(a1 + 48);
    if (v4)
    {
      v5 = v4;
    }
    else
    {
      v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2_cold_1(v6);
      objc_msgSend(*(id *)(a1 + 32), "group");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v5;
    objc_msgSend(WeakRetained, "invitationViewController:acceptedInvitationForGroup:", *(_QWORD *)(a1 + 32), v5);

  }
}

- (void)_declineButtonSelected
{
  void *v3;
  id WeakRetained;

  -[SFSharedAccountsGroupInvitationViewController _addLoadingIndicatorAndMakeButtonsInactive](self, "_addLoadingIndicatorAndMakeButtonsInactive");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  -[SFSharedAccountsGroupInvitationViewController group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "invitationViewController:declinedInvitationForGroup:", self, v3);

}

- (void)_cancelButtonSelected
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "invitationViewControllerChoseNotToRespondToInvitation:", self);

}

- (void)_setBackgroundColorOnTableViewHeaderFooterView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    -[OBTableWelcomeController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "backgroundColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setBackgroundColor:", v6);

    objc_msgSend(v7, "setBackgroundView:", v4);
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_groupMembersData, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  NSArray *groupMembersData;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;

  v5 = a4;
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("groupMemberCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 0, CFSTR("groupMemberCell"));
  v10 = v9;

  groupMembersData = self->_groupMembersData;
  v12 = objc_msgSend(v5, "row");

  -[NSArray objectAtIndexedSubscript:](groupMembersData, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v15);

  v16 = objc_msgSend(v13, "groupPermissionLevel");
  if (v16 == 2 || objc_msgSend(v13, "inviteStatus") == 1 || !objc_msgSend(v13, "groupPermissionLevel"))
  {
    _WBSLocalizedString();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSecondaryText:", v17);

  }
  else
  {
    objc_msgSend(v14, "setSecondaryText:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setColor:", v18);

  if (v16 == 2 && self->_persona == 1)
  {
    objc_msgSend(MEMORY[0x1E0C92610], "unknownSenderCellImage");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v13, "avatarImageForGroupMemberCell");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  objc_msgSend(v14, "setImage:", v20);

  objc_msgSend(v10, "setContentConfiguration:", v14);
  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0C92610];
  -[KCSharingGroup currentUserParticipant](self->_group, "currentUserParticipant", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupMemberListFooterTextForPermissionLevel:", objc_msgSend(v5, "permissionLevel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  -[SFSharedAccountsGroupInvitationViewController _setBackgroundColorOnTableViewHeaderFooterView:](self, "_setBackgroundColorOnTableViewHeaderFooterView:", a4);
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  -[SFSharedAccountsGroupInvitationViewController _setBackgroundColorOnTableViewHeaderFooterView:](self, "_setBackgroundColorOnTableViewHeaderFooterView:", a4);
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (SFSharedAccountsGroupInvitationViewControllerDelegate)delegate
{
  return (SFSharedAccountsGroupInvitationViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (KCSharingGroup)group
{
  return self->_group;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_group, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_declineButton, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_groupMembersData, 0);
}

void __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "KCSharingGroupManager create request succeeded but returned a nil group in the completion handler.", v1, 2u);
}

void __70__SFSharedAccountsGroupInvitationViewController__acceptButtonSelected__block_invoke_2_cold_2(void **a1, void *a2)
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
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to accept shared accounts group invite with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
