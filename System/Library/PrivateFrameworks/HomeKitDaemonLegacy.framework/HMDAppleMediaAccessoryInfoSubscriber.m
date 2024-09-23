@implementation HMDAppleMediaAccessoryInfoSubscriber

- (HMDAppleMediaAccessoryInfoSubscriber)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v7;
  id v8;
  HMDAppleMediaAccessoryInfoSubscriber *v9;
  HMDAppleMediaAccessoryInfoSubscriber *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDAppleMediaAccessoryInfoSubscriber;
  v9 = -[HMDAppleMediaAccessoryInfoSubscriber init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workQueue, a3);
    objc_storeWeak((id *)&v10->_dataSource, v8);
  }

  return v10;
}

- (void)subscribeToWiFiInfoUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAppleMediaAccessoryInfoSubscriber *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[HMDAppleMediaAccessoryInfoSubscriber dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryInfoControllerTopicForWifiInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "subscriptionProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __65__HMDAppleMediaAccessoryInfoSubscriber_subscribeToWiFiInfoUpdate__block_invoke;
    v11[3] = &unk_1E89C19A8;
    v11[4] = self;
    v12 = v4;
    objc_msgSend(v5, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", self, v6, MEMORY[0x1E0C9AA60], v11);

  }
  else
  {
    v7 = (void *)MEMORY[0x1D17BA0A0]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_ERROR, "%{public}@wifi info topic is nil", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  HMDAppleMediaAccessoryInfoSubscriber *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  HMDAppleMediaAccessoryInfoSubscriber *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  HMDAppleMediaAccessoryInfoSubscriber *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  HMDAppleMediaAccessoryInfoSubscriber *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  _BYTE buf[24];
  void *v41;
  id v42;
  HMDAppleMediaAccessoryInfoSubscriber *v43;
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "asAccessoryTopic");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && (v10 = objc_msgSend(v9, "accessoryEventTopicSuffixID"), v10 == *MEMORY[0x1E0CB7C58]))
  {
    v11 = v6;
    if (self)
    {
      v12 = objc_alloc(MEMORY[0x1E0CBA288]);
      objc_msgSend(v11, "encodedData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = (void *)objc_msgSend(v12, "initWithProtoData:", v13);

      if (v14)
      {
        objc_msgSend(v14, "hmfWifiNetworkInfo");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15
          && (-[HMDAppleMediaAccessoryInfoSubscriber receivedWifiInfo](self, "receivedWifiInfo"),
              v16 = (void *)objc_claimAutoreleasedReturnValue(),
              v17 = objc_msgSend(v15, "isEqualToNetworkInfo:", v16),
              v16,
              (v17 & 1) == 0))
        {
          v31 = (void *)MEMORY[0x1D17BA0A0]();
          v32 = self;
          HMFGetOSLogHandle();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAppleMediaAccessoryInfoSubscriber receivedWifiInfo](v32, "receivedWifiInfo");
            v39 = v31;
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v34;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v35;
            *(_WORD *)&buf[22] = 2112;
            v41 = v15;
            _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_INFO, "%{public}@Updating received wifi info from: %@ to: %@", buf, 0x20u);

            v31 = v39;
          }

          objc_autoreleasePoolPop(v31);
          -[HMDAppleMediaAccessoryInfoSubscriber setReceivedWifiInfo:](v32, "setReceivedWifiInfo:", v15);
          -[HMDAppleMediaAccessoryInfoSubscriber delegate](v32, "delegate");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            -[HMDAppleMediaAccessoryInfoSubscriber workQueue](v32, "workQueue");
            v37 = objc_claimAutoreleasedReturnValue();
            *(_QWORD *)buf = MEMORY[0x1E0C809B0];
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = __60__HMDAppleMediaAccessoryInfoSubscriber_handleWifiInfoEvent___block_invoke;
            v41 = &unk_1E89C20C8;
            v42 = v36;
            v43 = v32;
            v44 = v15;
            dispatch_async(v37, buf);

          }
        }
        else
        {
          v18 = (void *)MEMORY[0x1D17BA0A0]();
          v19 = self;
          HMFGetOSLogHandle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[HMDAppleMediaAccessoryInfoSubscriber receivedWifiInfo](v19, "receivedWifiInfo");
            v38 = v11;
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2112;
            v41 = v22;
            _os_log_impl(&dword_1CD062000, v20, OS_LOG_TYPE_INFO, "%{public}@Received wifi info: %@ saved wifi info: %@", buf, 0x20u);

            v11 = v38;
          }

          objc_autoreleasePoolPop(v18);
        }

      }
      else
      {
        v27 = (void *)MEMORY[0x1D17BA0A0]();
        v28 = self;
        HMFGetOSLogHandle();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v30;
          _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_ERROR, "%{public}@Error decoding the event to wifi info object", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v27);
      }

    }
  }
  else
  {
    v23 = (void *)MEMORY[0x1D17BA0A0]();
    v24 = self;
    HMFGetOSLogHandle();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v26;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v7;
      _os_log_impl(&dword_1CD062000, v25, OS_LOG_TYPE_INFO, "%{public}@Do not handle topic: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v23);
  }

}

- (HMDAppleMediaAccessoryInfoSubscriberDelegate)delegate
{
  return (HMDAppleMediaAccessoryInfoSubscriberDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (HMDAppleMediaAccessoryInfoSubscriberDataSource)dataSource
{
  return (HMDAppleMediaAccessoryInfoSubscriberDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (HMFWiFiNetworkInfo)receivedWifiInfo
{
  return (HMFWiFiNetworkInfo *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReceivedWifiInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedWifiInfo, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __60__HMDAppleMediaAccessoryInfoSubscriber_handleWifiInfoEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "infoSubscriber:didReceiveWiFiInfoUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __65__HMDAppleMediaAccessoryInfoSubscriber_subscribeToWiFiInfoUpdate__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  NSObject *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[128];
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v31 = a1;
  v8 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v6)
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543874;
    v38 = v11;
    v39 = 2112;
    v40 = v12;
    v41 = 2112;
    v42 = v6;
    v13 = "%{public}@Subscription to topic: %@ results in error: %@";
    v14 = v10;
    v15 = OS_LOG_TYPE_ERROR;
    v16 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    v38 = v11;
    v39 = 2112;
    v40 = v17;
    v13 = "%{public}@Subscription to topic: %@ successful";
    v14 = v10;
    v15 = OS_LOG_TYPE_INFO;
    v16 = 22;
  }
  _os_log_impl(&dword_1CD062000, v14, v15, v13, buf, v16);

LABEL_7:
  v30 = v6;

  objc_autoreleasePoolPop(v7);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  v20 = a1;
  if (v19)
  {
    v21 = v19;
    v22 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v33 != v22)
          objc_enumerationMutation(v18);
        v24 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v18, "objectForKeyedSubscript:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = (void *)MEMORY[0x1D17BA0A0]();
        v27 = *(id *)(v20 + 32);
        HMFGetOSLogHandle();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          HMFGetLogIdentifier();
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v38 = v29;
          v39 = 2112;
          v40 = v25;
          v41 = 2112;
          v42 = v24;
          _os_log_impl(&dword_1CD062000, v28, OS_LOG_TYPE_INFO, "%{public}@Received cached event: %@ topic: %@ during subscription", buf, 0x20u);

          v20 = v31;
        }

        objc_autoreleasePoolPop(v26);
        objc_msgSend(*(id *)(v20 + 32), "didReceiveEvent:topic:", v25, v24);

      }
      v21 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v21);
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t8_179332 != -1)
    dispatch_once(&logCategory__hmf_once_t8_179332, &__block_literal_global_179333);
  return (id)logCategory__hmf_once_v9_179334;
}

void __51__HMDAppleMediaAccessoryInfoSubscriber_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v9_179334;
  logCategory__hmf_once_v9_179334 = v0;

}

@end
