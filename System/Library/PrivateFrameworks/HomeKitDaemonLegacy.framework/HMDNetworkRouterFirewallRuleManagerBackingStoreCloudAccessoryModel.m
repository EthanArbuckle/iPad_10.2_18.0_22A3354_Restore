@implementation HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6
{
  id v10;
  id v11;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v13;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v14;
  objc_super v16;

  v10 = a5;
  v11 = a6;
  v16.receiver = self;
  v16.super_class = (Class)HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel;
  v12 = -[HMBModel initWithModelID:parentModelID:](&v16, sel_initWithModelID_parentModelID_, a3, a4);
  v13 = v12;
  if (v12)
  {
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel setNetworkDeclarationsData:](v12, "setNetworkDeclarationsData:", v10);
    -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel setPairedMetadataData:](v13, "setPairedMetadataData:", v11);
    v14 = v13;
  }

  return v13;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithModelID:(id)a3 parentModelID:(id)a4 networkDeclarationsData:(id)a5
{
  return -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:](self, "initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:", a3, a4, a5, 0);
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5 pairedMetadataData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend((id)objc_opt_class(), "modelIDForRecordID:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "modelID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:](self, "initWithModelID:parentModelID:networkDeclarationsData:pairedMetadataData:", v14, v15, v11, v10);
  return v16;
}

- (HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel)initWithCloudZoneID:(id)a3 recordID:(id)a4 networkDeclarationsData:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend((id)objc_opt_class(), "modelIDForRecordID:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "modelID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel initWithModelID:parentModelID:networkDeclarationsData:](self, "initWithModelID:parentModelID:networkDeclarationsData:", v11, v12, v8);
  return v13;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_132593 != -1)
    dispatch_once(&logCategory__hmf_once_t0_132593, &__block_literal_global_132594);
  return (id)logCategory__hmf_once_v1_132595;
}

+ (NSUUID)namespaceID
{
  if (namespaceID_onceToken != -1)
    dispatch_once(&namespaceID_onceToken, &__block_literal_global_1_132590);
  return (NSUUID *)(id)namespaceID_namespaceID;
}

+ (id)modelIDForRecordID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "recordName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v5;
  objc_msgSend(v4, "zoneID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "zoneName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v21;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v14), "dataUsingEncoding:", 4, (_QWORD)v20);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendData:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v12);
  }

  v16 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(a1, "namespaceID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "hmf_UUIDWithNamespace:data:", v17, v9);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_132577 != -1)
    dispatch_once(&hmbProperties_onceToken_132577, &__block_literal_global_5_132578);
  return (id)hmbProperties_properties_132579;
}

void __83__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("networkDeclarationsData");
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[1] = CFSTR("pairedMetadataData");
  v5[0] = v0;
  objc_msgSend(MEMORY[0x1E0D32C80], "fieldWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[1] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)hmbProperties_properties_132579;
  hmbProperties_properties_132579 = v2;

}

void __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_namespaceID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("da9f7191-31bc-4567-9424-89b86310c2e7"));
  v1 = (void *)namespaceID_namespaceID;
  namespaceID_namespaceID = v0;

}

void __81__HMDNetworkRouterFirewallRuleManagerBackingStoreCloudAccessoryModel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_132595;
  logCategory__hmf_once_v1_132595 = v0;

}

@end
