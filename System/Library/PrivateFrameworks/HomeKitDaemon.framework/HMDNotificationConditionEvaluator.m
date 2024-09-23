@implementation HMDNotificationConditionEvaluator

- (HMDNotificationConditionEvaluator)initWithConditionHandlers:(id)a3
{
  id v5;
  HMDNotificationConditionEvaluator *v6;
  HMDNotificationConditionEvaluator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMDNotificationConditionEvaluator;
  v6 = -[HMDNotificationConditionEvaluator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_conditionHandlers, a3);

  return v7;
}

- (BOOL)conditionsPass:(id)a3 registrationUser:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMDNotificationConditionEvaluator *v9;
  NSObject *v10;
  void *v11;
  char v12;
  _QWORD v14[5];
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "hmf_isEmpty"))
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v11;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_INFO, "%{public}@Conditions to evaluate is empty, passing by default", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v8);
    v12 = 1;
  }
  else
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke;
    v14[3] = &unk_24E77DC78;
    v14[4] = self;
    v15 = v7;
    v12 = objc_msgSend(v6, "na_all:", v14);

  }
  return v12;
}

- (NSSet)conditionHandlers
{
  return (NSSet *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditionHandlers, 0);
}

uint64_t __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "conditionHandlers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke_2;
  v13[3] = &unk_24E77DC50;
  v5 = v3;
  v14 = v5;
  objc_msgSend(v4, "na_firstObjectPassingTest:", v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_msgSend(v6, "conditionPasses:registrationUser:", v5, *(_QWORD *)(a1 + 40));
  }
  else
  {
    v8 = (void *)MEMORY[0x227676638]();
    v9 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v16 = v11;
      v17 = 2112;
      v18 = v5;
      _os_log_impl(&dword_2218F0000, v10, OS_LOG_TYPE_ERROR, "%{public}@No handler found for condition: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v8);
    v7 = 0;
  }

  return v7;
}

uint64_t __69__HMDNotificationConditionEvaluator_conditionsPass_registrationUser___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "canHandleCondition:", *(_QWORD *)(a1 + 32));
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t2_57274 != -1)
    dispatch_once(&logCategory__hmf_once_t2_57274, &__block_literal_global_57275);
  return (id)logCategory__hmf_once_v3_57276;
}

void __48__HMDNotificationConditionEvaluator_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v3_57276;
  logCategory__hmf_once_v3_57276 = v0;

}

@end
