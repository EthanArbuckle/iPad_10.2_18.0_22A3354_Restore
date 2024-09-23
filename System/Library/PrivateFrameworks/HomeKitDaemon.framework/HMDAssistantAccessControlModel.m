@implementation HMDAssistantAccessControlModel

- (id)dependentUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v27.receiver = self;
  v27.super_class = (Class)HMDAssistantAccessControlModel;
  -[HMDBackingStoreModelObject dependentUUIDs](&v27, sel_dependentUUIDs);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[HMDAssistantAccessControlModel accessoryModelIDs](self, "accessoryModelIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v24;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v24 != v8)
          objc_enumerationMutation(v5);
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v9));
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v7);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[HMDAssistantAccessControlModel siriEndpointAccessoryModelUUIDs](self, "siriEndpointAccessoryModelUUIDs", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v20;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v20 != v14)
          objc_enumerationMutation(v11);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v15));
        if (v16)
          objc_msgSend(v4, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v19, v28, 16);
    }
    while (v13);
  }

  v17 = (void *)objc_msgSend(v4, "copy");
  return v17;
}

+ (id)properties
{
  if (properties_onceToken_234772 != -1)
    dispatch_once(&properties_onceToken_234772, &__block_literal_global_206);
  return (id)properties__properties_234773;
}

void __44__HMDAssistantAccessControlModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  v8[0] = CFSTR("enabled");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v0;
  v8[1] = CFSTR("options");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v1;
  v8[2] = CFSTR("activityNotificationsEnabledForPersonalRequests");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[2] = v2;
  v8[3] = CFSTR("accessoryModelIDs");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[3] = v3;
  v8[4] = CFSTR("siriEndpointAccessoryModelUUIDs");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  v8[5] = CFSTR("changeTag");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[5] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)properties__properties_234773;
  properties__properties_234773 = v6;

}

@end
