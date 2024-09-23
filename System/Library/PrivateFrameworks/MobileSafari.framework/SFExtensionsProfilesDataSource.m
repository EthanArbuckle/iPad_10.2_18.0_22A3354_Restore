@implementation SFExtensionsProfilesDataSource

- (SFExtensionsProfilesDataSource)initWithTabGroupManager:(id)a3
{
  id v5;
  SFExtensionsProfilesDataSource *v6;
  SFExtensionsProfilesDataSource *v7;
  SFExtensionsProfilesDataSource *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SFExtensionsProfilesDataSource;
  v6 = -[SFExtensionsProfilesDataSource init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabGroupManager, a3);
    v8 = v7;
  }

  return v7;
}

- (NSDictionary)profileServerIDToWebExtensionsControllers
{
  uint64_t v3;
  void *v4;
  SFWebExtensionsController *v5;
  uint64_t v6;
  SFWebExtensionsController *v7;
  SFSafariProfileDelegate *sharedProfileDelegate;
  SFSafariProfileDelegate *v9;
  SFSafariProfileDelegate *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  BOOL v28;
  SFWebExtensionsController *v29;
  SFSafariProfileDelegate *v30;
  SFSafariProfileDelegate *v31;
  SFSafariProfileDelegate *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v37;
  id obj;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v37 = -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers;
  if (!-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers;
    -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers = v3;

    v5 = [SFWebExtensionsController alloc];
    v6 = *MEMORY[0x1E0D89E20];
    v7 = -[WBSExtensionsController initWithProfileServerID:userContentController:forceExtensionLoadingAfterDiscovery:](v5, "initWithProfileServerID:userContentController:forceExtensionLoadingAfterDiscovery:", *MEMORY[0x1E0D89E20], 0, 1);
    sharedProfileDelegate = self->_sharedProfileDelegate;
    if (!sharedProfileDelegate)
    {
      v9 = -[SFSafariProfileDelegate initWithDataSource:]([SFSafariProfileDelegate alloc], "initWithDataSource:", self);
      v10 = self->_sharedProfileDelegate;
      self->_sharedProfileDelegate = v9;

      sharedProfileDelegate = self->_sharedProfileDelegate;
    }
    -[SFWebExtensionsController setProfileDelegate:](v7, "setProfileDelegate:", sharedProfileDelegate);
    objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "setObject:forKeyedSubscript:", v7, v6);
    -[WBSExtensionsController findExtensions](v7, "findExtensions");
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addProvider:", v7);

  }
  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = (id)objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "copy");
  v14 = 0;
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v44;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v44 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i);
        if ((objc_msgSend(v13, "containsObject:", v18) & 1) == 0)
        {
          objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "objectForKeyedSubscript:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (v19)
          {
            v20 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v49 = v18;
              _os_log_impl(&dword_18B7B2000, v20, OS_LOG_TYPE_INFO, "Deleting web extension state for profile with server ID %{private}@", buf, 0xCu);
            }
            objc_msgSend(v19, "unloadAndDeleteStateForAllExtensions");
            objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "removeProvider:", v19);

            objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "removeObjectForKey:", v18);
            v14 = 1;
          }

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
    }
    while (v15);
  }

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v22 = v13;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v23)
  {
    v24 = *(_QWORD *)v40;
    do
    {
      for (j = 0; j != v23; ++j)
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v22);
        v26 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * j);
        objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "objectForKeyedSubscript:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v27 == 0;

        if (v28)
        {
          v29 = -[WBSExtensionsController initWithProfileServerID:userContentController:forceExtensionLoadingAfterDiscovery:]([SFWebExtensionsController alloc], "initWithProfileServerID:userContentController:forceExtensionLoadingAfterDiscovery:", v26, 0, 1);
          v30 = self->_sharedProfileDelegate;
          if (!v30)
          {
            v31 = -[SFSafariProfileDelegate initWithDataSource:]([SFSafariProfileDelegate alloc], "initWithDataSource:", self);
            v32 = self->_sharedProfileDelegate;
            self->_sharedProfileDelegate = v31;

            v30 = self->_sharedProfileDelegate;
          }
          -[SFWebExtensionsController setProfileDelegate:](v29, "setProfileDelegate:", v30);
          objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "setObject:forKeyedSubscript:", v29, v26);
          -[WBSExtensionsController findExtensions](v29, "findExtensions");
          objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "addProvider:", v29);

          v14 = 1;
        }
      }
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v23);
  }

  if (((v37 != 0) & v14) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "localExtensionStateDidChange");

  }
  v35 = (void *)objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers]::extensionControllers, "copy");

  return (NSDictionary *)v35;
}

id __75__SFExtensionsProfilesDataSource_profileServerIDToWebExtensionsControllers__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "identifierForExtensions");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSDictionary)profileServerIDToContentBlockerManagers
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  SFSafariProfileDelegate *sharedProfileDelegate;
  SFSafariProfileDelegate *v11;
  SFSafariProfileDelegate *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  uint64_t v27;
  void *v28;
  BOOL v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  SFSafariProfileDelegate *v34;
  SFSafariProfileDelegate *v35;
  SFSafariProfileDelegate *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v41;
  id v42;
  id obj;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v41 = -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers;
  if (!-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers;
    -[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers = v3;

    v5 = objc_alloc((Class)getSFContentBlockerManagerClass());
    -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers](self, "profileServerIDToWebExtensionsControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x1E0D89E20];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D89E20]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v5, "initWithUserContentController:webExtensionsController:", 0, v8);

    sharedProfileDelegate = self->_sharedProfileDelegate;
    if (!sharedProfileDelegate)
    {
      v11 = -[SFSafariProfileDelegate initWithDataSource:]([SFSafariProfileDelegate alloc], "initWithDataSource:", self);
      v12 = self->_sharedProfileDelegate;
      self->_sharedProfileDelegate = v11;

      sharedProfileDelegate = self->_sharedProfileDelegate;
    }
    objc_msgSend(v9, "setDelegate:", sharedProfileDelegate);
    objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "setObject:forKeyedSubscript:", v9, v7);
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addProvider:", v9);

  }
  -[WBTabGroupManager profiles](self->_tabGroupManager, "profiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_4_0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = (id)objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "copy");
  v16 = 0;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
  if (v17)
  {
    v18 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i);
        if ((objc_msgSend(v15, "containsObject:", v20) & 1) == 0)
        {
          objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            v22 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138477827;
              v54 = v20;
              _os_log_impl(&dword_18B7B2000, v22, OS_LOG_TYPE_INFO, "Deleting content blocker state for profile with server ID %{private}@", buf, 0xCu);
            }
            objc_msgSend(v21, "unloadAndDeleteStateForAllExtensions");
            objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "removeProvider:", v21);

            objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "removeObjectForKey:", v20);
            v16 = 1;
          }

        }
      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
    }
    while (v17);
  }

  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = v15;
  v24 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v45 != v25)
          objc_enumerationMutation(v42);
        v27 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "objectForKeyedSubscript:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v28 == 0;

        if (v29)
        {
          v30 = objc_alloc((Class)getSFContentBlockerManagerClass());
          -[SFExtensionsProfilesDataSource profileServerIDToWebExtensionsControllers](self, "profileServerIDToWebExtensionsControllers");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "objectForKeyedSubscript:", v27);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = (void *)objc_msgSend(v30, "initWithUserContentController:webExtensionsController:", 0, v32);

          v34 = self->_sharedProfileDelegate;
          if (!v34)
          {
            v35 = -[SFSafariProfileDelegate initWithDataSource:]([SFSafariProfileDelegate alloc], "initWithDataSource:", self);
            v36 = self->_sharedProfileDelegate;
            self->_sharedProfileDelegate = v35;

            v34 = self->_sharedProfileDelegate;
          }
          objc_msgSend(v33, "setDelegate:", v34);
          objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "setObject:forKeyedSubscript:", v33, v27);
          objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "addProvider:", v33);

          v16 = 1;
        }
      }
      v24 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
    }
    while (v24);
  }

  if (((v41 != 0) & v16) == 1)
  {
    objc_msgSend(MEMORY[0x1E0D8A828], "sharedManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "localExtensionStateDidChange");

  }
  v39 = (void *)objc_msgSend((id)-[SFExtensionsProfilesDataSource profileServerIDToContentBlockerManagers]::contentBlockerManagers, "copy");

  return (NSDictionary *)v39;
}

id __73__SFExtensionsProfilesDataSource_profileServerIDToContentBlockerManagers__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "identifierForExtensions");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (WBTabGroupManager)tabGroupManager
{
  return self->_tabGroupManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tabGroupManager, 0);
  objc_storeStrong((id *)&self->_sharedProfileDelegate, 0);
}

@end
