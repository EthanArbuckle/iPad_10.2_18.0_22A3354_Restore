@implementation HDUserDomainConceptStoreTaskServer

- (HDUserDomainConceptStoreTaskServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDUserDomainConceptStoreTaskServer *v11;
  void *v12;
  uint64_t v13;
  HDUserDomainConceptManager *userDomainConceptManager;
  objc_super v16;

  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)HDUserDomainConceptStoreTaskServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v16, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    objc_msgSend(v10, "profile");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "userDomainConceptManager");
    v13 = objc_claimAutoreleasedReturnValue();
    userDomainConceptManager = v11->_userDomainConceptManager;
    v11->_userDomainConceptManager = (HDUserDomainConceptManager *)v13;

    v11->_lock._os_unfair_lock_opaque = 0;
    v11->_shouldObserveChanges = 0;
  }

  return v11;
}

- (void)dealloc
{
  objc_super v3;

  -[HDUserDomainConceptManager removeUserDomainConceptObserver:](self->_userDomainConceptManager, "removeUserDomainConceptObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)HDUserDomainConceptStoreTaskServer;
  -[HDUserDomainConceptStoreTaskServer dealloc](&v3, sel_dealloc);
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB60B8];
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6D40], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6D40], "serverInterface");
}

- (void)remote_storeUserDomainConcepts:(id)a3 method:(int64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  uint64_t v9;
  id v10;
  id v11;

  v11 = 0;
  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = -[HDUserDomainConceptStoreTaskServer _storeUserDomainConcepts:method:error:]((uint64_t)self, a3, a4, (uint64_t)&v11);
  v10 = v11;
  v8[2](v8, v9, v10);

}

- (uint64_t)_storeUserDomainConcepts:(uint64_t)a3 method:(uint64_t)a4 error:
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      HKLogHealthOntology();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = objc_msgSend(v7, "count");
        HKStringFromUserDomainConceptStoreMethod();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138543874;
        v16 = a1;
        v17 = 2048;
        v18 = v11;
        v19 = 2112;
        v20 = v12;
        _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Store %ld concepts with method '%@'", (uint8_t *)&v15, 0x20u);

      }
    }
    v13 = objc_msgSend(*(id *)(a1 + 40), "modifyUserDomainConcepts:method:error:", v7, a3, a4);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)remote_observeUserDomainConceptChanges:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  os_unfair_lock_s *p_lock;
  HDUserDomainConceptManager *userDomainConceptManager;
  void (**v8)(id, uint64_t, _QWORD);

  v4 = a3;
  p_lock = &self->_lock;
  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  os_unfair_lock_lock(p_lock);
  self->_shouldObserveChanges = v4;
  userDomainConceptManager = self->_userDomainConceptManager;
  if (v4)
    -[HDUserDomainConceptManager addUserDomainConceptObserver:queue:](userDomainConceptManager, "addUserDomainConceptObserver:queue:", self, 0);
  else
    -[HDUserDomainConceptManager removeUserDomainConceptObserver:](userDomainConceptManager, "removeUserDomainConceptObserver:", self);
  os_unfair_lock_unlock(p_lock);
  v8[2](v8, 1, 0);

}

- (void)remote_createAndStoreUserDomainConceptWithConceptIdentifier:(id)a3 additionalProperties:(id)a4 userDomainConceptTypeIdentifier:(id)a5 completion:(id)a6
{
  void (**v10)(id, _QWORD, id);
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = (void (**)(id, _QWORD, id))a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  +[HDUserDomainConceptEntity createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:additionalProperties:userDomainConceptTypeIdentifier:profile:error:](HDUserDomainConceptEntity, "createAndRefreshOntologyBackedUserDomainConceptWithConceptIdentifier:additionalProperties:userDomainConceptTypeIdentifier:profile:error:", v13, v12, v11, v14, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  if (v15)
  {
    v23[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v16;
    v18 = -[HDUserDomainConceptStoreTaskServer _storeUserDomainConcepts:method:error:]((uint64_t)self, v17, 1, (uint64_t)&v21);
    v19 = v21;

    if (v18)
      v20 = v15;
    else
      v20 = 0;
    ((void (**)(id, void *, id))v10)[2](v10, v20, v19);
    v16 = v19;
  }
  else
  {
    v10[2](v10, 0, v16);
  }

}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptStoreTaskServer _notifyClientForChangesOfType:userDomainConcepts:]((uint64_t)self, 1, a4);
}

- (void)_notifyClientForChangesOfType:(void *)a3 userDomainConcepts:
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
    if (*(_BYTE *)(a1 + 52))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __87__HDUserDomainConceptStoreTaskServer__notifyClientForChangesOfType_userDomainConcepts___block_invoke;
      v13[3] = &unk_1E6CF4D38;
      v13[4] = a1;
      v6 = v5;
      v14 = v6;
      v15 = a2;
      objc_msgSend((id)a1, "remoteObjectProxyWithErrorHandler:", v13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      _HKInitializeLogging();
      HKLogHealthOntology();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

      if (v9)
      {
        HKLogHealthOntology();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = objc_msgSend(v6, "count");
          HKStringFromUserDomainConceptStoreChangeType();
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v17 = a1;
          v18 = 2048;
          v19 = v11;
          v20 = 2112;
          v21 = v12;
          _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for %ld changes of type '%@'", buf, 0x20u);

        }
      }
      objc_msgSend(v7, "client_notifyForChangesToUserDomainConcepts:changeType:", v6, a2);

    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }

}

- (void)userDomainConceptManager:(id)a3 didUpdateUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptStoreTaskServer _notifyClientForChangesOfType:userDomainConcepts:]((uint64_t)self, 2, a4);
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  -[HDUserDomainConceptStoreTaskServer _notifyClientForChangesOfType:userDomainConcepts:]((uint64_t)self, 3, a4);
}

void __87__HDUserDomainConceptStoreTaskServer__notifyClientForChangesOfType_userDomainConcepts___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(*(id *)(a1 + 40), "count");
    HKStringFromUserDomainConceptStoreChangeType();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138544130;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2112;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for %ld changes of type '%@': %{public}@", (uint8_t *)&v8, 0x2Au);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDomainConceptManager, 0);
}

@end
