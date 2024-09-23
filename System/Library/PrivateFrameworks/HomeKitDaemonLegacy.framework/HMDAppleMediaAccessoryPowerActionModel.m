@implementation HMDAppleMediaAccessoryPowerActionModel

- (void)loadModelWithActionInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
  v4 = a3;
  -[HMDActionModel loadModelWithActionInformation:](&v7, sel_loadModelWithActionInformation_, v4);
  objc_msgSend(v4, "hmf_UUIDForKey:", *MEMORY[0x1E0CB8288], v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryPowerActionModel setAccessoryUUID:](self, "setAccessoryUUID:", v5);

  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x1E0CB8298]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessoryPowerActionModel setTargetSleepWakeState:](self, "setTargetSleepWakeState:", v6);
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_39796 != -1)
    dispatch_once(&properties_onceToken_39796, block);
  return (id)properties__properties_39797;
}

void __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  _QWORD v9[2];
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryPowerActionModel;
  objc_msgSendSuper2(&v8, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)properties__properties_39797;
  properties__properties_39797 = v2;

  v4 = (void *)properties__properties_39797;
  v9[0] = CFSTR("accessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("targetSleepWakeState");
  v10[0] = v5;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

}

@end
