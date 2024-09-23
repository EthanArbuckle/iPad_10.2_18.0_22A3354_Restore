@implementation HMDCharacteristicEventBaseModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__HMDCharacteristicEventBaseModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_125562 != -1)
    dispatch_once(&properties_onceToken_125562, block);
  return (id)properties__properties_125563;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 className:(Class)a6 message:(id)a7 checkForSupport:(BOOL)a8 outCharateristic:(id *)a9
{
  _BOOL8 v9;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  uint64_t v27;
  id v29;
  id v30;

  v9 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a7;
  objc_msgSend(v13, "hmf_numberForKey:", CFSTR("kServiceInstanceID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_numberForKey:", CFSTR("kCharacteristicInstanceID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "hmf_UUIDForKey:", CFSTR("kAccessoryUUID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  LOBYTE(v27) = 1;
  +[HMDCharacteristicEventBase lookForCharacteristicByAccessoryUUID:serviceID:characteristicID:inHome:checkForSupport:outError:shouldLog:](HMDCharacteristicEventBase, "lookForCharacteristicByAccessoryUUID:serviceID:characteristicID:inHome:checkForSupport:outError:shouldLog:", v19, v17, v18, v14, v9, &v30, v27);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v30;
  v22 = 0;
  if (!v21)
  {
    if (a9)
      *a9 = objc_retainAutorelease(v20);
    +[HMDEventModel eventModelWithDictionary:home:eventTriggerUUID:className:message:](HMDEventModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:", v13, v14, v15, a6, v16);
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "UUIDString");
    v29 = v14;
    v23 = v16;
    v24 = v15;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAccessory:", v25);

    v15 = v24;
    v16 = v23;
    v14 = v29;
    objc_msgSend(v22, "setServiceID:", v17);
    objc_msgSend(v22, "setCharacteristicID:", v18);

  }
  return v22;
}

void __45__HMDCharacteristicEventBaseModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicEventBaseModel;
  objc_msgSendSuper2(&v10, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_125563;
  properties__properties_125563 = v3;

  v5 = (void *)properties__properties_125563;
  v11[0] = CFSTR("accessory");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v11[1] = CFSTR("serviceID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  v11[2] = CFSTR("characteristicID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v9);

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
  void *v11;

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
  -[HMDCharacteristicEventBaseModel serviceID](self, "serviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x1E0CB3A28]);
    -[HMDCharacteristicEventBaseModel accessory](self, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithUUIDString:", v8);
    -[HMDCharacteristicEventBaseModel serviceID](self, "serviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDService generateUUIDWithAccessoryUUID:serviceID:](HMDService, "generateUUIDWithAccessoryUUID:serviceID:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "addObject:", v11);
  }
  return v3;
}

@end
