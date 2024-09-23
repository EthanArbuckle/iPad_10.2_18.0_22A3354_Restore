@implementation HMDLocationEventModel

+ (id)properties
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__HMDLocationEventModel_properties__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (properties_onceToken_12678 != -1)
    dispatch_once(&properties_onceToken_12678, block);
  return (id)properties__properties_12679;
}

+ (id)eventModelWithDictionary:(id)a3 home:(id)a4 eventTriggerUUID:(id)a5 message:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v9, "hm_regionFromDataForKey:", CFSTR("kLocationEventRegionKey"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((HMIsValidRegion() & 1) != 0)
  {
    +[HMDEventModel eventModelWithDictionary:home:eventTriggerUUID:className:message:](HMDEventModel, "eventModelWithDictionary:home:eventTriggerUUID:className:message:", v9, v10, v11, objc_opt_class(), v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    encodeRootObject();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRegion:", v15);

  }
  else
  {
    v16 = (void *)MEMORY[0x1D17BA0A0]();
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Provided region is invalid", (uint8_t *)&v20, 0xCu);

    }
    objc_autoreleasePoolPop(v16);
    v14 = 0;
  }

  return v14;
}

void __35__HMDLocationEventModel_properties__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0C99E08];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)&OBJC_METACLASS___HMDLocationEventModel;
  objc_msgSendSuper2(&v8, sel_properties);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "dictionaryWithDictionary:", v2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_12679;
  properties__properties_12679 = v3;

  v5 = (void *)properties__properties_12679;
  v9 = CFSTR("region");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addEntriesFromDictionary:", v7);

}

@end
