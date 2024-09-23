@implementation HMDRemoteHomeMessagingManager

- (HMDRemoteHomeMessagingManager)init
{
  HMDRemoteHomeMessagingManager *v2;
  HMDRemoteHomeMessagingManager *v3;
  uint64_t v4;
  NSMapTable *homeUUIDToHandlerMap;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDRemoteHomeMessagingManager;
  v2 = -[HMDRemoteHomeMessagingManager init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    homeUUIDToHandlerMap = v3->_homeUUIDToHandlerMap;
    v3->_homeUUIDToHandlerMap = (NSMapTable *)v4;

  }
  return v3;
}

- (void)registerHandler:(id)a3
{
  id v4;
  void *v5;
  HMDRemoteHomeMessagingManager *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  os_unfair_lock_s *p_lock;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "homeUUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138543618;
    v14 = v8;
    v15 = 2114;
    v16 = v9;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Registering handler for home UUID: %{public}@", (uint8_t *)&v13, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  -[HMDRemoteHomeMessagingManager homeUUIDToHandlerMap](v6, "homeUUIDToHandlerMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "homeUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKey:", v4, v12);

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)sendMessage:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDRemoteHomeMessagingManager *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "destination");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = 0;
  v10 = v9;

  if (v10)
  {
    objc_msgSend(v10, "homeUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock_with_options();
    -[HMDRemoteHomeMessagingManager homeUUIDToHandlerMap](self, "homeUUIDToHandlerMap");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKey:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(&self->_lock);
    v14 = (void *)MEMORY[0x227676638]();
    v15 = self;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v13)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v18;
        v28 = 2114;
        v29 = v11;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_DEBUG, "%{public}@Dispatching to handler for home UUID: %{public}@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v14);
      objc_msgSend(v13, "sendMessage:completionHandler:", v6, v7);
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v19;
        v28 = 2114;
        v29 = v11;
        v30 = 2112;
        v31 = v6;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Handler not found for home UUID: %{public}@, message: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v14);
      v20 = (void *)MEMORY[0x24BDD1540];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Handler not found for home UUID %@"), v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "hmErrorWithCode:description:reason:suggestion:", 2, CFSTR("Cannot send message to the specified home"), v21, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v6, "respondWithError:", v22);
      v23 = _Block_copy(v7);
      v24 = v23;
      if (v23)
        (*((void (**)(void *, void *))v23 + 2))(v23, v22);

    }
  }

  return v10 != 0;
}

- (NSMapTable)homeUUIDToHandlerMap
{
  return self->_homeUUIDToHandlerMap;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeUUIDToHandlerMap, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t7_207150 != -1)
    dispatch_once(&logCategory__hmf_once_t7_207150, &__block_literal_global_207151);
  return (id)logCategory__hmf_once_v8_207152;
}

void __44__HMDRemoteHomeMessagingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v8_207152;
  logCategory__hmf_once_v8_207152 = v0;

}

@end
