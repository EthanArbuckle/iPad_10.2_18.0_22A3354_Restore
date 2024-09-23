@implementation HDHealthRecordsAccountExistenceNotifier

- (HDHealthRecordsAccountExistenceNotifier)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDHealthRecordsAccountExistenceNotifier)initWithProfile:(id)a3
{
  id v4;
  HDHealthRecordsAccountExistenceNotifier *v5;
  HDHealthRecordsAccountExistenceNotifier *v6;
  id v7;
  uint64_t v8;
  HDHealthRecordsAccountExistenceObserver *observers;
  id WeakRetained;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDHealthRecordsAccountExistenceNotifier;
  v5 = -[HDHealthRecordsAccountExistenceNotifier init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    v8 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("HDHealthRecordsAccountExistenceObservers"), *MEMORY[0x1E0CB52D8]);
    observers = v6->_observers;
    v6->_observers = (HDHealthRecordsAccountExistenceObserver *)v8;

    v6->_lock._os_unfair_lock_opaque = 0;
    v6->_state = 0;
    v6->_testOverrideState = 0;
    v6->_isProfileReady = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "registerProfileReadyObserver:queue:", v6, 0);

  }
  return v6;
}

- (int64_t)ontologyEnablingHealthRecordsAccountState
{
  os_unfair_lock_s *p_lock;
  int64_t state;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  state = self->_state;
  os_unfair_lock_unlock(p_lock);
  if (state)
    return state;
  else
    return (int64_t)-[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
}

- (const)_updateAndReturnState
{
  const os_unfair_lock *v1;
  int os_unfair_lock_opaque_low;
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  _QWORD v11[6];
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[4];
  const os_unfair_lock *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v1 = a1;
  v21 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    os_unfair_lock_assert_not_owner(a1 + 6);
    os_unfair_lock_lock((os_unfair_lock_t)&v1[6]);
    os_unfair_lock_opaque_low = LOBYTE(v1[12]._os_unfair_lock_opaque);
    os_unfair_lock_unlock((os_unfair_lock_t)&v1[6]);
    if (os_unfair_lock_opaque_low)
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0;
      WeakRetained = objc_loadWeakRetained((id *)&v1[14]);
      objc_msgSend(WeakRetained, "database");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDatabaseTransactionContext highPriorityContext](HDDatabaseTransactionContext, "highPriorityContext");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copyForReadingProtectedData");
      v12 = 0;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __64__HDHealthRecordsAccountExistenceNotifier__queryForAccountState__block_invoke;
      v11[3] = &unk_1E6CE8D70;
      v11[4] = v1;
      v11[5] = &v13;
      v7 = objc_msgSend(v4, "performTransactionWithContext:error:block:inaccessibilityHandler:", v6, &v12, v11, 0);
      v8 = v12;

      if ((v7 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        v9 = *MEMORY[0x1E0CB52D8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52D8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v1;
          v19 = 2114;
          v20 = v8;
          _os_log_error_impl(&dword_1B7802000, v9, OS_LOG_TYPE_ERROR, "%{public}@ Failed to determine if profile has health records accounts: %{public}@", buf, 0x16u);
        }
      }
      v1 = (const os_unfair_lock *)v14[3];
      _Block_object_dispose(&v13, 8);

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (BOOL)ontologyEnablingHealthRecordsAccountExists
{
  return -[HDHealthRecordsAccountExistenceNotifier ontologyEnablingHealthRecordsAccountState](self, "ontologyEnablingHealthRecordsAccountState") == 2;
}

- (void)addAccountExistenceObserver:(id)a3
{
  -[HDHealthRecordsAccountExistenceNotifier addAccountExistenceObserver:queue:](self, "addAccountExistenceObserver:queue:", a3, 0);
}

- (void)addAccountExistenceObserver:(id)a3 queue:(id)a4
{
  -[HDHealthRecordsAccountExistenceObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeAccountExistenceObserver:(id)a3
{
  -[HDHealthRecordsAccountExistenceObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)unitTesting_setOntologyEnablingHealthRecordsAccountExists:(BOOL)a3
{
  int64_t v4;
  os_unfair_lock_s *p_lock;

  if (a3)
    v4 = 2;
  else
    v4 = 1;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_testOverrideState = v4;
  os_unfair_lock_unlock(p_lock);
  -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
}

- (void)setUnitTesting_profileReadyCompleteHandler:(id)a3
{
  os_unfair_lock_s *p_lock;
  void (**unitTesting_profileReadyCompleteHandler)(id, HDHealthRecordsAccountExistenceNotifier *);
  void *v6;

  p_lock = &self->_lock;
  unitTesting_profileReadyCompleteHandler = (void (**)(id, HDHealthRecordsAccountExistenceNotifier *))a3;
  os_unfair_lock_lock(p_lock);
  if (self->_isProfileReady)
  {
    unitTesting_profileReadyCompleteHandler[2](unitTesting_profileReadyCompleteHandler, self);
  }
  else
  {
    v6 = (void *)objc_msgSend(unitTesting_profileReadyCompleteHandler, "copy");

    unitTesting_profileReadyCompleteHandler = (void (**)(id, HDHealthRecordsAccountExistenceNotifier *))self->_unitTesting_profileReadyCompleteHandler;
    self->_unitTesting_profileReadyCompleteHandler = v6;
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)profileDidBecomeReady:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  id v7;
  id unitTesting_profileReadyCompleteHandler;
  void *v9;
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "profileExtensionsConformingToProtocol:", &unk_1EF252278);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_healthRecordsProfileExtension, v6);

  v7 = objc_loadWeakRetained((id *)&self->_healthRecordsProfileExtension);
  objc_msgSend(v7, "addAccountEventObserver:", self);

  if (self)
  {
    os_unfair_lock_lock(&self->_lock);
    self->_isProfileReady = 1;
    os_unfair_lock_unlock(&self->_lock);
    -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState]((const os_unfair_lock *)self);
    os_unfair_lock_lock(&self->_lock);
    v10 = _Block_copy(self->_unitTesting_profileReadyCompleteHandler);
    unitTesting_profileReadyCompleteHandler = self->_unitTesting_profileReadyCompleteHandler;
    self->_unitTesting_profileReadyCompleteHandler = 0;

    os_unfair_lock_unlock(&self->_lock);
    v9 = v10;
    if (v10)
    {
      (*((void (**)(id, HDHealthRecordsAccountExistenceNotifier *))v10 + 2))(v10, self);
      v9 = v10;
    }

  }
  else
  {
    -[HDHealthRecordsAccountExistenceNotifier _updateAndReturnState](0);
  }
}

BOOL __64__HDHealthRecordsAccountExistenceNotifier__queryForAccountState__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id WeakRetained;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  _QWORD v24[5];
  BOOL v25;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 24);
  v6 = a2;
  os_unfair_lock_lock(v5);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  if (v7)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v7 + 24));
    v9 = *(_QWORD *)(v7 + 40);
    if (!v9)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v7 + 8));
      v11 = WeakRetained;
      if (WeakRetained)
      {
        v12 = objc_msgSend(WeakRetained, "hasGatewayBackedAccountsWithTransaction:error:", v8, a3);
        v9 = v12;
        if (v12)
        {
          if (v12 == 1)
          {
            v9 = 2;
          }
          else
          {
            v18 = objc_msgSend(v11, "hasIssuerBackedAccountsWithTransaction:error:", v8, a3);
            v9 = v18;
            if (v18)
            {
              if (v18 == 2)
              {
                v9 = 1;
              }
              else
              {
                objc_msgSend((id)v7, "profile");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "daemon");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "ontologyConfigurationProvider");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x1E0C99DC8], "hk_testableCurrentLocale");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v21, "isCountrySupported:", v22);

                if (v23)
                  v9 = 2;
                else
                  v9 = 1;
              }
            }
          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("nil HDHealthRecordsProfileExtension"));
        v9 = 0;
      }

    }
  }
  else
  {
    v9 = 0;
  }

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
  v13 = *(_QWORD *)(a1 + 32);
  if (v13)
  {
    v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    os_unfair_lock_assert_owner((const os_unfair_lock *)(v13 + 24));
    v15 = *(_QWORD *)(v13 + 32) != 2;
    *(_QWORD *)(v13 + 32) = v14;
    if ((((v14 == 2) ^ v15) & 1) == 0)
    {
      v16 = *(void **)(v13 + 16);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __92__HDHealthRecordsAccountExistenceNotifier__lock_updateStateAndNotifyIfRequiredWithNewState___block_invoke;
      v24[3] = &unk_1E6CEF470;
      v24[4] = v13;
      v25 = v14 == 2;
      objc_msgSend(v16, "notifyObservers:", v24);
    }
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 0;
}

uint64_t __92__HDHealthRecordsAccountExistenceNotifier__lock_updateStateAndNotifyIfRequiredWithNewState___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "accountExistenceNotifier:didChangeHealthRecordAccountExistence:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (id)unitTesting_profileReadyCompleteHandler
{
  return self->_unitTesting_profileReadyCompleteHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_profileReadyCompleteHandler, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_healthRecordsProfileExtension);
}

@end
