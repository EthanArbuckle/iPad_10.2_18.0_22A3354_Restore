@implementation HMDCHIPControllerFabricStorage

- (NSDictionary)debugDictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("Key-Value Store"));

  v5 = (void *)objc_msgSend(v3, "copy");
  return (NSDictionary *)v5;
}

- (BOOL)updateUsingHomeModel:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPControllerFabricStorage *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not implemented", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

  return 0;
}

- (void)updateHomeModel:(id)a3
{
  id v4;
  void *v5;
  HMDCHIPControllerFabricStorage *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_ERROR, "%{public}@Not implemented", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  if (v6)
  {
    -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "keyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = HMFEqualObjects();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HMDCHIPControllerFabricStorage *v4;
  void *v5;

  v4 = -[HMDCHIPControllerFabricStorage init](+[HMDCHIPControllerFabricStorage allocWithZone:](HMDCHIPControllerFabricStorage, "allocWithZone:", a3), "init");
  -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerFabricStorage setKeyValueStore:](v4, "setKeyValueStore:", v5);

  return v4;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%zu"), objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)attributeDescriptions
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x24BE3F140]);
    v7 = (void *)MEMORY[0x24BDD16E0];
    -[HMDCHIPControllerFabricStorage keyValueStore](self, "keyValueStore");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v6, "initWithName:value:", CFSTR("Key-Value Store Count"), v9);
    objc_msgSend(v3, "addObject:", v10);

  }
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (NSDictionary)keyValueStore
{
  return (NSDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeyValueStore:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValueStore, 0);
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_250060 != -1)
    dispatch_once(&logCategory__hmf_once_t3_250060, &__block_literal_global_250061);
  return (id)logCategory__hmf_once_v4_250062;
}

void __45__HMDCHIPControllerFabricStorage_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_250062;
  logCategory__hmf_once_v4_250062 = v0;

}

@end
