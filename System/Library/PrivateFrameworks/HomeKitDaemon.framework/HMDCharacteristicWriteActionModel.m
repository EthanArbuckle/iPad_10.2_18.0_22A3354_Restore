@implementation HMDCharacteristicWriteActionModel

- (BOOL)cd_updateManagedObjectInContext:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDCharacteristicWriteActionModel;
  v7 = -[HMDBackingStoreModelObject cd_updateManagedObjectInContext:error:](&v12, sel_cd_updateManagedObjectInContext_error_, v6, a4);
  if (v7)
  {
    -[HMDBackingStoreModelObject managedObject](self, "managedObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasPersistentChangedValues"))
    {
      objc_msgSend(v8, "service");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "accessory");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "maybeFixUpCharacteristicWriteActionsInContext:", v6);

    }
  }

  return v7;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessory")))
  {
    objc_msgSend(v8, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      objc_msgSend(v8, "service");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "accessory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "modelID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "UUIDString");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = (void *)*MEMORY[0x24BDBD430];
      if (v19)
        v21 = (void *)v19;
      v17 = v21;

      goto LABEL_13;
    }
    objc_msgSend(v8, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "UUIDString");
    v14 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
    v17 = v14;
LABEL_13:

    goto LABEL_14;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("serviceID")))
  {
    objc_msgSend(v8, "service");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "instanceID");
    v15 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v15;
    v16 = (void *)*MEMORY[0x24BDBD430];
    if (v15)
      v16 = (void *)v15;
    v14 = v16;
    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)HMDCharacteristicWriteActionModel;
  -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v23, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
  v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

  return v17;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  HMDCharacteristicWriteActionModel *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  HMDCharacteristicWriteActionModel *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessory")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("accessory")))
    {
      -[HMDCharacteristicWriteActionModel accessory](self, "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        +[HMDHAPAccessoryTransaction cd_getMKFHAPAccessoryFromAccessory:](HMDHAPAccessoryTransaction, "cd_getMKFHAPAccessoryFromAccessory:", v11);
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_21:

      goto LABEL_22;
    }
LABEL_18:
    v17 = 0;
    goto LABEL_22;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("service")))
  {
    v12 = -[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("accessory"));
    v13 = -[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("serviceID"));
    if (v12 || v13)
    {
      if (v12 && v13)
      {
        -[HMDCharacteristicWriteActionModel accessory](self, "accessory");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[HMDCharacteristicWriteActionModel serviceID](self, "serviceID");
        v14 = objc_claimAutoreleasedReturnValue();
        v15 = (void *)v14;
        if (v11 && v14)
        {
          +[HMDHAPAccessoryTransaction cd_getMKFServiceFromAccessoryUUID:serviceInstanceId:](HMDHAPAccessoryTransaction, "cd_getMKFServiceFromAccessoryUUID:serviceInstanceId:", v11, v14);
          v16 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v16 = objc_claimAutoreleasedReturnValue();
        }
        v17 = (void *)v16;

        goto LABEL_21;
      }
      v18 = (void *)MEMORY[0x227676638]();
      v19 = self;
      HMFGetOSLogHandle();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v27 = v21;
        v28 = 2112;
        v29 = v19;
        v30 = 2112;
        v31 = v22;
        v32 = 2112;
        v33 = v23;
        _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_ERROR, "%{public}@%@: Cannot resolve service (haveAccessoryUUID=%@, haveServiceID=%@)", buf, 0x2Au);

      }
      objc_autoreleasePoolPop(v18);
    }
    goto LABEL_18;
  }
  v25.receiver = self;
  v25.super_class = (Class)HMDCharacteristicWriteActionModel;
  -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v25, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

  return v17;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

- (void)loadModelWithActionInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDCharacteristicWriteActionModel;
  v4 = a3;
  -[HMDActionModel loadModelWithActionInformation:](&v9, sel_loadModelWithActionInformation_, v4);
  objc_msgSend(v4, "hmf_stringForKey:", CFSTR("kAccessoryUUID"), v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setAccessory:](self, "setAccessory:", v5);

  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setServiceID:](self, "setServiceID:", v6);

  objc_msgSend(v4, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCharacteristicWriteActionModel setCharacteristicID:](self, "setCharacteristicID:", v7);

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("kCharacteristicValue"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDCharacteristicWriteActionModel setTargetValue:](self, "setTargetValue:", v8);
}

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HMDCharacteristicWriteActionModel;
  -[HMDBackingStoreModelObject dependentUUIDs](&v15, sel_dependentUUIDs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
  -[HMDCharacteristicWriteActionModel accessory](self, "accessory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = objc_alloc(MEMORY[0x24BDD1880]);
    -[HMDCharacteristicWriteActionModel accessory](self, "accessory");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "initWithUUIDString:", v9);

    objc_msgSend(v4, "addObject:", v10);
    -[HMDCharacteristicWriteActionModel serviceID](self, "serviceID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[HMDCharacteristicWriteActionModel serviceID](self, "serviceID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v10, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "addObject:", v13);
    }

  }
  return v4;
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__HMDCharacteristicWriteActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_164294 != -1)
    dispatch_once(&properties_onceToken_164294, block);
  return (id)properties__properties_164295;
}

void __47__HMDCharacteristicWriteActionModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[4];
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicWriteActionModel;
  objc_msgSendSuper2(&v10, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)properties__properties_164295;
  properties__properties_164295 = v2;

  v4 = (void *)properties__properties_164295;
  v11[0] = CFSTR("accessory");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v11[1] = CFSTR("serviceID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v6;
  v11[2] = CFSTR("characteristicID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v7;
  v11[3] = CFSTR("targetValue");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

}

@end
