@implementation BrowserWindowController

- (void)setCloudTabsEnabled:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_cloudTabsEnabled != a3)
  {
    self->_cloudTabsEnabled = a3;
    if (!a3)
      -[CloudTabStore clearTabsForCurrentDevice](self->_cloudTabStore, "clearTabsForCurrentDevice");
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = self->_browserControllers;
    v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "cloudTabsEnabledDidChange", (_QWORD)v9);
        }
        while (v6 != v8);
        v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)updateCloudTabUpdatesEnabled
{
  void *v3;
  int v4;
  CloudTabStore *cloudTabStore;
  uint64_t v6;

  +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isCloudTabsAvailable");

  if (v4)
  {
    cloudTabStore = self->_cloudTabStore;
    if (!cloudTabStore)
    {
      -[BrowserWindowController _createCloudTabsStore](self, "_createCloudTabsStore");
      cloudTabStore = self->_cloudTabStore;
    }
    v6 = -[CloudTabStore cloudTabsAreEnabled](cloudTabStore, "cloudTabsAreEnabled");
  }
  else
  {
    -[BrowserWindowController _destroyCloudTabsStore](self, "_destroyCloudTabsStore");
    v6 = 0;
  }
  -[BrowserWindowController setCloudTabsEnabled:](self, "setCloudTabsEnabled:", v6);
}

- (CloudTabStore)cloudTabStore
{
  return self->_cloudTabStore;
}

- (NSArray)browserControllers
{
  return self->_browserControllers;
}

- (BrowserWindowController)initWithTabGroupManager:(id)a3 browserState:(id)a4 pinnedTabsManager:(id)a5 perSitePreferencesVendor:(id)a6 shouldMergeAllWindowsIfNeeded:(BOOL)a7 browserControllerUIDelegateProvider:(id)a8
{
  _BOOL8 v9;
  id v15;
  id v16;
  id v17;
  id v18;
  BrowserWindowController *v19;
  BrowserWindowController *v20;
  uint64_t v21;
  id browserControllerUIDelegateProvider;
  uint64_t v23;
  NSMapTable *UIDelegatesByBrowserController;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  BrowserWindowController *v31;
  id v33;
  objc_super v34;

  v9 = a7;
  v33 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a8;
  v34.receiver = self;
  v34.super_class = (Class)BrowserWindowController;
  v19 = -[BrowserWindowController init](&v34, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_tabGroupManager, a3);
    objc_storeStrong((id *)&v20->_perSitePreferencesVendor, a6);
    v21 = objc_msgSend(v18, "copy");
    browserControllerUIDelegateProvider = v20->_browserControllerUIDelegateProvider;
    v20->_browserControllerUIDelegateProvider = (id)v21;

    v23 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    UIDelegatesByBrowserController = v20->_UIDelegatesByBrowserController;
    v20->_UIDelegatesByBrowserController = (NSMapTable *)v23;

    objc_storeStrong((id *)&v20->_pinnedTabsManager, a5);
    objc_msgSend(v15, "windowStates");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "safari_mapObjectsUsingBlock:", &__block_literal_global_28);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "validateWindowSettingsWithUUIDs:", v26);

    -[BrowserWindowController _restoreWindowsWithState:shouldMergeAllWindowsIfNeeded:](v20, "_restoreWindowsWithState:shouldMergeAllWindowsIfNeeded:", v15, v9);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = *MEMORY[0x1E0DD9938];
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "addObserver:selector:name:object:", v20, sel__cloudTabFeatureAvailabilityDidChange_, v29, v30);

    -[BrowserWindowController updateCloudTabUpdatesEnabled](v20, "updateCloudTabUpdatesEnabled");
    v31 = v20;

  }
  return v20;
}

- (void)_restoreWindowsWithState:(id)a3 shouldMergeAllWindowsIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSArray *v12;
  NSArray *browserControllers;
  id v14;
  id v15;
  id v16;
  _QWORD v17[5];

  v4 = a4;
  objc_msgSend(a3, "windowStates");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v14 = v6;
    v7 = (unint64_t)objc_msgSend(v6, "count") >= 2;
    v8 = v14;
    if (v7)
    {
      objc_msgSend(v14, "firstObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[BrowserWindowController _mergeAndSaveWindowStates:intoWindowState:](self, "_mergeAndSaveWindowStates:intoWindowState:", v14, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
    }
    objc_msgSend(v8, "firstObject", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setSceneID:", 0);

    v6 = v15;
  }
  v17[1] = 3221225472;
  v17[2] = __82__BrowserWindowController__restoreWindowsWithState_shouldMergeAllWindowsIfNeeded___block_invoke;
  v17[3] = &unk_1E9CF5D60;
  v17[4] = self;
  v17[0] = MEMORY[0x1E0C809B0];
  objc_msgSend(v6, "safari_mapObjectsUsingBlock:", v17, v6);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  browserControllers = self->_browserControllers;
  self->_browserControllers = v12;

}

- (_SFPerSitePreferencesVendor)perSitePreferencesVendor
{
  return self->_perSitePreferencesVendor;
}

- (void)removeWindowsNotMatchingSceneIDs:(id)a3 supportsMultipleScenes:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSArray *browserControllers;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _QWORD v25[4];
  id v26;
  uint8_t v27[128];
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v4 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  browserControllers = self->_browserControllers;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __83__BrowserWindowController_removeWindowsNotMatchingSceneIDs_supportsMultipleScenes___block_invoke;
  v25[3] = &unk_1E9CF1B50;
  v8 = v6;
  v26 = v8;
  -[NSArray safari_filterObjectsUsingBlock:](browserControllers, "safari_filterObjectsUsingBlock:", v25);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSArray count](self->_browserControllers, "count") == 1
    && objc_msgSend(v9, "count") == 1
    && (!v4 || (unint64_t)objc_msgSend(v8, "count") <= 1))
  {
    objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "anyObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "adoptSceneID:", v11);
    objc_msgSend(v10, "windowState");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = WBS_LOG_CHANNEL_PREFIXTabs();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v13;
      objc_msgSend(v12, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sceneID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v29 = v15;
      v30 = 2114;
      v31 = v16;
      v32 = 2114;
      v33 = v11;
      _os_log_impl(&dword_1D7CA3000, v14, OS_LOG_TYPE_DEFAULT, "Adopting window during pruning: uuid = %{public}@, sceneID = %{public}@ -> %{public}@", buf, 0x20u);

    }
  }
  else
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = v9;
    v17 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v22;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v22 != v19)
            objc_enumerationMutation(v10);
          -[BrowserWindowController _windowDidClose:](self, "_windowDidClose:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v20++), (_QWORD)v21);
        }
        while (v18 != v20);
        v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      }
      while (v18);
    }
  }

}

- (PinnedTabsManager)pinnedTabsManager
{
  return self->_pinnedTabsManager;
}

BrowserController *__82__BrowserWindowController__restoreWindowsWithState_shouldMergeAllWindowsIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BrowserController *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Loading window from saved state: uuid = %{public}@, sceneID = %{public}@", (uint8_t *)&v10, 0x16u);

  }
  v8 = -[BrowserController initWithWindowState:browserWindowController:tabGroupManager:]([BrowserController alloc], "initWithWindowState:browserWindowController:tabGroupManager:", v3, *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));

  return v8;
}

uint64_t __52__BrowserWindowController_windowForSceneID_options___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "windowState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = WBSIsEqual();

  return v4;
}

uint64_t __83__BrowserWindowController_removeWindowsNotMatchingSceneIDs_supportsMultipleScenes___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "windowState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sceneID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4) ^ 1;
  else
    v5 = 0;

  return v5;
}

- (void)setFrontmostProfileIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (NSString)frontmostProfileIdentifier
{
  return self->_frontmostProfileIdentifier;
}

- (id)windowForSceneID:(id)a3 options:(id)a4
{
  id v6;
  void *v7;
  BrowserController *v8;
  NSArray *browserControllers;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  NSArray *v25;
  NSArray *v26;
  _QWORD v28[4];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CA5920], "_sf_windowCreationActivityFromSceneConnectionOptions:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[BrowserWindowController modeForNewWindowUserActivity:](self, "modeForNewWindowUserActivity:", v7) != 2)
  {
    browserControllers = self->_browserControllers;
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __52__BrowserWindowController_windowForSceneID_options___block_invoke;
    v28[3] = &unk_1E9CF1B50;
    v10 = v6;
    v29 = v10;
    -[NSArray safari_firstObjectPassingTest:](browserControllers, "safari_firstObjectPassingTest:", v28);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v8 = (BrowserController *)v11;
      v12 = WBS_LOG_CHANNEL_PREFIXTabs();
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
LABEL_13:

        goto LABEL_14;
      }
      v13 = v12;
      -[BrowserController UUID](v8, "UUID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v31 = v14;
      v32 = 2114;
      v33 = v10;
      _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "Found existing window by sceneID: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);

    }
    else
    {
      -[NSArray safari_firstObjectPassingTest:](self->_browserControllers, "safari_firstObjectPassingTest:", &__block_literal_global_43);
      v8 = (BrowserController *)objc_claimAutoreleasedReturnValue();
      -[BrowserController windowState](v8, "windowState");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uuid");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sceneID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[BrowserController adoptSceneID:](v8, "adoptSceneID:", v10);
      v18 = WBS_LOG_CHANNEL_PREFIXTabs();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543874;
        v31 = v16;
        v32 = 2114;
        v33 = v17;
        v34 = 2114;
        v35 = v10;
        _os_log_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_DEFAULT, "Adopting window during matching: uuid = %{public}@, sceneID = %{public}@ -> %{public}@", buf, 0x20u);
      }

      if (v8)
        goto LABEL_13;
      v19 = objc_alloc(MEMORY[0x1E0DCCB90]);
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "UUIDString");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v19, "initWithUUID:sceneID:", v21, v10);

      objc_msgSend(v14, "setNewlyCreated:", 1);
      -[WBTabGroupManager saveWindowState:completionHandler:](self->_tabGroupManager, "saveWindowState:completionHandler:", v14, 0);
      v8 = -[BrowserController initWithWindowState:browserWindowController:tabGroupManager:]([BrowserController alloc], "initWithWindowState:browserWindowController:tabGroupManager:", v14, self, self->_tabGroupManager);
      v22 = WBS_LOG_CHANNEL_PREFIXTabs();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        v23 = v22;
        objc_msgSend(v14, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v24;
        v32 = 2114;
        v33 = v10;
        _os_log_impl(&dword_1D7CA3000, v23, OS_LOG_TYPE_DEFAULT, "Creating new window: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);

      }
      -[NSArray arrayByAddingObject:](self->_browserControllers, "arrayByAddingObject:", v8);
      v25 = (NSArray *)objc_claimAutoreleasedReturnValue();
      v26 = self->_browserControllers;
      self->_browserControllers = v25;

    }
    goto LABEL_13;
  }
  v8 = -[BrowserWindowController _newAutomationWindowWithSceneID:](self, "_newAutomationWindowWithSceneID:", v6);
LABEL_14:

  return v8;
}

- (int64_t)modeForNewWindowUserActivity:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "_sf_windowCreationMode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = objc_msgSend(v6, "integerValue");
    }
    else
    {
      objc_msgSend(v5, "_sf_windowCreationNavigationIntent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "sourceWindowUUID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[BrowserWindowController browserControllerWithUUID:](self, "browserControllerWithUUID:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v11, "isPrivateBrowsingEnabled");
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)updateCloudTabsForEnteringForeground
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D7CA3000, log, OS_LOG_TYPE_DEBUG, "Fetching data from CloudKit when entering foreground", v1, 2u);
}

- (void)cloudTabStore:(id)a3 didUpdateDevicesFromCloudKitWithError:(id)a4
{
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v5)
  {
    if (v7)
    {
      v8 = v6;
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v9;
      _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_INFO, "Did update devices from CloudKit syncing with error: %{public}@", (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    if (v7)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_INFO, "Did update devices from CloudKit syncing", (uint8_t *)&v10, 2u);
    }
    -[BrowserWindowController _mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:](self, "_mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:", 1);
  }

}

- (void)cloudTabStoreDidGetCachedDevicesFromCloudKit:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1D7CA3000, v4, OS_LOG_TYPE_INFO, "Did get cached CloudTab devices", v5, 2u);
  }
  -[BrowserWindowController _mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:](self, "_mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:", 0);
}

- (void)_mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing:(BOOL)a3
{
  NSObject *v3;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  _BOOL4 v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  unint64_t v42;
  void *v43;
  uint64_t v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  _QWORD v48[5];
  id v49;
  _BYTE *v50;
  _QWORD v51[5];
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE buf[24];
  uint64_t v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  if (self->_consideredMergingCloudTabsForDeviceRestoration)
  {
    v3 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v3, OS_LOG_TYPE_INFO, "Already considered merging CloudTabs for device restoration", buf, 2u);
    }
  }
  else
  {
    v45 = a3;
    objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = *MEMORY[0x1E0D4F410];
    objc_msgSend(v47, "objectForKey:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[CloudTabStore currentDeviceUUID](self->_cloudTabStore, "currentDeviceUUID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "UUIDString");
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v5, "isEqualToString:", v46))
      {
        self->_consideredMergingCloudTabsForDeviceRestoration = 1;
        v7 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = v5;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v46;
          _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_DEFAULT, "Not attempting to merge CloudTabs because restoration is not necessary (saved UUID: %{public}@, current UUID: %{public}@)", buf, 0x16u);
        }
      }
      else
      {
        self->_consideredMergingCloudTabsForDeviceRestoration = v45;
        if (v45)
        {
          v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v46;
            _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Finished syncing for CloudTabs restoration (saved UUID: %{public}@, current UUID: %{public}@)", buf, 0x16u);
          }
          objc_msgSend(v47, "setObject:forKey:", v46, v44);
          objc_msgSend(v47, "setObject:forKey:", v5, CFSTR("uuidOfCloudTabDeviceUsedForRestoration"));
        }
        -[CloudTabStore allSyncedCloudTabDevices](self->_cloudTabStore, "allSyncedCloudTabDevices");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v43, "count") == 0;
        v11 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543362;
            *(_QWORD *)&buf[4] = v5;
            _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "No tab was found for merging from a CloudTabs device with UUID %{public}@", buf, 0xCu);
          }
        }
        else
        {
          if (v12)
          {
            *(_DWORD *)buf = 138543618;
            *(_QWORD *)&buf[4] = v5;
            *(_WORD *)&buf[12] = 2114;
            *(_QWORD *)&buf[14] = v46;
            _os_log_impl(&dword_1D7CA3000, v11, OS_LOG_TYPE_DEFAULT, "Attempting to find device with UUID: %{public}@ to restore from. Current CloudTab device UUID is: %{public}@", buf, 0x16u);
          }
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v13 = v43;
          v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
          if (v14)
          {
            v15 = *(_QWORD *)v53;
LABEL_19:
            v16 = 0;
            while (1)
            {
              if (*(_QWORD *)v53 != v15)
                objc_enumerationMutation(v13);
              v17 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v16);
              v18 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                v19 = v18;
                objc_msgSend(v17, "uuid");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                *(_QWORD *)&buf[4] = v20;
                _os_log_impl(&dword_1D7CA3000, v19, OS_LOG_TYPE_DEFAULT, "Found CloudTabs device with UUID %{public}@", buf, 0xCu);

              }
              objc_msgSend(v17, "uuid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v21, "isEqualToString:", v5);

              if ((v22 & 1) != 0)
                break;
              if (v14 == ++v16)
              {
                v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v52, v58, 16);
                if (v14)
                  goto LABEL_19;
                goto LABEL_27;
              }
            }
            v23 = v17;

            if (!v23)
              goto LABEL_37;
            objc_msgSend(v23, "tabs");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count") == 0;
            v26 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
            v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
            if (v25)
            {
              if (v27)
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D7CA3000, v26, OS_LOG_TYPE_DEFAULT, "No tabs found from CloudTabs for device restoration", buf, 2u);
              }
            }
            else
            {
              if (v27)
              {
                v28 = v26;
                v29 = objc_msgSend(v24, "count");
                *(_DWORD *)buf = 134217984;
                *(_QWORD *)&buf[4] = v29;
                _os_log_impl(&dword_1D7CA3000, v28, OS_LOG_TYPE_DEFAULT, "Found %zu tabs in CloudTabs device for restoration", buf, 0xCu);

              }
              objc_msgSend(MEMORY[0x1E0C99EA0], "_sf_safariDefaults");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastModified");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v31, "timeIntervalSinceReferenceDate");
              objc_msgSend(v30, "setDouble:forKey:", CFSTR("lastModifiedTimeOfCloudTabDeviceUsedForRestoration"));

              if (!v45)
              {
                v32 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D7CA3000, v32, OS_LOG_TYPE_DEFAULT, "Found cached CloudTabs device to restore", buf, 2u);
                }
                self->_consideredMergingCloudTabsForDeviceRestoration = 1;
                objc_msgSend(v47, "setObject:forKey:", v46, v44);
                objc_msgSend(v23, "uuid");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "setObject:forKey:", v33, CFSTR("uuidOfCloudTabDeviceUsedForRestoration"));

              }
              *(_QWORD *)buf = 0;
              *(_QWORD *)&buf[8] = buf;
              *(_QWORD *)&buf[16] = 0x2020000000;
              v57 = 0;
              v34 = MEMORY[0x1E0C809B0];
              v35 = (void *)*MEMORY[0x1E0DC4730];
              v51[0] = MEMORY[0x1E0C809B0];
              v51[1] = 3221225472;
              v51[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke;
              v51[3] = &unk_1E9CF1780;
              v51[4] = buf;
              v36 = objc_msgSend(v35, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.CloudTabRestorationBackgroundTask"), v51);
              *(_QWORD *)(*(_QWORD *)&buf[8] + 24) = v36;
              objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v48[0] = v34;
              v48[1] = 3221225472;
              v48[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_26;
              v48[3] = &unk_1E9CF5CA8;
              v50 = buf;
              v48[4] = self;
              v49 = v24;
              objc_msgSend(v37, "getCloudTabContainerManateeStateWithCompletionHandler:", v48);

              _Block_object_dispose(buf, 8);
            }

          }
          else
          {
LABEL_27:

LABEL_37:
            v38 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D7CA3000, v38, OS_LOG_TYPE_DEFAULT, "No cloud tab device found for tab restoration", buf, 2u);
            }
            if (v45)
            {
              v39 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = v39;
                v41 = objc_msgSend(v13, "count");
                v42 = -[WBSCloudTabStore totalSyncedCloudTabDeviceCount](self->_cloudTabStore, "totalSyncedCloudTabDeviceCount");
                *(_DWORD *)buf = 134218240;
                *(_QWORD *)&buf[4] = v41;
                *(_WORD *)&buf[12] = 2048;
                *(_QWORD *)&buf[14] = v42;
                _os_log_impl(&dword_1D7CA3000, v40, OS_LOG_TYPE_DEFAULT, "Did not find device after syncing finished; device count: %zu; unfiltered device count: %zu",
                  buf,
                  0x16u);

              }
            }
          }
        }

      }
    }
    else
    {
      self->_consideredMergingCloudTabsForDeviceRestoration = 1;
      v8 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D7CA3000, v8, OS_LOG_TYPE_DEFAULT, "Not attempting to merge tabs from CloudTabs device because no device identifier was found for restoration", buf, 2u);
      }
    }

  }
}

- (void)_createCloudTabsStore
{
  CloudTabStore *v3;
  CloudTabStore *cloudTabStore;

  +[CloudTabStore sharedCloudTabStore](CloudTabStore, "sharedCloudTabStore");
  v3 = (CloudTabStore *)objc_claimAutoreleasedReturnValue();
  cloudTabStore = self->_cloudTabStore;
  self->_cloudTabStore = v3;

  -[CloudTabStore setDelegate:](self->_cloudTabStore, "setDelegate:", self);
  -[CloudTabStore startObservingTabStoreStateChanges](self->_cloudTabStore, "startObservingTabStoreStateChanges");
}

id __173__BrowserWindowController_initWithTabGroupManager_browserState_pinnedTabsManager_perSitePreferencesVendor_shouldMergeAllWindowsIfNeeded_browserControllerUIDelegateProvider___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;

  v2 = (objc_class *)MEMORY[0x1E0CB3A28];
  v3 = a2;
  v4 = [v2 alloc];
  objc_msgSend(v3, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithUUIDString:", v5);
  return v6;
}

- (id)uiDelegateForBrowserController:(id)a3
{
  id v4;
  void *v5;
  void (**browserControllerUIDelegateProvider)(id, id);

  v4 = a3;
  -[NSMapTable objectForKey:](self->_UIDelegatesByBrowserController, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    browserControllerUIDelegateProvider = (void (**)(id, id))self->_browserControllerUIDelegateProvider;
    if (browserControllerUIDelegateProvider)
    {
      browserControllerUIDelegateProvider[2](browserControllerUIDelegateProvider, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        -[NSMapTable setObject:forKey:](self->_UIDelegatesByBrowserController, "setObject:forKey:", v5, v4);
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (BrowserWindowController)initWithBrowserSavedState:(id)a3
{
  return -[BrowserWindowController initWithBrowserSavedState:perSitePreferencesVendor:browserControllerUIDelegateProvider:](self, "initWithBrowserSavedState:perSitePreferencesVendor:browserControllerUIDelegateProvider:", a3, 0, 0);
}

- (BrowserWindowController)initWithBrowserSavedState:(id)a3 perSitePreferencesVendor:(id)a4 browserControllerUIDelegateProvider:(id)a5
{
  id v8;
  id v9;
  id v10;
  BrowserWindowController *v11;
  BrowserWindowController *v12;
  uint64_t v13;
  id browserControllerUIDelegateProvider;
  uint64_t v15;
  NSMapTable *UIDelegatesByBrowserController;
  NSArray *browserControllers;
  void *v18;
  uint64_t v19;
  void *v20;
  BrowserWindowController *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v23.receiver = self;
  v23.super_class = (Class)BrowserWindowController;
  v11 = -[BrowserWindowController init](&v23, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_perSitePreferencesVendor, a4);
    v13 = objc_msgSend(v10, "copy");
    browserControllerUIDelegateProvider = v12->_browserControllerUIDelegateProvider;
    v12->_browserControllerUIDelegateProvider = (id)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    UIDelegatesByBrowserController = v12->_UIDelegatesByBrowserController;
    v12->_UIDelegatesByBrowserController = (NSMapTable *)v15;

    browserControllers = v12->_browserControllers;
    v12->_browserControllers = (NSArray *)MEMORY[0x1E0C9AA60];

    -[BrowserWindowController _restoreWindowsFromBrowserSavedState:](v12, "_restoreWindowsFromBrowserSavedState:", v8);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *MEMORY[0x1E0DD9938];
    +[FeatureManager sharedFeatureManager](FeatureManager, "sharedFeatureManager");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", v12, sel__cloudTabFeatureAvailabilityDidChange_, v19, v20);

    -[BrowserWindowController updateCloudTabUpdatesEnabled](v12, "updateCloudTabUpdatesEnabled");
    v21 = v12;
  }

  return v12;
}

- (BrowserWindowController)initWithTabGroupManager:(id)a3 pinnedTabsManager:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BrowserWindowController *v9;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "browserState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BrowserWindowController initWithTabGroupManager:browserState:pinnedTabsManager:perSitePreferencesVendor:shouldMergeAllWindowsIfNeeded:browserControllerUIDelegateProvider:](self, "initWithTabGroupManager:browserState:pinnedTabsManager:perSitePreferencesVendor:shouldMergeAllWindowsIfNeeded:browserControllerUIDelegateProvider:", v7, v8, v6, 0, 0, 0);

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  -[BrowserWindowController _destroyCloudTabsStore](self, "_destroyCloudTabsStore");
  v3.receiver = self;
  v3.super_class = (Class)BrowserWindowController;
  -[BrowserWindowController dealloc](&v3, sel_dealloc);
}

- (id)tabsInPrivateBrowsing:(BOOL)a3
{
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = self->_browserControllers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "tabController", (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (a3)
          objc_msgSend(v11, "privateUnpinnedTabs");
        else
          objc_msgSend(v11, "normalUnpinnedTabs");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  return v14;
}

- (unint64_t)numberOfTabsInPrivateBrowsing:(BOOL)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_browserControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "tabController", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (a3)
          objc_msgSend(v10, "privateUnpinnedTabs");
        else
          objc_msgSend(v10, "normalUnpinnedTabs");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v12, "count");

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)tabsOlderThan:(id)a3 inPrivateBrowsing:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  double v25;
  void *v26;
  void *v28;
  NSArray *obj;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v5;
  objc_msgSend(v6, "dateByAddingComponents:toDate:options:", v5, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceReferenceDate");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = self->_browserControllers;
  v12 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "tabController");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v16;
        if (a4)
          objc_msgSend(v16, "privateUnpinnedTabs");
        else
          objc_msgSend(v16, "normalUnpinnedTabs");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v31 = 0u;
        v32 = 0u;
        v19 = v18;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v32;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v32 != v22)
                objc_enumerationMutation(v19);
              v24 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * j);
              objc_msgSend(v24, "lastActivationTime");
              if (v25 <= v10)
                objc_msgSend(v11, "addObject:", v24);
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
          }
          while (v21);
        }

      }
      v13 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v13);
  }

  v26 = (void *)objc_msgSend(v11, "copy");
  return v26;
}

- (id)oldestTabsWithLimit:(unint64_t)a3 inPrivateBrowsing:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[BrowserWindowController tabsInPrivateBrowsing:](self, "tabsInPrivateBrowsing:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "sortUsingComparator:", &__block_literal_global_13);
  if (objc_msgSend(v6, "count") <= a3)
    a3 = objc_msgSend(v6, "count");
  objc_msgSend(v6, "subarrayWithRange:", 0, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __65__BrowserWindowController_oldestTabsWithLimit_inPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0C99D68];
  v5 = a3;
  objc_msgSend(a2, "lastActivationTime");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v5, "lastActivationTime");
  v9 = v8;

  objc_msgSend(v7, "dateWithTimeIntervalSinceReferenceDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)browserControllerWithUUID:(id)a3
{
  id v4;
  NSArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_browserControllers;
  v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "UUID", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)tabDocumentWithUUID:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_browserControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "tabController", (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabDocumentWithUUID:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (id)tabWithUUID:(id)a3
{
  id v4;
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_browserControllers;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v8)
        objc_enumerationMutation(v5);
      objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "tabController", (_QWORD)v13);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "tabWithUUID:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v11 = 0;
  }

  return v11;
}

- (_SFPageZoomPreferenceManager)privateBrowsingPageZoomManager
{
  _SFPageZoomPreferenceManager *privateBrowsingPageZoomManager;
  void *v4;
  void *v5;
  _SFPageZoomPreferenceManager *v6;
  _SFPageZoomPreferenceManager *v7;
  void *v8;
  void *v9;

  privateBrowsingPageZoomManager = self->_privateBrowsingPageZoomManager;
  if (!privateBrowsingPageZoomManager)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AAE0]), "initWithDatabaseURL:", 0);
    objc_msgSend(MEMORY[0x1E0D89CE0], "sharedProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setSyncProxy:", v5);

    v6 = (_SFPageZoomPreferenceManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD5738]), "initWithPerSitePreferencesStore:", v4);
    v7 = self->_privateBrowsingPageZoomManager;
    self->_privateBrowsingPageZoomManager = v6;

    -[BrowserWindowController perSitePreferencesVendor](self, "perSitePreferencesVendor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "pageZoomPreferenceManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFPageZoomPreferenceManager setFallbackPreferenceManager:](self->_privateBrowsingPageZoomManager, "setFallbackPreferenceManager:", v9);

    privateBrowsingPageZoomManager = self->_privateBrowsingPageZoomManager;
  }
  return privateBrowsingPageZoomManager;
}

- (id)_allNormalLocalTabs
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_browserControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "tabController", (_QWORD)v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "activeTabGroup");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isSyncable");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v9, "normalTabs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObjectsFromArray:", v12);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (id)_sceneIDToLocalGroupTabs
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v4 = self->_browserControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v9, "tabController", (_QWORD)v19);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activeTabGroup");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isLocal");

        if ((v12 & 1) == 0)
        {
          objc_msgSend(v9, "windowStateData");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sceneID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
          {
            objc_msgSend(v9, "windowState");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "localTabGroup");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "tabs");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v17, "count"))
              objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, v14);

          }
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_destroyCloudTabsStore
{
  CloudTabStore *cloudTabStore;

  -[CloudTabStore stopObservingTabStoreStateChanges](self->_cloudTabStore, "stopObservingTabStoreStateChanges");
  -[CloudTabStore setDelegate:](self->_cloudTabStore, "setDelegate:", 0);
  cloudTabStore = self->_cloudTabStore;
  self->_cloudTabStore = 0;

}

- (void)saveCloudTabs
{
  CloudTabStore *cloudTabStore;
  void *v4;
  id v5;

  cloudTabStore = self->_cloudTabStore;
  -[BrowserWindowController _allNormalLocalTabs](self, "_allNormalLocalTabs");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[BrowserWindowController _sceneIDToLocalGroupTabs](self, "_sceneIDToLocalGroupTabs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CloudTabStore saveCurrentDeviceTabs:sceneIDToLocalGroupTabs:](cloudTabStore, v5, v4);

}

- (void)updateCloudTabsForEnteringBackground
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  CloudTabStore *cloudTabStore;
  void *v10;
  void *v11;
  NSArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD aBlock[5];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  -[WBSCloudTabStore pruneExpiredDevicesFromCloudKit](self->_cloudTabStore, "pruneExpiredDevicesFromCloudKit");
  objc_msgSend(MEMORY[0x1E0D89B98], "sharedLogger");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reportTabUpdatedWithUpdateType:", 6);

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = *MEMORY[0x1E0DC4878];
  v4 = MEMORY[0x1E0C809B0];
  v5 = (void *)*MEMORY[0x1E0DC4730];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke;
  v22[3] = &unk_1E9CF1780;
  v22[4] = &v23;
  v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("com.apple.mobilesafari.SynchronizeCloudTabs"), v22);
  v24[3] = v6;
  aBlock[0] = v4;
  aBlock[1] = 3221225472;
  aBlock[2] = __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_22;
  aBlock[3] = &unk_1E9CF1780;
  aBlock[4] = &v23;
  v7 = _Block_copy(aBlock);
  v8 = -[CloudTabStore canSaveCloudTabsForCurrentDevice](self->_cloudTabStore, "canSaveCloudTabsForCurrentDevice");
  cloudTabStore = self->_cloudTabStore;
  if (v8)
  {
    -[BrowserWindowController _allNormalLocalTabs](self, "_allNormalLocalTabs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserWindowController _sceneIDToLocalGroupTabs](self, "_sceneIDToLocalGroupTabs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[CloudTabStore saveCurrentDeviceTabsForEnteringBackground:sceneIDToLocalGroupTabs:completion:](cloudTabStore, v10, v11, v7);

  }
  else
  {
    -[CloudTabStore saveCurrentDeviceCloudTabsForEnteringBackground:completion:](self->_cloudTabStore, "saveCurrentDeviceCloudTabsForEnteringBackground:completion:", 0, v7);
  }
  if (+[WBUFeatureManager accessLevel](FeatureManager, "accessLevel") == 2)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v12 = self->_browserControllers;
    v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v18;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v18 != v14)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v15), "tabController", (_QWORD)v17);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "updateEducationTabsLastSyncDate");

          ++v15;
        }
        while (v13 != v15);
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      }
      while (v13);
    }

  }
  _Block_object_dispose(&v23, 8);
}

uint64_t __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_cold_1(v2, v3, v4);
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

uint64_t __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_22(uint64_t a1)
{
  return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

- (void)restoreEducationDeviceTabs
{
  void *v2;
  id v3;

  -[NSArray firstObject](self->_browserControllers, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "restoreEducationDeviceTabs");

}

- (void)restoreEducationDeviceCloudTabs:(id)a3 animated:(BOOL)a4
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _BOOL4 v18;
  void *v19;
  id obj;
  uint64_t v21;
  BrowserWindowController *v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v18 = a4;
  v34 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v22 = self;
  -[NSArray firstObject](self->_browserControllers, "firstObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v5;
  v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v7, "uuid");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v8)
        {
          objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v26 = 0u;
        v27 = 0u;
        v24 = 0u;
        v25 = 0u;
        v9 = v22->_browserControllers;
        v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v25;
LABEL_10:
          v13 = 0;
          while (1)
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v13), "tabController");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "url");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "tabForURL:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            if (v16)
              break;
            if (v11 == ++v13)
            {
              v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
              if (v11)
                goto LABEL_10;
              goto LABEL_16;
            }
          }
        }
        else
        {
LABEL_16:

          objc_msgSend(v7, "url");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "title");
          v9 = (NSArray *)objc_claimAutoreleasedReturnValue();
          v17 = (id)objc_msgSend(v19, "loadURLInNewTab:title:UUID:inBackground:animated:restoringCloudTab:", v16, v9, v8, 1, v18, 1);
        }

      }
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v23);
  }

}

void __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  v2 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1D7CA3000, v2, OS_LOG_TYPE_DEFAULT, "Background task expired for restoring CloudTabs", v3, 2u);
  }
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) != *MEMORY[0x1E0DC4878])
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
}

void __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_26(_QWORD *a1, char a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  uint64_t v9;
  uint8_t buf[16];

  if ((a2 & 1) != 0)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_27;
    block[3] = &unk_1E9CF28B8;
    v3 = (void *)a1[5];
    block[4] = a1[4];
    v4 = v3;
    v5 = a1[6];
    v8 = v4;
    v9 = v5;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "Not restoring tabs from CloudTabs for browser state because the container does not use Manatee", buf, 2u);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) != *MEMORY[0x1E0DC4878])
      objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
  }
}

uint64_t __108__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestorationIfNeededAfterCloudTabsFinishedSyncing___block_invoke_27(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_mergeTabsFromCloudTabsForDeviceRestoration:", *(_QWORD *)(a1 + 40));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != *MEMORY[0x1E0DC4878])
    return objc_msgSend((id)*MEMORY[0x1E0DC4730], "endBackgroundTask:");
  return result;
}

- (void)_mergeTabsFromCloudTabsForDeviceRestoration:(id)a3
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __CFString *v12;
  NSObject *v13;
  void *v14;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t m;
  void *v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  NSArray *v45;
  id obj;
  void *v47;
  void *v48;
  uint64_t v49;
  _QWORD v50[4];
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint8_t v73[128];
  uint8_t buf[4];
  uint64_t v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 134217984;
    v75 = objc_msgSend(v3, "count");
    _os_log_impl(&dword_1D7CA3000, v5, OS_LOG_TYPE_DEFAULT, "Merging %ld tabs from CloudTabs for device restoration", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  obj = v3;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v67;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v67 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v11, "sceneID");
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v13 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
          v12 = CFSTR("SAFARI_NO_SCENE_ID");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D7CA3000, v13, OS_LOG_TYPE_DEFAULT, "CloudTab does not have a sceneID. Categorize it under tabs without a scene id", buf, 2u);
            v12 = CFSTR("SAFARI_NO_SCENE_ID");
          }
        }
        objc_msgSend(v6, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v12);
        }
        objc_msgSend(v14, "addObject:", v11);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v73, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v15 = self->_browserControllers;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v63;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v63 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * j);
        objc_msgSend(v20, "windowStateData");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "sceneID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
          objc_msgSend(v48, "setObject:forKeyedSubscript:", v20, v22);

      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v62, v72, 16);
    }
    while (v17);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v45 = self->_browserControllers;
  v23 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
  if (v23)
  {
    v24 = v23;
    v49 = *(_QWORD *)v59;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v59 != v49)
          objc_enumerationMutation(v45);
        v26 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
        objc_msgSend(v26, "UUID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "UUIDString");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          v29 = v6;
          objc_msgSend(v26, "windowState");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "localTabGroup");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "tabs");
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0C99E20], "set");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = 0u;
          v55 = 0u;
          v56 = 0u;
          v57 = 0u;
          v34 = v32;
          v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
          if (v35)
          {
            v36 = v35;
            v37 = *(_QWORD *)v55;
            do
            {
              for (m = 0; m != v36; ++m)
              {
                if (*(_QWORD *)v55 != v37)
                  objc_enumerationMutation(v34);
                objc_msgSend(*(id *)(*((_QWORD *)&v54 + 1) + 8 * m), "url");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                if (v39)
                  objc_msgSend(v33, "addObject:", v39);

              }
              v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v54, v70, 16);
            }
            while (v36);
          }

          objc_msgSend(v47, "setObject:forKeyedSubscript:", v33, v28);
          v6 = v29;
        }

      }
      v24 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v58, v71, 16);
    }
    while (v24);
  }

  -[NSArray firstObject](self->_browserControllers, "firstObject");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke;
  v50[3] = &unk_1E9CF5CF8;
  v51 = v48;
  v52 = v40;
  v53 = v47;
  v41 = v47;
  v42 = v40;
  v43 = v48;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v50);

}

void __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = v5;
      _os_log_impl(&dword_1D7CA3000, v9, OS_LOG_TYPE_DEFAULT, "Did not find browser controller for scene ID %{public}@, falling back to the first one", buf, 0xCu);
    }
    v8 = *(id *)(a1 + 40);
  }
  objc_msgSend(v8, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v15 = 3221225472;
  v16 = __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke_32;
  v17 = &unk_1E9CF5CD0;
  v12 = v11;
  v18 = v12;
  v19 = *(id *)(a1 + 48);
  objc_msgSend(v7, "safari_filterObjectsUsingBlock:", &v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v13, "count", v14, v15, v16, v17))
    objc_msgSend(v8, "loadCloudTabsForDeviceRestoration:", v13);

}

uint64_t __71__BrowserWindowController__mergeTabsFromCloudTabsForDeviceRestoration___block_invoke_32(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  uint8_t v8[16];

  objc_msgSend(a2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "containsObject:", v3) ^ 1;

    }
    else
    {
      v5 = 1;
    }
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXCloudTabs();
    v5 = 0;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D7CA3000, v6, OS_LOG_TYPE_DEFAULT, "CloudTab to restore has no URL", v8, 2u);
      v5 = 0;
    }
  }

  return v5;
}

- (void)cloudTabStore:(id)a3 didReceiveTabCloseRequest:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  objc_msgSend(v5, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tabUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = self->_browserControllers;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "tabController", (_QWORD)v14);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "closeTabWithURL:UUID:", v6, v7);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (void)saveCloudTabsUsingCloudTabStore:(id)a3
{
  if (-[CloudTabStore canSaveCloudTabsForCurrentDevice](self->_cloudTabStore, "canSaveCloudTabsForCurrentDevice", a3))
    -[BrowserWindowController saveCloudTabs](self, "saveCloudTabs");
}

- (void)openNewWindowWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4
{
  _BOOL8 v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CA5920];
  v6 = a4;
  objc_msgSend(v5, "_sf_windowCreationActivityWithMode:", v4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0DC3BD0]);
  objc_msgSend(v6, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setRequestingScene:", v8);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v10, v7, 0);

}

- (void)openNewWindowInFrontmostProfileWithPrivateBrowsingEnabled:(BOOL)a3 fromWindow:(id)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSString *v11;
  NSString *frontmostProfileIdentifier;
  void *v13;
  id v14;

  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CA5920];
  v7 = a4;
  objc_msgSend(v6, "_sf_windowCreationActivityWithMode:", v5);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0DC3BD0]);
  objc_msgSend(v7, "scene");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRequestingScene:", v9);

  objc_msgSend(v7, "tabController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "activeProfileIdentifier");
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  frontmostProfileIdentifier = self->_frontmostProfileIdentifier;
  self->_frontmostProfileIdentifier = v11;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v14, v8, 0);

}

- (id)_newAutomationWindowWithSceneID:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BrowserController *v11;
  NSArray *v12;
  NSArray *browserControllers;
  void *v14;
  id automationWindowInitializedCompletionHandler;
  id v16;
  _QWORD block[4];
  id v19;

  v4 = (objc_class *)MEMORY[0x1E0DCCB90];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithUUID:sceneID:", v8, v5);

  objc_msgSend(MEMORY[0x1E0DCCB78], "ephemeralTabGroupManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saveWindowState:completionHandler:", v9, 0);
  v11 = -[BrowserController initWithWindowState:browserWindowController:tabGroupManager:controlledByAutomation:]([BrowserController alloc], "initWithWindowState:browserWindowController:tabGroupManager:controlledByAutomation:", v9, self, v10, 1);
  -[NSArray arrayByAddingObject:](self->_browserControllers, "arrayByAddingObject:", v11);
  v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
  browserControllers = self->_browserControllers;
  self->_browserControllers = v12;

  v14 = _Block_copy(self->_automationWindowInitializedCompletionHandler);
  automationWindowInitializedCompletionHandler = self->_automationWindowInitializedCompletionHandler;
  self->_automationWindowInitializedCompletionHandler = 0;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__BrowserWindowController__newAutomationWindowWithSceneID___block_invoke;
  block[3] = &unk_1E9CF1950;
  v19 = v14;
  v16 = v14;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  return v11;
}

uint64_t __59__BrowserWindowController__newAutomationWindowWithSceneID___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

BOOL __52__BrowserWindowController_windowForSceneID_options___block_invoke_42(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a2, "windowState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sceneID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 == 0;

  return v4;
}

- (void)_windowDidClose:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *browserControllers;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "windowState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "tabController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setActiveTabGroupUUID:", 0);

  objc_msgSend(v4, "tabController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "closeAllOpenTabsAnimated:", 0);

  objc_msgSend(v4, "tabGroupManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deleteWindowStates:completionHandler:", v9, 0);

  objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
  objc_msgSend(v5, "uuid");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
  objc_msgSend(v10, "removeWindowWithUUID:", v13);

  v14 = (void *)-[NSArray mutableCopy](self->_browserControllers, "mutableCopy");
  objc_msgSend(v14, "removeObject:", v4);
  v15 = (NSArray *)objc_msgSend(v14, "copy");

  browserControllers = self->_browserControllers;
  self->_browserControllers = v15;

  objc_msgSend(v4, "didCloseBrowserWindow");
  -[NSMapTable removeObjectForKey:](self->_UIDelegatesByBrowserController, "removeObjectForKey:", v4);

  v17 = WBS_LOG_CHANNEL_PREFIXTabs();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = v17;
    objc_msgSend(v5, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 138543618;
    v22 = v19;
    v23 = 2114;
    v24 = v20;
    _os_log_impl(&dword_1D7CA3000, v18, OS_LOG_TYPE_DEFAULT, "Closed window: uuid = %{public}@, sceneID = %{public}@", (uint8_t *)&v21, 0x16u);

  }
}

- (void)mergeAllWindowsIntoWindow:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)-[NSArray mutableCopy](self->_browserControllers, "mutableCopy");
  objc_msgSend(v5, "removeObject:", v4);
  v6 = (void *)objc_msgSend(v5, "copy");

  -[NSArray valueForKey:](self->_browserControllers, "valueForKey:", CFSTR("windowState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[BrowserWindowController _mergeAndSaveWindowStates:intoWindowState:](self, "_mergeAndSaveWindowStates:intoWindowState:", v7, v8);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v17 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v15, "closeWindow", (_QWORD)v16);
        objc_msgSend(v15, "didCloseBrowserWindow");
        -[BrowserWindowController _windowDidClose:](self, "_windowDidClose:", v15);
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v12);
  }

}

+ (id)_printWindowToSceneMapping
{
  void *v2;
  void *v3;
  void *v4;

  +[Application sharedApplication](Application, "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "browserWindowController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_printWindowToSceneMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_printWindowToSceneMapping
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_browserControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8), "windowState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "uuid");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "sceneID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("<BrowserController; uuid = %@; sceneID = %@>\n"),
          v10,
          v11,
          (_QWORD)v14);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_msgSend(v3, "copy");
  return v12;
}

- (void)setUpAutomationWindowWithCompletionHandler:(id)a3
{
  id v4;
  id automationWindowInitializedCompletionHandler;
  void (**v6)(void *, void *);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  automationWindowInitializedCompletionHandler = self->_automationWindowInitializedCompletionHandler;
  if (automationWindowInitializedCompletionHandler)
  {
    v6 = (void (**)(void *, void *))_Block_copy(automationWindowInitializedCompletionHandler);
    v7 = self->_automationWindowInitializedCompletionHandler;
    self->_automationWindowInitializedCompletionHandler = 0;

    objc_msgSend(MEMORY[0x1E0CB35C8], "safari_errorWithDomain:code:privacyPreservingDescription:", CFSTR("AutomationErrorDomain"), 1, CFSTR("Pending session was terminated prior to becoming established."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);

  }
  v9 = (void *)objc_msgSend(v4, "copy");
  v10 = self->_automationWindowInitializedCompletionHandler;
  self->_automationWindowInitializedCompletionHandler = v9;

  if ((objc_msgSend((id)*MEMORY[0x1E0DC4730], "supportsMultipleScenes") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CA5920], "_sf_windowCreationActivityWithMode:", 2);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0DC3BD0]);
    objc_msgSend(v12, "_setRequestFullscreen:", 1);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_2;
    v20[3] = &unk_1E9CF1C20;
    v20[4] = self;
    objc_msgSend(v13, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v11, v12, v20);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_browserControllers, "objectAtIndexedSubscript:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "windowState");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sceneID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[BrowserWindowController _newAutomationWindowWithSceneID:](self, "_newAutomationWindowWithSceneID:", v16);

    v18 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke;
    v21[3] = &unk_1E9CF1830;
    v22 = v14;
    v23 = v17;
    v19 = v17;
    v11 = v14;
    objc_msgSend(v18, "performWithoutAnimation:", v21);

  }
}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "detachFromScene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachToScene:", v2);

}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_3;
    v5[3] = &unk_1E9CF1830;
    v5[4] = *(_QWORD *)(a1 + 32);
    v6 = v3;
    dispatch_async(MEMORY[0x1E0C80D38], v5);

  }
}

void __70__BrowserWindowController_setUpAutomationWindowWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))_Block_copy(*(const void **)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4[2](v4, *(_QWORD *)(a1 + 40));
}

- (void)tearDownAutomationWindow
{
  char v3;
  NSArray *browserControllers;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v3 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "supportsMultipleScenes");
  browserControllers = self->_browserControllers;
  if ((v3 & 1) != 0)
  {
    -[NSArray safari_firstObjectPassingTest:](browserControllers, "safari_firstObjectPassingTest:", &__block_literal_global_56);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "closeWindow");
    -[BrowserWindowController _windowDidClose:](self, "_windowDidClose:", v11);

  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](browserControllers, "objectAtIndexedSubscript:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isControlledByAutomation");

    -[NSArray objectAtIndexedSubscript:](self->_browserControllers, "objectAtIndexedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_browserControllers, "objectAtIndexedSubscript:", v6 ^ 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[BrowserWindowController _windowDidClose:](self, "_windowDidClose:", v8);
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __51__BrowserWindowController_tearDownAutomationWindow__block_invoke;
    v13[3] = &unk_1E9CF1830;
    v14 = v8;
    v15 = v7;
    v10 = v7;
    v12 = v8;
    objc_msgSend(v9, "performWithoutAnimation:", v13);

  }
}

void __51__BrowserWindowController_tearDownAutomationWindow__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "detachFromScene");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "attachToScene:", v2);

}

uint64_t __51__BrowserWindowController_tearDownAutomationWindow__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isControlledByAutomation");
}

- (void)saveBrowserState
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[BrowserWindowController _browserWindowsToPersist](self, "_browserWindowsToPersist");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFBrowserSavedState setBrowserWindows:](self->_savedState, "setBrowserWindows:", v3);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_browserControllers;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v9, "isControlledByAutomation", (_QWORD)v14))
        {
          objc_msgSend(v9, "windowStateData");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v10;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "savedState");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setBrowserWindows:", v11);

        }
        objc_msgSend(v9, "tabController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "saveStateInBackground:", 0);

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

}

- (id)_mergeAndSaveWindowStates:(id)a3 intoWindowState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[BrowserWindowController _mergeWindowStates:intoWindowState:](self, "_mergeWindowStates:intoWindowState:", v6, v7);
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v21 = v6;
  v8 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v8, "removeObject:", v7);
  -[WBTabGroupManager deleteWindowStates:completionHandler:](self->_tabGroupManager, "deleteWindowStates:completionHandler:", v8, 0);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v13);
        objc_msgSend(MEMORY[0x1E0D4EF30], "settings");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_alloc(MEMORY[0x1E0CB3A28]);
        objc_msgSend(v14, "uuid");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = (void *)objc_msgSend(v16, "initWithUUIDString:", v17);
        objc_msgSend(v15, "removeWindowWithUUID:", v18);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v11);
  }

  return v20;
}

- (id)_mergeWindowStates:(id)a3 intoWindowState:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  WBTabGroupManager *tabGroupManager;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  WBTabGroupManager *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  WBTabGroupManager *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  WBTabGroupManager *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  _QWORD v79[4];
  id v80;
  id v81;
  uint8_t buf[8];
  id v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = WBS_LOG_CHANNEL_PREFIXTabGroup();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D7CA3000, v7, OS_LOG_TYPE_INFO, "Merging window states", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = MEMORY[0x1E0C809B0];
  v79[1] = 3221225472;
  v79[2] = __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke;
  v79[3] = &unk_1E9CF5D88;
  v10 = v6;
  v80 = v10;
  v11 = v8;
  v81 = v11;
  v60 = v5;
  objc_msgSend(v5, "safari_reduceObjectsWithInitialValue:usingBlock:", v9, v79);
  v12 = objc_claimAutoreleasedReturnValue();

  tabGroupManager = self->_tabGroupManager;
  objc_msgSend(v10, "localTabGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v10;
  objc_msgSend(v10, "localTabGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tabs");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lastObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v11;
  v59 = (void *)v12;
  -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](tabGroupManager, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v12, v14, v17, v11);

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  -[WBTabGroupManager namedProfiles](self->_tabGroupManager, "namedProfiles");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
  if (v63)
  {
    v62 = *(_QWORD *)v76;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v76 != v62)
          objc_enumerationMutation(obj);
        v66 = v18;
        v19 = self->_tabGroupManager;
        v64 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v18);
        objc_msgSend(v64, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBTabGroupManager unnamedTabGroupsForProfileWithIdentifier:](v19, "unnamedTabGroupsForProfileWithIdentifier:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = 0u;
        v72 = 0u;
        v73 = 0u;
        v74 = 0u;
        v23 = v21;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
        if (v24)
        {
          v25 = v24;
          v26 = 0;
          v27 = *(_QWORD *)v72;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v72 != v27)
                objc_enumerationMutation(v23);
              v29 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              if (v26
                || (objc_msgSend(v67, "unnamedTabGroupUUIDs"),
                    v30 = (void *)objc_claimAutoreleasedReturnValue(),
                    objc_msgSend(v29, "uuid"),
                    v31 = (void *)objc_claimAutoreleasedReturnValue(),
                    v32 = objc_msgSend(v30, "containsObject:", v31),
                    v31,
                    v30,
                    !v32))
              {
                objc_msgSend(v22, "addObject:", v29);
              }
              else
              {
                v26 = v29;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v71, v84, 16);
          }
          while (v25);
        }
        else
        {
          v26 = 0;
        }

        if (objc_msgSend(v22, "count"))
        {
          if (v26)
            goto LABEL_25;
          v33 = (void *)MEMORY[0x1E0DCCB38];
          -[WBTabGroupManager deviceIdentifier](self->_tabGroupManager, "deviceIdentifier");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "unnamedTabGroupWithDeviceIdentifier:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v64, "identifier");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setProfileIdentifier:", v36);

          -[WBTabGroupManager insertUnnamedTabGroup:](self->_tabGroupManager, "insertUnnamedTabGroup:", v35);
          v26 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "uuid");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "addUnnamedTabGroupUUID:", v37);

          -[WBTabGroupManager tabCollection](self->_tabGroupManager, "tabCollection");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "saveWindowState:", v67);

          if ((v39 & 1) != 0)
          {

LABEL_25:
            objc_msgSend(v22, "safari_reduceObjectsUsingBlock:", &__block_literal_global_62);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = self->_tabGroupManager;
            objc_msgSend(v26, "tabs");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "lastObject");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](v40, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v35, v26, v42, 0);

          }
          else
          {
            v44 = WBS_LOG_CHANNEL_PREFIXProfiles();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
              -[BrowserWindowController _mergeWindowStates:intoWindowState:].cold.1(buf, &buf[1], v44);
          }
          v43 = v66;

          goto LABEL_28;
        }
        v43 = v66;
LABEL_28:

        v18 = v43 + 1;
      }
      while (v18 != v63);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v85, 16);
      v63 = v45;
    }
    while (v45);
  }

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v68[0] = MEMORY[0x1E0C809B0];
  v68[1] = 3221225472;
  v68[2] = __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_2;
  v68[3] = &unk_1E9CF5D88;
  v69 = v67;
  v70 = v46;
  v48 = v46;
  v49 = v67;
  objc_msgSend(v60, "safari_reduceObjectsWithInitialValue:usingBlock:", v47, v68);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = self->_tabGroupManager;
  objc_msgSend(v49, "privateTabGroup");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "privateTabGroup");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "tabs");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "lastObject");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBTabGroupManager moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:](v51, "moveTabs:toTabGroup:afterTab:withoutPersistingTabGroupsWithUUIDStrings:", v50, v52, v55, v48);

  v83 = v49;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v83, 1);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  return v56;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "localTabGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(v5, "localTabGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tabs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v14);

  }
  return v6;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_60(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  objc_msgSend(a2, "tabs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v4, "arrayByAddingObjectsFromArray:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

id __62__BrowserWindowController__mergeWindowStates_intoWindowState___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(v5, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if ((v9 & 1) == 0)
  {
    v10 = *(void **)(a1 + 40);
    objc_msgSend(v5, "privateTabGroup");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v12);

    objc_msgSend(v5, "privateTabGroup");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "tabs");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObjectsFromArray:", v14);

  }
  return v6;
}

- (void)_restoreWindowsFromBrowserSavedState:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _UNKNOWN **v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  BrowserWindowController *v18;
  id v19;
  _UNKNOWN **v20;
  void *v21;
  void *v22;
  void *v23;
  NSArray *v24;
  NSArray *browserControllers;
  uint64_t v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_savedState, a3);
  objc_msgSend(v5, "browserWindows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)-[NSArray mutableCopy](self->_browserControllers, "mutableCopy");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v29;
    v11 = &off_1E9CEE000;
    do
    {
      v12 = 0;
      v26 = v9;
      do
      {
        if (*(_QWORD *)v29 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v12);
        v14 = WBS_LOG_CHANNEL_PREFIXTabs();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          v15 = v14;
          objc_msgSend(v13, "UUID");
          v16 = v10;
          v17 = v7;
          v18 = self;
          v19 = v5;
          v20 = v11;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "sceneID");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v33 = v21;
          v34 = 2114;
          v35 = v22;
          _os_log_impl(&dword_1D7CA3000, v15, OS_LOG_TYPE_INFO, "Loading window from saved state: uuid = %{public}@, sceneID = %{public}@", buf, 0x16u);

          v11 = v20;
          v5 = v19;
          self = v18;
          v7 = v17;
          v10 = v16;
          v9 = v26;
        }
        v23 = (void *)objc_msgSend(objc_alloc((Class)v11[169]), "initWithStateData:browserWindowController:savedState:controlledByAutomation:", v13, self, v5, 0);
        objc_msgSend(v7, "addObject:", v23);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v9);
  }

  v24 = (NSArray *)objc_msgSend(v7, "copy");
  browserControllers = self->_browserControllers;
  self->_browserControllers = v24;

}

- (id)_browserWindowsToPersist
{
  NSArray *browserControllers;
  _QWORD v4[5];

  browserControllers = self->_browserControllers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__BrowserWindowController__browserWindowsToPersist__block_invoke;
  v4[3] = &unk_1E9CF5DF0;
  v4[4] = self;
  -[NSArray safari_mapAndFilterObjectsUsingBlock:](browserControllers, "safari_mapAndFilterObjectsUsingBlock:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

id __51__BrowserWindowController__browserWindowsToPersist__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  objc_msgSend(v3, "savedState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 32);

  if (v4 == v5)
  {
    objc_msgSend(v3, "windowStateData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dispatchNavigationIntent:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[Application sharedApplication](Application, "sharedApplication");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleNavigationIntent:completion:", v3, 0);

}

- (void)handleNavigationIntent:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t);
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  v6 = (void (**)(id, uint64_t))a4;
  objc_msgSend(v17, "sourceWindowUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BrowserWindowController browserControllerWithUUID:](self, "browserControllerWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = v8;
  }
  else
  {
    -[NSArray firstObject](self->_browserControllers, "firstObject");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  v12 = objc_msgSend(v17, "policy");
  if (v12 <= 6)
  {
    if (v12 == 4)
    {
      objc_msgSend(MEMORY[0x1E0CA5920], "_sf_windowCreationActivityWithNavigationIntent:", v17);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc_init(MEMORY[0x1E0DC3BD0]);
      objc_msgSend(v11, "scene");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setRequestingScene:", v15);

      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "requestSceneSessionActivation:userActivity:options:errorHandler:", 0, v13, v14, 0);

      if (v6)
        v6[2](v6, 1);

    }
    else
    {
      objc_msgSend(v11, "handleNavigationIntent:completion:", v17, v6);
    }
  }

}

- (BOOL)cloudTabsEnabled
{
  return self->_cloudTabsEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_frontmostProfileIdentifier, 0);
  objc_storeStrong((id *)&self->_cloudTabStore, 0);
  objc_storeStrong((id *)&self->_perSitePreferencesVendor, 0);
  objc_storeStrong((id *)&self->_pinnedTabsManager, 0);
  objc_storeStrong((id *)&self->_browserControllers, 0);
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_privateBrowsingPageZoomManager, 0);
  objc_storeStrong(&self->_automationWindowInitializedCompletionHandler, 0);
  objc_storeStrong((id *)&self->_savedState, 0);
  objc_storeStrong((id *)&self->_UIDelegatesByBrowserController, 0);
  objc_storeStrong(&self->_browserControllerUIDelegateProvider, 0);
}

void __63__BrowserWindowController_updateCloudTabsForEnteringBackground__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D7CA3000, a1, a3, "Background task expired while waiting for cloud tabs to synchronize", v3);
}

- (void)_mergeWindowStates:(NSObject *)a3 intoWindowState:.cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_0_5(&dword_1D7CA3000, a3, (uint64_t)a3, "Failed to save unnamed tab group in window state when merging windows", a1);
}

@end
