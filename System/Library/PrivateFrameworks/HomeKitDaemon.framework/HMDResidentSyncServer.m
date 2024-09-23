@implementation HMDResidentSyncServer

- (HMDResidentSyncServer)initWithHome:(id)a3 codingModel:(id)a4 dispatcher:(id)a5 residentDeviceManager:(id)a6 notificationCenter:(id)a7 persistence:(id)a8 dataSource:(id)a9 logEventSubmitter:(id)a10
{
  id v17;
  id v18;
  HMDResidentSyncServer *v19;
  HMDResidentSyncServer *v20;
  uint64_t v21;
  NSPersistentStore *store;
  void *v23;
  void *v24;
  uint64_t v25;
  NSPersistentHistoryToken *storeExemplarToken;
  HMDManagedObjectContext *context;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  HMDResidentSyncServer *v33;
  objc_super v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x24BDAC8D0];
  v31 = a5;
  v30 = a6;
  v17 = a8;
  v29 = a9;
  v18 = a10;
  v34.receiver = self;
  v34.super_class = (Class)HMDResidentSyncServer;
  v19 = -[HMDResidentSyncController initWithHome:codingModel:notificationCenter:persistence:](&v34, sel_initWithHome_codingModel_notificationCenter_persistence_, a3, a4, a7, v17);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_dispatcher, a5);
    objc_storeStrong((id *)&v20->_residentDeviceManager, a6);
    objc_msgSend(v17, "workingStore", v29, v30, v31);
    v21 = objc_claimAutoreleasedReturnValue();
    store = v20->_store;
    v20->_store = (NSPersistentStore *)v21;

    objc_msgSend(v17, "coordinator");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v35[0] = v20->_store;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v35, 1);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "currentPersistentHistoryTokenFromStores:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    storeExemplarToken = v20->_storeExemplarToken;
    v20->_storeExemplarToken = (NSPersistentHistoryToken *)v25;

    objc_storeStrong((id *)&v20->_logEventSubmitter, a10);
    objc_storeStrong((id *)&v20->_dataSource, a9);
    context = v20->super._context;
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = __143__HMDResidentSyncServer_initWithHome_codingModel_dispatcher_residentDeviceManager_notificationCenter_persistence_dataSource_logEventSubmitter___block_invoke;
    v32[3] = &unk_24E79C240;
    v33 = v20;
    -[HMDManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v32);

  }
  return v20;
}

- (id)start
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  HMFMessageDispatcher *dispatcher;
  void *v8;
  void *v9;
  HMFMessageDispatcher *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", WeakRetained, 5, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDMutableRemoteMessagePolicy, "defaultSecurePolicy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRoles:", objc_msgSend(v5, "roles") | 8);
  v6 = (void *)objc_msgSend(v5, "copy");
  dispatcher = self->_dispatcher;
  v16[0] = v4;
  v16[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](dispatcher, "registerForMessage:receiver:policies:selector:", CFSTR("HMDFetchHomeDataMessage"), self, v8, sel__handleFetchHomeData_);

  if (shouldEnableInternalDebugInterfaces__hmf_once_t32 != -1)
    dispatch_once(&shouldEnableInternalDebugInterfaces__hmf_once_t32, &__block_literal_global_743);
  if (shouldEnableInternalDebugInterfaces__hmf_once_v33)
  {
    +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_dispatcher;
    objc_msgSend(CFSTR("HMDFetchHomeDataMessage"), "stringByAppendingString:", CFSTR(".Debug"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v15, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMFMessageDispatcher registerForMessage:receiver:policies:selector:](v10, "registerForMessage:receiver:policies:selector:", v11, self, v12, sel__handleFetchHomeData_);

  }
  -[NSNotificationCenter addObserver:selector:name:object:](self->super._notificationCenter, "addObserver:selector:name:object:", self, sel_handlePrimaryResidentChanged_, CFSTR("HMDResidentDeviceManagerUpdatePrimaryResidentNotification"), self->_residentDeviceManager);
  -[NSNotificationCenter addObserver:selector:name:object:](self->super._notificationCenter, "addObserver:selector:name:object:", self, sel_handleReassertAsTheCurrentPrimaryResident_, CFSTR("HMDResidentDeviceManagerReassertAsCurrentPrimaryNotification"), self->_residentDeviceManager);
  -[HMDResidentSyncServer handlePrimaryResidentState:](self, -[HMDResidentDeviceManager isCurrentDeviceConfirmedPrimaryResident](self->_residentDeviceManager, "isCurrentDeviceConfirmedPrimaryResident"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)stop
{
  -[HMFMessageDispatcher deregisterReceiver:](self->_dispatcher, "deregisterReceiver:", self);
  -[NSNotificationCenter removeObserver:](self->super._notificationCenter, "removeObserver:", self);
}

- (void)interceptRemoteResidentRequest:(id)a3 proceed:(id)a4
{
  id v6;
  void (**v7)(id, void *);
  void *v8;
  char v9;
  id WeakRetained;
  char v11;
  void *v12;
  HMDResidentSyncServer *v13;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  id v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  HMDResidentSyncServer *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (void (**)(id, void *))a4;
  v27 = 0;
  v28 = 0;
  v29 = 0;
  objc_msgSend(v6, "dictionaryForKey:", CFSTR("$HMDRS$"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMDResidentSyncServer _parseRequestDetails:fromDictionary:message:]((uint64_t)self, (uint64_t)&v27, v8, v6);

  if ((v9 & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
    v11 = objc_msgSend(WeakRetained, "isCurrentDeviceConfirmedPrimaryResident");

    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    if ((v11 & 1) != 0)
    {
      HMFGetOSLogHandle();
      v14 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v15;
        v32 = 2112;
        v33 = v16;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Intercepting remote resident request: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      v17 = (void *)objc_msgSend(v6, "mutableCopy");
      v21[0] = MEMORY[0x24BDAC760];
      v21[1] = 3254779904;
      v21[2] = __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke;
      v21[3] = &unk_24E78A438;
      v22 = v6;
      v23 = v13;
      v24 = v27;
      v25 = v28;
      v26 = v29;
      objc_msgSend(v17, "setResponseHandler:", v21);
      v7[2](v7, v17);

    }
    else
    {
      HMFGetOSLogHandle();
      v18 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "shortDescription");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v31 = v19;
        v32 = 2112;
        v33 = v20;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Rejecting resident request %@: not the primary resident", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3202);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "respondWithError:", v17);
    }

  }
}

- (void)_handleFetchHomeData:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  id v8;
  id v9;
  id v10[2];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  objc_msgSend(v4, "messagePayload");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HMDResidentSyncServer _parseRequestDetails:fromDictionary:message:]((uint64_t)self, (uint64_t)v10, v5, v4);

  if ((v6 & 1) != 0)
  {
    v9 = 0;
    -[HMDResidentSyncServer _generateHomeDataWithRequest:message:useCachedToken:error:]((uint64_t)self, (uint64_t)v10, v4, 1, &v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v9;
    if (v7)
      objc_msgSend(v4, "respondWithPayload:", v7);
    else
      objc_msgSend(v4, "respondWithError:", v8);

  }
}

- (int64_t)currentToken:(id *)a3 andHistory:(id *)a4 fromToken:(id)a5 limit:(int64_t)a6 error:(id *)a7
{
  id v12;
  HMDManagedObjectContext *context;
  id v14;
  int64_t v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  int64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t v45;

  v12 = a5;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__156018;
  v40 = __Block_byref_object_dispose__156019;
  v41 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__156018;
  v34 = __Block_byref_object_dispose__156019;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__156018;
  v28 = __Block_byref_object_dispose__156019;
  v29 = 0;
  context = self->super._context;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __71__HMDResidentSyncServer_currentToken_andHistory_fromToken_limit_error___block_invoke;
  v17[3] = &unk_24E78A470;
  v19 = &v42;
  v20 = &v36;
  v17[4] = self;
  v21 = &v30;
  v14 = v12;
  v22 = &v24;
  v23 = a6;
  v18 = v14;
  -[HMDManagedObjectContext performBlockAndWait:](context, "performBlockAndWait:", v17);
  if (a3)
    *a3 = objc_retainAutorelease((id)v37[5]);
  if (a4)
    *a4 = objc_retainAutorelease((id)v31[5]);
  if (a7)
    *a7 = objc_retainAutorelease((id)v25[5]);
  v15 = v43[3];

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);

  return v15;
}

- (void)handlePersistentStoreChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  HMDManagedObjectContext *context;
  _QWORD v12[5];
  id v13;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BDBB588]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  if (v8)
  {
    -[NSPersistentStore identifier](self->_store, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqualToString:", v8);

    if (v10)
    {
      context = self->super._context;
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __54__HMDResidentSyncServer_handlePersistentStoreChanged___block_invoke;
      v12[3] = &unk_24E79C268;
      v12[4] = self;
      v13 = v4;
      -[HMDManagedObjectContext performBlock:](context, "performBlock:", v12);

    }
  }

}

- (void)handlePrimaryResidentChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id WeakRetained;
  id v9;
  _QWORD v10[5];

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HMDResidentDeviceManagerResidentDeviceNotificationKey"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  if (objc_msgSend(v7, "isCurrentDevice"))
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->super._home);
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__HMDResidentSyncServer_handlePrimaryResidentChanged___block_invoke;
    v10[3] = &unk_24E79BD80;
    v10[4] = self;
    objc_msgSend(WeakRetained, "doFullImportWithCompletion:", v10);

  }
  else
  {
    v9 = -[HMDResidentSyncServer handlePrimaryResidentState:](self, objc_msgSend(v7, "isCurrentDevice"));
  }

}

- (void)handleReassertAsTheCurrentPrimaryResident:(id)a3
{
  id v3;

  v3 = -[HMDResidentSyncServer handlePrimaryResidentState:](self, -[HMDResidentDeviceManager isCurrentDevicePrimaryResident](self->_residentDeviceManager, "isCurrentDevicePrimaryResident", a3));
}

- (id)decodeToken:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  HMDResidentSyncServer *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDResidentSyncServer;
  -[HMDResidentSyncController decodeToken:error:](&v14, sel_decodeToken_error_, v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_8;
  if (!-[NSPersistentHistoryToken compareToken:error:](self->_storeExemplarToken, "compareToken:error:", v7, 0))
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v16 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Client-provided change token is incompatible with our store, ignoring it", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  v8 = v7;
LABEL_9:

  return v8;
}

- (HMMLogEventSubmitting)logEventSubmitter
{
  return self->_logEventSubmitter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logEventSubmitter, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_currentToken, 0);
  objc_storeStrong((id *)&self->_storeExemplarToken, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_residentDeviceManager, 0);
  objc_storeStrong((id *)&self->_dispatcher, 0);
}

- (_QWORD)handlePrimaryResidentState:(_QWORD *)a1
{
  uint64_t v2;
  _QWORD v4[5];
  char v5;

  if (a1)
  {
    v2 = a1[4];
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __52__HMDResidentSyncServer_handlePrimaryResidentState___block_invoke;
    v4[3] = &unk_24E798DB8;
    v4[4] = a1;
    v5 = a2;
    objc_msgSend(MEMORY[0x24BE3F180], "inContext:perform:", v2, v4);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

uint64_t __52__HMDResidentSyncServer_handlePrimaryResidentState___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "persistentStoreCoordinator");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *MEMORY[0x24BDBB510];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObserver:name:object:", *(_QWORD *)(a1 + 32), *MEMORY[0x24BDBB510], v2);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), sel_handlePersistentStoreChanged_, v3, v2);
    v5 = *(_QWORD *)(a1 + 32);
    v20 = 0;
    -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v5, &v20, 0, 0, 0, 0);
    v6 = v20;
    v7 = v20;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v6);
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 1;
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      HMDShortDescriptionForToken(v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v22 = v11;
      v23 = 2114;
      v24 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Became primary resident, will broadcast Home change notification with token %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDResidentSyncServer _notifyDevicesOfHomeChangeWithToken:changes:](*(id **)(a1 + 32), v7, 0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");

  }
  else
  {
    v13 = (void *)MEMORY[0x227676638](v4);
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v16;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_DEBUG, "%{public}@Not acting as the primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    v17 = *(_QWORD *)(a1 + 32);
    v18 = *(void **)(v17 + 96);
    *(_QWORD *)(v17 + 96) = 0;

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) = 0;
  }

  return 1;
}

- (uint64_t)_currentToken:(_QWORD *)a3 andHistory:(void *)a4 fromToken:(uint64_t)a5 limit:(_QWORD *)a6 error:
{
  id v8;
  void *v9;
  BOOL v10;
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  uint64_t v37;
  void *v39;
  void *v40;
  id v41;
  NSObject *v42;
  void *v43;
  unint64_t v47;
  uint64_t v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  unint64_t v53;
  void *v54;
  _QWORD v55[2];

  v55[1] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  if (!a1)
  {
    v37 = 0;
    goto LABEL_35;
  }
  v47 = a5;
  if (v8)
    v10 = a5 < 0;
  else
    v10 = 1;
  v11 = !v10;
  v48 = *MEMORY[0x24BDD0B88];
  while (1)
  {
    objc_msgSend(MEMORY[0x24BDBB710], "fetchHistoryAfterToken:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    v14 = (v11 & 1) != 0 ? 5 : 3;
    objc_msgSend(v12, "setResultType:", v14);
    v55[0] = *(_QWORD *)(a1 + 72);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v55, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAffectedStores:", v15);

    objc_msgSend(MEMORY[0x24BDBB728], "fetchRequest");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)MEMORY[0x24BDD1758];
    HMDWorkingContextNameForHomeUUID(*(void **)(a1 + 16));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("contextName"), v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setPredicate:", v19);

    if ((v11 & 1) != 0)
    {
      if (v47)
        objc_msgSend(v13, "setFetchBatchSize:", v47);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("self"), 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v54, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setSortDescriptors:", v21);

      objc_msgSend(v16, "setFetchLimit:", 1);
      objc_msgSend(v13, "setFetchLimit:", 1);
    }
    objc_msgSend(v13, "setFetchRequest:", v16);
    v22 = *(void **)(a1 + 32);
    v49 = 0;
    objc_msgSend(v22, "executeRequest:error:", v13, &v49);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v49;
    v25 = v24;
    if (v23)
      break;
    if (!v9)
      goto LABEL_28;
    objc_msgSend(v24, "domain");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v26, "isEqualToString:", v48) & 1) == 0)
    {

LABEL_28:
      v33 = (void *)MEMORY[0x227676638]();
      v34 = (id)a1;
      HMFGetOSLogHandle();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v51 = v36;
        v52 = 2114;
        v53 = (unint64_t)v25;
        _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch store history: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v33);
      if (a6)
      {
        HMDSanitizeCoreDataError(v25);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }

      v32 = 0;
LABEL_33:
      v37 = 0;
      goto LABEL_34;
    }
    v27 = objc_msgSend(v25, "code");

    if (v27 != 134301)
      goto LABEL_28;
    v28 = (void *)MEMORY[0x227676638]();
    v29 = (id)a1;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v31;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_DEBUG, "%{public}@Provided change token was expired, ignoring it", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v28);

    v11 = 0;
    v9 = 0;
  }
  objc_msgSend(v23, "result");
  v32 = (id)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v32, "count"))
  {
    if (v9)
    {
      v37 = 1;
    }
    else
    {
      if (!a6)
      {
        v9 = 0;
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:", -1, CFSTR("Unable to fetch current transaction"), 0, 0);
      v9 = 0;
      v37 = 0;
      *a6 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_34;
  }
  if (a2)
  {
    if ((v11 & 1) != 0)
      objc_msgSend(v32, "lastObject");
    else
      objc_msgSend(v32, "firstObject");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "token");
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    if ((v11 & 1) == 0)
    {

      goto LABEL_52;
    }

  }
  else if ((v11 & 1) == 0)
  {
    goto LABEL_52;
  }
  if (!v47 || objc_msgSend(v32, "count") <= v47)
  {
    if (a3)
    {
      v32 = objc_retainAutorelease(v32);
      *a3 = v32;
    }
    v37 = 2;
    goto LABEL_34;
  }
  v40 = (void *)MEMORY[0x227676638]();
  v41 = (id)a1;
  HMFGetOSLogHandle();
  v42 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v51 = v43;
    v52 = 2048;
    v53 = v47;
    _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_INFO, "%{public}@Not processing history, would need to process more than %zd transactions", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v40);
LABEL_52:
  v37 = 3;
LABEL_34:

LABEL_35:
  return v37;
}

- (void)_notifyDevicesOfHomeChangeWithToken:(void *)a3 changes:
{
  id v5;
  void *v6;
  void *v7;
  id *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id *v26;
  uint64_t i;
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  HMDResidentSyncCodingContext *v34;
  void *v35;
  HMDResidentSyncCodingContext *v36;
  id *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id *v41;
  NSObject *v42;
  void *v43;
  HMDRemoteMessage *v44;
  double v45;
  void *v46;
  void *v47;
  HMDRemoteMessage *v48;
  void *v49;
  id *v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  id *v56;
  NSObject *v57;
  void *v58;
  id v59;
  void *v60;
  id v61;
  void *context;
  id v63;
  void *v64;
  id obj;
  char v66;
  id *v67;
  uint64_t v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  id v74;
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  id v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v63 = a3;
  if (a1)
  {
    v67 = a1;
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "encodeToken:error:", v5, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("etag"));
      objc_msgSend(a1[8], "primaryResidentGenerationID");
      v8 = a1;
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "UUIDString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("resgen"));

      objc_msgSend(v8[8], "primaryResidentSelectionTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("seltimestamp"));

      if (objc_msgSend(v6, "count"))
        v12 = (void *)objc_msgSend(v6, "copy");
      else
        v12 = 0;

      a1 = v67;
    }
    else
    {
      v12 = 0;
    }
    v13 = a1[2];
    v14 = a1[4];
    v74 = 0;
    +[_MKFModel modelWithModelID:context:error:](_MKFHome, "modelWithModelID:context:error:", v13, v14, &v74);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v74;
    if (v15)
    {
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v17 = v15;
      objc_msgSend(v17, "users");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "allObjects");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = (void *)objc_msgSend(v19, "mutableCopy");

      +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v19) = objc_msgSend(v21, "isRestrictedGuestEnabled");

      if ((_DWORD)v19)
      {
        objc_msgSend(v17, "guests");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "allObjects");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObjectsFromArray:", v23);

      }
      v24 = (void *)objc_msgSend(v20, "copy");

      v69 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      if (!v69)
      {

        goto LABEL_43;
      }
      v59 = v16;
      v60 = v15;
      v61 = v5;
      v66 = 0;
      v68 = *(_QWORD *)v71;
      v25 = v63;
      v26 = v67;
      v64 = v12;
      obj = v24;
      while (1)
      {
        for (i = 0; i != v69; ++i)
        {
          if (*(_QWORD *)v71 != v68)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          if (v25)
          {
            v29 = v28;
            v30 = v25;
            v31 = v17;
            if (!v29)
              _HMFPreconditionFailure();
            v32 = v31;
            v33 = v17;
            v34 = -[HMDResidentSyncCodingContext initWithTargetUser:targetIsResident:targetDeviceAddress:]([HMDResidentSyncCodingContext alloc], "initWithTargetUser:targetIsResident:targetDeviceAddress:", v29, 0, 0);
            if (objc_msgSend(v26[3], "isRelevantChanges:withRootObject:conditions:userContext:", v30, v32, 0, v34))
            {
              -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v26, v29, 0);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_32;
            }
            if (objc_msgSend(v29, "isOwner"))
            {
              v36 = -[HMDResidentSyncCodingContext initWithTargetUser:targetIsResident:targetDeviceAddress:]([HMDResidentSyncCodingContext alloc], "initWithTargetUser:targetIsResident:targetDeviceAddress:", v29, 1, 0);
              if (objc_msgSend(v26[3], "isRelevantChanges:withRootObject:conditions:userContext:", v30, v32, 0, v36))
              {
                context = (void *)MEMORY[0x227676638]();
                v37 = v26;
                HMFGetOSLogHandle();
                v38 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  HMFGetLogIdentifier();
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543362;
                  v77 = v39;
                  _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_INFO, "%{public}@Broadcasting Home change notification to residents only", buf, 0xCu);

                  v25 = v63;
                }

                objc_autoreleasePoolPop(context);
                -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v37, v29, 1);
                v35 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_31:
                v12 = v64;
                v26 = v67;
LABEL_32:

                v17 = v33;
                if (!v35)
                  goto LABEL_34;
LABEL_33:
                v44 = [HMDRemoteMessage alloc];
                v45 = HMDHomeDataChangedMessageTimeout();
                objc_msgSend(v17, "modelID");
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v46, "UUIDString");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v66 = 1;
                v48 = -[HMDRemoteMessage initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:collapseID:](v44, "initWithName:qualityOfService:destination:payload:type:timeout:secure:restriction:sendOptions:collapseID:", CFSTR("HMDHomeDataChangedMessage"), -1, v35, v12, 3, 1, v45, -1, 1, v47);

                v26 = v67;
                objc_msgSend(v67[7], "sendMessage:", v48);

                goto LABEL_34;
              }

            }
            v40 = (void *)MEMORY[0x227676638]();
            v41 = v26;
            HMFGetOSLogHandle();
            v42 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              HMFGetLogIdentifier();
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v77 = v43;
              v78 = 2112;
              v79 = v29;
              _os_log_impl(&dword_2218F0000, v42, OS_LOG_TYPE_DEBUG, "%{public}@Skipping notifying user %@ of home change because it is not relevant", buf, 0x16u);

              v25 = v63;
            }

            objc_autoreleasePoolPop(v40);
            v35 = 0;
            goto LABEL_31;
          }
          -[HMDResidentSyncServer _destinationForUser:restrictToResidentCapable:](v26, v28, 0);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          if (v35)
            goto LABEL_33;
LABEL_34:

        }
        v69 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
        if (!v69)
        {

          v15 = v60;
          v5 = v61;
          v16 = v59;
          if ((v66 & 1) != 0 && isInternalBuild())
          {
            objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "summary");
            v50 = v26;
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v51, CFSTR("HMDGeneratedHomeDataChangedSummaryNotificationKey"));

            objc_msgSend(v17, "modelID");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v52, CFSTR("HMDGeneratedHomeDataChangedHomeUUIDNotificationKey"));

            v53 = v50[5];
            v54 = (void *)objc_msgSend(v49, "copy");
            logAndPostNotificationWithNotificationCenter(v53, CFSTR("HMDGeneratedHomeDataChangedNotification"), v50, v54);

          }
          goto LABEL_43;
        }
      }
    }
    v55 = (void *)MEMORY[0x227676638]();
    v56 = a1;
    HMFGetOSLogHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v77 = v58;
      v78 = 2114;
      v79 = v16;
      _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch home with error: %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v55);
LABEL_43:

  }
}

- (HMDRemoteAccountMessageDestination)_destinationForUser:(uint64_t)a3 restrictToResidentCapable:
{
  id v5;
  void *v6;
  id WeakRetained;
  void *v8;
  HMDRemoteAccountMessageDestination *v9;
  void *v10;
  id *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  HMDRemoteAccountMessageDestination *v20;
  void *v21;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  objc_msgSend(v5, "accountHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 1);
    v8 = WeakRetained;
    if (WeakRetained && (_DWORD)a3)
    {
      objc_msgSend(WeakRetained, "destinationForEnabledResidents");
      v9 = (HMDRemoteAccountMessageDestination *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x227676638]();
      v11 = a1;
      HMFGetOSLogHandle();
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (v9)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = 138543362;
          v24 = v14;
          _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Residents only broadcast of Home Data Changed notification is utilizing bulk send API", (uint8_t *)&v23, 0xCu);

        }
        objc_autoreleasePoolPop(v10);
        goto LABEL_15;
      }
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543362;
        v24 = v19;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Bulk send destination invalid, residents only broadcast of Home Data Changed notification is falling back to account destination", (uint8_t *)&v23, 0xCu);

      }
      objc_autoreleasePoolPop(v10);
    }
    v20 = [HMDRemoteAccountMessageDestination alloc];
    objc_msgSend(a1, "messageTargetUUID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HMDRemoteAccountMessageDestination initWithTarget:handle:multicast:](v20, "initWithTarget:handle:multicast:", v21, v6, 1);

    -[HMDRemoteAccountMessageDestination setRestrictToResidentCapable:](v9, "setRestrictToResidentCapable:", a3);
LABEL_15:

    goto LABEL_16;
  }
  v15 = (void *)MEMORY[0x227676638]();
  v16 = a1;
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543618;
    v24 = v18;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Skipping notifying user %{public}@ of home change because the account handle is missing", (uint8_t *)&v23, 0x16u);

  }
  objc_autoreleasePoolPop(v15);
  v9 = 0;
LABEL_16:

  return v9;
}

void __54__HMDResidentSyncServer_handlePrimaryResidentChanged___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isCurrentDeviceConfirmedPrimaryResident") & 1) != 0)
  {
    if (v3)
    {
      v4 = (void *)MEMORY[0x227676638]();
      v5 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138543618;
        v14 = v7;
        v15 = 2114;
        v16 = v3;
        _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@Full import for home failed with error: %{public}@", (uint8_t *)&v13, 0x16u);

      }
      objc_autoreleasePoolPop(v4);
    }
    v8 = -[HMDResidentSyncServer handlePrimaryResidentState:](*(_QWORD **)(a1 + 32), 1);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "postNotificationName:object:userInfo:", CFSTR("HMDHomeDataReadyAfterBecomingPrimaryNotification"), *(_QWORD *)(a1 + 32), 0);
  }
  else
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543362;
      v14 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@We are not the primary resident anymore.", (uint8_t *)&v13, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
  }

}

void __54__HMDResidentSyncServer_handlePersistentStoreChanged___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  const char *v18;
  NSObject *v19;
  os_log_type_t v20;
  uint32_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  HMDManagedObjectCodingChangeSet *v31;
  _BOOL4 v32;
  void *v33;
  id v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint8_t buf[4];
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  __int16 v56;
  void *v57;
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 88))
  {
    v3 = *(id *)(v2 + 96);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x24BDBB4B0]);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
    v7 = v6;

    if (!v7 || (objc_msgSend(*(id *)(a1 + 32), "changeToken:isAheadOf:", v7, v3) & 1) != 0)
    {
      v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "maximumTransactionsForStoreChange");
      v9 = *(_QWORD *)(a1 + 32);
      v48 = 0;
      v49 = v7;
      v10 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v9, &v49, &v48, v3, v8, 0);
      v11 = v49;
      v12 = v49;

      v13 = v48;
      if (!v10)
      {
LABEL_34:

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "reset");
        return;
      }
      if (v10 == 1)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v51 = v17;
          v18 = "%{public}@Not broadcasting Home change notification, no new transactions.";
          v19 = v16;
          v20 = OS_LOG_TYPE_DEBUG;
          v21 = 12;
LABEL_25:
          _os_log_impl(&dword_2218F0000, v19, v20, v18, buf, v21);

          goto LABEL_26;
        }
        goto LABEL_26;
      }
      objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v11);
      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "isCurrentDeviceConfirmedPrimaryResident") & 1) == 0)
      {
        v14 = (void *)MEMORY[0x227676638]();
        v15 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v13, "count");
          *(_DWORD *)buf = 138543618;
          v51 = v17;
          v52 = 2048;
          v53 = v39;
          v18 = "%{public}@Not broadcasting Home change notification, no longer the primary resident (processed %tu transactions)";
          v19 = v16;
          v20 = OS_LOG_TYPE_INFO;
          v21 = 22;
          goto LABEL_25;
        }
LABEL_26:

        objc_autoreleasePoolPop(v14);
        goto LABEL_34;
      }
      if (v13)
      {
        v31 = -[HMDManagedObjectCodingChangeSet initWithCodingModel:context:transactions:]([HMDManagedObjectCodingChangeSet alloc], "initWithCodingModel:context:transactions:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), v13);
        v32 = -[HMDManagedObjectCodingChangeSet isEmpty](v31, "isEmpty");
        v33 = (void *)MEMORY[0x227676638]();
        v34 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v35 = objc_claimAutoreleasedReturnValue();
        v36 = v35;
        if (v32)
        {
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v38 = objc_msgSend(v13, "count");
            *(_DWORD *)buf = 138543618;
            v51 = v37;
            v52 = 2048;
            v53 = v38;
            _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_INFO, "%{public}@Not broadcasting Home change notification, no syncable changes (processed %tu transactions)", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v33);
          goto LABEL_33;
        }
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v47 = v33;
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v45 = objc_msgSend(v13, "count");
          HMDShortDescriptionForToken(v12);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDManagedObjectCodingChangeSet summary](v31, "summary");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "shortDescriptionForChangeSet");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v51 = v42;
          v52 = 2048;
          v53 = v45;
          v54 = 2114;
          v55 = v43;
          v56 = 2114;
          v57 = v44;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Found syncable changes (processed %tu transactions), will broadcast Home change notification with token %{public}@. Changes: %{public}@", buf, 0x2Au);

          v33 = v47;
        }
      }
      else
      {
        v33 = (void *)MEMORY[0x227676638]();
        v34 = *(id *)(a1 + 32);
        HMFGetOSLogHandle();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          HMDShortDescriptionForToken(v12);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v51 = v40;
          v52 = 2048;
          v53 = v8;
          v54 = 2114;
          v55 = v41;
          _os_log_impl(&dword_2218F0000, v36, OS_LOG_TYPE_DEFAULT, "%{public}@Assuming syncable changes (more than %tu transactions), will broadcast Home change notification with token %{public}@", buf, 0x20u);

        }
        v31 = 0;
      }

      objc_autoreleasePoolPop(v33);
      -[HMDResidentSyncServer _notifyDevicesOfHomeChangeWithToken:changes:](*(id **)(a1 + 32), v12, v31);
LABEL_33:

      goto LABEL_34;
    }
    v26 = (void *)MEMORY[0x227676638]();
    v27 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      HMDShortDescriptionForToken(v7);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v51 = v29;
      v52 = 2112;
      v53 = (uint64_t)v30;
      _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@Not broadcasting Home change notification, provided token is not ahead: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v26);

  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v23 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v51 = v25;
      _os_log_impl(&dword_2218F0000, v24, OS_LOG_TYPE_DEBUG, "%{public}@Ignoring persistent store change, not the primary resident", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v22);
  }
}

void __71__HMDResidentSyncServer_currentToken_andHistory_fromToken_limit_error___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  id v11;
  id obj;

  v2 = *(_QWORD *)(a1[7] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = *(_QWORD *)(a1[8] + 8);
  v11 = *(id *)(v4 + 40);
  obj = v3;
  v5 = a1[4];
  v6 = (void *)a1[5];
  v7 = a1[10];
  v8 = *(_QWORD *)(a1[9] + 8);
  v10 = *(id *)(v8 + 40);
  v9 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](v5, &obj, &v11, v6, v7, &v10);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v4 + 40), v11);
  objc_storeStrong((id *)(v8 + 40), v10);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = v9;
}

- (uint64_t)_parseRequestDetails:(void *)a3 fromDictionary:(void *)a4 message:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  id v38;
  NSObject *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  if (a1)
  {
    if (!v7)
    {
      v13 = (void *)MEMORY[0x227676638]();
      v14 = (id)a1;
      HMFGetOSLogHandle();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543618;
        v44 = v16;
        v45 = 2112;
        v46 = v17;
        _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: missing resident sync details", (uint8_t *)&v43, 0x16u);

      }
      objc_autoreleasePoolPop(v13);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "respondWithError:", v9);
      goto LABEL_24;
    }
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("schema"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithMajorVersion:minorVersion:updateVersion:", 0, 0, 0);
      v19 = *(id *)a2;
      *(_QWORD *)a2 = v18;

      *(_QWORD *)(a2 + 8) = 1;
      goto LABEL_13;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithVersionString:", v9);
      if (v10)
      {
        v11 = v10;
        objc_storeStrong((id *)a2, v10);
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("opts"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          *(_QWORD *)(a2 + 8) = objc_msgSend(v12, "unsignedIntegerValue");

LABEL_13:
          objc_msgSend(v7, "hmf_dataForKey:", CFSTR("etag"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
          {
            objc_msgSend((id)a1, "decodeToken:error:", v20, 0);
            v21 = objc_claimAutoreleasedReturnValue();
            v22 = *(void **)(a2 + 16);
            *(_QWORD *)(a2 + 16) = v21;
          }
          else
          {
            v22 = *(void **)(a2 + 16);
            *(_QWORD *)(a2 + 16) = 0;
          }

          a1 = 1;
          goto LABEL_25;
        }
        v37 = (void *)MEMORY[0x227676638]();
        v38 = (id)a1;
        HMFGetOSLogHandle();
        v39 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "shortDescription");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = 138543618;
          v44 = v40;
          v45 = 2112;
          v46 = v41;
          _os_log_impl(&dword_2218F0000, v39, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid request options", (uint8_t *)&v43, 0x16u);

        }
        objc_autoreleasePoolPop(v37);
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 22);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "respondWithError:", v42);

LABEL_24:
        a1 = 0;
LABEL_25:

        goto LABEL_26;
      }
      v30 = (void *)MEMORY[0x227676638]();
      v31 = (id)a1;
      HMFGetOSLogHandle();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543618;
        v44 = v33;
        v45 = 2112;
        v46 = v34;
        _os_log_impl(&dword_2218F0000, v32, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid schema version", (uint8_t *)&v43, 0x16u);

      }
      objc_autoreleasePoolPop(v30);
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = 3;
    }
    else
    {
      v23 = (void *)MEMORY[0x227676638]();
      v24 = (id)a1;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "shortDescription");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = 138543618;
        v44 = v26;
        v45 = 2112;
        v46 = v27;
        _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_ERROR, "%{public}@Rejecting request %@: invalid schema version", (uint8_t *)&v43, 0x16u);

      }
      objc_autoreleasePoolPop(v23);
      v28 = (void *)MEMORY[0x24BDD1540];
      v29 = 22;
    }
    objc_msgSend(v28, "hmErrorWithCode:", v29);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "respondWithError:", v35);

    goto LABEL_24;
  }
LABEL_26:

  return a1;
}

- (id)_generateHomeDataWithRequest:(void *)a3 message:(int)a4 useCachedToken:(_QWORD *)a5 error:
{
  id v9;
  double v10;
  double v11;
  id v12;
  BOOL v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  HMDManagedObjectCodingChangeSet *v27;
  void *v28;
  id v29;
  id v30;
  id WeakRetained;
  void *v32;
  void *v33;
  HMDHomeKitVersion *v34;
  char v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  HMDResidentSyncCodingContext *v60;
  id v61;
  NSObject *v62;
  void *v63;
  int v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  char v71;
  uint64_t v72;
  void *v73;
  id v74;
  NSObject *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  id v83;
  NSObject *v84;
  void *v85;
  void *v86;
  void *v87;
  id v88;
  HMDResidentSyncCodingContext *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  HMDManagedObjectCodingChangeSet *v93;
  void *v94;
  uint64_t v95;
  id v96;
  void *v97;
  id v98;
  NSObject *v99;
  void *v100;
  void *v101;
  int v102;
  uint64_t v103;
  double v104;
  double v105;
  id v106;
  NSObject *v107;
  _BOOL4 v108;
  void *v109;
  uint64_t v110;
  id v111;
  uint64_t v112;
  void *v113;
  uint64_t v114;
  void *v115;
  uint64_t v116;
  void *v117;
  void *v118;
  void *v119;
  void *v121;
  void *v122;
  void *v123;
  NSObject *v124;
  void *v125;
  id v126;
  void *v127;
  id v128;
  void *v129;
  id v130;
  id v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  HMDResidentSyncCodingContext *v138;
  id v139;
  void *v140;
  id v141;
  id v142;
  id v143;
  void *v144;
  void *v145;
  void *context;
  void *contexta;
  void *contextb;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  HMDManagedObjectCodingChangeSet *v153;
  HMDManagedObjectCodingChangeSet *v154;
  id v155;
  id v156;
  char v157;
  id v158;
  id v159;
  id v160;
  id v161;
  _QWORD v162[3];
  _QWORD v163[3];
  uint8_t buf[4];
  void *v165;
  __int16 v166;
  uint64_t v167;
  __int16 v168;
  double v169;
  __int16 v170;
  double v171;
  __int16 v172;
  void *v173;
  _QWORD v174[2];
  _QWORD v175[2];
  _QWORD v176[2];
  _QWORD v177[2];
  const __CFString *v178;
  void *v179;
  const __CFString *v180;
  _QWORD v181[4];

  v181[1] = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  if (!a1)
  {
    v22 = 0;
    goto LABEL_113;
  }
  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  v11 = v10;
  v12 = *(id *)(a1 + 96);
  if (v12)
    v13 = a4 == 0;
  else
    v13 = 1;
  if (!v13 && (objc_msgSend((id)a1, "changeToken:isAheadOf:", v12, *(_QWORD *)(a2 + 16)) & 1) == 0)
  {
    v23 = (void *)MEMORY[0x227676638]();
    v24 = (id)a1;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v165 = v26;
      _os_log_impl(&dword_2218F0000, v25, OS_LOG_TYPE_DEBUG, "%{public}@Provided token is up to date with cached token, home data not modified", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v23);
    v180 = CFSTR("response");
    v181[0] = &unk_24E96BEB8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v181, &v180, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_112;
  }
  v160 = 0;
  v161 = 0;
  v14 = -[HMDResidentSyncServer _currentToken:andHistory:fromToken:limit:error:](a1, &v161, &v160, *(void **)(a2 + 16), objc_msgSend(*(id *)(a1 + 104), "maximumTransactionsForSparseUpdate"), a5);
  v15 = v161;
  v16 = v160;
  v17 = v16;
  if (v14)
  {
    if (v14 == 1)
    {
      v18 = (void *)MEMORY[0x227676638]();
      v19 = (id)a1;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v165 = v21;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEBUG, "%{public}@No history transactions since the provided token, home data not modified", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v178 = CFSTR("response");
      v179 = &unk_24E96BEB8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v179, &v178, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_111;
    }
    if (v16)
      v27 = -[HMDManagedObjectCodingChangeSet initWithCodingModel:context:transactions:]([HMDManagedObjectCodingChangeSet alloc], "initWithCodingModel:context:transactions:", *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), v16);
    else
      v27 = 0;
    v159 = 0;
    objc_msgSend((id)a1, "encodeToken:error:", v15, &v159);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v159;
    v30 = v29;
    if (!v28)
    {
      if (a5)
      {
        v30 = objc_retainAutorelease(v29);
        v22 = 0;
        *a5 = v30;
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_110;
    }
    v151 = v28;
    v153 = v27;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(v9, "userForHome:", WeakRetained);
    v152 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = v153;
    if (_os_feature_enabled_impl() && objc_msgSend(v152, "isRestrictedGuest"))
    {
      objc_msgSend(v9, "remoteSourceDevice");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v149 = v32;
      if (v32)
      {
        context = v17;
        v141 = v15;
        objc_msgSend(v32, "version");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[HMDHomeKitVersion initWithVersionString:]([HMDHomeKitVersion alloc], "initWithVersionString:", CFSTR("12.0"));
        v35 = objc_msgSend(v33, "isAtLeastVersion:", v34);

        if ((v35 & 1) != 0)
        {

          v15 = v141;
          v17 = context;
          v27 = v153;
          goto LABEL_25;
        }
        v65 = (void *)MEMORY[0x227676638]();
        v66 = (id)a1;
        HMFGetOSLogHandle();
        v67 = objc_claimAutoreleasedReturnValue();
        v27 = v153;
        if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
        {
          HMFGetLogIdentifier();
          v145 = v65;
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v149, "version");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v165 = v68;
          v166 = 2112;
          v167 = (uint64_t)v69;
          v168 = 2112;
          v169 = *(double *)&v149;
          v170 = 2112;
          v171 = *(double *)&v9;
          _os_log_impl(&dword_2218F0000, v67, OS_LOG_TYPE_DEBUG, "%{public}@Not sending home data to Restricted Guest with version: %@, device: %@, message: %@", buf, 0x2Au);

          v65 = v145;
        }

        objc_autoreleasePoolPop(v65);
        v176[0] = CFSTR("response");
        v176[1] = CFSTR("etag");
        v177[0] = &unk_24E96BEB8;
        v177[1] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v177, v176, 2);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v141;
        v17 = context;
      }
      else
      {
        contextb = (void *)MEMORY[0x227676638]();
        v61 = (id)a1;
        HMFGetOSLogHandle();
        v62 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v165 = v144;
          v166 = 2112;
          v167 = (uint64_t)v9;
          _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine source device, not generating home data for message: %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(contextb);
        if (a5)
        {
          objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
          v22 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v28 = v151;
      }

LABEL_109:
LABEL_110:

      goto LABEL_111;
    }
LABEL_25:
    if (v27 && -[HMDManagedObjectCodingChangeSet isEmpty](v27, "isEmpty"))
    {
      v36 = (void *)MEMORY[0x227676638]();
      v37 = (id)a1;
      HMFGetOSLogHandle();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v39 = v17;
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v165 = v40;
        _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@No syncable changes since the provided token, home data not modified", buf, 0xCu);

        v17 = v39;
      }

      objc_autoreleasePoolPop(v36);
      v174[0] = CFSTR("response");
      v174[1] = CFSTR("etag");
      v28 = v151;
      v175[0] = &unk_24E96BEB8;
      v175[1] = v151;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v175, v174, 2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v153;
      goto LABEL_109;
    }
    v150 = v9;
    v41 = *(_QWORD *)(a1 + 16);
    v42 = *(_QWORD *)(a1 + 32);
    v158 = v30;
    +[_MKFModel modelWithModelID:context:error:](_MKFHome, "modelWithModelID:context:error:", v41, v42, &v158);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v143 = v158;

    v44 = v43;
    if (!v43)
    {
      v9 = v150;
      if (a5)
      {
        HMDSanitizeCoreDataError(v143);
        v22 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22 = 0;
      }
      goto LABEL_108;
    }
    contexta = v17;
    v45 = v150;
    v136 = v43;
    v139 = v43;
    v46 = objc_loadWeakRetained((id *)(a1 + 8));
    v135 = v45;
    objc_msgSend(v45, "matchingRemoteIdentityUserForHome:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    v142 = v15;
    v137 = v47;
    if (!v47)
    {
      v55 = (void *)MEMORY[0x227676638]();
      v56 = (id)a1;
      HMFGetOSLogHandle();
      v57 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v135, "shortDescription");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v165 = v58;
        v166 = 2112;
        v167 = (uint64_t)v59;
        _os_log_impl(&dword_2218F0000, v57, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine remote user for '%@'", buf, 0x16u);

        v15 = v142;
      }

      objc_autoreleasePoolPop(v55);
      if (a5)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
        v60 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v60 = 0;
      }
      v17 = contexta;
      v27 = v153;
      v28 = v151;
      v44 = v136;
LABEL_70:

      v138 = v60;
      if (!v60)
      {
        v22 = 0;
        v9 = v150;
LABEL_107:

LABEL_108:
        v30 = v143;
        goto LABEL_109;
      }
      v130 = objc_alloc_init(MEMORY[0x24BDBCEC8]);
      +[HMDStructuredWriter writerIntoOPACKData:](HMDStructuredWriter, "writerIntoOPACKData:");
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v157 = 0;
      v78 = *(void **)a2;
      objc_msgSend((id)a1, "schemaVersion");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v80 = objc_msgSend(v78, "compare:", v79);

      if (v80 == -1)
      {
        -[HMDResidentSyncServer _createResponseAdapterForRequest:writer:forceFullResponse:]((void **)a2, v77, &v157);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        if (v81 != v77)
        {
          v82 = (void *)MEMORY[0x227676638]();
          v83 = (id)a1;
          HMFGetOSLogHandle();
          v84 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v133 = v82;
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            v86 = *(void **)a2;
            HMFBooleanToString();
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            v165 = v85;
            v166 = 2112;
            v167 = (uint64_t)v86;
            v168 = 2112;
            v169 = *(double *)&v87;
            _os_log_impl(&dword_2218F0000, v84, OS_LOG_TYPE_INFO, "%{public}@Using adapters for client version %@ (forceFullResponse=%@)", buf, 0x20u);

            v82 = v133;
          }

          objc_autoreleasePoolPop(v82);
          v88 = v81;

          v77 = v88;
          v27 = v153;
          v44 = v136;
        }

        v28 = v151;
      }
      v89 = v138;
      if (v27)
      {
        -[HMDResidentSyncCodingContext targetUser](v138, "targetUser");
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v90, "databaseID");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v91, "objectID");
        v92 = objc_claimAutoreleasedReturnValue();
        v93 = v27;
        v94 = (void *)v92;
        v155 = 0;
        v156 = 0;
        v95 = -[HMDManagedObjectCodingChangeSet changeScopeForObjectWithID:attributeKeys:relationshipKeys:](v93, "changeScopeForObjectWithID:attributeKeys:relationshipKeys:", v92, &v156, &v155);
        v96 = v156;
        v128 = v155;

        if (v95 == 3 || objc_msgSend(v96, "containsObject:", CFSTR("privilege")))
        {
          v97 = (void *)MEMORY[0x227676638]();
          v98 = (id)a1;
          HMFGetOSLogHandle();
          v99 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v165 = v100;
            _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_INFO, "%{public}@Change includes user privilege. Forcing full update", buf, 0xCu);

          }
          objc_autoreleasePoolPop(v97);
          v157 = 1;
          v44 = v136;
        }

        v27 = v153;
        v28 = v151;
        v89 = v138;
      }
      -[HMDResidentSyncCodingContext targetUser](v89, "targetUser");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "isRestrictedGuest");

      if (v102)
      {
        v157 = 1;
        v17 = contexta;
      }
      else
      {
        v17 = contexta;
        if (!v157)
          goto LABEL_89;
      }

      v27 = 0;
LABEL_89:
      v15 = v142;
      v134 = v77;
      if ((objc_msgSend(*(id *)(a1 + 24), "encodeRootObject:withWriter:changes:conditions:userContext:", v139, v77, v27, 0, v89) & 1) == 0)
      {
        if (a5)
        {
          objc_msgSend(v77, "error");
          v22 = 0;
          *a5 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v22 = 0;
        }
        v9 = v150;
        v118 = v130;
        goto LABEL_106;
      }
      v103 = objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
      v105 = v104 - v11;
      v140 = (void *)MEMORY[0x227676638](v103);
      v106 = (id)a1;
      HMFGetOSLogHandle();
      v107 = objc_claimAutoreleasedReturnValue();
      v108 = os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT);
      v154 = v27;
      if (v27)
      {
        if (v108)
        {
          HMFGetLogIdentifier();
          v109 = (void *)objc_claimAutoreleasedReturnValue();
          v110 = objc_msgSend(contexta, "count");
          v111 = v130;
          v112 = objc_msgSend(v130, "length");
          objc_msgSend(v135, "shortDescription");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544386;
          v165 = v109;
          v166 = 2048;
          v167 = v110;
          v15 = v142;
          v168 = 2048;
          v169 = *(double *)&v112;
          v170 = 2048;
          v171 = v105;
          v172 = 2112;
          v173 = v113;
          _os_log_impl(&dword_2218F0000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@Generated sparse home data (%tu transactions, %tu bytes) in %.3lf seconds for %@", buf, 0x34u);

          v44 = v136;
          v114 = 2;
          v9 = v150;
LABEL_105:

          objc_autoreleasePoolPop(v140);
          v162[0] = CFSTR("response");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", v114);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v163[0] = v119;
          v163[1] = v111;
          v118 = v111;
          v162[1] = CFSTR("data");
          v162[2] = CFSTR("etag");
          v28 = v151;
          v163[2] = v151;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v163, v162, 3);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          v17 = contexta;
          v27 = v154;
LABEL_106:

          goto LABEL_107;
        }
        v114 = 2;
        v9 = v150;
      }
      else
      {
        v9 = v150;
        if (v108)
        {
          HMFGetLogIdentifier();
          v115 = (void *)objc_claimAutoreleasedReturnValue();
          v111 = v130;
          v116 = objc_msgSend(v130, "length");
          objc_msgSend(v135, "shortDescription");
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v165 = v115;
          v166 = 2048;
          v167 = v116;
          v15 = v142;
          v168 = 2048;
          v169 = v105;
          v170 = 2112;
          v171 = *(double *)&v117;
          _os_log_impl(&dword_2218F0000, v107, OS_LOG_TYPE_DEFAULT, "%{public}@Generated full home data (%tu bytes) in %.3lf seconds for %@", buf, 0x2Au);

          v114 = 1;
          goto LABEL_105;
        }
        v114 = 1;
      }
      v111 = v130;
      goto LABEL_105;
    }
    objc_msgSend(v47, "uuid");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = *(void **)(a1 + 32);
    v50 = v48;
    v51 = v49;
    +[_MKFModel modelWithModelID:context:](_MKFUser, "modelWithModelID:context:", v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = v52;
    if (v52)
    {
      v54 = v52;
    }
    else
    {
      +[HMDCoreData featuresDataSource](HMDCoreData, "featuresDataSource");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "isRestrictedGuestEnabled");

      if (v64)
      {
        +[_MKFModel modelWithModelID:context:](_MKFGuest, "modelWithModelID:context:", v50, v51);
        v54 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v54 = 0;
      }
      v15 = v142;
    }

    v132 = v54;
    if (v54)
    {
      objc_msgSend(v54, "home");
      v70 = (id)objc_claimAutoreleasedReturnValue();
      if (v70 == v139)
      {
        v71 = objc_msgSend(v54, "isResidentSyncParticipant");

        if ((v71 & 1) != 0)
        {
          if ((*(_BYTE *)(a2 + 8) & 1) != 0)
            v72 = objc_msgSend(v132, "isOwner");
          else
            v72 = 0;
          v44 = v136;
          objc_msgSend(v135, "remoteSourceDevice");
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v121, "deviceAddress");
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          if (v122)
          {
            v60 = -[HMDResidentSyncCodingContext initWithTargetUser:targetIsResident:targetDeviceAddress:]([HMDResidentSyncCodingContext alloc], "initWithTargetUser:targetIsResident:targetDeviceAddress:", v132, v72, v122);
            v17 = contexta;
          }
          else
          {
            v123 = (void *)MEMORY[0x227676638]();
            v131 = (id)a1;
            HMFGetOSLogHandle();
            v124 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v129 = v123;
              v125 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v135, "shortDescription");
              v126 = v15;
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v165 = v125;
              v166 = 2112;
              v167 = (uint64_t)v127;
              _os_log_impl(&dword_2218F0000, v124, OS_LOG_TYPE_ERROR, "%{public}@Unable to determine device address for '%@'", buf, 0x16u);

              v15 = v126;
              v44 = v136;

              v123 = v129;
            }

            objc_autoreleasePoolPop(v123);
            v17 = contexta;
            if (a5)
            {
              objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
              v60 = 0;
              *a5 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v60 = 0;
            }
          }
          v27 = v153;

          v28 = v151;
          goto LABEL_69;
        }
      }
      else
      {

      }
    }
    v73 = (void *)MEMORY[0x227676638]();
    v74 = (id)a1;
    HMFGetOSLogHandle();
    v75 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v165 = v76;
      v166 = 2114;
      v167 = (uint64_t)v47;
      _os_log_impl(&dword_2218F0000, v75, OS_LOG_TYPE_ERROR, "%{public}@Unable to find active MKFUser for %{public}@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v73);
    if (a5)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 10);
      v60 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v60 = 0;
    }
    v17 = contexta;
    v27 = v153;
    v28 = v151;
    v44 = v136;
LABEL_69:

    goto LABEL_70;
  }
  v22 = 0;
LABEL_111:

LABEL_112:
  objc_msgSend(*(id *)(a1 + 32), "reset");
LABEL_113:

  return v22;
}

- (HMDBufferingStructureDataFilter)_createResponseAdapterForRequest:(void *)a1 writer:(void *)a2 forceFullResponse:(_BYTE *)a3
{
  HMDBufferingStructureDataFilter *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  HMDBufferingStructureDataFilter *v9;
  HMDBufferingStructureDataFilter *v10;

  v5 = a2;
  v6 = *a1;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F2A8]), "initWithMajorVersion:minorVersion:updateVersion:", 1, 1, 0);
  v8 = objc_msgSend(v6, "compare:", v7);

  if (v8 == -1)
  {
    if (a3)
      *a3 = 1;
    v9 = v5;
    v5 = -[HMDBufferingStructureDataFilter initWithUnderlyingWriter:block:]([HMDBufferingStructureDataFilter alloc], "initWithUnderlyingWriter:block:", v9, &__block_literal_global_15631);

  }
  v10 = v5;

  return v10;
}

void __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t (*v18)(id *);
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "respondWithError:", v5);
  }
  else
  {
    v8 = (void *)MEMORY[0x24BE3F180];
    v16 = MEMORY[0x24BDAC760];
    v18 = __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke_2;
    v19 = &unk_24E78A400;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(void **)(a1 + 48);
    v11 = *(_QWORD *)(v9 + 32);
    v17 = 3254779904;
    v20 = v9;
    v12 = v10;
    v13 = *(_QWORD *)(a1 + 56);
    v14 = *(void **)(a1 + 64);
    v23 = v12;
    v24 = v13;
    v25 = v14;
    v21 = *(id *)(a1 + 32);
    v22 = v6;
    objc_msgSend(v8, "inContext:perform:", v11, &v16);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "respondWithOutcomeOf:", v15, v16, v17, v18, v19, v20);

  }
}

uint64_t __64__HMDResidentSyncServer_interceptRemoteResidentRequest_proceed___block_invoke_2(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v2 = (uint64_t)(a1 + 7);
  v3 = (uint64_t)a1[4];
  v4 = a1[5];
  v22 = 0;
  -[HMDResidentSyncServer _generateHomeDataWithRequest:message:useCachedToken:error:](v3, v2, v4, 0, &v22);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v22;
  v7 = (void *)MEMORY[0x227676638]();
  v8 = a1[4];
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v5)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v11;
      v25 = 2112;
      v26 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Responding to intercepted remote resident request: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    v13 = (void *)objc_msgSend(a1[6], "mutableCopy");
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v15;

    objc_msgSend(v19, "setObject:forKeyedSubscript:", v5, CFSTR("$HMDRS$"));
    objc_msgSend(v19, "copy");
    v20 = 1;
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[5], "shortDescription");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v24 = v16;
      v25 = 2114;
      v26 = v17;
      v27 = 2114;
      v28 = v6;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to fetch Home data changes for successfully handled message '%{public}@': %{public}@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v7);
    v18 = v6;
    if (v18)
    {
      v19 = v18;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmfUnspecifiedError");
      objc_claimAutoreleasedReturnValue();
      v19 = 0;
    }
    v20 = 2;
  }

  return v20;
}

void __143__HMDResidentSyncServer_initWithHome_codingModel_dispatcher_residentDeviceManager_notificationCenter_persistence_dataSource_logEventSubmitter___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  HMDResidentSyncController *v5;
  SEL v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
  objc_msgSend(MEMORY[0x24BDBB758], "currentQueryGenerationToken");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v3 = objc_msgSend(v1, "setQueryGenerationFromToken:error:", v2, &v11);
  v4 = v11;

  if ((v3 & 1) != 0)
  {

  }
  else
  {
    v5 = (HMDResidentSyncController *)_HMFPreconditionFailureWithFormat();
    -[HMDResidentSyncController initWithHome:codingModel:notificationCenter:persistence:](v5, v6, v7, v8, v9, v10);
  }
}

@end
