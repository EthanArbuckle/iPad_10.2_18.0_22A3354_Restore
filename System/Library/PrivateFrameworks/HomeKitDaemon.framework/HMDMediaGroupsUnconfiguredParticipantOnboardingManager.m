@implementation HMDMediaGroupsUnconfiguredParticipantOnboardingManager

- (HMDMediaGroupsUnconfiguredParticipantOnboardingManager)initWithIdentifier:(id)a3
{
  id v5;
  void *v6;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v7;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v8;
  uint64_t v9;
  NSMutableDictionary *queuedAssociatedGroupIdentifiers;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *result;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v12;
  SEL v13;
  id v14;
  objc_super v15;

  v5 = a3;
  if (v5)
  {
    v6 = v5;
    v15.receiver = self;
    v15.super_class = (Class)HMDMediaGroupsUnconfiguredParticipantOnboardingManager;
    v7 = -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager init](&v15, sel_init);
    v8 = v7;
    if (v7)
    {
      v7->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v7->_identifier, a3);
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v9 = objc_claimAutoreleasedReturnValue();
      queuedAssociatedGroupIdentifiers = v8->_queuedAssociatedGroupIdentifiers;
      v8->_queuedAssociatedGroupIdentifiers = (NSMutableDictionary *)v9;

    }
    return v8;
  }
  else
  {
    v12 = (HMDMediaGroupsUnconfiguredParticipantOnboardingManager *)_HMFPreconditionFailure();
    -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager configureWithNotificationCenter:](v12, v13, v14);
  }
  return result;
}

- (void)configureWithNotificationCenter:(id)a3
{
  objc_msgSend(a3, "addObserver:selector:name:object:", self, sel_handleMediaGroupsAggregateConsumerUpdatedAggregateDataNotification_, CFSTR("HMDMediaGroupsAggregateConsumerUpdatedAggregateDataNotification"), 0);
}

- (void)queueOnboardingParticipantWithAccessoryUUID:(id)a3 withAssociatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x227676638]();
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
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Queueing onboarding for participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v12, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager setQueuedAssociatedGroupIdentifier:forParticipantAccessoryUUID:](v9, "setQueuedAssociatedGroupIdentifier:forParticipantAccessoryUUID:", v7, v6);
  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager dequeueAvailableOnboadedParticipants](v9, "dequeueAvailableOnboadedParticipants");

}

- (void)dequeueAvailableOnboadedParticipants
{
  void *v3;
  void *v4;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v5;
  NSObject *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager queuedParticipantAccessoryUUIDs](self, "queuedParticipantAccessoryUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)MEMORY[0x227676638]();
    v5 = self;
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v10 = v7;
      v11 = 2112;
      v12 = v3;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Attempting onboarding for participant accessory uuids: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __94__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_dequeueAvailableOnboadedParticipants__block_invoke;
    v8[3] = &unk_24E791928;
    v8[4] = v5;
    objc_msgSend(v3, "na_each:", v8);
  }

}

- (void)attemptOnboardingForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager mediaDestinationManagerWithParticipantAccessoryUUID:](self, "mediaDestinationManagerWithParticipantAccessoryUUID:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:](self, "dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = (void *)MEMORY[0x227676638]();
      v8 = self;
      HMFGetOSLogHandle();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v15 = v10;
        v16 = 2112;
        v17 = v6;
        v18 = 2112;
        v19 = v4;
        v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Sending request to update audio group identifier: %@ for participant accessory identifier: %@ destination: %@", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v7);
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __103__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_attemptOnboardingForParticipantAccessoryUUID___block_invoke;
      v12[3] = &unk_24E79BCC8;
      v12[4] = v8;
      v13 = v4;
      objc_msgSend(v5, "requestToUpdateAudioGroupIdentifier:completion:", v6, v12);

    }
  }

}

- (void)setQueuedAssociatedGroupIdentifier:(id)a3 forParticipantAccessoryUUID:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary setObject:forKey:](self->_queuedAssociatedGroupIdentifiers, "setObject:forKey:", v7, v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)queuedParticipantAccessoryUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](self->_queuedAssociatedGroupIdentifiers, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)dequeuedAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_queuedAssociatedGroupIdentifiers, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](self->_queuedAssociatedGroupIdentifiers, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (id)mediaDestinationManagerWithParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsUnconfiguredParticipantOnboardingManager *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaDestinationManagerWithParticipantAccessoryUUID:forMediaGroupsUnconfiguredParticipantOnboardingManager:", v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get media destination manager with participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsUnconfiguredParticipantOnboardingManager identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsUnconfiguredParticipantOnboardingManagerDataSource)dataSource
{
  return (HMDMediaGroupsUnconfiguredParticipantOnboardingManagerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_queuedAssociatedGroupIdentifiers, 0);
}

void __103__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_attemptOnboardingForParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint32_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v15 = 138543874;
      v16 = v8;
      v17 = 2112;
      v18 = v9;
      v19 = 2112;
      v20 = v3;
      v10 = "%{public}@Completed send request to update audio group identifier for participant accessory identifier: %@ with error: %@";
      v11 = v7;
      v12 = OS_LOG_TYPE_ERROR;
      v13 = 32;
LABEL_6:
      _os_log_impl(&dword_2218F0000, v11, v12, v10, (uint8_t *)&v15, v13);

    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *(_QWORD *)(a1 + 40);
    v15 = 138543618;
    v16 = v8;
    v17 = 2112;
    v18 = v14;
    v10 = "%{public}@Completed send request to update audio group identifier for participant accessory identifier: %@";
    v11 = v7;
    v12 = OS_LOG_TYPE_INFO;
    v13 = 22;
    goto LABEL_6;
  }

  objc_autoreleasePoolPop(v4);
}

uint64_t __94__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_dequeueAvailableOnboadedParticipants__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "attemptOnboardingForParticipantAccessoryUUID:", a2);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t9_205214 != -1)
    dispatch_once(&logCategory__hmf_once_t9_205214, &__block_literal_global_205215);
  return (id)logCategory__hmf_once_v10_205216;
}

void __69__HMDMediaGroupsUnconfiguredParticipantOnboardingManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v10_205216;
  logCategory__hmf_once_v10_205216 = v0;

}

@end
