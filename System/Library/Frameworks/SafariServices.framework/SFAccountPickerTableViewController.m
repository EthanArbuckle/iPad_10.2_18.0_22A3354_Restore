@implementation SFAccountPickerTableViewController

void __50___SFAccountPickerTableViewController_reloadTable__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "serviceNameHintStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "domainHintStrings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "count");
  if (v4 + objc_msgSend(v3, "count"))
  {
    v5 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "count");
    if (v5 > objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "minimumNumberOfCredentialsToShowLikelyMatchesSection"))
    {
      v6 = *(void **)(*(_QWORD *)(a1 + 32) + 1072);
      v45[0] = MEMORY[0x1E0C809B0];
      v45[1] = 3221225472;
      v45[2] = __50___SFAccountPickerTableViewController_reloadTable__block_invoke_2;
      v45[3] = &unk_1E4AC6E68;
      v46 = v3;
      v47 = v2;
      objc_msgSend(v6, "safari_filterObjectsUsingBlock:", v45);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "mutableCopy");
      v9 = *(_QWORD *)(a1 + 32);
      v10 = *(void **)(v9 + 1064);
      *(_QWORD *)(v9 + 1064) = v8;

    }
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1 + 32);
    v13 = *(void **)(v12 + 1096);
    *(_QWORD *)(v12 + 1096) = v11;

    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "safari_mapObjectsUsingBlock:", &__block_literal_global_48);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v16, "count"))
    {
      v40 = v3;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "objectAtIndexedSubscript:", 0);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "relyingPartyIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "isEqualToString:", CFSTR("apple.com"));

      if (v19)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1088), "safari_mapObjectsUsingBlock:", &__block_literal_global_52);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "mutableCopy");
        v22 = *(_QWORD *)(a1 + 32);
        v23 = *(void **)(v22 + 1096);
        *(_QWORD *)(v22 + 1096) = v21;

      }
      else
      {
        v39 = v2;
        v43 = 0u;
        v44 = 0u;
        v41 = 0u;
        v42 = 0u;
        v24 = *(id *)(*(_QWORD *)(a1 + 32) + 1072);
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v42;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v42 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
              objc_msgSend(v29, "passkeyCredentialID");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v31 = objc_msgSend(v16, "containsObject:", v30);

              if (v31)
                objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "addObject:", v29);
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
          }
          while (v26);
        }

        v2 = v39;
      }
      v3 = v40;
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "_updateMatchingGeneratedPasswordsState");
  objc_msgSend(*(id *)(a1 + 32), "_updateMatchingPasswords");
  objc_msgSend(*(id *)(a1 + 32), "_updateNavigationItemTitleAndPrompt");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadData");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "initialSearchQuery");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "length");

  if (v34)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "initialSearchQuery");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setSearchQuery:", v35);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setInitialSearchQuery:", 0);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "savedAccountToInitiallyShowDetailsFor");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = *(id **)(a1 + 32);
    objc_msgSend(v37[153], "savedAccountToInitiallyShowDetailsFor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_showAccountDetailsForSavedAccount:", v38);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "setSavedAccountToInitiallyShowDetailsFor:", 0);
  }

}

uint64_t __50___SFAccountPickerTableViewController_reloadTable__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "credentialTypes") & 1) != 0)
  {
    objc_msgSend(v3, "highLevelDomain");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "additionalSites");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_56);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v10 = *(id *)(a1 + 32);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
LABEL_5:
      v14 = 0;
      while (1)
      {
        if (*(_QWORD *)v23 != v13)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(v9, "containsObject:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v14)) & 1) != 0)
          break;
        if (v12 == ++v14)
        {
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
          if (v12)
            goto LABEL_5;
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:

      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v10 = *(id *)(a1 + 40);
      v4 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      if (!v4)
      {
LABEL_21:

        goto LABEL_22;
      }
      v15 = *(_QWORD *)v19;
LABEL_13:
      v16 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v10);
        if ((objc_msgSend(v3, "matchesServiceNameHintString:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16), (_QWORD)v18) & 1) != 0)break;
        if (v4 == ++v16)
        {
          v4 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          if (v4)
            goto LABEL_13;
          goto LABEL_21;
        }
      }
    }
    v4 = 1;
    goto LABEL_21;
  }
  v4 = 0;
LABEL_22:

  return v4;
}

uint64_t __50___SFAccountPickerTableViewController_reloadTable__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

id __50___SFAccountPickerTableViewController_reloadTable__block_invoke_4(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "credentialID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id __50___SFAccountPickerTableViewController_reloadTable__block_invoke_5(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (objc_class *)MEMORY[0x1E0D8ABE0];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "relyingPartyIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "username");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "credentialID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v4, "_initWithPasskeyRelyingPartyID:user:passkeyUserHandle:passkeyCredentialID:", v5, v6, &stru_1E4AC8470, v8);

  return v9;
}

uint64_t __72___SFAccountPickerTableViewController_newAutoFillablePasskeysAvailable___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  v2 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A3B2D000, v2, OS_LOG_TYPE_INFO, "Received new passkeys available notification. Refreshing account picker.", v4, 2u);
  }
  return objc_msgSend(*(id *)(a1 + 32), "reloadTable");
}

BOOL __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(v3, "userIsNeverSaveMarker") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(v3, "user");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (objc_msgSend(v5, "length")
       || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1224), "forUserNamesOnly") & 1) == 0)
      && (objc_msgSend(v3, "credentialTypes") & 4) == 0;

  }
  return v4;
}

void __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
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
  v10[2] = __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E4AC48B0;
  v7 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v13 = v7;
  v8 = v6;
  v9 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __81___SFAccountPickerTableViewController__reloadSavedAccountsWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1088), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), *(id *)(a1 + 48));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

void __61___SFAccountPickerTableViewController__accountStoreDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_updateMatchingPasswords");
  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safari_highLevelDomainForPasswordManager");
}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didPickSavedAccountForPassword:", *(_QWORD *)(a1 + 40));
}

uint64_t __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_3(uint64_t a1)
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addAdditionalSite:toSavedAccount:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  return objc_msgSend(*(id *)(a1 + 48), "_didPickSavedAccountForPassword:", *(_QWORD *)(a1 + 40));
}

void __117___SFAccountPickerTableViewController__didPickSavedAccountForPasswordButPresentAlertToAddAdditionalSiteIfApplicable___block_invoke_4(uint64_t a1)
{
  void *v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathForSelectedRow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
    objc_msgSend(v2, "deselectRowAtIndexPath:animated:", v1, 1);

}

BOOL __71___SFAccountPickerTableViewController__reloadVerificationCodesIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "source") != 2;
}

uint64_t __95___SFAccountPickerTableViewController_addSavedAccountViewControllerDidFinish_withSavedAccount___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showAccountDetailsForSavedAccount:", *(_QWORD *)(a1 + 40));
}

void __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  _BOOL4 v5;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = WBS_LOG_CHANNEL_PREFIXAutoFill();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 1) != 0)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Finished caBLE transaction. Dismissing picker.", buf, 2u);
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_180;
    block[3] = &unk_1E4ABFE00;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else if (v5)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "caBLE transaction did not succeed. Leaving picker up.", buf, 2u);
  }
}

void __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_180(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accountPickerTableViewControllerDidCancel:", *(_QWORD *)(a1 + 32));

}

uint64_t __73___SFAccountPickerTableViewController_tableView_didSelectRowAtIndexPath___block_invoke_182(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "credentialID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "passkeyCredentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

void __100___SFAccountPickerTableViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  uint64_t v5;
  void (**v6)(id, uint64_t);

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = a4;
  objc_msgSend(v4, "_presentAlertToConfirmDeletingAccountsAtIndexPath:", v5);
  v6[2](v6, 1);

}

void __89___SFAccountPickerTableViewController__presentAlertToConfirmDeletingAccountsAtIndexPath___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_deleteSavedAccountAtIndexPath:", *(_QWORD *)(a1 + 32));

}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1064);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_2;
  v8[3] = &unk_1E4AC02D8;
  v9 = v3;
  v5 = v3;
  v6 = objc_msgSend(v4, "safari_noObjectsPassTest:", v8);

  return v6;
}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "highLevelDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v4, "isEqualToString:", v5);
  return v6;
}

uint64_t __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  +[_SFFormDataController sharedController](_SFFormDataController, "sharedController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "autoFillQuirksManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "associatedDomainsManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "highLevelDomain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "domainsWithAssociatedCredentialsForDomain:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "searchPattern");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v3, "matchesUserTypedSearchPattern:associatedDomains:", v9, v8);

  return v10;
}

BOOL __63___SFAccountPickerTableViewController__updateMatchingPasswords__block_invoke_4(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "credentialTypes") & 1) == 0;
}

@end
