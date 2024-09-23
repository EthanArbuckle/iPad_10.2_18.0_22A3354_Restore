@implementation HMDResidentSelectionManualMode

- (HMDResidentSelectionManualMode)initWithContext:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HMDResidentSelectionManualMode;
  return -[HMDResidentSelectionMode initWithContext:](&v4, sel_initWithContext_, a3);
}

- (unint64_t)currentModeType
{
  return 2;
}

- (void)performSelectionWithPreferredPrimaryResident:(id)a3 requireAutoUpdate:(BOOL)a4 reason:(unint64_t)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  HMDResidentSelectionManualMode *v13;
  NSObject *v14;
  void *v15;
  _QWORD v16[5];
  id v17;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v7 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a6;
  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke;
    v16[3] = &unk_24E79B3C8;
    v16[4] = self;
    v17 = v10;
    -[HMDResidentSelectionMode selectPrimaryResidentFromResidents:requireAutoUpdate:completion:](self, "selectPrimaryResidentFromResidents:requireAutoUpdate:completion:", v11, v7, v16);

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
      *(_DWORD *)buf = 138543362;
      v19 = v15;
      _os_log_impl(&dword_2218F0000, v14, OS_LOG_TYPE_ERROR, "%{public}@Cannot perform selection with no preferred primary info.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v12);
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

void __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;
  id v15;
  id v16;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2;
  v12[3] = &unk_24E79B3F0;
  v8 = *(_QWORD *)(a1 + 32);
  v9 = *(void **)(a1 + 40);
  v13 = v6;
  v14 = v8;
  v15 = v5;
  v16 = v9;
  v10 = v5;
  v11 = v6;
  dispatch_async(v7, v12);

}

uint64_t __115__HMDResidentSelectionManualMode_performSelectionWithPreferredPrimaryResident_requireAutoUpdate_reason_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 40);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = *(_QWORD *)(a1 + 32);
      v12 = 138543618;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Manual mode selection failed with error: %@.", (uint8_t *)&v12, 0x16u);

    }
    objc_autoreleasePoolPop(v3);
    objc_msgSend(*(id *)(a1 + 40), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "primarySelectionMode:didFailToSelectWithError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
  else
  {
    if (v6)
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@Manual mode selection completed.", (uint8_t *)&v12, 0xCu);

    }
    objc_autoreleasePoolPop(v3);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_100420 != -1)
    dispatch_once(&logCategory__hmf_once_t3_100420, &__block_literal_global_100421);
  return (id)logCategory__hmf_once_v4_100422;
}

void __45__HMDResidentSelectionManualMode_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_100422;
  logCategory__hmf_once_v4_100422 = v0;

}

@end
