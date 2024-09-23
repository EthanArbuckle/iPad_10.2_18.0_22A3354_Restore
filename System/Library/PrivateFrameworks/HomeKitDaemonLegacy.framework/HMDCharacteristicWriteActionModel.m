@implementation HMDCharacteristicWriteActionModel

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
    v8 = objc_alloc(MEMORY[0x1E0CB3A28]);
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

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__HMDCharacteristicWriteActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_117888 != -1)
    dispatch_once(&properties_onceToken_117888, block);
  return (id)properties__properties_117889;
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

  v12[4] = *MEMORY[0x1E0C80C00];
  v10.receiver = *(id *)(a1 + 32);
  v10.super_class = (Class)&OBJC_METACLASS___HMDCharacteristicWriteActionModel;
  objc_msgSendSuper2(&v10, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)properties__properties_117889;
  properties__properties_117889 = v2;

  v4 = (void *)properties__properties_117889;
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
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v9);

}

@end
