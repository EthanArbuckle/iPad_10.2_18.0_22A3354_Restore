@implementation HMDAccessoryTransaction

- (void)setConfiguredNetworkProtectionGroupUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUIDString, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationTracker, 0);
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUIDString, 0);
}

+ (id)properties
{
  if (properties_onceToken != -1)
    dispatch_once(&properties_onceToken, &__block_literal_global);
  return (id)properties__properties;
}

void __37__HMDAccessoryTransaction_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[37];
  _QWORD v40[39];

  v40[37] = *MEMORY[0x1E0C80C00];
  v39[0] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v38;
  v39[1] = CFSTR("configuredName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v37;
  v39[2] = CFSTR("identifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v40[2] = v36;
  v39[3] = CFSTR("providedName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v40[3] = v35;
  v39[4] = CFSTR("accessoryCategory");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v40[4] = v34;
  v39[5] = CFSTR("roomUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v40[5] = v33;
  v39[6] = CFSTR("hostAccessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v40[6] = v32;
  v39[7] = CFSTR("primary");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v40[7] = v31;
  v39[8] = CFSTR("model");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v40[8] = v30;
  v39[9] = CFSTR("manufacturer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40[9] = v29;
  v39[10] = CFSTR("firmwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v40[10] = v28;
  v39[11] = CFSTR("displayableFirmwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[11] = v27;
  v39[12] = CFSTR("serialNumber");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v40[12] = v26;
  v39[13] = CFSTR("productData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v40[13] = v25;
  v39[14] = CFSTR("productDataV2");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v40[14] = v24;
  v39[15] = CFSTR("networkClientIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v40[15] = v23;
  v39[16] = CFSTR("networkRouterUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v40[16] = v22;
  v39[17] = CFSTR("targetNetworkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v40[17] = v21;
  v39[18] = CFSTR("currentNetworkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v40[18] = v20;
  v39[19] = CFSTR("networkClientLAN");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v40[19] = v19;
  v39[20] = CFSTR("networkClientProfileFingerprint");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v40[20] = v18;
  v39[21] = CFSTR("wiFiUniquePreSharedKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[21] = v17;
  v39[22] = CFSTR("wiFiCredentialType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v40[22] = v16;
  v39[23] = CFSTR("pendingConfigurationIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v40[23] = v15;
  v39[24] = CFSTR("blocked");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v40[24] = v14;
  v39[25] = CFSTR("appliedFirewallWANRules");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[25] = v13;
  v39[26] = CFSTR("lastNetworkAccessViolationOccurrenceSince1970");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v40[26] = v12;
  v39[27] = CFSTR("lastNetworkAccessViolationResetSince1970");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v40[27] = v11;
  v39[28] = CFSTR("suspendCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v40[28] = v0;
  v39[29] = CFSTR("lastSeenDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v40[29] = v1;
  v39[30] = CFSTR("lowBattery");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v40[30] = v2;
  v39[31] = CFSTR("primaryProfileVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v40[31] = v3;
  v39[32] = CFSTR("initialManufacturer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v40[32] = v4;
  v39[33] = CFSTR("initialModel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v40[33] = v5;
  v39[34] = CFSTR("initialCategoryIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v40[34] = v6;
  v39[35] = CFSTR("sharedAdminAddedTimestamp");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[35] = v7;
  v39[36] = CFSTR("pairingsAuditedTimestamp");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[36] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 37);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties;
  properties__properties = v9;

}

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  -[HMDAccessoryTransaction roomUUID](self, "roomUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMDAccessoryTransaction roomUUID](self, "roomUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  -[HMDAccessoryTransaction hostAccessoryUUID](self, "hostAccessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMDAccessoryTransaction hostAccessoryUUID](self, "hostAccessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithUUIDString:", v12);
    objc_msgSend(v3, "addObject:", v13);

  }
  return v3;
}

- (NSString)configuredNetworkProtectionGroupUUIDString
{
  return self->_configuredNetworkProtectionGroupUUIDString;
}

- (OS_dispatch_group)configurationTracker
{
  return self->_configurationTracker;
}

- (void)setConfigurationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_configurationTracker, a3);
}

@end
