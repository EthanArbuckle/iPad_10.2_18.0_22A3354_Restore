@implementation HDHealthAppLabConceptObserver

- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3
{
  return -[HDHealthAppLabConceptObserver initWithProfile:debounceTime:](self, "initWithProfile:debounceTime:", a3, 5.0);
}

- (HDHealthAppLabConceptObserver)initWithProfile:(id)a3 debounceTime:(double)a4
{
  id v6;
  HDHealthAppLabConceptObserver *v7;
  HDHealthAppLabConceptObserver *v8;
  id v9;
  uint64_t v10;
  HDUserDomainConceptManager *userDomainConceptManager;
  HDHAHealthPluginHostFeedGenerator *v12;
  HDHAHealthPluginHostFeedGenerator *feedGenerator;
  uint64_t v14;
  OS_dispatch_queue *debounceQueue;
  id v16;
  void *v17;
  uint64_t v18;
  _HKDelayedOperation *delayedOperation;
  _QWORD v21[4];
  id v22;
  id location;
  objc_super v24;

  v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)HDHealthAppLabConceptObserver;
  v7 = -[HDHealthAppLabConceptObserver init](&v24, sel_init);
  v8 = v7;
  if (v7)
  {
    v9 = objc_storeWeak((id *)&v7->_profile, v6);
    objc_msgSend(v6, "userDomainConceptManager");
    v10 = objc_claimAutoreleasedReturnValue();
    userDomainConceptManager = v8->_userDomainConceptManager;
    v8->_userDomainConceptManager = (HDUserDomainConceptManager *)v10;

    -[HDUserDomainConceptManager addUserDomainConceptObserver:queue:](v8->_userDomainConceptManager, "addUserDomainConceptObserver:queue:", v8, 0);
    v12 = objc_alloc_init(HDHAHealthPluginHostFeedGenerator);
    feedGenerator = v8->_feedGenerator;
    v8->_feedGenerator = v12;

    HKCreateSerialDispatchQueue();
    v14 = objc_claimAutoreleasedReturnValue();
    debounceQueue = v8->_debounceQueue;
    v8->_debounceQueue = (OS_dispatch_queue *)v14;

    objc_initWeak(&location, v8);
    v16 = objc_alloc(MEMORY[0x24BDD41D0]);
    -[HDHealthAppLabConceptObserver debounceQueue](v8, "debounceQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __62__HDHealthAppLabConceptObserver_initWithProfile_debounceTime___block_invoke;
    v21[3] = &unk_250E7E100;
    objc_copyWeak(&v22, &location);
    v18 = objc_msgSend(v16, "initWithMode:queue:delay:block:", 1, v17, v21, a4);
    delayedOperation = v8->_delayedOperation;
    v8->_delayedOperation = (_HKDelayedOperation *)v18;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __62__HDHealthAppLabConceptObserver_initWithProfile_debounceTime___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "runBackgroundGenerationForNewUserDomainConcepts");

}

- (void)dealloc
{
  objc_super v3;

  -[HDUserDomainConceptManager removeUserDomainConceptObserver:](self->_userDomainConceptManager, "removeUserDomainConceptObserver:", self);
  -[_HKDelayedOperation invalidate](self->_delayedOperation, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)HDHealthAppLabConceptObserver;
  -[HDHealthAppLabConceptObserver dealloc](&v3, sel_dealloc);
}

- (void)runBackgroundGenerationForNewUserDomainConcepts
{
  id WeakRetained;
  uint64_t v4;
  _BOOL8 v5;
  _BOOL8 v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v4 = objc_msgSend(WeakRetained, "profileType");
  v5 = v4 == 1;
  v6 = v4 != 1;

  -[HDHAHealthPluginHostFeedGenerator runBackgroundGenerationForPluginIdentifiers:commitUrgentTransaction:feedItemsOnly:](self->_feedGenerator, "runBackgroundGenerationForPluginIdentifiers:commitUrgentTransaction:feedItemsOnly:", &unk_250E836D0, v5, v6);
}

- (void)debounceRunBackgroundGenerationForNewUserDomainConcepts
{
  NSObject *v3;
  _QWORD block[5];

  -[HDHealthAppLabConceptObserver debounceQueue](self, "debounceQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __88__HDHealthAppLabConceptObserver_debounceRunBackgroundGenerationForNewUserDomainConcepts__block_invoke;
  block[3] = &unk_250E7E128;
  block[4] = self;
  dispatch_async(v3, block);

}

void __88__HDHealthAppLabConceptObserver_debounceRunBackgroundGenerationForNewUserDomainConcepts__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delayedOperation");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "execute");

}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  HDHealthAppLabConceptObserver *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);

  }
  -[HDHealthAppLabConceptObserver debounceRunBackgroundGenerationForNewUserDomainConcepts](self, "debounceRunBackgroundGenerationForNewUserDomainConcepts");

}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  HDHealthAppLabConceptObserver *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);

  }
  -[HDHealthAppLabConceptObserver debounceRunBackgroundGenerationForNewUserDomainConcepts](self, "debounceRunBackgroundGenerationForNewUserDomainConcepts");

}

- (void)userDomainConceptManager:(id)a3 didJournalUserDomainConcepts:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  HDHealthAppLabConceptObserver *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);

  }
}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  HDHealthAppLabConceptObserver *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x24BDD3070];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDD3070], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    v14 = 2048;
    v15 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_23DB70000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: %@ for %ld changes", (uint8_t *)&v10, 0x20u);

  }
  -[HDHealthAppLabConceptObserver debounceRunBackgroundGenerationForNewUserDomainConcepts](self, "debounceRunBackgroundGenerationForNewUserDomainConcepts");

}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (void)setProfile:(id)a3
{
  objc_storeWeak((id *)&self->_profile, a3);
}

- (HDUserDomainConceptManager)userDomainConceptManager
{
  return self->_userDomainConceptManager;
}

- (void)setUserDomainConceptManager:(id)a3
{
  objc_storeStrong((id *)&self->_userDomainConceptManager, a3);
}

- (OS_dispatch_queue)debounceQueue
{
  return self->_debounceQueue;
}

- (void)setDebounceQueue:(id)a3
{
  objc_storeStrong((id *)&self->_debounceQueue, a3);
}

- (_HKDelayedOperation)delayedOperation
{
  return self->_delayedOperation;
}

- (void)setDelayedOperation:(id)a3
{
  objc_storeStrong((id *)&self->_delayedOperation, a3);
}

- (HDHAHealthPluginHostFeedGenerator)feedGenerator
{
  return self->_feedGenerator;
}

- (void)setFeedGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_feedGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedGenerator, 0);
  objc_storeStrong((id *)&self->_delayedOperation, 0);
  objc_storeStrong((id *)&self->_debounceQueue, 0);
  objc_storeStrong((id *)&self->_userDomainConceptManager, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
