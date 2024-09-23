@implementation HMDLightProfileNaturalLightingActionModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_101842 != -1)
    dispatch_once(&properties_onceToken_101842, block);
  return (id)properties_properties;
}

void __55__HMDLightProfileNaturalLightingActionModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  uint64_t v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x24BDAC8D0];
  v12.receiver = *(id *)(a1 + 32);
  v12.super_class = (Class)&OBJC_METACLASS___HMDLightProfileNaturalLightingActionModel;
  objc_msgSendSuper2(&v12, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v14[0] = CFSTR("naturalLightingEnabledField");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v3;
  v14[1] = CFSTR("lightProfileUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v4;
  v14[2] = CFSTR("accessoryUUID");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v5;
  v14[3] = CFSTR("serviceUUIDs");
  v6 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:additionalDecodeClasses:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:additionalDecodeClasses:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v9);

  v10 = objc_msgSend(v2, "copy");
  v11 = (void *)properties_properties;
  properties_properties = v10;

}

- (void)setNaturalLightingEnabled:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDLightProfileNaturalLightingActionModel setNaturalLightingEnabledField:](self, "setNaturalLightingEnabledField:", v4);

}

- (BOOL)isNaturalLightingEnabled
{
  void *v2;
  char v3;

  -[HMDLightProfileNaturalLightingActionModel naturalLightingEnabledField](self, "naturalLightingEnabledField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
  -[HMDBackingStoreModelObject dependentUUIDs](&v14, sel_dependentUUIDs);
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
  -[HMDLightProfileNaturalLightingActionModel accessoryUUID](self, "accessoryUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[HMDLightProfileNaturalLightingActionModel accessoryUUID](self, "accessoryUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

  }
  -[HMDLightProfileNaturalLightingActionModel serviceUUIDs](self, "serviceUUIDs");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMDLightProfileNaturalLightingActionModel serviceUUIDs](self, "serviceUUIDs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObjectsFromArray:", v11);

  }
  v12 = (void *)objc_msgSend(v4, "copy");

  return v12;
}

- (id)cd_generateValueForModelObjectFromManagedObject:(id)a3 modelObjectField:(id)a4 modelFieldInfo:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  objc_super v17;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("accessoryUUID")))
  {
    objc_msgSend(v10, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "modelID");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = (void *)v12;
    v14 = (void *)*MEMORY[0x24BDBD430];
    if (v12)
      v14 = (void *)v12;
    v15 = v14;

  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
    -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v17, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v10, v8, v9);
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v15;
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
      -[HMDLightProfileNaturalLightingActionModel accessoryUUID](self, "accessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        +[HMDHAPAccessoryTransaction cd_getMKFHAPAccessoryFromAccessoryUUID:](HMDHAPAccessoryTransaction, "cd_getMKFHAPAccessoryFromAccessoryUUID:", v11);
      else
        objc_msgSend(MEMORY[0x24BDBCEF8], "null");
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
    v14.super_class = (Class)HMDLightProfileNaturalLightingActionModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v14, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
