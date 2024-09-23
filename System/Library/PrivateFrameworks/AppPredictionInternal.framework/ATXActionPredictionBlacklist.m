@implementation ATXActionPredictionBlacklist

void __50__ATXActionPredictionBlacklist__handlePrefsChange__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_prefsDisabledApps");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v3[10];
  v3[10] = v4;

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v3[10];
    v10 = 138412546;
    v11 = v8;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - new action blacklist: %@", (uint8_t *)&v10, 0x16u);

  }
}

- (id)_prefsDisabledApps
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ATXActionPredictionBlacklist disabledBundlesInSettings](self, "disabledBundlesInSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionBlacklist homeScreenDisabledShortcutsInSettings](self, "homeScreenDisabledShortcutsInSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setByAddingObjectsFromArray:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = v3;
  }
  v6 = v5;

  return v6;
}

- (id)homeScreenDisabledShortcutsInSettings
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)CFPreferencesCopyAppValue(CFSTR("SBSearchDisabledShortcuts"), CFSTR("com.apple.spotlightui"));
  v3 = v2;
  if (v2)
    v4 = v2;
  else
    v4 = (id)objc_opt_new();
  v5 = v4;

  return v5;
}

- (id)disabledBundlesInSettings
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionBlacklist);
  objc_msgSend(WeakRetained, "disabledBundleIds");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __63__ATXActionPredictionBlacklist_initWithAppPredictionBlacklist___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handlePrefsChange");

}

- (void)_handlePrefsChange
{
  _PASLock *lock;
  _QWORD v3[5];

  lock = self->_lock;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__ATXActionPredictionBlacklist__handlePrefsChange__block_invoke;
  v3[3] = &unk_1E82E5700;
  v3[4] = self;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v3);
}

- (ATXActionPredictionBlacklist)initWithAppPredictionBlacklist:(id)a3
{
  id v4;
  ATXActionPredictionBlacklist *v5;
  id v6;
  void *v7;
  uint64_t v8;
  _PASLock *lock;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id location;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)ATXActionPredictionBlacklist;
  v5 = -[ATXActionPredictionBlacklist init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0D815F0]);
    v7 = (void *)objc_opt_new();
    v8 = objc_msgSend(v6, "initWithGuardedData:", v7);
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v8;

    objc_storeWeak((id *)&v5->_appPredictionBlacklist, v4);
    +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blacklistedAppActions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blacklistedAppActionsForPredictions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blacklistedAppActionsForShortcuts");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "blacklistedAppActionsForPrimaryShortcuts");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXActionPredictionBlacklist setBlacklistFromAssetData:predictionBlacklist:shortcutBlacklist:primaryShortcutBlacklist:](v5, "setBlacklistFromAssetData:predictionBlacklist:shortcutBlacklist:primaryShortcutBlacklist:", v11, v12, v13, v14);

    -[ATXActionPredictionBlacklist _handlePrefsChange](v5, "_handlePrefsChange");
    objc_initWeak(&location, v5);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __63__ATXActionPredictionBlacklist_initWithAppPredictionBlacklist___block_invoke;
    v16[3] = &unk_1E82DB988;
    objc_copyWeak(&v17, &location);
    v5->_prefsChangeNotificationToken = objc_msgSend(v4, "registerPrefsChangeHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (ATXActionPredictionBlacklist)init
{
  return -[ATXActionPredictionBlacklist initWithAppPredictionBlacklist:](self, "initWithAppPredictionBlacklist:", 0);
}

+ (id)sharedInstanceWithoutAppPredictionBlacklist
{
  if (sharedInstanceWithoutAppPredictionBlacklist_onceToken != -1)
    dispatch_once(&sharedInstanceWithoutAppPredictionBlacklist_onceToken, &__block_literal_global_134);
  return (id)sharedInstanceWithoutAppPredictionBlacklist_instance;
}

void __75__ATXActionPredictionBlacklist_sharedInstanceWithoutAppPredictionBlacklist__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstanceWithoutAppPredictionBlacklist_instance;
  sharedInstanceWithoutAppPredictionBlacklist_instance = v0;

}

+ (id)sharedInstanceWithAppPredictionBlacklist
{
  if (sharedInstanceWithAppPredictionBlacklist_onceToken != -1)
    dispatch_once(&sharedInstanceWithAppPredictionBlacklist_onceToken, &__block_literal_global_20_0);
  return (id)sharedInstanceWithAppPredictionBlacklist_instance;
}

void __72__ATXActionPredictionBlacklist_sharedInstanceWithAppPredictionBlacklist__block_invoke()
{
  ATXActionPredictionBlacklist *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [ATXActionPredictionBlacklist alloc];
  +[ATXAppPredictionBlacklist sharedInstance](ATXAppPredictionBlacklist, "sharedInstance");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[ATXActionPredictionBlacklist initWithAppPredictionBlacklist:](v0, "initWithAppPredictionBlacklist:", v3);
  v2 = (void *)sharedInstanceWithAppPredictionBlacklist_instance;
  sharedInstanceWithAppPredictionBlacklist_instance = v1;

}

- (void)dealloc
{
  id WeakRetained;
  objc_super v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appPredictionBlacklist);
  objc_msgSend(WeakRetained, "deregisterPrefsChangeHandlerWithToken:", self->_prefsChangeNotificationToken);

  v4.receiver = self;
  v4.super_class = (Class)ATXActionPredictionBlacklist;
  -[ATXActionPredictionBlacklist dealloc](&v4, sel_dealloc);
}

- (void)setBlacklistFromAssetData:(id)a3 predictionBlacklist:(id)a4 shortcutBlacklist:(id)a5 primaryShortcutBlacklist:(id)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _PASLock *lock;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[4];

  v66[2] = *MEMORY[0x1E0C80C00];
  v43 = a6;
  v42 = a5;
  v38 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = (void *)objc_opt_new();
  v36 = (void *)objc_opt_new();
  v13 = (void *)objc_opt_new();
  v14 = (void *)objc_opt_new();
  v39 = (void *)objc_opt_new();
  v40 = (void *)objc_opt_new();
  v41 = (void *)objc_opt_new();
  v66[0] = v10;
  v66[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v66, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v65[0] = v11;
  v65[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v65, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v64[0] = v12;
  v64[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionBlacklist addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:](self, "addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:", v9, v15, v16, v17);

  v63 = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v63, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v62, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v61, 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionBlacklist addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:](self, "addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:", v38, v18, v19, v20);

  v60 = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v60, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v59, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionBlacklist addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:](self, "addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:", v42, v21, v22, v23);

  v57 = v39;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v57, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = v40;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v55, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXActionPredictionBlacklist addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:](self, "addToBlacklists:blacklistAppList:blacklistActionList:blacklistAppAndActionList:", v43, v24, v25, v26);

  lock = self->_lock;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __121__ATXActionPredictionBlacklist_setBlacklistFromAssetData_predictionBlacklist_shortcutBlacklist_primaryShortcutBlacklist___block_invoke;
  v45[3] = &unk_1E82E56D8;
  v46 = v10;
  v47 = v11;
  v48 = v12;
  v49 = v36;
  v50 = v13;
  v51 = v14;
  v52 = v39;
  v53 = v40;
  v54 = v41;
  v44 = v41;
  v28 = v40;
  v29 = v39;
  v30 = v51;
  v31 = v13;
  v32 = v36;
  v33 = v48;
  v34 = v11;
  v35 = v46;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v45);

}

void __121__ATXActionPredictionBlacklist_setBlacklistFromAssetData_predictionBlacklist_shortcutBlacklist_primaryShortcutBlacklist___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  v5 = objc_msgSend(v3, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v11 = objc_msgSend(*(id *)(a1 + 56), "copy");
  v12 = (void *)v4[4];
  v4[4] = v11;

  v13 = objc_msgSend(*(id *)(a1 + 64), "copy");
  v14 = (void *)v4[5];
  v4[5] = v13;

  v15 = objc_msgSend(*(id *)(a1 + 72), "copy");
  v16 = (void *)v4[6];
  v4[6] = v15;

  v17 = objc_msgSend(*(id *)(a1 + 80), "copy");
  v18 = (void *)v4[7];
  v4[7] = v17;

  v19 = objc_msgSend(*(id *)(a1 + 88), "copy");
  v20 = (void *)v4[8];
  v4[8] = v19;

  v21 = objc_msgSend(*(id *)(a1 + 96), "copy");
  v22 = (id)v4[9];
  v4[9] = v21;

}

- (void)addToBlacklists:(id)a3 blacklistAppList:(id)a4 blacklistActionList:(id)a5 blacklistAppAndActionList:(id)a6
{
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t m;
  id v40;
  id v41;
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
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _BYTE v62[128];
  _BYTE v63[128];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v42 = a4;
  v41 = a5;
  v40 = a6;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v9;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v57 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        objc_msgSend(v14, "second");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("_"));

        if (v16)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v17 = v42;
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v18)
          {
            v19 = v18;
            v20 = *(_QWORD *)v53;
            do
            {
              for (j = 0; j != v19; ++j)
              {
                if (*(_QWORD *)v53 != v20)
                  objc_enumerationMutation(v17);
                v22 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * j);
                objc_msgSend(v14, "first");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v22, "addObject:", v23);

              }
              v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            }
            while (v19);
          }
        }
        else
        {
          objc_msgSend(v14, "first");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("_"));

          if (v25)
          {
            v50 = 0u;
            v51 = 0u;
            v48 = 0u;
            v49 = 0u;
            v17 = v41;
            v26 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v49;
              do
              {
                for (k = 0; k != v27; ++k)
                {
                  if (*(_QWORD *)v49 != v28)
                    objc_enumerationMutation(v17);
                  v30 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * k);
                  objc_msgSend(v14, "second");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "addObject:", v31);

                }
                v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v48, v61, 16);
              }
              while (v27);
            }
          }
          else
          {
            v32 = objc_alloc(MEMORY[0x1E0D81638]);
            objc_msgSend(v14, "first");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "second");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = (id)objc_msgSend(v32, "initWithFirst:second:", v33, v34);

            v46 = 0u;
            v47 = 0u;
            v44 = 0u;
            v45 = 0u;
            v35 = v40;
            v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
            if (v36)
            {
              v37 = v36;
              v38 = *(_QWORD *)v45;
              do
              {
                for (m = 0; m != v37; ++m)
                {
                  if (*(_QWORD *)v45 != v38)
                    objc_enumerationMutation(v35);
                  objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * m), "addObject:", v17);
                }
                v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v44, v60, 16);
              }
              while (v37);
            }

          }
        }

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v63, 16);
    }
    while (v11);
  }

}

- (BOOL)isBundleIdBlacklisted:(id)a3
{
  id v4;
  void *v5;
  _PASLock *lock;
  BOOL v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    lock = self->_lock;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __54__ATXActionPredictionBlacklist_isBundleIdBlacklisted___block_invoke;
    v9[3] = &unk_1E82E5728;
    v11 = &v12;
    v10 = v4;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

void __54__ATXActionPredictionBlacklist_isBundleIdBlacklisted___block_invoke(uint64_t a1, void *a2)
{
  char v3;
  id *v4;

  v4 = a2;
  if ((objc_msgSend(v4[10], "containsObject:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v3 = 1;
  else
    v3 = objc_msgSend(v4[1], "containsObject:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;

}

- (BOOL)shouldPredictBundleId:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  _PASLock *lock;
  id v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    -[ATXActionPredictionBlacklist shouldPredictBundleIdHelper:action:](self, "shouldPredictBundleIdHelper:action:", v6, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    lock = self->_lock;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __61__ATXActionPredictionBlacklist_shouldPredictBundleId_action___block_invoke;
    v14[3] = &unk_1E82E5728;
    v16 = &v17;
    v12 = v10;
    v15 = v12;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
    v9 = *((_BYTE *)v18 + 24) == 0;

    _Block_object_dispose(&v17, 8);
  }

  return v9;
}

void __61__ATXActionPredictionBlacklist_shouldPredictBundleId_action___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*((id *)v9 + 3), "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = (void *)*((_QWORD *)v9 + 1);
    objc_msgSend(*(id *)(a1 + 32), "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v5 = (void *)*((_QWORD *)v9 + 10);
      objc_msgSend(*(id *)(a1 + 32), "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        v7 = (void *)*((_QWORD *)v9 + 2);
        objc_msgSend(*(id *)(a1 + 32), "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "containsObject:", v8);

      }
    }

  }
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4
{
  return -[ATXActionPredictionBlacklist shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:](self, "shouldPredictBundleIdForShortcuts:action:forPrimaryShortcuts:", a3, a4, 0);
}

- (BOOL)shouldPredictBundleIdForShortcuts:(id)a3 action:(id)a4 forPrimaryShortcuts:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v12;
  _PASLock *lock;
  id v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  BOOL v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    -[ATXActionPredictionBlacklist shouldPredictBundleIdHelper:action:](self, "shouldPredictBundleIdHelper:action:", v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v21 = 0;
    v22 = &v21;
    v23 = 0x2020000000;
    v24 = 0;
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __93__ATXActionPredictionBlacklist_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke;
    v16[3] = &unk_1E82E5750;
    v18 = &v25;
    v14 = v12;
    v20 = a5;
    v17 = v14;
    v19 = &v21;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);
    if (*((_BYTE *)v26 + 24))
      v11 = 0;
    else
      v11 = *((_BYTE *)v22 + 24) == 0;

    _Block_object_dispose(&v21, 8);
    _Block_object_dispose(&v25, 8);

  }
  return v11;
}

void __93__ATXActionPredictionBlacklist_shouldPredictBundleIdForShortcuts_action_forPrimaryShortcuts___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
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
  id v16;

  v16 = a2;
  if (objc_msgSend(*((id *)v16 + 6), "containsObject:", *(_QWORD *)(a1 + 32)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    v3 = (void *)*((_QWORD *)v16 + 4);
    objc_msgSend(*(id *)(a1 + 32), "first");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "containsObject:", v4) & 1) != 0)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
    else
    {
      v5 = (void *)*((_QWORD *)v16 + 10);
      objc_msgSend(*(id *)(a1 + 32), "first");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v5, "containsObject:", v6) & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      }
      else
      {
        v7 = (void *)*((_QWORD *)v16 + 5);
        objc_msgSend(*(id *)(a1 + 32), "second");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v7, "containsObject:", v8);

      }
    }

  }
  v9 = v16;
  if (*(_BYTE *)(a1 + 56))
  {
    if (objc_msgSend(*((id *)v16 + 9), "containsObject:", *(_QWORD *)(a1 + 32)))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      v10 = (void *)*((_QWORD *)v16 + 7);
      objc_msgSend(*(id *)(a1 + 32), "first");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v10, "containsObject:", v11) & 1) != 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      }
      else
      {
        v12 = (void *)*((_QWORD *)v16 + 10);
        objc_msgSend(*(id *)(a1 + 32), "first");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v12, "containsObject:", v13) & 1) != 0)
        {
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
        }
        else
        {
          v14 = (void *)*((_QWORD *)v16 + 8);
          objc_msgSend(*(id *)(a1 + 32), "second");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v14, "containsObject:", v15);

        }
      }

    }
    v9 = v16;
  }

}

- (id)shouldPredictBundleIdHelper:(id)a3 action:(id)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *v10;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v5, "lowercaseString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "containsString:", CFSTR("nsua"));

  if (v8)
  {
    objc_msgSend(v5, "substringFromIndex:", 5);
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v9;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D81638]), "initWithFirst:second:", v6, v5);

  return v10;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appPredictionBlacklist);
  objc_storeStrong(&self->_blacklistNotificationToken, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end
