@implementation ClientConnection

- (void)_initAccountAccessHandler
{
  void *v3;
  CADGroupedAccountAccessHandler *v4;
  void *v5;
  int v6;
  CADGroupedAccountAccessHandler *v7;
  _BOOL4 v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CADExcludeDelegatesAccountAccessHandler *v16;
  int v17;
  CADExcludeIntegrationsAccountAccessHandler *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  CADAllowSpecifiedAccountsAccessHandler *v28;
  void *v29;
  CADAllowSpecifiedAccountsAccessHandler *v30;
  void *v31;
  CADFilterSuggestedCalendarsAccessHandler *v32;
  CADAccountAccessHandler *v33;
  CADAccountAccessHandler *strictAccountAccessHandler;
  CADAccountAccessHandler *accountAccessHandler;
  CADAccountAccessHandler *v36;
  int v37;
  int v38;
  CADGroupedAccountAccessHandler *v39;
  CADGroupedAccountAccessHandler *v40;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  +[CADRealCalendarDatabaseDataProvider realDataProvider](CADRealCalendarDatabaseDataProvider, "realDataProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[CADGroupedAccountAccessHandler initWithDatabaseDataProvider:]([CADGroupedAccountAccessHandler alloc], "initWithDatabaseDataProvider:", v3);
  -[ClientConnection _permissionValidator](self, "_permissionValidator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "shouldTrustClientEnforcedManagedConfigurationAccess");
  if (v6)
    v7 = -[CADGroupedAccountAccessHandler initWithDatabaseDataProvider:]([CADGroupedAccountAccessHandler alloc], "initWithDatabaseDataProvider:", v3);
  else
    v7 = 0;
  v8 = -[CADDatabaseInitializationOptions allowDelegateSources](self->_databaseInitializationOptions, "allowDelegateSources");
  if (!v8)
  {
    v9 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v10 = v9;
      -[ClientConnection identity](self, "identity");
      v39 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "clientName");
      v37 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0CB37E8];
      -[ClientConnection identity](self, "identity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "numberWithInt:", objc_msgSend(v14, "pid"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v42 = v12;
      v43 = 2112;
      v44 = v15;
      _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_INFO, "XPC Client [%@] (PID: [%@]). allowDelegateSources is NO. Adding Excluded Delegate Access Handler", buf, 0x16u);

      v6 = v37;
      v7 = v39;
    }
    v16 = -[CADAccountAccessHandler initWithDatabaseDataProvider:]([CADExcludeDelegatesAccountAccessHandler alloc], "initWithDatabaseDataProvider:", v3);
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v4, "addAccountAccessHandler:", v16);
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v7, "addAccountAccessHandler:", v16);

  }
  if (-[CADDatabaseInitializationOptions allowIntegrations](self->_databaseInitializationOptions, "allowIntegrations"))
  {
    v17 = !v8;
  }
  else
  {
    v18 = -[CADAccountAccessHandler initWithDatabaseDataProvider:]([CADExcludeIntegrationsAccountAccessHandler alloc], "initWithDatabaseDataProvider:", v3);
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v4, "addAccountAccessHandler:", v18);
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v7, "addAccountAccessHandler:", v18);

    v17 = 1;
  }
  -[CADDatabaseInitializationOptions allowedSourceIdentifiers](self->_databaseInitializationOptions, "allowedSourceIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v21 = v20;
      -[ClientConnection identity](self, "identity");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "clientName");
      v40 = v7;
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (void *)MEMORY[0x1E0CB37E8];
      -[ClientConnection identity](self, "identity");
      v38 = v6;
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "numberWithInt:", objc_msgSend(v25, "pid"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADDatabaseInitializationOptions allowedSourceIdentifiers](self->_databaseInitializationOptions, "allowedSourceIdentifiers");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v42 = v23;
      v43 = 2114;
      v44 = v26;
      v45 = 2114;
      v46 = v27;
      _os_log_impl(&dword_1B6A18000, v21, OS_LOG_TYPE_INFO, "XPC Client [%{public}@] (PID: [%{public}@]). allowedSourceIdentifiers is not nil. Adding Allow Specified Accounts Access Handler for sources %{public}@", buf, 0x20u);

      v6 = v38;
      v7 = v40;

    }
    v28 = [CADAllowSpecifiedAccountsAccessHandler alloc];
    -[CADDatabaseInitializationOptions allowedSourceIdentifiers](self->_databaseInitializationOptions, "allowedSourceIdentifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = -[CADAllowSpecifiedAccountsAccessHandler initWithAllowedSourceIdentifiers:databaseDataProvider:](v28, "initWithAllowedSourceIdentifiers:databaseDataProvider:", v29, v3);

    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v4, "addAccountAccessHandler:", v30);
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v7, "addAccountAccessHandler:", v30);

    v17 = 1;
  }
  -[ClientConnection _createManagedConfigAccountAccessHandlerWithValidator:](self, "_createManagedConfigAccountAccessHandlerWithValidator:", v5);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
    -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v4, "addAccountAccessHandler:", v31);
  v32 = -[CADFilterSuggestedCalendarsAccessHandler initWithDatabaseDataProvider:permissionValidator:]([CADFilterSuggestedCalendarsAccessHandler alloc], "initWithDatabaseDataProvider:permissionValidator:", v3, v5);
  -[CADGroupedAccountAccessHandler addAccountAccessHandler:](v4, "addAccountAccessHandler:", v32);
  if (v6)
  {
    if (v17)
      v33 = v7;
    else
      v33 = -[CADAccountAccessHandler initWithDatabaseDataProvider:]([CADAccountAccessHandler alloc], "initWithDatabaseDataProvider:", v3);
    accountAccessHandler = self->_accountAccessHandler;
    self->_accountAccessHandler = v33;

    v36 = v4;
    strictAccountAccessHandler = self->_strictAccountAccessHandler;
    self->_strictAccountAccessHandler = v36;
  }
  else
  {
    objc_storeStrong((id *)&self->_accountAccessHandler, v4);
    strictAccountAccessHandler = self->_strictAccountAccessHandler;
    self->_strictAccountAccessHandler = 0;
  }

}

void __39__ClientConnection_permissionValidator__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_permissionValidator");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_permissionValidator
{
  CADPermissionValidator *permissionValidator;
  CADDefaultPermissionValidator *v4;
  void *v5;
  CADDefaultPermissionValidator *v6;
  void *v7;
  CADCombinedPermissionValidator *v8;
  CADPermissionValidator *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  permissionValidator = self->_permissionValidator;
  if (!permissionValidator)
  {
    v4 = [CADDefaultPermissionValidator alloc];
    -[ClientConnection identity](self, "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[CADDefaultPermissionValidator initWithClientIdentity:tccPermissionChecker:](v4, "initWithClientIdentity:tccPermissionChecker:", v5, self->_tccPermissionChecker);

    -[CADDatabaseInitializationOptions mockPermissions](self->_databaseInitializationOptions, "mockPermissions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      v8 = -[CADCombinedPermissionValidator initWithPermissionValidator:andValidator:]([CADCombinedPermissionValidator alloc], "initWithPermissionValidator:andValidator:", v6, v7);
    else
      v8 = v6;
    v9 = self->_permissionValidator;
    self->_permissionValidator = (CADPermissionValidator *)v8;

    permissionValidator = self->_permissionValidator;
  }
  return permissionValidator;
}

- (ClientIdentity)identity
{
  return self->_identity;
}

- (int)eventAccessLevel
{
  void *v2;
  int v3;

  -[ClientConnection permissionValidator](self, "permissionValidator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "eventAccessLevel");

  return v3;
}

- (CADPermissionValidator)permissionValidator
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39__ClientConnection_permissionValidator__block_invoke;
  v5[3] = &unk_1E6A379D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADPermissionValidator *)v3;
}

- (BOOL)isCalendarRestricted:(void *)a3 forAction:(unint64_t)a4
{
  uint64_t DatabaseForRecord;
  void *v7;
  void *v8;
  NSObject *v10;
  uint8_t v11[16];

  if (a3)
  {
    DatabaseForRecord = CalGetDatabaseForRecord();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", CalCalendarGetUID());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ClientConnection restrictedCalendarRowIDsForAction:inDatabase:](self, "restrictedCalendarRowIDsForAction:inDatabase:", a4, DatabaseForRecord);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(self) = objc_msgSend(v8, "containsObject:", v7);

    return (char)self;
  }
  else
  {
    v10 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1B6A18000, v10, OS_LOG_TYPE_ERROR, "isCalendarRestricted - NULL calendar passed in. Returning NO.", v11, 2u);
    }
    return 0;
  }
}

- (id)restrictedCalendarRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  void *v6;
  void *v7;

  -[ClientConnection accountAccessHandler](self, "accountAccessHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restrictedCalendarRowIDsForAction:inDatabase:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CADAccountAccessHandler)accountAccessHandler
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__ClientConnection_accountAccessHandler__block_invoke;
  v5[3] = &unk_1E6A37A00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CADAccountAccessHandler *)v3;
}

- (BOOL)withDatabaseForObjects:(id)a3 options:(unint64_t)a4 perform:(id)a5
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *dbQueue;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  BOOL v27;
  NSObject *v28;
  ClientConnection *v30;
  uint64_t v31;
  int v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  int v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _QWORD block[7];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  _BYTE v61[128];
  _BYTE v62[128];
  uint64_t v63;

  v30 = self;
  v32 = a4;
  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v33 = a5;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v56;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v56 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "databaseID", v30);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v14);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v14);
        }
        objc_msgSend(v15, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v55, v62, 16);
    }
    while (v9);
  }

  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__4;
  v53 = __Block_byref_object_dispose__4;
  v54 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__4;
  v47 = __Block_byref_object_dispose__4;
  v48 = 0;
  dbQueue = v30->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke;
  block[3] = &unk_1E6A37A50;
  block[4] = v30;
  block[5] = &v49;
  block[6] = &v43;
  dispatch_sync(dbQueue, block);
  v31 = -[ClientConnection _currentPriority](v30, "_currentPriority");
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v17 = v7;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v61, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v17);
        v21 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        v22 = objc_msgSend(v21, "intValue", v31);
        objc_msgSend(v17, "objectForKeyedSubscript:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)v50[5];
        v25 = v44[5];
        v34[0] = MEMORY[0x1E0C809B0];
        v34[1] = 3221225472;
        v34[2] = __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke_2;
        v34[3] = &unk_1E6A37A78;
        v36 = v33;
        v37 = v22;
        v26 = v23;
        v35 = v26;
        if (((v32 | objc_msgSend(v24, "performWithConfiguration:priority:databaseID:block:", v25, v31, v22, v34)) & 1) == 0)
        {
          v28 = CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v60 = v21;
            _os_log_impl(&dword_1B6A18000, v28, OS_LOG_TYPE_ERROR, "No database with ID %{public}@", buf, 0xCu);
          }

          v27 = 0;
          goto LABEL_22;
        }

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v61, 16);
      if (v18)
        continue;
      break;
    }
  }
  v27 = 1;
LABEL_22:

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v49, 8);

  return v27;
}

- (int)managedConfigurationAccountAccessForStore:(void *)a3
{
  _BOOL4 v5;
  int result;
  int v7;

  v5 = -[ClientConnection isStoreRestricted:forAction:strict:](self, "isStoreRestricted:forAction:strict:", a3, 0, 1);
  result = -[ClientConnection isStoreRestricted:forAction:strict:](self, "isStoreRestricted:forAction:strict:", a3, 1, 1);
  if (result)
    v7 = 3;
  else
    v7 = 2;
  if (v5)
    return v7;
  return result;
}

- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4 strict:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t DatabaseForRecord;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint8_t v16[16];

  if (a3)
  {
    v5 = a5;
    DatabaseForRecord = CalGetDatabaseForRecord();
    -[ClientConnection accountAccessHandler](self, "accountAccessHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isActionAllowed:forStore:inDatabase:", a4, a3, DatabaseForRecord) ^ 1;

    if ((v11 & 1) == 0 && v5)
    {
      -[ClientConnection strictAccountAccessHandler](self, "strictAccountAccessHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v12)
        v11 = objc_msgSend(v12, "isActionAllowed:forStore:inDatabase:", a4, a3, DatabaseForRecord) ^ 1;
      else
        LOBYTE(v11) = 0;

    }
  }
  else
  {
    v14 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1B6A18000, v14, OS_LOG_TYPE_ERROR, "isStoreRestricted - NULL store passed in. Returning NO.", v16, 2u);
    }
    LOBYTE(v11) = 0;
  }
  return v11;
}

- (id)strictAccountAccessHandler
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__ClientConnection_strictAccountAccessHandler__block_invoke;
  v5[3] = &unk_1E6A37A00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __44__ClientConnection_initializationOptionsSet__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 72);
  return result;
}

void __40__ClientConnection_accountAccessHandler__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    objc_msgSend(v2, "_initAccountAccessHandler");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (BOOL)initializationOptionsSet
{
  NSObject *dbQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__ClientConnection_initializationOptionsSet__block_invoke;
  v5[3] = &unk_1E6A379D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isCalendarItemRestricted:(void *)a3 forAction:(unint64_t)a4
{
  uint64_t v6;
  const void *v7;
  BOOL v8;

  if (!a3)
    return 0;
  v6 = CalCalendarItemCopyCalendar();
  if (!v6)
    return 0;
  v7 = (const void *)v6;
  v8 = -[ClientConnection isCalendarRestricted:forAction:](self, "isCalendarRestricted:forAction:", v6, a4);
  CFRelease(v7);
  return v8;
}

- (BOOL)isStoreRestricted:(void *)a3 forAction:(unint64_t)a4
{
  return -[ClientConnection isStoreRestricted:forAction:strict:](self, "isStoreRestricted:forAction:strict:", a3, a4, 0);
}

- (void)dealloc
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = self->_operations;
  objc_sync_enter(v3);
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_operations;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "cancel");
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeAllObjects](self->_operations, "removeAllObjects");
  objc_sync_exit(v3);

  v8.receiver = self;
  v8.super_class = (Class)ClientConnection;
  -[ClientConnection dealloc](&v8, sel_dealloc);
}

void __56__ClientConnection_trySetDatabaseInitializationOptions___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 72) = 1;
  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 136);
  if (v3 != v2 && (objc_msgSend(v3, "isEqualToOptions:") & 1) == 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 136), *(id *)(a1 + 40));
    v4 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 136);
      v12 = 138543362;
      v13 = v5;
      _os_log_impl(&dword_1B6A18000, v4, OS_LOG_TYPE_DEFAULT, "Changed database initialization options to [%{public}@]", (uint8_t *)&v12, 0xCu);
    }
    v6 = *(_QWORD **)(a1 + 32);
    if (v6[11])
    {
      objc_msgSend(v6, "_closeDatabases");
      v6 = *(_QWORD **)(a1 + 32);
    }
    v7 = (void *)v6[3];
    v6[3] = 0;

    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    *(_QWORD *)(v10 + 8) = 0;

  }
}

- (BOOL)trySetDatabaseInitializationOptions:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *dbQueue;
  _QWORD v17[5];
  id v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v22 = v4;
    _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_DEFAULT, "ClientConnection trySetDatabaseInitializationOptions. clientProvidedOptions:%{public}@", buf, 0xCu);
  }
  objc_msgSend(v4, "purifyOptions");
  objc_msgSend(v4, "validOptionsForConnection:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "isEqualToOptions:", v6);
  if ((v7 & 1) != 0)
  {
    if (_os_feature_enabled_impl())
    {
      objc_msgSend(v6, "privacyClientIdentity");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[ClientConnection identity](self, "identity");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "auditToken");
        }
        else
        {
          v19 = 0u;
          v20 = 0u;
        }
        PAAuthenticatedClientIdentity();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setPrivacyClientIdentity:", v14);

      }
    }
    dbQueue = self->_dbQueue;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __56__ClientConnection_trySetDatabaseInitializationOptions___block_invoke;
    v17[3] = &unk_1E6A37420;
    v17[4] = self;
    v18 = v6;
    dispatch_sync(dbQueue, v17);

  }
  else
  {
    v11 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6A18000, v11, OS_LOG_TYPE_ERROR, "Error validating database initialization options for access.", buf, 2u);
    }
    v12 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v4;
      _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_ERROR, "clientProvidedOptions:%{public}@", buf, 0xCu);
    }
    v13 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v6;
      _os_log_impl(&dword_1B6A18000, v13, OS_LOG_TYPE_ERROR, "validatedOptions: %{public}@", buf, 0xCu);
    }
  }

  return v7;
}

- (NSString)changeTrackingID
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ClientIdentity applicationIdentifier](self->_identity, "applicationIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  -[ClientConnection databaseInitializationOptions](self, "databaseInitializationOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeTrackingClientId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    -[ClientIdentity applicationIdentifier](self->_identity, "applicationIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "clientIdWithBundleId:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "clientId");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

void __45__ClientConnection_databaseRestoreGeneration__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_databaseProvider");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "databaseRestoreGeneration");

}

void __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_databaseProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

void __43__ClientConnection_withDatabaseID_perform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_databaseProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

- (CADDatabaseInitializationOptions)databaseInitializationOptions
{
  return self->_databaseInitializationOptions;
}

- (int)databaseRestoreGeneration
{
  NSObject *dbQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = -1;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__ClientConnection_databaseRestoreGeneration__block_invoke;
  v5[3] = &unk_1E6A379D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (CADOperationProxy)cadOperationProxy
{
  return (CADOperationProxy *)objc_getProperty(self, a2, 112, 1);
}

- (void)logAccessToObjects:(id)a3
{
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = _os_feature_enabled_impl();
  v5 = v11;
  if (v11)
  {
    if (v4)
    {
      v6 = objc_msgSend(v11, "count");
      v5 = v11;
      if (v6)
      {
        -[ClientConnection _objectIDsToBeResolved:](self, "_objectIDsToBeResolved:", v11);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[ClientConnection _resolveObjectIDsForLogging:](self, "_resolveObjectIDsForLogging:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[ClientConnection _objectIDsResolvedAndLoggable:](self, "_objectIDsResolvedAndLoggable:", v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setByAddingObjectsFromSet:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[ClientConnection _logAccessToResolvedObjectIDs:](self, "_logAccessToResolvedObjectIDs:", v10);

        v5 = v11;
      }
    }
  }

}

- (BOOL)withDatabaseForObjects:(id)a3 perform:(id)a4
{
  return -[ClientConnection withDatabaseForObjects:options:perform:](self, "withDatabaseForObjects:options:perform:", a3, 0, a4);
}

- (BOOL)withDatabaseForObject:(id)a3 perform:(id)a4
{
  id v6;

  v6 = a4;
  LOBYTE(a3) = -[ClientConnection withDatabaseID:perform:](self, "withDatabaseID:perform:", objc_msgSend(a3, "databaseID"), v6);

  return (char)a3;
}

- (BOOL)withDatabaseID:(int)a3 perform:(id)a4
{
  uint64_t v4;
  id v6;
  NSObject *dbQueue;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  _QWORD v14[4];
  id v15;
  int v16;
  _QWORD block[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__4;
  v28 = __Block_byref_object_dispose__4;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__4;
  v22 = __Block_byref_object_dispose__4;
  v23 = 0;
  dbQueue = self->_dbQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ClientConnection_withDatabaseID_perform___block_invoke;
  block[3] = &unk_1E6A37A50;
  block[4] = self;
  block[5] = &v24;
  block[6] = &v18;
  dispatch_sync(dbQueue, block);
  v9 = -[ClientConnection _currentPriority](self, "_currentPriority");
  v10 = (void *)v25[5];
  v11 = v19[5];
  v14[0] = v8;
  v14[1] = 3221225472;
  v14[2] = __43__ClientConnection_withDatabaseID_perform___block_invoke_2;
  v14[3] = &unk_1E6A37AA0;
  v12 = v6;
  v15 = v12;
  v16 = v4;
  LOBYTE(v4) = objc_msgSend(v10, "performWithConfiguration:priority:databaseID:block:", v11, v9, v4, v14);

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  return v4;
}

- (void)logAccessToObject:(id)a3
{
  id v4;
  int v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  if (v4 && v5)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[ClientConnection logAccessToObjects:](self, "logAccessToObjects:", v6);

  }
}

- (id)_createManagedConfigAccountAccessHandlerWithValidator:(id)a3
{
  id v4;
  void *v5;
  char v6;
  CADMCAccountAccessHandler *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  CADMCProfileConnectionManagedConfigurationHandler *v21;
  CADMCAccountAccessHandler *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[CADRealCalendarDatabaseDataProvider realDataProvider](CADRealCalendarDatabaseDataProvider, "realDataProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "hasSyncClientEntitlement");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[CADDatabaseInitializationOptions managementBundleIdentifier](self->_databaseInitializationOptions, "managementBundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      -[CADDatabaseInitializationOptions remoteClientIdentity](self->_databaseInitializationOptions, "remoteClientIdentity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        -[ClientConnection identity](self, "identity");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v8)
        {
          v11 = (void *)CADLogHandle;
          if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_DEBUG))
          {
            v12 = v11;
            -[ClientConnection identity](self, "identity");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "clientName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = (void *)MEMORY[0x1E0CB37E8];
            -[ClientConnection identity](self, "identity");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "pid"));
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = 138412546;
            v26 = v14;
            v27 = 2112;
            v28 = v17;
            _os_log_impl(&dword_1B6A18000, v12, OS_LOG_TYPE_DEBUG, "XPC Client [%@] (PID: [%@]) does not have a bundle identifier. Account access behavior via MDM API will be undefined.", (uint8_t *)&v25, 0x16u);

          }
          v8 = 0;
        }
      }
    }
    CADAccountManagementFromSource(-[CADDatabaseInitializationOptions management](self->_databaseInitializationOptions, "management"));
    v19 = v18;
    objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[CADMCProfileConnectionManagedConfigurationHandler initWithMCProfileConnection:]([CADMCProfileConnectionManagedConfigurationHandler alloc], "initWithMCProfileConnection:", v20);
    v22 = [CADMCAccountAccessHandler alloc];
    -[ClientConnection _accountsProvider](self, "_accountsProvider");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CADMCAccountAccessHandler initWithDatabaseDataProvider:accountsProvider:managedConfigHandler:accountManagement:bundleIdentifier:](v22, "initWithDatabaseDataProvider:accountsProvider:managedConfigHandler:accountManagement:bundleIdentifier:", v5, v23, v21, v19, v8);

  }
  return v7;
}

void __46__ClientConnection_strictAccountAccessHandler__block_invoke(uint64_t a1)
{
  id *v2;
  int v3;

  v2 = *(id **)(a1 + 32);
  if (!v2[4])
  {
    v3 = objc_msgSend(v2[17], "management");
    v2 = *(id **)(a1 + 32);
    if (v3)
    {
      objc_msgSend(v2, "_initAccountAccessHandler");
      v2 = *(id **)(a1 + 32);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v2[4]);
}

- (id)_accountsProvider
{
  CADACAccountsProvider *accountsProvider;
  id v4;
  CADACAccountStoreAccountsProvider *v5;
  CADACAccountsProvider *v6;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  accountsProvider = self->_accountsProvider;
  if (!accountsProvider)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C8F2B8]);
    v5 = -[CADACAccountStoreAccountsProvider initWithAccountStore:]([CADACAccountStoreAccountsProvider alloc], "initWithAccountStore:", v4);
    v6 = self->_accountsProvider;
    self->_accountsProvider = (CADACAccountsProvider *)v5;

    accountsProvider = self->_accountsProvider;
  }
  return accountsProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_databaseInitializationOptions, 0);
  objc_storeStrong((id *)&self->_identity, 0);
  objc_storeStrong((id *)&self->_localAccountInfo, 0);
  objc_storeStrong((id *)&self->_cadOperationProxy, 0);
  objc_storeStrong((id *)&self->_privacyApplication, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_databaseProvider, 0);
  objc_storeStrong((id *)&self->_asynchronousOperationQueue, 0);
  objc_storeStrong((id *)&self->_operations, 0);
  objc_storeStrong((id *)&self->_dbQueue, 0);
  objc_storeStrong((id *)&self->_accountsProvider, 0);
  objc_storeStrong((id *)&self->_strictAccountAccessHandler, 0);
  objc_storeStrong((id *)&self->_accountAccessHandler, 0);
  objc_storeStrong((id *)&self->_tccPermissionChecker, 0);
  objc_storeStrong((id *)&self->_permissionValidator, 0);
}

- (BOOL)reminderAccessGranted
{
  void *v2;
  char v3;

  -[ClientConnection permissionValidator](self, "permissionValidator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasReminderAccess");

  return v3;
}

- (ClientConnection)initWithXPCConnection:(id)a3 tccPermissionChecker:(id)a4
{
  id v7;
  id v8;
  ClientConnection *v9;
  ClientConnection *v10;
  ClientIdentity *v11;
  uint64_t v12;
  ClientIdentity *identity;
  NSMutableArray *v14;
  NSMutableArray *operations;
  id v16;
  const char *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *asynchronousOperationQueue;
  dispatch_queue_t v21;
  OS_dispatch_queue *dbQueue;
  void *v23;
  NSObject *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  CADOperationProxy *v29;
  CADOperationProxy *cadOperationProxy;
  objc_super v32[2];
  objc_super v33;
  uint8_t buf[4];
  int v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v33.receiver = self;
  v33.super_class = (Class)ClientConnection;
  v9 = -[ClientConnection init](&v33, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_xpcConnection, a3);
    objc_storeStrong((id *)&v10->_tccPermissionChecker, a4);
    v11 = [ClientIdentity alloc];
    if (v7)
      objc_msgSend(v7, "auditToken");
    else
      memset(v32, 0, sizeof(v32));
    v12 = -[ClientIdentity initWithAuditToken:](v11, "initWithAuditToken:", v32);
    identity = v10->_identity;
    v10->_identity = (ClientIdentity *)v12;

    v14 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    operations = v10->_operations;
    v10->_operations = v14;

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.calaccessd.clientconnection.async.%d"), objc_msgSend(v7, "processIdentifier"));
    v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v17 = (const char *)objc_msgSend(v16, "UTF8String");
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create(v17, v18);
    asynchronousOperationQueue = v10->_asynchronousOperationQueue;
    v10->_asynchronousOperationQueue = (OS_dispatch_queue *)v19;

    v21 = dispatch_queue_create("com.apple.calaccessd.clientconnection-dbqueue", 0);
    dbQueue = v10->_dbQueue;
    v10->_dbQueue = (OS_dispatch_queue *)v21;

    v23 = (void *)CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_INFO))
    {
      v24 = v23;
      -[ClientConnection identity](v10, "identity");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "pid");
      -[ClientConnection identity](v10, "identity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "clientName");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v35 = v26;
      v36 = 2112;
      v37 = v28;
      _os_log_impl(&dword_1B6A18000, v24, OS_LOG_TYPE_INFO, "Client connected: %i (%@)", buf, 0x12u);

    }
    v29 = -[CADOperationProxy initWithClientConnection:]([CADOperationProxy alloc], "initWithClientConnection:", v10);
    cadOperationProxy = v10->_cadOperationProxy;
    v10->_cadOperationProxy = v29;

  }
  return v10;
}

+ (id)poolManager
{
  if (poolManager_onceToken != -1)
    dispatch_once(&poolManager_onceToken, &__block_literal_global_17);
  return (id)poolManager_defaultManager;
}

void __31__ClientConnection_poolManager__block_invoke()
{
  CADDatabaseConnectionPoolManager *v0;
  void *v1;

  v0 = objc_alloc_init(CADDatabaseConnectionPoolManager);
  v1 = (void *)poolManager_defaultManager;
  poolManager_defaultManager = (uint64_t)v0;

}

- (id)accountsProvider
{
  NSObject *dbQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__4;
  v10 = __Block_byref_object_dispose__4;
  v11 = 0;
  dbQueue = self->_dbQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__ClientConnection_accountsProvider__block_invoke;
  v5[3] = &unk_1E6A379D8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dbQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__ClientConnection_accountsProvider__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accountsProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)handleDatabaseChanged
{
  void *v3;
  id v4;

  -[ClientConnection accountAccessHandler](self, "accountAccessHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reset");

  -[ClientConnection strictAccountAccessHandler](self, "strictAccountAccessHandler");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reset");

}

- (void)addCreatedAuxDatabase:(CalDatabase *)a3
{
  NSObject *dbQueue;
  _QWORD v4[6];

  dbQueue = self->_dbQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __42__ClientConnection_addCreatedAuxDatabase___block_invoke;
  v4[3] = &unk_1E6A37A28;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dbQueue, v4);
}

uint64_t __42__ClientConnection_addCreatedAuxDatabase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "addCreatedAuxDatabase:", *(_QWORD *)(a1 + 40));
}

- (id)_databaseProvider
{
  CADDatabaseConnectionProvider *databaseProvider;
  void *v4;
  CADDatabaseConnectionProvider *v5;
  CADDatabaseConnectionProvider *v6;
  CADPooledDatabaseConfiguration *v7;
  void *v8;
  void *v9;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  databaseProvider = self->_databaseProvider;
  if (!databaseProvider)
  {
    +[ClientConnection poolManager](ClientConnection, "poolManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "poolForClient:options:", self, self->_databaseInitializationOptions);
    v5 = (CADDatabaseConnectionProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_databaseProvider;
    self->_databaseProvider = v5;

    -[CADDatabaseConnectionProvider addDelegate:](self->_databaseProvider, "addDelegate:", self);
    v7 = self->_configuration;
    if (!v7)
    {
      v7 = objc_alloc_init(CADPooledDatabaseConfiguration);
      objc_storeStrong((id *)&self->_configuration, v7);
      -[CADPooledDatabaseConfiguration setInMemoryChangeTrackingClientID:](v7, "setInMemoryChangeTrackingClientID:", CalDatabaseNextInMemoryChangeTrackingClientID());
      -[ClientIdentity clientName](self->_identity, "clientName");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CADPooledDatabaseConfiguration setClientName:](v7, "setClientName:", v8);

    }
    -[ClientConnection changeTrackingID](self, "changeTrackingID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CADPooledDatabaseConfiguration setClientIdentifier:](v7, "setClientIdentifier:", v9);

    -[CADPooledDatabaseConfiguration setEnablePropertyModificationLogging:](v7, "setEnablePropertyModificationLogging:", -[CADDatabaseInitializationOptions enablePropertyModificationLogging](self->_databaseInitializationOptions, "enablePropertyModificationLogging"));
    databaseProvider = self->_databaseProvider;
  }
  return databaseProvider;
}

- (unint64_t)_currentPriority
{
  return qos_class_self() < QOS_CLASS_USER_INITIATED;
}

- (void)withAllDatabasesPerform:(id)a3
{
  id v4;
  NSObject *dbQueue;
  unint64_t v6;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = 0;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__ClientConnection_withAllDatabasesPerform___block_invoke;
  block[3] = &unk_1E6A37A50;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(dbQueue, block);
  v6 = -[ClientConnection _currentPriority](self, "_currentPriority");
  objc_msgSend((id)v15[5], "performWithAllDatabasesWithConfiguration:priority:block:", v9[5], v6, v4);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
}

void __44__ClientConnection_withAllDatabasesPerform___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_databaseProvider");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 96));
}

uint64_t __59__ClientConnection_withDatabaseForObjects_options_perform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 32), a2);
}

uint64_t __43__ClientConnection_withDatabaseID_perform___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40), a2);
}

- (void)closeDatabases
{
  NSObject *dbQueue;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__ClientConnection_closeDatabases__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __34__ClientConnection_closeDatabases__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_closeDatabases");
}

- (void)_closeDatabases
{
  CADDatabaseConnectionProvider *databaseProvider;
  void *v4;
  CADDatabaseConnectionProvider *v5;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_dbQueue);
  databaseProvider = self->_databaseProvider;
  if (databaseProvider)
  {
    -[CADDatabaseConnectionProvider removeDelegate:](databaseProvider, "removeDelegate:", self);
    +[ClientConnection poolManager](ClientConnection, "poolManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "returnPool:forClient:", self->_databaseProvider, self);

    v5 = self->_databaseProvider;
    self->_databaseProvider = 0;

  }
}

- (void)restoreGenerationChangedExternally
{
  NSObject *dbQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_dbQueue);
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__ClientConnection_restoreGenerationChangedExternally__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(dbQueue, block);
}

uint64_t __54__ClientConnection_restoreGenerationChangedExternally__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 72) = 0;
  return result;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ClientConnection xpcConnection](self, "xpcConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)remoteObjectProxy
{
  return -[ClientConnection remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_41);
}

- (void)invalidateConnection
{
  id v2;

  -[ClientConnection xpcConnection](self, "xpcConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)releaseProxy
{
  -[ClientConnection setCadOperationProxy:](self, "setCadOperationProxy:", 0);
}

- (NSString)effectiveApplicationIdentifier
{
  void *identity;
  void *v4;
  void *v5;

  -[CADDatabaseInitializationOptions remoteClientIdentity](self->_databaseInitializationOptions, "remoteClientIdentity");
  identity = (void *)objc_claimAutoreleasedReturnValue();
  v4 = identity;
  if (!identity)
    identity = self->_identity;
  objc_msgSend(identity, "applicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (NSString)effectiveTeamIdentifier
{
  void *identity;
  void *v4;
  void *v5;

  -[CADDatabaseInitializationOptions remoteClientIdentity](self->_databaseInitializationOptions, "remoteClientIdentity");
  identity = (void *)objc_claimAutoreleasedReturnValue();
  v4 = identity;
  if (!identity)
    identity = self->_identity;
  objc_msgSend(identity, "teamIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)addOperation:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  NSMutableArray *v7;
  NSMutableArray *v8;
  NSObject *asynchronousOperationQueue;
  NSMutableArray *v10;
  _QWORD v11[4];
  id v12;
  NSMutableArray *v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isAsynchronous"))
  {
    v5 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      v6 = "Asynchronous operations are not supported: %@";
LABEL_8:
      _os_log_impl(&dword_1B6A18000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
    }
  }
  else if ((objc_msgSend(v4, "isReady") & 1) != 0)
  {
    v7 = self->_operations;
    objc_sync_enter(v7);
    -[NSMutableArray addObject:](self->_operations, "addObject:", v4);
    objc_sync_exit(v7);

    v8 = self->_operations;
    asynchronousOperationQueue = self->_asynchronousOperationQueue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __33__ClientConnection_addOperation___block_invoke;
    v11[3] = &unk_1E6A37420;
    v12 = v4;
    v13 = v8;
    v10 = v8;
    dispatch_async(asynchronousOperationQueue, v11);

  }
  else
  {
    v5 = CADLogHandle;
    if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v4;
      v6 = "Operations that aren't ready are not supported: %@";
      goto LABEL_8;
    }
  }

}

void __33__ClientConnection_addOperation___block_invoke(uint64_t a1)
{
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "start");
  obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  objc_msgSend(*(id *)(a1 + 40), "removeObject:", *(_QWORD *)(a1 + 32));
  objc_sync_exit(obj);

}

- (id)operations
{
  NSMutableArray *v3;
  void *v4;

  v3 = self->_operations;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](self->_operations, "copy");
  objc_sync_exit(v3);

  return v4;
}

- (void)dumpState
{
  void *v2;
  id v3;

  -[ClientConnection identity](self, "identity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog(CFSTR(" Connection %@"), v2);

}

- (CADTCCPermissionChecker)tccPermissionChecker
{
  return self->_tccPermissionChecker;
}

- (void)clearCachedAuthorizationStatus
{
  NSObject *dbQueue;
  void *v4;
  _QWORD block[5];

  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ClientConnection_clearCachedAuthorizationStatus__block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  -[ClientConnection cadOperationProxy](self, "cadOperationProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clearCachedAuthorizationStatus");

}

void __50__ClientConnection_clearCachedAuthorizationStatus__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(v1 + 8);
  *(_QWORD *)(v1 + 8) = 0;

}

- (void)logAccessToEntities:(id)a3
{
  id v4;
  int v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  if (v4 && v5 && objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_opt_new();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[ClientConnection _resolveObjectIDForLoggingAccessToEntity:](self, "_resolveObjectIDForLoggingAccessToEntity:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11), (_QWORD)v13);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v9);
    }

    -[ClientConnection _logAccessToResolvedObjectIDs:](self, "_logAccessToResolvedObjectIDs:", v6);
  }

}

- (BOOL)_isPrimaryObjectTypeForAccessLogging:(id)a3
{
  unsigned int v3;
  BOOL result;

  v3 = objc_msgSend(a3, "entityType");
  result = 1;
  if (v3 > 6 || ((1 << v3) & 0x46) == 0)
    return v3 == 101;
  return result;
}

- (id)_objectIDsToBeResolved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!-[ClientConnection _isPrimaryObjectTypeForAccessLogging:](self, "_isPrimaryObjectTypeForAccessLogging:", v11, (_QWORD)v13)&& objc_msgSend(v11, "entityType") != -1)
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_objectIDsResolvedAndLoggable:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[ClientConnection _isPrimaryObjectTypeForAccessLogging:](self, "_isPrimaryObjectTypeForAccessLogging:", v11, (_QWORD)v13))
        {
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_resolveObjectIDsForLogging:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__4;
  v12 = __Block_byref_object_dispose__4;
  v13 = (id)objc_opt_new();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__ClientConnection__resolveObjectIDsForLogging___block_invoke;
  v7[3] = &unk_1E6A37B08;
  v7[4] = self;
  v7[5] = &v8;
  -[ClientConnection withDatabaseForObjects:options:perform:](self, "withDatabaseForObjects:options:perform:", v4, 1, v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __48__ClientConnection__resolveObjectIDsForLogging___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = CADCopyEntityInDatabase(a4, *(void **)(*((_QWORD *)&v14 + 1) + 8 * v10));
        if (v11)
        {
          v12 = v11;
          objc_msgSend(*(id *)(a1 + 32), "_resolveObjectIDForLoggingAccessToEntity:", v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v13);
          CFRelease(v12);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

}

- (id)_resolveObjectIDForLoggingAccessToEntity:(void *)a3
{
  void *v4;
  id v5;

  CADOwningEntity(a3);
  CADEntityCopyObjectID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[ClientConnection _isPrimaryObjectTypeForAccessLogging:](self, "_isPrimaryObjectTypeForAccessLogging:", v4))
    v5 = v4;
  else
    v5 = 0;

  return v5;
}

- (void)_logAccessToResolvedObjectIDs:(id)a3
{
  id v4;
  NSObject *dbQueue;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _QWORD block[5];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dbQueue = self->_dbQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ClientConnection__logAccessToResolvedObjectIDs___block_invoke;
  block[3] = &unk_1E6A373A8;
  block[4] = self;
  dispatch_sync(dbQueue, block);
  v6 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        v13 = (void *)MEMORY[0x1BCC9D714](v8);
        v14 = objc_alloc(MEMORY[0x1E0CB36F8]);
        v15 = (void *)objc_msgSend(v14, "initRequiringSecureCoding:", 1, (_QWORD)v20);
        objc_msgSend(v15, "encodeObject:", v12);
        objc_msgSend(v15, "encodedData");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v16);

        objc_autoreleasePoolPop(v13);
        ++v11;
      }
      while (v9 != v11);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
      v9 = v8;
    }
    while (v8);
  }

  v17 = objc_alloc(MEMORY[0x1E0D80C80]);
  v18 = (void *)objc_msgSend(v17, "initWithAccessor:forService:assetIdentifiers:", self->_privacyApplication, *MEMORY[0x1E0DB10E8], v6);
  objc_msgSend(MEMORY[0x1E0D80C48], "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "log:", v18);

}

void __50__ClientConnection__logAccessToResolvedObjectIDs___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  _OWORD v14[2];

  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 104))
  {
    objc_msgSend(*(id *)(v1 + 136), "privacyClientIdentity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    v4 = objc_alloc(MEMORY[0x1E0D80C58]);
    v5 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      objc_msgSend(*(id *)(v5 + 136), "privacyClientIdentity");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v4, "initWithTCCIdentity:", v13);
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(void **)(v7 + 104);
      *(_QWORD *)(v7 + 104) = v6;

    }
    else
    {
      v9 = *(void **)(v5 + 128);
      if (v9)
        objc_msgSend(v9, "auditToken");
      else
        memset(v14, 0, sizeof(v14));
      v10 = objc_msgSend(v4, "initWithAuditToken:", v14);
      v11 = *(_QWORD *)(a1 + 32);
      v12 = *(void **)(v11 + 104);
      *(_QWORD *)(v11 + 104) = v10;

    }
  }
}

- (id)restrictedStoreRowIDsForAction:(unint64_t)a3 inDatabase:(CalDatabase *)a4
{
  void *v6;
  void *v7;

  -[ClientConnection accountAccessHandler](self, "accountAccessHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "restrictedStoreRowIDsForAction:inDatabase:", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isNotificationRestricted:(void *)a3 forAction:(unint64_t)a4
{
  uint64_t v6;
  const void *v7;
  _BOOL4 v8;

  if (a3 && (v6 = CalNotificationCopyOwner()) != 0)
  {
    v7 = (const void *)v6;
    if (CalEntityGetType() == 1)
    {
      if (-[ClientConnection isCalendarRestricted:forAction:](self, "isCalendarRestricted:forAction:", v7, a4))
        LOBYTE(v8) = 1;
      else
        v8 = !CalendarCanContainAnAllowedEntityType((uint64_t)v7, self);
    }
    else
    {
      LOBYTE(v8) = 0;
    }
    CFRelease(v7);
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (BOOL)isAlarmRestricted:(void *)a3 forAction:(unint64_t)a4
{
  uint64_t v6;
  const void *v7;
  int Type;

  if (a3 && (v6 = CalAlarmCopyOwningEntity()) != 0)
  {
    v7 = (const void *)v6;
    Type = CalEntityGetType();
    if (Type == 101 || Type == 2)
      LOBYTE(a4) = -[ClientConnection isCalendarItemRestricted:forAction:](self, "isCalendarItemRestricted:forAction:", v7, a4);
    else
      LODWORD(a4) = !CalendarCanContainAnAllowedEntityType((uint64_t)v7, self);
    CFRelease(v7);
  }
  else
  {
    LOBYTE(a4) = 0;
  }
  return a4;
}

- (BOOL)isStoreManaged:(void *)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!a3)
    return 0;
  v4 = (void *)CalStoreCopyExternalID();
  -[ClientConnection accountsProvider](self, "accountsProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accountWithIdentifier:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "MCIsManaged");

  return v7;
}

- (BOOL)isCalendarManaged:(void *)a3
{
  const void *v4;
  BOOL v5;

  if (!a3)
    return 0;
  v4 = (const void *)CalCalendarCopyStore();
  v5 = -[ClientConnection isStoreManaged:](self, "isStoreManaged:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (BOOL)isCalendarItemManaged:(void *)a3
{
  const void *v4;
  BOOL v5;

  if (!a3)
    return 0;
  v4 = (const void *)CalCalendarItemCopyCalendar();
  v5 = -[ClientConnection isCalendarManaged:](self, "isCalendarManaged:", v4);
  if (v4)
    CFRelease(v4);
  return v5;
}

- (void)reportIntegrityErrors:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[ClientConnection remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_53);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CADClientReceiveDatabaseIntegrityErrors:", v4);

}

void __42__ClientConnection_reportIntegrityErrors___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = CADLogHandle;
  if (os_log_type_enabled((os_log_t)CADLogHandle, OS_LOG_TYPE_ERROR))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_1B6A18000, v3, OS_LOG_TYPE_ERROR, "Error sending integrity errors back to client: %@", (uint8_t *)&v4, 0xCu);
  }

}

- (CDBAccountInfo)localAccountInfo
{
  void *v3;
  int v4;
  ClientConnection *v5;

  -[ClientConnection databaseInitializationOptions](self, "databaseInitializationOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unitTesting");

  if (v4)
  {
    v5 = self;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D0BB20], "sharedInstance");
    v5 = (ClientConnection *)objc_claimAutoreleasedReturnValue();
  }
  return (CDBAccountInfo *)v5;
}

- (BOOL)addressIsAccountOwner:(id)a3
{
  void *v3;
  char v4;

  objc_msgSend(a3, "stringRemovingMailto");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("attendee@localattendee.apple.com"));

  return v4;
}

- (BOOL)addressURLIsAccountOwner:(id)a3
{
  void *v4;

  objc_msgSend(a3, "absoluteString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[ClientConnection addressIsAccountOwner:](self, "addressIsAccountOwner:", v4);

  return (char)self;
}

- (void)setCadOperationProxy:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (void)setLocalAccountInfo:(id)a3
{
  objc_storeStrong((id *)&self->_localAccountInfo, a3);
}

- (CADXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

@end
