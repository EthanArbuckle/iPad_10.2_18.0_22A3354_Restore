@implementation MIKeychainAccessGroupTracker

+ (id)sharedTracker
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__MIKeychainAccessGroupTracker_sharedTracker__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedTracker_onceToken != -1)
    dispatch_once(&sharedTracker_onceToken, block);
  return (id)sharedTracker_sharedInstance;
}

void __45__MIKeychainAccessGroupTracker_sharedTracker__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedTracker_sharedInstance;
  sharedTracker_sharedInstance = (uint64_t)v0;

}

- (MIKeychainAccessGroupTracker)init
{
  MIKeychainAccessGroupTracker *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *q;
  MIKeychainAccessGroupTracker *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MIKeychainAccessGroupTracker;
  v2 = -[MIKeychainAccessGroupTracker init](&v8, sel_init);
  if (v2
    && (dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM),
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = dispatch_queue_create("com.apple.installd.MIKeychainAccessGroupTracker", v3),
        q = v2->_q,
        v2->_q = (OS_dispatch_queue *)v4,
        q,
        v3,
        !v2->_q))
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v6 = 0;
  }
  else
  {
    v6 = v2;
  }

  return v6;
}

- (void)_onQueue_discoverReferences
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  BOOL v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  -[MIKeychainAccessGroupTracker q](self, "q");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  mach_absolute_time();
  v4 = (void *)objc_opt_new();
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemAppBundleIDToInfoMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    objc_msgSend(v4, "addObject:", v6);
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "internalAppBundleIDToInfoMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v4, "addObject:", v8);
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coreServicesAppBundleIDToInfoMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    objc_msgSend(v4, "addObject:", v10);
  v11 = (void *)objc_opt_new();
  -[MIKeychainAccessGroupTracker setRefs:](self, "setRefs:", v11);

  v44 = 0;
  +[MIBundleContainer allAppBundleContainersWithError:](MIBundleContainer, "allAppBundleContainersWithError:", &v44);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v44;
  if (v12)
  {
    v31 = v12;
    v33 = v4;
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
    v40 = 0u;
    v14 = v12;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    v32 = v10;
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v41 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v19, "bundle", v30);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            v39 = v13;
            v21 = -[MIKeychainAccessGroupTracker _onQueue_addReferencesForBundle:error:](self, "_onQueue_addReferencesForBundle:error:", v20, &v39);
            v22 = v39;

            if (!v21 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              v30 = v20;
              MOLogWrite();
            }
            v13 = v22;
          }
          else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          {
            v30 = v19;
            MOLogWrite();
          }

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v16);
    }

    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v23 = v33;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v36;
      v27 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v25; ++j)
        {
          if (*(_QWORD *)v36 != v26)
            objc_enumerationMutation(v23);
          v29 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
          v34[0] = v27;
          v34[1] = 3221225472;
          v34[2] = __59__MIKeychainAccessGroupTracker__onQueue_discoverReferences__block_invoke;
          v34[3] = &unk_1E6CB7090;
          v34[4] = self;
          objc_msgSend(v29, "enumerateKeysAndObjectsUsingBlock:", v34, v30);
        }
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v35, v45, 16);
      }
      while (v25);
    }

    mach_absolute_time();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v10 = v32;
    v4 = v33;
    v12 = v31;
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

}

void __59__MIKeychainAccessGroupTracker__onQueue_discoverReferences__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("com.apple.MobileInstallation.bundleURL"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v14 = 0;
    +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v6, &v14);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v14;
    if (v7)
    {
      v9 = *(void **)(a1 + 32);
      v13 = v8;
      v10 = objc_msgSend(v9, "_onQueue_addReferencesForBundle:error:", v7, &v13);
      v11 = v13;

      if ((v10 & 1) == 0 && gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        MOLogWrite();
      v8 = v11;
    }
    else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    MOLogWrite();
  }

}

- (BOOL)_onQueue_addReferencesForBundle:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[MIKeychainAccessGroupTracker refs](self, "refs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  v24 = 0;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:](self, "_keychainAccessGroupsForApp:error:", v6, &v24);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v24;
  if (v9)
  {
    if (!objc_msgSend(v9, "count"))
      goto LABEL_19;
    v19 = a4;
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = v9;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v21;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v11);
          v16 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v15);
          -[MIKeychainAccessGroupTracker refs](self, "refs");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "addObject:", v16);

          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      }
      while (v13);
    }

    a4 = v19;
  }
  else if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    MOLogWrite();
  }
  if (a4 && !v9)
    *a4 = objc_retainAutorelease(v10);
LABEL_19:

  return v9 != 0;
}

- (BOOL)addReferencesForBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_onQueue_updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  uint64_t v32;
  void *v33;
  BOOL v34;
  void *v35;
  uint64_t v36;
  id *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a4;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  v10 = (void *)objc_opt_new();
  -[MIKeychainAccessGroupTracker refs](self, "refs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  v52 = 0;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:](self, "_keychainAccessGroupsForApp:error:", v8, &v52);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v52;
  v14 = v13;
  if (!v12)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v15 = 0;
    if (!a5)
      goto LABEL_16;
    goto LABEL_11;
  }
  v51 = v13;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:](self, "_keychainAccessGroupsForApp:error:", v41, &v51);
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v51;

  if (!v15)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v15 = 0;
    v14 = v16;
    if (!a5)
      goto LABEL_16;
    goto LABEL_11;
  }
  if ((objc_msgSend(v12, "isEqualToSet:", v15) & 1) == 0)
  {
    v37 = a5;
    v38 = v16;
    v40 = v10;
    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v39 = v12;
    v19 = v12;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v48;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v48 != v22)
            objc_enumerationMutation(v19);
          v24 = *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * i);
          if ((objc_msgSend(v15, "containsObject:", v24) & 1) == 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              objc_msgSend(v41, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v24;
              MOLogWrite();

            }
            -[MIKeychainAccessGroupTracker refs](self, "refs", v35, v36);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "removeObject:", v24);

            -[MIKeychainAccessGroupTracker refs](self, "refs");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "countForObject:", v24);

            if (!v27)
              objc_msgSend(v40, "addObject:", v24);
          }
        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v47, v54, 16);
      }
      while (v21);
    }

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v15 = v15;
    v28 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v44;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v44 != v30)
            objc_enumerationMutation(v15);
          v32 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * j);
          if ((objc_msgSend(v19, "containsObject:", v32) & 1) == 0)
          {
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              objc_msgSend(v41, "identifier");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v32;
              MOLogWrite();

            }
            -[MIKeychainAccessGroupTracker refs](self, "refs", v35, v36);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "addObject:", v32);

          }
        }
        v29 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
      }
      while (v29);
    }

    v10 = v40;
    if (!objc_msgSend(v40, "count"))
    {
      v17 = 1;
      v12 = v39;
      v16 = v38;
      goto LABEL_18;
    }
    v42 = v38;
    v34 = -[MIKeychainAccessGroupTracker _removeGroupsWithError:error:](self, "_removeGroupsWithError:error:", v40, &v42);
    v14 = v42;

    v12 = v39;
    if (v34)
    {
      v17 = 1;
      goto LABEL_17;
    }
    a5 = v37;
    if (!v37)
    {
LABEL_16:
      v17 = 0;
LABEL_17:
      v16 = v14;
      goto LABEL_18;
    }
LABEL_11:
    v16 = objc_retainAutorelease(v14);
    v17 = 0;
    *a5 = v16;
    goto LABEL_18;
  }
  v17 = 1;
LABEL_18:

  return v17;
}

- (BOOL)updateReferencesWithOldBundle:(id)a3 newBundle:(id)a4 error:(id *)a5
{
  return 1;
}

- (BOOL)_onQueue_removeReferencesForBundle:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  BOOL v22;
  BOOL v23;
  void *v25;
  uint64_t v26;
  id *v27;
  void *v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  id v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[MIKeychainAccessGroupTracker q](self, "q");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_opt_new();
  -[MIKeychainAccessGroupTracker refs](self, "refs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    -[MIKeychainAccessGroupTracker _onQueue_discoverReferences](self, "_onQueue_discoverReferences");
  v35 = 0;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForApp:error:](self, "_keychainAccessGroupsForApp:error:", v6, &v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  v12 = v11;
  if (!v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    if (!a4)
      goto LABEL_26;
    goto LABEL_23;
  }
  v27 = a4;
  v28 = v11;
  v29 = v10;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          objc_msgSend(v6, "identifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v18;
          MOLogWrite();

        }
        -[MIKeychainAccessGroupTracker refs](self, "refs", v25, v26);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "removeObject:", v18);

        -[MIKeychainAccessGroupTracker refs](self, "refs");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "countForObject:", v18);

        if (!v21)
          objc_msgSend(v8, "addObject:", v18);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v15);
  }

  if (!objc_msgSend(v8, "count"))
  {
    v23 = 1;
    v12 = v28;
    v10 = v29;
    goto LABEL_27;
  }
  v30 = v28;
  v22 = -[MIKeychainAccessGroupTracker _removeGroupsWithError:error:](self, "_removeGroupsWithError:error:", v8, &v30);
  v12 = v30;

  if (!v22)
  {
    a4 = v27;
    v10 = v29;
    if (!v27)
    {
LABEL_26:
      v23 = 0;
      goto LABEL_27;
    }
LABEL_23:
    v12 = objc_retainAutorelease(v12);
    v23 = 0;
    *a4 = v12;
    goto LABEL_27;
  }
  v23 = 1;
  v10 = v29;
LABEL_27:

  return v23;
}

- (BOOL)removeReferencesForBundle:(id)a3 error:(id *)a4
{
  return 1;
}

- (BOOL)_removeGroupsWithError:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  char v7;
  id v8;

  v5 = a3;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    MOLogWrite();
  v7 = SecItemDeleteAllWithAccessGroups();
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIKeychainAccessGroupTracker _removeGroupsWithError:error:]", 373, CFSTR("MIInstallerErrorDomain"), 125, 0, 0, CFSTR("Failed to remove keychain items %@"), v6, (uint64_t)v5);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }

  return v7;
}

- (id)_keychainAccessGroupsForBundle:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;

  v5 = a3;
  v17 = 0;
  objc_msgSend(v5, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, &v17);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v17;
  if (v6)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v6, "entitlements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyKeychainAccessGroupEntitlement(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v8, "addObjectsFromArray:", v10);
    objc_msgSend(v6, "entitlements");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyApplicationGroupEntitlement(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      objc_msgSend(v8, "addObjectsFromArray:", v12);
    objc_msgSend(v6, "entitlements");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MICopyApplicationIdentifierEntitlement(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      objc_msgSend(v8, "addObject:", v14);
    v15 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    v15 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v7);
  }

  return v15;
}

- (id)_keychainAccessGroupsForApp:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  id v33;
  void *v34;
  id *v35;
  void *v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  id v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  id v48;
  id v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v49 = 0;
  -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:](self, "_keychainAccessGroupsForBundle:error:", v6, &v49);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v49;
  if (!v8)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    v22 = 0;
    v12 = 0;
    v30 = 0;
    v11 = v9;
    if (!a4)
      goto LABEL_38;
LABEL_36:
    if (!v30)
      *a4 = objc_retainAutorelease(v11);
    goto LABEL_38;
  }
  objc_msgSend(v7, "unionSet:", v8);
  v48 = v9;
  objc_msgSend(v6, "appExtensionBundlesWithError:", &v48);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v48;

  if (!v10)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v22 = 0;
    v12 = 0;
    v30 = 0;
    if (!a4)
      goto LABEL_38;
    goto LABEL_36;
  }
  v34 = v8;
  v35 = a4;
  v36 = v7;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v45;
    while (2)
    {
      v16 = 0;
      v17 = v11;
      do
      {
        if (*(_QWORD *)v45 != v15)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * v16);
        v43 = v17;
        -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:](self, "_keychainAccessGroupsForBundle:error:", v18, &v43);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v43;

        if (!v19)
        {
          v7 = v36;
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            MOLogWrite();

          v22 = 0;
          v30 = 0;
          goto LABEL_30;
        }
        objc_msgSend(v36, "unionSet:", v19);

        ++v16;
        v17 = v11;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v44, v51, 16);
      if (v14)
        continue;
      break;
    }
  }
  v20 = v11;

  v42 = v11;
  objc_msgSend(v6, "xpcServiceBundlesWithError:", &v42);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v42;

  if (!v21)
  {
    v7 = v36;
    v8 = v34;
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
    v22 = 0;
    v30 = 0;
    a4 = v35;
    if (!v35)
      goto LABEL_38;
    goto LABEL_36;
  }
  v33 = v6;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v22 = v21;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v39;
    while (2)
    {
      v26 = 0;
      v27 = v11;
      do
      {
        if (*(_QWORD *)v39 != v25)
          objc_enumerationMutation(v22);
        v28 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v26);
        v37 = v27;
        -[MIKeychainAccessGroupTracker _keychainAccessGroupsForBundle:error:](self, "_keychainAccessGroupsForBundle:error:", v28, &v37);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v37;

        if (!v29)
        {
          if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            MOLogWrite();

          v30 = 0;
          v6 = v33;
          v7 = v36;
          goto LABEL_30;
        }
        objc_msgSend(v36, "unionSet:", v29);

        ++v26;
        v27 = v11;
      }
      while (v24 != v26);
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v24)
        continue;
      break;
    }
  }

  v7 = v36;
  v30 = (void *)objc_msgSend(v36, "copy");
  v6 = v33;
LABEL_30:
  v8 = v34;
  a4 = v35;
  if (v35)
    goto LABEL_36;
LABEL_38:
  v31 = v30;

  return v31;
}

- (NSCountedSet)refs
{
  return self->_refs;
}

- (void)setRefs:(id)a3
{
  objc_storeStrong((id *)&self->_refs, a3);
}

- (OS_dispatch_queue)q
{
  return self->_q;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_q, 0);
  objc_storeStrong((id *)&self->_refs, 0);
}

@end
