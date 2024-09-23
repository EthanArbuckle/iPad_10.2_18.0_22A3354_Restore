@implementation HMDModernMessagingXPCEventPublisher

- (HMDModernMessagingXPCEventPublisher)initWithTestClientsByMessageName:(id)a3
{
  id v4;
  HMDModernMessagingXPCEventPublisher *v5;
  uint64_t v6;
  NSDictionary *launchOnDemandClientBundleIDsByMessageName;
  uint64_t v8;
  NSMutableDictionary *tokensByClientBundleID;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)HMDModernMessagingXPCEventPublisher;
  v5 = -[HMDModernMessagingXPCEventPublisher init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    launchOnDemandClientBundleIDsByMessageName = v5->_launchOnDemandClientBundleIDsByMessageName;
    v5->_launchOnDemandClientBundleIDsByMessageName = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tokensByClientBundleID = v5->_tokensByClientBundleID;
    v5->_tokensByClientBundleID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

  }
  return v5;
}

- (HMDModernMessagingXPCEventPublisher)initWithLaunchOnDemandClientBundleIDsByMessageName:(id)a3
{
  id v4;
  HMDModernMessagingXPCEventPublisher *v5;
  uint64_t v6;
  NSDictionary *launchOnDemandClientBundleIDsByMessageName;
  uint64_t v8;
  NSMutableDictionary *tokensByClientBundleID;
  id v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *workQueue;
  void *v13;
  uint64_t v14;
  OS_xpc_event_publisher *xpcEventPublisher;
  HMDModernMessagingXPCEventPublisher *v17;
  HMDModernMessagingXPCEventPublisher *v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)HMDModernMessagingXPCEventPublisher;
  v5 = -[HMDModernMessagingXPCEventPublisher init](&v19, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    launchOnDemandClientBundleIDsByMessageName = v5->_launchOnDemandClientBundleIDsByMessageName;
    v5->_launchOnDemandClientBundleIDsByMessageName = (NSDictionary *)v6;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    tokensByClientBundleID = v5->_tokensByClientBundleID;
    v5->_tokensByClientBundleID = (NSMutableDictionary *)v8;

    HMDispatchQueueNameString();
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = dispatch_queue_create((const char *)objc_msgSend(v10, "UTF8String"), 0);
    workQueue = v5->_workQueue;
    v5->_workQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(CFSTR("com.apple.HMModernMessaging.launch"), "cString");
    -[HMDModernMessagingXPCEventPublisher workQueue](v5, "workQueue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_event_publisher_create();
    v14 = objc_claimAutoreleasedReturnValue();
    xpcEventPublisher = v5->_xpcEventPublisher;
    v5->_xpcEventPublisher = (OS_xpc_event_publisher *)v14;

    v18 = v5;
    xpc_event_publisher_set_handler();
    v17 = v18;
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();

  }
  return v5;
}

- (BOOL)hmmmIsBundleIDValidForLaunchOnDemand:(id)a3
{
  id v4;
  void *v5;
  id v6;
  char v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDModernMessagingXPCEventPublisher launchOnDemandClientBundleIDsByMessageName](self, "launchOnDemandClientBundleIDsByMessageName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __76__HMDModernMessagingXPCEventPublisher_hmmmIsBundleIDValidForLaunchOnDemand___block_invoke;
  v9[3] = &unk_24E78C9B0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_any:", v9);

  return v7;
}

- (void)_publishLaunchEventForBundleID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  HMDModernMessagingXPCEventPublisher *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  HMDModernMessagingXPCEventPublisher *v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDModernMessagingXPCEventPublisher tokensByClientBundleID](self, "tokensByClientBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "unsignedLongLongValue");
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543874;
      v17 = v11;
      v18 = 2048;
      v19 = v7;
      v20 = 2112;
      v21 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Firing HMMM launch-on-demand event for token %llu with bundleID: %@", (uint8_t *)&v16, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    xpc_event_publisher_fire();
  }
  else
  {
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v15;
      v18 = 2112;
      v19 = (uint64_t)v4;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Received launch on demand event for unsubscribed client with bundle ID: %@", (uint8_t *)&v16, 0x16u);

    }
    objc_autoreleasePoolPop(v12);
  }

}

- (void)publishLaunchEventForBundleID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDModernMessagingXPCEventPublisher workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __69__HMDModernMessagingXPCEventPublisher_publishLaunchEventForBundleID___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)_removeXPCSubscriberWithToken:(unint64_t)a3
{
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  HMDModernMessagingXPCEventPublisher *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[6];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__147550;
  v21 = __Block_byref_object_dispose__147551;
  v22 = 0;
  -[HMDModernMessagingXPCEventPublisher tokensByClientBundleID](self, "tokensByClientBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __69__HMDModernMessagingXPCEventPublisher__removeXPCSubscriberWithToken___block_invoke;
  v16[3] = &unk_24E7894D8;
  v16[4] = &v17;
  v16[5] = a3;
  v6 = (id)objc_msgSend(v5, "na_firstKeyPassingTest:", v16);

  v7 = v18[5] == 0;
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  if (v7)
  {
    HMFGetOSLogHandle();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v24 = v15;
      v25 = 2048;
      v26 = a3;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Discarding remove XPC subscriber request, no subscriber associated with token: %llu", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
  }
  else
  {
    HMFGetOSLogHandle();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v18[5];
      *(_DWORD *)buf = 138543874;
      v24 = v11;
      v25 = 2048;
      v26 = a3;
      v27 = 2112;
      v28 = v12;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Removing XPC Subscriber with token: %llu, bundleID: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v8);
    -[HMDModernMessagingXPCEventPublisher tokensByClientBundleID](v9, "tokensByClientBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", 0, v18[5]);

  }
  _Block_object_dispose(&v17, 8);

}

- (void)_addXPCSubscriberWithToken:(unint64_t)a3 xpcEvent:(id)a4
{
  id v6;
  const char *string;
  void *v8;
  BOOL v9;
  void *v10;
  HMDModernMessagingXPCEventPublisher *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMDModernMessagingXPCEventPublisher *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  string = xpc_dictionary_get_string(v6, "bundleID");
  if (string)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCString:", string);
    v9 = -[HMDModernMessagingXPCEventPublisher hmmmIsBundleIDValidForLaunchOnDemand:](self, "hmmmIsBundleIDValidForLaunchOnDemand:", v8);
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v9)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543874;
        v23 = v14;
        v24 = 2048;
        v25 = a3;
        v26 = 2112;
        v27 = v8;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Received HMMM subscriber request for token: %llu, bundle id: %@", (uint8_t *)&v22, 0x20u);

      }
      objc_autoreleasePoolPop(v10);
      v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", a3);
      -[HMDModernMessagingXPCEventPublisher tokensByClientBundleID](v11, "tokensByClientBundleID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, v8);

    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = 138543618;
        v23 = v21;
        v24 = 2112;
        v25 = (unint64_t)v8;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Ignoring HMMM subscriber request from unknown bundle id: %@", (uint8_t *)&v22, 0x16u);

      }
      objc_autoreleasePoolPop(v10);
    }

  }
  else
  {
    v17 = (void *)MEMORY[0x227676638]();
    v18 = self;
    HMFGetOSLogHandle();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = 138543618;
      v23 = v20;
      v24 = 2048;
      v25 = a3;
      _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_ERROR, "%{public}@Ignoring HMMM subscriber request from token %llu without bundleID", (uint8_t *)&v22, 0x16u);

    }
    objc_autoreleasePoolPop(v17);
  }

}

- (NSDictionary)launchOnDemandClientBundleIDsByMessageName
{
  return self->_launchOnDemandClientBundleIDsByMessageName;
}

- (OS_xpc_event_publisher)xpcEventPublisher
{
  return self->_xpcEventPublisher;
}

- (void)setXpcEventPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_xpcEventPublisher, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSMutableDictionary)tokensByClientBundleID
{
  return self->_tokensByClientBundleID;
}

- (void)setTokensByClientBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_tokensByClientBundleID, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokensByClientBundleID, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_xpcEventPublisher, 0);
  objc_storeStrong((id *)&self->_launchOnDemandClientBundleIDsByMessageName, 0);
}

BOOL __69__HMDModernMessagingXPCEventPublisher__removeXPCSubscriberWithToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a2;
  v7 = objc_msgSend(a3, "unsignedLongLongValue");
  v8 = *(_QWORD *)(a1 + 40);
  if (v7 == v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);

  return v7 == v8;
}

uint64_t __69__HMDModernMessagingXPCEventPublisher_publishLaunchEventForBundleID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_publishLaunchEventForBundleID:", *(_QWORD *)(a1 + 40));
}

uint64_t __76__HMDModernMessagingXPCEventPublisher_hmmmIsBundleIDValidForLaunchOnDemand___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:");
}

void __90__HMDModernMessagingXPCEventPublisher_initWithLaunchOnDemandClientBundleIDsByMessageName___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;

  v7 = a4;
  if (a2 == 1)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_removeXPCSubscriberWithToken:", a3);
    goto LABEL_5;
  }
  if (!a2)
  {
    v8 = v7;
    objc_msgSend(*(id *)(a1 + 32), "_addXPCSubscriberWithToken:xpcEvent:", a3, v7);
LABEL_5:
    v7 = v8;
  }

}

void __90__HMDModernMessagingXPCEventPublisher_initWithLaunchOnDemandClientBundleIDsByMessageName___block_invoke_2(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 1024;
    v11 = a2;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_ERROR, "%{public}@HMMM XPC Publisher experienced error with code: %d", (uint8_t *)&v8, 0x12u);

  }
  objc_autoreleasePoolPop(v4);
}

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_147568);
  return (id)shared_sharedHandler;
}

void __45__HMDModernMessagingXPCEventPublisher_shared__block_invoke()
{
  HMDModernMessagingXPCEventPublisher *v0;
  void *v1;

  v0 = -[HMDModernMessagingXPCEventPublisher initWithLaunchOnDemandClientBundleIDsByMessageName:]([HMDModernMessagingXPCEventPublisher alloc], "initWithLaunchOnDemandClientBundleIDsByMessageName:", &unk_24E971A28);
  v1 = (void *)shared_sharedHandler;
  shared_sharedHandler = (uint64_t)v0;

}

@end
