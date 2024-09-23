@implementation HDOnboardingCompletionManager

- (HDOnboardingCompletionManager)initWithProfile:(id)a3
{
  id v4;
  HDOnboardingCompletionManager *v5;
  HDOnboardingCompletionManager *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *observersByFeatureIdentifier;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HDOnboardingCompletionManager;
  v5 = -[HDOnboardingCompletionManager init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByFeatureIdentifier = v6->_observersByFeatureIdentifier;
    v6->_observersByFeatureIdentifier = v7;

  }
  return v6;
}

- (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__58;
  v20 = __Block_byref_object_dispose__58;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__HDOnboardingCompletionManager_onboardingCompletionsForHighestVersionOfFeatureIdentifier_error___block_invoke;
  v13[3] = &unk_1E6CEF700;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDOnboardingCompletionEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __97__HDOnboardingCompletionManager_onboardingCompletionsForHighestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDOnboardingCompletionEntity onboardingCompletionsForHighestVersionOfFeatureIdentifier:transaction:error:](HDOnboardingCompletionEntity, "onboardingCompletionsForHighestVersionOfFeatureIdentifier:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__58;
  v20 = __Block_byref_object_dispose__58;
  v21 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __96__HDOnboardingCompletionManager_onboardingCompletionsForLowestVersionOfFeatureIdentifier_error___block_invoke;
  v13[3] = &unk_1E6CEF700;
  v15 = &v16;
  v9 = v6;
  v14 = v9;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDOnboardingCompletionEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v13);

  if ((_DWORD)a4)
    v10 = (void *)v17[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v16, 8);
  return v11;
}

BOOL __96__HDOnboardingCompletionManager_onboardingCompletionsForLowestVersionOfFeatureIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDOnboardingCompletionEntity onboardingCompletionsForLowestVersionOfFeatureIdentifier:transaction:error:](HDOnboardingCompletionEntity, "onboardingCompletionsForLowestVersionOfFeatureIdentifier:transaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)insertOnboardingCompletion:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HDOnboardingCompletionManager *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __66__HDOnboardingCompletionManager_insertOnboardingCompletion_error___block_invoke;
  v9[3] = &unk_1E6CF25E0;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)self, (uint64_t)a4, v9, 0);

  return (char)a4;
}

id __66__HDOnboardingCompletionManager_insertOnboardingCompletion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (id *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentSyncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOnboardingCompletionEntity insertOnboardingCompletion:syncIdentity:transaction:error:](HDOnboardingCompletionEntity, "insertOnboardingCompletion:syncIdentity:transaction:error:", v5, objc_msgSend(v11, "persistentID"), v7, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(*(id *)(a1 + 32), "featureIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setWithObject:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (BOOL)_performWriteTransactionAndNotifyObserversWithError:(void *)a3 block:(void *)a4 inaccessibilityHandler:
{
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  _BOOL8 v11;
  _QWORD v13[5];
  id v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v7 = a3;
  v8 = a4;
  if (a1)
  {
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x3032000000;
    v16[3] = __Block_byref_object_copy__58;
    v16[4] = __Block_byref_object_dispose__58;
    v17 = 0;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
    objc_msgSend(WeakRetained, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke;
    v13[3] = &unk_1E6CF2608;
    v15 = v16;
    v13[4] = a1;
    v14 = v7;
    v11 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDOnboardingCompletionEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v10, a2, v13, v8);

    _Block_object_dispose(v16, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)resetOnboardingCompletionsForFeature:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  HDOnboardingCompletionManager *v11;

  v6 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__HDOnboardingCompletionManager_resetOnboardingCompletionsForFeature_error___block_invoke;
  v9[3] = &unk_1E6CF25E0;
  v10 = v6;
  v11 = self;
  v7 = v6;
  LOBYTE(a4) = -[HDOnboardingCompletionManager _performWriteTransactionAndNotifyObserversWithError:block:inaccessibilityHandler:]((uint64_t)self, (uint64_t)a4, v9, 0);

  return (char)a4;
}

id __76__HDOnboardingCompletionManager_resetOnboardingCompletionsForFeature_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = *(_QWORD *)(a1 + 32);
  v6 = (id *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "syncIdentityManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "currentSyncIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "entity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = +[HDOnboardingCompletionEntity deleteAllCompletionsForFeatureIdentifier:syncIdentity:transaction:error:](HDOnboardingCompletionEntity, "deleteAllCompletionsForFeatureIdentifier:syncIdentity:transaction:error:", v5, objc_msgSend(v11, "persistentID"), v7, a3);

  if ((_DWORD)a3)
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", *(_QWORD *)(a1 + 32));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

BOOL __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v5;
  void (*v6)(uint64_t, id, uint64_t);
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v13[6];

  v5 = a1[5];
  v6 = *(void (**)(uint64_t, id, uint64_t))(v5 + 16);
  v7 = a2;
  v6(v5, v7, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke_2;
  v13[3] = &unk_1E6CED168;
  v11 = a1[6];
  v13[4] = a1[4];
  v13[5] = v11;
  objc_msgSend(v7, "onCommit:orRollback:", v13, 0);

  return *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) != 0;
}

void __114__HDOnboardingCompletionManager__performWriteTransactionAndNotifyObserversWithError_block_inaccessibilityHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  os_unfair_lock_s *lock;
  _QWORD v12[6];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  if (v1)
  {
    lock = (os_unfair_lock_s *)(v1 + 16);
    os_unfair_lock_lock((os_unfair_lock_t)(v1 + 16));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = v2;
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      v7 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v14 != v6)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          objc_msgSend(*(id *)(v1 + 24), "objectForKeyedSubscript:", v9, lock);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v12[0] = v7;
          v12[1] = 3221225472;
          v12[2] = __70__HDOnboardingCompletionManager__notifyObserversOfFeatureIdentifiers___block_invoke;
          v12[3] = &unk_1E6CF2630;
          v12[4] = v1;
          v12[5] = v9;
          objc_msgSend(v10, "notifyObservers:", v12);

        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v5);
    }

    os_unfair_lock_unlock(lock);
  }

}

uint64_t __70__HDOnboardingCompletionManager__notifyObserversOfFeatureIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "onboardingCompletionManager:didUpdateOnboardingCompletionsForFeatureIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (BOOL)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 error:(id *)a5
{
  id v8;
  HDOnboardingCompletionJournalOperation *v9;
  id WeakRetained;

  v8 = a3;
  v9 = -[HDOnboardingCompletionJournalOperation initWithCodableOnboardingCompletions:syncProvenance:]([HDOnboardingCompletionJournalOperation alloc], "initWithCodableOnboardingCompletions:syncProvenance:", v8, a4);

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a5) = -[HDOnboardingCompletionJournalOperation performOrJournalWithProfile:error:](v9, "performOrJournalWithProfile:error:", WeakRetained, a5);

  return (char)a5;
}

id __113__HDOnboardingCompletionManager__insertCodableOnboardingCompletions_syncProvenance_error_inaccessabilityHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  id *v6;
  id v7;
  id WeakRetained;
  void *v9;

  v4 = a1[6];
  v5 = a1[4];
  v6 = (id *)(a1[5] + 8);
  v7 = a2;
  WeakRetained = objc_loadWeakRetained(v6);
  +[HDOnboardingCompletionEntity insertCodableOnboardingCompletions:syncProvenance:profile:transaction:error:](HDOnboardingCompletionEntity, "insertCodableOnboardingCompletions:syncProvenance:profile:transaction:error:", v5, v4, WeakRetained, v7, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)registerObserver:(id)a3 featureIdentifier:(id)a4 queue:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  v9 = a5;
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_observersByFeatureIdentifier, "objectForKeyedSubscript:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    v11 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogInfrastructure();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithName:loggingCategory:", v8, v12);

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_observersByFeatureIdentifier, "setObject:forKeyedSubscript:", v10, v8);
  }
  objc_msgSend(v10, "registerObserver:queue:", v13, v9);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)unregisterObserver:(id)a3 featureIdentifier:(id)a4
{
  os_unfair_lock_s *p_lock;
  id v7;
  id v8;

  p_lock = &self->_lock;
  v7 = a4;
  v8 = a3;
  os_unfair_lock_lock(p_lock);
  -[HDOnboardingCompletionManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v8, v7);

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_unregisterObserver:(void *)a3 featureIdentifier:
{
  const os_unfair_lock *v5;
  id v6;
  id v7;
  id v8;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 16);
    v6 = a3;
    v7 = a2;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(*(id *)(a1 + 24), "objectForKeyedSubscript:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "unregisterObserver:", v7);
  }
}

- (void)unregisterObserver:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[NSMutableDictionary allKeys](self->_observersByFeatureIdentifier, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[HDOnboardingCompletionManager _lock_unregisterObserver:featureIdentifier:]((uint64_t)self, v4, *(void **)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByFeatureIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
