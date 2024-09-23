@implementation SFContentBlockerManager

- (void)_commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *recompilationInformationAccessQueue;
  void *v5;
  void *v6;

  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SafariServices.SFContentBlockerManager.internal", 0);
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  self->_recompilationInformationAccessQueue = v3;

  -[SFContentBlockerManager _loadContentBlockerStateFromDisk](self, "_loadContentBlockerStateFromDisk");
  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__contentBlockerEnabledStateDidChange_, CFSTR("com.apple.SafariServices.ContentBlockerEnabledStateDidChange"), 0);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__contentBlockerStateInPrivateBrowsingDidChange_, *MEMORY[0x1E0D8AF48], 0);

  -[SFContentBlockerManager _beginContentBlockerDiscovery](self, "_beginContentBlockerDiscovery");
}

- (void)_loadContentBlockerStateFromDisk
{
  WBSPersistentPropertyListStore *contentBlockerStateStore;
  WBSPersistentPropertyListStore *v4;
  void *v5;
  void *v6;
  WBSPersistentPropertyListStore *v7;
  WBSPersistentPropertyListStore *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  contentBlockerStateStore = self->_contentBlockerStateStore;
  if (contentBlockerStateStore)
  {
    -[WBSPersistentPropertyListStore saveAndCloseStoreSynchronously](contentBlockerStateStore, "saveAndCloseStoreSynchronously");
    v4 = self->_contentBlockerStateStore;
    self->_contentBlockerStateStore = 0;

  }
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerManager _contentBlockerStateURL](self, "_contentBlockerStateURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (WBSPersistentPropertyListStore *)objc_msgSend(objc_alloc(MEMORY[0x1E0D8AAF0]), "initWithBackingStoreURL:", v6);
  v8 = self->_contentBlockerStateStore;
  self->_contentBlockerStateStore = v7;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke;
  v10[3] = &unk_1E4AC0F18;
  v9 = v5;
  v11 = v9;
  -[WBSPersistentPropertyListStore setCreateEmptyStoreHandler:](self->_contentBlockerStateStore, "setCreateEmptyStoreHandler:", v10);

}

- (void)_didDiscoverExtensions:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[SFContentBlockerManager _findNewExtensionsAdded:toExistingExtensions:](self, "_findNewExtensionsAdded:toExistingExtensions:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerManager _recompileEnabledContentBlockersIfNeeded:](self, "_recompileEnabledContentBlockersIfNeeded:", v4);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerManager _updateContentBlockerStateFromDiscoveredContentBlockers:](self, "_updateContentBlockerStateFromDiscoveredContentBlockers:", v5);
  objc_storeStrong((id *)&self->_extensions, v5);
  self->_hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce = 1;
  -[SFContentBlockerManager informObserversThatContentBlockerManagerExtensionListDidChange](self, "informObserversThatContentBlockerManagerExtensionListDidChange");

}

- (void)informObserversThatContentBlockerManagerExtensionListDidChange
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = (void *)-[NSMutableSet copy](self->_observers, "copy");
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "contentBlockerManagerExtensionListDidChange:", self, (_QWORD)v8);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_recompileEnabledContentBlockersIfNeeded:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  SFContentBlockerManager *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[SFContentBlockerManager _loadContentBlockerRecompilationInformationIfNeeded](self, "_loadContentBlockerRecompilationInformationIfNeeded");
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = v15;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v21 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (-[SFContentBlockerManager _hasRecompilationBeenAttemptedForExtension:](self, "_hasRecompilationBeenAttemptedForExtension:", v8))
        {
          v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
          if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            goto LABEL_14;
          *(_DWORD *)buf = 138543362;
          v25 = v9;
          v11 = v10;
          v12 = "Already attempted to re-compile Content Blocker '%{public}@' once, no need to re-compile";
          goto LABEL_13;
        }
        if (-[SFContentBlockerManager extensionIsEnabled:](self, "extensionIsEnabled:", v8))
        {
          objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v16[0] = MEMORY[0x1E0C809B0];
          v16[1] = 3221225472;
          v16[2] = __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke;
          v16[3] = &unk_1E4AC0F68;
          v17 = v9;
          v18 = self;
          v19 = v8;
          objc_msgSend(v13, "lookUpContentRuleListForIdentifier:completionHandler:", v17, v16);

          goto LABEL_14;
        }
        v14 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v25 = v9;
          v11 = v14;
          v12 = "Content Blocker '%{public}@' was disabled, no need to re-compile";
LABEL_13:
          _os_log_impl(&dword_1A3B2D000, v11, OS_LOG_TYPE_INFO, v12, buf, 0xCu);
        }
LABEL_14:

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v5);
  }

}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  int8x16_t v12;
  _QWORD v13[4];
  int8x16_t v14;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 40), "addContentRuleList:forExtension:", v5, *(_QWORD *)(a1 + 48));
  }
  else if (objc_msgSend(v6, "safari_matchesErrorDomain:andCode:", *MEMORY[0x1E0CEF788], 9))
  {
    v8 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138477827;
      v16 = v9;
      _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_DEFAULT, "Content Blocker '%{private}@' is compiled with old version of bytecode; recompiling blocker",
        buf,
        0xCu);
    }
    objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_135;
    v13[3] = &unk_1E4AC0F40;
    v12 = *(int8x16_t *)(a1 + 32);
    v14 = vextq_s8(v12, v12, 8uLL);
    objc_msgSend(v10, "removeContentRuleListForIdentifier:completionHandler:", (id)v12.i64[0], v13);

  }
  else
  {
    v11 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1();
    }

  }
}

void __81__SFContentBlockerManager_SFPrivate___hasRecompilationBeenAttemptedForExtension___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "safari_BOOLForKey:");

}

- (void)reloadUserContentControllerReadingStateFromDisk:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[5];
  uint8_t buf[8];
  uint64_t v19;
  _QWORD v20[2];

  v3 = a3;
  v20[1] = *MEMORY[0x1E0C80C00];
  v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Reloading content blockers in SFContentBlockerManager reloadUserContentControllerReadingStateFromDisk", buf, 2u);
  }
  -[SFContentBlockerManager _removeAllContentRuleLists](self, "_removeAllContentRuleLists");
  if (v3)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A3B2D000, v6, OS_LOG_TYPE_INFO, "Reload requested from notification, reloading content blocker state from disk", buf, 2u);
    }
    -[SFContentBlockerManager _loadContentBlockerStateFromDisk](self, "_loadContentBlockerStateFromDisk");
  }
  v7 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke;
  v17[3] = &unk_1E4AC0F90;
  v17[4] = self;
  v8 = (void *)MEMORY[0x1A8598C40](v17);
  v9 = (void *)MEMORY[0x1E0CB35D8];
  v19 = *MEMORY[0x1E0CB2A28];
  v20[0] = CFSTR("com.apple.Safari.content-blocker");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v7;
  v13 = 3221225472;
  v14 = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_138;
  v15 = &unk_1E4AC0FE0;
  v11 = v8;
  v16 = v11;
  objc_msgSend(v9, "extensionsWithMatchingAttributes:completion:", v10, &v12);

  -[SFContentBlockerManager _loadBuiltInContentBlockers](self, "_loadBuiltInContentBlockers", v12, v13, v14, v15);
}

void __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40))
  {
    v2 = (void *)MEMORY[0x1E0C99D50];
    pathToRecompilationInformation();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "dataWithContentsOfURL:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v15 = 0;
      v16 = 200;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, &v16, &v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v15;
      if (v6)
      {
        v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke_cold_1();
        }

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138543362;
          v18 = v5;
          _os_log_impl(&dword_1A3B2D000, v12, OS_LOG_TYPE_INFO, "Found recompilation information: %{public}@", buf, 0xCu);
        }
        v8 = objc_msgSend(v5, "mutableCopy");
      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v8;

    }
    else
    {
      v9 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v9, OS_LOG_TYPE_INFO, "Did not find any information on previously recompiled Content Blockers", buf, 2u);
      }
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 32);
      v6 = *(id *)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;
    }

  }
}

- (void)_updateContentBlockerStateFromDiscoveredContentBlockers:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  WBSPersistentPropertyListStore *contentBlockerStateStore;
  void *v32;
  void *v33;
  id v34;
  char v35;
  id obj;
  id obja;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  void *v52;
  uint8_t v53[128];
  uint8_t buf[4];
  void *v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  if (!v34)
    goto LABEL_42;
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = v34;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
  if (v4)
  {
    v41 = 0;
    v38 = *(_QWORD *)v48;
    v5 = *MEMORY[0x1E0D8B048];
    v6 = *MEMORY[0x1E0D8B050];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v48 != v38)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
        objc_msgSend(v40, "composedIdentifierForExtensionStateForExtension:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "setObject:forKeyedSubscript:", v8, v9);
        -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
        {
          objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isExtensionEnabledInCloudWithComposedIdentifier:forProfileServerID:", v9, self->_profileServerID);

          if (v12)
          {
            v13 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v55 = v9;
              _os_log_impl(&dword_1A3B2D000, v13, OS_LOG_TYPE_INFO, "Automatically enabling content blocker %{private}@ due to cloud state", buf, 0xCu);
            }
            -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](self, "setExtension:isEnabled:byUserGesture:", v8, 1, 0);
          }
        }
        objc_msgSend(v10, "safari_dateForKey:", v5);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          v15 = (void *)objc_msgSend(v10, "mutableCopy");
          if (!v15)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, v5);

          -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", v15, v9);
          v41 = 1;
        }
        objc_msgSend(v10, "safari_dateForKey:", v6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (!v18)
        {
          v19 = (void *)objc_msgSend(v10, "mutableCopy");
          objc_msgSend(v19, "setObject:forKeyedSubscript:", 0, v6);
          -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", v19, v9);

          v41 = 1;
        }

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
    }
    while (v4);
  }
  else
  {
    v41 = 0;
  }

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[WBSPersistentPropertyListStore allKeys](self->_contentBlockerStateStore, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (!v21)
  {

    goto LABEL_39;
  }
  v35 = 0;
  v39 = *(_QWORD *)v44;
  obja = (id)*MEMORY[0x1E0D8B050];
  do
  {
    for (j = 0; j != v21; ++j)
    {
      if (*(_QWORD *)v44 != v39)
        objc_enumerationMutation(v20);
      v23 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
      objc_msgSend(v42, "objectForKeyedSubscript:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v24 == 0;

      if (v25)
      {
        -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "safari_dateForKey:", obja);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27;
        if (v27)
        {
          objc_msgSend(v27, "dateByAddingTimeInterval:", 3600.0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "timeIntervalSinceNow");
          if (v30 < 0.0)
          {
            -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", 0, v23);
            v35 = 1;
            goto LABEL_32;
          }
        }
        else
        {
          contentBlockerStateStore = self->_contentBlockerStateStore;
          v51 = obja;
          objc_msgSend(MEMORY[0x1E0C99D68], "now");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = v28;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "safari_dictionaryByMergingWithDictionary:", v26);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[WBSPersistentPropertyListStore setObject:forKey:](contentBlockerStateStore, "setObject:forKey:", v32, v23);

LABEL_32:
          v41 = 1;
        }

        continue;
      }
    }
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  }
  while (v21);

  if ((v35 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "localExtensionStateDidChange");

  }
LABEL_39:
  if ((v41 & 1) != 0)
    -[WBSPersistentPropertyListStore saveStoreSynchronously](self->_contentBlockerStateStore, "saveStoreSynchronously");

LABEL_42:
}

- (BOOL)extensionIsEnabled:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  char v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_contentBlockerStateStoreRequiresReload)
  {
    v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed from another process", (uint8_t *)&v17, 2u);
    }
    -[SFContentBlockerManager _loadContentBlockerStateFromDisk](self, "_loadContentBlockerStateFromDisk");
    self->_contentBlockerStateStoreRequiresReload = 0;
  }
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "composedIdentifierForExtensionStateForExtension:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "safari_BOOLForKey:", *MEMORY[0x1E0D8B3D8]);

  objc_msgSend(MEMORY[0x1E0D8AA20], "sharedController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "managedExtensionStateForComposedIdentifier:", v7);

  if (v11 == 1)
    v12 = v9;
  else
    v12 = 1;
  if ((v12 & 1) != 0)
  {
    if (v11 == 2)
      v13 = v9;
    else
      v13 = 0;
    if (v13 == 1)
    {
      v14 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = 138477827;
        v18 = v7;
        _os_log_impl(&dword_1A3B2D000, v14, OS_LOG_TYPE_INFO, "Disabling content blocker %{private}@ due to managed extension configuration", (uint8_t *)&v17, 0xCu);
      }
      -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](self, "setExtension:isEnabled:byUserGesture:", v4, 0, 0);
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    v15 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v17 = 138477827;
      v18 = v7;
      _os_log_impl(&dword_1A3B2D000, v15, OS_LOG_TYPE_INFO, "Enabling content blocker %{private}@ due to managed extension configuration", (uint8_t *)&v17, 0xCu);
    }
    LOBYTE(v9) = 1;
    -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](self, "setExtension:isEnabled:byUserGesture:", v4, 1, 0);
  }

  return v9;
}

- (WBSWebExtensionsController)webExtensionsController
{
  return self->_webExtensionsController;
}

- (void)_removeAllContentRuleLists
{
  id v3;
  id v4;
  id v5;

  -[WKUserContentController removeAllContentRuleLists](self->_userContentController, "removeAllContentRuleLists");
  if (-[SFContentBlockerManager _isManagingDefaultProfile](self, "_isManagingDefaultProfile"))
  {
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeAllContentRuleLists");

  }
  objc_msgSend(MEMORY[0x1E0CEF608], "safari_readerUserContentController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllContentRuleLists");

  objc_msgSend(MEMORY[0x1E0CEF608], "safari_readingListFetcherUserContentController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeAllContentRuleLists");

}

void __65__SFContentBlockerManager_SFPrivate___loadBuiltInContentBlockers__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addContentRuleList:", v4);

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addContentRuleList:", v4);
  }

}

- (void)_loadContentBlockerRecompilationInformationIfNeeded
{
  NSObject *recompilationInformationAccessQueue;
  _QWORD block[5];

  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke;
  block[3] = &unk_1E4AC1080;
  block[4] = self;
  dispatch_async(recompilationInformationAccessQueue, block);
}

- (void)_loadBuiltInContentBlockers
{
  void *v2;

  objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  WBSLoadBuiltInContentBlockersWithStore();

}

- (BOOL)_hasRecompilationBeenAttemptedForExtension:(id)a3
{
  id v4;
  NSObject *recompilationInformationAccessQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__SFContentBlockerManager_SFPrivate___hasRecompilationBeenAttemptedForExtension___block_invoke;
  block[3] = &unk_1E4AC11E0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(recompilationInformationAccessQueue, block);
  LOBYTE(recompilationInformationAccessQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)recompilationInformationAccessQueue;
}

- (id)_findNewExtensionsAdded:(id)a3 toExistingExtensions:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v6, "containsObject:", v12, (_QWORD)v14) & 1) == 0)
          objc_msgSend(v7, "addObject:", v12);
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v7;
}

- (id)_contentBlockerStateURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (objc_msgSend(MEMORY[0x1E0D8ADC8], "isProfileServerIDForDefaultProfile:", self->_profileServerID))
  {
    _SFSafariContainerURL();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Safari"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_5:

    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContentBlockers.plist"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_profileDirectoryURLWithID:createIfNeeded:", self->_profileServerID, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("ContentBlockers"), 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (id)objc_msgSend(v7, "safari_ensureDirectoryExists:", v4);

    v3 = v6;
    goto LABEL_5;
  }
  return v6;
}

- (void)_beginContentBlockerDiscovery
{
  void *v3;
  id v4;
  void *v5;
  _EXQueryController *v6;
  _EXQueryController *extensionKitQueryController;
  NSObject *v8;
  _QWORD block[5];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!self->_extensionMatchingContext)
  {
    if (-[SFContentBlockerManager _supportsExtensionDiscovery](self, "_supportsExtensionDiscovery"))
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA560]), "initWithExtensionPointIdentifier:", CFSTR("com.apple.Safari.content-blocker"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v3, "setExcludeLockedApps:", 1);
      v4 = objc_alloc(MEMORY[0x1E0CAA568]);
      v10[0] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (_EXQueryController *)objc_msgSend(v4, "initWithQueries:delegate:", v5, self);
      extensionKitQueryController = self->_extensionKitQueryController;
      self->_extensionKitQueryController = v6;

      dispatch_get_global_queue(0, 0);
      v8 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__SFContentBlockerManager_SFPrivate___beginContentBlockerDiscovery__block_invoke;
      block[3] = &unk_1E4AC1080;
      block[4] = self;
      dispatch_async(v8, block);

    }
    else
    {
      -[SFContentBlockerManager _populateExtensionsIfNecessaryUsingManagerForDefaultProfile](self, "_populateExtensionsIfNecessaryUsingManagerForDefaultProfile");
    }
  }
}

- (BOOL)_isManagingDefaultProfile
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0D8ADC8];
  -[WBSWebExtensionsController profileServerID](self->_webExtensionsController, "profileServerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isProfileServerIDForDefaultProfile:", v3);

  return (char)v2;
}

+ (WKContentRuleListStore)contentBlockerStore
{
  unsigned __int8 v2;

  if ((v2 & 1) == 0
  {
    __57__SFContentBlockerManager_SFPrivate__contentBlockerStore__block_invoke();
    +[SFContentBlockerManager(SFPrivate) contentBlockerStore]::contentBlockerStore = objc_claimAutoreleasedReturnValue();
  }
  return (WKContentRuleListStore *)(id)+[SFContentBlockerManager(SFPrivate) contentBlockerStore]::contentBlockerStore;
}

id __57__SFContentBlockerManager_SFPrivate__contentBlockerStore__block_invoke()
{
  void *v0;
  void *v1;

  _SFContentBlockerStoreURL();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[SFContentBlockerManager _createContentExtensionsDirectoryWithURL:](SFContentBlockerManager, "_createContentExtensionsDirectoryWithURL:", v0);
  objc_msgSend(MEMORY[0x1E0CEF5D8], "storeWithURL:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (void)_createContentExtensionsDirectoryWithURL:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9[5];

  v9[4] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, 0);

  v5 = *MEMORY[0x1E0C999D8];
  v9[0] = 0;
  v6 = objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v5, v9);
  v7 = v9[0];
  if ((v6 & 1) == 0)
  {
    v8 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      +[SFContentBlockerManager(SFPrivate) _createContentExtensionsDirectoryWithURL:].cold.1();
    }

  }
}

- (void)setWebExtensionsController:(id)a3
{
  objc_storeStrong((id *)&self->_webExtensionsController, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SFContentBlockerManager)initWithUserContentController:(id)a3 webExtensionsController:(id)a4
{
  id v7;
  id v8;
  SFContentBlockerManager *v9;
  SFContentBlockerManager *v10;
  uint64_t v11;
  NSString *profileServerID;
  SFContentBlockerManager *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SFContentBlockerManager;
  v9 = -[SFContentBlockerManager init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userContentController, a3);
    objc_msgSend(v8, "profileServerID");
    v11 = objc_claimAutoreleasedReturnValue();
    profileServerID = v10->_profileServerID;
    v10->_profileServerID = (NSString *)v11;

    objc_storeStrong((id *)&v10->_webExtensionsController, a4);
    -[SFContentBlockerManager _commonInit](v10, "_commonInit");
    v13 = v10;
  }

  return v10;
}

- (NSSet)extensions
{
  id extensionMatchingContext;

  if (self->_lastExtensionDiscoveryHadError)
  {
    extensionMatchingContext = self->_extensionMatchingContext;
    self->_extensionMatchingContext = 0;

    -[SFContentBlockerManager _beginContentBlockerDiscovery](self, "_beginContentBlockerDiscovery");
  }
  return self->_extensions;
}

- (SFContentBlockerManagerDelegate)delegate
{
  return (SFContentBlockerManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = a2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v17 != v5)
          objc_enumerationMutation(v3);
        v7 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", v7) & 1) != 0)
        {
          objc_msgSend(v7, "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x1E0C809B0];
          v12[1] = 3221225472;
          v12[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2;
          v12[3] = &unk_1E4AC0F68;
          v10 = v8;
          v11 = *(_QWORD *)(a1 + 32);
          v13 = v10;
          v14 = v11;
          v15 = v7;
          objc_msgSend(v9, "lookUpContentRuleListForIdentifier:completionHandler:", v10, v12);

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v4);
  }

}

uint64_t __67__SFContentBlockerManager_SFPrivate___beginContentBlockerDiscovery__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "resume");
}

+ (id)_contentBlockerLoaderConnection
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection)
  {
    v2 = (id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
  }
  else
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.SafariServices.ContentBlockerLoader"));
    v4 = (void *)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
    +[SFContentBlockerManager _contentBlockerLoaderConnection]::connection = v3;

    objc_msgSend((id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection, "setInvalidationHandler:", &__block_literal_global_6);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE7D6520);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection, "setRemoteObjectInterface:", v5);
    objc_msgSend((id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection, "resume");
    v2 = (id)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;

  }
  return v2;
}

void __58__SFContentBlockerManager__contentBlockerLoaderConnection__block_invoke()
{
  NSObject *v0;
  void *v1;
  uint8_t v2[16];

  v0 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_1A3B2D000, v0, OS_LOG_TYPE_DEFAULT, "XPC connection for 'com.apple.SafariServices.ContentBlockerLoader' was invalidated", v2, 2u);
  }
  v1 = (void *)+[SFContentBlockerManager _contentBlockerLoaderConnection]::connection;
  +[SFContentBlockerManager _contentBlockerLoaderConnection]::connection = 0;

}

+ (void)_loadContentBlockerWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;

  v5 = a3;
  v6 = a4;
  objc_msgSend((id)objc_opt_class(), "_contentBlockerLoaderConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke;
  v14[3] = &unk_1E4AC0EF0;
  v9 = v6;
  v15 = v9;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke_2;
  v12[3] = &unk_1E4AC0EF0;
  v11 = v9;
  v13 = v11;
  objc_msgSend(v10, "loadContentBlockerWithIdentifier:reply:", v5, v12);

}

void __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __79__SFContentBlockerManager__loadContentBlockerWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v5;

  v5 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v5);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.SafariServices.ContentBlockerDidChange"), 0, 0, 0);

}

+ (void)reloadContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD);
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;

  v6 = identifier;
  v7 = completionHandler;
  v8 = (void (**)(_QWORD, _QWORD))v7;
  if (v6)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __80__SFContentBlockerManager_reloadContentBlockerWithIdentifier_completionHandler___block_invoke;
    v18[3] = &unk_1E4AC0EF0;
    v19 = v7;
    objc_msgSend(a1, "_loadContentBlockerWithIdentifier:completionHandler:", v6, v18);
    v9 = v19;
LABEL_6:

    goto LABEL_7;
  }
  v10 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    +[SFContentBlockerManager reloadContentBlockerWithIdentifier:completionHandler:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    if (!v8)
      goto LABEL_7;
    goto LABEL_5;
  }
  if (v8)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFErrorDomain"), 1, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v8)[2](v8, v9);
    goto LABEL_6;
  }
LABEL_7:

}

void __80__SFContentBlockerManager_reloadContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

+ (void)getStateOfContentBlockerWithIdentifier:(NSString *)identifier completionHandler:(void *)completionHandler
{
  NSString *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;

  v6 = identifier;
  v7 = completionHandler;
  if (v7)
  {
    if (-[NSString length](v6, "length"))
    {
      objc_msgSend(a1, "_contentBlockerLoaderConnection");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __84__SFContentBlockerManager_getStateOfContentBlockerWithIdentifier_completionHandler___block_invoke;
      v20[3] = &unk_1E4AC0EF0;
      v9 = v7;
      v21 = v9;
      objc_msgSend(v8, "remoteObjectProxyWithErrorHandler:", v20);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "getStateOfContentBlockerWithIdentifier:reply:", v6, v9);
      v11 = v21;
    }
    else
    {
      v12 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        +[SFContentBlockerManager getStateOfContentBlockerWithIdentifier:completionHandler:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SFErrorDomain"), 1, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(void *, _QWORD, void *))v7 + 2))(v7, 0, v11);
    }

  }
}

uint64_t __84__SFContentBlockerManager_getStateOfContentBlockerWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)profileServerID
{
  return self->_profileServerID;
}

- (BOOL)hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce
{
  return self->_hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileServerID, 0);
  objc_storeStrong((id *)&self->_extensionKitQueryController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_webExtensionsController, 0);
  objc_storeStrong((id *)&self->_userContentController, 0);
  objc_storeStrong((id *)&self->_contentBlockerStateStore, 0);
  objc_storeStrong((id *)&self->_recompilationInformationAccessQueue, 0);
  objc_storeStrong((id *)&self->_extensionsRecompiledAfterBackup, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_extensions, 0);
  objc_storeStrong(&self->_extensionMatchingContext, 0);
}

- (SFContentBlockerManager)init
{
  SFContentBlockerManager *v2;
  uint64_t v3;
  WKUserContentController *userContentController;
  SFContentBlockerManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SFContentBlockerManager;
  v2 = -[SFContentBlockerManager init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_userContentController");
    v3 = objc_claimAutoreleasedReturnValue();
    userContentController = v2->_userContentController;
    v2->_userContentController = (WKUserContentController *)v3;

    -[SFContentBlockerManager _commonInit](v2, "_commonInit");
    v5 = v2;
  }

  return v2;
}

id __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v20;
  id v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  _QWORD v30[3];
  _QWORD v31[3];
  _BYTE v32[128];
  uint64_t v33;
  _QWORD v34[3];

  v34[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB35D8];
  v33 = *MEMORY[0x1E0CB2A28];
  v34[0] = CFSTR("com.apple.Safari.content-blocker");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  objc_msgSend(v1, "extensionsWithMatchingAttributes:error:", v2, &v29);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v29;

  if (v21)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v21, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke_cold_1();
    }

  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = v20;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v26;
    v6 = *MEMORY[0x1E0D8B3D8];
    v7 = *MEMORY[0x1E0D8B3E0];
    v8 = *MEMORY[0x1E0D8B3D0];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "_plugIn");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "userElection") & 0xFFFFFFFFFFFF00FFLL;

        v30[0] = v6;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13 == 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v31[0] = v14;
        v30[1] = v7;
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        v30[2] = v8;
        v17 = MEMORY[0x1E0C9AAA0];
        if (v13 == 1)
          v17 = MEMORY[0x1E0C9AAB0];
        v31[1] = v15;
        v31[2] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v18, v11);

      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v32, 16);
    }
    while (v4);
  }

  return v24;
}

- (void)addContentRuleList:(id)a3 forExtension:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v7, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138477827;
    v16 = v9;
    _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Adding content blocker rules from %{private}@", (uint8_t *)&v15, 0xCu);

  }
  -[WKUserContentController addContentRuleList:](self->_userContentController, "addContentRuleList:", v6);
  if (-[SFContentBlockerManager isContentBlockerAllowedInPrivateBrowsing:](self, "isContentBlockerAllowedInPrivateBrowsing:", v7)&& -[SFContentBlockerManager _isManagingDefaultProfile](self, "_isManagingDefaultProfile"))
  {
    v10 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v7, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138477827;
      v16 = v11;
      _os_log_impl(&dword_1A3B2D000, v10, OS_LOG_TYPE_INFO, "Adding content blocker rules from %{private}@ in private browsing", (uint8_t *)&v15, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addContentRuleList:", v6);

  }
  objc_msgSend(MEMORY[0x1E0CEF608], "safari_readerUserContentController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addContentRuleList:", v6);

  objc_msgSend(MEMORY[0x1E0CEF608], "safari_readingListFetcherUserContentController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addContentRuleList:", v6);

}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_135(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (!v3)
  {
    objc_msgSend((id)objc_opt_class(), "_loadContentBlockerWithIdentifier:completionHandler:", *(_QWORD *)(a1 + 40), 0);
    v3 = 0;
  }

}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_138(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v3 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_139;
  v6[3] = &unk_1E4AC0FB8;
  v4 = *(id *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

uint64_t __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_139(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)_applyContentBlockerInPrivateBrowsing:(id)a3
{
  id v3;
  void *v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __76__SFContentBlockerManager_SFPrivate___applyContentBlockerInPrivateBrowsing___block_invoke;
  v6[3] = &unk_1E4AC1030;
  v5 = v3;
  v7 = v5;
  objc_msgSend(v4, "lookUpContentRuleListForIdentifier:completionHandler:", v5, v6);

}

void __76__SFContentBlockerManager_SFPrivate___applyContentBlockerInPrivateBrowsing___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;

  v4 = a2;
  v5 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addContentRuleList:", v4);

  }
  else
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1();
    }

  }
}

- (void)_removeContentBlockerInPrivateBrowsing:(id)a3
{
  void *v3;
  id v4;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CEF608], "safari_privateBrowsingUserContentController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeUserContentFilter:", v4);

}

- (NSSet)enabledExtensions
{
  NSSet *extensions;
  _QWORD v4[5];

  extensions = self->_extensions;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__SFContentBlockerManager_SFPrivate__enabledExtensions__block_invoke;
  v4[3] = &unk_1E4AC1058;
  v4[4] = self;
  -[NSSet safari_mapAndFilterObjectsUsingBlock:](extensions, "safari_mapAndFilterObjectsUsingBlock:", v4);
  return (NSSet *)(id)objc_claimAutoreleasedReturnValue();
}

id __55__SFContentBlockerManager_SFPrivate__enabledExtensions__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", v3))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSMutableSet *observers;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    observers = self->_observers;
    v4 = v8;
  }
  -[NSMutableSet addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSMutableSet removeObject:](self->_observers, "removeObject:", a3);
}

- (void)queryControllerDidUpdate:(id)a3 resultDifference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v5 = a3;
  objc_msgSend(v5, "extensionIdentities");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "safari_filterObjectsUsingBlock:", &__block_literal_global_154);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "safari_mapObjectsUsingBlock:", &__block_literal_global_156);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke_3;
  v10[3] = &unk_1E4AC0590;
  v10[4] = self;
  v11 = v8;
  v9 = v8;
  dispatch_async(MEMORY[0x1E0C80D38], v10);

}

uint64_t __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "extensionPointIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.Safari.content-blocker"));

  return v3;
}

id __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentity:error:", a2, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __80__SFContentBlockerManager_SFPrivate__queryControllerDidUpdate_resultDifference___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_contentBlockerDiscoveryHasNewResults:error:", *(_QWORD *)(a1 + 40), 0);
}

- (void)_contentBlockerDiscoveryHasNewResults:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138477827;
    v13 = v6;
    _os_log_impl(&dword_1A3B2D000, v8, OS_LOG_TYPE_INFO, "Discovered content blockers: %{private}@", buf, 0xCu);
  }
  self->_lastExtensionDiscoveryHadError = v7 != 0;
  -[SFContentBlockerManager delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __82__SFContentBlockerManager_SFPrivate___contentBlockerDiscoveryHasNewResults_error___block_invoke;
    v10[3] = &unk_1E4AC1128;
    v11 = v6;
    objc_msgSend(v9, "enumerateContentBlockerManagersUsingBlock:", v10);

  }
  else
  {
    -[SFContentBlockerManager _didDiscoverExtensions:](self, "_didDiscoverExtensions:", v6);
  }

}

uint64_t __82__SFContentBlockerManager_SFPrivate___contentBlockerDiscoveryHasNewResults_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_didDiscoverExtensions:", *(_QWORD *)(a1 + 32));
}

- (id)_contentBlockerManagerForDefaultProfile
{
  id WeakRetained;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__SFContentBlockerManager_SFPrivate___contentBlockerManagerForDefaultProfile__block_invoke;
  v5[3] = &unk_1E4AC1150;
  v5[4] = &v6;
  objc_msgSend(WeakRetained, "enumerateContentBlockerManagersUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __77__SFContentBlockerManager_SFPrivate___contentBlockerManagerForDefaultProfile__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a2;
  v7 = (void *)MEMORY[0x1E0D8ADC8];
  v9 = v6;
  objc_msgSend(v6, "profileServerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isProfileServerIDForDefaultProfile:", v8);

  if ((_DWORD)v7)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)_populateExtensionsIfNecessaryUsingManagerForDefaultProfile
{
  _QWORD v2[4];
  id v3;
  id location;

  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke;
  v2[3] = &unk_1E4AC11B8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && !WeakRetained[104])
  {
    v5 = WeakRetained;
    objc_msgSend(WeakRetained, "_contentBlockerManagerForDefaultProfile");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v2, "hasPopulatedExtensionsFromExtensionDiscoveryAtLeastOnce"))
    {
      objc_msgSend(v2, "extensions");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safari_arrayByMappingObjectsUsingBlock:", &__block_literal_global_160);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "_didDiscoverExtensions:", v4);
    }

    WeakRetained = v5;
  }

}

id __97__SFContentBlockerManager_SFPrivate___populateExtensionsIfNecessaryUsingManagerForDefaultProfile__block_invoke_2(uint64_t a1, void *a2)
{
  return a2;
}

- (void)_contentBlockerEnabledStateDidChange:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  v4 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_INFO, "In _contentBlockerEnabledStateDidChange, indicating state reload was requested", v5, 2u);
  }
  self->_contentBlockerStateStoreRequiresReload = 1;
}

- (void)_contentBlockerStateInPrivateBrowsingDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D8AF50]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "safari_BOOLForKey:", *MEMORY[0x1E0D8B038]);

  if (v7)
    -[SFContentBlockerManager _applyContentBlockerInPrivateBrowsing:](self, "_applyContentBlockerInPrivateBrowsing:", v5);
  else
    -[SFContentBlockerManager _removeContentBlockerInPrivateBrowsing:](self, "_removeContentBlockerInPrivateBrowsing:", v5);

}

- (void)_saveContentBlockerRecompilationInformation
{
  NSMutableDictionary *extensionsRecompiledAfterBackup;
  void *v4;
  id v5;
  BOOL v6;
  NSObject *v7;
  id v8[5];

  v8[4] = *(id *)MEMORY[0x1E0C80C00];
  if (-[NSMutableDictionary count](self->_extensionsRecompiledAfterBackup, "count"))
  {
    extensionsRecompiledAfterBackup = self->_extensionsRecompiledAfterBackup;
    v8[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", extensionsRecompiledAfterBackup, 200, 0, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8[0];
    if (v5)
      v6 = 1;
    else
      v6 = v4 == 0;
    if (v6)
    {
      v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v5, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[SFContentBlockerManager(SFPrivate) _saveContentBlockerRecompilationInformation].cold.1();
      }
    }
    else
    {
      pathToRecompilationInformation();
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "writeToURL:atomically:", v7, 1);
    }

  }
}

- (void)_noteRecompilationWasAttemptedForExtension:(id)a3
{
  id v4;
  NSObject *recompilationInformationAccessQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  recompilationInformationAccessQueue = self->_recompilationInformationAccessQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __81__SFContentBlockerManager_SFPrivate___noteRecompilationWasAttemptedForExtension___block_invoke;
  v7[3] = &unk_1E4AC0590;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(recompilationInformationAccessQueue, v7);

}

uint64_t __81__SFContentBlockerManager_SFPrivate___noteRecompilationWasAttemptedForExtension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
  objc_msgSend(*(id *)(a1 + 40), "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v3);

  return objc_msgSend(*(id *)(a1 + 32), "_saveContentBlockerRecompilationInformation");
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  __int128 v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v5)
  {
    v7 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      objc_msgSend(v6, "safari_privacyPreservingDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v8;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_INFO, "Re-compiling Content Blocker '%{public}@' because it was not found due to lookup error: %{public}@", buf, 0x16u);

    }
    v10 = (void *)objc_opt_class();
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_165;
    v12[3] = &unk_1E4AC1208;
    v13 = *(_OWORD *)(a1 + 40);
    v14 = v11;
    objc_msgSend(v10, "_loadContentBlockerWithIdentifier:completionHandler:", v14, v12);

  }
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_165(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_noteRecompilationWasAttemptedForExtension:", *(_QWORD *)(a1 + 40));
  if (v3)
  {
    v4 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_165_cold_1();
    }

  }
  else
  {
    v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 48);
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Successfully loaded enabled Content Blocker '%{public}@'", (uint8_t *)&v7, 0xCu);
    }
  }

}

- (void)setExtension:(id)a3 isEnabled:(BOOL)a4 byUserGesture:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFNotificationCenter *DarwinNotifyCenter;
  _QWORD v28[4];
  id v29;
  SFContentBlockerManager *v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  uint64_t v35;

  v5 = a5;
  v6 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "composedIdentifierForExtensionStateForExtension:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  v13 = v12;
  if (v12)
  {
    v14 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  v15 = v14;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0D8B3D8]);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D8B3D0]);

  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0D8B3E0]);

  -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", v15, v10);
  -[WBSPersistentPropertyListStore saveStoreSynchronously](self->_contentBlockerStateStore, "saveStoreSynchronously");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "postNotificationName:object:", *MEMORY[0x1E0D8B040], v8);

  objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "postNotificationName:object:userInfo:deliverImmediately:", CFSTR("com.apple.SafariServices.ContentBlockerEnabledStateDidChange"), 0, 0, 1);

  objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localExtensionStateDidChange");

  objc_msgSend(v8, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v32 = v22;
    v33 = 1024;
    v34 = v6;
    _os_log_impl(&dword_1A3B2D000, v23, OS_LOG_TYPE_DEFAULT, "Setting content blocker (%{public}@) to state: %d", buf, 0x12u);
  }
  if (v6)
  {
    objc_msgSend((id)objc_opt_class(), "contentBlockerStore");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke;
    v28[3] = &unk_1E4AC1258;
    v29 = v22;
    v30 = self;
    objc_msgSend(v24, "lookUpContentRuleListForIdentifier:completionHandler:", v29, v28);

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_contentBlockerLoaderConnection");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "remoteObjectProxy");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeContentBlockerWithIdentifierIfNecessary:", v22);

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.SafariServices.ContentBlockerDidChange"), 0, 0, 0);
  }

}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v15 = v8;
      _os_log_impl(&dword_1A3B2D000, v7, OS_LOG_TYPE_DEFAULT, "Skipping compiling content blocker %{public}@ because it's already compiled", buf, 0xCu);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, CFSTR("com.apple.SafariServices.ContentBlockerDidChange"), 0, 0, 0);
  }
  else
  {
    v10 = (void *)objc_opt_class();
    v11 = *(void **)(a1 + 32);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_169;
    v12[3] = &unk_1E4AC1230;
    v13 = v11;
    objc_msgSend(v10, "_loadContentBlockerWithIdentifier:completionHandler:", v13, v12);

  }
}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_169(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  if (v2)
  {
    v3 = (id)WBS_LOG_CHANNEL_PREFIXContentBlockers();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v2, "safari_privacyPreservingDescription");
      objc_claimAutoreleasedReturnValue();
      __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_169_cold_1();
    }

  }
}

- (BOOL)isContentBlockerAllowedInPrivateBrowsing:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  char v14;
  uint8_t v16[16];

  v4 = a3;
  if (-[SFContentBlockerManager _isManagingDefaultProfile](self, "_isManagingDefaultProfile"))
  {
    if (self->_contentBlockerStateStoreRequiresReload)
    {
      v5 = WBS_LOG_CHANNEL_PREFIXContentBlockers();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Loading content blocker state from disk since it was changed from another process", v16, 2u);
      }
      -[SFContentBlockerManager _loadContentBlockerStateFromDisk](self, "_loadContentBlockerStateFromDisk");
      self->_contentBlockerStateStoreRequiresReload = 0;
    }
    -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "composedIdentifierForExtensionStateForExtension:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safari_numberForKey:", CFSTR("AllowInPrivateBrowsing"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
      v10 = objc_msgSend(v9, "BOOLValue");
    else
      v10 = 1;
    objc_msgSend(MEMORY[0x1E0D8AA20], "sharedController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "managedExtensionPrivateBrowsingStateForComposedIdentifier:", v7);

    if (v12 == 2)
      v13 = v10;
    else
      v13 = 0;
    if (v13 == 1)
    {
      -[SFContentBlockerManager setExtension:isEnabledInPrivateBrowsing:updateUserContentController:](self, "setExtension:isEnabledInPrivateBrowsing:updateUserContentController:", v4, 0, 0);
      LOBYTE(v10) = 0;
    }
    else
    {
      if (v12 == 1)
        v14 = v10;
      else
        v14 = 1;
      if ((v14 & 1) == 0)
      {
        LOBYTE(v10) = 1;
        -[SFContentBlockerManager setExtension:isEnabledInPrivateBrowsing:updateUserContentController:](self, "setExtension:isEnabledInPrivateBrowsing:updateUserContentController:", v4, 1, 0);
      }
    }

  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (void)setExtension:(id)a3 isEnabledInPrivateBrowsing:(BOOL)a4 updateUserContentController:(BOOL)a5
{
  _BOOL8 v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = a4;
  v17 = a3;
  if (-[SFContentBlockerManager _isManagingDefaultProfile](self, "_isManagingDefaultProfile"))
  {
    -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "composedIdentifierForExtensionStateForExtension:", v17);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, CFSTR("AllowInPrivateBrowsing"));

    -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", v14, v9);
    -[WBSPersistentPropertyListStore saveStoreSynchronously](self->_contentBlockerStateStore, "saveStoreSynchronously");
    if (a5)
    {
      objc_msgSend(v17, "identifier");
      if (v6)
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContentBlockerManager _applyContentBlockerInPrivateBrowsing:](self, "_applyContentBlockerInPrivateBrowsing:", v16);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFContentBlockerManager _removeContentBlockerInPrivateBrowsing:](self, "_removeContentBlockerInPrivateBrowsing:", v16);
      }

    }
  }

}

- (void)savePendingChangesBeforeTermination
{
  -[WBSPersistentPropertyListStore saveAndCloseStoreSynchronously](self->_contentBlockerStateStore, "saveAndCloseStoreSynchronously");
}

- (id)displayNameForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSSet *extensions;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, void *, _BYTE *);
  void *v20;
  id v21;
  _QWORD *v22;
  _QWORD v23[3];
  char v24;

  v4 = a3;
  objc_msgSend(v4, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "_plugIn");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedContainingName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v24 = 0;
  extensions = self->_extensions;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __62__SFContentBlockerManager_SFPrivate__displayNameForExtension___block_invoke;
  v20 = &unk_1E4AC1280;
  v10 = v6;
  v21 = v10;
  v22 = v23;
  -[NSSet objectsPassingTest:](extensions, "objectsPassingTest:", &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") == 1)
  {
    v12 = v8;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AAC8]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringWithFormat:", v14, v8, v15, v17, v18, v19, v20);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  _Block_object_dispose(v23, 8);

  return v12;
}

uint64_t __62__SFContentBlockerManager_SFPrivate__displayNameForExtension___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(a2, "_plugIn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "containingUrl");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  if ((_DWORD)v7)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (*(_BYTE *)(v8 + 24))
      *a3 = 1;
    else
      *(_BYTE *)(v8 + 24) = 1;
  }
  return v7;
}

- (id)_contentBlockerWithComposedIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id v13;

  v4 = a3;
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFContentBlockerManager extensions](self, "extensions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __76__SFContentBlockerManager_SFPrivate___contentBlockerWithComposedIdentifier___block_invoke;
  v11[3] = &unk_1E4AC12A8;
  v7 = v5;
  v12 = v7;
  v8 = v4;
  v13 = v8;
  objc_msgSend(v6, "safari_anyObjectPassingTest:", v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

uint64_t __76__SFContentBlockerManager_SFPrivate___contentBlockerWithComposedIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "composedIdentifierForExtensionStateForExtension:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (id)cloudExtensionStateForStateManager:(id)a3
{
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id obj;
  id v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3);
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[SFContentBlockerManager extensions](self, "extensions");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v4)
  {
    v24 = *(_QWORD *)v26;
    v21 = *MEMORY[0x1E0D8B3C0];
    v20 = *MEMORY[0x1E0D8B3C8];
    v19 = *MEMORY[0x1E0D8B3F0];
    v18 = *MEMORY[0x1E0D8B3E8];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v24)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "composedIdentifierForExtensionStateForExtension:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safari_containingAppAdamID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10 || (objc_msgSend(v6, "safari_containingAppIsTestFlightApp") & 1) != 0)
        {
          -[SFContentBlockerManager displayNameForExtension:](self, "displayNameForExtension:", v6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v12;
          if (v10)
            objc_msgSend(v12, "setObject:forKeyedSubscript:", v10, v21);
          if (v11)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, v20);
          objc_msgSend(v6, "safari_correspondingMacOSExtensionBundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, v19);

          objc_msgSend(v6, "safari_correspondingMacOSContainingAppBundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, v18);

          objc_msgSend(v13, "safari_dictionaryByMergingWithDictionary:", v9);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKeyedSubscript:", v16, v8);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  return v23;
}

- (void)setExtensionWithComposedIdentifier:(id)a3 isEnabledInCloud:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SFContentBlockerManager _contentBlockerWithComposedIdentifier:](self, "_contentBlockerWithComposedIdentifier:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SFContentBlockerManager extensionIsEnabled:](self, "extensionIsEnabled:") != v4)
    -[SFContentBlockerManager setExtension:isEnabled:byUserGesture:](self, "setExtension:isEnabled:byUserGesture:", v6, v4, 0);

}

- (BOOL)hasExtensionWithComposedIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[SFContentBlockerManager _contentBlockerWithComposedIdentifier:](self, "_contentBlockerWithComposedIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)profileServerIDForStateManager:(id)a3
{
  return self->_profileServerID;
}

- (id)_installationDateForExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SFContentBlockerManager webExtensionsController](self, "webExtensionsController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "composedIdentifierForExtensionStateForExtension:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safari_dateForKey:", *MEMORY[0x1E0D8B048]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (unint64_t)recentlyInstalledExtensionCount
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  BOOL (*v12)(uint64_t, void *);
  void *v13;
  SFContentBlockerManager *v14;
  id v15;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dateForKey:", *MEMORY[0x1E0D8B138]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSSet allObjects](self->_extensions, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __69__SFContentBlockerManager_SFPrivate__recentlyInstalledExtensionCount__block_invoke;
  v13 = &unk_1E4AC12A8;
  v14 = self;
  v6 = v4;
  v15 = v6;
  objc_msgSend(v5, "safari_filterObjectsUsingBlock:", &v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count", v10, v11, v12, v13, v14);

  return v8;
}

BOOL __69__SFContentBlockerManager_SFPrivate__recentlyInstalledExtensionCount__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;

  v3 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "extensionIsEnabled:", v3) & 1) != 0)
  {
    v4 = 0;
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_installationDateForExtension:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(*(id *)(a1 + 40), "compare:", v5) == -1;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (id)extensionStateKeysToCopy
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = *MEMORY[0x1E0D8B048];
  v8[0] = *MEMORY[0x1E0D8B3D8];
  v8[1] = v3;
  v4 = *MEMORY[0x1E0D8B3D0];
  v8[2] = *MEMORY[0x1E0D8B050];
  v8[3] = v4;
  v8[4] = *MEMORY[0x1E0D8B3E0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)copyEnabledExtensionStateFromContentBlockerManager:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  uint64_t v14;
  void *v15;
  id obj;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v18 = (id *)a3;
  -[SFContentBlockerManager extensionStateKeysToCopy](self, "extensionStateKeysToCopy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v18[7], "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v4;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      v19 = v5;
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v18[7], "dictionaryForKey:", v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[WBSPersistentPropertyListStore dictionaryForKey:](self->_contentBlockerStateStore, "dictionaryForKey:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)objc_msgSend(v8, "mutableCopy");

        v24 = 0u;
        v25 = 0u;
        v22 = 0u;
        v23 = 0u;
        v10 = v20;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
        if (v11)
        {
          v12 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v10);
              v14 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j);
              if ((objc_msgSend(v3, "containsObject:", v14) & 1) != 0)
              {
                objc_msgSend(v10, "objectForKeyedSubscript:", v14);
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

              }
            }
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          }
          while (v11);
        }

        -[WBSPersistentPropertyListStore setObject:forKey:](self->_contentBlockerStateStore, "setObject:forKey:", v9, v7);
      }
      v4 = obj;
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  -[WBSPersistentPropertyListStore saveStoreSynchronously](self->_contentBlockerStateStore, "saveStoreSynchronously");
}

- (NSString)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; profile server ID = \"%@\"), v5, self, self->_profileServerID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

+ (void)reloadContentBlockerWithIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to reload content blocker because the identifier was invalid", a5, a6, a7, a8, 0);
}

+ (void)getStateOfContentBlockerWithIdentifier:(uint64_t)a3 completionHandler:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, a1, a3, "Failed to get state of content blocker because the identifier was invalid", a5, a6, a7, a8, 0);
}

void __70__SFContentBlockerManager_SFPrivate___loadContentBlockerStateFromDisk__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Error occurred when attempting to find content blocker extensions: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __86__SFContentBlockerManager_SFPrivate__reloadUserContentControllerReadingStateFromDisk___block_invoke_2_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A3B2D000, "Failed to look up content blocker '%{private}@' with error %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

void __89__SFContentBlockerManager_SFPrivate___loadContentBlockerRecompilationInformationIfNeeded__block_invoke_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  int v3;
  os_log_t v4;
  uint8_t *v5;

  OUTLINED_FUNCTION_7_0();
  OUTLINED_FUNCTION_6_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_1_1(&dword_1A3B2D000, v3, v4, "Failed to read recompilation information: %{public}@", v5);

  OUTLINED_FUNCTION_3_0();
}

void __79__SFContentBlockerManager_SFPrivate___recompileEnabledContentBlockersIfNeeded___block_invoke_165_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A3B2D000, "Previously enabled Content Blocker '%{public}@' failed to load: %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

void __75__SFContentBlockerManager_SFPrivate__setExtension_isEnabled_byUserGesture___block_invoke_169_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_0_2(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_0(&dword_1A3B2D000, "Error loading content blocker (%{public}@): %{public}@", v4, v5);

  OUTLINED_FUNCTION_3_0();
}

@end
