@implementation HMBCloudPushHandler

- (HMBCloudPushHandler)initWithAPSConnection:(id)a3
{
  id v5;
  HMBCloudPushHandler *v6;
  HMBCloudPushHandler *v7;
  uint64_t v8;
  NSMapTable *bundleIdentifiersByObservers;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMBCloudPushHandler;
  v6 = -[HMBCloudPushHandler init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_apsLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_apsConnection, a3);
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifiersByObservers = v7->_bundleIdentifiersByObservers;
    v7->_bundleIdentifiersByObservers = (NSMapTable *)v8;

  }
  return v7;
}

- (void)addObserver:(id)a3 forBundleIdentifier:(id)a4
{
  id v6;
  const char *v7;
  id Property;
  id v9;
  os_unfair_lock_s *p_apsLock;
  const char *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  HMBCloudPushHandler *v19;
  NSObject *v20;
  void *v21;
  const char *v22;
  id v23;
  id v24;
  const char *v25;
  void *v26;
  id v27;
  id v28;
  const char *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  v9 = Property;
  objc_msgSend(v9, "setObject:forKey:", v6, v32);

  os_unfair_lock_unlock(&self->_lock);
  p_apsLock = &self->_apsLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0C99E20];
  if (self)
    v14 = objc_getProperty(self, v11, 16, 1);
  else
    v14 = 0;
  v15 = v14;
  objc_msgSend(v15, "enabledTopics");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setWithArray:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v17, "addObject:", v12));
  v19 = self;
  HMFGetOSLogHandle();
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v34 = v21;
    v35 = 2112;
    v36 = v12;
    _os_log_impl(&dword_1CCD48000, v20, OS_LOG_TYPE_INFO, "%{public}@Adding enabled topic to APS connection: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  if (self)
    v23 = objc_getProperty(v19, v22, 16, 1);
  else
    v23 = 0;
  v24 = v23;
  objc_msgSend(v24, "setDelegate:", v19);

  objc_msgSend(v17, "allObjects");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v27 = objc_getProperty(v19, v25, 16, 1);
  else
    v27 = 0;
  v28 = v27;
  objc_msgSend(v28, "setEnabledTopics:", v26);

  if (self)
    v30 = objc_getProperty(v19, v29, 16, 1);
  else
    v30 = 0;
  v31 = v30;
  objc_msgSend(v31, "requestTokenForTopic:identifier:", v12, 0);

  os_unfair_lock_unlock(p_apsLock);
}

- (void)removeAllObserversForBundleIdentifier:(id)a3
{
  id v4;
  const char *v5;
  id Property;
  id v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  const char *v17;
  id v18;
  id v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HMBCloudPushHandler *v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  void *v33;
  id v34;
  id v35;
  const char *v36;
  id v37;
  id v38;
  os_unfair_lock_t lock;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  if (self)
    Property = objc_getProperty(self, v5, 24, 1);
  else
    Property = 0;
  v7 = Property;
  v8 = (void *)objc_msgSend(v7, "copy");

  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v41;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v41 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v12);
        if (self)
          v14 = objc_getProperty(self, v9, 24, 1);
        else
          v14 = 0;
        v15 = v14;
        objc_msgSend(v15, "objectForKey:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v16, "isEqualToString:", v4))
        {
          if (self)
            v18 = objc_getProperty(self, v17, 24, 1);
          else
            v18 = 0;
          v19 = v18;
          objc_msgSend(v19, "removeObjectForKey:", v13);

        }
        ++v12;
      }
      while (v10 != v12);
      v20 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      v10 = v20;
    }
    while (v20);
  }

  os_unfair_lock_unlock(&self->_lock);
  lock = &self->_apsLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(CFSTR("com.apple.icloud-container."), "stringByAppendingString:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99E20];
  if (self)
    v24 = objc_getProperty(self, v21, 16, 1);
  else
    v24 = 0;
  v25 = v24;
  objc_msgSend(v25, "enabledTopics");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1D17B6230](objc_msgSend(v27, "removeObject:", v22));
  v29 = self;
  HMFGetOSLogHandle();
  v30 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v31;
    v46 = 2112;
    v47 = v22;
    _os_log_impl(&dword_1CCD48000, v30, OS_LOG_TYPE_INFO, "%{public}@Removing enabled topic from APS connection: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v28);
  objc_msgSend(v27, "allObjects");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    v34 = objc_getProperty(v29, v32, 16, 1);
  else
    v34 = 0;
  v35 = v34;
  objc_msgSend(v35, "setEnabledTopics:", v33);

  if (self)
    v37 = objc_getProperty(v29, v36, 16, 1);
  else
    v37 = 0;
  v38 = v37;
  objc_msgSend(v38, "invalidateTokenForTopic:identifier:", v22, 0);

  os_unfair_lock_unlock(lock);
}

- (void)connection:(id)a3 didReceiveToken:(id)a4 forTopic:(id)a5 identifier:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  HMBCloudPushHandler *v15;
  NSObject *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)MEMORY[0x1D17B6230]();
  v15 = self;
  HMFGetOSLogHandle();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138544386;
    v19 = v17;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_1CCD48000, v16, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceiveToken: %@ forTopic: %@ identifier: %@", (uint8_t *)&v18, 0x34u);

  }
  objc_autoreleasePoolPop(v14);

}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudPushHandler *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v11;
    v14 = 2112;
    v15 = v6;
    v16 = 2112;
    v17 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceivePublicToken: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);

}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMBCloudPushHandler *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  os_unfair_lock_s *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void (*v23)(uint64_t, void *);
  uint64_t *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v28[5];
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17B6230]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v11;
    v32 = 2112;
    v33 = v6;
    v34 = 2112;
    v35 = v7;
    _os_log_impl(&dword_1CCD48000, v10, OS_LOG_TYPE_INFO, "%{public}@connection: %@ didReceiveIncomingMessage: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  v12 = (void *)MEMORY[0x1D17B6230]();
  v13 = v9;
  HMFGetOSLogHandle();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userInfo");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v31 = v15;
    v32 = 2112;
    v33 = v16;
    v34 = 2112;
    v35 = v17;
    _os_log_impl(&dword_1CCD48000, v14, OS_LOG_TYPE_DEBUG, "%{public}@Handling incoming APS message with topic: %@ userInfo: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v12);
  v18 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke;
  v28[3] = &unk_1E8932EC0;
  v28[4] = v13;
  v19 = v7;
  v29 = v19;
  -[HMBCloudPushHandler _performObserverCallback:](v13, v28);
  v20 = (void *)MEMORY[0x1E0C94F40];
  objc_msgSend(v19, "userInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "notificationFromRemoteNotificationDictionary:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    v27 = v18;
    v23 = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_2;
    v24 = &v27;
    v25 = v22;
  }
  else
  {
    v26 = v18;
    v23 = __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_3;
    v24 = &v26;
    v25 = v19;
  }
  v24[1] = 3221225472;
  v24[2] = (uint64_t)v23;
  v24[3] = (uint64_t)&unk_1E8932EC0;
  v24[4] = (uint64_t)v13;
  v24[5] = (uint64_t)v25;
  -[HMBCloudPushHandler _performObserverCallback:](v13, v24);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiersByObservers, 0);
  objc_storeStrong((id *)&self->_apsConnection, 0);
}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "topic");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handler:didReceivePushForTopic:", v3, v4);

  }
}

- (void)_performObserverCallback:(os_unfair_lock_s *)a1
{
  void (**v3)(id, _QWORD);
  os_unfair_lock_s *v4;
  SEL v5;
  NSMapTable *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v4 = a1 + 2;
    os_unfair_lock_lock_with_options();
    v6 = (NSMapTable *)objc_getProperty(a1, v5, 24, 1);
    NSAllMapTableKeys(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    os_unfair_lock_unlock(v4);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v8);
          v3[2](v3, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "handler:didReceiveCKNotification:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __60__HMBCloudPushHandler_connection_didReceiveIncomingMessage___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "userInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handler:didReceiveMessageWithUserInfo:", v3, v4);

  }
}

+ (id)sharedHandlerForEnvironment:(id)a3
{
  id v3;
  id v4;
  HMBCloudPushHandler *v5;
  id v6;
  void *v7;
  HMBCloudPushHandler *v8;
  NSObject *v9;
  void *v10;
  id v11;
  const char *v12;
  NSObject *v13;
  dispatch_queue_t v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (sharedHandlerForEnvironment__onceToken != -1)
    dispatch_once(&sharedHandlerForEnvironment__onceToken, &__block_literal_global_5218);
  v4 = (id)sharedHandlerForEnvironment__pushHandlersByEnvironment;
  objc_sync_enter(v4);
  objc_msgSend((id)sharedHandlerForEnvironment__pushHandlersByEnvironment, "objectForKeyedSubscript:", v3);
  v5 = (HMBCloudPushHandler *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = [HMBCloudPushHandler alloc];
    v6 = v3;
    if (v5)
    {
      v7 = (void *)MEMORY[0x1D17B6230]();
      v8 = v5;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v10;
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = CFSTR("com.apple.homed.aps");
        _os_log_impl(&dword_1CCD48000, v9, OS_LOG_TYPE_INFO, "%{public}@Creating APSConnection with environment: %@ namedDelegatePort: %@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v7);
      v11 = objc_alloc(MEMORY[0x1E0CFE148]);
      v12 = (const char *)HMFDispatchQueueName();
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = dispatch_queue_create(v12, v13);
      v15 = (void *)objc_msgSend(v11, "initWithEnvironmentName:namedDelegatePort:queue:", v6, CFSTR("com.apple.homed.aps"), v14);

      v5 = -[HMBCloudPushHandler initWithAPSConnection:](v8, "initWithAPSConnection:", v15);
    }

    objc_msgSend((id)sharedHandlerForEnvironment__pushHandlersByEnvironment, "setObject:forKeyedSubscript:", v5, v6);
  }
  objc_sync_exit(v4);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t12 != -1)
    dispatch_once(&logCategory__hmf_once_t12, &__block_literal_global_75);
  return (id)logCategory__hmf_once_v13;
}

void __34__HMBCloudPushHandler_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v13;
  logCategory__hmf_once_v13 = v0;

}

void __51__HMBCloudPushHandler_sharedHandlerForEnvironment___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)sharedHandlerForEnvironment__pushHandlersByEnvironment;
  sharedHandlerForEnvironment__pushHandlersByEnvironment = v0;

}

@end
