@implementation HMDHierarchicalStateMachine

- (HMDHierarchicalStateMachine)initWithQueue:(id)a3 allowSelfStateTransitions:(BOOL)a4
{
  id v7;
  HMDHierarchicalStateMachine *v8;
  CUStateMachine *v9;
  CUStateMachine *cuStateMachine;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HMDHierarchicalStateMachine;
  v8 = -[HMDHierarchicalStateMachine init](&v12, sel_init);
  if (v8)
  {
    v9 = (CUStateMachine *)objc_alloc_init(MEMORY[0x24BE29838]);
    cuStateMachine = v8->_cuStateMachine;
    v8->_cuStateMachine = v9;

    objc_storeStrong((id *)&v8->_queue, a3);
    v8->_allowSelfStateTransitions = a4;
  }

  return v8;
}

- (void)start
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHierarchicalStateMachine queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDHierarchicalStateMachine_start__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)invalidate
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDHierarchicalStateMachine queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __41__HMDHierarchicalStateMachine_invalidate__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)dispatchEvent:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __45__HMDHierarchicalStateMachine_dispatchEvent___block_invoke;
  v7[3] = &unk_24E79C268;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)dispatchEvent:(id)a3 userInfo:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;

  v6 = (objc_class *)MEMORY[0x24BE29830];
  v7 = a4;
  v8 = a3;
  v9 = (id)objc_msgSend([v6 alloc], "initWithName:userInfo:", v8, v7);

  -[HMDHierarchicalStateMachine dispatchEvent:](self, "dispatchEvent:", v9);
}

- (void)transitionToState:(id)a3
{
  NSObject *v4;
  id v5;

  v5 = a3;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  -[HMDHierarchicalStateMachine transitionToState:withEvent:](self, "transitionToState:withEvent:", v5, 0);
}

- (void)transitionToState:(id)a3 withEvent:(id)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMDHierarchicalStateMachine currentHSMState](self, "currentHSMState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v8, "isEqual:", v11))
  {
    v9 = -[HMDHierarchicalStateMachine allowSelfStateTransitions](self, "allowSelfStateTransitions");

    if (!v9)
      goto LABEL_6;
  }
  else
  {

  }
  -[HMDHierarchicalStateMachine setEventCausingStateTransition:](self, "setEventCausingStateTransition:", v6);
  -[HMDHierarchicalStateMachine cuStateMachine](self, "cuStateMachine");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionToState:", v11);

LABEL_6:
}

- (void)setInitialState:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HMDHierarchicalStateMachine cuStateMachine](self, "cuStateMachine");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitialState:", v4);

}

- (HMDHierarchicalStateMachineState)initialState
{
  void *v2;
  void *v3;
  void *v4;
  HMDHierarchicalStateMachineState *v5;

  -[HMDHierarchicalStateMachine cuStateMachine](self, "cuStateMachine");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initialState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setStates:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__HMDHierarchicalStateMachine_setStates___block_invoke;
  v7[3] = &unk_24E79C290;
  v7[4] = self;
  v4 = a3;
  objc_msgSend(v4, "hmf_enumerateWithAutoreleasePoolUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  -[HMDHierarchicalStateMachine cuStateMachine](self, "cuStateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setStates:", v5);

}

- (void)currentHSMStateWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __61__HMDHierarchicalStateMachine_currentHSMStateWithCompletion___block_invoke;
  v7[3] = &unk_24E79C2B8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)stateWithName:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  v4 = a3;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHierarchicalStateMachine cuStateMachine](self, "cuStateMachine");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "states");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __45__HMDHierarchicalStateMachine_stateWithName___block_invoke;
  v14[3] = &unk_24E79C2E0;
  v15 = v4;
  v8 = v4;
  objc_msgSend(v7, "na_firstObjectPassingTest:", v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v9;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

- (void)setHSMInternalCurrentState:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[HMDHierarchicalStateMachine queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMDHierarchicalStateMachine setCurrentHSMState:](self, "setCurrentHSMState:", v4);
  -[HMDHierarchicalStateMachine setEventCausingStateTransition:](self, "setEventCausingStateTransition:", 0);
}

- (CUStateMachine)cuStateMachine
{
  return self->_cuStateMachine;
}

- (void)setCuStateMachine:(id)a3
{
  objc_storeStrong((id *)&self->_cuStateMachine, a3);
}

- (BOOL)allowSelfStateTransitions
{
  return self->_allowSelfStateTransitions;
}

- (CUStateEvent)eventCausingStateTransition
{
  return self->_eventCausingStateTransition;
}

- (void)setEventCausingStateTransition:(id)a3
{
  objc_storeStrong((id *)&self->_eventCausingStateTransition, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HMDHierarchicalStateMachineState)currentHSMState
{
  return (HMDHierarchicalStateMachineState *)objc_loadWeakRetained((id *)&self->_currentHSMState);
}

- (void)setCurrentHSMState:(id)a3
{
  objc_storeWeak((id *)&self->_currentHSMState, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentHSMState);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventCausingStateTransition, 0);
  objc_storeStrong((id *)&self->_cuStateMachine, 0);
}

uint64_t __45__HMDHierarchicalStateMachine_stateWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  return v4;
}

void __61__HMDHierarchicalStateMachine_currentHSMStateWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "currentHSMState");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = _Block_copy(*(const void **)(a1 + 40));
  v3 = v2;
  if (v2)
    (*((void (**)(void *, id))v2 + 2))(v2, v4);

}

uint64_t __41__HMDHierarchicalStateMachine_setStates___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setHsm:", *(_QWORD *)(a1 + 32));
}

void __45__HMDHierarchicalStateMachine_dispatchEvent___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 40);
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v6;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@DispatchEvent: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v2);
  objc_msgSend(*(id *)(a1 + 32), "cuStateMachine");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchEvent:", *(_QWORD *)(a1 + 40));

}

void __41__HMDHierarchicalStateMachine_invalidate__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cuStateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "invalidate");

}

void __36__HMDHierarchicalStateMachine_start__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "cuStateMachine");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "start");

}

+ (id)logCategory
{
  if (logCategory__hmf_once_t4_255449 != -1)
    dispatch_once(&logCategory__hmf_once_t4_255449, &__block_literal_global_255450);
  return (id)logCategory__hmf_once_v5_255451;
}

void __42__HMDHierarchicalStateMachine_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v5_255451;
  logCategory__hmf_once_v5_255451 = v0;

}

@end
