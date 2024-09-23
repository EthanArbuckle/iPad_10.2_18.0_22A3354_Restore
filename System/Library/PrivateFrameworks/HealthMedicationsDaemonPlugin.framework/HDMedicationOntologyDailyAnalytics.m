@implementation HDMedicationOntologyDailyAnalytics

- (HDMedicationOntologyDailyAnalytics)init
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

- (HDMedicationOntologyDailyAnalytics)initWithProfile:(id)a3
{
  id v4;
  HDMedicationOntologyDailyAnalytics *v5;
  HDMedicationOntologyDailyAnalytics *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDMedicationOntologyDailyAnalytics;
  v5 = -[HDMedicationOntologyDailyAnalytics init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_profile, v4);

  return v6;
}

- (BOOL)isEventSubmissionIHAGated
{
  return 0;
}

- (NSString)eventName
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99DA0];
  v3 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "raise:format:", v3, CFSTR("The -%@ method is not available on %@"), v4, objc_opt_class());

  return 0;
}

- (id)makeUnrestrictedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[5];

  v24[4] = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithDictionary:", &unk_1E6E11718);
  v7 = (void *)MEMORY[0x1E0D29840];
  HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v8;
  HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v9;
  HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v10 = objc_claimAutoreleasedReturnValue();
  v24[2] = v10;
  HDOntologyShardRegistryPredicateForCurrentSchemaEntry();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "predicateMatchingAnyPredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDMedicationOntologyDailyAnalytics shardRegistry](self, "shardRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __87__HDMedicationOntologyDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke;
  v21[3] = &unk_1E6E01788;
  v15 = v6;
  v22 = v15;
  LOBYTE(v10) = objc_msgSend(v14, "enumerateEntriesWithPredicate:orderingTerms:error:enumerationHandler:", v13, 0, &v23, v21);
  v16 = v23;

  if ((v10 & 1) != 0)
  {
    v17 = v15;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[HDMedicationOntologyDailyAnalytics makeUnrestrictedEventPayloadWithDataSource:error:].cold.1((uint64_t)self, (uint64_t)v16, v18);

    v19 = v16;
    if (v19)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v19);
      else
        _HKLogDroppedError();
    }

    v17 = 0;
  }

  return v17;
}

uint64_t __87__HDMedicationOntologyDailyAnalytics_makeUnrestrictedEventPayloadWithDataSource_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;

  v3 = a2;
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0CB56F0]);

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("availableStateCoreMeds"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("desiredStateCoreMeds"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v10 = CFSTR("shardVersionCoreMeds");
LABEL_9:
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, v10);

    goto LABEL_10;
  }
  objc_msgSend(v3, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0CB5718]);

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v13, CFSTR("availableStateMedsScanning"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("desiredStateMedsScanning"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v10 = CFSTR("shardVersionMedsScaning");
    goto LABEL_9;
  }
  objc_msgSend(v3, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB56F8]);

  if (v16)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v17, CFSTR("availableStateInteractions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v18, CFSTR("desiredStateInteractions"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v10 = CFSTR("shardVersionInteractions");
    goto LABEL_9;
  }
  objc_msgSend(v3, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "isEqualToString:", *MEMORY[0x1E0CB5710]);

  if (v20)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "availableState"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v21, CFSTR("availableStateMedsEducation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "desiredState"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v22, CFSTR("desiredStateMedsEducation"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v3, "currentVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 32);
    v10 = CFSTR("shardVersionMedsEducation");
    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

- (id)makeIHAGatedEventPayloadWithDataSource:(id)a3 error:(id *)a4
{
  return (id)MEMORY[0x1E0C9AA70];
}

- (id)shardRegistry
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ontologyUpdateCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shardRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_profile);
}

- (void)makeUnrestrictedEventPayloadWithDataSource:(os_log_t)log error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B815E000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Error enumerating shard registry entries: %{public}@", (uint8_t *)&v3, 0x16u);
}

@end
