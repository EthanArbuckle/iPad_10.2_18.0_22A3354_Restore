@implementation ACDServer

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  NSObject *v6;
  ACDServer *v7;
  ACDServer *v8;
  NSXPCListener *v9;
  NSObject *v10;
  void *v11;
  id v12;
  ACDServer *v13;
  void *v14;
  NSMutableArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  void *v23;
  void *v24;
  NSObject *v25;
  unint64_t v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  id v32;
  void *v33;
  uint64_t v34;
  id v35;
  id *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  id v41;
  id *v42;
  unsigned int *p_clientCountMaximum;
  ACDServer *v45;
  id v46;
  BOOL v47;
  NSXPCListener *v48;
  void *v49;
  ACDServer *v50;
  id v51;
  id val;
  _QWORD v53[5];
  id v54;
  id v55;
  id v56;
  _QWORD v57[5];
  id v58;
  id v59;
  id v60;
  _QWORD v61[5];
  id v62;
  id v63;
  id v64;
  _QWORD v65[5];
  id v66;
  id v67;
  id v68;
  _QWORD block[4];
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  _QWORD v76[5];
  id v77;
  id v78;
  id v79;
  _QWORD v80[5];
  id v81;
  id v82;
  id v83;
  id from;
  id location;
  uint8_t v86[128];
  uint8_t buf[4];
  id v88;
  __int16 v89;
  id v90;
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v48 = (NSXPCListener *)a3;
  val = a4;
  -[ACDServer createClientForConnection:](self, "createClientForConnection:");
  v51 = (id)objc_claimAutoreleasedReturnValue();
  _ACDConnectionLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    -[ACDServer listener:shouldAcceptNewConnection:].cold.5();

  -[ACDServer _keyForConnection:](self, "_keyForConnection:", val);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = self;
  objc_sync_enter(v7);
  -[NSMutableDictionary setObject:forKey:](v7->_clientsByConnection, "setObject:forKey:", v51, v49);
  objc_sync_exit(v7);
  v50 = v7;

  objc_initWeak(&location, val);
  objc_initWeak(&from, v51);
  v8 = v7;
  v9 = v48;
  v47 = v7->_accountStoreListener == v48;
  if (v7->_accountStoreListener == v48)
  {
    if (listener_shouldAcceptNewConnection__onceToken != -1)
      dispatch_once(&listener_shouldAcceptNewConnection__onceToken, &__block_literal_global_6);
    _ACLogSystem();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v88 = val;
      v89 = 2112;
      v90 = v51;
      _os_log_impl(&dword_20D8CB000, v10, OS_LOG_TYPE_DEFAULT, "\"%@ (%@) received\", buf, 0x16u);
    }

    v46 = -[ACDServer _newDaemonAccountStoreFilterForClient:](v7, "_newDaemonAccountStoreFilterForClient:", v51);
    objc_msgSend(v51, "setFilter:", v46);
    objc_msgSend(val, "setRemoteObjectInterface:", listener_shouldAcceptNewConnection__remoteObjectInterface);
    objc_msgSend(MEMORY[0x24BDB4400], "XPCInterface");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setExportedInterface:", v11);

    objc_msgSend(val, "setExportedObject:", v46);
    v80[0] = MEMORY[0x24BDAC760];
    v80[1] = 3221225472;
    v80[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_87;
    v80[3] = &unk_24C7E3038;
    objc_copyWeak(&v82, &from);
    objc_copyWeak(&v83, &location);
    v80[4] = v7;
    v12 = v49;
    v81 = v12;
    objc_msgSend(val, "setInvalidationHandler:", v80);
    v76[0] = MEMORY[0x24BDAC760];
    v76[1] = 3221225472;
    v76[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_88;
    v76[3] = &unk_24C7E3038;
    objc_copyWeak(&v78, &from);
    objc_copyWeak(&v79, &location);
    v76[4] = v7;
    v77 = v12;
    objc_msgSend(val, "setInterruptionHandler:", v76);
    v13 = v7;
    objc_sync_enter(v13);
    -[NSMutableArray addObject:](v13->_accountStoreClients, "addObject:", v51);
    if (-[NSMutableArray count](v13->_accountStoreClients, "count") > (unint64_t)v13->_clientCountMaximum)
    {
      p_clientCountMaximum = &v13->_clientCountMaximum;
      v45 = v13;
      v14 = (void *)objc_opt_new();
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v15 = v13->_accountStoreClients;
      v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v73;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v73 != v17)
              objc_enumerationMutation(v15);
            v19 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
            objc_msgSend(v19, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "objectForKeyedSubscript:", v20);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "unsignedIntValue");

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v22 + 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "name");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v23, v24);

          }
          v16 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v72, v86, 16);
        }
        while (v16);
      }

      if (_os_feature_enabled_impl())
      {
        _ACLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[ACDServer listener:shouldAcceptNewConnection:].cold.3();
      }
      else
      {
        _ACLogSystem();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          -[ACDServer listener:shouldAcceptNewConnection:].cold.4();
      }

      LODWORD(v26) = *p_clientCountMaximum;
      *p_clientCountMaximum = ((double)v26 * 1.2);

      v13 = v45;
    }
    v27 = v13->_performMigrationQueue;
    objc_sync_exit(v13);

    if (v27)
    {
      if (objc_msgSend(v51, "hasEntitlement:", *MEMORY[0x24BDB4488]))
      {
        _ACLogSystem();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v51;
          _os_log_impl(&dword_20D8CB000, v28, OS_LOG_TYPE_DEFAULT, "\"Setting migrationInProgress to YES for the ACDAccountStore of %@\", buf, 0xCu);
        }

        objc_msgSend(v46, "backingAccountStore");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setMigrationInProgress:", 1);

        _ACLogSystem();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v88 = v51;
          _os_log_impl(&dword_20D8CB000, v30, OS_LOG_TYPE_DEFAULT, "\"Queuing setMigrationInProgress to NO for the ACDAccountStore of %@\", buf, 0xCu);
        }

        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_92;
        block[3] = &unk_24C7E3060;
        objc_copyWeak(&v70, &location);
        objc_copyWeak(&v71, &from);
        dispatch_async(v27, block);
        objc_destroyWeak(&v71);
        objc_destroyWeak(&v70);
      }
      else
      {
        objc_msgSend(val, "setDelegate:", v13);
      }
    }
    objc_msgSend(val, "resume");

    objc_destroyWeak(&v79);
    objc_destroyWeak(&v78);

    objc_destroyWeak(&v83);
    objc_destroyWeak(&v82);

    v9 = v48;
    v8 = v50;
  }
  if (v8->_oauthSignerListener == v9)
  {
    _ACLogSystem();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      -[ACDServer listener:shouldAcceptNewConnection:].cold.2();

    v32 = -[ACDServer _newOAuthSignerForClient:](v50, "_newOAuthSignerForClient:", v51);
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D5968);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setExportedInterface:", v33);

    objc_msgSend(val, "setExportedObject:", v32);
    v34 = MEMORY[0x24BDAC760];
    v65[0] = MEMORY[0x24BDAC760];
    v65[1] = 3221225472;
    v65[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_104;
    v65[3] = &unk_24C7E3038;
    objc_copyWeak(&v67, &from);
    objc_copyWeak(&v68, &location);
    v65[4] = v50;
    v35 = v49;
    v66 = v35;
    objc_msgSend(val, "setInvalidationHandler:", v65);
    v61[0] = v34;
    v61[1] = 3221225472;
    v61[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_105;
    v61[3] = &unk_24C7E3038;
    objc_copyWeak(&v63, &from);
    objc_copyWeak(&v64, &location);
    v61[4] = v50;
    v62 = v35;
    objc_msgSend(val, "setInterruptionHandler:", v61);
    v36 = v50;
    objc_sync_enter(v36);
    objc_msgSend(v36[3], "addObject:", v51);
    objc_sync_exit(v36);

    objc_msgSend(val, "resume");
    objc_destroyWeak(&v64);
    objc_destroyWeak(&v63);

    objc_destroyWeak(&v68);
    objc_destroyWeak(&v67);

    v47 = 1;
    v9 = v48;
    v8 = v50;
  }
  if (v8->_authenticationDialogListener == v9
    && objc_msgSend(v51, "hasEntitlement:", *MEMORY[0x24BDB4478]))
  {
    _ACLogSystem();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      -[ACDServer listener:shouldAcceptNewConnection:].cold.1();

    -[ACDServer authenticationDialogManager](v50, "authenticationDialogManager");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setExportedObject:", v38);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549D7D20);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(val, "setExportedInterface:", v39);

    v40 = MEMORY[0x24BDAC760];
    v57[0] = MEMORY[0x24BDAC760];
    v57[1] = 3221225472;
    v57[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_113;
    v57[3] = &unk_24C7E3038;
    objc_copyWeak(&v59, &from);
    objc_copyWeak(&v60, &location);
    v57[4] = v50;
    v41 = v49;
    v58 = v41;
    objc_msgSend(val, "setInvalidationHandler:", v57);
    v53[0] = v40;
    v53[1] = 3221225472;
    v53[2] = __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_114;
    v53[3] = &unk_24C7E3038;
    objc_copyWeak(&v55, &from);
    objc_copyWeak(&v56, &location);
    v53[4] = v50;
    v54 = v41;
    objc_msgSend(val, "setInterruptionHandler:", v53);
    v42 = v50;
    objc_sync_enter(v42);
    objc_msgSend(v42[4], "addObject:", v51);
    objc_sync_exit(v42);

    objc_msgSend(val, "resume");
    objc_destroyWeak(&v56);
    objc_destroyWeak(&v55);

    objc_destroyWeak(&v60);
    objc_destroyWeak(&v59);
    v47 = 1;
  }
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v47;
}

- (id)_keyForConnection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", a3);
}

- (id)createClientForConnection:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  -[ACDServer clientProvider](self, "clientProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDServer.m"), 254, CFSTR("Attempt to create ACDClient without a configured clientProvider!"));

  }
  -[ACDServer clientProvider](self, "clientProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "createClientForConnection:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (ACDClientProviderProtocol)clientProvider
{
  return self->_clientProvider;
}

- (id)_newDaemonAccountStoreFilterForClient:(id)a3
{
  id v4;
  void *v5;
  ACDAccountStore *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ACDAccountStoreFilter *v14;

  v4 = a3;
  -[ACDServer createDatabaseConnection](self, "createDatabaseConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACDAccountStore initWithClient:databaseConnection:]([ACDAccountStore alloc], "initWithClient:databaseConnection:", v4, v5);

  -[ACDServer accessPluginManager](self, "accessPluginManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setAccessPluginManager:](v6, "setAccessPluginManager:", v7);

  -[ACDServer accountNotifier](self, "accountNotifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setAccountNotifier:](v6, "setAccountNotifier:", v8);

  -[ACDServer authenticationDialogManager](self, "authenticationDialogManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setAuthenticationDialogManager:](v6, "setAuthenticationDialogManager:", v9);

  -[ACDServer authenticationPluginManager](self, "authenticationPluginManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setAuthenticationPluginManager:](v6, "setAuthenticationPluginManager:", v10);

  -[ACDServer databaseBackupActivity](self, "databaseBackupActivity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setDatabaseBackupActivity:](v6, "setDatabaseBackupActivity:", v11);

  -[ACDServer dataclassOwnersManager](self, "dataclassOwnersManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setDataclassOwnersManager:](v6, "setDataclassOwnersManager:", v12);

  -[ACDAccountStore setDelegate:](v6, "setDelegate:", self);
  -[ACDServer remoteDeviceProxy](self, "remoteDeviceProxy");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[ACDAccountStore setRemoteDeviceProxy:](v6, "setRemoteDeviceProxy:", v13);

  v14 = -[ACDAccountStoreFilter initWithBackingAccountStore:]([ACDAccountStoreFilter alloc], "initWithBackingAccountStore:", v6);
  return v14;
}

id __40__ACDServer_authenticationPluginManager__block_invoke(uint64_t a1)
{
  void *v2;
  ACDAuthenticationPluginManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAuthenticationPluginManager);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 88);
    *(_QWORD *)(v4 + 88) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  }
  return v2;
}

id __40__ACDServer_authenticationDialogManager__block_invoke(uint64_t a1)
{
  void *v2;
  ACDAuthenticationDialogManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAuthenticationDialogManager);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 112);
    *(_QWORD *)(v4 + 112) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 112);
  }
  return v2;
}

id __35__ACDServer_dataclassOwnersManager__block_invoke(uint64_t a1)
{
  void *v2;
  ACDDataclassOwnersManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDDataclassOwnersManager);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 104);
    *(_QWORD *)(v4 + 104) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
  }
  return v2;
}

id __32__ACDServer_accessPluginManager__block_invoke(uint64_t a1)
{
  void *v2;
  ACDAccessPluginManager *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAccessPluginManager);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 96);
    *(_QWORD *)(v4 + 96) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
  }
  return v2;
}

id __28__ACDServer_accountNotifier__block_invoke(uint64_t a1)
{
  void *v2;
  ACDAccountNotifier *v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  if (!v2)
  {
    v3 = objc_alloc_init(ACDAccountNotifier);
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 120);
    *(_QWORD *)(v4 + 120) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 120);
  }
  return v2;
}

- (ACRemoteDeviceProxy)remoteDeviceProxy
{
  return self->_remoteDeviceProxy;
}

- (ACDDataclassOwnersManager)dataclassOwnersManager
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__ACDServer_dataclassOwnersManager__block_invoke;
  v3[3] = &unk_24C7E2FF0;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v3);
  return (ACDDataclassOwnersManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (ACDDatabaseBackupActivity)databaseBackupActivity
{
  return self->_databaseBackupActivity;
}

- (id)createDatabaseConnection
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  -[ACDServer database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDServer.m"), 259, CFSTR("Attempt to create ACDDatabase without a configured database!"));

  }
  -[ACDServer database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ACDDatabaseProtocol)database
{
  return self->_database;
}

- (ACDAuthenticationPluginManager)authenticationPluginManager
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__ACDServer_authenticationPluginManager__block_invoke;
  v3[3] = &unk_24C7E2FC8;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v3);
  return (ACDAuthenticationPluginManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (ACDAuthenticationDialogManager)authenticationDialogManager
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __40__ACDServer_authenticationDialogManager__block_invoke;
  v3[3] = &unk_24C7E2FA0;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v3);
  return (ACDAuthenticationDialogManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (ACDAccountNotifier)accountNotifier
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__ACDServer_accountNotifier__block_invoke;
  v3[3] = &unk_24C7E2F78;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v3);
  return (ACDAccountNotifier *)(id)objc_claimAutoreleasedReturnValue();
}

- (ACDAccessPluginManager)accessPluginManager
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __32__ACDServer_accessPluginManager__block_invoke;
  v3[3] = &unk_24C7E2F50;
  v3[4] = self;
  ac_unfair_lock_perform_with_result_0(&self->_propertyLock, v3);
  return (ACDAccessPluginManager *)(id)objc_claimAutoreleasedReturnValue();
}

- (ACDServer)init
{
  void *v3;
  void *v4;
  void *v5;
  ACDServer *v6;

  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACDServer initWithAccountStoreListener:oauthSignerListener:authenticationDialogListener:](self, "initWithAccountStoreListener:oauthSignerListener:authenticationDialogListener:", v3, v4, v5);

  return v6;
}

- (ACDServer)initWithAccountStoreListener:(id)a3 oauthSignerListener:(id)a4 authenticationDialogListener:(id)a5
{
  id v10;
  id v11;
  id v12;
  ACDServer *v13;
  ACDServer *v14;
  ACDClientProvider *v15;
  ACDClientProviderProtocol *clientProvider;
  NSMutableArray *v17;
  NSMutableArray *accountStoreClients;
  NSMutableArray *v19;
  NSMutableArray *oauthSignerClients;
  NSMutableArray *v21;
  NSMutableArray *authenticationDialogManagerClients;
  NSMutableDictionary *v23;
  NSMutableDictionary *clientsByConnection;
  OS_dispatch_queue *performMigrationQueue;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  dispatch_queue_t v30;
  OS_dispatch_queue *v31;
  NSObject *v32;
  void *v34;
  void *v35;
  void *v36;
  _QWORD block[4];
  id v38;
  id buf[2];
  objc_super v40;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_14:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDServer.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("oauthSignerListener"));

    if (v12)
      goto LABEL_4;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDServer.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("accountStoreListener"));

  if (!v11)
    goto LABEL_14;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_15:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ACDServer.m"), 87, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authenticationDialogListener"));

LABEL_4:
  v40.receiver = self;
  v40.super_class = (Class)ACDServer;
  v13 = -[ACDServer init](&v40, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_accountStoreListener, a3);
    objc_storeStrong((id *)&v14->_oauthSignerListener, a4);
    objc_storeStrong((id *)&v14->_authenticationDialogListener, a5);
    v15 = objc_alloc_init(ACDClientProvider);
    clientProvider = v14->_clientProvider;
    v14->_clientProvider = (ACDClientProviderProtocol *)v15;

    v14->_propertyLock._os_unfair_lock_opaque = 0;
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    accountStoreClients = v14->_accountStoreClients;
    v14->_accountStoreClients = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    oauthSignerClients = v14->_oauthSignerClients;
    v14->_oauthSignerClients = v19;

    v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    authenticationDialogManagerClients = v14->_authenticationDialogManagerClients;
    v14->_authenticationDialogManagerClients = v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    clientsByConnection = v14->_clientsByConnection;
    v14->_clientsByConnection = v23;

    v14->_clientCountMaximum = 50;
    performMigrationQueue = v14->_performMigrationQueue;
    v14->_performMigrationQueue = 0;

    v26 = objc_msgSend(MEMORY[0x24BDB4390], "isMigrationFinished");
    _ACLogSystem();
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
    if (v26)
    {
      if (v28)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_20D8CB000, v27, OS_LOG_TYPE_DEFAULT, "\"Account migration has already occurred. No need to block non-migration connections.\", (uint8_t *)buf, 2u);
      }

    }
    else
    {
      if (v28)
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_20D8CB000, v27, OS_LOG_TYPE_DEFAULT, "\"Account migration has not occurred.\", (uint8_t *)buf, 2u);
      }

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = dispatch_queue_create("com.apple.accounts.performMigrationQueue", v29);
      v31 = v14->_performMigrationQueue;
      v14->_performMigrationQueue = (OS_dispatch_queue *)v30;

      objc_initWeak(buf, v14);
      v32 = v14->_performMigrationQueue;
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __91__ACDServer_initWithAccountStoreListener_oauthSignerListener_authenticationDialogListener___block_invoke;
      block[3] = &unk_24C7E2F28;
      objc_copyWeak(&v38, buf);
      dispatch_async(v32, block);
      objc_destroyWeak(&v38);
      objc_destroyWeak(buf);
    }
  }

  return v14;
}

void __91__ACDServer_initWithAccountStoreListener_oauthSignerListener_authenticationDialogListener___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  id WeakRetained;
  void *v5;
  _QWORD *v6;
  void *v7;
  uint8_t v8[16];
  uint8_t buf[16];

  _ACLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"calling DMPerformMigrationReturningAfterPlugin\", buf, 2u);
  }

  DMPerformMigrationReturningAfterPlugin();
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"DMPerformMigrationReturningAfterPlugin completed\", v8, 2u);
  }

  objc_msgSend(MEMORY[0x24BDB4390], "writeMigrationVersionPref");
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_sync_enter(v6);
    v7 = (void *)v6[7];
    v6[7] = 0;

    objc_sync_exit(v6);
  }

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_accountStoreListener, "invalidate");
  -[NSXPCListener invalidate](self->_authenticationDialogListener, "invalidate");
  -[NSXPCListener invalidate](self->_oauthSignerListener, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)ACDServer;
  -[ACDServer dealloc](&v3, sel_dealloc);
}

- (void)start
{
  id v3;

  -[ACDServer _beginObservingIDSProxyNotifications](self, "_beginObservingIDSProxyNotifications");
  -[ACDServer _beginObservingLanguageChangeNotfication](self, "_beginObservingLanguageChangeNotfication");
  +[ACDXPCEventPublisherWrapper registerSubscriberListener](_TtC14AccountsDaemon27ACDXPCEventPublisherWrapper, "registerSubscriberListener");
  objc_msgSend(MEMORY[0x24BDD1998], "enableTransactions");
  -[NSXPCListener setDelegate:](self->_accountStoreListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_accountStoreListener, "resume");
  -[NSXPCListener setDelegate:](self->_authenticationDialogListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_authenticationDialogListener, "resume");
  -[NSXPCListener setDelegate:](self->_oauthSignerListener, "setDelegate:", self);
  -[NSXPCListener resume](self->_oauthSignerListener, "resume");
  +[ACDKeychainManager setServer:](ACDKeychainManager, "setServer:", self);
  +[ACDKeychainCleanupActivity sharedActivity](ACDKeychainCleanupActivity, "sharedActivity");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "checkInIfNecessary");

}

- (void)shutdown
{
  ACDServer *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  -[ACDServer _endObservingLanguageChangeNotification](self, "_endObservingLanguageChangeNotification");
  -[NSXPCListener setDelegate:](self->_accountStoreListener, "setDelegate:", 0);
  -[NSXPCListener suspend](self->_accountStoreListener, "suspend");
  -[NSXPCListener setDelegate:](self->_authenticationDialogListener, "setDelegate:", 0);
  -[NSXPCListener suspend](self->_authenticationDialogListener, "suspend");
  -[NSXPCListener setDelegate:](self->_oauthSignerListener, "setDelegate:", 0);
  -[NSXPCListener suspend](self->_oauthSignerListener, "suspend");
  v3 = self;
  objc_sync_enter(v3);
  v4 = (void *)-[NSMutableArray copy](v3->_accountStoreClients, "copy");
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v8), "connection");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "invalidate");

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
    }
    while (v6);
  }

  v10 = (void *)-[NSMutableArray copy](v3->_oauthSignerClients, "copy");
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v27;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v14), "connection");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "invalidate");

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    }
    while (v12);
  }

  v16 = (void *)-[NSMutableArray copy](v3->_authenticationDialogManagerClients, "copy");
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v23;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v23 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * v20), "connection", (_QWORD)v22);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "invalidate");

        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v18);
  }

  -[NSMutableArray removeAllObjects](v3->_accountStoreClients, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v3->_oauthSignerClients, "removeAllObjects");
  -[NSMutableArray removeAllObjects](v3->_authenticationDialogManagerClients, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](v3->_clientsByConnection, "removeAllObjects");

  objc_sync_exit(v3);
}

- (id)clientForConnection:(id)a3
{
  id v4;
  ACDServer *v5;
  NSMutableDictionary *clientsByConnection;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  clientsByConnection = v5->_clientsByConnection;
  -[ACDServer _keyForConnection:](v5, "_keyForConnection:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clientsByConnection, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v8;
}

- (id)_newOAuthSignerForClient:(id)a3
{
  id v4;
  void *v5;
  ACDOAuthSigner *v6;

  v4 = a3;
  -[ACDServer createDatabaseConnection](self, "createDatabaseConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ACDOAuthSigner initWithClient:databaseConnection:]([ACDOAuthSigner alloc], "initWithClient:databaseConnection:", v4, v5);

  return v6;
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2549DCEB0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)listener_shouldAcceptNewConnection__remoteObjectInterface;
  listener_shouldAcceptNewConnection__remoteObjectInterface = v0;

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_87(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_87_cold_1();

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v4);

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_88(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_88_cold_1();

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v4);

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_92(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = v3;
  if (WeakRetained && v3)
  {
    _ACLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v4;
      _os_log_impl(&dword_20D8CB000, v5, OS_LOG_TYPE_DEFAULT, "\"Setting migrationInProgress to NO for the ACDAccountStore of %@\", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(WeakRetained, "exportedObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "backingAccountStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMigrationInProgress:", 0);

  }
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_104(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_104_cold_1();

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v4);

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_105(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_105_cold_1();

  v4 = *(id *)(a1 + 32);
  objc_sync_enter(v4);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v4);

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_113(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_113_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "authenticationDialogManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationDialogCrashed");

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v5);

}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_114(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  _ACLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_114_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "authenticationDialogManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "authenticationDialogCrashed");

  v5 = *(id *)(a1 + 32);
  objc_sync_enter(v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObject:", WeakRetained);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v5);

}

- (void)connection:(id)a3 handleInvocation:(id)a4 isReply:(BOOL)a5
{
  id v8;
  id v9;
  void *v10;
  ACDServer *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = v9;
  if (a5)
  {
    objc_msgSend(v9, "invoke");
  }
  else
  {
    v11 = self;
    objc_sync_enter(v11);
    v12 = v11->_performMigrationQueue;
    objc_sync_exit(v11);

    if (v12)
    {
      -[ACDServer clientForConnection:](v11, "clientForConnection:", v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _ACLogSystem();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v13;
        _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "\"Blocking invocations for %@\", buf, 0xCu);
      }

      v16[0] = MEMORY[0x24BDAC760];
      v16[1] = 3221225472;
      v16[2] = __49__ACDServer_connection_handleInvocation_isReply___block_invoke;
      v16[3] = &unk_24C7E2180;
      v17 = v13;
      v18 = v10;
      v15 = v13;
      dispatch_sync(v12, v16);

    }
    else
    {
      objc_msgSend(v8, "setDelegate:", 0);
      objc_msgSend(v10, "invoke");
    }

  }
}

uint64_t __49__ACDServer_connection_handleInvocation_isReply___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _ACLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_20D8CB000, v2, OS_LOG_TYPE_DEFAULT, "\"Resuming invocations for %@\", (uint8_t *)&v5, 0xCu);
  }

  return objc_msgSend(*(id *)(a1 + 40), "invoke");
}

- (void)_beginObservingLanguageChangeNotfication
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)__HandleLanguageChangeNotification, CFSTR("com.apple.language.changed"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (void)_endObservingLanguageChangeNotification
{
  __CFNotificationCenter *DarwinNotifyCenter;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, CFSTR("com.apple.language.changed"), 0);
}

- (BOOL)_isHomePod
{
  if (_isHomePod_onceToken != -1)
    dispatch_once(&_isHomePod_onceToken, &__block_literal_global_117);
  return _isHomePod_result;
}

uint64_t __23__ACDServer__isHomePod__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  _isHomePod_result = (_DWORD)result == 7;
  return result;
}

- (void)_handleLanguageChangedDarwinNotification
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "\"Language changed, will exit when all clear.\", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

- (void)accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5;
  id v8;
  __CFNotificationCenter *DarwinNotifyCenter;
  id v10;

  v5 = *(_QWORD *)&a5;
  v10 = a3;
  v8 = a4;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)*MEMORY[0x24BDB41E0], 0, 0, 1u);
  if (v8
    && ((_DWORD)v5 != 2
     || -[ACDServer _shouldSendDidSaveNotificationForAccount:](self, "_shouldSendDidSaveNotificationForAccount:", v8)))
  {
    -[ACDServer _notify_accountStore:didSaveAccount:changeType:](self, "_notify_accountStore:didSaveAccount:changeType:", v10, v8, v5);
  }

}

- (void)_notify_accountStore:(id)a3 didSaveAccount:(id)a4 changeType:(int)a5
{
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v5 = *(_QWORD *)&a5;
  v16[1] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1530], "notificationCenterForType:", *MEMORY[0x24BDD0FC0]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDB3ED0]);
    v16[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BDB4440]);

  }
  objc_msgSend(v6, "accountType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BDB40B8]);
  v13 = *MEMORY[0x24BDB41E0];
  v14 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "postNotificationName:object:userInfo:", v13, 0, v14);

  v15 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v15, "_clearCachedCredentials");
  objc_msgSend(v15, "_clearCachedChildAccounts");
  +[ACDXPCEventPublisherWrapper notifySubscribersOfAccountChange:type:](_TtC14AccountsDaemon27ACDXPCEventPublisherWrapper, "notifySubscribersOfAccountChange:type:", v15, v5);

}

- (BOOL)_shouldSendDidSaveNotificationForAccount:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  BOOL v15;
  uint8_t v17[16];

  v3 = a3;
  objc_msgSend(v3, "accountType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x24BDB4180]))
  {

  }
  else
  {
    objc_msgSend(v3, "accountType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB4188]);

    if (!v8)
    {
LABEL_14:
      v15 = 1;
      goto LABEL_15;
    }
  }
  objc_msgSend(v3, "dirtyProperties");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count") != 1)
  {
LABEL_13:

    goto LABEL_14;
  }
  objc_msgSend(v3, "dirtyDataclassProperties");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
LABEL_12:

    goto LABEL_13;
  }
  objc_msgSend(v3, "dirtyAccountProperties");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "count") != 1)
  {

    goto LABEL_12;
  }
  objc_msgSend(v3, "dirtyAccountProperties");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", CFSTR("cookies"));

  if (!v13)
    goto LABEL_14;
  _ACLogSystem();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20D8CB000, v14, OS_LOG_TYPE_DEFAULT, "@\"Will skip notifications for iTunes account: change only modified cookies\", v17, 2u);
  }

  v15 = 0;
LABEL_15:

  return v15;
}

- (void)credentialsDidChangeForAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  ACDServer *v7;
  id v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  NSObject *v22;
  ACDServer *obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v24 = a3;
  objc_msgSend(v24, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "accountType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self;
  objc_sync_enter(v7);
  obj = v7;
  v8 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7->_accountStoreClients;
  v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v26 != v11)
          objc_enumerationMutation(v9);
        v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v13, "pid", obj);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v8, "containsObject:", v14);

        if ((v15 & 1) == 0)
        {
          objc_msgSend(v13, "pid");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          if (v16)
          {
            objc_msgSend(v13, "pid");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v17);

          }
          objc_msgSend(v13, "filter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isClientEntitledToAccessAccountTypeWithIdentifier:", v6);

          objc_msgSend(v13, "connection");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "remoteObjectProxy");
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          if (v19)
            objc_msgSend(v21, "accountCredentialsDidChangeForAccountWithIdentifier:", v4);

        }
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v10);
  }

  objc_sync_exit(obj);
  _ACLogSystem();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    -[ACDServer credentialsDidChangeForAccount:].cold.1();

}

- (void)_beginObservingIDSProxyNotifications
{
  NSObject *v3;
  ACRemoteDeviceProxy *v4;
  ACRemoteDeviceProxy *remoteDeviceProxy;
  uint8_t v6[16];

  if (getenv("__ACSYNCBUBBLE"))
  {
    _ACLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_20D8CB000, v3, OS_LOG_TYPE_DEFAULT, "\"accountsd is running in the sync bubble, not initalizing ACRemoteDeviceProxy\", v6, 2u);
    }

  }
  else
  {
    v4 = objc_alloc_init(ACRemoteDeviceProxy);
    remoteDeviceProxy = self->_remoteDeviceProxy;
    self->_remoteDeviceProxy = v4;

  }
}

- (NSXPCListener)accountStoreListener
{
  return self->_accountStoreListener;
}

- (NSXPCListener)oauthSignerListener
{
  return self->_oauthSignerListener;
}

- (NSXPCListener)authenticationDialogListener
{
  return self->_authenticationDialogListener;
}

- (void)setAuthenticationPluginManager:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationPluginManager, a3);
}

- (void)setAccessPluginManager:(id)a3
{
  objc_storeStrong((id *)&self->_accessPluginManager, a3);
}

- (void)setDataclassOwnersManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataclassOwnersManager, a3);
}

- (void)setAuthenticationDialogManager:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationDialogManager, a3);
}

- (void)setAccountNotifier:(id)a3
{
  objc_storeStrong((id *)&self->_accountNotifier, a3);
}

- (void)setRemoteDeviceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDeviceProxy, a3);
}

- (void)setClientProvider:(id)a3
{
  objc_storeStrong((id *)&self->_clientProvider, a3);
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void)setDatabaseBackupActivity:(id)a3
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseBackupActivity, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_clientProvider, 0);
  objc_storeStrong((id *)&self->_remoteDeviceProxy, 0);
  objc_storeStrong((id *)&self->_accountNotifier, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManager, 0);
  objc_storeStrong((id *)&self->_dataclassOwnersManager, 0);
  objc_storeStrong((id *)&self->_accessPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationPluginManager, 0);
  objc_storeStrong((id *)&self->_authenticationDialogListener, 0);
  objc_storeStrong((id *)&self->_oauthSignerListener, 0);
  objc_storeStrong((id *)&self->_accountStoreListener, 0);
  objc_storeStrong((id *)&self->_performMigrationQueue, 0);
  objc_storeStrong((id *)&self->_clientsByConnection, 0);
  objc_storeStrong((id *)&self->_authenticationDialogManagerClients, 0);
  objc_storeStrong((id *)&self->_oauthSignerClients, 0);
  objc_storeStrong((id *)&self->_accountStoreClients, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"New connection to ACDAuthenticationDialogManager initiated by %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"New connection to ACDOAuthSigner initiated by %@\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9_1();
  _os_log_fault_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_FAULT, "Total client count exceeded %d: %@", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.4()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9_1();
  _os_log_error_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_ERROR, "\"Total client count exceeded %d: %@\", v1, 0x12u);
  OUTLINED_FUNCTION_2();
}

- (void)listener:shouldAcceptNewConnection:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Connection from %{public}@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_87_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was closed.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_88_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was interrupted.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_104_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was closed.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_105_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was interrupted.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_113_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_16(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was closed.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __48__ACDServer_listener_shouldAcceptNewConnection___block_invoke_114_cold_1()
{
  uint64_t v0;
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_30();
  v1 = OUTLINED_FUNCTION_2_4(v0);
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_9_0(&dword_20D8CB000, v2, v3, "\"Connection %@ for %@ was interrupted.\", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)credentialsDidChangeForAccount:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "\"Notified connected clients of credential changes for account %@.\", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
