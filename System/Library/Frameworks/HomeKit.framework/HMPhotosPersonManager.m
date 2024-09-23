@implementation HMPhotosPersonManager

+ (id)personManagerUUIDFromUserUUID:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (objc_class *)MEMORY[0x1E0CB3A28];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithUUIDString:", CFSTR("E8A07312-F9F1-47FC-AE77-016826C7FD3F"));
  v6 = (void *)MEMORY[0x1E0CB3A28];
  objc_msgSend(v4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "dataUsingEncoding:", 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hmf_UUIDWithNamespace:data:", v5, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t0_27585 != -1)
    dispatch_once(&logCategory__hmf_once_t0_27585, &__block_literal_global_27586);
  return (id)logCategory__hmf_once_v1_27587;
}

void __36__HMPhotosPersonManager_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v1_27587;
  logCategory__hmf_once_v1_27587 = v0;

}

- (HMPhotosPersonManager)initWithUser:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  HMPhotosPersonManager *v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personManagerUUIDFromUserUUID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = -[HMPhotosPersonManager initWithContext:UUID:](self, "initWithContext:UUID:", v8, v7);
  return v9;
}

- (HMPhotosPersonManager)initWithContext:(id)a3 UUID:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  HMPhotosPersonManager *v10;

  v6 = (void *)MEMORY[0x1E0CB37D0];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultCenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[HMPersonManager initWithContext:UUID:notificationCenter:](self, "initWithContext:UUID:notificationCenter:", v8, v7, v9);

  return v10;
}

- (id)logIdentifier
{
  void *v2;
  void *v3;

  -[HMPersonManager UUID](self, "UUID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
