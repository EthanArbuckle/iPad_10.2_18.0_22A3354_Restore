@implementation HDMedicationCountProvider

- (HDMedicationCountProvider)init
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

- (HDMedicationCountProvider)initWithDaemon:(id)a3
{
  id v4;
  HDMedicationCountProvider *v5;
  HDMedicationCountProvider *v6;
  id v7;
  void *v8;
  uint64_t v9;
  HDMedicationCountObserver *observers;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HDMedicationCountProvider;
  v5 = -[HDMedicationCountProvider init](&v12, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_daemon, v4);
    v7 = objc_alloc(MEMORY[0x1E0CB6988]);
    HKLogHealthOntology();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "initWithName:loggingCategory:", CFSTR("HDMedicationCountObserver"), v8);
    observers = v6->_observers;
    v6->_observers = (HDMedicationCountObserver *)v9;

    v6->_lock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (void)monitorMedicationCountsInProfile:(id)a3
{
  NSMapTable *isProfileReadyByProfile;
  NSMapTable *v5;
  NSMapTable *v6;
  void *v7;
  id v8;

  v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  isProfileReadyByProfile = self->_isProfileReadyByProfile;
  if (!isProfileReadyByProfile)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_isProfileReadyByProfile;
    self->_isProfileReadyByProfile = v5;

    isProfileReadyByProfile = self->_isProfileReadyByProfile;
  }
  -[NSMapTable objectForKey:](isProfileReadyByProfile, "objectForKey:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    -[NSMapTable setObject:forKey:](self->_isProfileReadyByProfile, "setObject:forKey:", MEMORY[0x1E0C9AAA0], v8);
    os_unfair_lock_unlock(&self->_lock);
    -[HDMedicationCountProvider _monitorMedicationCountsInProfile:]((uint64_t)self, v8);
    objc_msgSend(v8, "registerProfileReadyObserver:queue:", self, 0);
  }

}

- (void)_monitorMedicationCountsInProfile:(uint64_t)a1
{
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    v3 = (os_unfair_lock_s *)(a1 + 16);
    v4 = a2;
    os_unfair_lock_lock(v3);
    v5 = *(void **)(a1 + 24);
    if (!v5)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v6;

      v5 = *(void **)(a1 + 24);
    }
    objc_msgSend(v5, "setObject:forKey:", &unk_1E6E11000, v4);
    os_unfair_lock_unlock(v3);
    objc_msgSend(v4, "userDomainConceptManager");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "addUserDomainConceptObserver:queue:", a1, 0);
  }
}

- (int64_t)ontologyBackedMedicationCountInProfile:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_ontologyBackedMedicationCountByProfile, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(&self->_lock);
  if (v5)
  {
    v6 = objc_msgSend(v5, "integerValue");
    if (v6 == -1)
      v6 = -[HDMedicationCountProvider _updateAndReturnCountForProfile:]((uint64_t)self, v4);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)_updateAndReturnCountForProfile:(uint64_t)a1
{
  id v3;

  v3 = a2;
  if (a1)
  {
    os_unfair_lock_assert_not_owner((const os_unfair_lock *)(a1 + 16));
    if (-[HDMedicationCountProvider _isReadyProfile:]((os_unfair_lock_s *)a1, v3))
      a1 = -[HDMedicationCountProvider _updateCountForReadyProfile:](a1, v3);
    else
      a1 = -1;
  }

  return a1;
}

- (void)addMedicationCountObserver:(id)a3 queue:(id)a4
{
  -[HDMedicationCountObserver registerObserver:queue:](self->_observers, "registerObserver:queue:", a3, a4);
}

- (void)removeMedicationCountObserver:(id)a3
{
  -[HDMedicationCountObserver unregisterObserver:](self->_observers, "unregisterObserver:", a3);
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4;

  v4 = a3;
  if ((-[HDMedicationCountProvider _getAndSetReadyProfile:]((os_unfair_lock_s *)self, v4) & 1) == 0)
    -[HDMedicationCountProvider _updateCountForReadyProfile:]((uint64_t)self, v4);

}

- (os_unfair_lock_s)_getAndSetReadyProfile:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v2 = result;
    v3 = result + 4;
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "setObject:forKey:", MEMORY[0x1E0C9AAB0], v4);
    os_unfair_lock_unlock(v3);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

- (uint64_t)_updateCountForReadyProfile:(uint64_t)a1
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    objc_msgSend(v3, "userDomainConceptManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v16 = 0;
      v17 = &v16;
      v18 = 0x2020000000;
      v19 = -1;
      v6 = (void *)MEMORY[0x1E0D295B0];
      objc_msgSend(v4, "database");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 0;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __57__HDMedicationCountProvider__updateCountForReadyProfile___block_invoke;
      v12[3] = &unk_1E6E00D40;
      v12[4] = a1;
      v14 = &v16;
      v13 = v4;
      v8 = objc_msgSend(v6, "performReadTransactionWithHealthDatabase:error:block:", v7, &v15, v12);
      v9 = v15;

      if ((v8 & 1) == 0 && (HKIsUnitTesting() & 1) == 0)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          -[HDMedicationCountProvider _updateCountForReadyProfile:].cold.1(a1, (uint64_t)v9, v10);

      }
      a1 = v17[3];

      _Block_object_dispose(&v16, 8);
    }
    else
    {
      a1 = 0;
    }
  }

  return a1;
}

- (void)userDomainConceptManager:(id)a3 didAddUserDomainConcepts:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v13, "firstOntologyCoding");
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          if (v14)
            ++v10;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
    if (v10 >= 1)
    {
      objc_msgSend(v6, "profile");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMedicationCountProvider _updateOntologyBackedMedicationCountWithAddedCount:profile:]((uint64_t)self, v10, v15);

    }
  }

}

- (void)_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:
{
  os_unfair_lock_s *v5;
  id v6;

  if (a1)
  {
    v5 = (os_unfair_lock_s *)(a1 + 16);
    v6 = a3;
    os_unfair_lock_lock(v5);
    -[HDMedicationCountProvider _lock_updateOntologyBackedMedicationCountWithAddedCount:profile:](a1, a2, v6);
    os_unfair_lock_unlock(v5);
    -[HDMedicationCountProvider _updateAndReturnCountForProfile:](a1, v6);

  }
}

- (void)userDomainConceptManager:(id)a3 didDeleteUserDomainConcepts:(id)a4
{
  id v5;

  objc_msgSend(a3, "profile");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable setObject:forKey:](self->_ontologyBackedMedicationCountByProfile, "setObject:forKey:", &unk_1E6E11000, v5);
  os_unfair_lock_unlock(&self->_lock);
  -[HDMedicationCountProvider _updateAndReturnCountForProfile:]((uint64_t)self, v5);

}

- (os_unfair_lock_s)_isReadyProfile:(os_unfair_lock_s *)result
{
  os_unfair_lock_s *v2;
  os_unfair_lock_s *v3;
  id v4;
  void *v5;
  uint64_t v6;

  if (result)
  {
    v2 = result;
    v3 = result + 4;
    v4 = a2;
    os_unfair_lock_lock(v3);
    objc_msgSend(*(id *)&v2[8]._os_unfair_lock_opaque, "objectForKey:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "BOOLValue");
    os_unfair_lock_unlock(v3);
    return (os_unfair_lock_s *)v6;
  }
  return result;
}

BOOL __57__HDMedicationCountProvider__updateCountForReadyProfile___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  os_unfair_lock_s *v5;
  id v6;
  uint64_t v7;

  v5 = (os_unfair_lock_s *)(*(_QWORD *)(a1 + 32) + 16);
  v6 = a2;
  os_unfair_lock_lock(v5);
  v7 = -[HDMedicationCountProvider _lock_lookupAndUpdateCountForProfile:transaction:error:](*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), v6, a3);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 16));
  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) != -1;
}

- (uint64_t)_lock_lookupAndUpdateCountForProfile:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = a2;
  if (a1)
  {
    -[HDMedicationCountProvider _countOfOntologyBackedMedicationsForTransaction:error:](a1, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, "integerValue");
      if (v10)
        v11 = -1;
      else
        v11 = 0;
      if (v10 == 1)
        v11 = 1;
      if (v10 >= 2)
        v12 = 2;
      else
        v12 = v11;
      objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[HDMedicationCountProvider _lock_updateCountAndNotifyIfRequiredForProfile:currentCountNumber:newCount:](a1, v7, v13, v12);

    }
    else
    {
      v12 = -1;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)_lock_updateOntologyBackedMedicationCountWithAddedCount:(void *)a3 profile:
{
  const os_unfair_lock *v5;
  id v6;
  uint64_t v7;
  id v8;

  if (a1)
  {
    v5 = (const os_unfair_lock *)(a1 + 16);
    v6 = a3;
    os_unfair_lock_assert_owner(v5);
    objc_msgSend(*(id *)(a1 + 24), "objectForKey:", v6);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v7 = +[HDMedicationCountProvider _medicationCountForCurrentCountNumber:addedCount:]((uint64_t)HDMedicationCountProvider, v8, a2);
    -[HDMedicationCountProvider _lock_updateCountAndNotifyIfRequiredForProfile:currentCountNumber:newCount:](a1, v6, v8, v7);

  }
}

- (id)_countOfOntologyBackedMedicationsForTransaction:(uint64_t)a3 error:
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v4 = (void *)MEMORY[0x1E0D29840];
  v5 = (void *)MEMORY[0x1E0CB6D48];
  v6 = a2;
  objc_msgSend(v5, "medicationUserDomainConceptTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithTypeIdentifier();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", *MEMORY[0x1E0D293C0], *MEMORY[0x1E0CB5388]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "predicateMatchingAllPredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D295B8], "countOfUserDomainConceptsMatchingPredicate:options:transaction:error:", v11, 0, v6, a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (uint64_t)_medicationCountForCurrentCountNumber:(uint64_t)a3 addedCount:
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a2;
  objc_opt_self();
  if (a3)
    v5 = -1;
  else
    v5 = 0;
  if (a3 == 1)
    v5 = 1;
  if (a3 >= 2)
    v6 = 2;
  else
    v6 = v5;
  if (v4)
  {
    v7 = objc_msgSend(v4, "integerValue");
    if (v7 > v6)
      v6 = v7;
  }

  return v6;
}

- (void)_lock_updateCountAndNotifyIfRequiredForProfile:(void *)a3 currentCountNumber:(uint64_t)a4 newCount:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  uint64_t v16;

  v7 = a2;
  v8 = a3;
  if (a1)
  {
    os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 16));
    v9 = objc_msgSend(v8, "integerValue");
    if (v9)
      v10 = -1;
    else
      v10 = 0;
    if (v9 == 1)
      v10 = 1;
    if (v9 >= 2)
      v10 = 2;
    if (v10 != a4)
    {
      v11 = *(void **)(a1 + 24);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setObject:forKey:", v12, v7);

      v13 = *(void **)(a1 + 8);
      v14[0] = MEMORY[0x1E0C809B0];
      v14[1] = 3221225472;
      v14[2] = __104__HDMedicationCountProvider__lock_updateCountAndNotifyIfRequiredForProfile_currentCountNumber_newCount___block_invoke;
      v14[3] = &unk_1E6E00D68;
      v14[4] = a1;
      v15 = v7;
      v16 = a4;
      objc_msgSend(v13, "notifyObservers:", v14);

    }
  }

}

uint64_t __104__HDMedicationCountProvider__lock_updateCountAndNotifyIfRequiredForProfile_currentCountNumber_newCount___block_invoke(_QWORD *a1, void *a2)
{
  return objc_msgSend(a2, "medicationCountProvider:didObserveChangeForProfile:ontologyBackedMedicationCount:", a1[4], a1[5], a1[6]);
}

- (HDDaemon)daemon
{
  return (HDDaemon *)objc_loadWeakRetained((id *)&self->_daemon);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_daemon);
  objc_storeStrong((id *)&self->_isProfileReadyByProfile, 0);
  objc_storeStrong((id *)&self->_ontologyBackedMedicationCountByProfile, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_updateCountForReadyProfile:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_1B815E000, log, OS_LOG_TYPE_ERROR, "%{public}@ Failed to determine if profile has ontology backed medications: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
