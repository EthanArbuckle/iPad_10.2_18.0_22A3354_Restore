@implementation IRServiceContainer

- (void)run
{
  id v3;

  -[IRServiceContainer queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_31);

}

void __36__IRServiceContainer_setUpdateMode___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = *(_QWORD *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v6, "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 136315650;
    v12 = "#service-container, ";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v9;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Setting service mode to: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_msgSend(v3, "policyManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUpdateMode:", *(_QWORD *)(a1 + 32));

}

void __35__IRServiceContainer_getUpdateMode__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "policyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "mode");

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v8 = v5;
    objc_msgSend(v6, "numberWithInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "#service-container, ";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Getting service mode: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (IRPolicyManager)policyManager
{
  return self->_policyManager;
}

void __25__IRServiceContainer_run__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "#service-container, ";
    v9 = 2112;
    v10 = v3;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "%s[%@], Running service", (uint8_t *)&v7, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_refreshServiceWithDate:", v5);

  objc_msgSend(v2, "policyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "run");

}

- (void)policyManager:(id)a3 didUpdateContexts:(id)a4 withReason:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[IRServiceContainer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[IRServiceContainer delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceContainer:didUpdateContexts:withReason:", self, v8, v7);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setUpdateMode:(int64_t)a3
{
  void *v5;
  _QWORD v6[5];

  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __36__IRServiceContainer_setUpdateMode___block_invoke;
  v6[3] = &__block_descriptor_40_e28_v16__0__IRServiceContainer_8l;
  v6[4] = a3;
  IRDispatchAsyncWithStrongSelf(v5, self, v6);

}

- (NSString)serviceIdentifier
{
  return self->_serviceIdentifier;
}

- (int64_t)getUpdateMode
{
  void *v3;
  int64_t v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  -[IRServiceContainer queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__IRServiceContainer_getUpdateMode__block_invoke;
  v6[3] = &unk_251043F90;
  v6[4] = &v7;
  IRDispatchAsyncAndWaitWithStrongSelf(v3, self, v6);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (IRServiceContainerDelegate)delegate
{
  return (IRServiceContainerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)_refreshServiceWithDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[IRServiceContainer serviceStore](self, "serviceStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315394;
      v14 = "#service-container, ";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_23FFBA000, v12, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Service not in DB] Cant initialize a new service container, service identifier does not exist in DB", (uint8_t *)&v13, 0x16u);
    }
    v7 = 0;
    goto LABEL_8;
  }
  v7 = (void *)objc_msgSend(v6, "copyWithReplacementLastSeenDate:", v4);

  -[IRServiceContainer serviceStore](self, "serviceStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "updateService:", v7);

  if ((v9 & 1) == 0)
  {
    dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      v13 = 136315650;
      v14 = "#service-container, ";
      v15 = 2112;
      v16 = v10;
      v17 = 2112;
      v18 = v4;
      _os_log_impl(&dword_23FFBA000, v11, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Service container update during refresh] Could not update service during refresh: %@", (uint8_t *)&v13, 0x20u);
    }
LABEL_8:

  }
}

- (IRServiceStore)serviceStore
{
  return self->_serviceStore;
}

- (IRServiceContainer)initWithServiceIdentifier:(id)a3 delegate:(id)a4 avOutputDeviceProvider:(id)a5 biomeProvider:(id)a6 rapportProvider:(id)a7 proximityProvider:(id)a8 persistenceManager:(id)a9 displayMonitor:(id)a10 audioAVOutputContextController:(id)a11 isLowLatencyMiLo:(BOOL)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  IRServiceContainer *v27;
  IRServiceContainer *v28;
  id v29;
  const char *v30;
  NSObject *v31;
  dispatch_queue_t v32;
  void *v33;
  IRServiceStore *v34;
  uint64_t v35;
  void *v36;
  IRServiceStore *v37;
  void *v38;
  void *v39;
  void *v40;
  IRServiceLogPrefix *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  const void *v45;
  void *v46;
  void *v47;
  id v48;
  IRServiceContainer *v49;
  id v51;
  id v52;
  id v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  BOOL v57;
  objc_super v58;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v23 = a8;
  v24 = a9;
  v25 = a10;
  v26 = a11;
  v58.receiver = self;
  v58.super_class = (Class)IRServiceContainer;
  v27 = -[IRServiceContainer init](&v58, sel_init);
  v28 = v27;
  v54 = v23;
  if (!v27)
    goto LABEL_6;
  -[IRServiceContainer setServiceIdentifier:](v27, "setServiceIdentifier:", v18);
  v53 = v19;
  -[IRServiceContainer setDelegate:](v28, "setDelegate:", v19);
  v52 = v20;
  -[IRServiceContainer setAvOutputDeviceProvider:](v28, "setAvOutputDeviceProvider:", v20);
  v51 = v21;
  -[IRServiceContainer setBiomeProvider:](v28, "setBiomeProvider:", v21);
  -[IRServiceContainer setRapportProvider:](v28, "setRapportProvider:", v22);
  -[IRServiceContainer setPersistenceManager:](v28, "setPersistenceManager:", v24);
  -[IRServiceContainer setProximityProvider:](v28, "setProximityProvider:", v23);
  -[IRServiceContainer setDisplayMonitor:](v28, "setDisplayMonitor:", v25);
  -[IRServiceContainer setAudioAVOutputContextController:](v28, "setAudioAVOutputContextController:", v26);
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), CFSTR("com.apple.intelligentroutingd.serviceContainer"), v18);
  v29 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v30 = (const char *)objc_msgSend(v29, "UTF8String");
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = dispatch_queue_create(v30, v31);
  -[IRServiceContainer setQueue:](v28, "setQueue:", v32);

  -[IRServiceContainer persistenceManager](v28, "persistenceManager");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v32) = objc_msgSend(v33, "connectToStore");

  if ((v32 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:].cold.3();
    goto LABEL_13;
  }
  v34 = [IRServiceStore alloc];
  -[IRServiceContainer persistenceManager](v28, "persistenceManager");
  v35 = objc_claimAutoreleasedReturnValue();
  -[IRServiceContainer serviceIdentifier](v28, "serviceIdentifier");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:](v34, "initWithPersistenceManager:serviceIdentifier:", v35, v36);
  -[IRServiceContainer setServiceStore:](v28, "setServiceStore:", v37);

  -[IRServiceContainer serviceStore](v28, "serviceStore");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v35) = objc_msgSend(v38, "injectStatisticsRelationship");

  if ((v35 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:].cold.2();
    goto LABEL_13;
  }
  -[IRServiceContainer serviceStore](v28, "serviceStore");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "fetchService");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v40)
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      -[IRServiceContainer initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:].cold.1();
LABEL_13:
    v49 = 0;
    v20 = v52;
    v19 = v53;
    v21 = v51;
    goto LABEL_14;
  }
  v41 = objc_alloc_init(IRServiceLogPrefix);
  -[IRServiceContainer setServiceLogPrefix:](v28, "setServiceLogPrefix:", v41);

  objc_msgSend(v40, "serviceIdentifier");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRServiceContainer serviceLogPrefix](v28, "serviceLogPrefix");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "setPrefix:", v42);

  -[IRServiceContainer queue](v28, "queue");
  v44 = objc_claimAutoreleasedReturnValue();
  v45 = (const void *)*MEMORY[0x24BE5B328];
  -[IRServiceContainer serviceLogPrefix](v28, "serviceLogPrefix");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_queue_set_specific(v44, v45, v46, 0);

  -[IRServiceContainer queue](v28, "queue");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v55[0] = MEMORY[0x24BDAC760];
  v55[1] = 3221225472;
  v55[2] = __210__IRServiceContainer_initWithServiceIdentifier_delegate_avOutputDeviceProvider_biomeProvider_rapportProvider_proximityProvider_persistenceManager_displayMonitor_audioAVOutputContextController_isLowLatencyMiLo___block_invoke;
  v55[3] = &unk_251043E28;
  v56 = v40;
  v57 = a12;
  v48 = v40;
  IRDispatchSyncWithStrongSelf(v47, v28, v55);

  v20 = v52;
  v19 = v53;
  v21 = v51;
LABEL_6:
  v49 = v28;
LABEL_14:

  return v49;
}

void __210__IRServiceContainer_initWithServiceIdentifier_delegate_avOutputDeviceProvider_biomeProvider_rapportProvider_proximityProvider_persistenceManager_displayMonitor_audioAVOutputContextController_isLowLatencyMiLo___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  IRMiLoProvider *v4;
  void *v5;
  IRMiLoProvider *v6;
  IRPolicyManager *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  IRPolicyManager *v16;
  uint64_t v17;
  uint64_t v18;
  IRPolicyManager *v19;
  id v20;

  v3 = a2;
  v4 = [IRMiLoProvider alloc];
  objc_msgSend(v3, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[IRMiLoProvider initWithQueue:](v4, "initWithQueue:", v5);
  objc_msgSend(v3, "setMiloProvider:", v6);

  v7 = [IRPolicyManager alloc];
  v18 = *(_QWORD *)(a1 + 32);
  v19 = v7;
  objc_msgSend(v3, "queue");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "avOutputDeviceProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "biomeProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "miloProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rapportProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "proximityProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceStore");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "audioAVOutputContextController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v17) = *(_BYTE *)(a1 + 40);
  v16 = -[IRPolicyManager initWithService:queue:delegate:avOutputDeviceProvider:biomeProvider:miloProvider:rapportProvider:proximityProvider:serviceStore:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:](v19, "initWithService:queue:delegate:avOutputDeviceProvider:biomeProvider:miloProvider:rapportProvider:proximityProvider:serviceStore:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:", v18, v20, v3, v8, v9, v10, v11, v12, v13, v14, v15, v17);
  objc_msgSend(v3, "setPolicyManager:", v16);

}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)IRServiceContainer;
  -[IRServiceContainer dealloc](&v2, sel_dealloc);
}

- (void)deallocSync
{
  id v3;

  -[IRServiceContainer queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchSyncWithStrongSelf(v3, self, &__block_literal_global_3);

}

void __33__IRServiceContainer_deallocSync__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  const void **v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "#service-container, ";
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "%s[%@], Sync deallocation", (uint8_t *)&v8, 0x16u);
  }

  objc_msgSend(v2, "policyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deallocSync");

  objc_msgSend(v2, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_set_specific(v7, *v3, 0, 0);

}

+ (id)createServiceWithClientIdentifier:(id)a3 serviceIdentifier:(id)a4 parameters:(id)a5 persistenceManager:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  os_log_t *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  IRServiceStore *v17;
  void *v18;
  IRServiceStore *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  int v27;
  id v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = (os_log_t *)MEMORY[0x24BE5B270];
  v14 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v27 = 138412546;
    v28 = v9;
    v29 = 2112;
    v30 = v11;
    _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_DEFAULT, "#service-container, Creating a service for client: %@, with parameters = %@", (uint8_t *)&v27, 0x16u);
  }
  if ((objc_msgSend(MEMORY[0x24BE5B300], "isServicePackageSupported:", objc_msgSend(v11, "servicePackage")) & 1) == 0)
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:].cold.3();
    goto LABEL_13;
  }
  if ((objc_msgSend(v12, "connectToStore") & 1) == 0)
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:].cold.2();
LABEL_13:
    v25 = 0;
    goto LABEL_18;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[IRServiceDO serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:](IRServiceDO, "serviceDOWithLastSeenDate:clientIdentifier:serviceIdentifier:servicePackage:", v15, v9, v10, objc_msgSend(v11, "servicePackage"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = [IRServiceStore alloc];
  objc_msgSend(v16, "serviceIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:](v17, "initWithPersistenceManager:serviceIdentifier:", v12, v18);

  if (-[IRServiceStore addService:](v19, "addService:", v16))
  {
    v20 = (void *)*MEMORY[0x24BE5B280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
    {
      v21 = v20;
      objc_msgSend(v16, "serviceIdentifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 138412290;
      v28 = v22;
      _os_log_impl(&dword_23FFBA000, v21, OS_LOG_TYPE_DEFAULT, "#service-container, Service created: %@", (uint8_t *)&v27, 0xCu);

    }
    v23 = objc_alloc(MEMORY[0x24BE5B308]);
    objc_msgSend(v16, "serviceIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v23, "initWithServiceIdentifier:servicePackage:", v24, objc_msgSend(v11, "servicePackage"));

  }
  else
  {
    if (os_log_type_enabled(*v13, OS_LOG_TYPE_ERROR))
      +[IRServiceContainer createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:].cold.1();
    v25 = 0;
  }

LABEL_18:
  return v25;
}

+ (void)deleteServiceWithToken:(id)a3 persistenceManager:(id)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  IRServiceStore *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(a3, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v6;
    _os_log_impl(&dword_23FFBA000, v7, OS_LOG_TYPE_DEFAULT, "#service-container, [%@]: Trying to delete service", (uint8_t *)&v9, 0xCu);
  }
  if ((objc_msgSend(v5, "connectToStore") & 1) != 0)
  {
    if (!+[IRMiLoProvider deleteServiceWithToken:](IRMiLoProvider, "deleteServiceWithToken:", v6)
      && os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteServiceWithToken:persistenceManager:].cold.2();
    }
    v8 = -[IRServiceStore initWithPersistenceManager:serviceIdentifier:]([IRServiceStore alloc], "initWithPersistenceManager:serviceIdentifier:", v5, v6);
    if (!-[IRServiceStore deleteService](v8, "deleteService")
      && os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteServiceWithToken:persistenceManager:].cold.1();
    }

  }
  else if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
  {
    +[IRServiceContainer deleteServiceWithToken:persistenceManager:].cold.3();
  }

}

+ (id)exportDatabaseWithPersistenceManager:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  char v39;
  id v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  NSObject *v56;
  NSObject *v57;
  void *v58;
  id v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unint64_t v63;
  uint64_t j;
  void *v65;
  void *v66;
  void *v67;
  int v68;
  void *v69;
  void *v70;
  char v71;
  id v72;
  NSObject *v73;
  uint64_t v74;
  id v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id obj;
  void *v88;
  id v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  id v94;
  id v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  id v100;
  uint8_t buf[4];
  void *v102;
  __int16 v103;
  id v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;
  _QWORD v108[4];

  v108[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_DEFAULT, "#service-container, Trying to export DB", buf, 2u);
  }
  if ((objc_msgSend(v3, "connectToStore") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "userLibraryDirectoryPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "persistenceStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), v5, CFSTR("/Logs/intelligentroutingd/intelligentroutingexport"));
    v8 = objc_claimAutoreleasedReturnValue();
    v107 = *MEMORY[0x24BDD0CC8];
    v108[0] = &unk_25105EB70;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v108, &v107, 1);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "fileExistsAtPath:isDirectory:", v8, 0);

    if ((v10 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v100 = 0;
      v12 = (void *)v8;
      v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, v88, &v100);
      v14 = v100;

      if ((v13 & 1) == 0)
      {
        if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
        {
          v45 = v12;
          +[IRServiceContainer exportDatabaseWithPersistenceManager:].cold.3();
          v41 = 0;
        }
        else
        {
          v41 = 0;
          v45 = v12;
        }
LABEL_48:

        goto LABEL_49;
      }

      v8 = (uint64_t)v12;
    }
    v15 = (void *)MEMORY[0x24BDBCF48];
    v16 = (void *)MEMORY[0x24BDD17C8];
    v82 = v7;
    v83 = v5;
    objc_msgSend(v7, "lastPathComponent");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = (void *)v8;
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%@/%@"), v8, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fileURLWithPath:isDirectory:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v19, "path");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingString:", CFSTR("-wal"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fileURLWithPath:isDirectory:", v22, 0);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v19, "path");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByAppendingString:", CFSTR("-shm"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "fileURLWithPath:isDirectory:", v26, 0);
    v27 = objc_claimAutoreleasedReturnValue();

    v84 = (void *)v27;
    v85 = (void *)v23;
    v86 = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v19, v23, v27, 0);
    v96 = 0u;
    v97 = 0u;
    v98 = 0u;
    v99 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
    if (v28)
    {
      v29 = v28;
      v30 = 0;
      v31 = *(_QWORD *)v97;
      while (2)
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v97 != v31)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v96 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "path");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = objc_msgSend(v34, "fileExistsAtPath:", v35);

          if (v36)
          {
            objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "path");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v30;
            v39 = objc_msgSend(v37, "removeItemAtPath:error:", v38, &v95);
            v40 = v95;

            if ((v39 & 1) == 0)
            {
              v42 = (void *)*MEMORY[0x24BE5B270];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
                +[IRServiceContainer exportDatabaseWithPersistenceManager:].cold.2(v42, v33, (uint64_t)v40);
              v41 = 0;
              v14 = v86;
              v43 = obj;
              v44 = obj;
              v7 = v82;
              v5 = v83;
              v45 = v81;
              goto LABEL_47;
            }
            v30 = v40;
          }
        }
        v29 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v96, v106, 16);
        if (v29)
          continue;
        break;
      }
    }
    else
    {
      v30 = 0;
    }
    v79 = v30;

    v46 = objc_alloc(MEMORY[0x24BDBB738]);
    objc_msgSend(v3, "managedObjectModel");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(v46, "initWithManagedObjectModel:", v47);

    objc_msgSend(v3, "persistenceStore");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "options");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "url");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "options");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = v49;
    objc_msgSend(v49, "storeType");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = 0;
    v54 = objc_msgSend(v48, "replacePersistentStoreAtURL:destinationOptions:withPersistentStoreFromURL:sourceOptions:storeType:error:", v86, v50, v51, v52, v53, &v94);
    v80 = v94;

    v55 = (void *)*MEMORY[0x24BE5B270];
    v78 = v48;
    v56 = *MEMORY[0x24BE5B270];
    if ((v54 & 1) != 0)
    {
      if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
      {
        v57 = v55;
        objc_msgSend(v86, "path");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v102 = v58;
        _os_log_impl(&dword_23FFBA000, v57, OS_LOG_TYPE_DEFAULT, "#service-container, Successfully exported database to: %@", buf, 0xCu);

      }
      v76 = v3;
      v41 = objc_alloc_init(MEMORY[0x24BDBCE30]);
      v90 = 0u;
      v91 = 0u;
      v92 = 0u;
      v93 = 0u;
      v59 = obj;
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
      if (v60)
      {
        v61 = v60;
        v62 = *(_QWORD *)v91;
        v63 = 0x24BDD1000uLL;
        do
        {
          for (j = 0; j != v61; ++j)
          {
            if (*(_QWORD *)v91 != v62)
              objc_enumerationMutation(v59);
            v65 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * j);
            objc_msgSend(*(id *)(v63 + 1408), "defaultManager");
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v65, "path");
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v68 = objc_msgSend(v66, "fileExistsAtPath:", v67);

            if (v68)
            {
              objc_msgSend(*(id *)(v63 + 1408), "defaultManager");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "path");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              v89 = 0;
              v71 = objc_msgSend(v69, "setAttributes:ofItemAtPath:error:", v88, v70, &v89);
              v72 = v89;

              if ((v71 & 1) == 0)
              {
                v73 = *MEMORY[0x24BE5B270];
                if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v102 = v65;
                  v103 = 2112;
                  v104 = v72;
                  _os_log_error_impl(&dword_23FFBA000, v73, OS_LOG_TYPE_ERROR, "#service-container, [ErrorId - export database: error setting file permissions] failed to change permissions of file: %@ with error: %@", buf, 0x16u);
                }
              }
              objc_msgSend(v41, "arrayByAddingObject:", v65);
              v74 = objc_claimAutoreleasedReturnValue();

              v41 = (id)v74;
              v63 = 0x24BDD1000;
            }
          }
          v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v90, v105, 16);
        }
        while (v61);
      }

      v3 = v76;
      v7 = v82;
      v5 = v83;
    }
    else
    {
      v7 = v82;
      v5 = v83;
      if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
        +[IRServiceContainer exportDatabaseWithPersistenceManager:].cold.1();
      v41 = 0;
    }
    v45 = v81;
    v14 = v86;

    v43 = obj;
    v40 = v79;
    v44 = v80;
LABEL_47:

    goto LABEL_48;
  }
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
    +[IRServiceContainer exportDatabaseWithPersistenceManager:].cold.4();
  v41 = 0;
LABEL_49:

  return v41;
}

+ (BOOL)deleteDatabaseWithPersistenceManager:(id)a3
{
  id v3;
  NSObject **v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  char v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (NSObject **)MEMORY[0x24BE5B270];
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v3, "getLocalStoreURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v18 = v7;
    _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_DEFAULT, "#service-container, Attempting to delete database at: %@", buf, 0xCu);

  }
  if (objc_msgSend(v3, "disconnectFromStore"))
  {
    objc_msgSend(v3, "persistentStoreCoordinator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "getLocalStoreURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BDBB580];
    v16 = 0;
    v11 = objc_msgSend(v8, "destroyPersistentStoreAtURL:withType:options:error:", v9, v10, 0, &v16);
    v12 = v16;

    v13 = *v4;
    v14 = *v4;
    if ((v11 & 1) != 0)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_DEFAULT, "#service-container, Database deleted", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      +[IRServiceContainer deleteDatabaseWithPersistenceManager:].cold.1();
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)getServiceTokensForClientIdentifier:(id)a3 persistenceManager:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BE5B270];
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v5;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_DEFAULT, "#service-container, Trying to get service tokens for client identifier: %@", buf, 0xCu);
  }
  if ((objc_msgSend(v6, "connectToStore") & 1) != 0)
  {
    +[IRServiceStore fetchAllServicesForClientIdentifier:persistenceManager:](IRServiceStore, "fetchAllServicesForClientIdentifier:persistenceManager:", v5, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x24BDAC760];
      v13[1] = 3221225472;
      v13[2] = __77__IRServiceContainer_getServiceTokensForClientIdentifier_persistenceManager___block_invoke;
      v13[3] = &unk_251043E90;
      v11 = v10;
      v14 = v11;
      objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      +[IRServiceContainer getServiceTokensForClientIdentifier:persistenceManager:].cold.1();
    v11 = 0;
  }

  return v11;
}

void __77__IRServiceContainer_getServiceTokensForClientIdentifier_persistenceManager___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x24BE5B308];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "serviceIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "servicePackage");

  v8 = (id)objc_msgSend(v5, "initWithServiceIdentifier:servicePackage:", v6, v7);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v8);

}

+ (id)getServicesWithPersistenceManager:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "connectToStore") & 1) != 0)
  {
    +[IRServiceStore fetchAllServicesWithPersistenceManager:](IRServiceStore, "fetchAllServicesWithPersistenceManager:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_ERROR))
      +[IRServiceContainer getServicesWithPersistenceManager:].cold.1();
    v4 = 0;
  }

  return v4;
}

- (void)updateCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__IRServiceContainer_updateCandidates___block_invoke;
  v7[3] = &unk_251043ED8;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __39__IRServiceContainer_updateCandidates___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "policyManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateCandidates:", *(_QWORD *)(a1 + 32));

}

- (void)deleteCandidate:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__IRServiceContainer_deleteCandidate___block_invoke;
  v7[3] = &unk_251043ED8;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncWithStrongSelf(v5, self, v7);

}

void __38__IRServiceContainer_deleteCandidate___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "policyManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteCandidate:", *(_QWORD *)(a1 + 32));

}

- (void)addEvent:(id)a3 forCandidateIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IRServiceContainer queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __54__IRServiceContainer_addEvent_forCandidateIdentifier___block_invoke;
  v11[3] = &unk_251043F00;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);

}

void __54__IRServiceContainer_addEvent_forCandidateIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "policyManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEvent:forCandidateIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (id)requestCurrentContextWithBundleID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __56__IRServiceContainer_requestCurrentContextWithBundleID___block_invoke;
  v9[3] = &unk_251043F28;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  IRDispatchAsyncAndWaitWithStrongSelf(v5, self, v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__IRServiceContainer_requestCurrentContextWithBundleID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE5B280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B280], OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v11 = 136315650;
    v12 = "#service-container, ";
    v13 = 2112;
    v14 = v4;
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_DEFAULT, "%s[%@], Requesting current context, with bundleID: %@", (uint8_t *)&v11, 0x20u);
  }

  objc_msgSend(v3, "policyManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "requestCurrentContextWithBundleID:", *(_QWORD *)(a1 + 32));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (void)setSpotOnLocationWithParameters:(id)a3 andClientID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[IRServiceContainer queue](self, "queue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __66__IRServiceContainer_setSpotOnLocationWithParameters_andClientID___block_invoke;
  v11[3] = &unk_251043F00;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  IRDispatchAsyncWithStrongSelf(v8, self, v11);

}

void __66__IRServiceContainer_setSpotOnLocationWithParameters_andClientID___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "policyManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSpotOnLocationWithParameters:andClientID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)requestUpdatedBundlesWithSignificantInteraction
{
  id v3;

  -[IRServiceContainer queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_32);

}

void __69__IRServiceContainer_requestUpdatedBundlesWithSignificantInteraction__block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "policyManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "requestUpdatedBundlesWithSignificantInteraction");

}

- (void)dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__IRServiceContainer_dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard___block_invoke;
  v7[3] = &unk_251043ED8;
  v8 = v4;
  v6 = v4;
  IRDispatchAsyncAndWaitWithStrongSelf(v5, self, v7);

}

void __74__IRServiceContainer_dbCleanupWithDateIntervalOfMiLoPredictionsToDiscard___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  const __CFString *v17;
  int v18;
  const char *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  const __CFString *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDBCE60];
  v4 = a2;
  objc_msgSend(v3, "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "serviceStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "cleanupWithDate:dateIntervalOfMiLoPredictionsToDiscard:", v5, *(_QWORD *)(a1 + 32));

  objc_msgSend(v4, "_refreshServiceWithDate:", v5);
  objc_msgSend(v4, "policyManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "synchronizeAndFetchFromDBOnDisk");
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v11 = (void *)MEMORY[0x24BDD16E0];
    v12 = (void *)MEMORY[0x24BDBCE60];
    v13 = v10;
    objc_msgSend(v12, "date");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeIntervalSinceDate:", v5);
    objc_msgSend(v11, "numberWithDouble:");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = CFSTR("Fail");
    v18 = 136315906;
    v19 = "#service-container, ";
    v20 = 2112;
    v21 = v9;
    if (v7)
      v17 = CFSTR("Ok");
    v22 = 2112;
    v23 = v15;
    v24 = 2112;
    v25 = v17;
    _os_log_impl(&dword_23FFBA000, v13, OS_LOG_TYPE_INFO, "%s[%@], Finished DB cleanup in: %@ seconds with status: %@", (uint8_t *)&v18, 0x2Au);

  }
}

- (void)restartLowLatencyMiLo:(BOOL)a3
{
  void *v5;
  _QWORD v6[4];
  BOOL v7;

  -[IRServiceContainer queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__IRServiceContainer_restartLowLatencyMiLo___block_invoke;
  v6[3] = &__block_descriptor_33_e28_v16__0__IRServiceContainer_8l;
  v7 = a3;
  IRDispatchAsyncWithStrongSelf(v5, self, v6);

}

void __44__IRServiceContainer_restartLowLatencyMiLo___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "policyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "restartLowLatencyMiLo:", *(unsigned __int8 *)(a1 + 32));

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = *(unsigned __int8 *)(a1 + 32);
    v8 = v5;
    objc_msgSend(v6, "numberWithBool:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315650;
    v11 = "#service-container, ";
    v12 = 2112;
    v13 = v4;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Finished restartLowLatencyMiLo: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (id)getStatistics
{
  void *v3;
  id v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  v12 = 0;
  -[IRServiceContainer queue](self, "queue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __35__IRServiceContainer_getStatistics__block_invoke;
  v6[3] = &unk_251043F90;
  v6[4] = &v7;
  IRDispatchAsyncAndWaitWithStrongSelf(v3, self, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __35__IRServiceContainer_getStatistics__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a2, "policyManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "getStatistics");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v10 = 136315650;
    v11 = "#service-container, ";
    v12 = 2112;
    v13 = v7;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Getting statistics: %@", (uint8_t *)&v10, 0x20u);
  }

}

- (void)clearStatistics
{
  id v3;

  -[IRServiceContainer queue](self, "queue");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  IRDispatchAsyncWithStrongSelf(v3, self, &__block_literal_global_38);

}

void __37__IRServiceContainer_clearStatistics__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = 136315394;
    v7 = "#service-container, ";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_23FFBA000, v4, OS_LOG_TYPE_INFO, "%s[%@], Clearing statistics", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(v2, "policyManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearStatistics");

}

- (void)setServiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_serviceIdentifier, a3);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (IRAVOutputDeviceProvider)avOutputDeviceProvider
{
  return self->_avOutputDeviceProvider;
}

- (void)setAvOutputDeviceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, a3);
}

- (IRBiomeProvider)biomeProvider
{
  return self->_biomeProvider;
}

- (void)setBiomeProvider:(id)a3
{
  objc_storeStrong((id *)&self->_biomeProvider, a3);
}

- (IRRapportProvider)rapportProvider
{
  return self->_rapportProvider;
}

- (void)setRapportProvider:(id)a3
{
  objc_storeStrong((id *)&self->_rapportProvider, a3);
}

- (IRProximityProvider)proximityProvider
{
  return self->_proximityProvider;
}

- (void)setProximityProvider:(id)a3
{
  objc_storeStrong((id *)&self->_proximityProvider, a3);
}

- (IRPersistenceManager)persistenceManager
{
  return self->_persistenceManager;
}

- (void)setPersistenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_persistenceManager, a3);
}

- (IRDisplayMonitor)displayMonitor
{
  return self->_displayMonitor;
}

- (void)setDisplayMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_displayMonitor, a3);
}

- (IRAVOutputContextController)audioAVOutputContextController
{
  return self->_audioAVOutputContextController;
}

- (void)setAudioAVOutputContextController:(id)a3
{
  objc_storeStrong((id *)&self->_audioAVOutputContextController, a3);
}

- (void)setPolicyManager:(id)a3
{
  objc_storeStrong((id *)&self->_policyManager, a3);
}

- (void)setServiceStore:(id)a3
{
  objc_storeStrong((id *)&self->_serviceStore, a3);
}

- (IRMiLoProvider)miloProvider
{
  return self->_miloProvider;
}

- (void)setMiloProvider:(id)a3
{
  objc_storeStrong((id *)&self->_miloProvider, a3);
}

- (IRServiceLogPrefix)serviceLogPrefix
{
  return self->_serviceLogPrefix;
}

- (void)setServiceLogPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLogPrefix, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_serviceLogPrefix, 0);
  objc_storeStrong((id *)&self->_miloProvider, 0);
  objc_storeStrong((id *)&self->_serviceStore, 0);
  objc_storeStrong((id *)&self->_policyManager, 0);
  objc_storeStrong((id *)&self->_audioAVOutputContextController, 0);
  objc_storeStrong((id *)&self->_displayMonitor, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_proximityProvider, 0);
  objc_storeStrong((id *)&self->_rapportProvider, 0);
  objc_storeStrong((id *)&self->_biomeProvider, 0);
  objc_storeStrong((id *)&self->_avOutputDeviceProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_serviceIdentifier, 0);
}

- (void)policyManager:(id)a3 didSpotOnLocationCompleteForClientIds:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[IRServiceContainer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[IRServiceContainer delegate](self, "delegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "serviceContainer:didSpotOnLocationCompleteForClientIds:withError:", self, v8, v7);

}

- (void)policyManager:(id)a3 didUpdateBundlesWithSignificantInteractionPattern:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;

  v5 = a4;
  -[IRServiceContainer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  -[IRServiceContainer delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serviceContainer:didUpdateBundlesWithSignificantInteractionPattern:", self, v5);

}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Service init error - Service id unavailable] Cant initialize a new service container, service identifier does not exist in DB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Service init error - Couldnt inject relationships] Cant initialize a new service container, cant inject relationships", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)initWithServiceIdentifier:delegate:avOutputDeviceProvider:biomeProvider:rapportProvider:proximityProvider:persistenceManager:displayMonitor:audioAVOutputContextController:isLowLatencyMiLo:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Service init error - DB unavailable] Cant initialize a new service container, DB is not available", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Service save error] Could not save new service to DB", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - DB connect error] Could not connect to DB when creating a service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)createServiceWithClientIdentifier:serviceIdentifier:parameters:persistenceManager:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Unsupported service package] Cant create service for not supported service package", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Delete Service error] Could not delete service: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - Delete MiLo Service error] Couldnt delete MiLo service for token: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)deleteServiceWithToken:persistenceManager:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - DB connect on delete] [%@]: Could not connect to DB when deleting a service", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)exportDatabaseWithPersistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - export database error] failed to export database with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)exportDatabaseWithPersistenceManager:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint8_t v8[14];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a1;
  objc_msgSend(a2, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  v9 = a3;
  OUTLINED_FUNCTION_7(&dword_23FFBA000, v5, v7, "#service-container, [ErrorId - export database error] failed to remove existing file: %@ with error: %@", v8);

}

+ (void)exportDatabaseWithPersistenceManager:.cold.3()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = v0;
  OUTLINED_FUNCTION_7(&dword_23FFBA000, v1, (uint64_t)v1, "#service-container, [ErrorId - export database error] failed to create directory at %@ with error: %@", v2);
  OUTLINED_FUNCTION_4();
}

+ (void)exportDatabaseWithPersistenceManager:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - export database error] Could not connect to DB when exporting it", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)deleteDatabaseWithPersistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - DB delete error] Failed to delete database with error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)getServiceTokensForClientIdentifier:persistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - DB connection on get token for client] Could not connect to DB when getting service tokens for client identifier: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

+ (void)getServicesWithPersistenceManager:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0_0(&dword_23FFBA000, v0, v1, "#service-container, [ErrorId - DB connection on get token for client] Could not connect to DB when getting services", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
