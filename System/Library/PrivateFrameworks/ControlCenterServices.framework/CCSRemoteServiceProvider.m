@implementation CCSRemoteServiceProvider

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v5 = a4;
  CCSRemoteServiceServerInterface();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v6);

  objc_msgSend(v5, "setExportedObject:", self);
  v7 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke;
  v10[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v10[4] = v5;
  objc_msgSend(v5, "setInterruptionHandler:", v10);
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke_17;
  v9[3] = &__block_descriptor_40_e5_v8__0lu32l8;
  v9[4] = v5;
  objc_msgSend(v5, "setInvalidationHandler:", v9);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)getEnabledStateOfModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void (*v16)(_QWORD *, uint64_t);
  _QWORD *v17;
  uint64_t v18;
  void *v19;
  int v20;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138543362;
    v22 = v6;
    _os_log_impl(&dword_215C14000, v8, OS_LOG_TYPE_DEFAULT, "Getting enabled state of module with identifier '%{public}@'", (uint8_t *)&v21, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "ccs_hasEntitlementForModuleIdentifier:", v6))
  {
    if (v7)
    {
      -[CCSModuleRepository loadableModuleIdentifiers](self->_moduleRepository, "loadableModuleIdentifiers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "containsObject:", v6);

      if (v11)
      {
        -[CCSModuleSettingsProvider orderedFixedModuleIdentifiers](self->_settingsProvider, "orderedFixedModuleIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "containsObject:", v6);

        if (v13
          || (-[CCSModuleSettingsProvider orderedUserEnabledFixedModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledFixedModuleIdentifiers"), v14 = (void *)objc_claimAutoreleasedReturnValue(), v15 = objc_msgSend(v14, "containsObject:", v6), v14, v15))
        {
          v16 = (void (*)(_QWORD *, uint64_t))v7[2];
        }
        else
        {
          -[CCSModuleSettingsProvider orderedUserEnabledModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledModuleIdentifiers");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "containsObject:", v6);

          v16 = (void (*)(_QWORD *, uint64_t))v7[2];
          if (!v20)
          {
            v17 = v7;
            v18 = 2;
            goto LABEL_14;
          }
        }
        v17 = v7;
        v18 = 3;
      }
      else
      {
        v16 = (void (*)(_QWORD *, uint64_t))v7[2];
        v17 = v7;
        v18 = 1;
      }
LABEL_14:
      v16(v17, v18);
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:].cold.1();
    objc_msgSend(v9, "invalidate");
  }

}

- (void)setVisibility:(BOOL)a3 forModuleWithIdentifier:(id)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  NSObject *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void **v25;
  uint64_t *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint8_t buf[4];
  _BYTE v36[14];
  uint64_t v37;

  v6 = a3;
  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v36 = v6;
    *(_WORD *)&v36[4] = 2114;
    *(_QWORD *)&v36[6] = v8;
    _os_log_impl(&dword_215C14000, v10, OS_LOG_TYPE_DEFAULT, "Requesting setting of visibility %{BOOL}d for module with identifier '%{public}@'", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:].cold.1();
      if (!v9)
        goto LABEL_13;
    }
    else if (!v9)
    {
LABEL_13:
      objc_msgSend(v11, "invalidate");
      goto LABEL_25;
    }
    v18 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing entitlement for module with identifier '%@'"), v8);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v19;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v21);

    goto LABEL_13;
  }
  -[CCSModuleRepository moduleMetadataForModuleIdentifier:](self->_moduleRepository, "moduleMetadataForModuleIdentifier:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider setVisibility:forModuleWithIdentifier:completionHandler:].cold.1();
      if (!v9)
        goto LABEL_25;
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v31 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set visibility of module with identifier '%@' as it's not found"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v23;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = &v32;
    v26 = &v31;
LABEL_20:
    objc_msgSend(v24, "dictionaryWithObjects:forKeys:count:", v25, v26, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v28);

    goto LABEL_25;
  }
  -[CCSModuleRepository moduleMetadataForModuleIdentifier:](self->_moduleRepository, "moduleMetadataForModuleIdentifier:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "visibilityPreference");

  if (!v14)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider setVisibility:forModuleWithIdentifier:completionHandler:].cold.2();
      if (!v9)
        goto LABEL_25;
    }
    else if (!v9)
    {
      goto LABEL_25;
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v29 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot set visibility of module with identifier '%@' as it's unsupported"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v23;
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = &v30;
    v26 = &v29;
    goto LABEL_20;
  }
  v15 = -[CCSModuleRepository visibilityForModuleIdentifier:](self->_moduleRepository, "visibilityForModuleIdentifier:", v8);
  v16 = CCSLogRemoteService;
  v17 = os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT);
  if (v15 == v6)
  {
    if (v17)
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)v36 = v8;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)&v36[10] = v6;
      _os_log_impl(&dword_215C14000, v16, OS_LOG_TYPE_DEFAULT, "Cannot set visibility with identifier '%{public}@' as it's already %{BOOL}d", buf, 0x12u);
    }
  }
  else
  {
    if (v17)
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v36 = v6;
      *(_WORD *)&v36[4] = 2114;
      *(_QWORD *)&v36[6] = v8;
      _os_log_impl(&dword_215C14000, v16, OS_LOG_TYPE_DEFAULT, "Setting visibility %{BOOL}d for module with identifier '%{public}@'", buf, 0x12u);
    }
    -[CCSModuleRepository setVisibility:forModuleIdentifier:](self->_moduleRepository, "setVisibility:forModuleIdentifier:", v6, v8);
  }
  if (v9)
    v9[2](v9, 1, 0);
LABEL_25:

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __42__CCSRemoteServiceProvider_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CCSRemoteServiceProvider _init]([CCSRemoteServiceProvider alloc], "_init");
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  CCSRemoteServiceProvider *v2;
  uint64_t v3;
  CCSModuleRepository *moduleRepository;
  uint64_t v5;
  CCSModuleSettingsProvider *settingsProvider;
  uint64_t v7;
  NSXPCListener *listener;
  uint64_t v9;
  NSHashTable *presentationEndpoints;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CCSRemoteServiceProvider;
  v2 = -[CCSRemoteServiceProvider init](&v12, sel_init);
  if (v2)
  {
    +[CCSModuleRepository repositoryWithDefaults](CCSModuleRepository, "repositoryWithDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    moduleRepository = v2->_moduleRepository;
    v2->_moduleRepository = (CCSModuleRepository *)v3;

    +[CCSModuleSettingsProvider sharedProvider](CCSModuleSettingsProvider, "sharedProvider");
    v5 = objc_claimAutoreleasedReturnValue();
    settingsProvider = v2->_settingsProvider;
    v2->_settingsProvider = (CCSModuleSettingsProvider *)v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1998]), "initWithMachServiceName:", CFSTR("com.apple.controlcenter.remoteservice"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v7;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v9 = objc_claimAutoreleasedReturnValue();
    presentationEndpoints = v2->_presentationEndpoints;
    v2->_presentationEndpoints = (NSHashTable *)v9;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CCSRemoteServiceProvider invalidate](self, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CCSRemoteServiceProvider;
  -[CCSRemoteServiceProvider dealloc](&v3, sel_dealloc);
}

- (void)registerEndpoint:(id)a3
{
  id v5;
  NSHashTable *v6;
  void *v7;
  id v8;

  v5 = a3;
  if (v5)
  {
    v8 = v5;
    v6 = self->_presentationEndpoints;
    objc_sync_enter(v6);
    if (-[NSHashTable count](self->_presentationEndpoints, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CCSRemoteServiceProvider.m"), 84, CFSTR("The primary presentation endpoint already exists."));

    }
    -[NSHashTable addObject:](self->_presentationEndpoints, "addObject:", v8);
    objc_sync_exit(v6);

    v5 = v8;
  }

}

- (void)resume
{
  -[NSXPCListener resume](self->_listener, "resume");
}

- (void)invalidate
{
  -[CCSModuleRepository invalidate](self->_moduleRepository, "invalidate");
  -[NSXPCListener invalidate](self->_listener, "invalidate");
}

void __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_215C14000, v2, OS_LOG_TYPE_DEFAULT, "connection interrupted, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

void __63__CCSRemoteServiceProvider_listener_shouldAcceptNewConnection___block_invoke_17(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_215C14000, v2, OS_LOG_TYPE_DEFAULT, "connection invalidated, %{public}@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)requestEnableModuleWithIdentifier:(id)a3 force:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  void (**v9)(id, _QWORD, void *);
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  uint64_t *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  NSObject *v30;
  void *v31;
  int v32;
  void *v33;
  int v34;
  NSObject *v35;
  int v36;
  CCSModuleSettingsProvider *settingsProvider;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  uint8_t buf[4];
  id v50;
  uint64_t v51;

  v6 = a4;
  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = (void (**)(id, _QWORD, void *))a5;
  v10 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v8;
    _os_log_impl(&dword_215C14000, v10, OS_LOG_TYPE_DEFAULT, "Requesting enable of module with identifier '%{public}@'", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "ccs_hasEntitlementForForciblyEnablingModules");
  if ((objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:].cold.1();
      if (!v9)
        goto LABEL_12;
    }
    else if (!v9)
    {
LABEL_12:
      objc_msgSend(v11, "invalidate");
      goto LABEL_26;
    }
    v22 = (void *)MEMORY[0x24BDD1540];
    v47 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing entitlement for module with identifier '%@'"), v8);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v23;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v25);

    goto LABEL_12;
  }
  -[CCSModuleRepository loadableModuleIdentifiers](self->_moduleRepository, "loadableModuleIdentifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v8);

  if ((v14 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:].cold.3();
      if (!v9)
        goto LABEL_26;
    }
    else if (!v9)
    {
      goto LABEL_26;
    }
    v17 = (void *)MEMORY[0x24BDD1540];
    v45 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot enable module with identifier '%@' as it's unsupported"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v18;
    v19 = (void *)MEMORY[0x24BDBCE70];
    v20 = &v46;
    v21 = &v45;
    goto LABEL_16;
  }
  -[CCSModuleSettingsProvider orderedFixedModuleIdentifiers](self->_settingsProvider, "orderedFixedModuleIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "containsObject:", v8);

  if (!v16)
  {
    -[CCSModuleSettingsProvider orderedUserEnabledFixedModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledFixedModuleIdentifiers");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "containsObject:", v8);

    if (v29)
    {
      v30 = CCSLogRemoteService;
      if (!os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
        goto LABEL_24;
      *(_DWORD *)buf = 138543362;
      v50 = v8;
    }
    else
    {
      -[CCSModuleSettingsProvider orderedUserEnabledModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledModuleIdentifiers");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "containsObject:", v8);

      if (!v32)
      {
        -[CCSModuleSettingsProvider userDisabledModuleIdentifiers](self->_settingsProvider, "userDisabledModuleIdentifiers");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "containsObject:", v8);

        v35 = CCSLogRemoteService;
        if (v34 && (v6 & v12 & 1) == 0)
        {
          if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
          {
            -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:].cold.2();
            if (!v9)
              goto LABEL_26;
          }
          else if (!v9)
          {
            goto LABEL_26;
          }
          v17 = (void *)MEMORY[0x24BDD1540];
          v41 = *MEMORY[0x24BDD0BA0];
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot enable module with identifier '%@' as it's been user disabled"), v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v18;
          v19 = (void *)MEMORY[0x24BDBCE70];
          v20 = &v42;
          v21 = &v41;
          goto LABEL_16;
        }
        if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v50 = v8;
          _os_log_impl(&dword_215C14000, v35, OS_LOG_TYPE_DEFAULT, "Enabling module with identifier '%{public}@'", buf, 0xCu);
        }
        v36 = objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.Home.ControlCenter"));
        settingsProvider = self->_settingsProvider;
        if (v36)
        {
          -[CCSModuleSettingsProvider orderedUserEnabledFixedModuleIdentifiers](settingsProvider, "orderedUserEnabledFixedModuleIdentifiers");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "arrayByAddingObject:", v8);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          -[CCSModuleSettingsProvider setAndSaveOrderedUserEnabledFixedModuleIdentifiers:](self->_settingsProvider, "setAndSaveOrderedUserEnabledFixedModuleIdentifiers:", v39);
        }
        else
        {
          -[CCSModuleSettingsProvider orderedUserEnabledModuleIdentifiers](settingsProvider, "orderedUserEnabledModuleIdentifiers");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "arrayByAddingObject:", v8);
          v39 = (void *)objc_claimAutoreleasedReturnValue();

          -[CCSModuleSettingsProvider setAndSaveOrderedUserEnabledModuleIdentifiers:](self->_settingsProvider, "setAndSaveOrderedUserEnabledModuleIdentifiers:", v39);
        }

        if (!v9)
          goto LABEL_26;
LABEL_25:
        v9[2](v9, 1, 0);
        goto LABEL_26;
      }
      v30 = CCSLogRemoteService;
      if (!os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
      {
LABEL_24:
        if (!v9)
          goto LABEL_26;
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138543362;
      v50 = v8;
    }
    _os_log_impl(&dword_215C14000, v30, OS_LOG_TYPE_DEFAULT, "Cannot enable module with identifier '%{public}@' as it's already enabled", buf, 0xCu);
    goto LABEL_24;
  }
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
  {
    -[CCSRemoteServiceProvider requestEnableModuleWithIdentifier:force:completionHandler:].cold.1();
    if (!v9)
      goto LABEL_26;
    goto LABEL_8;
  }
  if (v9)
  {
LABEL_8:
    v17 = (void *)MEMORY[0x24BDD1540];
    v43 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot enable module with identifier '%@' as it's not user configurable"), v8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = v18;
    v19 = (void *)MEMORY[0x24BDBCE70];
    v20 = &v44;
    v21 = &v43;
LABEL_16:
    objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, 0, v27);

  }
LABEL_26:

}

- (void)requestDisableModuleWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  _BOOL4 v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v38 = v6;
    _os_log_impl(&dword_215C14000, v8, OS_LOG_TYPE_DEFAULT, "Requesting disable of module with identifier '%{public}@'", buf, 0xCu);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "ccs_hasEntitlementForModuleIdentifier:", v6) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:].cold.1();
      if (!v7)
        goto LABEL_12;
    }
    else if (!v7)
    {
LABEL_12:
      objc_msgSend(v9, "invalidate");
      goto LABEL_18;
    }
    v19 = (void *)MEMORY[0x24BDD1540];
    v35 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Missing entitlement for module with identifier '%@'"), v6);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, v22);

    goto LABEL_12;
  }
  -[CCSModuleRepository loadableModuleIdentifiers](self->_moduleRepository, "loadableModuleIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v6);

  if ((v11 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestDisableModuleWithIdentifier:completionHandler:].cold.2();
      if (!v7)
        goto LABEL_18;
    }
    else if (!v7)
    {
      goto LABEL_18;
    }
    v14 = (void *)MEMORY[0x24BDD1540];
    v33 = *MEMORY[0x24BDD0BA0];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot disable module with identifier '%@' as it's unsupported"), v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v15;
    v16 = (void *)MEMORY[0x24BDBCE70];
    v17 = &v34;
    v18 = &v33;
    goto LABEL_16;
  }
  -[CCSModuleSettingsProvider orderedFixedModuleIdentifiers](self->_settingsProvider, "orderedFixedModuleIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "containsObject:", v6);

  if (v13)
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
    {
      -[CCSRemoteServiceProvider requestDisableModuleWithIdentifier:completionHandler:].cold.1();
      if (!v7)
        goto LABEL_18;
      goto LABEL_8;
    }
    if (v7)
    {
LABEL_8:
      v14 = (void *)MEMORY[0x24BDD1540];
      v31 = *MEMORY[0x24BDD0BA0];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot disable module with identifier '%@' as it's not user configurable"), v6);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v15;
      v16 = (void *)MEMORY[0x24BDBCE70];
      v17 = &v32;
      v18 = &v31;
LABEL_16:
      objc_msgSend(v16, "dictionaryWithObjects:forKeys:count:", v17, v18, 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2](v7, 0, v24);

LABEL_17:
    }
  }
  else
  {
    -[CCSModuleSettingsProvider userDisabledModuleIdentifiers](self->_settingsProvider, "userDisabledModuleIdentifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "containsObject:", v6);

    v27 = CCSLogRemoteService;
    v28 = os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT);
    if (!v26)
    {
      if (v28)
      {
        *(_DWORD *)buf = 138543362;
        v38 = v6;
        _os_log_impl(&dword_215C14000, v27, OS_LOG_TYPE_DEFAULT, "Disabling module with identifier '%{public}@'", buf, 0xCu);
      }
      -[CCSModuleSettingsProvider orderedUserEnabledModuleIdentifiers](self->_settingsProvider, "orderedUserEnabledModuleIdentifiers");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("SELF != %@"), v6);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "filteredArrayUsingPredicate:", v30);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[CCSModuleSettingsProvider setAndSaveOrderedUserEnabledModuleIdentifiers:](self->_settingsProvider, "setAndSaveOrderedUserEnabledModuleIdentifiers:", v15);
      if (v7)
        v7[2](v7, 1, 0);
      goto LABEL_17;
    }
    if (v28)
    {
      *(_DWORD *)buf = 138543362;
      v38 = v6;
      _os_log_impl(&dword_215C14000, v27, OS_LOG_TYPE_DEFAULT, "Cannot disable module with identifier '%{public}@' as it's already disabled", buf, 0xCu);
    }
    if (v7)
      v7[2](v7, 1, 0);
  }
LABEL_18:

}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:(id)a3
{
  void (**v4)(id, void *, _QWORD);
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v4 = (void (**)(id, void *, _QWORD))a3;
  v5 = CCSLogRemoteService;
  if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_215C14000, v5, OS_LOG_TYPE_DEFAULT, "Request list of available module identifiers", v9, 2u);
  }
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "ccs_hasEntitlementForListingModuleIdentifiers"))
  {
    -[CCSModuleRepository loadableModuleIdentifiers](self->_moduleRepository, "loadableModuleIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "allObjects");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v8, 0);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider requestAvailableModuleIdentifiersWithCompletionHandler:].cold.1();
    objc_msgSend(v6, "invalidate");
  }

}

- (void)presentModuleWithIdentifier:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  __int128 *p_buf;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  __int128 buf;
  uint64_t v35;
  char v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD1988], "currentConnection");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "ccs_hasEntitlementForModuleIdentifier:", v8))
  {
    -[CCSModuleRepository loadableModuleIdentifiers](self->_moduleRepository, "loadableModuleIdentifiers");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "containsObject:", v8);

    v14 = CCSLogRemoteService;
    if (v13)
    {
      if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v8;
        _os_log_impl(&dword_215C14000, v14, OS_LOG_TYPE_DEFAULT, "Present module with identifier'%{public}@'", (uint8_t *)&buf, 0xCu);
      }
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v35 = 0x2020000000;
      v36 = 0;
      v25[0] = MEMORY[0x24BDAC760];
      v25[1] = 3221225472;
      v25[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke;
      v25[3] = &unk_24D460890;
      v15 = v8;
      v26 = v15;
      v27 = v9;
      v16 = v10;
      v28 = v16;
      p_buf = &buf;
      -[CCSRemoteServiceProvider enumerateEndpointsUsingBlock:](self, "enumerateEndpointsUsingBlock:", v25);
      if (!*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v32 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot present module with identifier '%@'; could not find an endpoint to present"),
          v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = v18;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v16 + 2))(v16, 0, v20);

      }
      _Block_object_dispose(&buf, 8);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
        -[CCSRemoteServiceProvider presentModuleWithIdentifier:options:completionHandler:].cold.1();
      if (v10)
      {
        v21 = (void *)MEMORY[0x24BDD1540];
        v30 = *MEMORY[0x24BDD0BA0];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot present module with identifier '%@' as it's unsupported"), v8);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v22;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v31, &v30, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        (*((void (**)(id, _QWORD, void *))v10 + 2))(v10, 0, v24);

      }
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider getEnabledStateOfModuleWithIdentifier:completionHandler:].cold.1();
    objc_msgSend(v11, "invalidate");
  }

}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  uint64_t v17;

  v5 = a2;
  v6 = dispatch_group_create();
  dispatch_group_enter(v6);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_2;
  v11[3] = &unk_24D460868;
  v12 = v5;
  v13 = *(id *)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v16 = v7;
  v17 = v8;
  v15 = v6;
  v9 = v6;
  v10 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v11);
  dispatch_group_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);

}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_3;
  v7[3] = &unk_24D460840;
  v10 = *(id *)(a1 + 64);
  v5 = *(id *)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 72);
  v8 = v5;
  v11 = v6;
  v9 = *(id *)(a1 + 56);
  objc_msgSend(v2, "presentModuleWithIdentifier:options:completion:", v3, v4, v7);

}

void __82__CCSRemoteServiceProvider_presentModuleWithIdentifier_options_completionHandler___block_invoke_3(uint64_t a1, char a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  if ((a2 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot present module with identifier '%@'; endpoint unable to present"),
      *(_QWORD *)(a1 + 32),
      *MEMORY[0x24BDD0BA0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = v5;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v3 + 16))(v3, 0, v7);

  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

- (void)handleIconElementRequest:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD1988];
  v7 = a4;
  objc_msgSend(v6, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "ccs_hasEntitlementForForciblyEnablingModules"))
  {
    +[CCSControlCenterOperationService sharedService](CCSControlCenterOperationService, "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleIconElementRequest:completionHandler:", v5, v7);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider handleIconElementRequest:completionHandler:].cold.1();
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0BA0];
    v14[0] = CFSTR("The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

    objc_msgSend(v8, "invalidate");
  }

}

- (void)handleControlCenterOperationType:(int64_t)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDD1988];
  v6 = a4;
  objc_msgSend(v5, "currentConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "ccs_hasEntitlementForHandlingControlCenterOperation"))
  {
    +[CCSControlCenterOperationService sharedService](CCSControlCenterOperationService, "sharedService");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleControlCenterOperationType:completionHandler:", a3, v6);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider handleControlCenterOperationType:completionHandler:].cold.1();
    v9 = (void *)MEMORY[0x24BDD1540];
    v12 = *MEMORY[0x24BDD0BA0];
    v13[0] = CFSTR("The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v6 + 2))(v6, 0, v11);

    objc_msgSend(v7, "invalidate");
  }

}

- (void)requestIconElementState:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDD1988];
  v7 = a4;
  objc_msgSend(v6, "currentConnection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "ccs_hasEntitlementForForciblyEnablingModules"))
  {
    +[CCSControlCenterOperationService sharedService](CCSControlCenterOperationService, "sharedService");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "requestIconElementState:completionHandler:", v5, v7);

  }
  else
  {
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      -[CCSRemoteServiceProvider requestIconElementState:completionHandler:].cold.1();
    v10 = (void *)MEMORY[0x24BDD1540];
    v13 = *MEMORY[0x24BDD0BA0];
    v14[0] = CFSTR("The application-identifier in your entitlements file is not allow-listed for this SPI. Please contact the Control Center team.");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("CCSControlCenterServicesErrorDomain"), 0, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v7 + 2))(v7, 0, v12);

    objc_msgSend(v8, "invalidate");
  }

}

- (void)enumerateEndpointsUsingBlock:(id)a3
{
  void (**v4)(id, uint64_t, char *);
  NSHashTable *v5;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, char *))a3;
  v5 = self->_presentationEndpoints;
  objc_sync_enter(v5);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_presentationEndpoints;
  v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v13;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v13 != v8)
        objc_enumerationMutation(v6);
      v10 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9);
      v11 = 0;
      v4[2](v4, v10, &v11);
      if (v11)
        break;
      if (v7 == ++v9)
      {
        v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_sync_exit(v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationEndpoints, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_controlCenterOperationService, 0);
  objc_storeStrong((id *)&self->_settingsProvider, 0);
  objc_storeStrong((id *)&self->_moduleRepository, 0);
}

- (void)getEnabledStateOfModuleWithIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Missing entitlement for module with identifier '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's not user configurable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's been user disabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestEnableModuleWithIdentifier:force:completionHandler:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot enable module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestDisableModuleWithIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot disable module with identifier '%{public}@' as it's not user configurable", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestDisableModuleWithIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot disable module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setVisibility:forModuleWithIdentifier:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot set visibility of module with identifier '%{public}@' as it's not found", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setVisibility:forModuleWithIdentifier:completionHandler:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot set visibility of module with identifier '%{public}@' as it's not unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)requestAvailableModuleIdentifiersWithCompletionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215C14000, v0, v1, "Missing entitlement for listing module identifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)presentModuleWithIdentifier:options:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_215C14000, v0, v1, "Cannot present module with identifier '%{public}@' as it's unsupported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)handleIconElementRequest:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215C14000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for handling CCSIconElementRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)handleControlCenterOperationType:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215C14000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for handling CCSControlCenterOperationRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)requestIconElementState:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3(&dword_215C14000, v0, v1, "The application-identifier in your entitlements file is not allow-listed for requesting CCSIconElementState for CCSControlCenterOperationRequest", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end
