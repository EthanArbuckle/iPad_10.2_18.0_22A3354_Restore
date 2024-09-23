@implementation SFSharedAccountsGroupCreationFlowNavigationController

- (SFSharedAccountsGroupCreationFlowNavigationController)initWithOriginType:(int64_t)a3 initialParticipants:(id)a4 passwordWarningManager:(id)a5
{
  id v8;
  id v9;
  SFSharedAccountsGroupCreationFlowNavigationController *v10;
  uint64_t v11;
  NSArray *participants;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  SFSharedAccountsGroupCreationFlowNavigationController *v17;
  objc_super v19;

  v8 = a4;
  v9 = a5;
  v19.receiver = self;
  v19.super_class = (Class)SFSharedAccountsGroupCreationFlowNavigationController;
  v10 = -[SFSharedAccountsGroupCreationFlowNavigationController initWithNibName:bundle:](&v19, sel_initWithNibName_bundle_, 0, 0);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    participants = v10->_participants;
    v10->_participants = (NSArray *)v11;

    v10->_originType = a3;
    objc_storeStrong((id *)&v10->_passwordWarningManager, a5);
    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "cachedGroups");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");

    if (v15)
    {
      -[SFSharedAccountsGroupCreationFlowNavigationController _composeSharedCredentialsGroupCreationViewController](v10, "_composeSharedCredentialsGroupCreationViewController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92638]), "initWithContentType:group:", 0, 0);
      objc_msgSend(v16, "setDelegate:", v10);
    }
    -[SFSharedAccountsGroupCreationFlowNavigationController _fetchDeviceLists](v10, "_fetchDeviceLists");
    -[SFSharedAccountsGroupCreationFlowNavigationController pushViewController:animated:](v10, "pushViewController:animated:", v16, 0);
    v17 = v10;

  }
  return v10;
}

- (id)_composeSharedCredentialsGroupCreationViewController
{
  void *v3;
  void *v4;

  if (self->_originType == 1)
  {
    _WBSLocalizedString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  +[SFSharedAccountsGroupViewController groupCreationViewControllerWithInitialParticipants:prepopulatedName:](SFSharedAccountsGroupViewController, "groupCreationViewControllerWithInitialParticipants:prepopulatedName:", self->_participants, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setModalInPresentation:", 1);

  return v4;
}

- (void)_presentSharedCredentialsGroupCreationViewController
{
  id v3;

  -[SFSharedAccountsGroupCreationFlowNavigationController _composeSharedCredentialsGroupCreationViewController](self, "_composeSharedCredentialsGroupCreationViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupCreationFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (void)_showGroupInviteMessagePreviewIfNecessary
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  SFSharedAccountsGroupMessageInvitePreviewViewController *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  -[KCSharingGroup participants](self->_group, "participants");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4 == 1)
  {
    -[SFSharedAccountsGroupCreationFlowNavigationController _completeFlowWithGroup:error:](self, "_completeFlowWithGroup:error:", self->_group, 0);
  }
  else if ((objc_msgSend(MEMORY[0x1E0CC68C8], "isiMessageEnabled") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0C92620], "sharedManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "groupMemberDataForGroup:", self->_group);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "safari_filterObjectsUsingBlock:", &__block_literal_global_11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[SFSharedAccountsGroupMessageInvitePreviewViewController initWithGroup:invitedGroupMemberData:]([SFSharedAccountsGroupMessageInvitePreviewViewController alloc], "initWithGroup:invitedGroupMemberData:", self->_group, v6);
    -[SFSharedAccountsGroupMessageInvitePreviewViewController setDelegate:](v7, "setDelegate:", self);
    -[SFSharedAccountsGroupCreationFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v7, 1);

  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEFAULT, "iMessage is not enabled. Not prompting to send invite.", buf, 2u);
    }
    -[SFSharedAccountsGroupCreationFlowNavigationController _completeFlowWithGroup:error:](self, "_completeFlowWithGroup:error:", self->_group, 0);
  }
}

uint64_t __98__SFSharedAccountsGroupCreationFlowNavigationController__showGroupInviteMessagePreviewIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isMeParticipant") ^ 1;
}

- (void)_showGroupInviteMessageComposeSheetForGroupWithInvitedGroupMemberData:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  SFSharedAccountsGroupInvitationMessageComposeViewController *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C92620];
  v5 = a3;
  objc_msgSend(v4, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "KCSharingParticipantsFromGroupMembers:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[SFSharedAccountsGroupInvitationMessageComposeViewController initWithGroup:participantsToInvite:]([SFSharedAccountsGroupInvitationMessageComposeViewController alloc], "initWithGroup:participantsToInvite:", self->_group, v8);
  -[SFSharedAccountsGroupInvitationMessageComposeViewController setMessageComposeDelegate:](v7, "setMessageComposeDelegate:", self);
  -[SFSharedAccountsGroupCreationFlowNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_completeFlowWithGroup:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  _QWORD v14[5];
  id v15;

  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_sharingDelegate);
  v9 = WeakRetained;
  if (v6)
  {
    -[SFSharedAccountsGroupCreationFlowNavigationController savedAccountToMoveToNewlyCreatedGroup](self, "savedAccountToMoveToNewlyCreatedGroup");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10
      && (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore"),
          v11 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v6, "groupID"),
          v12 = (void *)objc_claimAutoreleasedReturnValue(),
          v13 = objc_msgSend(v11, "_moveSavedAccount:toGroupWithID:", v10, v12),
          v12,
          v11,
          !v13))
    {
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __86__SFSharedAccountsGroupCreationFlowNavigationController__completeFlowWithGroup_error___block_invoke;
      v14[3] = &unk_1E4ABFB20;
      v14[4] = self;
      v15 = v6;
      dispatch_async(MEMORY[0x1E0C80D38], v14);

    }
    else
    {
      objc_msgSend(v9, "groupCreationFlowNavigationController:finishedWithGroup:error:", self, v6, v7);
    }

  }
  else
  {
    objc_msgSend(WeakRetained, "groupCreationFlowNavigationController:finishedWithGroup:error:", self, 0, v7);
  }

}

uint64_t __86__SFSharedAccountsGroupCreationFlowNavigationController__completeFlowWithGroup_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentErrorAlertForFailingToMoveAccountToGroup:", *(_QWORD *)(a1 + 40));
}

- (void)_presentErrorAlertForFailingToMoveAccountToGroup:(id)a3
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
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  SFSharedAccountsGroupCreationFlowNavigationController *v20;
  id v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D6C058], "alertTitleForFailingToMoveToGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D6C058];
  -[SFSharedAccountsGroupCreationFlowNavigationController savedAccountToMoveToNewlyCreatedGroup](self, "savedAccountToMoveToNewlyCreatedGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "alertSubtitleForFailingToMoveSavedAccounts:toGroupWithName:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", v5, v10, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0DC3448];
  _WBSLocalizedString();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __106__SFSharedAccountsGroupCreationFlowNavigationController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke;
  v19 = &unk_1E4AC0128;
  v20 = self;
  v21 = v4;
  v14 = v4;
  objc_msgSend(v12, "actionWithTitle:style:handler:", v13, 0, &v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addAction:", v15, v16, v17, v18, v19, v20);

  -[SFSharedAccountsGroupCreationFlowNavigationController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);
}

void __106__SFSharedAccountsGroupCreationFlowNavigationController__presentErrorAlertForFailingToMoveAccountToGroup___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1456));
  objc_msgSend(WeakRetained, "groupCreationFlowNavigationController:finishedWithGroup:error:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);

}

- (void)_fetchDeviceLists
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x1E0D6C048];
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke;
  v3[3] = &unk_1E4AC1B48;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "fetchListsOfSharingDevicesSeparatedByAvailability:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  _QWORD block[4];
  id v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke_2;
  block[3] = &unk_1E4AC07A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke_2(void **a1)
{
  id *WeakRetained;
  NSObject *v3;

  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    if (a1[4])
    {
      v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
        __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke_2_cold_1(a1 + 4, v3);
    }
    objc_storeStrong(WeakRetained + 180, a1[5]);
    *((_BYTE *)WeakRetained + 1449) = 1;
    objc_msgSend(WeakRetained, "_presentDeviceListViewIfNecessary");
  }

}

- (void)_presentDeviceListViewIfNecessary
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (self->_isWaitingOnDeviceListToContinueFlow && self->_hasFetchedDeviceList)
  {
    -[PMDeviceSharingAvailability devicesWithSharingUnavailable](self->_deviceSharingAvailability, "devicesWithSharingUnavailable");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      objc_msgSend(MEMORY[0x1E0D6C040], "makeUIViewControllerWithDeviceSharingAvailability:", self->_deviceSharingAvailability);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
      _WBSLocalizedString();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__showMoveAccountsPickerIfNecessary);
      objc_msgSend(v10, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:", v7);

      objc_msgSend(v10, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidesBackButton:", 1);

      objc_msgSend(v10, "setModalInPresentation:", 1);
      -[SFSharedAccountsGroupCreationFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, 1);

    }
    else
    {
      -[SFSharedAccountsGroupCreationFlowNavigationController _showMoveAccountsPickerIfNecessary](self, "_showMoveAccountsPickerIfNecessary");
    }
  }
}

- (void)accountSharingGroupOnBoardingViewControllerDidSelectCancel:(id)a3
{
  -[SFSharedAccountsGroupCreationFlowNavigationController _completeFlowWithGroup:error:](self, "_completeFlowWithGroup:error:", 0, 0);
}

- (void)createGroupViewController:(id)a3 completedWithGroup:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id WeakRetained;
  _QWORD block[5];

  v8 = a4;
  v9 = a5;
  if (v8)
  {
    objc_storeStrong((id *)&self->_group, a4);
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_addNewGroupToCachedSharingGroups:", v8);

    objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_addNewGroupToCachedGroups:", v8);

    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__SFSharedAccountsGroupCreationFlowNavigationController_createGroupViewController_completedWithGroup_error___block_invoke;
    block[3] = &unk_1E4ABFE00;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_sharingDelegate);
    objc_msgSend(WeakRetained, "groupCreationFlowNavigationController:finishedWithGroup:error:", self, 0, v9);

  }
}

uint64_t __108__SFSharedAccountsGroupCreationFlowNavigationController_createGroupViewController_completedWithGroup_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1448) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_presentDeviceListViewIfNecessary");
}

- (void)_showMoveAccountsPickerIfNecessary
{
  void *v3;
  void *v4;
  uint64_t v5;
  SFMoveAccountsToGroupPickerViewController *v6;
  KCSharingGroup *group;
  void *v8;
  void *v9;
  SFMoveAccountsToGroupPickerViewController *v10;

  if (self->_originType == 2
    || (objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "savedAccounts"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "count"),
        v4,
        v3,
        !v5))
  {
    -[SFSharedAccountsGroupCreationFlowNavigationController _showGroupInviteMessagePreviewIfNecessary](self, "_showGroupInviteMessagePreviewIfNecessary");
  }
  else
  {
    v6 = [SFMoveAccountsToGroupPickerViewController alloc];
    group = self->_group;
    +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "autoFillQuirksManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SFMoveAccountsToGroupPickerViewController initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:](v6, "initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:", group, 0, v9, self->_passwordWarningManager);

    -[SFMoveAccountsToGroupPickerViewController setDelegate:](v10, "setDelegate:", self);
    -[SFSharedAccountsGroupCreationFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, 1);

  }
}

- (void)moveAccountsToGroupPickerTableViewController:(id)a3 didPickSavedAccounts:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[KCSharingGroup groupID](self->_group, "groupID");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "_moveSavedAccount:toGroupWithID:", v10, v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }
  -[SFSharedAccountsGroupCreationFlowNavigationController _showGroupInviteMessagePreviewIfNecessary](self, "_showGroupInviteMessagePreviewIfNecessary");

}

- (void)groupMessageInvitePreviewViewControllerDidSelectContinue:(id)a3
{
  id v4;

  objc_msgSend(a3, "invitedGroupMemberData");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SFSharedAccountsGroupCreationFlowNavigationController _showGroupInviteMessageComposeSheetForGroupWithInvitedGroupMemberData:](self, "_showGroupInviteMessageComposeSheetForGroupWithInvitedGroupMemberData:", v4);

}

- (void)groupMessageInvitePreviewViewControllerDidSelectCancel:(id)a3
{
  -[SFSharedAccountsGroupCreationFlowNavigationController _completeFlowWithGroup:error:](self, "_completeFlowWithGroup:error:", self->_group, 0);
}

- (void)messageComposeViewController:(id)a3 didFinishWithResult:(int64_t)a4
{
  NSObject *v6;
  int v7;
  int64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134217984;
    v8 = a4;
    _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_DEFAULT, "Finished message compose with result: %ld", (uint8_t *)&v7, 0xCu);
  }
  -[SFSharedAccountsGroupCreationFlowNavigationController _completeFlowWithGroup:error:](self, "_completeFlowWithGroup:error:", self->_group, 0);
}

- (SFSharedAccountsGroupCreationFlowNavigationControllerDelegate)sharingDelegate
{
  return (SFSharedAccountsGroupCreationFlowNavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_sharingDelegate);
}

- (void)setSharingDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_sharingDelegate, a3);
}

- (WBSSavedAccount)savedAccountToMoveToNewlyCreatedGroup
{
  return self->_savedAccountToMoveToNewlyCreatedGroup;
}

- (void)setSavedAccountToMoveToNewlyCreatedGroup:(id)a3
{
  objc_storeStrong((id *)&self->_savedAccountToMoveToNewlyCreatedGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedAccountToMoveToNewlyCreatedGroup, 0);
  objc_destroyWeak((id *)&self->_sharingDelegate);
  objc_storeStrong((id *)&self->_deviceSharingAvailability, 0);
  objc_storeStrong((id *)&self->_passwordWarningManager, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_participants, 0);
}

void __74__SFSharedAccountsGroupCreationFlowNavigationController__fetchDeviceLists__block_invoke_2_cold_1(void **a1, void *a2)
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
  objc_msgSend(v2, "safari_privacyPreservingError");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to fetch device list with error: %@", (uint8_t *)&v5, 0xCu);

}

@end
