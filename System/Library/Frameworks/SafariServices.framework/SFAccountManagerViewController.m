@implementation SFAccountManagerViewController

void __50___SFAccountManagerViewController_viewWillAppear___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __50___SFAccountManagerViewController_viewWillAppear___block_invoke_cold_1(v7, v6);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __50___SFAccountManagerViewController_viewWillAppear___block_invoke_72;
    v8[3] = &unk_1E4ABFF70;
    objc_copyWeak(&v10, (id *)(a1 + 32));
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], v8);

    objc_destroyWeak(&v10);
  }

}

void __50___SFAccountManagerViewController_viewWillAppear___block_invoke_72(uint64_t a1)
{
  _BYTE *WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    WeakRetained[1274] = 1;
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateSecurityRecommendationsSubtitleTextWithWarnings:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v3, "_reloadSecurityRecommendationsSection");
    WeakRetained = v3;
  }

}

id __46___SFAccountManagerViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  void *v12;

  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_cellForIdentifier:tableView:indexPath:", v9, v7, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __54___SFAccountManagerViewController__ellipsisButtonMenu__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setEditing:animated:", 1, 1);

}

void __54___SFAccountManagerViewController__ellipsisButtonMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentGeneratedPasswordsViewFilteredUsingSearchPattern:", 0);

}

void __64___SFAccountManagerViewController__addButtonMenuForTopLevelView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_addNewPassword:", 0);

}

void __64___SFAccountManagerViewController__addButtonMenuForTopLevelView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:", 0);

}

void __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_addNewPassword:", 0);

}

void __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentMovePasswordsToExistingGroupViewController");

}

void __67___SFAccountManagerViewController__addButtonMenuForGroupDetailView__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_presentGroupManagementViewControllerForStartingAcceleratedAddMembersFlow:", 1);

}

void __87___SFAccountManagerViewController_presentConfirmationAlertToShareSavedAccount_toGroup___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD *v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "groupID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v3, "_moveSavedAccount:toGroupWithID:", v4, v5);

    if ((v4 & 1) != 0)
    {
      v6 = (void *)v8[133];
      objc_msgSend(v6, "snapshot");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "applySnapshotUsingReloadData:", v7);

    }
    else
    {
      objc_msgSend(v8, "_presentErrorAlertForFailingToMoveAccount:toGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    }
    WeakRetained = v8;
  }

}

uint64_t __85___SFAccountManagerViewController__presentErrorAlertForFailingToMoveAccount_toGroup___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __60___SFAccountManagerViewController_traitCollectionDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
}

uint64_t __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_presentViewControllerForGroupIDIfPossible:", *(_QWORD *)(a1 + 40));
}

uint64_t __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "savedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (objc_msgSend(v4, "user"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v6 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)),
          v5,
          v6))
    {
      objc_msgSend(v4, "protectionSpaces");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke_3;
      v10[3] = &unk_1E4AC0060;
      v11 = *(id *)(a1 + 40);
      v8 = objc_msgSend(v7, "safari_containsObjectPassingTest:", v10);

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __112___SFAccountManagerViewController_additionalViewControllersToPushHandlingURLResourceDictionary_didAuthenticate___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "host");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

void __66___SFAccountManagerViewController_viewControllerForTOTPGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  SFAccountDetailViewController *v9;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "totpGenerators");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "count");

    if (v6)
    {
      objc_msgSend(*(id *)(a1 + 32), "_presentDuplicateCodeGeneratorAlert");
      v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __66___SFAccountManagerViewController_viewControllerForTOTPGenerator___block_invoke_cold_1(v7, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "saveTOTPGenerator:forSavedAccount:", *(_QWORD *)(a1 + 40), v4);

      v9 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v4, 0, objc_msgSend(*(id *)(a1 + 32), "_detailViewOptionsForSavedAccount:", v4));
      -[SFAccountDetailViewController setDelegate:](v9, "setDelegate:", *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 32), "_presentDetailViewController:", v9);

    }
  }

}

uint64_t __74___SFAccountManagerViewController__presentInvalidOtpauthMigrationURLAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __78___SFAccountManagerViewController__presentViewControllerForGroupIDIfPossible___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __78___SFAccountManagerViewController__presentViewControllerForGroupIDIfPossible___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __70___SFAccountManagerViewController__presentDuplicateCodeGeneratorAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __65___SFAccountManagerViewController__presentInvalidOtpauthURLAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __56___SFAccountManagerViewController__saveSharableAccount___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "savedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", a1[4]))
    {
      objc_msgSend(v4, "password");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", a1[5]))
      {
        objc_msgSend(v4, "highLevelDomain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", a1[6]);

      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void __88___SFAccountManagerViewController__presentAlertForSharableAccountWithPasswordConflicts___block_invoke(uint64_t a1)
{
  SFAccountDetailViewController *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "_saveSharableAccountWithPasswordConflicts:", *(_QWORD *)(a1 + 40));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", v3, 0, objc_msgSend(*(id *)(a1 + 32), "_detailViewOptionsForSavedAccount:", v3));
  -[SFAccountDetailViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "_presentDetailViewController:", v2);

}

uint64_t __75___SFAccountManagerViewController__accountCellDataForUser_highLevelDomain___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "savedAccount");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(v3, "highLevelDomain");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "savedAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_softDeleteAccountsAtIndexPaths:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_reloadAccountSourcesSection");
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __104___SFAccountManagerViewController__presentAlertToConfirmDeletingAccountsAtIndexPaths_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

uint64_t __74___SFAccountManagerViewController__managedConfigurationSettingsDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
}

void __96___SFAccountManagerViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v5 = (void *)MEMORY[0x1E0C99D20];
  v6 = a4;
  objc_msgSend(v5, "arrayWithObjects:count:", &v8, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_presentAlertToConfirmDeletingAccountsAtIndexPaths:completionHandler:", v7, v6, v8, v9);

}

void __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 1280);
  *(_QWORD *)(v2 + 1280) = 0;

  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    v5 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke_2;
    v19[3] = &unk_1E4ABFB20;
    v6 = v4;
    v7 = *(_QWORD *)(a1 + 32);
    v20 = v6;
    v21 = v7;
    v8 = MEMORY[0x1A8598C40](v19);
    v9 = (void *)v8;
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376))
    {
      objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "allUnexpiredGeneratedPasswords");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "count");

      if (v12 <= 1)
      {
        v13 = *(void **)(a1 + 32);
        v17[0] = v5;
        v17[1] = 3221225472;
        v17[2] = __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke_3;
        v17[3] = &unk_1E4AC0230;
        v18 = v9;
        objc_msgSend(v13, "dismissViewControllerAnimated:completion:", 1, v17);

      }
      objc_msgSend(MEMORY[0x1E0D8A970], "sharedStore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeGeneratedPassword:completionHandler:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1376), 0);

      v15 = *(_QWORD *)(a1 + 32);
      v16 = *(void **)(v15 + 1376);
      *(_QWORD *)(v15 + 1376) = 0;

    }
    else
    {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }

  }
}

void __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke_2(uint64_t a1)
{
  SFAccountDetailViewController *v2;

  v2 = -[SFAccountDetailViewController initWithSavedAccount:passwordWarning:options:]([SFAccountDetailViewController alloc], "initWithSavedAccount:passwordWarning:options:", *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 40), "_detailViewOptionsForSavedAccount:", *(_QWORD *)(a1 + 32)));
  -[SFAccountDetailViewController setDelegate:](v2, "setDelegate:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "_presentDetailViewController:", v2);

}

uint64_t __91___SFAccountManagerViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __60___SFAccountManagerViewController__updateNavigationBarItems__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

SFAccountListSectionIdentifier *__55___SFAccountManagerViewController__reloadSavedAccounts__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  SFAccountListSectionIdentifier *v3;

  v2 = a2;
  v3 = -[SFAccountListSectionIdentifier initWithType:headerText:footerText:]([SFAccountListSectionIdentifier alloc], "initWithType:headerText:footerText:", 2, v2, 0);

  return v3;
}

uint64_t __55___SFAccountManagerViewController__reloadSavedAccounts__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    goto LABEL_3;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1176), "associatedDomainsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domainsWithAssociatedCredentialsForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = objc_msgSend(v3, "matchesUserTypedSearchPattern:associatedDomains:", v9, v8);

  if (!(_DWORD)v6)
    v10 = 0;
  else
LABEL_3:
    v10 = 1;

  return v10;
}

uint64_t __55___SFAccountManagerViewController__reloadSavedAccounts__block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateContentUnavailableView");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1275) = 1;
  return result;
}

id __62___SFAccountManagerViewController__cellDataFromSavedAccounts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  void *v8;

  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 1184);
  v4 = a2;
  objc_msgSend(v4, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v5) == 1;

  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:", v4, 0, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
  objc_msgSend(*(id *)(a1 + 32), "_reloadAccountSourcesSection");
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1224);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_2;
  v3[3] = &unk_1E4ABFF98;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  objc_msgSend(v2, "getAllWarningsForcingUpdate:completionHandler:", 1, v3);
  objc_destroyWeak(&v4);
}

void __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD v10[5];
  id v11;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_2_cold_1(v9, v6);
    }
    else
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_316;
      v10[3] = &unk_1E4ABFB20;
      v10[4] = WeakRetained;
      v11 = v5;
      dispatch_async(MEMORY[0x1E0C80D38], v10);

    }
  }

}

uint64_t __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_316(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
  objc_msgSend(*(id *)(a1 + 32), "_updateSecurityRecommendationsSubtitleTextWithWarnings:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSecurityRecommendationsSection");
}

uint64_t __67___SFAccountManagerViewController__softDeleteAccountsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
}

uint64_t __67___SFAccountManagerViewController__softDeleteAccountsAtIndexPaths___block_invoke_319(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_updateNavigationBarItems");
  return objc_msgSend(*(id *)(a1 + 32), "setEditing:animated:", 0, 1);
}

uint64_t __63___SFAccountManagerViewController__deleteAccountsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "itemIdentifierForIndexPath:", a2);
}

uint64_t __81___SFAccountManagerViewController__updateGeneratedPasswordsMatchingSearchPattern__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "protectionSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "host");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "localizedCaseInsensitiveContainsString:", *(_QWORD *)(a1 + 32));

  return v5;
}

void __73___SFAccountManagerViewController__createNewFamilySharedCredentialsGroup__block_invoke(uint64_t a1, void *a2)
{
  _BYTE *WeakRetained;
  _QWORD *v4;
  SFSharedAccountsGroupCreationFlowNavigationController *v5;
  id v6;

  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained[1384] = 0;
    objc_msgSend(WeakRetained, "_reconfigureFamilyTipCells");
    v5 = -[SFSharedAccountsGroupCreationFlowNavigationController initWithOriginType:initialParticipants:passwordWarningManager:]([SFSharedAccountsGroupCreationFlowNavigationController alloc], "initWithOriginType:initialParticipants:passwordWarningManager:", 1, v6, v4[153]);
    -[SFSharedAccountsGroupCreationFlowNavigationController setModalPresentationStyle:](v5, "setModalPresentationStyle:", 2);
    -[SFSharedAccountsGroupCreationFlowNavigationController setModalInPresentation:](v5, "setModalInPresentation:", 1);
    -[SFSharedAccountsGroupCreationFlowNavigationController setSharingDelegate:](v5, "setSharingDelegate:", v4);
    objc_msgSend(v4, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

BOOL __61___SFAccountManagerViewController__reconfigureFamilyTipCells__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;

  v2 = a2;
  objc_opt_class();
  v3 = ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    && objc_msgSend(v2, "tipType") == 2;

  return v3;
}

id __68___SFAccountManagerViewController__passwordOptionsCellForTableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = a2;
  objc_msgSend(v2, "systemImageNamed:", CFSTR("switch.2"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v4, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id __83___SFAccountManagerViewController__generatedPasswordSearchResultsCellForTableView___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;

  v2 = (void *)MEMORY[0x1E0DC3870];
  v3 = a2;
  objc_msgSend(v2, "systemImageNamed:", CFSTR("ellipsis.rectangle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resolvedColorWithTraitCollection:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[_SFAccountManagerAppearanceValues chicletSize](_SFAccountManagerAppearanceValues, "chicletSize");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  +[_SFAccountManagerAppearanceValues chicletCornerRadius](_SFAccountManagerAppearanceValues, "chicletCornerRadius");
  objc_msgSend(v2, "sf_chicletStyleImageWithImage:backgroundColor:size:cornerRadius:", v4, v6, v8, v10, v12, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __83___SFAccountManagerViewController__findAndRemoveEntryForCompletedDetailViewUpgrade__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "snapshot");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "itemIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v20;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v5)
        objc_enumerationMutation(v2);
      v7 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v6);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "savedAccount");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEqual:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1400));

        if ((v9 & 1) != 0)
          break;
      }
      if (v4 == ++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v4)
          goto LABEL_3;
        goto LABEL_10;
      }
    }
    v10 = v7;

    if (!v10)
      goto LABEL_13;
    v23 = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v18;
    objc_msgSend(v18, "deleteItemsWithIdentifiers:", v11);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1064), "applySnapshot:animatingDifferences:", v18, 1);
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(void **)(v13 + 1400);
    *(_QWORD *)(v13 + 1400) = 0;

  }
  else
  {
LABEL_10:

LABEL_13:
    v15 = WBS_LOG_CHANNEL_PREFIXPasswords();
    v12 = v18;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      __83___SFAccountManagerViewController__findAndRemoveEntryForCompletedDetailViewUpgrade__block_invoke_cold_1();
    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 1400);
    *(_QWORD *)(v16 + 1400) = 0;

    objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
  }

}

uint64_t __72___SFAccountManagerViewController__reloadSecurityRecommendationsSection__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __90___SFAccountManagerViewController__updateSecurityRecommendationsSubtitleTextWithWarnings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hasBeenHidden") ^ 1;
}

BOOL __90___SFAccountManagerViewController__updateSecurityRecommendationsSubtitleTextWithWarnings___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "severity") == 1;
}

uint64_t __90___SFAccountManagerViewController__updateSecurityRecommendationsSubtitleTextWithWarnings___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

id __90___SFAccountManagerViewController__updateSecurityRecommendationsSubtitleTextWithWarnings___block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "savedAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userVisibleDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __54___SFAccountManagerViewController__checkForTipsToShow__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[6];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54___SFAccountManagerViewController__checkForTipsToShow__block_invoke_2;
  v2[3] = &unk_1E4ABFBC0;
  v2[4] = *(_QWORD *)(a1 + 32);
  v2[5] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], v2);
}

uint64_t __54___SFAccountManagerViewController__checkForTipsToShow__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(v1 + 1296) != v2)
  {
    *(_QWORD *)(v1 + 1296) = v2;
    return objc_msgSend(*(id *)(result + 32), "_reloadSavedAccountsAndTableViewData");
  }
  return result;
}

uint64_t __61___SFAccountManagerViewController__fetchSharedAccountsGroups__block_invoke(id *a1)
{
  uint64_t v2;
  _QWORD *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;

  v2 = objc_msgSend(a1[5], "copy");
  v3 = a1[4];
  v4 = (void *)v3[163];
  v3[163] = v2;

  v5 = objc_msgSend(a1[6], "copy");
  v6 = a1[4];
  v7 = (void *)v6[164];
  v6[164] = v5;

  objc_msgSend(a1[4], "_reloadSavedAccountsAndTableViewData");
  objc_msgSend(a1[4], "_reloadAccountSourcesSection");
  return objc_msgSend(a1[4], "_configureNavigationBar");
}

void __53___SFAccountManagerViewController__fetchUpdatedGroup__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0D8AA48], "sharedProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1320), "groupID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cachedGroupWithID:", v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v4 = objc_msgSend(v9, "copy");
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1320);
    *(_QWORD *)(v5 + 1320) = v4;

    objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
    objc_msgSend(*(id *)(a1 + 32), "_configureNavigationBar");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "navigationController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "popViewControllerAnimated:", 1);

  }
}

uint64_t __97___SFAccountManagerViewController_groupCreationFlowNavigationController_finishedWithGroup_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __89___SFAccountManagerViewController_moveAccountsToGroupPickerTableViewControllerDidCancel___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
}

uint64_t __101___SFAccountManagerViewController_moveAccountsToGroupPickerTableViewController_didPickSavedAccounts___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "dismissViewControllerAnimated:completion:", 1, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_reloadSavedAccountsAndTableViewData");
}

void __85___SFAccountManagerViewController_totpMigrationController_presentPickerForGenerator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addGenerator:toSavedAccount:", *(_QWORD *)(a1 + 40), v3);
    v3 = v4;
  }

}

void __50___SFAccountManagerViewController_viewWillAppear___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Unable to refresh password warnings. %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

void __66___SFAccountManagerViewController_viewControllerForTOTPGenerator___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "user");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138478083;
  v7 = v4;
  v8 = 2113;
  v9 = v5;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Attempted to add duplicate verification code generator to saved password for user %{private}@ on %{private}@", (uint8_t *)&v6, 0x16u);

}

void __62___SFAccountManagerViewController__savedAccountStoreDidChange__block_invoke_2_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  v3 = OUTLINED_FUNCTION_7(a1);
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Error refreshing warnings from password list. %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_6();
}

void __83___SFAccountManagerViewController__findAndRemoveEntryForCompletedDetailViewUpgrade__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_1A3B2D000, v0, v1, "Did not find index path to delete password after detail view upgrade.", v2);
  OUTLINED_FUNCTION_1();
}

@end
