@implementation HMDAppleMediaAccessoryPowerActionModel

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("accessoryUUID")))
  {
    objc_msgSend(v10, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "modelID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v14, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessory")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("accessoryUUID")))
    {
      -[HMDAppleMediaAccessoryPowerActionModel accessoryUUID](self, "accessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDBackingStore cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:](HMDBackingStore, "cdlsFetchManagedObjectWithUUID:ofManagedObjectType:error:", v11, objc_opt_class(), 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v14, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
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
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDAppleMediaAccessoryPowerActionModel;
  v4 = a3;
  -[HMDActionModel loadModelWithActionInformation:](&v7, sel_loadModelWithActionInformation_, v4);
  objc_msgSend(v4, "hmf_UUIDForKey:", *MEMORY[0x24BDD5270], v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAppleMediaAccessoryPowerActionModel setAccessoryUUID:](self, "setAccessoryUUID:", v5);

  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BDD5280]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAppleMediaAccessoryPowerActionModel setTargetSleepWakeState:](self, "setTargetSleepWakeState:", v6);
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__HMDAppleMediaAccessoryPowerActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_221476 != -1)
    dispatch_once(&properties_onceToken_221476, block);
  return (id)properties__properties_221477;
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

  v10[2] = *MEMORY[0x24BDAC8D0];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDAppleMediaAccessoryPowerActionModel;
  objc_msgSendSuper2(&v8, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)properties__properties_221477;
  properties__properties_221477 = v2;

  v4 = (void *)properties__properties_221477;
  v9[0] = CFSTR("accessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = CFSTR("targetSleepWakeState");
  v10[0] = v5;
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addEntriesFromDictionary:", v7);

}

@end
