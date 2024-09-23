@implementation HDMCDaySummaryObserverQueryServer

- (BOOL)_shouldExecuteWhenProtectedDataIsUnavailable
{
  return 1;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t i;
  void *v16;
  NSObject *v17;
  void *v18;
  id v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  id v25;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v26.receiver = self;
  v26.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  -[HDQueryServer _queue_start](&v26, sel__queue_start);
  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDMCDaySummaryObserverQueryServer objectTypes](self, "objectTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v6, "readAuthorizationStatusesForTypes:error:", v7, &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;

  if (!v8)
  {
    -[HDQueryServer queryUUID](self, "queryUUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "client_deliverError:forQuery:", v9, v20);

    goto LABEL_19;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(v8, "allValues", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    v14 = 1;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        if ((v14 & 1) != 0)
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "canRead");
        else
          v14 = 0;
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v31, 16);
    }
    while (v12);

    if ((v14 & 1) == 0)
    {
      _HKInitializeLogging();
      v16 = (void *)*MEMORY[0x24BDD3030];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
      {
        v17 = v16;
        v18 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543618;
        v28 = v18;
        v29 = 2114;
        v30 = v8;
        v19 = v18;
        _os_log_impl(&dword_21961B000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Avoiding exposing health data due to missing authorization: %{public}@", buf, 0x16u);

      }
      goto LABEL_19;
    }
  }
  else
  {

  }
  if (self->_requiresUpdate)
  {
    -[HDMCDaySummaryObserverQueryServer _queue_deliverUpdate](self, "_queue_deliverUpdate");
    self->_requiresUpdate = 0;
  }
LABEL_19:

}

- (id)objectTypes
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  HKMCDaySummarySampleTypes();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (HDMCDaySummaryObserverQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 profileExtension:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  HDMCDaySummaryObserverQueryServer *v17;
  HDMCDaySummaryObserverQueryServer *v18;
  id v19;
  void *v20;
  uint64_t v21;
  _HKDelayedOperation *updateOperation;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v27.receiver = self;
  v27.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  v17 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v27, sel_initWithUUID_configuration_client_delegate_, v12, v13, v14, v15);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_profileExtension, a7);
    objc_initWeak(&location, v18);
    v19 = objc_alloc(MEMORY[0x24BDD41D0]);
    -[HDQueryServer queryQueue](v18, "queryQueue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __97__HDMCDaySummaryObserverQueryServer_initWithUUID_configuration_client_delegate_profileExtension___block_invoke;
    v24[3] = &unk_24DB21C40;
    objc_copyWeak(&v25, &location);
    v21 = objc_msgSend(v19, "initWithMode:clock:queue:delay:block:", 0, 1, v20, v24, 0.1);
    updateOperation = v18->_updateOperation;
    v18->_updateOperation = (_HKDelayedOperation *)v21;

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }

  return v18;
}

- (BOOL)_shouldListenForUpdates
{
  return 1;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  uint64_t v8;
  char v9;
  void *v10;
  uint64_t v11;
  char v12;
  BOOL v13;

  v6 = a4;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *MEMORY[0x24BDD3310];
  v9 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x24BDD3310]);

  if ((v9 & 1) != 0
    || (objc_msgSend(v6, "entitlements"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = *MEMORY[0x24BDD3300],
        v12 = objc_msgSend(v10, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x24BDD3300]),
        v10,
        (v12 & 1) != 0))
  {
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement: %@ for core apps or %@ for second-party access."), v8, v11);
    v13 = 0;
  }

  return v13;
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x24BDBD1A8];
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  HDMCDaySummaryObserverQueryServer *v17;
  id v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "profileExtensionWithIdentifier:", *MEMORY[0x24BE46AC8]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = -[HDMCDaySummaryObserverQueryServer initWithUUID:configuration:client:delegate:profileExtension:]([HDMCDaySummaryObserverQueryServer alloc], "initWithUUID:configuration:client:delegate:profileExtension:", v11, v12, v13, v14, v16);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hk_error:format:", 3, CFSTR("No profile extension found for %@"), objc_opt_class());
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

void __97__HDMCDaySummaryObserverQueryServer_initWithUUID_configuration_client_delegate_profileExtension___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_deliverUpdate");

}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[HDQueryServer queryQueue](self, "queryQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __57__HDMCDaySummaryObserverQueryServer_samplesAdded_anchor___block_invoke;
  v8[3] = &unk_24DB21C68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __57__HDMCDaySummaryObserverQueryServer_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating due to samples added: %@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "execute");
}

- (void)samplesOfTypesWereRemoved:(id)a3 anchor:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  -[HDQueryServer queryQueue](self, "queryQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__HDMCDaySummaryObserverQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke;
  v8[3] = &unk_24DB21C68;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(v6, v8);

}

uint64_t __70__HDMCDaySummaryObserverQueryServer_samplesOfTypesWereRemoved_anchor___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x24BDD3030];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3030], OS_LOG_TYPE_DEFAULT))
  {
    v3 = v2;
    v4 = (void *)objc_opt_class();
    v5 = v4;
    HKSensitiveLogItem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v4;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_21961B000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Updating due to samples removed of types: %@", (uint8_t *)&v8, 0x16u);

  }
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 208), "execute");
}

- (void)_queue_deliverUpdate
{
  void *v3;
  void *v4;
  id v5;

  -[HDQueryServer clientProxy](self, "clientProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "remoteObjectProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  -[HDQueryServer queryUUID](self, "queryUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client_deliverUpdateWithQueryUUID:", v4);

}

- (void)_queue_stop
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HDMCDaySummaryObserverQueryServer;
  -[HDQueryServer _queue_stop](&v3, sel__queue_stop);
  self->_requiresUpdate = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_updateOperation, 0);
  objc_storeStrong((id *)&self->_profileExtension, 0);
}

@end
