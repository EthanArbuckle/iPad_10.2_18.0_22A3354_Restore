@implementation HMDServiceTransaction

- (NSString)lastSeenConfiguredNameLocal
{
  return self->_lastSeenConfiguredNameLocal;
}

- (void)setLastSeenConfiguredNameLocal:(id)a3
{
  objc_storeStrong((id *)&self->_lastSeenConfiguredNameLocal, a3);
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
  objc_storeStrong((id *)&self->_lastSeenConfiguredNameLocal, 0);
}

+ (id)properties
{
  if (properties_onceToken_103002 != -1)
    dispatch_once(&properties_onceToken_103002, &__block_literal_global_504);
  return (id)properties__properties_103003;
}

void __35__HMDServiceTransaction_properties__block_invoke()
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
  _QWORD v23[21];
  _QWORD v24[23];

  v24[21] = *MEMORY[0x24BDAC8D0];
  v23[0] = CFSTR("instanceID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v22;
  v23[1] = CFSTR("name");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v21;
  v23[2] = CFSTR("providedName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[2] = v20;
  v23[3] = CFSTR("serviceType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v19;
  v23[4] = CFSTR("associatedServiceType");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24[4] = v18;
  v23[5] = CFSTR("serviceSubtype");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v24[5] = v17;
  v23[6] = CFSTR("labelIndex");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[6] = v16;
  v23[7] = CFSTR("labelNamespace");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[7] = v15;
  v23[8] = CFSTR("configurationState");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v24[8] = v14;
  v23[9] = CFSTR("linkedServices");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24[9] = v13;
  v23[10] = CFSTR("hidden");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24[10] = v12;
  v23[11] = CFSTR("primary");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[11] = v11;
  v23[12] = CFSTR("characteristics");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v24[12] = v0;
  v23[13] = CFSTR("expectedConfiguredName");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v24[13] = v1;
  v23[14] = CFSTR("lastKnownDiscoveryMode");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[14] = v2;
  v23[15] = CFSTR("lastKnownOperatingState");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24[15] = v3;
  v23[16] = CFSTR("lastKnownOperatingStateAbnormalReasons");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v24[16] = v4;
  v23[17] = CFSTR("mediaSourceIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24[17] = v5;
  v23[18] = CFSTR("mediaSourceDisplayOrder");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24[18] = v6;
  v23[19] = CFSTR("serviceProperties");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[19] = v7;
  v23[20] = CFSTR("matterEndpointID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[20] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 21);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)properties__properties_103003;
  properties__properties_103003 = v9;

}

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDServiceTransaction;
  v7 = -[HMDBackingStoreModelObject cd_updateManagedObjectInContext:error:](&v11, sel_cd_updateManagedObjectInContext_error_, v6, a4);
  if (v7)
  {
    -[HMDBackingStoreModelObject managedObject](self, "managedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasPersistentChangedValues"))
    {
      objc_msgSend(v8, "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "maybeFixUpCharacteristicWriteActionsInContext:", v6);

    }
  }

  return v7;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  objc_super v23;
  _QWORD v24[4];
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("primary")) & 1) != 0
    || (objc_msgSend(v9, "isEqualToString:", CFSTR("hidden")) & 1) != 0)
  {
    v11 = 0;
    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("serviceType")))
  {
    objc_msgSend(v8, "serviceType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = v12;
    objc_msgSend(v12, "UUIDString");
    v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_9:

    goto LABEL_10;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("serviceSubtype")))
  {
    objc_msgSend(v8, "serviceSubtype");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("associatedServiceType")))
  {
    objc_msgSend(v8, "associatedServiceType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    v17 = (void *)*MEMORY[0x24BDBD430];
    if (v15)
      v17 = (void *)v15;
    v11 = v17;

    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("characteristics")))
  {
    v18 = (void *)MEMORY[0x24BDBCEB8];
    objc_msgSend(v8, "characteristics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "arrayWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "characteristics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __115__HMDServiceTransaction_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v24[3] = &unk_24E796DE8;
    v25 = v20;
    v22 = v20;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v24);

    v11 = (id)objc_msgSend(v22, "copy");
  }
  else
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDServiceTransaction;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v23, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

  return v11;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  HMDServiceTransaction *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id v41;
  HMDServiceTransaction *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("serviceType")))
  {
    v11 = CFSTR("serviceType");
LABEL_7:
    -[HMDBackingStoreModelObject cd_uuidValueFromStringModelObjectField:](self, "cd_uuidValueFromStringModelObjectField:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v13 = (void *)v12;
    goto LABEL_9;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("serviceSubtype")))
  {
    v11 = CFSTR("serviceSubtype");
    goto LABEL_7;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("associatedServiceType")))
  {
    v11 = CFSTR("associatedServiceType");
    goto LABEL_7;
  }
  if (!objc_msgSend(v9, "isEqualToString:", CFSTR("characteristics_")))
  {
    v36.receiver = self;
    v36.super_class = (Class)HMDServiceTransaction;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v36, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v12 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("characteristics")))
  {
    -[HMDBackingStoreModelObject managedObject](self, "managedObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v16 = v15;
    else
      v16 = 0;
    v17 = v16;

    if (!v17)
      _HMFPreconditionFailure();
    v18 = (void *)MEMORY[0x24BDBCEF0];
    -[HMDServiceTransaction characteristics](self, "characteristics");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setWithCapacity:", objc_msgSend(v19, "count"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDServiceTransaction characteristics](self, "characteristics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = MEMORY[0x24BDAC760];
    v39[0] = MEMORY[0x24BDAC760];
    v39[1] = 3221225472;
    v39[2] = __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
    v39[3] = &unk_24E79B828;
    v23 = v17;
    v40 = v23;
    v24 = v10;
    v41 = v24;
    v42 = self;
    v25 = v20;
    v43 = v25;
    objc_msgSend(v21, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v39);

    objc_msgSend(v23, "characteristics");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v26, "mutableCopy");

    objc_msgSend(v27, "minusSet:", v25);
    v37[0] = v22;
    v37[1] = 3221225472;
    v37[2] = __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke_2;
    v37[3] = &unk_24E796DE8;
    v38 = v24;
    v28 = (void *)MEMORY[0x227676638](objc_msgSend(v27, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v37));
    v29 = self;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v34 = v28;
      v35 = v23;
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v25, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "name");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v45 = v31;
      v46 = 2112;
      v47 = v32;
      v48 = 2112;
      v49 = v33;
      _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, "%{public}@Converted %@ characteristics into MKFCharacteristic for MKFService %@", buf, 0x20u);

      v28 = v34;
      v23 = v35;
    }

    objc_autoreleasePoolPop(v28);
    v13 = (void *)objc_msgSend(v25, "copy");

  }
  else
  {
    v13 = 0;
  }
LABEL_9:

  return v13;
}

void __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(id *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("characteristicInstanceID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "pr_findCharacteristicWithInstanceID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;

  if (v6)
  {
    objc_msgSend(v6, "pr_updateWithDictionary:", v10);
    objc_msgSend(v6, "managedObjectContext");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      objc_msgSend(a1[5], "insertObject:", v6);
LABEL_11:
    objc_msgSend(a1[7], "addObject:", v4);

    goto LABEL_12;
  }
  objc_msgSend((id)objc_opt_class(), "cd_createMKFCharacteristicFromDictionary:context:", v10, a1[5]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v8 = v4;
  else
    v8 = 0;
  v9 = v8;

  objc_msgSend(v9, "setService:", a1[4]);
  if (v9)
    goto LABEL_11;
LABEL_12:

}

uint64_t __90__HMDServiceTransaction_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __115__HMDServiceTransaction_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "pr_dictionaryRepresentation");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (NSString)cd_parentReferenceName
{
  return (NSString *)CFSTR("accessory");
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

+ (id)cd_modelTypeForCharacteristicFormat:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = HAPCharacteristicFormatFromString();
  v4 = &unk_2557DD298;
  if ((unint64_t)(v3 - 1) <= 0xE)
  {
    v5 = *off_24E796E08[v3 - 1];

    v4 = v5;
  }
  return v4;
}

+ (id)cd_createMKFCharacteristicFromDictionary:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characteristicMetadata"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("metadataFormat"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = CFSTR("unknown");
  if (v8)
    v10 = (__CFString *)v8;
  v11 = v10;

  objc_msgSend((id)objc_opt_class(), "cd_modelTypeForCharacteristicFormat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class entity](+[HMCContext managedObjectClassFromProtocol:](HMCContext, "managedObjectClassFromProtocol:", v12), "entity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBB698]), "initWithEntity:insertIntoManagedObjectContext:", v13, v5);

  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("characteristicInstanceID"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInstanceID:", v15);

  objc_msgSend(v14, "pr_updateWithDictionary:", v6);
  v16 = v14;
  if (objc_msgSend(v16, "conformsToProtocol:", &unk_2557DD298))
    v17 = v16;
  else
    v17 = 0;
  v18 = v17;

  return v18;
}

@end
