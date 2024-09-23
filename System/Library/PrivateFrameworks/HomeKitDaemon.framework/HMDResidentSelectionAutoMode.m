@implementation HMDResidentSelectionAutoMode

- (HMDResidentSelectionAutoMode)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentSelectionAutoMode;
  return -[HMDResidentSelectionMode initWithContext:](&v4, sel_initWithContext_, a3);
}

- (unint64_t)currentModeType
{
  return 3;
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  HMDResidentSelectionAutoMode *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  HMDResidentSelectionAutoMode *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a6;
  -[HMDResidentSelectionMode context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "primaryResidentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMDResidentSelectionMode sortedResidents](self, "sortedResidents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    v13 = (void *)objc_msgSend(v12, "mutableCopy");
    v14 = v13;
    if (v11)
    {
      objc_msgSend(v13, "removeObject:", v11);
      objc_msgSend(v14, "insertObject:atIndex:", v11, 0);
    }
    v15 = (void *)MEMORY[0x227676638]();
    v16 = self;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v28 = v18;
      v29 = 2112;
      v30 = v14;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_INFO, "%{public}@Sorted list of residents for auto selection: %@.", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
    v19 = (void *)objc_msgSend(v14, "copy");
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke;
    v25[3] = &unk_24E783070;
    v25[4] = v16;
    v26 = v9;
    -[HMDResidentSelectionMode selectPrimaryResidentFromResidents:requireAutoUpdate:completion:](v16, "selectPrimaryResidentFromResidents:requireAutoUpdate:completion:", v19, 0, v25);

  }
  else
  {
    v20 = (void *)MEMORY[0x227676638]();
    v21 = self;
    HMFGetOSLogHandle();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_impl(&dword_2218F0000, v22, OS_LOG_TYPE_INFO, "%{public}@There are no residents in the home. Auto mode selection failed.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v20);
    -[HMDResidentSelectionMode delegate](v21, "delegate");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmfErrorWithCode:", 14);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "primarySelectionMode:didFailToSelectWithError:", v21, v24);

  }
}

- (id)logIdentifier
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[HMDResidentSelectionMode context](self, "context");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "home");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)shortDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[HMDResidentSelectionMode context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "home");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2;
  v11[3] = &unk_24E79B3F0;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v6;
  v13 = v5;
  v14 = v8;
  v9 = v5;
  v10 = v6;
  dispatch_async(v7, v11);

}

void __113__HMDResidentSelectionAutoMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = *(_QWORD *)(a1 + 40);
      v11 = 138543618;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Auto mode selection failed with error: %@.", (uint8_t *)&v11, 0x16u);

    }
    objc_autoreleasePoolPop(v4);
    objc_msgSend(v2, "primarySelectionMode:didFailToSelectWithError:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v7)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v10;
      _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_INFO, "%{public}@Auto mode selection completed.", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v4);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_99555 != -1)
    dispatch_once(&logCategory__hmf_once_t4_99555, &__block_literal_global_99556);
  return (id)logCategory__hmf_once_v5_99557;
}

void __43__HMDResidentSelectionAutoMode_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_99557;
  logCategory__hmf_once_v5_99557 = v0;

}

@end
