@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_217077 != -1)
    dispatch_once(&logCategory__hmf_once_t0_217077, &__block_literal_global_217078);
  return (id)logCategory__hmf_once_v1_217079;
}

+ (NSUUID)modelID
{
  if (modelID_onceToken != -1)
    dispatch_once(&modelID_onceToken, &__block_literal_global_1_217074);
  return (NSUUID *)(id)modelID_modelID;
}

+ (NSUUID)parentModelID
{
  if (parentModelID_onceToken != -1)
    dispatch_once(&parentModelID_onceToken, &__block_literal_global_3_217070);
  return (NSUUID *)(id)parentModelID_parentModelID;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_217062 != -1)
    dispatch_once(&hmbProperties_onceToken_217062, &__block_literal_global_6_217063);
  return (id)hmbProperties_properties_217064;
}

void __88__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_hmbProperties__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x24BDAC8D0];
  v3 = CFSTR("archivedLastSynchronizedRecordIDs");
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = v0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hmbProperties_properties_217064;
  hmbProperties_properties_217064 = v1;

}

void __88__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_parentModelID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("e04f2c76-f905-4dd1-81b1-0336eb0cc6db"));
  v1 = (void *)parentModelID_parentModelID;
  parentModelID_parentModelID = v0;

}

void __82__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_modelID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("b16edda7-1296-4be2-b225-bb7beb536415"));
  v1 = (void *)modelID_modelID;
  modelID_modelID = v0;

}

void __86__HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_217079;
  logCategory__hmf_once_v1_217079 = v0;

}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel)init
{
  void *v3;
  void *v4;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *v5;

  objc_msgSend((id)objc_opt_class(), "modelID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "parentModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v3, v4);

  return v5;
}

- (NSSet)lastSynchronizedRecordIDs
{
  NSSet *lastSynchronizedRecordIDs;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSSet *v14;
  NSSet *v15;
  void *v16;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *v17;
  NSObject *v18;
  void *v19;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *v20;
  void *v21;
  NSSet *v22;
  NSSet *v23;
  id v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  id v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x24BDAC8D0];
  lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  if (lastSynchronizedRecordIDs)
    return lastSynchronizedRecordIDs;
  -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel archivedLastSynchronizedRecordIDs](self, "archivedLastSynchronizedRecordIDs");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDBCF20];
    v32[0] = objc_opt_class();
    v32[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v32, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BDD1620];
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel archivedLastSynchronizedRecordIDs](self, "archivedLastSynchronizedRecordIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v8, "unarchivedObjectOfClasses:fromData:error:", v7, v9, &v25);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v25;

    if (v10)
    {
      v12 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
      v14 = v13;

      v15 = self->_lastSynchronizedRecordIDs;
      self->_lastSynchronizedRecordIDs = v14;

      if (self->_lastSynchronizedRecordIDs)
        goto LABEL_14;
      v16 = (void *)MEMORY[0x227676638]();
      v17 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v19;
        v28 = 2112;
        v29 = v12;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Unarchived an object of an unexpected type: %@", buf, 0x16u);
LABEL_12:

      }
    }
    else
    {
      v16 = (void *)MEMORY[0x227676638]();
      v20 = self;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel archivedLastSynchronizedRecordIDs](v20, "archivedLastSynchronizedRecordIDs");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v27 = v19;
        v28 = 2112;
        v29 = v21;
        v30 = 2112;
        v31 = v11;
        _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_ERROR, "%{public}@Failed to unarchive %@: %@", buf, 0x20u);

        goto LABEL_12;
      }
    }

    objc_autoreleasePoolPop(v16);
LABEL_14:

  }
  lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  if (!lastSynchronizedRecordIDs)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v22 = (NSSet *)objc_claimAutoreleasedReturnValue();
    v23 = self->_lastSynchronizedRecordIDs;
    self->_lastSynchronizedRecordIDs = v22;

    lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
  }
  return lastSynchronizedRecordIDs;
}

- (void)setLastSynchronizedRecordIDs:(id)a3
{
  id v4;
  void *v5;
  NSSet *lastSynchronizedRecordIDs;
  NSSet *v7;
  void *v8;
  HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  NSSet *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!objc_msgSend(v4, "count"))
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel setArchivedLastSynchronizedRecordIDs:](self, "setArchivedLastSynchronizedRecordIDs:", 0);
    goto LABEL_5;
  }
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  lastSynchronizedRecordIDs = (NSSet *)v12;
  if (v5)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreMirrorInternalStateModel setArchivedLastSynchronizedRecordIDs:](self, "setArchivedLastSynchronizedRecordIDs:", v5);

LABEL_5:
    v7 = (NSSet *)v4;
    lastSynchronizedRecordIDs = self->_lastSynchronizedRecordIDs;
    self->_lastSynchronizedRecordIDs = v7;
    goto LABEL_9;
  }
  v8 = (void *)MEMORY[0x227676638]();
  v9 = self;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v14 = v11;
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = lastSynchronizedRecordIDs;
    _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@Failed to archive %@: %@", buf, 0x20u);

  }
  objc_autoreleasePoolPop(v8);
LABEL_9:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastSynchronizedRecordIDs, 0);
}

@end
