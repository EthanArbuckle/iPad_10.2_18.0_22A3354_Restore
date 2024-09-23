@implementation HMDMediaGroupsAggregatorMessenger

- (HMDMediaGroupsAggregatorMessenger)init
{
  HMDMediaGroupsAggregatorMessenger *v2;
  uint64_t v3;
  NSUUID *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HMDMediaGroupsAggregatorMessenger;
  v2 = -[HMDMediaGroupsAggregatorMessenger init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = objc_claimAutoreleasedReturnValue();
    identifier = v2->_identifier;
    v2->_identifier = (NSUUID *)v3;

  }
  return v2;
}

- (void)configureWithMessageDispatcher:(id)a3 home:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  objc_msgSend(v6, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregatorMessenger setIdentifier:](self, "setIdentifier:", v7);

  -[HMDMediaGroupsAggregatorMessenger registerForMessagesWithMessageDispatcher:home:](self, "registerForMessagesWithMessageDispatcher:home:", v8, v6);
}

- (void)registerForMessagesWithMessageDispatcher:(id)a3 home:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  +[HMDRemoteMessagePolicy defaultSecurePolicy](HMDRemoteMessagePolicy, "defaultSecurePolicy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDXPCMessagePolicy policyWithEntitlements:](HMDXPCMessagePolicy, "policyWithEntitlements:", 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDUserMessagePolicy userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:](HMDUserMessagePolicy, "userMessagePolicyWithHome:userPrivilege:remoteAccessRequired:", v6, 3, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload messageName](HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload, "messageName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v8;
  v13[1] = v9;
  v13[2] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "registerForMessage:receiver:policies:selector:", v11, self, v12, sel_routeUpdateAssociatedGroupIdentifierRequestMessage_);

}

- (void)sendRequestToUpdateAssociatedGroupIdentifier:(id)a3 forGroupIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaGroupsAggregatorMessenger *v12;
  NSObject *v13;
  void *v14;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t, void *, void *);
  void *v29;
  HMDMediaGroupsAggregatorMessenger *v30;
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1D17BA0A0]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v35 = v14;
    v36 = 2112;
    v37 = v8;
    v38 = 2112;
    v39 = v9;
    _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Sending request to update associated group identifier: %@ for group identifier: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v11);
  v15 = -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload initWithGroupIdentifier:associatedGroupIdentifier:]([HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload alloc], "initWithGroupIdentifier:associatedGroupIdentifier:", v9, v8);
  v16 = objc_alloc(MEMORY[0x1E0D285F8]);
  +[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload messageName](HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload, "messageName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_alloc(MEMORY[0x1E0D285D8]);
  -[HMDMediaGroupsAggregatorMessenger messageTargetUUID](v12, "messageTargetUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithTarget:", v19);
  -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload payloadCopy](v15, "payloadCopy");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_msgSend(v16, "initWithName:destination:payload:", v17, v20, v21);

  v26 = MEMORY[0x1E0C809B0];
  v27 = 3221225472;
  v28 = __112__HMDMediaGroupsAggregatorMessenger_sendRequestToUpdateAssociatedGroupIdentifier_forGroupIdentifier_completion___block_invoke;
  v29 = &unk_1E89BF308;
  v30 = v12;
  v31 = v8;
  v32 = v9;
  v33 = v10;
  v23 = v10;
  v24 = v9;
  v25 = v8;
  objc_msgSend(v22, "setResponseHandler:", &v26);
  -[HMDMediaGroupsAggregatorMessenger routeUpdateAssociatedGroupIdentifierRequestMessage:](v12, "routeUpdateAssociatedGroupIdentifierRequestMessage:", v22, v26, v27, v28, v29, v30);

}

- (void)routeMessage:(id)a3 localHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregatorMessenger *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupsAggregatorMessenger router](self, "router");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "routeMessage:localHandler:", v6, v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x1D17BA0A0]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "name");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v14;
      v21 = 2112;
      v22 = v15;
      _os_log_impl(&dword_1CD062000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to route message: %@/%@ due to no router", (uint8_t *)&v17, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmfErrorWithCode:", 4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v16);

  }
}

- (void)routeUpdateAssociatedGroupIdentifierRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregatorMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Routing update associated group identifier request message: %@/%@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __88__HMDMediaGroupsAggregatorMessenger_routeUpdateAssociatedGroupIdentifierRequestMessage___block_invoke;
  v11[3] = &unk_1E89BFD28;
  v11[4] = v6;
  -[HMDMediaGroupsAggregatorMessenger routeMessage:localHandler:](v6, "routeMessage:localHandler:", v4, v11);

}

- (void)locallyHandleUpdateAssociatedGroupIdentifierRequestMessage:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregatorMessenger *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload *v12;
  void *v13;
  void *v14;
  HMDMediaGroupsAggregatorMessenger *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  HMDMediaGroupsAggregatorMessenger *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138543874;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Locally handling update associated group identifier request message: %@/%@", (uint8_t *)&v23, 0x20u);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(v4, "messagePayload");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload initWithPayload:]([HMDMediaGroupsAggregatorUpdateAssociatedGroupIdentifierPayload alloc], "initWithPayload:", v11);
    if (v12)
    {
      v13 = v12;
      -[HMDMediaGroupsAggregatorMessenger notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:message:](v6, "notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:message:", v12, v4);
    }
    else
    {
      v18 = (void *)MEMORY[0x1D17BA0A0]();
      v19 = v6;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543618;
        v24 = v21;
        v25 = 2112;
        v26 = v4;
        _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_ERROR, "%{public}@Failed to parse message payload from message: %@", (uint8_t *)&v23, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 3);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "respondWithError:", v22);

      v13 = 0;
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1D17BA0A0]();
    v15 = v6;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543618;
      v24 = v17;
      v25 = 2112;
      v26 = v4;
      _os_log_impl(&dword_1CD062000, v16, OS_LOG_TYPE_ERROR, "%{public}@Failed to get a message payload from message: %@", (uint8_t *)&v23, 0x16u);

    }
    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 20);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "respondWithError:", v13);
  }

}

- (void)notifyOfRequestToUpdateAssociatedGroupIdentifierWithPayload:(id)a3 message:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[HMDMediaGroupsAggregatorMessenger delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v10, "groupIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "associatedGroupIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "didReceiveUpdateAssociatedGroupRequestMessage:withGroupIdentifier:associatedGroupIdentifier:messenger:", v6, v8, v9, self);

  }
}

- (id)router
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMediaGroupsAggregatorMessenger *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[HMDMediaGroupsAggregatorMessenger dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "routerForMediaGroupsAggregatorMessenger:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = (void *)MEMORY[0x1D17BA0A0]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_ERROR, "%{public}@Failed to get router due to no data source", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
    v5 = 0;
  }

  return v5;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregatorMessenger identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregatorMessengerDataSource)dataSource
{
  return (HMDMediaGroupsAggregatorMessengerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaGroupsAggregatorMessengerDelegate)delegate
{
  return (HMDMediaGroupsAggregatorMessengerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 24, 1);
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
}

uint64_t __88__HMDMediaGroupsAggregatorMessenger_routeUpdateAssociatedGroupIdentifierRequestMessage___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "locallyHandleUpdateAssociatedGroupIdentifierRequestMessage:", a2);
}

void __112__HMDMediaGroupsAggregatorMessenger_sendRequestToUpdateAssociatedGroupIdentifier_forGroupIdentifier_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(a1 + 48);
      v13 = 138544130;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v20 = v5;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@Send request to update associated group identifier: %@ for group identifier: %@ responded with error: %@", (uint8_t *)&v13, 0x2Au);

    }
    objc_autoreleasePoolPop(v7);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_173196 != -1)
    dispatch_once(&logCategory__hmf_once_t8_173196, &__block_literal_global_173197);
  return (id)logCategory__hmf_once_v9_173198;
}

void __48__HMDMediaGroupsAggregatorMessenger_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_173198;
  logCategory__hmf_once_v9_173198 = v0;

}

@end
