@implementation HMDDelegatingMessageRouter

- (HMDDelegatingMessageRouter)initWithMessageDispatcher:(id)a3 routers:(id)a4
{
  id v7;
  id v8;
  HMDDelegatingMessageRouter *v9;
  HMDDelegatingMessageRouter *v10;
  uint64_t v11;
  NSArray *routers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDDelegatingMessageRouter;
  v9 = -[HMDDelegatingMessageRouter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_messageDispatcher, a3);
    v11 = objc_msgSend(v8, "copy");
    routers = v10->_routers;
    v10->_routers = (NSArray *)v11;

  }
  return v10;
}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  -[HMDDelegatingMessageRouter routeMessage:allowRemoteRelayFromPrimary:localHandler:](self, "routeMessage:allowRemoteRelayFromPrimary:localHandler:", a3, 1, a4);
}

- (void)routeMessage:(id)a3 allowRemoteRelayFromPrimary:(BOOL)a4 localHandler:(id)a5
{
  id v7;
  void (**v8)(id, id);
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v17 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = (void (**)(id, id))a5;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDDelegatingMessageRouter routers](self, "routers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v19;
    while (2)
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v13);
        -[HMDDelegatingMessageRouter dataSource](self, "dataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "router:shouldHandleMessage:usingRouter:", self, v7, v14);

        if (v16)
        {
          objc_msgSend(v14, "routeMessage:allowRemoteRelayFromPrimary:localHandler:", v7, v17, v8);

          goto LABEL_11;
        }
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v11)
        continue;
      break;
    }
  }

  v8[2](v8, v7);
LABEL_11:

}

- (HMDDelegatingMessageRouterDataSource)dataSource
{
  return (HMDDelegatingMessageRouterDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMFMessageDispatcher)messageDispatcher
{
  return (HMFMessageDispatcher *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)routers
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routers, 0);
  objc_storeStrong((id *)&self->_messageDispatcher, 0);
  objc_destroyWeak((id *)&self->_dataSource);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_32310 != -1)
    dispatch_once(&logCategory__hmf_once_t0_32310, &__block_literal_global_32311);
  return (id)logCategory__hmf_once_v1_32312;
}

void __41__HMDDelegatingMessageRouter_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_32312;
  logCategory__hmf_once_v1_32312 = v0;

}

@end
