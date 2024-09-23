@implementation SFPasswordAuditingViewController

id __48___SFPasswordAuditingViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id *v5;
  id v6;
  id v7;
  id WeakRetained;
  void *v9;

  v5 = (id *)(a1 + 32);
  v6 = a4;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained(v5);
  objc_msgSend(WeakRetained, "_cellForIdentifier:indexPath:", v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[5];

  v2 = dispatch_time(0, *(_QWORD *)(a1 + 40));
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_2;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);
}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_2(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setUserInteractionEnabled:", 1);

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD block[6];
  _QWORD v8[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "mutableCopy");
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "count"))
  {
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "count"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "indexOfSectionIdentifier:", CFSTR("Other Recommendations"));

      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_5;
      block[3] = &unk_1E4ABFBC0;
      block[4] = *(_QWORD *)(a1 + 32);
      block[5] = v4;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "deleteSectionsWithIdentifiers:", v6);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "applySnapshot:animatingDifferences:", v5, 1);
  }
  else
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_4;
    v8[3] = &unk_1E4ABFE00;
    v8[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], v8);
  }

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_4(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_5(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_reloadSectionHeaderFooters:withRowAnimation:", v2, 5);

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD block[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "mutableCopy");
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1104), v2);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "count")
    || objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1104), "count"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "deleteItemsWithIdentifiers:", v4);

    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(void **)(v5 + 1080);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_8;
    v7[3] = &unk_1E4ABFE00;
    v7[4] = v5;
    objc_msgSend(v6, "applySnapshot:animatingDifferences:completion:", v3, 1, v7);

  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_7;
    block[3] = &unk_1E4ABFE00;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_7(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __72___SFPasswordAuditingViewController__findAndRemoveEntryForSavedAccount___block_invoke_8(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfSectionIdentifier:", CFSTR("Other Recommendations"));

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_reloadSectionHeaderFooters:withRowAnimation:", v4, 5);

}

void __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  uint64_t v13;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v6)
    {
      v8 = WBS_LOG_CHANNEL_PREFIXPasswords();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_cold_1(v8, v6);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_67;
      block[3] = &unk_1E4AC19B8;
      v9 = v5;
      v13 = *(_QWORD *)(a1 + 40);
      v11 = v9;
      v12 = WeakRetained;
      dispatch_async(MEMORY[0x1E0C80D38], block);

    }
  }

}

void __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_67(uint64_t a1)
{
  double Current;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL8 v17;
  void *v18;
  void *v19;
  void *v20;
  SFActionableSecurityRecommendationData *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  id WeakRetained;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id obj;
  id v36;
  _QWORD block[5];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  double v45;
  __int16 v46;
  uint64_t v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  Current = CFAbsoluteTimeGetCurrent();
  v3 = WBS_LOG_CHANNEL_PREFIXPasswords();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(void **)(a1 + 32);
    v5 = v3;
    v6 = objc_msgSend(v4, "count");
    v7 = Current - *(double *)(a1 + 48);
    *(_DWORD *)buf = 134218240;
    v43 = v6;
    v44 = 2048;
    v45 = v7;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Reloading password warnings for %lu saved passwords took %.2f seconds", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  obj = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = *(id *)(a1 + 32);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D8AC08], "sharedStore");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "savedAccount");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "highLevelDomain");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v14, "numberOfSavedAccountsInPersonalKeychainForHighLevelDomain:", v16) == 1;

        objc_msgSend(v13, "savedAccount");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "searchPattern");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[SFAccountCellData accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:](SFAccountCellData, "accountCellDataWithSavedAccount:warning:searchPattern:savedAccountIsOnlySavedAccountForHighLevelDomain:", v18, v13, v19, v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v13, "hasBeenHidden"))
        {
          v21 = -[SFActionableSecurityRecommendationData initWithAccountCellData:warning:delegate:]([SFActionableSecurityRecommendationData alloc], "initWithAccountCellData:warning:delegate:", v20, v13, *(_QWORD *)(a1 + 40));
          v22 = v36;
LABEL_10:
          objc_msgSend(v22, "addObject:", v21);

          goto LABEL_16;
        }
        if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 1152) != 1)
        {
          v23 = objc_msgSend(v13, "severity");
          if (v23 == 2)
          {
            objc_msgSend(v34, "addObject:", v20);
          }
          else if (v23 == 1)
          {
            v21 = -[SFActionableSecurityRecommendationData initWithAccountCellData:warning:delegate:]([SFActionableSecurityRecommendationData alloc], "initWithAccountCellData:warning:delegate:", v20, v13, *(_QWORD *)(a1 + 40));
            v22 = obj;
            goto LABEL_10;
          }
        }
LABEL_16:

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v10);
  }

  objc_msgSend(v36, "sortUsingComparator:", &__block_literal_global_43);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1216), v36);
  v24 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v24 + 1152) == 1)
  {
    if (objc_msgSend(*(id *)(v24 + 1216), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "_reloadTableViewDiffableDataSource");
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_2;
      block[3] = &unk_1E4ABFE00;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    v26 = v34;
  }
  else
  {
    v25 = WBS_LOG_CHANNEL_PREFIXPasswords();
    v26 = v34;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      v29 = *(void **)(a1 + 32);
      v30 = v25;
      v31 = objc_msgSend(v29, "count");
      v32 = objc_msgSend(obj, "count");
      v33 = objc_msgSend(v34, "count");
      *(_DWORD *)buf = 134218496;
      v43 = v31;
      v44 = 2048;
      v45 = *(double *)&v32;
      v46 = 2048;
      v47 = v33;
      _os_log_debug_impl(&dword_1A3B2D000, v30, OS_LOG_TYPE_DEBUG, "Of %lu saved passwords, %lu have high priority recommendations and %lu have standard priority recommendations", buf, 0x20u);

    }
    objc_msgSend(obj, "sortUsingComparator:", &__block_literal_global_72);
    objc_msgSend(v34, "sortUsingComparator:", &__block_literal_global_75);
    if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1096), "isEqualToArray:", obj)
      || !objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "isEqualToArray:", v34)
      || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1216), "isEqualToArray:", v36) & 1) == 0)
    {
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1096), obj);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1104), v34);
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 1216), v36);
      v27 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120);
      if (v27 != objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1224));
        objc_msgSend(WeakRetained, "passwordAuditingViewController:didUpdateNumberOfFlaggedPasswords:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "count"));

      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1120) = objc_msgSend(*(id *)(a1 + 32), "count");
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1128), "stopAnimating");
      objc_msgSend(*(id *)(a1 + 40), "_reloadTableViewDiffableDataSource");
    }
  }

}

uint64_t __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_69(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "warning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "warning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

uint64_t __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_71(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "warning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "warning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_2_73(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "warning");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "warning");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

uint64_t __71___SFPasswordAuditingViewController__reloadTableViewDiffableDataSource__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTableViewDiffableDataSourceOnInternalQueueAnimated:", 0);
}

uint64_t __80___SFPasswordAuditingViewController__reloadTableViewDiffableDataSourceAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadTableViewDiffableDataSourceOnInternalQueueAnimated:", *(unsigned __int8 *)(a1 + 40));
}

void __83___SFPasswordAuditingViewController_actionableSecurityRecommendationDataDidUpdate___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id *v8;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained[135], "snapshot");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sectionIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *(_QWORD *)(a1 + 32));

    if (v5)
    {
      objc_msgSend(v3, "itemIdentifiersInSectionWithIdentifier:", *(_QWORD *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "deleteItemsWithIdentifiers:", v6);
      objc_msgSend(*(id *)(a1 + 32), "items");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, *(_QWORD *)(a1 + 32));

      objc_msgSend(v8[135], "applySnapshot:animatingDifferences:", v3, 0);
    }

    WeakRetained = v8;
  }

}

void __98___SFPasswordAuditingViewController_tableView_trailingSwipeActionsConfigurationForRowAtIndexPath___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v5 = *(_QWORD **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  v6 = v5[144];
  v7 = a4;
  if (v6 == 1)
  {
    objc_msgSend(v5, "_unhideHiddenSecurityRecommendationAtIndexPath:", v4);
    v7[2](v7, 1);
  }
  else
  {
    objc_msgSend(v5, "_presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath:completionHandler:", v4, v7);
  }

}

id __95___SFPasswordAuditingViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  uint64_t v14;
  id v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0DC3428];
  objc_msgSend(*(id *)(a1 + 32), "_contextMenuActionTitleForSecurityRecommendation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __95___SFPasswordAuditingViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2;
  v13 = &unk_1E4AC0B80;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 48);
  objc_msgSend(v2, "actionWithTitle:image:identifier:handler:", v3, v4, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0DC39D0];
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1, v10, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "menuWithTitle:children:", &stru_1E4AC8470, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t __95___SFPasswordAuditingViewController_tableView_contextMenuConfigurationForRowAtIndexPath_point___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[144] == 1)
    return objc_msgSend(v2, "_unhideHiddenSecurityRecommendationAtIndexPath:", v3);
  else
    return objc_msgSend(v2, "_presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath:completionHandler:", v3, 0);
}

void __78___SFPasswordAuditingViewController__removeAddressedActionableRecommendation___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD block[5];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "mutableCopy");
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1096), v2);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 1152);
  if (v4 == 1)
  {
    v5 = 1216;
  }
  else
  {
    if (v4 || objc_msgSend(*(id *)(v3 + 1096), "count"))
      goto LABEL_7;
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 1104;
  }
  if (!objc_msgSend(*(id *)(v3 + v5), "count"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __78___SFPasswordAuditingViewController__removeAddressedActionableRecommendation___block_invoke_2;
    block[3] = &unk_1E4ABFE00;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x1E0C80D38], block);
    goto LABEL_8;
  }
LABEL_7:
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deleteSectionsWithIdentifiers:", v7);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "applySnapshot:animatingDifferences:", v6, 1);
LABEL_8:

}

void __78___SFPasswordAuditingViewController__removeAddressedActionableRecommendation___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

void __88___SFPasswordAuditingViewController__addHiddenSecurityRecommendationsSectionIfNecessary__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sectionIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("Hidden Security Recommendations Section"));

  if ((v4 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "snapshot");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = CFSTR("Hidden Security Recommendations Section");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendSectionsWithIdentifiers:", v6);

    v8 = CFSTR("Hidden Security Recommendations Item");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendItemsWithIdentifiers:intoSectionWithIdentifier:", v7, CFSTR("Hidden Security Recommendations Section"));

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "applySnapshot:animatingDifferences:", v5, 0);
  }
}

void __72___SFPasswordAuditingViewController__resetHiddenSecurityRecommendations__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72___SFPasswordAuditingViewController__resetHiddenSecurityRecommendations__block_invoke_2;
  block[3] = &unk_1E4ABFE00;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __72___SFPasswordAuditingViewController__resetHiddenSecurityRecommendations__block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

uint64_t __135___SFPasswordAuditingViewController__presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_hideSecurityRecommendationAtIndexPath:", *(_QWORD *)(a1 + 40));
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  return result;
}

uint64_t __135___SFPasswordAuditingViewController__presentHideSecurityRecommendationConfirmationAlertForRecommendationAtIndexPath_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

void __69___SFPasswordAuditingViewController__reloadSavedAccountsForceUpdate___block_invoke_cold_1(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "safari_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2(&dword_1A3B2D000, v5, v6, "Error loading password warnings. %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_6();
}

@end
