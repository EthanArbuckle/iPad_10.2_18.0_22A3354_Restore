@implementation HMDHierarchicalStateMachineState

- (HMDHierarchicalStateMachineState)initWithName:(id)a3 parent:(id)a4
{
  HMDHierarchicalStateMachineState *v4;
  HMDHierarchicalStateMachineState *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HMDHierarchicalStateMachineState;
  v4 = -[CUState initWithName:parent:](&v7, sel_initWithName_parent_, a3, a4);
  v5 = v4;
  if (v4)
    -[HMDHierarchicalStateMachineState _registerForEventHandler](v4, "_registerForEventHandler");
  return v5;
}

- (int64_t)handleEvent:(id)a3
{
  return 1;
}

- (void)handleEnterEvent:(id)a3
{
  id v4;
  void *v5;
  HMDHierarchicalStateMachineState *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUState name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.handleEnterEvent: %@ / %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)handleExitEvent:(id)a3
{
  id v4;
  void *v5;
  HMDHierarchicalStateMachineState *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUState name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138544130;
    v13 = v8;
    v14 = 2112;
    v15 = v9;
    v16 = 2112;
    v17 = v10;
    v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.handleExitEvent: %@ / %@", (uint8_t *)&v12, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);

}

- (void)onInitialTransition:(id)a3
{
  id v4;
  void *v5;
  HMDHierarchicalStateMachineState *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CUState name](v6, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138544130;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@%@.onInitialTransition: %@ / %@", (uint8_t *)&v13, 0x2Au);

  }
  objc_autoreleasePoolPop(v5);
  -[HMDHierarchicalStateMachineState hsm](v6, "hsm");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setHSMInternalCurrentState:", v6);

}

- (void)_registerForEventHandler
{
  _QWORD v3[4];
  id v4;
  id location;

  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __60__HMDHierarchicalStateMachineState__registerForEventHandler__block_invoke;
  v3[3] = &unk_24E77EE18;
  objc_copyWeak(&v4, &location);
  -[CUState setEventHandler:](self, "setEventHandler:", v3);
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (int64_t)_internalEventHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  int64_t v14;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  -[HMDHierarchicalStateMachineState hsm](self, "hsm");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "eventCausingStateTransition");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (void *)v7;
  else
    v9 = v4;
  v10 = v9;

  objc_msgSend(MEMORY[0x24BE29830], "enterState");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v4)
  {
    -[HMDHierarchicalStateMachineState handleEnterEvent:](self, "handleEnterEvent:", v10);
LABEL_11:
    v14 = 2;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BE29830], "exitState");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    -[HMDHierarchicalStateMachineState handleExitEvent:](self, "handleExitEvent:", v10);
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x24BE29830], "initialTransition");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v4)
  {
    -[HMDHierarchicalStateMachineState onInitialTransition:](self, "onInitialTransition:", v10);
    goto LABEL_11;
  }
  v14 = -[HMDHierarchicalStateMachineState handleEvent:](self, "handleEvent:", v4);
LABEL_12:

  objc_autoreleasePoolPop(v5);
  return v14;
}

- (HMDHierarchicalStateMachine)hsm
{
  return (HMDHierarchicalStateMachine *)objc_loadWeakRetained((id *)&self->_hsm);
}

- (void)setHsm:(id)a3
{
  objc_storeWeak((id *)&self->_hsm, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hsm);
}

uint64_t __60__HMDHierarchicalStateMachineState__registerForEventHandler__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;
  uint64_t v5;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  v5 = objc_msgSend(WeakRetained, "_internalEventHandler:", v3);

  return v5;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t3_70431 != -1)
    dispatch_once(&logCategory__hmf_once_t3_70431, &__block_literal_global_70432);
  return (id)logCategory__hmf_once_v4_70433;
}

void __47__HMDHierarchicalStateMachineState_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v4_70433;
  logCategory__hmf_once_v4_70433 = v0;

}

@end
