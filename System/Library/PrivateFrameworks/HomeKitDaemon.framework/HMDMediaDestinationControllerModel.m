@implementation HMDMediaDestinationControllerModel

+ (id)properties
{
  if (properties_onceToken_201986 != -1)
    dispatch_once(&properties_onceToken_201986, &__block_literal_global_11_201987);
  return (id)properties__properties_201988;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_201981 != -1)
    dispatch_once(&logCategory__hmf_once_t0_201981, &__block_literal_global_16_201982);
  return (id)logCategory__hmf_once_v1_201983;
}

void __49__HMDMediaDestinationControllerModel_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_201983;
  logCategory__hmf_once_v1_201983 = v0;

}

void __48__HMDMediaDestinationControllerModel_properties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[4];
  _QWORD v7[5];

  v7[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("type");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v0;
  v6[1] = CFSTR("availableDestinationModelIdentifierStrings");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v1;
  v6[2] = CFSTR("destinationModelIdentifier");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v2;
  v6[3] = CFSTR("supportedOptions");
  +[HMDBackingStoreModelObjectStorageInfo infoWithClass:](HMDBackingStoreModelObjectStorageInfo, "infoWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[3] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 4);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)properties__properties_201988;
  properties__properties_201988 = v4;

}

- (HMDMediaDestinationControllerModel)initWithData:(id)a3 changeType:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  HMDMediaDestinationControllerModel *v9;

  v6 = a3;
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "parentIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMDBackingStoreModelObject initWithVersion:changeType:uuid:parentUUID:](self, "initWithVersion:changeType:uuid:parentUUID:", 0, a4, v7, v8);
  return v9;
}

- (NSArray)availableDestinationModelIdentifiers
{
  void *v2;
  void *v3;

  -[HMDMediaDestinationControllerModel availableDestinationModelIdentifierStrings](self, "availableDestinationModelIdentifierStrings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_202032);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (void)setAvailableDestinationModelIdentifiers:(id)a3
{
  id v4;

  objc_msgSend(a3, "na_map:", &__block_literal_global_9_202031);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[HMDMediaDestinationControllerModel setAvailableDestinationModelIdentifierStrings:](self, "setAvailableDestinationModelIdentifierStrings:", v4);

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
  int v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  const __CFString *v11;
  void *v12;
  id v13;
  __CFString *v14;
  void *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  _QWORD v26[6];

  v26[5] = *MEMORY[0x24BDAC8D0];
  -[HMDBackingStoreModelObject setProperties](self, "setProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", CFSTR("destinationModelIdentifier"));
  v5 = objc_msgSend(v3, "containsObject:", CFSTR("availableDestinationModelIdentifierStrings"));
  v6 = objc_msgSend(v3, "containsObject:", CFSTR("supportedOptions"));
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackingStoreModelObject uuid](self, "uuid");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("uuid"));
  v26[0] = v23;
  v8 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDBackingStoreModelObject parentUUID](self, "parentUUID");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "initWithName:value:", CFSTR("parentUUID"));
  v26[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  v25 = v4;
  if (v4)
  {
    -[HMDMediaDestinationControllerModel destinationModelIdentifier](self, "destinationModelIdentifier");
    v11 = (const __CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = CFSTR("not set");
  }
  v21 = (__CFString *)v11;
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("destinationModelIdentifier"), v11);
  v26[2] = v12;
  v13 = objc_alloc(MEMORY[0x24BE3F140]);
  if (v6)
  {
    -[HMDMediaDestinationControllerModel supportedOptions](self, "supportedOptions");
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = CFSTR("not set");
  }
  v15 = (void *)objc_msgSend(v13, "initWithName:value:", CFSTR("supportedOptions"), v14);
  v26[3] = v15;
  v16 = objc_alloc(MEMORY[0x24BE3F140]);
  if (v5)
  {
    -[HMDMediaDestinationControllerModel availableDestinationModelIdentifiers](self, "availableDestinationModelIdentifiers");
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = CFSTR("not set");
  }
  v18 = (void *)objc_msgSend(v16, "initWithName:value:", CFSTR("availableDestinationModelIdentifierStrings"), v17);
  v26[4] = v18;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v26, 5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  if (v6)

  if (v25)
  return v19;
}

uint64_t __78__HMDMediaDestinationControllerModel_setAvailableDestinationModelIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "UUIDString");
}

id __74__HMDMediaDestinationControllerModel_availableDestinationModelIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x24BDD1880];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithUUIDString:", v3);

  return v4;
}

@end
