@implementation SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController

- (SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController)initWithGroup:(id)a3 autoFillQuirksManager:(id)a4 passwordWarningManager:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController *v13;
  SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController *v14;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92638]), "initWithContentType:group:", 1, v9);
  v16.receiver = self;
  v16.super_class = (Class)SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController;
  v13 = -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController initWithRootViewController:](&v16, sel_initWithRootViewController_, v12);
  if (v13)
  {
    objc_msgSend(v12, "setDelegate:", v13);
    objc_storeStrong((id *)&v13->_group, a3);
    objc_storeStrong((id *)&v13->_autoFillQuirksManager, a4);
    objc_storeStrong((id *)&v13->_passwordWarningManager, a5);
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _fetchDeviceLists](v13, "_fetchDeviceLists");
    v14 = v13;
  }

  return v13;
}

- (void)_presentMoveAccountsOnboardingViewController
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C92638]), "initWithContentType:group:", 2, self->_group);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (void)_presentMoveAccountsViewController
{
  SFMoveAccountsToGroupPickerViewController *v3;

  v3 = -[SFMoveAccountsToGroupPickerViewController initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:]([SFMoveAccountsToGroupPickerViewController alloc], "initWithGroup:pickerType:autoFillQuirksManager:passwordWarningManager:", self->_group, 0, self->_autoFillQuirksManager, self->_passwordWarningManager);
  -[SFMoveAccountsToGroupPickerViewController setDelegate:](v3, "setDelegate:", self);
  -[SFMoveAccountsToGroupPickerViewController setModalInPresentation:](v3, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (void)_presentRemoveDuplicateCredentialsOnboardingViewController
{
  id v3;

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C92638]), "initWithContentType:group:", 3, self->_group);
  objc_msgSend(v3, "setDelegate:", self);
  objc_msgSend(v3, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (void)_presentRemoveDuplicateCredentialsViewController
{
  SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController *v3;

  v3 = -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController initWithGroup:autoFillQuirksManager:]([SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController alloc], "initWithGroup:autoFillQuirksManager:", self->_group, self->_autoFillQuirksManager);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController setDelegate:](v3, "setDelegate:", self);
  -[SFSharedAccountsGroupInvitationAcceptanceRemoveDuplicateCredentialsViewController setModalInPresentation:](v3, "setModalInPresentation:", 1);
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v3, 1);

}

- (BOOL)_shouldAskUserToMoveAccounts
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccounts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)_shouldAskUserToDeleteDuplicateCredentials
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[KCSharingGroup groupID](self->_group, "groupID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duplicateAccountsWithGroupID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count") != 0;

  return v6;
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
  v3[2] = __86__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController__fetchDeviceLists__block_invoke;
  v3[3] = &unk_1E4AC1B48;
  objc_copyWeak(&v4, &location);
  objc_msgSend(v2, "fetchListsOfSharingDevicesSeparatedByAvailability:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __86__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController__fetchDeviceLists__block_invoke(uint64_t a1, void *a2, void *a3)
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
  block[2] = __86__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController__fetchDeviceLists__block_invoke_2;
  block[3] = &unk_1E4AC07A8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  v10 = v6;
  v11 = v5;
  v7 = v5;
  v8 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v12);
}

void __86__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController__fetchDeviceLists__block_invoke_2(void **a1)
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
    objc_storeStrong(WeakRetained + 179, a1[5]);
    *((_BYTE *)WeakRetained + 1441) = 1;
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
      v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__presentMoveAccountViewsIfNecessary);
      objc_msgSend(v10, "navigationItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setRightBarButtonItem:", v7);

      objc_msgSend(v10, "navigationItem");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHidesBackButton:", 1);

      objc_msgSend(v10, "setModalInPresentation:", 1);
      -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController pushViewController:animated:](self, "pushViewController:animated:", v10, 1);

    }
    else
    {
      -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentMoveAccountViewsIfNecessary](self, "_presentMoveAccountViewsIfNecessary");
    }
  }
}

- (void)_presentMoveAccountViewsIfNecessary
{
  if (-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _shouldAskUserToMoveAccounts](self, "_shouldAskUserToMoveAccounts"))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentMoveAccountsOnboardingViewController](self, "_presentMoveAccountsOnboardingViewController");
  }
  else if (-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _shouldAskUserToDeleteDuplicateCredentials](self, "_shouldAskUserToDeleteDuplicateCredentials"))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentMoveAccountsViewController](self, "_presentMoveAccountsViewController");
  }
  else
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }
}

- (void)accountSharingGroupOnBoardingViewControllerDidSelectContinue:(id)a3
{
  uint64_t v4;
  _QWORD block[5];

  v4 = objc_msgSend(a3, "contentType");
  switch(v4)
  {
    case 3:
      -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentRemoveDuplicateCredentialsViewController](self, "_presentRemoveDuplicateCredentialsViewController");
      break;
    case 2:
      -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentMoveAccountsViewController](self, "_presentMoveAccountsViewController");
      break;
    case 1:
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __130__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController_accountSharingGroupOnBoardingViewControllerDidSelectContinue___block_invoke;
      block[3] = &unk_1E4ABFE00;
      block[4] = self;
      dispatch_async(MEMORY[0x1E0C80D38], block);
      break;
  }
}

uint64_t __130__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController_accountSharingGroupOnBoardingViewControllerDidSelectContinue___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1440) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_presentDeviceListViewIfNecessary");
}

- (void)accountSharingGroupOnBoardingViewControllerDidSelectNotNow:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "contentType");
  if (v4 == 3)
    goto LABEL_5;
  if (v4 != 2)
    return;
  if (!-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _shouldAskUserToDeleteDuplicateCredentials](self, "_shouldAskUserToDeleteDuplicateCredentials"))LABEL_5:-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  else
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentRemoveDuplicateCredentialsOnboardingViewController](self, "_presentRemoveDuplicateCredentialsOnboardingViewController");
}

- (void)moveAccountsToGroupPickerTableViewControllerDidCancel:(id)a3
{
  if (-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _shouldAskUserToDeleteDuplicateCredentials](self, "_shouldAskUserToDeleteDuplicateCredentials", a3))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentRemoveDuplicateCredentialsOnboardingViewController](self, "_presentRemoveDuplicateCredentialsOnboardingViewController");
  }
  else
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
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
  if (-[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _shouldAskUserToDeleteDuplicateCredentials](self, "_shouldAskUserToDeleteDuplicateCredentials"))
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController _presentRemoveDuplicateCredentialsOnboardingViewController](self, "_presentRemoveDuplicateCredentialsOnboardingViewController");
  }
  else
  {
    -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  }

}

- (void)removeDuplicateCredentialsViewControllerDidSelectNotNow:(id)a3
{
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)removeDuplicateCredentialsViewController:(id)a3 didPickSavedAccounts:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __131__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController_removeDuplicateCredentialsViewController_didPickSavedAccounts___block_invoke;
  v7[3] = &unk_1E4ABFE00;
  v8 = v5;
  v6 = v5;
  -[SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v7);

}

void __131__SFSharedAccountsGroupInvitationAcceptanceFlowNavigationController_removeDuplicateCredentialsViewController_didPickSavedAccounts___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
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
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * v5);
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v7, "_moveCredentialTypesToRecentlyDeleted:fromSavedAccount:", objc_msgSend(v6, "credentialTypes"), v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceSharingAvailability, 0);
  objc_storeStrong((id *)&self->_passwordWarningManager, 0);
  objc_storeStrong((id *)&self->_autoFillQuirksManager, 0);
  objc_storeStrong((id *)&self->_group, 0);
}

@end
