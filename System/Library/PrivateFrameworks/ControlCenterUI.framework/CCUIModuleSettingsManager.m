@implementation CCUIModuleSettingsManager

- (CCUIModuleSettingsManager)init
{
  CCUIModuleSettingsManager *v2;
  uint64_t v3;
  CCSModuleSettingsProvider *settingsProvider;
  uint64_t v5;
  NSHashTable *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIModuleSettingsManager;
  v2 = -[CCUIModuleSettingsManager init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0D14560], "sharedProvider");
    v3 = objc_claimAutoreleasedReturnValue();
    settingsProvider = v2->_settingsProvider;
    v2->_settingsProvider = (CCSModuleSettingsProvider *)v3;

    objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 517);
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v5;

    -[CCUIModuleSettingsManager _loadDefaultSettings](v2, "_loadDefaultSettings");
    -[CCUIModuleSettingsManager _loadMigrationSettings](v2, "_loadMigrationSettings");
    -[CCSModuleSettingsProvider addObserver:](v2->_settingsProvider, "addObserver:", v2);
  }
  return v2;
}

- (id)moduleSettingsForModuleIdentifier:(id)a3
{
  id v4;
  CCUIModuleSettings *v5;
  CCUIModuleSettings *v6;
  void *v7;

  v4 = a3;
  -[NSDictionary objectForKey:](self->_migrationSettingsByModuleIdentifier, "objectForKey:", v4);
  v5 = (CCUIModuleSettings *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[NSDictionary objectForKey:](self->_defaultSettingsByModuleIdentifier, "objectForKey:", v4);
    v5 = (CCUIModuleSettings *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      v6 = [CCUIModuleSettings alloc];
      SBHIconGridSizeClassForCCUIGridSizeClass();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = -[CCUIModuleSettings initWithGridSizeClass:containerBundleIdentifier:](v6, "initWithGridSizeClass:containerBundleIdentifier:", v7, CFSTR("com.apple.springboard"));

    }
  }

  return v5;
}

- (id)orderedEnabledModuleIdentifiersFromSettingsApp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99D20], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCSModuleSettingsProvider orderedFixedModuleIdentifiers](self->_settingsProvider, "orderedFixedModuleIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCSModuleSettingsProvider orderedUserEnabledFixedModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledFixedModuleIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "arrayByAddingObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CCSModuleSettingsProvider orderedUserEnabledModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledModuleIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "arrayByAddingObjectsFromArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_runBlockOnListeners:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v4 = a3;
  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CCUIModuleSettingsManager__runBlockOnListeners___block_invoke;
  v8[3] = &unk_1E8CFD0D8;
  v9 = v5;
  v10 = v4;
  v6 = v4;
  v7 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v8);

}

uint64_t __50__CCUIModuleSettingsManager__runBlockOnListeners___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "bs_each:", *(_QWORD *)(a1 + 40));
}

- (void)orderedEnabledModuleIdentifiersChangedForSettingsProvider:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __87__CCUIModuleSettingsManager_orderedEnabledModuleIdentifiersChangedForSettingsProvider___block_invoke;
  v3[3] = &unk_1E8CFD100;
  v3[4] = self;
  -[CCUIModuleSettingsManager _runBlockOnListeners:](self, "_runBlockOnListeners:", v3);
}

uint64_t __87__CCUIModuleSettingsManager_orderedEnabledModuleIdentifiersChangedForSettingsProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "orderedEnabledModuleIdentifiersChangedForSettingsManager:", *(_QWORD *)(a1 + 32));
}

- (void)_loadDefaultSettings
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CCUIModuleSettings *v19;
  NSDictionary *v20;
  NSDictionary *defaultSettingsByModuleIdentifier;
  void *v22;
  id v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("DefaultModuleSettings"), CFSTR("plist"));
  v3 = objc_claimAutoreleasedReturnValue();

  v22 = (void *)v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v6)
  {
    v7 = v6;
    v25 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v25)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        v10 = objc_opt_class();
        v11 = v9;
        if (v10)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v12 = v11;
          else
            v12 = 0;
        }
        else
        {
          v12 = 0;
        }
        v13 = v12;

        if (v13)
        {
          objc_msgSend(v5, "bs_safeObjectForKey:ofType:", v13, objc_opt_class());
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DAA480], "controlCenterDomain");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "bs_safeObjectForKey:ofType:", CFSTR("gridSize"), objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "gridSizeClassForDescription:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v14, "bs_safeObjectForKey:ofType:", CFSTR("containerBundleIdentifier"), objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = -[CCUIModuleSettings initWithGridSizeClass:containerBundleIdentifier:]([CCUIModuleSettings alloc], "initWithGridSizeClass:containerBundleIdentifier:", v17, v18);
          objc_msgSend(v24, "setObject:forKey:", v19, v13);

        }
        ++v8;
      }
      while (v7 != v8);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v7);
  }

  v20 = (NSDictionary *)objc_msgSend(v24, "copy");
  defaultSettingsByModuleIdentifier = self->_defaultSettingsByModuleIdentifier;
  self->_defaultSettingsByModuleIdentifier = v20;

}

- (BOOL)_shouldSkipControlMigrationFor:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  char v9;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if (!v5)
    {
      v8 = CFSTR("iPhone");
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if (v7 == 1)
    {
      v8 = CFSTR("iPad");
LABEL_7:
      v9 = objc_msgSend(v3, "containsObject:", v8);
      goto LABEL_8;
    }
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)_loadMigrationSettings
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  unint64_t v21;
  CCUIModuleSettingsManager *v22;
  CCUIModuleSettings *v23;
  NSDictionary *v24;
  NSDictionary *migrationSettingsByModuleIdentifier;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("ModuleParityControlMigrationList"), CFSTR("plist"));
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = 0x1E0C99000uLL;
  v26 = (void *)v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v8)
  {
    v9 = v8;
    v28 = *(_QWORD *)v35;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v35 != v28)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * v10);
        v12 = objc_opt_class();
        v13 = v11;
        if (v12)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v14 = v13;
          else
            v14 = 0;
        }
        else
        {
          v14 = 0;
        }
        v15 = v14;

        if (v15)
        {
          SBHIconGridSizeClassForCCUIGridSizeClass();
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "bs_safeObjectForKey:ofType:", v15, objc_opt_class());
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("extensionBundleIdentifier"), objc_opt_class());
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("containerBundleIdentifier"), objc_opt_class());
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = (void *)objc_msgSend(v31, "copy");
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("kind"), objc_opt_class());
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("controlType"), objc_opt_class());
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "bs_safeObjectForKey:ofType:", CFSTR("unavailablePlatform"), objc_opt_class());
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (!-[CCUIModuleSettingsManager _shouldSkipControlMigrationFor:](self, "_shouldSkipControlMigrationFor:", v18))
          {
            v19 = v9;
            v20 = v7;
            v21 = v5;
            v22 = self;
            v23 = -[CCUIModuleSettings initWithGridSizeClass:moduleContainerBundleIdentifier:controlExtensionIdentifier:controlContainerBundleIdentifier:controlKind:controlType:]([CCUIModuleSettings alloc], "initWithGridSizeClass:moduleContainerBundleIdentifier:controlExtensionIdentifier:controlContainerBundleIdentifier:controlKind:controlType:", v33, v30, v32, v31, v29, v17);
            objc_msgSend(v27, "bs_setSafeObject:forKey:", v23, v15);

            self = v22;
            v5 = v21;
            v7 = v20;
            v9 = v19;
          }

        }
        ++v10;
      }
      while (v9 != v10);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v9);
  }

  v24 = (NSDictionary *)objc_msgSend(v27, "copy");
  migrationSettingsByModuleIdentifier = self->_migrationSettingsByModuleIdentifier;
  self->_migrationSettingsByModuleIdentifier = v24;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_migrationSettingsByModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_defaultSettingsByModuleIdentifier, 0);
  objc_storeStrong((id *)&self->_settingsProvider, 0);
}

@end
