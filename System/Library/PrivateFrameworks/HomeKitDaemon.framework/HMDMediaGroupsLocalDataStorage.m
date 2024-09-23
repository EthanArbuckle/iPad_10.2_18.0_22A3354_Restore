@implementation HMDMediaGroupsLocalDataStorage

- (HMDMediaGroupsLocalDataStorage)initWithIdentifier:(id)a3 backupSender:(id)a4
{
  id v7;
  id v8;
  HMDMediaGroupsLocalDataStorage *v9;
  HMDMediaGroupsLocalDataStorage *v10;
  uint64_t v11;
  NSMutableDictionary *groups;
  uint64_t v13;
  NSMutableDictionary *participantAccessoryUUIDToAssociatedGroupIdentifier;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HMDMediaGroupsLocalDataStorage;
  v9 = -[HMDMediaGroupsLocalDataStorage init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_storeStrong((id *)&v10->_backupDataSender, a4);
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v11 = objc_claimAutoreleasedReturnValue();
    groups = v10->_groups;
    v10->_groups = (NSMutableDictionary *)v11;

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    participantAccessoryUUIDToAssociatedGroupIdentifier = v10->_participantAccessoryUUIDToAssociatedGroupIdentifier;
    v10->_participantAccessoryUUIDToAssociatedGroupIdentifier = (NSMutableDictionary *)v13;

  }
  return v10;
}

- (void)updateUsingParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4 backedUpGroupData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  HMDMediaGroupsLocalDataStorage *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  HMDMediaGroupsLocalDataStorage *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x227676638]();
  v12 = self;
  HMFGetOSLogHandle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138544130;
    v24 = v14;
    v25 = 2112;
    v26 = v8;
    v27 = 2112;
    v28 = v9;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Updating using participant accessory uuid: %@ associated group identifier: %@ backup data count: %@", (uint8_t *)&v23, 0x2Au);

  }
  objc_autoreleasePoolPop(v11);
  objc_msgSend(MEMORY[0x24BDD7790], "groupsWithProtoBufferData:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");
  if (v17 == objc_msgSend(v10, "count"))
  {
    -[HMDMediaGroupsLocalDataStorage setParticipantAccessoryUUID:associatedGroupIdentifier:](v12, "setParticipantAccessoryUUID:associatedGroupIdentifier:", v8, v9);
    -[HMDMediaGroupsLocalDataStorage addBackedUpGroups:](v12, "addBackedUpGroups:", v16);
  }
  else
  {
    v18 = (void *)MEMORY[0x227676638]();
    v19 = v12;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 138543874;
      v24 = v21;
      v25 = 2112;
      v26 = v22;
      v27 = 2112;
      v28 = v16;
      _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_INFO, "%{public}@Failed to decode all encoded groups of count: %@ decoded groups: %@", (uint8_t *)&v23, 0x20u);

    }
    objc_autoreleasePoolPop(v18);
  }

}

- (void)updateGroup:(id)a3 participantAccessoryUUIDs:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsLocalDataStorage *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *);
  void *v17;
  HMDMediaGroupsLocalDataStorage *v18;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
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
    *(_DWORD *)buf = 138543874;
    v21 = v11;
    v22 = 2112;
    v23 = v6;
    v24 = 2112;
    v25 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Updating using group: %@ participant accessory uuids: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend(v6, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsLocalDataStorage unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:](v9, "unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:", v12);

  v14 = MEMORY[0x24BDAC760];
  v15 = 3221225472;
  v16 = __72__HMDMediaGroupsLocalDataStorage_updateGroup_participantAccessoryUUIDs___block_invoke;
  v17 = &unk_24E782620;
  v18 = v9;
  v19 = v6;
  v13 = v6;
  objc_msgSend(v7, "na_each:", &v14);
  -[HMDMediaGroupsLocalDataStorage updateGroup:](v9, "updateGroup:", v13, v14, v15, v16, v17, v18);

}

- (void)backupData
{
  void *v3;
  _QWORD v4[5];

  -[HMDMediaGroupsLocalDataStorage allParticipantAccessoryUUIDs](self, "allParticipantAccessoryUUIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__HMDMediaGroupsLocalDataStorage_backupData__block_invoke;
  v4[3] = &unk_24E791928;
  v4[4] = self;
  objc_msgSend(v3, "na_each:", v4);

}

- (id)backupGroupsForParticipantAccessoryUUID:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[HMDMediaGroupsLocalDataStorage associatedGroupIdentifierForParticipantAccessoryUUID:](self, "associatedGroupIdentifierForParticipantAccessoryUUID:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HMDMediaGroupsLocalDataStorage associatedGroupsWithGroupIdentifier:](self, "associatedGroupsWithGroupIdentifier:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }
  objc_msgSend(v5, "na_map:", &__block_literal_global_94412);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)associatedGroupsWithGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  HMDMediaGroupsLocalDataStorage *v13;
  NSObject *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsLocalDataStorage groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v8 = MEMORY[0x24BDAC760];
    while (1)
    {
      v17[0] = v8;
      v17[1] = 3221225472;
      v17[2] = __70__HMDMediaGroupsLocalDataStorage_associatedGroupsWithGroupIdentifier___block_invoke;
      v17[3] = &unk_24E7885B0;
      v9 = v4;
      v18 = v9;
      objc_msgSend(v6, "na_firstObjectPassingTest:", v17);
      v10 = objc_claimAutoreleasedReturnValue();
      if (!v10)
        break;
      v11 = (void *)v10;
      objc_msgSend(v6, "removeObject:", v10);
      objc_msgSend(v7, "addObject:", v11);
      objc_msgSend(v11, "associatedGroupIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();

      if (!v4)
        goto LABEL_9;
    }
    v12 = (void *)MEMORY[0x227676638]();
    v13 = self;
    HMFGetOSLogHandle();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v20 = v15;
      v21 = 2112;
      v22 = v9;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to find associated group with identifier: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v12);

  }
LABEL_9:

  return v7;
}

- (void)clearCachedData
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *v4;
  NSMutableDictionary *groups;
  NSMutableDictionary *v6;
  NSMutableDictionary *participantAccessoryUUIDToAssociatedGroupIdentifier;
  id v8;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  groups = self->_groups;
  self->_groups = v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v6 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  participantAccessoryUUIDToAssociatedGroupIdentifier = self->_participantAccessoryUUIDToAssociatedGroupIdentifier;
  self->_participantAccessoryUUIDToAssociatedGroupIdentifier = v6;

  os_unfair_lock_unlock(p_lock);
  -[HMDMediaGroupsLocalDataStorage backupDataSender](self, "backupDataSender");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "clearCachedData");

}

- (void)clearCachedDataForParticipantAccessoryUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDMediaGroupsLocalDataStorage removeAssociatedGroupIdentifierForParticipantAccessoryUUID:](self, "removeAssociatedGroupIdentifierForParticipantAccessoryUUID:", v4);
  -[HMDMediaGroupsLocalDataStorage backupDataSender](self, "backupDataSender");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clearCachedDataForParticipantAccessoryUUID:", v4);

}

- (id)allParticipantAccessoryUUIDs
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](self->_participantAccessoryUUIDToAssociatedGroupIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeAssociatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_participantAccessoryUUIDToAssociatedGroupIdentifier, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)associatedGroupIdentifierForParticipantAccessoryUUID:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_participantAccessoryUUIDToAssociatedGroupIdentifier, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaGroupsLocalDataStorage nullSentinelUUID](self, "nullSentinelUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "hmf_isEqualToUUID:", v7))
    v8 = 0;
  else
    v8 = v6;
  v9 = v8;

  os_unfair_lock_unlock(p_lock);
  return v9;
}

- (void)unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
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
    *(_DWORD *)buf = 138543618;
    v14 = v8;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Unsetting participant accessory uuids with associated group identifier: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](v6->_participantAccessoryUUIDToAssociatedGroupIdentifier, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __94__HMDMediaGroupsLocalDataStorage_unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier___block_invoke;
  v11[3] = &unk_24E782620;
  v11[4] = v6;
  v10 = v4;
  v12 = v10;
  objc_msgSend(v9, "na_each:", v11);

  os_unfair_lock_unlock(&v6->_lock);
}

- (id)nullSentinelUUID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

- (void)setParticipantAccessoryUUID:(id)a3 associatedGroupIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDMediaGroupsLocalDataStorage *v9;
  NSObject *v10;
  void *v11;
  NSMutableDictionary *participantAccessoryUUIDToAssociatedGroupIdentifier;
  void *v13;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
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
    v14 = 138543874;
    v15 = v11;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Setting participant accessory uuid: %@ associated group identifier: %@", (uint8_t *)&v14, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
  os_unfair_lock_lock_with_options();
  participantAccessoryUUIDToAssociatedGroupIdentifier = v9->_participantAccessoryUUIDToAssociatedGroupIdentifier;
  v13 = v7;
  if (!v7)
  {
    -[HMDMediaGroupsLocalDataStorage nullSentinelUUID](v9, "nullSentinelUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[NSMutableDictionary setObject:forKey:](participantAccessoryUUIDToAssociatedGroupIdentifier, "setObject:forKey:", v13, v6);
  if (!v7)

  os_unfair_lock_unlock(&v9->_lock);
}

- (NSArray)groups
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allValues](self->_groups, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)groupWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_groups, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (void)addBackedUpGroups:(id)a3
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __52__HMDMediaGroupsLocalDataStorage_addBackedUpGroups___block_invoke;
  v3[3] = &unk_24E782688;
  v3[4] = self;
  objc_msgSend(a3, "na_each:", v3);
}

- (void)addBackedUpGroup:(id)a3
{
  id v4;
  NSMutableDictionary *groups;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  HMDMediaGroupsLocalDataStorage *v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  HMDMediaGroupsLocalDataStorage *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  os_unfair_lock_lock_with_options();
  groups = self->_groups;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](groups, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    os_unfair_lock_unlock(&self->_lock);
    v8 = objc_msgSend(v7, "isEqual:", v4);
    v9 = (void *)MEMORY[0x227676638]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (v8)
    {
      if (v12)
      {
        HMFGetLogIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 138543618;
        v20 = v13;
        v21 = 2112;
        v22 = v4;
        _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Already added backed up group: %@", (uint8_t *)&v19, 0x16u);

      }
    }
    else if (v12)
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = v18;
      v21 = 2112;
      v22 = v4;
      v23 = 2112;
      v24 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Dropping backed up group: %@ existing group: %@", (uint8_t *)&v19, 0x20u);

    }
  }
  else
  {
    v14 = self->_groups;
    objc_msgSend(v4, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v4, v15);

    os_unfair_lock_unlock(&self->_lock);
    v9 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138543618;
      v20 = v17;
      v21 = 2112;
      v22 = v4;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Added backed up group: %@", (uint8_t *)&v19, 0x16u);

    }
  }

  objc_autoreleasePoolPop(v9);
}

- (void)updateGroup:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *groups;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Update group: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  p_lock = &v6->_lock;
  os_unfair_lock_lock_with_options();
  groups = v6->_groups;
  objc_msgSend(v4, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](groups, "setObject:forKey:", v4, v11);

  os_unfair_lock_unlock(p_lock);
}

- (void)removeGroupWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  HMDMediaGroupsLocalDataStorage *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543618;
    v10 = v8;
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Remove group with identifier: %@", (uint8_t *)&v9, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDMediaGroupsLocalDataStorage unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:](v6, "unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier:", v4);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](v6->_groups, "removeObjectForKey:", v4);
  os_unfair_lock_unlock(&v6->_lock);

}

- (id)routerForParticipantAccessoryUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMDMediaGroupsLocalDataStorage *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsLocalDataStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "routerForParticipantAccessoryUUID:mediaGroupsLocalDataStorage:", v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get router for participant accessory UUID: %@ due to no data source", (uint8_t *)&v13, 0x16u);

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
  HMDMediaGroupsLocalDataStorage *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDMediaGroupsLocalDataStorage dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "receiverForParticipantAccessoryUUID:mediaGroupsLocalDataStorage:", v4, self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v11;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Failed to get reciever for participant accessory UUID: %@ due to no data source", (uint8_t *)&v13, 0x16u);

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

  -[HMDMediaGroupsLocalDataStorage identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (HMDMediaGroupsLocalDataStorageDataSource)dataSource
{
  return (HMDMediaGroupsLocalDataStorageDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (HMDMediaGroupsAggregatorBackupSender)backupDataSender
{
  return (HMDMediaGroupsAggregatorBackupSender *)objc_getProperty(self, a2, 48, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backupDataSender, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_participantAccessoryUUIDToAssociatedGroupIdentifier, 0);
  objc_storeStrong((id *)&self->_groups, 0);
}

uint64_t __52__HMDMediaGroupsLocalDataStorage_addBackedUpGroups___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addBackedUpGroup:", a2);
}

void __94__HMDMediaGroupsLocalDataStorage_unsetParticipantAccessoryUUIDsWithAssociatedGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 40)))
  {
    v4 = *(_QWORD **)(a1 + 32);
    v5 = (void *)v4[3];
    objc_msgSend(v4, "nullSentinelUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, v7);

  }
}

uint64_t __70__HMDMediaGroupsLocalDataStorage_associatedGroupsWithGroupIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "hmf_isEqualToUUID:", v3);

  return v4;
}

uint64_t __74__HMDMediaGroupsLocalDataStorage_backupGroupsForParticipantAccessoryUUID___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeToProtoBufferData");
}

void __44__HMDMediaGroupsLocalDataStorage_backupData__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "backupDataSender");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sendBackupToParticipantAccessoryUUID:", v3);

}

void __72__HMDMediaGroupsLocalDataStorage_updateGroup_participantAccessoryUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = *(void **)(a1 + 40);
  v4 = a2;
  objc_msgSend(v3, "identifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setParticipantAccessoryUUID:associatedGroupIdentifier:", v4, v5);

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t24_94424 != -1)
    dispatch_once(&logCategory__hmf_once_t24_94424, &__block_literal_global_10_94425);
  return (id)logCategory__hmf_once_v25_94426;
}

void __45__HMDMediaGroupsLocalDataStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v25_94426;
  logCategory__hmf_once_v25_94426 = v0;

}

@end
