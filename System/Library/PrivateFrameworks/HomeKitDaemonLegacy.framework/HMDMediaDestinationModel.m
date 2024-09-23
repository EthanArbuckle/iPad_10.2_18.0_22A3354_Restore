@implementation HMDMediaDestinationModel

+ (id)properties
{
  if (properties_onceToken_78736 != -1)
    dispatch_once(&properties_onceToken_78736, &__block_literal_global_78737);
  return (id)properties__properties_78738;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_78731 != -1)
    dispatch_once(&logCategory__hmf_once_t0_78731, &__block_literal_global_9_78732);
  return (id)logCategory__hmf_once_v1_78733;
}

void __39__HMDMediaDestinationModel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_78733;
  logCategory__hmf_once_v1_78733 = v0;

}

void __38__HMDMediaDestinationModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("type");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v0;
  v5[1] = CFSTR("supportedOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = v1;
  v5[2] = CFSTR("audioGroupIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)properties__properties_78738;
  properties__properties_78738 = v3;

}

- (HMDMediaDestinationModel)initWithDestination:(id)a3 changeType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDMediaDestinationModel *v9;

  v6 = a3;
  objc_msgSend(v6, "uniqueIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDBackingStoreModelObject initWithVersion:changeType:uuid:parentUUID:](self, "initWithVersion:changeType:uuid:parentUUID:", 0, a4, v7, v8);
  return v9;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)attributeDescriptions
{
  void *v3;
  int v4;
  int v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  __CFString *v12;
  void *v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  -[HMDBackingStoreModelObject setProperties](self, "setProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("supportedOptions"));
  v5 = objc_msgSend(v3, "containsObject:", CFSTR("audioGroupIdentifier"));
  v6 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("uuid"));
  v21[0] = v7;
  v8 = objc_alloc(MEMORY[0x1E0D28548]);
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("parentUUID"), v9);
  v21[1] = v10;
  v11 = objc_alloc(MEMORY[0x1E0D28548]);
  v19 = v4;
  if (v4)
  {
    -[HMDMediaDestinationModel supportedOptions](self, "supportedOptions");
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = CFSTR("not set");
  }
  v13 = (void *)objc_msgSend(v11, "initWithName:value:", CFSTR("supportedOptions"), v12);
  v21[2] = v13;
  v14 = objc_alloc(MEMORY[0x1E0D28548]);
  if (v5)
  {
    -[HMDMediaDestinationModel audioGroupIdentifier](self, "audioGroupIdentifier");
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = CFSTR("not set");
  }
  v16 = (void *)objc_msgSend(v14, "initWithName:value:", CFSTR("audioGroupIdentifier"), v15);
  v21[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  if (v19)

  return v17;
}

@end
