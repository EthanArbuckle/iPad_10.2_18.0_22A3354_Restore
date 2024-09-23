@implementation HDProtectedDataOperation

- (HDProtectedDataOperation)initWithProfile:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;
  void *v10;
  HDProtectedDataOperation *v11;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "protectedDataOperationScheduler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[HDProtectedDataOperation initWithOperationScheduler:debugIdentifier:delegate:](self, "initWithOperationScheduler:debugIdentifier:delegate:", v10, v9, v8);

  return v11;
}

- (HDProtectedDataOperation)initWithOperationScheduler:(id)a3 debugIdentifier:(id)a4 delegate:(id)a5
{
  id v10;
  id v11;
  id v12;
  HDProtectedDataOperation *v13;
  HDProtectedDataOperation *v14;
  uint64_t v15;
  NSString *debugIdentifier;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDProtectedDataOperation.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("protectedDataOperationScheduler"));

  }
  v19.receiver = self;
  v19.super_class = (Class)HDProtectedDataOperation;
  v13 = -[HDProtectedDataOperation init](&v19, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_protectedDataOperationScheduler, a3);
    v15 = objc_msgSend(v11, "copy");
    debugIdentifier = v14->_debugIdentifier;
    v14->_debugIdentifier = (NSString *)v15;

    objc_storeWeak((id *)&v14->_lock_delegate, v12);
    v14->_lock._os_unfair_lock_opaque = 0;
    v14->_lock_shouldBypassMaintenanceCoordinator = 0;
    v14->_lock_state = 1;
  }

  return v14;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@:%p:%@"), objc_opt_class(), self, self->_debugIdentifier);
}

- (BOOL)requestWorkWithPriority:(int64_t)a3 error:(id *)a4
{
  _QWORD v5[6];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__HDProtectedDataOperation_requestWorkWithPriority_error___block_invoke;
  v5[3] = &unk_1E6D0FBD8;
  v5[4] = self;
  v5[5] = a3;
  return -[HDProtectedDataOperation _performStateTransitionWithError:block:]((uint64_t)self, a4, v5);
}

id __58__HDProtectedDataOperation_requestWorkWithPriority_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "oldState");
  v5 = *(_QWORD *)(a1 + 40);
  switch(objc_msgSend(v3, "oldState"))
  {
    case 1:
    case 2:
      v4 = 2;
      break;
    case 3:
    case 4:
      v4 = 4;
      break;
    case 6:
      if (v5 == 1)
        v4 = 5;
      break;
    case 7:
      v4 = 8;
      break;
    default:
      break;
  }
  if (objc_msgSend(v3, "oldState") != v4)
  {
    v6 = objc_msgSend(v3, "copyWithNewState:", v4);

    v3 = (id)v6;
  }
  if (v5 == 1)
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  return v3;
}

- (uint64_t)_performStateTransitionWithError:(void *)a3 block:
{
  void (**v5)(id, void *, id *);
  os_unfair_lock_s *v6;
  _HDProtectedDataOperationTransitionContext *v7;
  _HDProtectedDataOperationTransitionContext *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  NSObject *v15;
  void *v16;
  void *v17;
  id v18;
  id WeakRetained;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  unsigned __int8 v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (a1)
  {
    v6 = (os_unfair_lock_s *)(a1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v7 = [_HDProtectedDataOperationTransitionContext alloc];
    if (v7)
      v8 = -[_HDProtectedDataOperationTransitionContext initWithOldState:newState:](v7, "initWithOldState:newState:", *(_QWORD *)(a1 + 24), 0);
    else
      v8 = 0;
    v33 = 0;
    v5[2](v5, v8, &v33);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v33;
    v11 = v10;
    if (v9)
    {
      if (objc_msgSend(v9, "hasNewState"))
      {
        v12 = objc_msgSend(v9, "newState");
        v32 = v11;
        os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
        v13 = *(_QWORD *)(a1 + 24);
        switch(v13)
        {
          case 1:
            if (v12 == 2)
              goto LABEL_23;
            goto LABEL_27;
          case 2:
          case 3:
          case 8:
            if (v12 != 4)
              goto LABEL_27;
            goto LABEL_23;
          case 4:
            if ((unint64_t)(v12 - 5) >= 2)
              goto LABEL_27;
            goto LABEL_23;
          case 5:
            if (v12 != 7)
              goto LABEL_27;
            goto LABEL_23;
          case 6:
            if ((v12 | 2) != 7)
              goto LABEL_27;
            goto LABEL_23;
          case 7:
            if (v12 != 3 && v12 != 8)
              goto LABEL_27;
LABEL_23:
            _HKInitializeLogging();
            HKLogInfrastructure();
            v15 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              NSStringFromHDProtectedDataOperationState(v13);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              NSStringFromHDProtectedDataOperationState(v12);
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543874;
              v36 = a1;
              v37 = 2114;
              v38 = v16;
              v39 = 2114;
              v40 = v17;
              _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] State will change from %{public}@ to %{public}@", buf, 0x20u);

            }
            *(_QWORD *)(a1 + 24) = v12;
            v11 = v11;

            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            v18 = v9;
            os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
            WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
            os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));
            if (objc_msgSend(WeakRetained, "conformsToProtocol:", &unk_1EF252878))
              v20 = WeakRetained;
            else
              v20 = 0;

            objc_msgSend(v20, "protectedDataOperation:didTransitionWithContext:", a1, v18);
            switch(objc_msgSend(v18, "newState"))
            {
              case 2:
                objc_msgSend(*(id *)(a1 + 8), "registerObserver:", a1);
                break;
              case 4:
                objc_msgSend(*(id *)(a1 + 8), "registerProtectedDataAvailableObserver:", a1);
                break;
              case 5:
                v27 = objc_msgSend(v18, "oldState");
                if (v27 == 6)
                {
                  v30 = *(void **)(a1 + 8);
                  objc_msgSend((id)a1, "description");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "startEnqueuedWorkWithName:", v31);

                }
                else if (v27 == 4)
                {
                  v28 = (_QWORD *)a1;
                  v29 = 1;
                  goto LABEL_42;
                }
                break;
              case 6:
                v28 = (_QWORD *)a1;
                v29 = 0;
LABEL_42:
                -[HDProtectedDataOperation _startWorkNow:](v28, v29);
                break;
              default:
                break;
            }

            v14 = 1;
            goto LABEL_32;
          default:
LABEL_27:
            v21 = (void *)MEMORY[0x1E0CB35C8];
            NSStringFromHDProtectedDataOperationState(v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            NSStringFromHDProtectedDataOperationState(v12);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "hk_assignError:code:format:", &v32, 126, CFSTR("Invalid attempt to change state from %@ to %@"), v22, v23);

            v24 = v32;
            v11 = v24;
            if (!v11)
              goto LABEL_30;
            if (!a2)
              goto LABEL_29;
            goto LABEL_11;
        }
      }
      v14 = 1;
    }
    else
    {
      v11 = v10;
      if (v11)
      {
        if (a2)
        {
LABEL_11:
          v11 = objc_retainAutorelease(v11);
          *a2 = v11;
        }
        else
        {
LABEL_29:
          _HKLogDroppedError();
        }
      }
LABEL_30:

      v14 = 0;
    }
    os_unfair_lock_unlock(v6);
LABEL_32:
    v34 = v14;

    v25 = v34;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_lock_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

id __66__HDProtectedDataOperation__performTransitionToNewStateWithBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  id v4;
  void *v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(uint64_t (**)(uint64_t))(v2 + 16);
  v4 = a2;
  v5 = (void *)objc_msgSend(v4, "copyWithNewState:", v3(v2));

  return v5;
}

- (void)_startWorkNow:(_QWORD *)a1
{
  void *v4;
  void *v5;
  _QWORD v6[5];

  v4 = (void *)a1[1];
  objc_msgSend(a1, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__HDProtectedDataOperation__startWorkNow___block_invoke;
  v6[3] = &unk_1E6CFFF28;
  v6[4] = a1;
  objc_msgSend(v4, "startWorkNow:name:asynchronousBlock:", a2, v5, v6);

}

void __42__HDProtectedDataOperation__startWorkNow___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  void (**v9)(_QWORD);
  uint64_t v10;
  char v11;
  id v12;
  void (**v13)(_QWORD);
  id WeakRetained;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[5];
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  _BYTE aBlock[24];
  void *v24;
  uint64_t v25;
  void (**v26)(_QWORD);
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  v8 = a3;
  v9 = a4;
  if (v6)
  {
    v10 = MEMORY[0x1E0C809B0];
    v19[4] = v6;
    v20 = 0;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke;
    v19[3] = &unk_1E6D0FC28;
    v11 = -[HDProtectedDataOperation _performStateTransitionWithError:block:](v6, &v20, v19);
    v12 = v20;
    if ((v11 & 1) != 0)
    {
      *(_QWORD *)aBlock = v10;
      *(_QWORD *)&aBlock[8] = 3221225472;
      *(_QWORD *)&aBlock[16] = __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_246;
      v24 = &unk_1E6CE9C08;
      v25 = v6;
      v26 = v9;
      v13 = (void (**)(_QWORD))_Block_copy(aBlock);
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 16));
      WeakRetained = objc_loadWeakRetained((id *)(v6 + 40));
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 16));
      _HKInitializeLogging();
      HKLogInfrastructure();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
      if (WeakRetained)
      {
        if (v16)
        {
          *(_DWORD *)buf = 138543362;
          v22 = v6;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Here we go! Delegate asked to perform work!", buf, 0xCu);
        }

        objc_msgSend(v7, "profile");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "performWorkForOperation:profile:databaseAccessibilityAssertion:completion:", v6, v17, v8, v13);

      }
      else
      {
        if (v16)
        {
          *(_DWORD *)buf = 138543362;
          v22 = v6;
          _os_log_impl(&dword_1B7802000, v15, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to perform work because delegate is nil!", buf, 0xCu);
        }

        v13[2](v13);
      }

    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)aBlock = 138543618;
        *(_QWORD *)&aBlock[4] = v6;
        *(_WORD *)&aBlock[12] = 2114;
        *(_QWORD *)&aBlock[14] = v12;
        _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Failed to transition to doing work: %{public}@", aBlock, 0x16u);
      }

      v9[2](v9);
    }

  }
}

id __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return (id)objc_msgSend(a2, "copyWithNewState:", 7);
}

uint64_t __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_246(uint64_t a1)
{
  -[HDProtectedDataOperation _performStateTransitionWithError:block:](*(_QWORD *)(a1 + 32), 0, &__block_literal_global_239);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id __103__HDProtectedDataOperation__notifyDelegateToPerformWorkWithDatabase_accessibilityAssertion_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v4 = a2;
  v5 = objc_msgSend(v4, "oldState");
  if ((unint64_t)(v5 - 1) >= 6)
  {
    if (v5 == 7)
    {
      v8 = v4;
      v9 = 3;
    }
    else
    {
      if (v5 != 8)
        goto LABEL_8;
      v8 = v4;
      v9 = 4;
    }
    a3 = (void *)objc_msgSend(v8, "copyWithNewState:", v9);
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  NSStringFromHDProtectedDataOperationState(objc_msgSend(v4, "oldState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_assignError:code:format:", a3, 126, CFSTR("Invalid state at work complete: %@"), v7);

  a3 = 0;
LABEL_8:

  return a3;
}

- (void)protectedDataOperationSchedulerProfileIsReady:(id)a3
{
  -[HDProtectedDataOperation _performStateTransitionWithError:block:]((uint64_t)self, 0, &__block_literal_global_250_0);
}

id __74__HDProtectedDataOperation_protectedDataOperationSchedulerProfileIsReady___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a2;
  v5 = objc_msgSend(v4, "oldState");
  if ((unint64_t)(v5 - 3) >= 6)
  {
    if (v5 == 2)
    {
      v9 = 4;
    }
    else
    {
      if (v5 != 1)
      {
LABEL_8:
        v4 = v4;
        v8 = v4;
        goto LABEL_9;
      }
      v9 = 3;
    }
    v10 = objc_msgSend(v4, "copyWithNewState:", v9);

    v4 = (id)v10;
    goto LABEL_8;
  }
  v6 = (void *)MEMORY[0x1E0CB35C8];
  NSStringFromHDProtectedDataOperationState(objc_msgSend(v4, "oldState"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "hk_assignError:code:format:", a3, 126, CFSTR("Invalid state at profile ready: %@"), v7);

  v8 = 0;
LABEL_9:

  return v8;
}

- (void)protectedDataOperationSchedulerProtectedDataIsAvailable:(id)a3
{
  uint64_t v4;
  _QWORD *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[4];
  _QWORD *v9;

  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __84__HDProtectedDataOperation_protectedDataOperationSchedulerProtectedDataIsAvailable___block_invoke;
  v7[3] = &unk_1E6D0FCB0;
  v7[4] = self;
  v5 = v7;
  v6 = v5;
  if (self)
  {
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __66__HDProtectedDataOperation__performTransitionToNewStateWithBlock___block_invoke;
    v8[3] = &unk_1E6D0FC00;
    v9 = v5;
    -[HDProtectedDataOperation _performStateTransitionWithError:block:]((uint64_t)self, 0, v8);

  }
}

uint64_t __84__HDProtectedDataOperation_protectedDataOperationSchedulerProtectedDataIsAvailable___block_invoke(uint64_t a1)
{
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
    return 5;
  else
    return 6;
}

- (id)diagnosticDescription
{
  os_unfair_lock_s *p_lock;
  int64_t lock_state;
  void *v5;
  void *v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_state = self->_lock_state;
  os_unfair_lock_unlock(p_lock);
  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromHDProtectedDataOperationState(lock_state);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@ %@>"), self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_destroyWeak((id *)&self->_lock_delegate);
  objc_storeStrong((id *)&self->_protectedDataOperationScheduler, 0);
}

@end
