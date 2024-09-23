@implementation HMDAccessoryTransaction

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  objc_super v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("blocked")) & 1) != 0)
  {
    v11 = 0;
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("productDataV2")))
    {
      objc_msgSend(v8, "productData");
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = (void *)v12;
      v14 = (void *)*MEMORY[0x24BDBD430];
      if (v12)
        v14 = (void *)v12;
      v11 = v14;
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", CFSTR("roomUUID")))
      {
        objc_msgSend(v8, "room");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", CFSTR("hostAccessoryUUID")))
        {
          v21.receiver = self;
          v21.super_class = (Class)HMDAccessoryTransaction;
          -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v21, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
          v11 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_15;
        }
        objc_msgSend(v8, "hostAccessory");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v13 = v15;
      objc_msgSend(v15, "modelID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "UUIDString");
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      v19 = (void *)*MEMORY[0x24BDBD430];
      if (v17)
        v19 = (void *)v17;
      v11 = v19;

    }
  }
LABEL_15:

  return v11;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  HMDAccessoryTransaction *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  HMDAccessoryTransaction *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  HMDAccessoryTransaction *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v38;
  objc_super v39;
  id v40;
  id v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("productData")))
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("room")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("roomUUID")))
        goto LABEL_24;
      -[HMDAccessoryTransaction roomUUID](self, "roomUUID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v15 = objc_alloc(MEMORY[0x24BDD1880]);
        -[HMDAccessoryTransaction roomUUID](self, "roomUUID");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v15, "initWithUUIDString:", v16);

        if (v12)
        {
          objc_msgSend((id)objc_opt_class(), "cd_getMKFRoom:", v12);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          if (v14)
          {
LABEL_31:

            goto LABEL_34;
          }
        }
      }
      v17 = (void *)MEMORY[0x227676638]();
      v18 = self;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v20;
        v44 = 2112;
        v45 = v12;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Did not find the room with UUID (%@). Using default Room.", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v17);
      -[HMDBackingStoreModelObject parentUUID](v18, "parentUUID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0;
      +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v21, objc_opt_class(), &v41);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v41;

      if (!v22 || v23)
      {
        v32 = (void *)MEMORY[0x227676638]();
        v33 = v18;
        HMFGetOSLogHandle();
        v34 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          -[HMDBackingStoreModelObject parentUUID](v33, "parentUUID");
          v38 = v32;
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v43 = v35;
          v44 = 2112;
          v45 = v36;
          v46 = 2112;
          v47 = v23;
          _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@Unable to find NSManagedObject for home with UUID %@: %@", buf, 0x20u);

          v32 = v38;
        }

        objc_autoreleasePoolPop(v32);
        v14 = 0;
      }
      else
      {
        objc_msgSend(v22, "defaultRoom");
        v14 = (id)objc_claimAutoreleasedReturnValue();
      }

LABEL_30:
      goto LABEL_31;
    }
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("hostAccessory")))
    {
      if (!-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("hostAccessoryUUID")))
        goto LABEL_24;
      -[HMDAccessoryTransaction hostAccessoryUUID](self, "hostAccessoryUUID");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
        v25 = objc_alloc(MEMORY[0x24BDD1880]);
        -[HMDAccessoryTransaction hostAccessoryUUID](self, "hostAccessoryUUID");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v25, "initWithUUIDString:", v26);

        if (v12)
        {
          v40 = 0;
          +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v12, objc_opt_class(), &v40);
          v14 = (id)objc_claimAutoreleasedReturnValue();
          v23 = v40;
          if (!v14)
          {
            v27 = (void *)MEMORY[0x227676638]();
            v28 = self;
            HMFGetOSLogHandle();
            v29 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v43 = v30;
              v44 = 2112;
              v45 = v12;
              v46 = 2112;
              v47 = v23;
              _os_log_impl(&dword_2218F0000, v29, OS_LOG_TYPE_ERROR, "%{public}@Unable to find MKFAccessory for host accessory with UUID %@: %@", buf, 0x20u);

            }
            objc_autoreleasePoolPop(v27);
          }
          goto LABEL_30;
        }
      }
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v31 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v39.receiver = self;
      v39.super_class = (Class)HMDAccessoryTransaction;
      -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v39, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
      v31 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (id)v31;
    goto LABEL_34;
  }
  if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("productDataV2")))
  {
    -[HMDAccessoryTransaction productDataV2](self, "productDataV2");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = (void *)v11;
    v13 = (void *)*MEMORY[0x24BDBD430];
    if (v11)
      v13 = (void *)v11;
    v14 = v13;
    goto LABEL_31;
  }
LABEL_24:
  v14 = 0;
LABEL_34:

  return v14;
}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("home");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_getMKFAccessoryFromAccessoryUUID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", v3);

  objc_msgSend(v4, "cd_getMKFAccessoryFromAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cd_getMKFAccessoryFromAccessory:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
    _HMFPreconditionFailure();
  v5 = v4;
  v16 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v4, objc_opt_class(), &v16);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v16;
  v8 = v7;
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v14 = v6;
  }
  else
  {
    v10 = (void *)MEMORY[0x227676638]();
    v11 = a1;
    HMFGetOSLogHandle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v18 = v13;
      v19 = 2112;
      v20 = v5;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_ERROR, "%{public}@Unable to find the MKFAccessory from UUID : %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v10);
    v14 = 0;
  }

  return v14;
}

+ (id)cd_getMKFRoom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14 = 0;
  +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofModelType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofModelType:error:", v4, objc_opt_class(), &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  v7 = v6;
  if (v5)
    v8 = v6 == 0;
  else
    v8 = 0;
  if (!v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v16 = v12;
      v17 = 2112;
      v18 = v4;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Unable to find NSManagedObject for room with UUID %@: %@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v9);
  }

  return v5;
}

+ (id)properties
{
  if (properties_onceToken_251535 != -1)
    dispatch_once(&properties_onceToken_251535, &__block_literal_global_251536);
  return (id)properties__properties_251537;
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
  uint64_t v8;
  void *v9;
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
  _QWORD v37[35];
  _QWORD v38[37];

  v38[35] = *MEMORY[0x24BDAC8D0];
  v37[0] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v36;
  v37[1] = CFSTR("configuredName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v35;
  v37[2] = CFSTR("identifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v34;
  v37[3] = CFSTR("providedName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v33;
  v37[4] = CFSTR("accessoryCategory");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v38[4] = v32;
  v37[5] = CFSTR("roomUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v38[5] = v31;
  v37[6] = CFSTR("hostAccessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v38[6] = v30;
  v37[7] = CFSTR("primary");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v38[7] = v29;
  v37[8] = CFSTR("model");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v38[8] = v28;
  v37[9] = CFSTR("manufacturer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v38[9] = v27;
  v37[10] = CFSTR("firmwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[10] = v26;
  v37[11] = CFSTR("displayableFirmwareVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v38[11] = v25;
  v37[12] = CFSTR("serialNumber");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v38[12] = v24;
  v37[13] = CFSTR("productData");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v38[13] = v23;
  v37[14] = CFSTR("productDataV2");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v38[14] = v22;
  v37[15] = CFSTR("networkClientIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v38[15] = v21;
  v37[16] = CFSTR("networkRouterUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v38[16] = v20;
  v37[17] = CFSTR("targetNetworkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo deprecatedField](HMDBackingStoreModelObjectStorageInfo, "deprecatedField");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v38[17] = v19;
  v37[18] = CFSTR("currentNetworkProtectionMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v38[18] = v18;
  v37[19] = CFSTR("networkClientLAN");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v38[19] = v17;
  v37[20] = CFSTR("networkClientProfileFingerprint");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[20] = v16;
  v37[21] = CFSTR("wiFiUniquePreSharedKey");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v38[21] = v15;
  v37[22] = CFSTR("wiFiCredentialType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v38[22] = v14;
  v37[23] = CFSTR("pendingConfigurationIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[23] = v13;
  v37[24] = CFSTR("blocked");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[24] = v12;
  v37[25] = CFSTR("appliedFirewallWANRules");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v38[25] = v11;
  v37[26] = CFSTR("lastNetworkAccessViolationOccurrenceSince1970");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[26] = v10;
  v37[27] = CFSTR("lastNetworkAccessViolationResetSince1970");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v38[27] = v0;
  v37[28] = CFSTR("suspendCapable");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v38[28] = v1;
  v37[29] = CFSTR("lastSeenDate");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38[29] = v2;
  v37[30] = CFSTR("lowBattery");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v38[30] = v3;
  v37[31] = CFSTR("primaryProfileVersion");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v38[31] = v4;
  v37[32] = CFSTR("initialManufacturer");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38[32] = v5;
  v37[33] = CFSTR("initialModel");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v38[33] = v6;
  v37[34] = CFSTR("initialCategoryIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38[34] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 35);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)properties__properties_251537;
  properties__properties_251537 = v8;

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

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", 2);
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
    v7 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDAccessoryTransaction roomUUID](self, "roomUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    objc_msgSend(v3, "addObject:", v9);

  }
  -[HMDAccessoryTransaction hostAccessoryUUID](self, "hostAccessoryUUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc(MEMORY[0x24BDD1880]);
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

- (void)setConfiguredNetworkProtectionGroupUUIDString:(id)a3
{
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUIDString, a3);
}

- (OS_dispatch_group)configurationTracker
{
  return self->_configurationTracker;
}

- (void)setConfigurationTracker:(id)a3
{
  objc_storeStrong((id *)&self->_configurationTracker, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationTracker, 0);
  objc_storeStrong((id *)&self->_configuredNetworkProtectionGroupUUIDString, 0);
}

@end
