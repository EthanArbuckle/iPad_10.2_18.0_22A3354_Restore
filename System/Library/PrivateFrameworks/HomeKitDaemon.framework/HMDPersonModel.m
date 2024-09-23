@implementation HMDPersonModel

+ (id)hmbProperties
{
  if (hmbProperties_onceToken_141552 != -1)
    dispatch_once(&hmbProperties_onceToken_141552, &__block_literal_global_141553);
  return (id)hmbProperties_properties_141554;
}

+ (NSUUID)sentinelParentUUID
{
  if (sentinelParentUUID_onceToken_141546 != -1)
    dispatch_once(&sentinelParentUUID_onceToken_141546, &__block_literal_global_8_141547);
  return (NSUUID *)(id)sentinelParentUUID_sentinelParentUUID_141548;
}

void __36__HMDPersonModel_sentinelParentUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("0F42F4A3-0819-4FE2-AF6C-498767A95771"));
  v1 = (void *)sentinelParentUUID_sentinelParentUUID_141548;
  sentinelParentUUID_sentinelParentUUID_141548 = v0;

}

void __31__HMDPersonModel_hmbProperties__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BE4ED08], "fieldWithClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)objc_msgSend(v0, "mutableCopy");

  objc_msgSend(v1, "setLoggingVisibility:", 1);
  v6[0] = CFSTR("name");
  v2 = (void *)objc_msgSend(v1, "copy");
  v6[1] = CFSTR("personLinksData");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x24BE4ECB8], "fieldWithClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)hmbProperties_properties_141554;
  hmbProperties_properties_141554 = v4;

}

- (NSSet)personLinks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDPersonModel *v13;
  NSObject *v14;
  void *v15;
  id v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  _QWORD v22[3];

  v22[2] = *MEMORY[0x24BDAC8D0];
  -[HMDPersonModel personLinksData](self, "personLinksData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD1620];
    v5 = (void *)MEMORY[0x24BDBCF20];
    v22[0] = objc_opt_class();
    v22[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v22, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWithArray:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClasses:fromData:error:", v7, v3, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;

    if (v8)
    {
      v10 = v8;
    }
    else
    {
      v12 = (void *)MEMORY[0x227676638]();
      v13 = self;
      HMFGetOSLogHandle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v19 = v15;
        v20 = 2112;
        v21 = v9;
        _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Failed to decode person links: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v12);
      objc_msgSend(MEMORY[0x24BDBCF20], "set");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSSet *)v11;
}

- (void)setPersonLinks:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  HMDPersonModel *v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v4, 1, &v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v11;
  if (v5)
  {
    -[HMDPersonModel setPersonLinksData:](self, "setPersonLinksData:", v5);
  }
  else
  {
    v7 = (void *)MEMORY[0x227676638]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v13 = v10;
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_2218F0000, v9, OS_LOG_TYPE_INFO, "%{public}@Failed to encode person links: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v7);
  }

}

- (HMDPersonModel)initWithPerson:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  HMDPersonModel *v7;
  void *v8;
  void *v9;

  v4 = a3;
  objc_msgSend(v4, "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentinelParentUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMBModel initWithModelID:parentModelID:](self, "initWithModelID:parentModelID:", v5, v6);

  objc_msgSend(v4, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDPersonModel setName:](v7, "setName:", v8);

  objc_msgSend(v4, "personLinks");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDPersonModel setPersonLinks:](v7, "setPersonLinks:", v9);
  return v7;
}

- (id)createPerson
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc(MEMORY[0x24BDD7848]);
  -[HMBModel hmbModelID](self, "hmbModelID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithUUID:", v4);

  -[HMDPersonModel name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v6);

  -[HMDPersonModel personLinks](self, "personLinks");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPersonLinks:", v7);

  v8 = (void *)objc_msgSend(v5, "copy");
  return v8;
}

@end
