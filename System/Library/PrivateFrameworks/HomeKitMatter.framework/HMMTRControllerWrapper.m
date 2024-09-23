@implementation HMMTRControllerWrapper

- (HMMTRControllerParameters)startupParams
{
  return self->_startupParams;
}

- (MTRDeviceController)controller
{
  void *v3;
  HMMTRControllerWrapper *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  HMMTRControllerWrapper *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[6];
  uint8_t v16[4];
  void *v17;
  __int16 v18;
  uint64_t v19;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_DEBUG, "%{public}@Obtaining device controller", (uint8_t *)&buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__2808;
  v23 = __Block_byref_object_dispose__2809;
  v24 = 0;
  -[HMMTRControllerWrapper workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __36__HMMTRControllerWrapper_controller__block_invoke;
  v15[3] = &unk_250F235A8;
  v15[4] = v4;
  v15[5] = &buf;
  dispatch_sync(v7, v15);

  v8 = (void *)MEMORY[0x242656984]();
  v9 = v4;
  HMFGetOSLogHandle();
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v16 = 138543618;
    v17 = v11;
    v18 = 2048;
    v19 = v12;
    _os_log_impl(&dword_23E95B000, v10, OS_LOG_TYPE_DEBUG, "%{public}@Obtained device controller: %p", v16, 0x16u);

  }
  objc_autoreleasePoolPop(v8);
  v13 = *(id *)(*((_QWORD *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return (MTRDeviceController *)v13;
}

- (void)remove
{
  void *v3;
  HMMTRControllerWrapper *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Removing", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRControllerWrapper workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__HMMTRControllerWrapper_remove__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)replaceStartupParams:(id)a3
{
  id v4;
  void *v5;
  HMMTRControllerWrapper *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  _QWORD v13[5];
  _QWORD block[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x242656984]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v17 = v8;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Replacing startup params", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  -[HMMTRControllerWrapper workQueue](v6, "workQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke;
  block[3] = &unk_250F22458;
  block[4] = v6;
  v15 = v4;
  v11 = v4;
  dispatch_sync(v9, block);

  -[HMMTRControllerWrapper workQueue](v6, "workQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke_82;
  v13[3] = &unk_250F23DF0;
  v13[4] = v6;
  dispatch_async(v12, v13);

}

- (void)shutdown
{
  void *v3;
  HMMTRControllerWrapper *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x242656984](self, a2);
  v4 = self;
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v6;
    _os_log_impl(&dword_23E95B000, v5, OS_LOG_TYPE_INFO, "%{public}@Shutting down", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  -[HMMTRControllerWrapper workQueue](v4, "workQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__HMMTRControllerWrapper_shutdown__block_invoke;
  block[3] = &unk_250F23DF0;
  block[4] = v4;
  dispatch_async(v7, block);

}

- (void)registerRevokeHandlerWithQueue:(id)a3 handler:(id)a4
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
  -[HMMTRControllerWrapper workQueue](self, "workQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__HMMTRControllerWrapper_registerRevokeHandlerWithQueue_handler___block_invoke;
  block[3] = &unk_250F240D8;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (HMMTRControllerWrapper)initWithWorkQueue:(id)a3 factory:(id)a4 startupParams:(id)a5 name:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  HMMTRControllerWrapper *v15;
  HMMTRControllerWrapper *v16;
  uint64_t v17;
  HMMTRControllerParameters *startupParams;
  uint64_t v19;
  NSMutableArray *revokeHandlers;
  objc_super v22;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HMMTRControllerWrapper;
  v15 = -[HMMTRControllerWrapper init](&v22, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_workQueue, a3);
    objc_storeWeak((id *)&v16->_factory, v12);
    v17 = objc_msgSend(v13, "copy");
    startupParams = v16->_startupParams;
    v16->_startupParams = (HMMTRControllerParameters *)v17;

    objc_storeStrong((id *)&v16->_name, a6);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v19 = objc_claimAutoreleasedReturnValue();
    revokeHandlers = v16->_revokeHandlers;
    v16->_revokeHandlers = (NSMutableArray *)v19;

  }
  return v16;
}

- (void)_revokeAvailable:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSObject *v11;
  id obj;
  _QWORD block[6];
  BOOL v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[HMMTRControllerWrapper revokeHandlers](self, "revokeHandlers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v10, "queue");
        v11 = objc_claimAutoreleasedReturnValue();
        block[0] = v8;
        block[1] = 3221225472;
        block[2] = __43__HMMTRControllerWrapper__revokeAvailable___block_invoke;
        block[3] = &unk_250F23558;
        block[4] = v10;
        block[5] = self;
        v14 = a3;
        dispatch_async(v11, block);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (id)privateDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "shortDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMMTRControllerWrapper name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)attributeDescriptions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMMTRControllerWrapper name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:value:", CFSTR("Name"), v4);
  v8[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMMTRControllerWrapper name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%p"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)name
{
  return self->_name;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMMTRControllerFactory)factory
{
  return (HMMTRControllerFactory *)objc_loadWeakRetained((id *)&self->_factory);
}

- (void)setFactory:(id)a3
{
  objc_storeWeak((id *)&self->_factory, a3);
}

- (NSMutableArray)revokeHandlers
{
  return self->_revokeHandlers;
}

- (MTRDeviceController)cachedDeviceController
{
  return self->_cachedDeviceController;
}

- (void)setCachedDeviceController:(id)a3
{
  objc_storeStrong((id *)&self->_cachedDeviceController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDeviceController, 0);
  objc_storeStrong((id *)&self->_revokeHandlers, 0);
  objc_destroyWeak((id *)&self->_factory);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_startupParams, 0);
}

void __43__HMMTRControllerWrapper__revokeAvailable___block_invoke(uint64_t a1)
{
  uint64_t (**v2)(_QWORD, _QWORD, _QWORD);
  char v3;
  NSObject *v4;
  _QWORD v5[4];
  int8x16_t v6;

  objc_msgSend(*(id *)(a1 + 32), "handler");
  v2 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v3 = v2[2](v2, *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));

  if ((v3 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __43__HMMTRControllerWrapper__revokeAvailable___block_invoke_2;
    v5[3] = &unk_250F22458;
    v6 = vextq_s8(*(int8x16_t *)(a1 + 32), *(int8x16_t *)(a1 + 32), 8uLL);
    dispatch_async(v4, v5);

  }
}

void __43__HMMTRControllerWrapper__revokeAvailable___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "revokeHandlers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __65__HMMTRControllerWrapper_registerRevokeHandlerWithQueue_handler___block_invoke(uint64_t a1)
{
  HMMTRControllerWrapperRevokeHandlerInfo *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "revokeHandlers");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = -[HMMTRControllerWrapperRevokeHandlerInfo initWithHandler:queue:]([HMMTRControllerWrapperRevokeHandlerInfo alloc], "initWithHandler:queue:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(v3, "addObject:", v2);

}

void __34__HMMTRControllerWrapper_shutdown__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");

  objc_msgSend(*(id *)(a1 + 32), "setCachedDeviceController:", 0);
  v5 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "_revokeAvailable:", 0));
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v3;
    _os_log_impl(&dword_23E95B000, v7, OS_LOG_TYPE_INFO, "%{public}@Shutting down Matter controller with Node ID %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);

}

void __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x242656984]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controllerNodeID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v5;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_23E95B000, v4, OS_LOG_TYPE_INFO, "%{public}@Shutting down Matter controller with Node ID %@", (uint8_t *)&v16, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutdown");

  objc_msgSend(*(id *)(a1 + 32), "setCachedDeviceController:", 0);
  v9 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(void **)(v10 + 8);
  *(_QWORD *)(v10 + 8) = v9;

  v12 = (void *)MEMORY[0x242656984]();
  v13 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v15;
    _os_log_impl(&dword_23E95B000, v14, OS_LOG_TYPE_INFO, "%{public}@Replaced startup params", (uint8_t *)&v16, 0xCu);

  }
  objc_autoreleasePoolPop(v12);
}

uint64_t __47__HMMTRControllerWrapper_replaceStartupParams___block_invoke_82(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_revokeAvailable:", 1);
}

void __32__HMMTRControllerWrapper_remove__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "controllerNodeID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shutdown");

  objc_msgSend(*(id *)(a1 + 32), "setCachedDeviceController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "factory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_removeGetter:", *(_QWORD *)(a1 + 32));

  v6 = (void *)MEMORY[0x242656984](objc_msgSend(*(id *)(a1 + 32), "setFactory:", 0));
  v7 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v9;
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_23E95B000, v8, OS_LOG_TYPE_INFO, "%{public}@Removed by Shutting down Matter controller with Node ID %@", (uint8_t *)&v10, 0x16u);

  }
  objc_autoreleasePoolPop(v6);

}

void __36__HMMTRControllerWrapper_controller__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "cachedDeviceController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "cachedDeviceController");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = v4;
  }
  else
  {
    objc_msgSend(v3, "factory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_createControllerForGetter:", *(_QWORD *)(a1 + 32));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    v6 = v10;
  }

}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_2873 != -1)
    dispatch_once(&logCategory__hmf_once_t9_2873, &__block_literal_global_2874);
  return (id)logCategory__hmf_once_v10_2875;
}

void __37__HMMTRControllerWrapper_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_2875;
  logCategory__hmf_once_v10_2875 = v0;

}

@end
