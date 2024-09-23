@implementation SFAccountTableViewController

void __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v6;
  NSObject *v7;
  void *v8;

  v6 = a4;
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_shareSavedAccount:authenticationContext:modalPresentationSourceView:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    v7 = WBS_LOG_CHANNEL_PREFIXPasswords();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke_cold_1(v7, v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("_SFShowAccountManagerLockedViewIfNeededNotification"), 0);

  }
}

void __102___SFAccountTableViewController__shareSavedAccount_authenticationContext_modalPresentationSourceView___block_invoke(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_updateLastOneTimeShareDateforSavedAccountIfNeeded:", *(_QWORD *)(a1 + 32));

  }
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1032) = 0;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("_SFShowAccountManagerLockedViewIfNeededNotification"), 0);

}

void __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && !*(_BYTE *)(a1 + 48))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentConfirmationAlertToShareSavedAccount:toGroup:", *(_QWORD *)(a1 + 32), 0);
    WeakRetained = v3;
  }

}

void __79___SFAccountTableViewController__allSharedCredentialGroupsMenuForSavedAccount___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained && !*(_BYTE *)(a1 + 56))
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "presentConfirmationAlertToShareSavedAccount:toGroup:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    WeakRetained = v3;
  }

}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyUserName");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyPassword");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyOneTimeCode");
}

uint64_t __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safari_copyWebsite");
}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_5(uint64_t a1, void (**a2)(_QWORD, _QWORD))
{
  id *v4;
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  id WeakRetained;

  v4 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v4);
  objc_msgSend(WeakRetained, "_allSharedCredentialGroupsMenuForSavedAccount:", *(_QWORD *)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))a2)[2](v5, v6);

}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_6(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "presentSharedAccountGroupCreationFlowWithSavedAccountToAddToNewlyCreatedGroup:", *(_QWORD *)(a1 + 32));

}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_7(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_shareSavedAccount:modalPresentationSourceView:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __72___SFAccountTableViewController__contextMenuForSavedAccountAtIndexPath___block_invoke_8(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleContextMenuDeleteForIndexPath:", *(_QWORD *)(a1 + 32));

}

id __91___SFAccountTableViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_contextMenuForSavedAccountAtIndexPath:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __71___SFAccountTableViewController_iconDidUpdateForDomain_iconController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "handleIconDidUpdateForDomain:", *(_QWORD *)(a1 + 40));
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1016), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "tableView", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "visibleCells");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE76A448))
          {
            v9 = v8;
            objc_msgSend(v9, "savedAccount");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "highLevelDomain");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", *(_QWORD *)(a1 + 40));

            if (v12)
              objc_msgSend(*(id *)(a1 + 32), "_updateIconForDomain:forCell:", *(_QWORD *)(a1 + 40), v9);

          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

  }
}

void __80___SFAccountTableViewController__shareSavedAccount_modalPresentationSourceView___block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_error_impl(&dword_1A3B2D000, v3, OS_LOG_TYPE_ERROR, "Failed to authenticate for one time account sharing: %@", (uint8_t *)&v5, 0xCu);

}

@end
