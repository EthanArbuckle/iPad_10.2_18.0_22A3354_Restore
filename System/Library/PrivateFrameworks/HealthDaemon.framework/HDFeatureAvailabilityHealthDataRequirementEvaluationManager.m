@implementation HDFeatureAvailabilityHealthDataRequirementEvaluationManager

- (HDFeatureAvailabilityHealthDataRequirementEvaluationManager)initWithProfile:(id)a3
{
  id v4;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v5;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v6;
  uint64_t v7;
  NSMapTable *lock_observedRequirementsByObserver;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDFeatureAvailabilityHealthDataRequirementEvaluationManager;
  v5 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v7 = objc_claimAutoreleasedReturnValue();
    lock_observedRequirementsByObserver = v6->_lock_observedRequirementsByObserver;
    v6->_lock_observedRequirementsByObserver = (NSMapTable *)v7;

  }
  return v6;
}

- (id)evaluationOfRequirements:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id *v26;
  uint64_t v27;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v28;
  uint64_t v29;
  void *v30;
  id obj;
  void *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  _BYTE v39[128];
  const __CFString *v40;
  void *v41;
  const __CFString *v42;
  void *v43;
  uint8_t buf[4];
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
  if (v33)
  {
    v8 = *(_QWORD *)v35;
    v26 = a4;
    v27 = *(_QWORD *)v35;
    v28 = self;
    while (2)
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v35 != v8)
          objc_enumerationMutation(obj);
        v10 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * i);
        v11 = v10;
        if (!self)
        {

LABEL_27:
          v24 = 0;
          goto LABEL_28;
        }
        -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v10, a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v12)
        {
          v38 = 0;
          objc_msgSend(v12, "isRequirementSatisfied:error:", v11, &v38);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = v38;
          if (v14)
          {
            v16 = v14;
          }
          else
          {
            objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            _HKInitializeLogging();
            HKLogInfrastructure();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543874;
              v45 = self;
              v46 = 2114;
              v47 = v32;
              v48 = 2114;
              v49 = v15;
              _os_log_error_impl(&dword_1B7802000, v17, OS_LOG_TYPE_ERROR, "[%{public}@] Error evaluating requirement %{public}@: %{public}@", buf, 0x20u);
            }

            v18 = (void *)MEMORY[0x1E0CB35C8];
            if (v15)
            {
              objc_msgSend(v15, "domain");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v29 = objc_msgSend(v15, "code");
              objc_msgSend(v15, "userInfo");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              v42 = CFSTR("HKFeatureAvailabilityRequirementIdentifier");
              v43 = v32;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "hk_dictionaryByAddingEntriesFromDictionary:", v20);
              v21 = v7;
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, v29, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              v7 = v21;
              a4 = v26;

            }
            else
            {
              v40 = CFSTR("HKFeatureAvailabilityRequirementIdentifier");
              v41 = v32;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "hk_error:userInfo:", 2000, v19);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }

            v15 = v23;
            v8 = v27;
            self = v28;
            if (v15)
            {
              if (a4)
                *a4 = objc_retainAutorelease(v15);
              else
                _HKLogDroppedError();
            }

          }
        }
        else
        {
          v14 = 0;
        }

        if (!v14)
          goto LABEL_27;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, v11);

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v39, 16);
      if (v33)
        continue;
      break;
    }
  }

  v24 = (void *)objc_msgSend(v7, "copy");
LABEL_28:

  return v24;
}

- (id)_evaluatorForRequirement:(_QWORD *)a3 error:
{
  id v5;
  id WeakRetained;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  const __CFString *v26;
  void *v27;
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    if (WeakRetained)
    {
      v7 = objc_loadWeakRetained((id *)(a1 + 8));
      objc_msgSend(v7, "profileExtensionsConformingToProtocol:", &unk_1EF252818, (_QWORD)v22);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v8 = (void *)MEMORY[0x1E0C9AA60];
    }

    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * i), "evaluatorForRequirement:", v5, (_QWORD)v22);
          v13 = objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            v20 = (void *)v13;
            goto LABEL_21;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v32, 16);
        if (v10)
          continue;
        break;
      }
    }

    objc_msgSend((id)objc_opt_class(), "requirementIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogInfrastructure();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v29 = a1;
      v30 = 2114;
      v31 = v8;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "[%{public}@] No evaluator found for requirement %{public}@", buf, 0x16u);
    }

    v15 = (void *)MEMORY[0x1E0CB35C8];
    v26 = CFSTR("HKFeatureAvailabilityRequirementIdentifier");
    v27 = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "hk_error:userInfo:", 3, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = v17;
    v19 = v18;
    if (v18)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v18);
      else
        _HKLogDroppedError();
    }

    v20 = 0;
LABEL_21:

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (void)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5
{
  -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager registerObserver:forRequirements:queue:error:](self, "registerObserver:forRequirements:queue:error:", a3, a4, 0, 0);
}

- (BOOL)registerObserver:(id)a3 forRequirements:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  os_unfair_lock_t lock;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v11, "count"))
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v39 = self;
      v40 = 2114;
      v41 = v10;
      _os_log_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering %{public}@ for changes", buf, 0x16u);
    }

    lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    -[NSMapTable objectForKey:](self->_lock_observedRequirementsByObserver, "objectForKey:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v16;

    v32 = v11;
    v30 = v18;
    objc_msgSend(v11, "hk_minus:", v18);
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v34 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v24, a6);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v25)
          {
            v17 = 0;
            v28 = v19;
            v27 = v30;
            goto LABEL_18;
          }
          v26 = v25;
          objc_msgSend(v25, "registerObserver:forRequirement:queue:", v10, v24, v12);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v21)
          continue;
        break;
      }
    }

    v27 = v30;
    objc_msgSend(v30, "setByAddingObjectsFromSet:", v19);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_lock_observedRequirementsByObserver, "setObject:forKey:", v28, v10);
    v17 = 1;
LABEL_18:
    os_unfair_lock_unlock(lock);

    v11 = v32;
  }
  else
  {
    v17 = 1;
  }

  return v17;
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v20 = self;
    v21 = 2114;
    v22 = v4;
    _os_log_impl(&dword_1B7802000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering %{public}@ from changes", buf, 0x16u);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_lock_observedRequirementsByObserver, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager _evaluatorForRequirement:error:]((uint64_t)self, v12, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "unregisterObserver:forRequirement:", v4, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v9);
    }
    -[NSMapTable removeObjectForKey:](self->_lock_observedRequirementsByObserver, "removeObjectForKey:", v4);
  }
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_observedRequirementsByObserver, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
