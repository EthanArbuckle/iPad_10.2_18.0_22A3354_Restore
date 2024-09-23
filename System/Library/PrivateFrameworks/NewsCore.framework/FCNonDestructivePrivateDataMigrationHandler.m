@implementation FCNonDestructivePrivateDataMigrationHandler

void __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t i;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  void *v15;
  dispatch_block_t block;
  id obj;
  uint64_t v18;
  id v19;
  uint64_t v20;
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  void *v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  block = a3;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = *(id *)(a1 + 32);
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
  if (v20)
  {
    v18 = *(_QWORD *)v27;
    v5 = MEMORY[0x1E0C81028];
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v27 != v18)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        v25 = 0u;
        v8 = v19;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v23;
          do
          {
            for (j = 0; j != v10; ++j)
            {
              if (*(_QWORD *)v23 != v11)
                objc_enumerationMutation(v8);
              v13 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "integerValue");
              if (v13 == 4)
              {
                objc_msgSend(v7, "mergeLocalStoreWithCloudWithPrivateDataDirectory:", *(_QWORD *)(a1 + 40));
              }
              else if (v13 == 3)
              {
                objc_msgSend(v7, "createLocalStore");
              }
              else if (v13 == 2 && os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
              {
                v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "NO");
                *(_DWORD *)buf = 136315906;
                v31 = "-[FCNonDestructivePrivateDataMigrationHandler handleMigrationWithPrivateDataDirectory:]_block_invoke";
                v32 = 2080;
                v33 = "FCNonDestructivePrivateDataMigrationHandler.m";
                v34 = 1024;
                v35 = 68;
                v36 = 2114;
                v37 = v14;
                _os_log_error_impl(&dword_1A1B90000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v38, 16);
          }
          while (v10);
        }

        v15 = *(void **)(a1 + 48);
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_10;
        v21[3] = &unk_1E463BA48;
        v21[4] = v7;
        FCDispatchGroupWrap(v15, v21);
      }
      v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v39, 16);
    }
    while (v20);
  }

  dispatch_group_notify(*(dispatch_group_t *)(a1 + 48), MEMORY[0x1E0C80D38], block);
}

- (FCNonDestructivePrivateDataMigrationHandler)initWithPrivateDataActionProvider:(id)a3 privateDataControllers:(id)a4 privateDataSyncingEnabled:(BOOL)a5
{
  id v9;
  id v10;
  FCNonDestructivePrivateDataMigrationHandler *v11;
  FCNonDestructivePrivateDataMigrationHandler *v12;
  uint64_t v13;
  NSArray *privateDataControllers;
  void *v16;
  void *v17;
  objc_super v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataActionProvider");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCNonDestructivePrivateDataMigrationHandler initWithPrivateDataActionProvider:privateDataControllers:private"
          "DataSyncingEnabled:]";
    v21 = 2080;
    v22 = "FCNonDestructivePrivateDataMigrationHandler.m";
    v23 = 1024;
    v24 = 32;
    v25 = 2114;
    v26 = v16;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v10)
      goto LABEL_6;
  }
  else if (v10)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "privateDataControllers");
    *(_DWORD *)buf = 136315906;
    v20 = "-[FCNonDestructivePrivateDataMigrationHandler initWithPrivateDataActionProvider:privateDataControllers:private"
          "DataSyncingEnabled:]";
    v21 = 2080;
    v22 = "FCNonDestructivePrivateDataMigrationHandler.m";
    v23 = 1024;
    v24 = 33;
    v25 = 2114;
    v26 = v17;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
LABEL_6:
  v18.receiver = self;
  v18.super_class = (Class)FCNonDestructivePrivateDataMigrationHandler;
  v11 = -[FCNonDestructivePrivateDataMigrationHandler init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_privateDataActionProvider, a3);
    v13 = objc_msgSend(v10, "copy");
    privateDataControllers = v12->_privateDataControllers;
    v12->_privateDataControllers = (NSArray *)v13;

    v12->_privateDataSyncingEnabled = a5;
  }

  return v12;
}

- (void)handleMigrationWithPrivateDataDirectory:(id)a3
{
  id v4;
  void *v5;
  dispatch_group_t v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  char **v12;
  void *v13;
  int v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  NSObject *v19;

  v4 = a3;
  -[FCNonDestructivePrivateDataMigrationHandler privateDataControllers](self, "privateDataControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_group_create();
  -[FCNonDestructivePrivateDataMigrationHandler privateDataActionProvider](self, "privateDataActionProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke;
  v16[3] = &unk_1E4647168;
  v8 = v5;
  v17 = v8;
  v9 = v4;
  v18 = v9;
  v10 = v6;
  v19 = v10;
  objc_msgSend(v7, "consumeNonDestructiveActionsSyncWithBlock:", v16);

  v11 = -[FCNonDestructivePrivateDataMigrationHandler isPrivateDataSyncingEnabled](self, "isPrivateDataSyncingEnabled");
  v12 = &selRef_enableSyncing;
  if (!v11)
    v12 = &selRef_disableSyncing;
  objc_msgSend(v8, "makeObjectsPerformSelector:", *v12);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "BOOLForKey:", CFSTR("personalization_disable_syncing"));

  if (v14)
  {
    objc_msgSend(v8, "fc_firstObjectPassingTest:", &__block_literal_global_127);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "disableSyncing");

  }
}

- (NSArray)privateDataControllers
{
  return self->_privateDataControllers;
}

- (FCNonDestructivePrivateDataActionProvider)privateDataActionProvider
{
  return self->_privateDataActionProvider;
}

- (BOOL)isPrivateDataSyncingEnabled
{
  return self->_privateDataSyncingEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateDataControllers, 0);
  objc_storeStrong((id *)&self->_privateDataActionProvider, 0);
}

- (FCNonDestructivePrivateDataMigrationHandler)init
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v8 = "-[FCNonDestructivePrivateDataMigrationHandler init]";
    v9 = 2080;
    v10 = "FCNonDestructivePrivateDataMigrationHandler.m";
    v11 = 1024;
    v12 = 25;
    v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99768];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FCNonDestructivePrivateDataMigrationHandler init]");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "exceptionWithName:reason:userInfo:", v4, v5, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v6);
}

uint64_t __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "saveWithCompletion:", a2);
}

BOOL __87__FCNonDestructivePrivateDataMigrationHandler_handleMigrationWithPrivateDataDirectory___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  objc_opt_class();
  if (v2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v3 = v2;
    else
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4 != 0;
}

- (void)setPrivateDataActionProvider:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataActionProvider, a3);
}

- (void)setPrivateDataControllers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setPrivateDataSyncingEnabled:(BOOL)a3
{
  self->_privateDataSyncingEnabled = a3;
}

@end
