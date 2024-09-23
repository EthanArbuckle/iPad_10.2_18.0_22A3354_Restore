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

  v22 = *MEMORY[0x24BDAC8D0];
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

      v9 = objc_alloc(MEMORY[0x24BDD1880]);
      v10 = objc_msgSend(v9, "initWithUUIDString:", *MEMORY[0x24BDD6E78]);
      identifier = v3->_identifier;
      v3->_identifier = (NSUUID *)v10;

      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
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
    v15 = (void *)MEMORY[0x227676638]();
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v21 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Software updates are not valid on this target", buf, 0xCu);

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
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  -[HMDSoftwareUpdateManager messageDispatcher](self, "messageDispatcher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD6E60];
  v10[0] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v5, self, v6, sel__handleStart_);

  v7 = *MEMORY[0x24BDD6E70];
  v9 = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerForMessage:receiver:policies:selector:", v7, self, v8, sel__handleStop_);

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

  v14[1] = *MEMORY[0x24BDAC8D0];
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
      v13 = *MEMORY[0x24BDD6E80];
      encodeRootObjectForIncomingXPCMessage(v9, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14[0] = v10;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
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
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke;
  block[3] = &unk_24E79B440;
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

  v3 = objc_alloc(MEMORY[0x24BE3F1B8]);
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

  v30[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1[4], "activeClients");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v29 = *MEMORY[0x24BDD6E80];
    encodeRootObjectForIncomingXPCMessage(a1[5], 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE3F1D0], "entitledMessageWithName:messagePayload:", *MEMORY[0x24BDD6E68], v5);
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
    v9 = MEMORY[0x24BDAC760];
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_14;
    v23[3] = &unk_24E797910;
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
    v19[3] = &unk_24E797938;
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
  v15 = (void *)MEMORY[0x227676638]();
  v16 = a1[4];
  HMFGetOSLogHandle();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v18;
    _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@Cannot handle start update, no active clients", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v15);
  if (a1[6])
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 48);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void))a1[6] + 2))();
    goto LABEL_7;
  }
LABEL_8:

}

void __58__HMDSoftwareUpdateManager_startUpdate_completionHandler___block_invoke_14(uint64_t a1, void *a2, void *a3)
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
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:description:reason:suggestion:underlyingError:", 23, 0, 0, 0, v8);
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

  v12 = *MEMORY[0x24BDAC8D0];
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v2 = (void *)MEMORY[0x227676638]();
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
      _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Client failed to respond to message: %@", (uint8_t *)&v8, 0x16u);

    }
    objc_autoreleasePoolPop(v2);
    if (*(_QWORD *)(a1 + 48))
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

+ (BOOL)isSupported
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE3F260], "productInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "productClass") == 6;

  return v3;
}

@end
