@implementation SafariClearBrowsingDataController

- (SafariClearBrowsingDataController)init
{
  SafariClearBrowsingDataController *v2;
  SafariClearBrowsingDataInterval *v3;
  void *v4;
  SafariClearBrowsingDataInterval *v5;
  SafariClearBrowsingDataInterval *v6;
  void *v7;
  SafariClearBrowsingDataInterval *v8;
  SafariClearBrowsingDataInterval *v9;
  void *v10;
  SafariClearBrowsingDataInterval *v11;
  SafariClearBrowsingDataInterval *v12;
  void *v13;
  SafariClearBrowsingDataInterval *v14;
  uint64_t v15;
  NSArray *availableIntervals;
  SafariClearBrowsingDataController *v17;
  objc_super v19;
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)SafariClearBrowsingDataController;
  v2 = -[SafariClearBrowsingDataController init](&v19, sel_init);
  if (v2)
  {
    v3 = [SafariClearBrowsingDataInterval alloc];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SafariClearBrowsingDataInterval initWithDescription:dateAfterWhichDataShouldBeClearedBlock:](v3, "initWithDescription:dateAfterWhichDataShouldBeClearedBlock:", v4, &__block_literal_global_36);

    v6 = [SafariClearBrowsingDataInterval alloc];
    _WBSLocalizedString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SafariClearBrowsingDataInterval initWithDescription:dateAfterWhichDataShouldBeClearedBlock:](v6, "initWithDescription:dateAfterWhichDataShouldBeClearedBlock:", v7, &__block_literal_global_35);

    v9 = [SafariClearBrowsingDataInterval alloc];
    _WBSLocalizedString();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = -[SafariClearBrowsingDataInterval initWithDescription:dateAfterWhichDataShouldBeClearedBlock:](v9, "initWithDescription:dateAfterWhichDataShouldBeClearedBlock:", v10, &__block_literal_global_38_0);

    v12 = [SafariClearBrowsingDataInterval alloc];
    _WBSLocalizedString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[SafariClearBrowsingDataInterval initWithDescription:dateAfterWhichDataShouldBeClearedBlock:](v12, "initWithDescription:dateAfterWhichDataShouldBeClearedBlock:", v13, &__block_literal_global_41_0);

    -[SafariClearBrowsingDataInterval setClearBrowsingDataInterval:](v5, "setClearBrowsingDataInterval:", 0);
    -[SafariClearBrowsingDataInterval setClearBrowsingDataInterval:](v8, "setClearBrowsingDataInterval:", 1);
    -[SafariClearBrowsingDataInterval setClearBrowsingDataInterval:](v11, "setClearBrowsingDataInterval:", 2);
    -[SafariClearBrowsingDataInterval setClearBrowsingDataInterval:](v14, "setClearBrowsingDataInterval:", 3);
    v20[0] = v5;
    v20[1] = v8;
    v20[2] = v11;
    v20[3] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 4);
    v15 = objc_claimAutoreleasedReturnValue();
    availableIntervals = v2->_availableIntervals;
    v2->_availableIntervals = (NSArray *)v15;

    v17 = v2;
  }

  return v2;
}

uint64_t __41__SafariClearBrowsingDataController_init__block_invoke()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", -3600.0);
}

id __41__SafariClearBrowsingDataController_init__block_invoke_2()
{
  return dateRepresentingMidnightFromNumberOfDaysAgo(0);
}

id __41__SafariClearBrowsingDataController_init__block_invoke_3()
{
  return dateRepresentingMidnightFromNumberOfDaysAgo(1);
}

uint64_t __41__SafariClearBrowsingDataController_init__block_invoke_4()
{
  return objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
}

- (void)showClearHistoryMenuFromViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0D4EC30];
  v5 = a3;
  v6 = [v4 alloc];
  +[Application sharedApplication](Application, "sharedApplication");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tabGroupManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
  objc_msgSend(WeakRetained, "activeProfileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (id)objc_msgSend(v6, "initWithTabGroupManager:activeProfileIdentifier:", v8, v10);

  objc_msgSend(v12, "setDelegate:", self);
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v12);
  objc_msgSend(v5, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)showClearHistoryMenuFromViewController:(id)a3 profileIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id WeakRetained;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_tabGroupProvider);
    objc_msgSend(WeakRetained, "activeProfileIdentifier");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  v10 = objc_alloc(MEMORY[0x1E0D4EC30]);
  +[Application sharedApplication](Application, "sharedApplication");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "tabGroupManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithTabGroupManager:activeProfileIdentifier:", v12, v8);

  objc_msgSend(v13, "setDelegate:", self);
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v13);
  objc_msgSend(v15, "presentViewController:animated:completion:", v14, 1, 0);

}

- (int64_t)_analyticsClearBrowsingIntervalForDate:(id)a3
{
  id v3;
  id v4;
  id v5;
  id v6;
  int64_t v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v3)
  {
    v7 = 3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "safari_dateOfMidnightNumberOfDaysAgo:", 1);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v3)
    {
      v7 = 2;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "safari_dateOfMidnightNumberOfDaysAgo:", 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      v7 = v6 == v3;

    }
  }

  return v7;
}

- (void)_clearAllScribbleEdits
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userDefinedContentBlockerManagerForPrivateBrowsing");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteAllContentBlockersWithCompletionHandler:", &__block_literal_global_47);

  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userDefinedContentBlockerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deleteAllContentBlockersWithCompletionHandler:", &__block_literal_global_48);

}

void __59__SafariClearBrowsingDataController__clearAllScribbleEdits__block_invoke_2()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
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
  +[Application sharedApplication](Application, "sharedApplication", 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "browserControllers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "tabController");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "activeTabDocument");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "sfScribbleControllerIfLoaded");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "reloadData");

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

}

- (void)clearDataAddedAfterDate:(id)a3 beforeDate:(id)a4 profileIdentifier:(id)a5 clearAllProfiles:(BOOL)a6 closeTabs:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL4 v8;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  SafariClearBrowsingDataController *v28;
  id v29;
  BOOL v30;

  v7 = a7;
  v8 = a6;
  v11 = a3;
  v12 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqual:", v13))
  {
    if (v8)
    {

    }
    else
    {
      v14 = objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0D89E20]);

      if ((v14 & 1) == 0)
        goto LABEL_9;
    }
    -[SafariClearBrowsingDataController _clearAllScribbleEdits](self, "_clearAllScribbleEdits");
    if (v8)
      goto LABEL_8;
LABEL_9:
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v12);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SafariClearBrowsingDataController _clearBrowsingDataAddedAfterDate:profileIdentifiers:closeAllTabs:](self, "_clearBrowsingDataAddedAfterDate:profileIdentifiers:closeAllTabs:", v11, v21, v7);

    goto LABEL_10;
  }

  if (!v8)
    goto LABEL_9;
LABEL_8:
  +[Application sharedApplication](Application, "sharedApplication");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabGroupManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allProfileIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "mutableCopy");

  v19 = (void *)MEMORY[0x1E0CEF650];
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke;
  v26 = &unk_1E9CF6518;
  v27 = v18;
  v28 = self;
  v29 = v11;
  v30 = v7;
  v20 = v18;
  objc_msgSend(v19, "_fetchAllIdentifiers:", &v23);

LABEL_10:
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger", v23, v24, v25, v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "didClearBrowsingDataFromInterval:withMethod:", -[SafariClearBrowsingDataController _analyticsClearBrowsingIntervalForDate:](self, "_analyticsClearBrowsingIntervalForDate:", v11), 0);

}

uint64_t __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_51_1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v4);

  return objc_msgSend(*(id *)(a1 + 40), "_clearBrowsingDataAddedAfterDate:profileIdentifiers:closeAllTabs:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));
}

uint64_t __117__SafariClearBrowsingDataController_clearDataAddedAfterDate_beforeDate_profileIdentifier_clearAllProfiles_closeTabs___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

- (void)_clearBrowsingDataAddedAfterDate:(id)a3 profileIdentifiers:(id)a4 closeAllTabs:(BOOL)a5
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t j;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t k;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  _BOOL4 v63;
  void *v64;
  id obj;
  uint64_t v66;
  void *v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  _QWORD aBlock[4];
  id v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v63 = a5;
  v86 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "linkPresentationMetadataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "emptyCaches");

  +[Application sharedApplication](Application, "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "historyController");
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v81 = 0u;
  v82 = 0u;
  v79 = 0u;
  v80 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
  obj = v11;
  if (v12)
  {
    v13 = v12;
    v66 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v80 != v66)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v79 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CEF650], "safari_dataStoreForProfileWithIdentifierIfExists:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CEF650], "safari_allDataTypes");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeDataOfTypes:modifiedSince:completionHandler:", v17, v6, &__block_literal_global_57);

        objc_msgSend(v67, "frequentlyVisitedSitesControllerForProfileIdentifier:loadIfNeeded:", v15, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __102__SafariClearBrowsingDataController__clearBrowsingDataAddedAfterDate_profileIdentifiers_closeAllTabs___block_invoke_2;
        aBlock[3] = &unk_1E9CF1900;
        v19 = v18;
        v78 = v19;
        v20 = _Block_copy(aBlock);
        objc_msgSend(v67, "historyForProfileIdentifier:loadIfNeeded:", v15, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v6, "isEqual:", v22);

        if (v23)
        {
          objc_msgSend(v21, "clearHistoryWithCompletionHandler:", v20);
          objc_msgSend(MEMORY[0x1E0D8A8C0], "deleteAllUsageHistoryWithProfileIdentifier:", v15);
        }
        else
        {
          objc_msgSend(v21, "clearHistoryVisitsAddedAfterDate:beforeDate:completionHandler:", v6, v64, v20);
          objc_msgSend(MEMORY[0x1E0D8A8C0], "deleteUsageHistoryFromDate:toDate:profileIdentifier:", v6, v64, v15);
        }
        objc_msgSend(MEMORY[0x1E0D4EF28], "sharedBrowserSavedState");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "clearRecentlyClosedTabsForProfileWithIdentifier:", v15);

        objc_msgSend(MEMORY[0x1E0D8A9B8], "sharedController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "removeIgnoredSiriSuggestedSitesInProfile:afterDate:", v15, v6);

      }
      v11 = obj;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v85, 16);
    }
    while (v13);
  }

  if (v63)
  {
    +[Application sharedApplication](Application, "sharedApplication");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "tabGroupManager");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "closeAllTabsInProfilesWithIdentifiers:", v11);

  }
  WBSContentBlockerStatisticsStoreClearStoresForProfilesWithIdentifiers();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v6, "isEqual:", v28);

  +[RecentWebSearchesController sharedController](RecentWebSearchesController, "sharedController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v29)
    objc_msgSend(v30, "clearRecentSearches");
  else
    objc_msgSend(v30, "clearRecentSearchesAddedAfterDate:", v6);

  if (objc_msgSend(v11, "containsObject:", *MEMORY[0x1E0D89E20]))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v6, "isEqual:", v32);

    objc_msgSend(MEMORY[0x1E0DC3F90], "sharedPolicyDecider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v33)
    {
      objc_msgSend(v34, "clearCache");

      objc_msgSend(MEMORY[0x1E0D8AB58], "sharedController");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "clearWithCompletionHandler:", 0);

      v76 = 0;
      if (!SecTrustFlushResponseCache())
      {
        v37 = WBS_LOG_CHANNEL_PREFIXWebsiteData();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          -[SafariClearBrowsingDataController _clearBrowsingDataAddedAfterDate:profileIdentifiers:closeAllTabs:].cold.1(v37, v76);

      }
      objc_msgSend(MEMORY[0x1E0D4EF88], "sharedSiteMetadataManager");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "linkPresentationIconCache");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "emptyCaches");

      objc_msgSend(MEMORY[0x1E0CD56E0], "sharedManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeAllTemporaryPermissions");
    }
    else
    {
      objc_msgSend(v34, "clearAuthorizationsAddedBetween:and:", v6, v64);

      objc_msgSend(MEMORY[0x1E0D8AB58], "sharedController");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "removeProvidersAddedAfterDate:beforeDate:", v6, v64);

      objc_msgSend(MEMORY[0x1E0CD56E0], "sharedManager");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "removeTemporaryPermissionsAddedAfterDate:completionHandler:", v6, 0);
    }

    objc_msgSend(MEMORY[0x1E0D8A818], "sharedManager");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "clearCertificateBypassesCreatedAfterDate:", v6);

    objc_msgSend(MEMORY[0x1E0CD56A8], "sharedManager");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "removeDownloadsStartedAfterDate:", v6);

    v74 = 0u;
    v75 = 0u;
    v72 = 0u;
    v73 = 0u;
    +[Application sharedApplication](Application, "sharedApplication");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "browserControllers");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
    if (v46)
    {
      v47 = v46;
      v48 = *(_QWORD *)v73;
      do
      {
        for (j = 0; j != v47; ++j)
        {
          if (*(_QWORD *)v73 != v48)
            objc_enumerationMutation(v45);
          v50 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * j);
          v68 = 0u;
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          objc_msgSend(v50, "tabController");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v51, "allTabDocuments");
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          v53 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
          if (v53)
          {
            v54 = v53;
            v55 = *(_QWORD *)v69;
            do
            {
              for (k = 0; k != v54; ++k)
              {
                if (*(_QWORD *)v69 != v55)
                  objc_enumerationMutation(v52);
                objc_msgSend(*(id *)(*((_QWORD *)&v68 + 1) + 8 * k), "clearBackForwardListKeepingCurrentItem");
              }
              v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v68, v83, 16);
            }
            while (v54);
          }

          objc_msgSend(v50, "undoManager");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "removeAllActions");

          objc_msgSend(v50, "browserWindowController");
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "saveCloudTabs");

        }
        v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v72, v84, 16);
      }
      while (v47);
    }

    objc_msgSend(MEMORY[0x1E0D89CA0], "sharedStore");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "synchronousyClearIdentifiersAddedAfterDate:", v6);

    objc_msgSend(MEMORY[0x1E0D89BF8], "sharedStore");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "synchronouslyRemoveGeneratedPasswordsNewerThanDate:", v6);

    objc_msgSend(MEMORY[0x1E0D8A7C0], "sharedManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "clearEventsDonatedSinceDate:", v6);

    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "removeObjectForKey:", *MEMORY[0x1E0D4F620]);

    v11 = obj;
  }

}

uint64_t __102__SafariClearBrowsingDataController__clearBrowsingDataAddedAfterDate_profileIdentifiers_closeAllTabs___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "clearFrequentlyVisitedSites");
}

- (void)clearHistoryViewController:(id)a3 clearHistoryVisitsAddedAfterDate:(id)a4 beforeDate:(id)a5 profileIdentifier:(id)a6 clearAllProfiles:(BOOL)a7 closeAllTabs:(BOOL)a8
{
  -[SafariClearBrowsingDataController clearDataAddedAfterDate:beforeDate:profileIdentifier:clearAllProfiles:closeTabs:](self, "clearDataAddedAfterDate:beforeDate:profileIdentifier:clearAllProfiles:closeTabs:", a4, a5, a6, a7, a8);
}

- (unint64_t)clearHistoryViewController:(id)a3 numberOfTabsToBeClosedForProfilesWithIdentifiers:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a4;
  +[Application sharedApplication](Application, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabGroupManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfTabsToBeClosedForProfilesWithIdentifiers:", v4);

  return v7;
}

- (NSArray)availableIntervals
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (TabGroupProvider)tabGroupProvider
{
  return (TabGroupProvider *)objc_loadWeakRetained((id *)&self->_tabGroupProvider);
}

- (void)setTabGroupProvider:(id)a3
{
  objc_storeWeak((id *)&self->_tabGroupProvider, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabGroupProvider);
  objc_storeStrong((id *)&self->_availableIntervals, 0);
}

- (void)_clearBrowsingDataAddedAfterDate:(void *)a1 profileIdentifiers:(void *)a2 closeAllTabs:.cold.1(void *a1, void *a2)
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
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_ERROR, "Clearing OCSP cache failed with error: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
