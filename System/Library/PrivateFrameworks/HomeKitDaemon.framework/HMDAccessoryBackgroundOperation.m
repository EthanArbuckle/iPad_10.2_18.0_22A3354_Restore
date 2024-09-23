@implementation HMDAccessoryBackgroundOperation

- (HMDAccessoryBackgroundOperation)initWithAccessory:(id)a3 userData:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HMDAccessoryBackgroundOperation *v13;
  HMDAccessoryBackgroundOperation *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = v7;
    objc_msgSend(v6, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "home");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uuid");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HMDAccessoryBackgroundOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:](self, "initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:", v9, v10, v12, v8);

    return v13;
  }
  else
  {
    v15 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
    return -[HMDAccessoryBackgroundOperation initWithAccessoryUUID:accessoryIdentifier:homeUUIDWhereAccessoryWasPaired:userData:](v15, v16, v17, v18, v19, v20);
  }
}

- (HMDAccessoryBackgroundOperation)initWithAccessoryUUID:(id)a3 accessoryIdentifier:(id)a4 homeUUIDWhereAccessoryWasPaired:(id)a5 userData:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  HMDAccessoryBackgroundOperation *v20;
  HMDAccessoryBackgroundOperation *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_super v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (!v13)
  {
    _HMFPreconditionFailure();
    goto LABEL_14;
  }
  if (!v10)
  {
LABEL_14:
    _HMFPreconditionFailure();
    goto LABEL_15;
  }
  if (!v11)
  {
LABEL_15:
    _HMFPreconditionFailure();
    goto LABEL_16;
  }
  v14 = v13;
  objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("accessoryIdentifier"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
LABEL_16:
    _HMFPreconditionFailure();
    goto LABEL_17;
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
LABEL_17:
    _HMFPreconditionFailure();
LABEL_18:
    _HMFPreconditionFailure();
  }
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("accessoryUUIDWhenPaired"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
    goto LABEL_18;
  if (v12)
  {
    v18 = (void *)objc_msgSend(v14, "mutableCopy");
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v11, CFSTR("accessoryIdentifier"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v12, CFSTR("homeUUID"));
    objc_msgSend(v18, "setObject:forKeyedSubscript:", v10, CFSTR("accessoryUUIDWhenPaired"));
    v19 = (void *)objc_msgSend(v18, "copy");
    v26.receiver = self;
    v26.super_class = (Class)HMDAccessoryBackgroundOperation;
    v20 = -[HMDBackgroundOperation initWithUserData:](&v26, sel_initWithUserData_, v19);

    v21 = v20;
  }
  else
  {
    v22 = (void *)MEMORY[0x227676638]();
    v20 = self;
    HMFGetOSLogHandle();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v28 = v24;
      v29 = 2112;
      v30 = v10;
      v31 = 2112;
      v32 = v11;
      _os_log_impl(&dword_2218F0000, v23, OS_LOG_TYPE_ERROR, "%{public}@Accessory is not associated with a home, cannot create background operation for accessory: %@/%@", buf, 0x20u);

    }
    objc_autoreleasePoolPop(v22);
    v21 = 0;
  }

  return v21;
}

- (unint64_t)accessoryOperationStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  char v22;
  unint64_t v23;
  void *v24;
  HMDAccessoryBackgroundOperation *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  HMDAccessoryBackgroundOperation *v33;
  NSObject *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x24BDAC8D0];
  -[HMDAccessoryBackgroundOperation accessoryIdentifier](self, "accessoryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation userData](self, "userData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDBackgroundOperation homeManager](self, "homeManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "findAccessoryUsing:homeManager:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = v10;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v12 = v11;
  else
    v12 = 0;
  v13 = v12;

  v14 = v11;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v14;
  else
    v15 = 0;
  v16 = v15;

  if (v13)
  {
    objc_msgSend(v13, "publicKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      goto LABEL_9;
  }
  else if (v16)
  {
LABEL_9:
    objc_msgSend(v14, "home");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "uuid");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = HMFEqualObjects();

    if (v20
      && (objc_msgSend(v14, "uuid"),
          v21 = (void *)objc_claimAutoreleasedReturnValue(),
          v22 = HMFEqualObjects(),
          v21,
          (v22 & 1) != 0))
    {
      v23 = 2;
    }
    else
    {
      v41 = v5;
      v42 = v16;
      v24 = (void *)MEMORY[0x227676638]();
      v25 = self;
      HMFGetOSLogHandle();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "uuid");
        v40 = v24;
        v28 = v6;
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "uuid");
        v30 = v3;
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544642;
        v45 = v27;
        v46 = 2112;
        v47 = v30;
        v48 = 2112;
        v49 = v41;
        v50 = 2112;
        v51 = v28;
        v52 = 2112;
        v53 = v29;
        v54 = 2112;
        v55 = v31;
        _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@[%@] Cannot execute accessory operation as the home or accessory UUIDs are different. Expected : [home: %@, accessory: %@], Got : [home: %@, accessory: %@]", buf, 0x3Eu);

        v3 = v30;
        v6 = v28;
        v24 = v40;

      }
      objc_autoreleasePoolPop(v24);
      v23 = 1;
      v5 = v41;
      v16 = v42;
    }

    goto LABEL_20;
  }
  v32 = (void *)MEMORY[0x227676638]();
  v33 = self;
  HMFGetOSLogHandle();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
  {
    HMFGetLogIdentifier();
    v43 = v16;
    v35 = v6;
    v36 = v5;
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "shortDescription");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v45 = v37;
    v46 = 2112;
    v47 = v38;
    _os_log_impl(&dword_2218F0000, v34, OS_LOG_TYPE_ERROR, "%{public}@We will need a valid instance of HMDHAPAccessory or HMDAirPlayAccessory : [%@]", buf, 0x16u);

    v5 = v36;
    v6 = v35;
    v16 = v43;
  }

  objc_autoreleasePoolPop(v32);
  v23 = 0;
LABEL_20:

  return v23;
}

- (BOOL)isAccessoryOperation
{
  return 1;
}

- (NSUUID)accessoryUUID
{
  void *v2;
  void *v3;
  HMDAccessoryBackgroundOperation *v5;
  SEL v6;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accessoryUUIDWhenPaired"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSUUID *)v3;
  v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
  return (NSUUID *)-[HMDAccessoryBackgroundOperation accessoryIdentifier](v5, v6);
}

- (NSString)accessoryIdentifier
{
  void *v2;
  void *v3;
  HMDAccessoryBackgroundOperation *v5;
  SEL v6;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("accessoryIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSString *)v3;
  v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
  return (NSString *)-[HMDAccessoryBackgroundOperation homeUUID](v5, v6);
}

- (NSUUID)homeUUID
{
  void *v2;
  void *v3;
  HMDAccessoryBackgroundOperation *v5;
  SEL v6;

  -[HMDBackgroundOperation userData](self, "userData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("homeUUID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return (NSUUID *)v3;
  v5 = (HMDAccessoryBackgroundOperation *)_HMFPreconditionFailure();
  return (NSUUID *)-[HMDAccessoryBackgroundOperation attributeDescriptions](v5, v6);
}

- (id)attributeDescriptions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x24BDAC8D0];
  v16.receiver = self;
  v16.super_class = (Class)HMDAccessoryBackgroundOperation;
  -[HMDBackgroundOperation attributeDescriptions](&v16, sel_attributeDescriptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBackgroundOperation accessoryUUID](self, "accessoryUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithName:value:", CFSTR("accessoryUUID"), v5);
  v17[0] = v6;
  v7 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBackgroundOperation accessoryIdentifier](self, "accessoryIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithName:value:", CFSTR("accessoryIdentifier"), v8);
  v17[1] = v9;
  v10 = objc_alloc(MEMORY[0x24BE3F140]);
  -[HMDAccessoryBackgroundOperation homeUUID](self, "homeUUID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithName:value:", CFSTR("homeUUID"), v11);
  v17[2] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMDBackgroundOperation operationUUID](self, "operationUUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)predicate
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD1758];
  +[HMDBackgroundOperationAccessoryManagerDataSource name](HMDBackgroundOperationAccessoryManagerDataSource, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithFormat:", CFSTR("%K.%K contains %K.%K"), v3, CFSTR("visibleAccessories"), CFSTR("userData"), CFSTR("accessoryUUIDWhenPaired"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t5_223012 != -1)
    dispatch_once(&logCategory__hmf_once_t5_223012, &__block_literal_global_223013);
  return (id)logCategory__hmf_once_v6_223014;
}

void __46__HMDAccessoryBackgroundOperation_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v6_223014;
  logCategory__hmf_once_v6_223014 = v0;

}

@end
