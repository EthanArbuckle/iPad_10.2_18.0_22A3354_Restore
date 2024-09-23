@implementation HMDSoftwareUpdateManager

- (HMDSoftwareUpdateManager)init
{
  HMDSoftwareUpdateManager *v3;
  id v4;
  const char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *clientQueue;
  id v9;
  uint64_t v10;
  NSUUID *identifier;
  uint64_t v12;
  NSHashTable *activeClients;
  HMDSoftwareUpdateManager *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (+[HMDSoftwareUpdateManager isSupported](HMDSoftwareUpdateManager, "isSupported"))
  {
    v19.receiver = self;
    v19.super_class = (Class)HMDSoftwareUpdateManager;
    v3 = -[HMDSoftwareUpdateManager init](&v19, sel_init);
    if (v3)
    {
      HMDispatchQueueNameString();
      v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v5 = (const char *)objc_msgSend(v4, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = dispatch_queue_create(v5, v6);
      clientQueue = v3->_clientQueue;
      v3->_clientQueue = (OS_dispatch_queue *)v7;

      v9 = objc_alloc(MEMORY[0x1E0CB3A28]);
      v10 = objc_msgSend(v9, "initWithUUIDString:", *MEMORY[0x1E0CB9D18]);
      identifier = v3->_identifier;
      v3->_identifier = (NSUUID *)v10;

      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v12 = objc_claimAutoreleasedReturnValue();
      activeClients = v3->_activeClients;
      v3->_activeClients = (NSHashTable *)v12;

      -[HMDSoftwareUpdateManager registerForMessages](v3, "registerForMessages");
    }
    self = v3;
    v14 = self;
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Software updates are not valid on this target", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    v14 = 0;
  }

  return v14;
}

- (id)messageDispatcher
{
  return +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
}

- (void)registerForMessages
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[HMDSoftwareUpdateManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x1E0CB9D00];
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v5, self, v6, sel__handleStart_);

  v7 = *MEMORY[0x1E0CB9D10];
  v13 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v7, self, v8, sel__handleStop_);

  v9 = *MEMORY[0x1E0CB9D20];
  v12[0] = v4;
  +[HMDConfigurationMessagePolicy policyWithOperationTypes:](HMDConfigurationMessagePolicy, "policyWithOperationTypes:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v9, self, v11, sel__handleUpdateAvailableUpdate_);

}

- (void)_handleStart:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "transport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDSoftwareUpdateManager activeClients](self, "activeClients");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v5);

  }
  objc_msgSend(v4, "responseHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDSoftwareUpdateManager accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "softwareUpdate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v13 = *MEMORY[0x1E0CB9D28];
      encodeRootObjectForIncomingXPCMessage(v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }
    objc_msgSend(v4, "responseHandler");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, void *))v12)[2](v12, 0, v11);

  }
}

- (void)_handleStop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  id v8;

  v8 = a3;
  objc_msgSend(v8, "transport");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDSoftwareUpdateManager activeClients](self, "activeClients");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v4);

  }
  objc_msgSend(v8, "responseHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v8, "responseHandler");
    v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v7[2](v7, 0, 0);

  }
}

- (void)_handleUpdateAvailableUpdate:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  void *v10;
  HMDSoftwareUpdateManager *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDSoftwareUpdateManager *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  HMDSoftwareUpdateManager *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD, _QWORD);
  void *v29;
  HMDSoftwareUpdateManager *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  id v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDSoftwareUpdateManager accessory](self, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = *MEMORY[0x1E0CB9D28];
    objc_msgSend(v4, "nullForKey:", *MEMORY[0x1E0CB9D28]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = 0;
LABEL_4:
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __57__HMDSoftwareUpdateManager__handleUpdateAvailableUpdate___block_invoke;
      v34[3] = &unk_1E89C21C0;
      v35 = v4;
      v8 = v8;
      v36 = v8;
      objc_msgSend(v5, "updateSoftwareUpdate:completionHandler:", v8, v34);

      v9 = (void (**)(_QWORD, _QWORD, _QWORD))v35;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v4, "dataForKey:", v6);
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3710], "deserializeObjectWithData:allowedClass:frameworkClasses:", v9, objc_opt_class(), &unk_1E8B322E0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v8 = v15;
        if (objc_msgSend(v15, "downloadSize"))
        {

          goto LABEL_4;
        }
        v29 = (void *)MEMORY[0x1D17BA0A0]();
        v30 = self;
        HMFGetOSLogHandle();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v38 = v32;
          v39 = 2112;
          v40 = v8;
          _os_log_impl(&dword_1CD062000, v31, OS_LOG_TYPE_INFO, "%{public}@Invalid software update with download size 0 in message payload, %@", buf, 0x16u);

        }
        objc_autoreleasePoolPop(v29);
        objc_msgSend(v4, "responseHandler");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v33)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "responseHandler");
        v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        ((void (**)(_QWORD, void *, _QWORD))v28)[2](v28, v27, 0);
LABEL_22:

        goto LABEL_28;
      }
      v23 = (void *)MEMORY[0x1D17BA0A0]();
      v24 = self;
      HMFGetOSLogHandle();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v38 = v26;
        _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Invalid software update in message payload", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v23);
      objc_msgSend(v4, "responseHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
        goto LABEL_28;
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = 22;
    }
    else
    {
      v16 = (void *)MEMORY[0x1D17BA0A0]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "messagePayload");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v38 = v19;
        v39 = 2112;
        v40 = v20;
        _os_log_impl(&dword_1CD062000, v18, OS_LOG_TYPE_ERROR, "%{public}@Missing serialized software update from message payload: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v16);
      objc_msgSend(v4, "responseHandler");
      v8 = (id)objc_claimAutoreleasedReturnValue();

      if (!v8)
      {
        v9 = 0;
        goto LABEL_28;
      }
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v22 = 3;
    }
    objc_msgSend(v21, "hmErrorWithCode:", v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v28 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, _QWORD))v28)[2](v28, v27, 0);
    v8 = 0;
    goto LABEL_22;
  }
  v10 = (void *)MEMORY[0x1D17BA0A0]();
  v11 = self;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v13;
    _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Not configured, Missing current accessory", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v10);
  objc_msgSend(v4, "responseHandler");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 21);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "responseHandler");
    v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD))v9)[2](v9, v8, 0);
    goto LABEL_28;
  }
LABEL_29:

}

- (void)updateAvailableUpdate:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  HMDSoftwareUpdateManager *v9;

  v4 = a3;
  -[HMDSoftwareUpdateManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__HMDSoftwareUpdateManager_updateAvailableUpdate___block_invoke;
  v7[3] = &unk_1E89C2328;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)fetchAvailableUpdateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDSoftwareUpdateManager clientQueue](self, "clientQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E89C1D68;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)startUpdate:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMDSoftwareUpdateManager clientQueue](self, "clientQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke;
  block[3] = &unk_1E89C1B48;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (id)messageDestination
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDSoftwareUpdateManager messageTargetUUID](self, "messageTargetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithTarget:", v4);

  return v5;
}

- (HMDAppleMediaAccessory)accessory
{
  return (HMDAppleMediaAccessory *)objc_loadWeakRetained((id *)&self->_accessory);
}

- (void)setAccessory:(id)a3
{
  objc_storeWeak((id *)&self->_accessory, a3);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSHashTable)activeClients
{
  return self->_activeClients;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeClients, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_accessory);
}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  dispatch_time_t v12;
  NSObject *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[5];
  id v20;
  id v21;
  __int128 *v22;
  _QWORD v23[4];
  id v24;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v27;
  char v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "activeClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v29 = *MEMORY[0x1E0CB9D28];
    encodeRootObjectForIncomingXPCMessage(a1[5], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", *MEMORY[0x1E0CB9D08], v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "mutableCopy");

    objc_msgSend(a1[4], "messageDestination");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDestination:", v8);

    objc_msgSend(v7, "setTransport:", v3);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v27 = 0x2020000000;
    v28 = 0;
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_30;
    v23[3] = &unk_1E89BE9B0;
    p_buf = &buf;
    v24 = a1[6];
    objc_msgSend(v7, "setResponseHandler:", v23);
    objc_msgSend(a1[4], "messageDispatcher");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v7, "copy");
    objc_msgSend(v10, "sendMessage:completionHandler:", v11, 0);

    v12 = dispatch_time(0, 30000000000);
    objc_msgSend(a1[4], "clientQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2;
    v19[3] = &unk_1E89BE988;
    v22 = &buf;
    v19[4] = a1[4];
    v20 = v7;
    v21 = a1[6];
    v14 = v7;
    dispatch_after(v12, v13, v19);

    _Block_object_dispose(&buf, 8);
LABEL_7:

    goto LABEL_8;
  }
  v15 = (void *)MEMORY[0x1D17BA0A0]();
  v16 = a1[4];
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle start update, no active clients", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
LABEL_8:

}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v5 = a3;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (!*(_BYTE *)(v6 + 24) && *(_QWORD *)(a1 + 32))
  {
    v7 = v10;
    v8 = v7;
    if (v7 && (objc_msgSend(v7, "isHMError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 23, 0, 0, 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v6 + 24) = 1;

}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD block[5];
  id v21;
  id v22;
  __int128 *v23;
  _QWORD v24[5];
  id v25;
  __int128 *p_buf;
  id v27;
  id location;
  __int128 buf;
  uint64_t v30;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "activeClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0D285F8], "entitledMessageWithName:messagePayload:", *MEMORY[0x1E0CB9CF0], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(*(id *)(a1 + 32), "messageDestination");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDestination:", v6);

    objc_msgSend(v5, "setTransport:", v3);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v30 = 0x2020000000;
    v31 = 0;
    objc_initWeak(&location, *(id *)(a1 + 32));
    v7 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_24;
    v24[3] = &unk_1E89BE960;
    p_buf = &buf;
    v8 = *(id *)(a1 + 40);
    v24[4] = *(_QWORD *)(a1 + 32);
    v25 = v8;
    objc_copyWeak(&v27, &location);
    objc_msgSend(v5, "setResponseHandler:", v24);
    objc_msgSend(*(id *)(a1 + 32), "messageDispatcher");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v5, "copy");
    objc_msgSend(v9, "sendMessage:completionHandler:", v10, 0);

    v11 = dispatch_time(0, 30000000000);
    objc_msgSend(*(id *)(a1 + 32), "clientQueue");
    v12 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_29;
    block[3] = &unk_1E89BE988;
    v23 = &buf;
    v13 = *(void **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    v21 = v5;
    v22 = v13;
    v14 = v5;
    dispatch_after(v11, v12, block);

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    v15 = (void *)MEMORY[0x1D17BA0A0]();
    v16 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle fetch, no active clients", (uint8_t *)&buf, 0xCu);

    }
    objc_autoreleasePoolPop(v15);
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 48);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
  }

}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  id WeakRetained;
  void *v18;
  char v19;
  id v20;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *context;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) || !*(_QWORD *)(a1 + 40))
    goto LABEL_2;
  if (v5)
  {
    v8 = v5;
    if ((objc_msgSend(v8, "isHMError") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 23, 0, 0, 0, v8);
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v9;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    goto LABEL_2;
  }
  objc_msgSend(v6, "hmf_dataForKey:", *MEMORY[0x1E0CB9D28]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3710], "deserializeObjectWithData:allowedClass:frameworkClasses:", v10, objc_opt_class(), &unk_1E8B322F8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (!v11 || objc_msgSend(v11, "downloadSize"))
      goto LABEL_15;
    v13 = (void *)MEMORY[0x1D17BA0A0]();
    v14 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v16;
      v33 = 2112;
      v34 = v12;
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_ERROR, "%{public}@Fetch returned invalid update with download size 0: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v13);

  }
  v12 = 0;
LABEL_15:

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "accessory");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "softwareUpdate");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 && v18)
  {
    v19 = objc_msgSend(v12, "isEqual:", v26);
    context = (void *)MEMORY[0x1D17BA0A0]();
    v20 = WeakRetained;
    HMFGetOSLogHandle();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if ((v19 & 1) != 0)
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v32 = v23;
        v33 = 2112;
        v34 = v12;
        v35 = 2112;
        v36 = v26;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Fetch returned update, %@, matching existing update: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(context);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }
    else
    {
      if (v22)
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v32 = v24;
        v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Updating with software update: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(context);
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_27;
      v27[3] = &unk_1E89C0650;
      objc_copyWeak(&v30, (id *)(a1 + 56));
      v28 = v12;
      v29 = *(id *)(a1 + 40);
      objc_msgSend(v18, "updateSoftwareUpdate:completionHandler:", v28, v27);

      objc_destroyWeak(&v30);
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

LABEL_2:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;

}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x1D17BA0A0]();
    v3 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v8 = 138543618;
      v9 = v5;
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

void __70__HMDSoftwareUpdateManager_fetchAvailableUpdateWithCompletionHandler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = WeakRetained;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(a1 + 32);
    v11 = 138543874;
    v12 = v8;
    v13 = 2112;
    v14 = v9;
    v15 = 2112;
    v16 = v3;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Updated software update, %@, with error: %@", (uint8_t *)&v11, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  if (v3)
    v10 = 0;
  else
    v10 = *(_QWORD *)(a1 + 32);
  (*(void (**)(_QWORD, uint64_t, id))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v10, v3);

}

void __50__HMDSoftwareUpdateManager_updateAvailableUpdate___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D285F8];
  v3 = *MEMORY[0x1E0CB9D20];
  v11 = *MEMORY[0x1E0CB9D28];
  v4 = *(void **)(a1 + 32);
  if (v4)
    encodeRootObjectForIncomingXPCMessage(v4, 0);
  else
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitledMessageWithName:messagePayload:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "messageDestination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDestination:", v8);

  objc_msgSend(*(id *)(a1 + 40), "messageDispatcher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v9, "sendMessage:completionHandler:", v10, 0);

}

void __57__HMDSoftwareUpdateManager__handleUpdateAvailableUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "responseHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (v3)
    {
      v5 = 0;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "identifier");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v9 = *MEMORY[0x1E0CB9CF8];
        objc_msgSend(*(id *)(a1 + 40), "identifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "UUIDString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(*(id *)(a1 + 32), "responseHandler");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *))v8)[2](v8, v3, v5);

  }
}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x1E0D28690], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 6;

  return v3;
}

@end
