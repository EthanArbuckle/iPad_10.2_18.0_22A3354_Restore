@implementation UserActivityController

- (TabDocument)tabDocumentPendingUserActivityPayload
{
  return (TabDocument *)objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
}

- (UserActivityController)initWithBrowserController:(id)a3
{
  id v4;
  UserActivityController *v5;
  UserActivityController *v6;
  UserActivityController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UserActivityController;
  v5 = -[UserActivityController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserController, v4);
    v7 = v6;
  }

  return v6;
}

- (BOOL)willContinueUserActivityWithType:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  _QWORD v11[4];
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v4;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_INFO, "Will continue user activity with type: %{public}@", buf, 0xCu);
  }
  v6 = *MEMORY[0x1E0CB3418];
  v7 = *MEMORY[0x1E0CD5900];
  v11[0] = *MEMORY[0x1E0CB3418];
  v11[1] = v7;
  v11[2] = *MEMORY[0x1E0CD5868];
  v11[3] = CFSTR("OpenURLsIntent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "containsObject:", v4);
  if (v9 && objc_msgSend(v4, "isEqualToString:", v6))
    -[UserActivityController _prepareTabDocumentForNewUserActivityWithDelay:](self, "_prepareTabDocumentForNewUserActivityWithDelay:", 0.02);

  return v9;
}

- (void)setTabDocumentPendingUserActivityPayload:(id)a3
{
  TabDocument **p_tabDocumentPendingUserActivityPayload;
  id WeakRetained;
  id obj;

  obj = a3;
  p_tabDocumentPendingUserActivityPayload = &self->_tabDocumentPendingUserActivityPayload;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "doneWaitingToContinueUserActivity");
    objc_storeWeak((id *)p_tabDocumentPendingUserActivityPayload, obj);
    objc_msgSend(obj, "prepareToContinueUserActivity");
    objc_msgSend(obj, "updateTabTitle");
  }

}

- (BOOL)continueUserActivity:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v37;
  os_log_t logb;
  os_log_t logc;
  NSObject *log;
  os_log_t loga;
  uint8_t buf[4];
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = v5;
    objc_msgSend(v4, "activityType");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v7;
    _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Continue user activity with type: %{public}@", buf, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(v4, "activityType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CD5900]))
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CD5868]))
    {
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "didContinueUserActivityOfType:", 1);

      objc_msgSend(WeakRetained, "shortcutController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      v13 = (_QWORD *)MEMORY[0x1E0CD5908];
      goto LABEL_7;
    }
    objc_msgSend(v4, "interaction");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v12)
    {
      objc_msgSend(v16, "didContinueUserActivityOfType:", 2);

      +[_SFNavigationIntent safari_navigationIntentForUserActivityContainingInteraction:](MEMORY[0x1E0D4EF68], v4);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = WBS_LOG_CHANNEL_PREFIXContinuity();
      v20 = v19;
      if (v18)
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v21 = v20;
          objc_msgSend(v18, "privacyPreservingDescription");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v43 = v22;
          _os_log_impl(&dword_1D7CA3000, v21, OS_LOG_TYPE_DEFAULT, "Continuing user activity for OpenURLsIntent using intent: %{public}@", buf, 0xCu);

        }
        objc_msgSend(WeakRetained, "dispatchNavigationIntent:", v18);
        LOBYTE(v15) = 1;
      }
      else
      {
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[UserActivityController continueUserActivity:].cold.3((uint64_t)v9, v20, v12);
        LOBYTE(v15) = 0;
      }
      goto LABEL_39;
    }
    objc_msgSend(v16, "didContinueUserActivityOfType:", 3);

    +[Application sharedApplication](Application, "sharedApplication");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "systemNoteTakingController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v18, "userActivityForNoteTaking:", v4);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      objc_msgSend(v4, "webpageURL");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "safari_isHTTPFamilyURL"))
      {
        -[UserActivityController _tabDocumentWithURL:](self, "_tabDocumentWithURL:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = v26;
          objc_msgSend(v26, "setUserActivityFromNotes:", v24);
          objc_msgSend(WeakRetained, "tabController");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "setActiveTabDocument:animated:", v27, 0);

          objc_msgSend(v27, "applyHighlightFromNotesIfNeeded");
          objc_msgSend(v27, "restoreAllHighlightsData");
          -[UserActivityController _invalidateTabCreationDelayTimer](self, "_invalidateTabCreationDelayTimer");
          goto LABEL_26;
        }
      }

    }
    -[UserActivityController _prepareTabDocumentForNewUserActivityWithDelay:](self, "_prepareTabDocumentForNewUserActivityWithDelay:", 0.0);
    v25 = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
    if (!v25
      || (-[UserActivityController setTabDocumentPendingUserActivityPayload:](self, "setTabDocumentPendingUserActivityPayload:", 0), (objc_msgSend(v25, "isClosed") & 1) != 0))
    {
      LOBYTE(v15) = 1;
LABEL_38:

LABEL_39:
      goto LABEL_40;
    }
    v29 = objc_alloc(MEMORY[0x1E0D8A838]);
    objc_msgSend(v4, "userInfo");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v29, "initWithDictionaryFromUserActivityUserInfo:", v30);

    if (!v27)
    {
      objc_msgSend(v4, "webpageURL");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v33, "safari_isHTTPFamilyURL");
      if (v15)
      {
        objc_msgSend(v25, "setUserActivityFromNotes:", v24);
        if (objc_msgSend(v25, "isHibernated"))
          objc_msgSend(v25, "unhibernate");
        objc_msgSend(v33, "safari_originalDataAsString");
        logc = (os_log_t)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "progressState");
        v37 = v33;
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "setLoadURL:", logc);

        v33 = v37;
        v35 = (id)objc_msgSend(v25, "loadURL:userDriven:", v37, 1);
      }
      else
      {
        log = WBS_LOG_CHANNEL_PREFIXContinuity();
        if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          -[UserActivityController continueUserActivity:].cold.2(log);
        loga = (os_log_t)WBS_LOG_CHANNEL_PREFIXContinuity();
        if (os_log_type_enabled(loga, OS_LOG_TYPE_DEBUG))
          -[UserActivityController continueUserActivity:].cold.1(loga, v4);
        objc_msgSend(v25, "didFailToContinueUserActivity");
      }

      goto LABEL_37;
    }
    objc_msgSend(v27, "url");
    logb = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject safari_originalDataAsString](logb, "safari_originalDataAsString");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "progressState");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setLoadURL:", v31);

    objc_msgSend(v25, "loadCloudTab:", v27);
LABEL_26:
    LOBYTE(v15) = 1;
LABEL_37:

    goto LABEL_38;
  }
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "didContinueUserActivityOfType:", 0);

  objc_msgSend(WeakRetained, "shortcutController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  v13 = (_QWORD *)MEMORY[0x1E0CD5920];
LABEL_7:
  LOBYTE(v15) = objc_msgSend(v11, "handleActionWithType:", *v13);
LABEL_40:

  return v15;
}

- (void)didFailToContinueUserActivityWithType:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id WeakRetained;

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXContinuity();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    -[UserActivityController didFailToContinueUserActivityWithType:error:].cold.1((uint64_t)v6, v8, v7);
  WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);
  objc_msgSend(WeakRetained, "didFailToContinueUserActivity");

  -[UserActivityController setTabDocumentPendingUserActivityPayload:](self, "setTabDocumentPendingUserActivityPayload:", 0);
  -[UserActivityController _invalidateTabCreationDelayTimer](self, "_invalidateTabCreationDelayTimer");

}

- (id)_tabDocumentWithURL:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserController);
  objc_msgSend(WeakRetained, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentTabDocuments");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__8;
  v18 = __Block_byref_object_dispose__8;
  v19 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __46__UserActivityController__tabDocumentWithURL___block_invoke;
  v11[3] = &unk_1E9CF6348;
  v8 = v4;
  v12 = v8;
  v13 = &v14;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v9;
}

void __46__UserActivityController__tabDocumentWithURL___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  void *v8;
  void *v9;
  id v10;

  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v10 = v7;
  objc_msgSend(v7, "urlForSharing");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v8) = objc_msgSend(v8, "isEqual:", v9);

  if ((_DWORD)v8)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (void)_invalidateTabCreationDelayTimer
{
  NSTimer *tabCreationDelayTimer;

  -[NSTimer invalidate](self->_tabCreationDelayTimer, "invalidate");
  tabCreationDelayTimer = self->_tabCreationDelayTimer;
  self->_tabCreationDelayTimer = 0;

}

- (void)_prepareTabDocumentForNewUserActivityWithDelay:(double)a3
{
  void *v5;
  NSTimer *v6;
  NSTimer *tabCreationDelayTimer;
  _QWORD v8[4];
  id v9;
  id location;

  if (a3 == 0.0)
  {
    -[UserActivityController _prepareTabDocumentForNewUserActivity](self, "_prepareTabDocumentForNewUserActivity");
    -[UserActivityController _invalidateTabCreationDelayTimer](self, "_invalidateTabCreationDelayTimer");
  }
  else if (!self->_tabCreationDelayTimer)
  {
    objc_initWeak(&location, self);
    v5 = (void *)MEMORY[0x1E0C99E88];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __73__UserActivityController__prepareTabDocumentForNewUserActivityWithDelay___block_invoke;
    v8[3] = &unk_1E9CF5FD8;
    objc_copyWeak(&v9, &location);
    objc_msgSend(v5, "scheduledTimerWithTimeInterval:repeats:block:", 0, v8, a3);
    v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
    tabCreationDelayTimer = self->_tabCreationDelayTimer;
    self->_tabCreationDelayTimer = v6;

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __73__UserActivityController__prepareTabDocumentForNewUserActivityWithDelay___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_invalidateTabCreationDelayTimer");
    objc_msgSend(v2, "_prepareTabDocumentForNewUserActivity");
    WeakRetained = v2;
  }

}

- (void)_prepareTabDocumentForNewUserActivity
{
  id WeakRetained;
  NSObject *v4;
  id v5;
  void *v6;
  TabDocument *v7;
  TabDocument *v8;
  TabDocument *v9;
  void *v10;
  void *v11;
  void *v12;
  __int16 v13[8];

  WeakRetained = objc_loadWeakRetained((id *)&self->_tabDocumentPendingUserActivityPayload);

  if (!WeakRetained)
  {
    v4 = WBS_LOG_CHANNEL_PREFIXContinuity();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v13[0] = 0;
      _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Continue user activity with type: create a new tab.", (uint8_t *)v13, 2u);
    }
    v5 = objc_loadWeakRetained((id *)&self->_browserController);
    objc_msgSend(v5, "tabController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "shouldStayInFocusedTabGroupForExternalLinks") & 1) == 0)
      objc_msgSend(v6, "switchOutOfSyncedTabGroup");
    objc_msgSend(v6, "activeTabDocument");
    v7 = (TabDocument *)(id)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && !-[TabDocument isLoading](v7, "isLoading") && -[TabDocument isBlank](v8, "isBlank"))
    {
      -[TabDocument setPreparingForNewUserActivity:](v8, "setPreparingForNewUserActivity:", 1);
      v9 = v8;
    }
    else
    {
      v9 = -[TabDocument initWithBrowserController:]([TabDocument alloc], "initWithBrowserController:", v5);

      -[TabDocument setIsBlank:](v9, "setIsBlank:", 1);
      -[TabDocument setPreparingForNewUserActivity:](v9, "setPreparingForNewUserActivity:", 1);
      -[TabDocument navigationBarItem](v9, "navigationBarItem");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setShowsStopReloadButtons:", 0);

      objc_msgSend(v6, "insertNewTabDocumentWithDefaultOrdering:inBackground:animated:", v9, 0, 0);
      objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "tabCollectionViewProvider");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didOpenNewTabWithURLWithTrigger:tabCollectionViewType:", 0, objc_msgSend(v12, "visibleTabCollectionViewType"));

    }
    objc_msgSend(v5, "prepareToNavigateInTabDocument:", v9);
    -[UserActivityController setTabDocumentPendingUserActivityPayload:](self, "setTabDocumentPendingUserActivityPayload:", v9);
    -[TabDocument setPreparingForNewUserActivity:](v9, "setPreparingForNewUserActivity:", 0);

  }
}

- (BrowserController)browserController
{
  return (BrowserController *)objc_loadWeakRetained((id *)&self->_browserController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_tabDocumentPendingUserActivityPayload);
  objc_destroyWeak((id *)&self->_browserController);
  objc_storeStrong((id *)&self->_tabCreationDelayTimer, 0);
}

- (void)continueUserActivity:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138477827;
  v6 = v4;
  _os_log_debug_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_DEBUG, "Activity dictionary: %{private}@", (uint8_t *)&v5, 0xCu);

}

- (void)continueUserActivity:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_ERROR, "Failed to Handoff UserActivity; unable to create WBSCloudTab from activity dictionary",
    v1,
    2u);
}

- (void)continueUserActivity:(void *)a3 .cold.3(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "intent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_3();
  v7 = v6;
  _os_log_fault_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_FAULT, "Failed to continue INInteraction-based user activity of type '%{public}@'. INIntent is of class '%{public}@'", v8, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

- (void)didFailToContinueUserActivityWithType:(void *)a3 error:.cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  void *v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  objc_msgSend(a3, "safari_privacyPreservingDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  _os_log_error_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_ERROR, "Did fail to continue user activity with type %{public}@: %{public}@", v6, 0x16u);

  OUTLINED_FUNCTION_1_2();
}

@end
