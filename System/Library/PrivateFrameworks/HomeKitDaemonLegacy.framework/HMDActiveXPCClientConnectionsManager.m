@implementation HMDActiveXPCClientConnectionsManager

- (HMDActiveXPCClientConnectionsManager)initWithLogIdentifier:(id)a3 workQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDActiveXPCClientConnectionsManager *v9;
  uint64_t v10;
  NSString *logIdentifier;
  uint64_t v12;
  NSHashTable *mutableClientConnections;
  HMDActiveXPCClientConnectionsManager *v15;
  SEL v16;
  objc_super v17;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v8 = v7;
  if (!v7)
  {
LABEL_7:
    v15 = (HMDActiveXPCClientConnectionsManager *)_HMFPreconditionFailure();
    return (HMDActiveXPCClientConnectionsManager *)-[HMDActiveXPCClientConnectionsManager clientConnections](v15, v16);
  }
  v17.receiver = self;
  v17.super_class = (Class)HMDActiveXPCClientConnectionsManager;
  v9 = -[HMDActiveXPCClientConnectionsManager init](&v17, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v6, "copy");
    logIdentifier = v9->_logIdentifier;
    v9->_logIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v9->_workQueue, a4);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    mutableClientConnections = v9->_mutableClientConnections;
    v9->_mutableClientConnections = (NSHashTable *)v12;

  }
  return v9;
}

- (NSSet)clientConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[HMDActiveXPCClientConnectionsManager workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HMDActiveXPCClientConnectionsManager mutableClientConnections](self, "mutableClientConnections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v7;
}

- (void)addClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDActiveXPCClientConnectionsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDActiveXPCClientConnectionsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Adding client connection: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDActiveXPCClientConnectionsManager mutableClientConnections](v7, "mutableClientConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addObserver:selector:name:object:", v7, sel_handleClientConnectionDidActivate_, CFSTR("HMDXPCClientConnectionDidActivateNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:object:", v7, sel_handleClientConnectionDidDeactivate_, CFSTR("HMDXPCClientConnectionDidDeactivateNotification"), v4);

  if (objc_msgSend(v4, "isActivated"))
  {
    -[HMDActiveXPCClientConnectionsManager delegate](v7, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "clientConnectionsManager:didHandleActivationForClientConnection:", v7, v4);

  }
}

- (void)removeClientConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  HMDActiveXPCClientConnectionsManager *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMDActiveXPCClientConnectionsManager workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v9;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Removing client connection: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v6);
  -[HMDActiveXPCClientConnectionsManager mutableClientConnections](v7, "mutableClientConnections");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeObject:", v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObserver:name:object:", v7, CFSTR("HMDXPCClientConnectionDidActivateNotification"), v4);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeObserver:name:object:", v7, CFSTR("HMDXPCClientConnectionDidDeactivateNotification"), v4);

  -[HMDActiveXPCClientConnectionsManager delegate](v7, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "clientConnectionsManager:didHandleDeactivationForClientConnection:", v7, v4);

}

- (void)handleClientConnectionDidActivate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDActiveXPCClientConnectionsManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidActivate___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (void)handleClientConnectionDidDeactivate:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    -[HMDActiveXPCClientConnectionsManager workQueue](self, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __76__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidDeactivate___block_invoke;
    v8[3] = &unk_1E89C2328;
    v8[4] = self;
    v9 = v6;
    dispatch_async(v7, v8);

  }
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDActiveXPCClientConnectionsManagerDelegate)delegate
{
  return (HMDActiveXPCClientConnectionsManagerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 24, 1);
}

- (NSHashTable)mutableClientConnections
{
  return (NSHashTable *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableClientConnections, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

void __76__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidDeactivate___block_invoke(uint64_t a1)
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
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling client connection did deactivate: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientConnectionsManager:didHandleDeactivationForClientConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

void __74__HMDActiveXPCClientConnectionsManager_handleClientConnectionDidActivate___block_invoke(uint64_t a1)
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
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@Handling client connection did activate: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "clientConnectionsManager:didHandleActivationForClientConnection:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t6_14968 != -1)
    dispatch_once(&logCategory__hmf_once_t6_14968, &__block_literal_global_14969);
  return (id)logCategory__hmf_once_v7_14970;
}

void __51__HMDActiveXPCClientConnectionsManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v7_14970;
  logCategory__hmf_once_v7_14970 = v0;

}

@end
