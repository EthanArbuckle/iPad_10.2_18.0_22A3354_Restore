@implementation HMDMediaGroupsAggregatorBackupSender

- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3
{
  return -[HMDMediaGroupsAggregatorBackupSender initWithIdentifier:backupTimerProvider:](self, "initWithIdentifier:backupTimerProvider:", a3, self);
}

- (HMDMediaGroupsAggregatorBackupSender)initWithIdentifier:(id)a3 backupTimerProvider:(id)a4
{
  id v7;
  id v8;
  void *v9;
  HMDMediaGroupsAggregatorBackupSender *v10;
  HMDMediaGroupsAggregatorBackupSender *v11;
  uint64_t v12;
  NSMutableDictionary *backupTimers;
  HMDMediaGroupsAggregatorBackupSender *result;
  HMDMediaGroupsAggregatorBackupSender *v15;
  SEL v16;
  id v17;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    _HMFPreconditionFailure();
    goto LABEL_7;
  }
  v9 = v8;
  if (!v8)
  {
LABEL_7:
    v15 = (HMDMediaGroupsAggregatorBackupSender *)_HMFPreconditionFailure();
    -[HMDMediaGroupsAggregatorBackupSender sendBackupToParticipantAccessoryUUID:](v15, v16, v17);
    return result;
  }
  v18.receiver = self;
  v18.super_class = (Class)HMDMediaGroupsAggregatorBackupSender;
  v10 = -[HMDMediaGroupsAggregatorBackupSender init](&v18, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v10->_identifier, a3);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v12 = objc_claimAutoreleasedReturnValue();
    backupTimers = v11->_backupTimers;
    v11->_backupTimers = (NSMutableDictionary *)v12;

    objc_storeWeak((id *)&v11->_backupTimerProvider, v9);
  }

  return v11;
}

- (void)sendBackupToParticipantAccessoryUUID:(id)a3
{
  id v4;

  v4 = a3;
  -[HMDMediaGroupsAggregatorBackupSender createNewBackupTimerForParticipantAccessoryUUID:](self, "createNewBackupTimerForParticipantAccessoryUUID:", v4);
  -[HMDMediaGroupsAggregatorBackupSender _sendBackupToParticipantAccessoryUUID:](self, "_sendBackupToParticipantAccessoryUUID:", v4);

}

- (void)_sendBackupToParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsAggregatorBackupSender *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregatorBackupSender *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138543618;
    v15 = v8;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Sending backup group data message to participant accessory uuid: %@", (uint8_t *)&v14, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsAggregatorBackupSender backupGroupsForParticipantAccessoryUUID:](v6, "backupGroupsForParticipantAccessoryUUID:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[HMDMediaGroupsAggregatorBackupSender _sendBackupToFirstPartyParticipantAccessoryUUID:backupGroups:](v6, "_sendBackupToFirstPartyParticipantAccessoryUUID:backupGroups:", v4, v9);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = v6;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v4;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to get backup groups to send for participant accessory uuid: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    -[HMDMediaGroupsAggregatorBackupSender removeBackupTimerWithParticipantAccessoryUUID:](v11, "removeBackupTimerWithParticipantAccessoryUUID:", v4);
  }

}

- (void)_sendBackupToFirstPartyParticipantAccessoryUUID:(id)a3 backupGroups:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  HMDMediaGroupsAggregatorBackupSender *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v27 = CFSTR("HMDMediaGroupsBackupDataKey");
  v28[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x24BE3F1B8]);
  -[HMDMediaGroupsAggregatorBackupSender identifier](self, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithTarget:", v10);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F1D0]), "initWithName:destination:payload:", CFSTR("HMDMediaGroupsBackupDataMessage"), v11, v8);
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__16490;
  v25 = __Block_byref_object_dispose__16491;
  objc_msgSend(v12, "identifier");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregatorBackupSender markAttemptForParticipantAccessoryUUID:withMessageIdentifier:](self, "markAttemptForParticipantAccessoryUUID:withMessageIdentifier:", v6, v22[5]);
  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __101__HMDMediaGroupsAggregatorBackupSender__sendBackupToFirstPartyParticipantAccessoryUUID_backupGroups___block_invoke;
  v17 = &unk_24E7775C0;
  v18 = self;
  v13 = v6;
  v19 = v13;
  v20 = &v21;
  objc_msgSend(v12, "setResponseHandler:", &v14);
  -[HMDMediaGroupsAggregatorBackupSender routeBackedUpGroupsMessage:toParticipantAccessoryUUID:](self, "routeBackedUpGroupsMessage:toParticipantAccessoryUUID:", v12, v13, v14, v15, v16, v17, v18);

  _Block_object_dispose(&v21, 8);
}

- (void)clearCachedData
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  NSMutableDictionary *backupTimers;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  backupTimers = self->_backupTimers;
  self->_backupTimers = v4;

  os_unfair_lock_unlock(p_lock);
}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_backupTimers, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)routeBackedUpGroupsMessage:(id)a3 toParticipantAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsAggregatorBackupSender *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDMediaGroupsAggregatorBackupSender *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
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
    objc_msgSend(v6, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    v26 = 2112;
    v27 = v13;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Routing message: %@(%@)", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  -[HMDMediaGroupsAggregatorBackupSender routerParticipantAccessoryUUID:](v9, "routerParticipantAccessoryUUID:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __94__HMDMediaGroupsAggregatorBackupSender_routeBackedUpGroupsMessage_toParticipantAccessoryUUID___block_invoke;
    v20[3] = &unk_24E795E50;
    v20[4] = v9;
    v21 = v7;
    objc_msgSend(v14, "routeMessage:localHandler:", v6, v20);

  }
  else
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v9;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v23 = v18;
      v24 = 2112;
      v25 = v7;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Failed to route backup group data due to no router found for participant accessory UUID: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v19);

  }
}

- (void)locallyRouteGroupsBackupDataMessage:(id)a3 toParticipantAccessoryUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregatorBackupSender *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupsAggregatorBackupSender receiverForParticipantAccessoryUUID:](self, "receiverForParticipantAccessoryUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "handleGroupsBackupDataMessage:", v6);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543618;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to locally route due to no receiver for groups backup data message: %@", (uint8_t *)&v15, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "respondWithError:", v14);

  }
}

- (id)backupGroupsForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregatorBackupSender *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregatorBackupSender dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "backupGroupsForParticipantAccessoryUUID:mediaGroupsAggregatorBackupSender:", v4, self);
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get backup groups for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)routerParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregatorBackupSender *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregatorBackupSender dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "routerForParticipantAccessoryUUID:mediaGroupsAggregatorBackupSender:", v4, self);
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get router for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (id)receiverForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregatorBackupSender *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregatorBackupSender dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "receiverForParticipantAccessoryUUID:mediaGroupsAggregatorBackupSender:", v4, self);
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
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to get receiver for participant accessory uuid: %@ due to no data source", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

- (void)createNewBackupTimerForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsAggregatorBackupSender *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsAggregatorBackupSender backupTimerProvider](self, "backupTimerProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "mediaGroupsAggregateBackupMessageTimerWithParticipantAccessoryUUID:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);
    -[HMDMediaGroupsAggregatorBackupSender setBackUpTimer:](self, "setBackUpTimer:", v7);

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
      v12 = 138543362;
      v13 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to create new backup timer due to no provider", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
  }

}

- (void)setBackUpTimer:(id)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *backupTimers;
  void *v6;
  id v7;

  v7 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  backupTimers = self->_backupTimers;
  objc_msgSend(v7, "participantAccessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](backupTimers, "setObject:forKey:", v7, v6);

  os_unfair_lock_unlock(p_lock);
}

- (id)backupTimerForParticipantAccessoryUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_backupTimers, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)removeBackupTimerWithParticipantAccessoryUUID:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_backupTimers, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)startBackupTimerWithParticipantAccessoryUUID:(id)a3 dueToFailedMessageIdentifier:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  -[HMDMediaGroupsAggregatorBackupSender backupTimerForParticipantAccessoryUUID:](self, "backupTimerForParticipantAccessoryUUID:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentMessageIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(self) = objc_msgSend(v7, "hmf_isEqualToUUID:", v6);

  if ((_DWORD)self)
    objc_msgSend(v8, "startRetryTimer");

}

- (void)markAttemptForParticipantAccessoryUUID:(id)a3 withMessageIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  HMDMediaGroupsAggregatorBackupSender *v11;
  NSObject *v12;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDMediaGroupsAggregatorBackupSender backupTimerForParticipantAccessoryUUID:](self, "backupTimerForParticipantAccessoryUUID:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "markAttemptWithMessageIdentifier:", v7);
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = self;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543618;
      v15 = v13;
      v16 = 2112;
      v17 = v6;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Failed to mark backup timer attempt due to no timer for accessory UUID: %@", (uint8_t *)&v14, 0x16u);

    }
    objc_autoreleasePoolPop(v10);
  }

}

- (void)didFireTimerForMediaGroupsAggregateBackupMessageTimer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDMediaGroupsAggregatorBackupSender *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "participantAccessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsAggregatorBackupSender backupTimerForParticipantAccessoryUUID:](self, "backupTimerForParticipantAccessoryUUID:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 && v6 == v4)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "participantAccessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v10;
      v15 = 2112;
      v16 = v11;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Backup timer fired for participant accessory uuid: %@", (uint8_t *)&v13, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(v4, "participantAccessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaGroupsAggregatorBackupSender _sendBackupToParticipantAccessoryUUID:](v8, "_sendBackupToParticipantAccessoryUUID:", v12);

  }
}

- (id)mediaGroupsAggregateBackupMessageTimerWithParticipantAccessoryUUID:(id)a3
{
  id v3;
  HMDMediaGroupsAggregateBackupMessageTimer *v4;

  v3 = a3;
  v4 = -[HMDMediaGroupsAggregateBackupMessageTimer initWithParticipantAccessoryUUID:]([HMDMediaGroupsAggregateBackupMessageTimer alloc], "initWithParticipantAccessoryUUID:", v3);

  return v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDMediaGroupsAggregatorBackupSender identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsAggregatorBackupSenderDataSource)dataSource
{
  return (HMDMediaGroupsAggregatorBackupSenderDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMDMediaGroupsAggregateBackupMessageTimerProvider)backupTimerProvider
{
  return (HMDMediaGroupsAggregateBackupMessageTimerProvider *)objc_loadWeakRetained((id *)&self->_backupTimerProvider);
}

- (void)setBackupTimerProvider:(id)a3
{
  objc_storeWeak((id *)&self->_backupTimerProvider, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_backupTimerProvider);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_backupTimers, 0);
}

uint64_t __94__HMDMediaGroupsAggregatorBackupSender_routeBackedUpGroupsMessage_toParticipantAccessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "locallyRouteGroupsBackupDataMessage:toParticipantAccessoryUUID:", a2, *(_QWORD *)(a1 + 40));
}

void __101__HMDMediaGroupsAggregatorBackupSender__sendBackupToFirstPartyParticipantAccessoryUUID_backupGroups___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543618;
      v12 = v10;
      v13 = 2112;
      v14 = v5;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_ERROR, "%{public}@Groups backup data message responded with error: %@", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
    objc_msgSend(*(id *)(a1 + 32), "startBackupTimerWithParticipantAccessoryUUID:dueToFailedMessageIdentifier:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "removeBackupTimerWithParticipantAccessoryUUID:", *(_QWORD *)(a1 + 40));
  }

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t17 != -1)
    dispatch_once(&logCategory__hmf_once_t17, &__block_literal_global_16504);
  return (id)logCategory__hmf_once_v18;
}

void __51__HMDMediaGroupsAggregatorBackupSender_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v18;
  logCategory__hmf_once_v18 = v0;

}

@end
