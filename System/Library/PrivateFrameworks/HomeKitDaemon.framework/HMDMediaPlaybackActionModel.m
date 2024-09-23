@implementation HMDMediaPlaybackActionModel

- (void)loadModelWithActionInformation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDMediaPlaybackActionModel;
  -[HMDActionModel loadModelWithActionInformation:](&v11, sel_loadModelWithActionInformation_, v4);
  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BDD6658]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel setState:](self, "setState:", v5);

  objc_msgSend(v4, "hmf_numberForKey:", *MEMORY[0x24BDD6668]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel setVolume:](self, "setVolume:", v6);

  objc_msgSend(v4, "hmf_arrayForKey:", *MEMORY[0x24BDD6648]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMediaPlaybackActionModel setProfiles:](self, "setProfiles:", v8);

  }
  objc_msgSend(v4, "hmf_dataForKey:", *MEMORY[0x24BDD6638]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      -[HMDMediaPlaybackActionModel setEncodedPlaybackArchive:](self, "setEncodedPlaybackArchive:", v10);

  }
}

- (BOOL)validForStorage
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  void *v7;
  void *v8;

  -[HMDMediaPlaybackActionModel profiles](self, "profiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    -[HMDMediaPlaybackActionModel accessories](self, "accessories");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      -[HMDMediaPlaybackActionModel state](self, "state");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "integerValue"))
      {
        v6 = 1;
      }
      else
      {
        -[HMDMediaPlaybackActionModel volume](self, "volume");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v6 = 1;
        }
        else
        {
          -[HMDMediaPlaybackActionModel encodedPlaybackArchive](self, "encodedPlaybackArchive");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = v8 != 0;

        }
      }

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)validate
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  void *v8;

  -[HMDMediaPlaybackActionModel profiles](self, "profiles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMediaPlaybackActionModel state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");
  -[HMDMediaPlaybackActionModel volume](self, "volume");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = +[HMDMediaPlaybackAction isPlaybackActionValidWithProfiles:state:volume:](HMDMediaPlaybackAction, "isPlaybackActionValidWithProfiles:state:volume:", v3, v5, v6);

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v28.receiver = self;
  v28.super_class = (Class)HMDMediaPlaybackActionModel;
  -[HMDBackingStoreModelObject dependentUUIDs](&v28, sel_dependentUUIDs);
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
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[HMDMediaPlaybackActionModel accessories](self, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v25;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v25 != v10)
          objc_enumerationMutation(v7);
        v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v11));
        objc_msgSend(v4, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v30, 16);
    }
    while (v9);
  }

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[HMDMediaPlaybackActionModel services](self, "services", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17));
        objc_msgSend(v4, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v29, 16);
    }
    while (v15);
  }

  return v4;
}

+ (id)schemaHashRoot
{
  return CFSTR("4E0EC9BD-7632-4738-82B4-5DC5E759C40E");
}

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDMediaPlaybackActionModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_232187 != -1)
    dispatch_once(&properties_onceToken_232187, block);
  return (id)properties__properties_232188;
}

void __41__HMDMediaPlaybackActionModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  _QWORD v23[8];

  v23[6] = *MEMORY[0x24BDAC8D0];
  v18.receiver = *(id *)(a1 + 32);
  v18.super_class = (Class)&OBJC_METACLASS___HMDMediaPlaybackActionModel;
  objc_msgSendSuper2(&v18, sel_properties);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "mutableCopy");
  v3 = (void *)properties__properties_232188;
  properties__properties_232188 = v2;

  v17 = (void *)properties__properties_232188;
  v22[0] = CFSTR("accessories");
  v4 = objc_opt_class();
  v21 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v21, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:additionalDecodeClasses:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:additionalDecodeClasses:", v4, v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v5;
  v22[1] = CFSTR("state");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v6;
  v22[2] = CFSTR("volume");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v7;
  v22[3] = CFSTR("profiles");
  v8 = objc_opt_class();
  v20 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:additionalDecodeClasses:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:additionalDecodeClasses:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[3] = v10;
  v22[4] = CFSTR("encodedPlaybackArchive");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[4] = v11;
  v22[5] = CFSTR("services");
  v12 = objc_opt_class();
  v19 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v19, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:additionalDecodeClasses:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:additionalDecodeClasses:", v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v14;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addEntriesFromDictionary:", v15);

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
  objc_super v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessories")))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__234601;
    v23 = __Block_byref_object_dispose__234602;
    v11 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v8, "accessories");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
    v24 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "accessories");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __121__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke;
    v18[3] = &unk_24E797E38;
    v18[4] = &v19;
    objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v18);

    v14 = (id)v20[5];
    _Block_object_dispose(&v19, 8);

  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("profiles")))
    {
      -[HMDMediaPlaybackActionModel _profilesFromManagedObject:](self, "_profilesFromManagedObject:", v8);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v17.receiver = self;
      v17.super_class = (Class)HMDMediaPlaybackActionModel;
      -[HMDBackingStoreModelObject cd_generateValueForModelObjectFromManagedObject:modelObjectField:modelFieldInfo:](&v17, sel_cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo_, v8, v9, v10);
      v15 = objc_claimAutoreleasedReturnValue();
    }
    v14 = (id)v15;
  }

  return v14;
}

- (id)_profilesFromManagedObject:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v3 = (void *)MEMORY[0x24BDBCEF0];
  v4 = a3;
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "accessories");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __68__HMDMediaPlaybackActionModel_CoreData___profilesFromManagedObject___block_invoke;
  v11[3] = &unk_24E797E60;
  v12 = v6;
  v8 = v6;
  objc_msgSend(v7, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v11);

  v9 = (void *)objc_msgSend(v8, "copy");
  return v9;
}

- (id)cd_generateValueForProperty:(id)a3 managedObjectField:(id)a4 context:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  objc_super v16;
  _QWORD v17[6];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("accessories_")))
  {
    if (-[HMDBackingStoreModelObject propertyWasSet:](self, "propertyWasSet:", CFSTR("accessories")))
    {
      v18 = 0;
      v19 = &v18;
      v20 = 0x3032000000;
      v21 = __Block_byref_object_copy__234601;
      v22 = __Block_byref_object_dispose__234602;
      v11 = (void *)MEMORY[0x24BDBCEF0];
      -[HMDMediaPlaybackActionModel accessories](self, "accessories");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setWithCapacity:", objc_msgSend(v12, "count"));
      v23 = (id)objc_claimAutoreleasedReturnValue();

      -[HMDMediaPlaybackActionModel accessories](self, "accessories");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __96__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke;
      v17[3] = &unk_24E797E88;
      v17[4] = self;
      v17[5] = &v18;
      objc_msgSend(v13, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v17);

      v14 = (id)v19[5];
      _Block_object_dispose(&v18, 8);

    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)HMDMediaPlaybackActionModel;
    -[HMDBackingStoreModelObject cd_generateValueForProperty:managedObjectField:context:](&v16, sel_cd_generateValueForProperty_managedObjectField_context_, v8, v9, v10);
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __96__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForProperty_managedObjectField_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[HMDAccessoryTransaction cd_getMKFAccessoryFromAccessoryUUID:](HMDAccessoryTransaction, "cd_getMKFAccessoryFromAccessoryUUID:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v4);
  }
  else
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_FAULT, "%{public}@The found NSManagedObject is not of type MKFAccessory", (uint8_t *)&v9, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }

}

void __68__HMDMediaPlaybackActionModel_CoreData___profilesFromManagedObject___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "modelID");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[HMDMediaProfile uniqueIdentifierFromAccessoryUUID:](HMDMediaProfile, "uniqueIdentifierFromAccessoryUUID:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v4);

}

void __121__HMDMediaPlaybackActionModel_CoreData__cd_generateValueForModelObjectFromManagedObject_modelObjectField_modelFieldInfo___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "modelID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (Class)cd_entityClass
{
  return (Class)objc_opt_class();
}

@end
