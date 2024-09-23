@implementation HDDrugInteractionEngine

+ (id)interactionClassesForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 31, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  objc_msgSend(v10, "ontologyDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__HDDrugInteractionEngine_interactionClassesForConceptWithIdentifier_profile_error___block_invoke;
  v17[3] = &unk_1E6E007E0;
  v19 = &v20;
  v12 = v9;
  v18 = v12;
  v13 = objc_msgSend(v11, "performTransactionWithError:transactionHandler:", a5, v17);

  if ((v13 & 1) != 0)
    v14 = (id)v21[5];
  else
    v14 = 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

BOOL __84__HDDrugInteractionEngine_interactionClassesForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(uint64_t *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionClassesForConceptWithIdentifier_ontologyTransaction_error_, v8, CFSTR("HDDrugInteractionEngine.m"), 297, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v6, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    if (objc_msgSend(v9, "count"))
    {
      v17[0] = MEMORY[0x1E0C809B0];
      v17[1] = 3221225472;
      v17[2] = __97__HDDrugInteractionEngine__interactionClassesForConceptWithIdentifier_ontologyTransaction_error___block_invoke;
      v17[3] = &unk_1E6E008A8;
      v18 = v6;
      objc_msgSend(v10, "hk_map:", v17);
      v11 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v20 = v8;
        v21 = 2114;
        v22 = v6;
        _os_log_impl(&dword_1B815E000, v13, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found 0 interaction class concepts for product identifier: %{public}@", buf, 0x16u);
      }

      v11 = objc_alloc_init(MEMORY[0x1E0C99E60]);
    }
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v15 = *a4;
      *(_DWORD *)buf = 138543874;
      v20 = v8;
      v21 = 2114;
      v22 = v6;
      v23 = 2114;
      v24 = v15;
      _os_log_error_impl(&dword_1B815E000, v12, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get interaction concepts for identifier: %{public}@, error: %{public}@", buf, 0x20u);
    }

    v11 = 0;
  }

  return v11;
}

+ (id)interactionClassesForMedication:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 52, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  objc_msgSend(v9, "firstOntologyCoding");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstOntologyCoding != nil"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5;
  v27 = __Block_byref_object_dispose__5;
  v28 = 0;
  objc_msgSend(v10, "ontologyDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __73__HDDrugInteractionEngine_interactionClassesForMedication_profile_error___block_invoke;
  v20[3] = &unk_1E6E007E0;
  v22 = &v23;
  v13 = v9;
  v21 = v13;
  v14 = objc_msgSend(v12, "performTransactionWithError:transactionHandler:", a5, v20);

  if ((v14 & 1) != 0)
  {
    v15 = (id)v24[5];
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine interactionClassesForMedication:profile:error:].cold.1();
    }

    v15 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v15;
}

BOOL __73__HDDrugInteractionEngine_interactionClassesForMedication_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), v6, v7, a3);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
  return v11;
}

+ (id)_interactionClassesForMedication:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void *v16;

  v8 = a2;
  v9 = a4;
  v10 = a3;
  v11 = objc_opt_self();
  if (!v8)
  {
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionClassesForMedication_ontologyTransaction_interactionClassCache_error_, v15, CFSTR("HDDrugInteractionEngine.m"), 326, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  objc_msgSend(v8, "firstConceptIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v10, v9, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)interactionClassForLifestyleFactor:(unint64_t)a3 profile:(id)a4 interactionClassOut:(id *)a5 error:(id *)a6
{
  id v9;
  void *v10;
  char v11;
  NSObject *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__5;
  v19 = __Block_byref_object_dispose__5;
  v20 = 0;
  objc_msgSend(v9, "ontologyDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__HDDrugInteractionEngine_interactionClassForLifestyleFactor_profile_interactionClassOut_error___block_invoke;
  v14[3] = &unk_1E6E00808;
  v14[4] = &v15;
  v14[5] = a3;
  v11 = objc_msgSend(v10, "performTransactionWithError:transactionHandler:", a6, v14);

  if ((v11 & 1) != 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease((id)v16[5]);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      HKStringFromDrugInteractionLifestyleFactor();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine interactionClassForLifestyleFactor:profile:interactionClassOut:error:].cold.1();
    }

  }
  _Block_object_dispose(&v15, 8);

  return v11;
}

BOOL __96__HDDrugInteractionEngine_interactionClassForLifestyleFactor_profile_interactionClassOut_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  id obj;

  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactor:ontologyTransaction:interactionClassCache:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v5, a2, 0, &obj, a3);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (BOOL)_interactionClassForLifestyleFactor:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(_QWORD *)a5 interactionClassOut:(_QWORD *)a6 error:
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  _BOOL8 v14;
  id v15;
  void *v16;
  id v18;

  v9 = a3;
  v10 = a4;
  objc_opt_self();
  HKConceptIdentifierForDrugInteractionLifestyleFactor();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "anyObject");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    if (!a5)
    {
      v14 = 1;
      goto LABEL_11;
    }
    v13 = objc_retainAutorelease(v13);
    v14 = 1;
    goto LABEL_9;
  }
  v18 = 0;
  v14 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v11, v9, &v18, a6);
  v15 = v18;
  v13 = v15;
  if (v14 && v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v15, 0);
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v16, v11);

  }
  if (a5)
  {
    v13 = objc_retainAutorelease(v13);
LABEL_9:
    *a5 = v13;
  }
LABEL_11:

  return v14;
}

+ (id)numberOfInteractionsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  NSObject *v15;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 103, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__5;
  v25 = __Block_byref_object_dispose__5;
  v26 = 0;
  objc_msgSend(v10, "ontologyDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __86__HDDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_profile_error___block_invoke;
  v18[3] = &unk_1E6E007E0;
  v20 = &v21;
  v12 = v9;
  v19 = v12;
  v13 = objc_msgSend(v11, "performTransactionWithError:transactionHandler:", a5, v18);

  if ((v13 & 1) != 0)
  {
    v14 = (id)v22[5];
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:profile:error:].cold.1();
    }

    v14 = 0;
  }

  _Block_object_dispose(&v21, 8);
  return v14;
}

BOOL __86__HDDrugInteractionEngine_numberOfInteractionsForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDDrugInteractionEngine _numberOfInteractionsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_numberOfInteractionsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  if (!v6)
  {
    v21 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", sel__numberOfInteractionsForConceptWithIdentifier_ontologyTransaction_error_, v21, CFSTR("HDDrugInteractionEngine.m"), 382, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v6, v7, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v23 = v7;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v9, "allObjects");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v12)
    {
      v13 = v12;
      v14 = 0;
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "relationships");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "hk_filter:", &__block_literal_global_6);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v14 += objc_msgSend(v18, "count");
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v14);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v23;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

+ (id)numberOfInteractionsForMedication:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  objc_msgSend(v9, "firstConceptIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstConceptIdentifier != nil"));

  }
  objc_msgSend(v9, "firstConceptIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDrugInteractionEngine numberOfInteractionsForConceptWithIdentifier:profile:error:](HDDrugInteractionEngine, "numberOfInteractionsForConceptWithIdentifier:profile:error:", v12, v10, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (BOOL)interactionResultForFirstInteractionClass:(id)a3 secondInteractionClass:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  char v19;
  NSObject *v20;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  id v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstInteractionClass != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondInteractionClass != nil"));

LABEL_3:
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  v37 = 0;
  objc_msgSend(v15, "ontologyDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __127__HDDrugInteractionEngine_interactionResultForFirstInteractionClass_secondInteractionClass_profile_interactionResultOut_error___block_invoke;
  v28[3] = &unk_1E6E00830;
  v17 = v13;
  v29 = v17;
  v18 = v14;
  v30 = v18;
  v31 = &v32;
  v19 = objc_msgSend(v16, "performTransactionWithError:transactionHandler:", a7, v28);

  if ((v19 & 1) != 0)
  {
    if (a6)
      *a6 = objc_retainAutorelease((id)v33[5]);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v17, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v24 = (id)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v39 = a1;
      v40 = 2114;
      v41 = v22;
      v42 = 2114;
      v43 = v23;
      v44 = 2112;
      v45 = v24;
      v46 = 2112;
      v47 = v25;
      _os_log_error_impl(&dword_1B815E000, v20, OS_LOG_TYPE_ERROR, "[%{public}@] Could not get interaction result for 1st interaction class identifier: %{public}@, 2nd interaction class identifier: %{public}@, 1st class: %@, 2nd class: %@", buf, 0x34u);

    }
  }

  _Block_object_dispose(&v32, 8);
  return v19;
}

uint64_t __127__HDDrugInteractionEngine_interactionResultForFirstInteractionClass_secondInteractionClass_profile_interactionResultOut_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id obj;

  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  v8 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v5, v6, a2, &obj, a3);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (uint64_t)_interactionResultForFirstInteractionClass:(void *)a3 secondInteractionClass:(void *)a4 ontologyTransaction:(_QWORD *)a5 interactionResultOut:(_QWORD *)a6 error:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  _BOOL4 v22;
  id v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t i;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  void *v48;
  void *v49;
  NSObject *v50;
  NSObject *v51;
  _BOOL4 v52;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t v63;
  uint64_t v64;
  NSObject *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  NSObject *v71;
  id obj;
  NSObject *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  id v82;
  id v83;
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  void *v87;
  __int16 v88;
  void *v89;
  _BYTE v90[128];
  _BYTE v91[128];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a3;
  v12 = a4;
  v13 = objc_opt_self();
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v13, CFSTR("HDDrugInteractionEngine.m"), 414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstInteractionClass != nil"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v13, CFSTR("HDDrugInteractionEngine.m"), 415, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondInteractionClass != nil"));

LABEL_3:
  objc_msgSend(v10, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "isEqual:", v15);

  if (v16)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);

    if (v18)
    {
      HKLogMedication();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v10, "identifier");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v85 = v13;
        v86 = 2114;
        v87 = v20;
        _os_log_impl(&dword_1B815E000, v19, OS_LOG_TYPE_INFO, "[%{public}@] Detected interaction class check against itself, skipping: %{public}@", buf, 0x16u);

      }
    }
    if (a5)
      *a5 = 0;
    v21 = 1;
  }
  else
  {
    v83 = 0;
    v22 = +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v10, v12, &v83, a6);
    v23 = v83;
    v24 = v23;
    if (v22 && v23)
    {
      v82 = 0;
      v25 = +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:]((uint64_t)HDDrugInteractionEngine, v11, v12, &v82, a6);
      v26 = v82;
      v71 = v26;
      if (v25 && (v27 = v26) != 0)
      {
        objc_msgSend(v24, "relationships");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "hk_filter:", &__block_literal_global_248);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject relationships](v27, "relationships");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "hk_filter:", &__block_literal_global_249);
        v70 = (void *)objc_claimAutoreleasedReturnValue();

        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v31 = v29;
        v63 = -[NSObject countByEnumeratingWithState:objects:count:](v31, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
        if (v63)
        {
          v32 = *(_QWORD *)v79;
          v67 = v11;
          v68 = v10;
          v69 = v12;
          v61 = a6;
          v62 = a5;
          v65 = v31;
          v66 = v24;
          v59 = v13;
          v60 = *(_QWORD *)v79;
          do
          {
            v33 = 0;
            do
            {
              if (*(_QWORD *)v79 != v32)
              {
                v34 = v33;
                objc_enumerationMutation(v31);
                v33 = v34;
              }
              v64 = v33;
              v35 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * v33);
              v74 = 0u;
              v75 = 0u;
              v76 = 0u;
              v77 = 0u;
              obj = v70;
              v36 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
              if (v36)
              {
                v37 = v36;
                v38 = *(_QWORD *)v75;
                while (2)
                {
                  for (i = 0; i != v37; ++i)
                  {
                    if (*(_QWORD *)v75 != v38)
                      objc_enumerationMutation(obj);
                    v40 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * i);
                    objc_msgSend(v35, "destination");
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v41, "identifier");
                    v42 = (void *)objc_claimAutoreleasedReturnValue();
                    v43 = objc_msgSend(v42, "rawIdentifier");
                    objc_msgSend(v40, "destination");
                    v44 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v44, "identifier");
                    v45 = (void *)objc_claimAutoreleasedReturnValue();
                    v46 = objc_msgSend(v45, "rawIdentifier");

                    if (v43 == v46)
                    {
                      objc_msgSend(v35, "destination");
                      v48 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "identifier");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v73 = 0;
                      v11 = v67;
                      v10 = v68;
                      v12 = v69;
                      v21 = +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v49, v68, v67, v69, &v73, v61);
                      v47 = v73;

                      _HKInitializeLogging();
                      HKLogMedication();
                      v50 = objc_claimAutoreleasedReturnValue();
                      v51 = v50;
                      if ((v21 & 1) != 0)
                      {
                        v52 = os_log_type_enabled(v50, OS_LOG_TYPE_INFO);

                        v31 = v65;
                        if (v52)
                        {
                          HKLogMedication();
                          v53 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
                          {
                            -[NSObject identifier](v47, "identifier");
                            v54 = (void *)objc_claimAutoreleasedReturnValue();
                            HKSensitiveLogItem();
                            v55 = (void *)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138543874;
                            v85 = v59;
                            v86 = 2114;
                            v87 = v54;
                            v88 = 2112;
                            v89 = v55;
                            _os_log_impl(&dword_1B815E000, v53, OS_LOG_TYPE_INFO, "[%{public}@] Found drug interaction with identifier: %{public}@, interaction: %@", buf, 0x20u);

                          }
                        }
                        v12 = v69;
                        if (v62)
                          *v62 = objc_retainAutorelease(v47);
                      }
                      else
                      {
                        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR))
                          +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.1();

                        v31 = v65;
                      }

                      v24 = v66;
                      goto LABEL_50;
                    }
                  }
                  v37 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v74, v90, 16);
                  if (v37)
                    continue;
                  break;
                }
              }

              v33 = v64 + 1;
              v11 = v67;
              v10 = v68;
              v12 = v69;
              a5 = v62;
              v31 = v65;
              v24 = v66;
              v32 = v60;
            }
            while (v64 + 1 != v63);
            v63 = -[NSObject countByEnumeratingWithState:objects:count:](v65, "countByEnumeratingWithState:objects:count:", &v78, v91, 16);
          }
          while (v63);
        }

        v47 = 0;
        if (a5)
          *a5 = 0;
        v21 = 1;
LABEL_50:

      }
      else
      {
        _HKInitializeLogging();
        HKLogMedication();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.2();
        v47 = 0;
        v21 = 0;
      }

    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v71 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
        +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.3();
      v47 = 0;
      v21 = 0;
    }

  }
  return v21;
}

+ (id)interactionResultsForInteractionClasses:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  char v13;
  id v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionClasses != nil"));

  }
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__5;
  v24 = __Block_byref_object_dispose__5;
  v25 = 0;
  objc_msgSend(v10, "ontologyDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __81__HDDrugInteractionEngine_interactionResultsForInteractionClasses_profile_error___block_invoke;
  v17[3] = &unk_1E6E007E0;
  v19 = &v20;
  v12 = v9;
  v18 = v12;
  v13 = objc_msgSend(v11, "performTransactionWithError:transactionHandler:", a5, v17);

  if ((v13 & 1) != 0)
    v14 = (id)v21[5];
  else
    v14 = 0;

  _Block_object_dispose(&v20, 8);
  return v14;
}

BOOL __81__HDDrugInteractionEngine_interactionResultsForInteractionClasses_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDDrugInteractionEngine _interactionResultsForInteractionClasses:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_interactionResultsForInteractionClasses:(void *)a3 ontologyTransaction:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v20;
  void *v21;
  void *v22;
  unint64_t v23;
  id v24;
  id v25;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  if (!v6)
  {
    v20 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultsForInteractionClasses_ontologyTransaction_error_, v20, CFSTR("HDDrugInteractionEngine.m"), 487, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionClasses != nil"));

  }
  v22 = v6;
  objc_msgSend(v6, "allObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (objc_msgSend(v9, "count"))
  {
    v10 = 0;
    v11 = 1;
    while (1)
    {
      v23 = v10 + 1;
      if (objc_msgSend(v9, "count") > (unint64_t)(v10 + 1))
        break;
LABEL_11:
      ++v11;
      ++v10;
      if (objc_msgSend(v9, "count") <= v23)
        goto LABEL_12;
    }
    v12 = v11;
    while (1)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndexedSubscript:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      v15 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v13, v14, v7, &v25, a4);
      v16 = v25;

      if (!v15)
        break;
      if (v16)
        objc_msgSend(v24, "addObject:", v16);

      if (objc_msgSend(v9, "count") <= (unint64_t)++v12)
        goto LABEL_11;
    }

    v18 = 0;
    v17 = v24;
  }
  else
  {
LABEL_12:
    v17 = v24;
    v18 = v24;
  }

  return v18;
}

+ (BOOL)interactionResultForFirstMedication:(id)a3 secondMedication:(id)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  char v21;
  char v22;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  if (v13)
  {
    if (v14)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 191, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstMedication != nil"));

    if (v14)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 192, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondMedication != nil"));

LABEL_3:
  objc_msgSend(v13, "firstOntologyCoding");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 193, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstMedication.firstOntologyCoding != nil"));

  }
  objc_msgSend(v14, "firstOntologyCoding");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 194, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondMedication.firstOntologyCoding != nil"));

  }
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__5;
  v36 = __Block_byref_object_dispose__5;
  v37 = 0;
  objc_msgSend(v15, "ontologyDatabase");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __115__HDDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_profile_interactionResultOut_error___block_invoke;
  v28[3] = &unk_1E6E00830;
  v19 = v13;
  v29 = v19;
  v20 = v14;
  v30 = v20;
  v31 = &v32;
  v21 = objc_msgSend(v18, "performTransactionWithError:transactionHandler:", a7, v28);

  if (a6)
    v22 = v21;
  else
    v22 = 0;
  if ((v22 & 1) != 0)
    *a6 = objc_retainAutorelease((id)v33[5]);

  _Block_object_dispose(&v32, 8);
  return v21;
}

BOOL __115__HDDrugInteractionEngine_interactionResultForFirstMedication_secondMedication_profile_interactionResultOut_error___block_invoke(_QWORD *a1, void *a2, uint64_t *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _BOOL8 v11;
  id obj;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  v8 = (void *)a1[4];
  v9 = (void *)a1[5];
  v10 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v10 + 40);
  v11 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, v6, v7, &obj, a3);

  objc_storeStrong((id *)(v10 + 40), obj);
  return v11;
}

+ (BOOL)_interactionResultForFirstMedication:(void *)a3 secondMedication:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(_QWORD *)a6 interactionResultOut:(uint64_t *)a7 error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = objc_opt_self();
  if (v12)
  {
    if (v13)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultForFirstMedication_secondMedication_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v16, CFSTR("HDDrugInteractionEngine.m"), 590, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstMedication != nil"));

    if (v13)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultForFirstMedication_secondMedication_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v16, CFSTR("HDDrugInteractionEngine.m"), 591, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondMedication != nil"));

LABEL_3:
  +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v14, v15, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    if (objc_msgSend(v17, "count"))
    {
      +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v13, v14, v15, a7);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (!v19)
      {
        v23 = 0;
        goto LABEL_17;
      }
      if (!objc_msgSend(v19, "count"))
      {
        v23 = 1;
        goto LABEL_17;
      }
      +[HDDrugInteractionEngine _interactionResultsForFirstInteractionClassSet:secondInteractionClassSet:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v18, v20, v14, a7);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      v23 = v21 != 0;
      if (!v21)
      {
LABEL_12:

LABEL_17:
        goto LABEL_18;
      }
      if (objc_msgSend(v21, "count"))
      {
        v30 = objc_alloc(MEMORY[0x1E0D2C460]);
        objc_msgSend(v12, "firstConceptIdentifier");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "firstConceptIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = (void *)objc_msgSend(v30, "initWithFirstConceptIdentifier:secondConceptIdentifier:interactionType:interactions:", v29, v28, 1, v22);

        if (!a6)
        {
LABEL_11:

          goto LABEL_12;
        }
      }
      else
      {
        v24 = 0;
        if (!a6)
          goto LABEL_11;
      }
      *a6 = objc_retainAutorelease(v24);
      goto LABEL_11;
    }
    v23 = 1;
  }
  else
  {
    v23 = 0;
  }
LABEL_18:

  return v23;
}

+ (BOOL)interactionResultForMedication:(id)a3 lifestyleFactor:(unint64_t)a4 profile:(id)a5 interactionResultOut:(id *)a6 error:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  char v18;
  char v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v13 = a3;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  objc_msgSend(v13, "firstOntologyCoding");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 222, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication.firstOntologyCoding != nil"));

  }
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__5;
  v31 = __Block_byref_object_dispose__5;
  v32 = 0;
  objc_msgSend(v14, "ontologyDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __109__HDDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_profile_interactionResultOut_error___block_invoke;
  v23[3] = &unk_1E6E00858;
  v17 = v13;
  v25 = &v27;
  v26 = a4;
  v24 = v17;
  v18 = objc_msgSend(v16, "performTransactionWithError:transactionHandler:", a7, v23);

  if (a6)
    v19 = v18;
  else
    v19 = 0;
  if ((v19 & 1) != 0)
    *a6 = objc_retainAutorelease((id)v28[5]);

  _Block_object_dispose(&v27, 8);
  return v18;
}

BOOL __109__HDDrugInteractionEngine_interactionResultForMedication_lifestyleFactor_profile_interactionResultOut_error___block_invoke(_QWORD *a1, void *a2, uint64_t *a3)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;
  id obj;

  v5 = a1[6];
  v6 = (void *)a1[4];
  v7 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v7 + 40);
  v8 = +[HDDrugInteractionEngine _interactionResultForMedication:lifestyleFactor:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v6, v5, a2, 0, &obj, a3);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (BOOL)_interactionResultForMedication:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(_QWORD *)a6 interactionResultOut:(uint64_t *)a7 error:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v26;
  void *v27;

  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = objc_opt_self();
  if (!v12)
  {
    v26 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultForMedication_lifestyleFactor_ontologyTransaction_interactionClassCache_interactionResultOut_error_, v26, CFSTR("HDDrugInteractionEngine.m"), 650, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medication != nil"));

  }
  +[HDDrugInteractionEngine _interactionClassesForMedication:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v12, v13, v14, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    if (objc_msgSend(v16, "count"))
    {
      +[HDDrugInteractionEngine _interactionResultsForInteractionClasses:lifestyleFactor:ontologyTransaction:interactionClassCache:error:]((uint64_t)HDDrugInteractionEngine, v17, a3, v13, v14, a7);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v18;
      v20 = v18 != 0;
      if (v18)
      {
        if (objc_msgSend(v18, "count"))
        {
          HKConceptIdentifierForDrugInteractionLifestyleFactor();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_alloc(MEMORY[0x1E0D2C460]);
          objc_msgSend(v12, "firstConceptIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)objc_msgSend(v22, "initWithFirstConceptIdentifier:secondConceptIdentifier:interactionType:interactions:", v23, v21, 2, v19);

          if (a6)
            *a6 = objc_retainAutorelease(v24);

        }
        else if (a6)
        {
          *a6 = 0;
        }
      }

    }
    else
    {
      v20 = 1;
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)interactionResultsForMedications:(id)a3 lifestyleFactors:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  char v18;
  id v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 247, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medications != nil"));

  }
  if ((+[HDDrugInteractionEngine _allAreOntologyBackedMedications:]((uint64_t)a1, v11) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDDrugInteractionEngine.m"), 248, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _allAreOntologyBackedMedications:medications]"));

  }
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__5;
  v32 = __Block_byref_object_dispose__5;
  v33 = 0;
  objc_msgSend(v13, "ontologyDatabase");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __91__HDDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_profile_error___block_invoke;
  v23[3] = &unk_1E6E00880;
  v15 = v13;
  v24 = v15;
  v27 = &v28;
  v16 = v11;
  v25 = v16;
  v17 = v12;
  v26 = v17;
  v18 = objc_msgSend(v14, "performTransactionWithError:transactionHandler:", a6, v23);

  if ((v18 & 1) != 0)
    v19 = (id)v29[5];
  else
    v19 = 0;

  _Block_object_dispose(&v28, 8);
  return v19;
}

+ (uint64_t)_allAreOntologyBackedMedications:(uint64_t)a1
{
  id v2;
  uint64_t v3;

  v2 = a2;
  objc_opt_self();
  v3 = objc_msgSend(v2, "hk_allObjectsPassTestWithError:test:", 0, &__block_literal_global_314);

  return v3;
}

BOOL __91__HDDrugInteractionEngine_interactionResultsForMedications_lifestyleFactors_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t *a3)
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  v5 = (objc_class *)MEMORY[0x1E0C99E08];
  v6 = a2;
  v7 = objc_alloc_init(v5);
  objc_msgSend(*(id *)(a1 + 32), "healthMedicationsProfileExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "medicationUserDefaults");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDrugInteractionEngine _interactionResultsForMedications:lifestyleFactors:ontologyTransaction:interactionClassCache:medicationsUserDefaults:error:]((uint64_t)HDDrugInteractionEngine, *(void **)(a1 + 40), *(void **)(a1 + 48), v6, v7, v9, a3);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v10;

  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
  return v13;
}

+ (id)_interactionResultsForMedications:(void *)a3 lifestyleFactors:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(void *)a6 medicationsUserDefaults:(uint64_t *)a7 error:
{
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  _BOOL4 v26;
  id v27;
  void *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t i;
  unsigned int v37;
  _BOOL4 v38;
  id v39;
  void *v40;
  NSObject *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  void *v49;
  unint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  void *v54;
  id v55;
  void *v56;
  uint64_t v57;
  id obj;
  void *v59;
  id v61;
  id v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  id v67;
  id v68;
  uint8_t v69[128];
  uint8_t buf[4];
  uint64_t v71;
  __int16 v72;
  uint64_t v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  void *v77;
  uint64_t v78;

  v78 = *MEMORY[0x1E0C80C00];
  v11 = a2;
  v55 = a3;
  v12 = a4;
  v61 = a5;
  v13 = a6;
  v57 = objc_opt_self();
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultsForMedications_lifestyleFactors_ontologyTransaction_interactionClassCache_medicationsUserDefaults_error_, v57, CFSTR("HDDrugInteractionEngine.m"), 699, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("medications != nil"));

  }
  v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(v11, "allObjects");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v56, "count"))
  {
    v15 = 0;
    v53 = 1;
    v59 = v14;
    v51 = v13;
    v52 = v11;
    while (1)
    {
      objc_msgSend(v56, "objectAtIndexedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v13, "BOOLForKey:", CFSTR("MedicationsInteractionsWithSelfAllowed")))
        goto LABEL_13;
      _HKInitializeLogging();
      HKLogMedication();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v71 = v57;
        _os_log_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEFAULT, "[%{public}@] Checking medications for interactions with self", buf, 0xCu);
      }

      v68 = 0;
      v18 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v16, v12, v61, &v68, a7);
      v19 = v68;
      v20 = v19;
      if (!v18)
        goto LABEL_38;
      if (v19)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = objc_msgSend(v14, "count") + 1;
          objc_msgSend(v16, "firstConceptIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v71 = v57;
          v72 = 2050;
          v73 = v22;
          v74 = 2114;
          v75 = v23;
          _os_log_impl(&dword_1B815E000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Inter-medication interaction with identifier: %{public}@", buf, 0x20u);

          v14 = v59;
        }

        v54 = v20;
        objc_msgSend(v14, "addObject:", v20);
      }
      else
      {
LABEL_13:
        v54 = 0;
      }
      v50 = v15 + 1;
      if (objc_msgSend(v56, "count") > v15 + 1)
        break;
LABEL_22:
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      obj = v55;
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
      v14 = v59;
      if (v33)
      {
        v34 = v33;
        v35 = *(_QWORD *)v64;
        while (2)
        {
          for (i = 0; i != v34; ++i)
          {
            if (*(_QWORD *)v64 != v35)
              objc_enumerationMutation(obj);
            v37 = objc_msgSend(*(id *)(*((_QWORD *)&v63 + 1) + 8 * i), "unsignedIntValue");
            v62 = 0;
            v38 = +[HDDrugInteractionEngine _interactionResultForMedication:lifestyleFactor:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v37, v12, v61, &v62, a7);
            v39 = v62;
            v40 = v39;
            if (!v38)
            {

              v47 = 0;
              v13 = v51;
              v11 = v52;
              goto LABEL_39;
            }
            if (v39)
            {
              _HKInitializeLogging();
              HKLogMedication();
              v41 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
              {
                v42 = objc_msgSend(v14, "count");
                v43 = v12;
                v44 = v42 + 1;
                objc_msgSend(v16, "firstConceptIdentifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                HKConceptIdentifierForDrugInteractionLifestyleFactor();
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                v71 = v57;
                v72 = 2050;
                v73 = v44;
                v12 = v43;
                v14 = v59;
                v74 = 2114;
                v75 = v45;
                v76 = 2114;
                v77 = v46;
                _os_log_impl(&dword_1B815E000, v41, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Between identifier: %{public}@ and identifier: %{public}@", buf, 0x2Au);

              }
              objc_msgSend(v14, "addObject:", v40);
            }

          }
          v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v69, 16);
          if (v34)
            continue;
          break;
        }
      }

      v11 = v52;
      ++v53;
      v15 = v50;
      v13 = v51;
      if (objc_msgSend(v56, "count") <= v50)
        goto LABEL_35;
    }
    v24 = v53;
    while (1)
    {
      objc_msgSend(v56, "objectAtIndexedSubscript:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      v26 = +[HDDrugInteractionEngine _interactionResultForFirstMedication:secondMedication:ontologyTransaction:interactionClassCache:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v25, v12, v61, &v67, a7);
      v27 = v67;
      v28 = v27;
      if (!v26)
        break;
      if (v27)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = objc_msgSend(v59, "count") + 1;
          objc_msgSend(v16, "firstConceptIdentifier");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "firstConceptIdentifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138544130;
          v71 = v57;
          v72 = 2050;
          v73 = v30;
          v74 = 2114;
          v75 = v31;
          v76 = 2114;
          v77 = v32;
          _os_log_impl(&dword_1B815E000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Found medication #%{public}lu interaction: Between identifier: %{public}@ and identifier: %{public}@", buf, 0x2Au);

        }
        objc_msgSend(v59, "addObject:", v28);
      }

      if (objc_msgSend(v56, "count") <= (unint64_t)++v24)
        goto LABEL_22;
    }

    v13 = v51;
    v11 = v52;
    v14 = v59;
    v20 = v54;
LABEL_38:

    v47 = 0;
  }
  else
  {
LABEL_35:
    v47 = v14;
  }
LABEL_39:

  return v47;
}

+ (id)_interactionClassesForConceptWithIdentifier:(void *)a3 ontologyTransaction:(void *)a4 interactionClassCache:(uint64_t *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v15;
  void *v16;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  if (!v8)
  {
    v15 = v11;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionClassesForConceptWithIdentifier_ontologyTransaction_interactionClassCache_error_, v15, CFSTR("HDDrugInteractionEngine.m"), 278, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    +[HDDrugInteractionEngine _interactionClassesForConceptWithIdentifier:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v12, v8);
  }
  v13 = v12;

  return v13;
}

+ (id)_interactionClassConceptsForConceptWithIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  char v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  void *v16;
  id v17;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionClassConceptsForConceptWithIdentifier_ontologyTransaction_error_, v8, CFSTR("HDDrugInteractionEngine.m"), 1006, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v17 = 0;
  v9 = +[HDDrugInteractionEngine _conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:]((uint64_t)HDDrugInteractionEngine, v6, v7, &v17, a4);
  v10 = v17;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:].cold.2();
    goto LABEL_9;
  }
  if (!v10)
  {
    if (!*a4)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99E60]);
      goto LABEL_6;
    }
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:].cold.1();
LABEL_9:

    v13 = 0;
    goto LABEL_10;
  }
  +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:]((uint64_t)HDDrugInteractionEngine, v10, v7, a4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v13 = v12;
LABEL_10:

  return v13;
}

HDDrugInteractionClass *__97__HDDrugInteractionEngine__interactionClassesForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  return +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, a2, *(void **)(a1 + 32));
}

+ (HDDrugInteractionClass)_drugInteractionClassForConcept:(void *)a3 ancestorIdentifier:
{
  id v4;
  id v5;
  uint64_t v6;
  HDDrugInteractionClass *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HDDrugInteractionClass *v12;
  uint64_t v14;
  void *v15;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  if (!v5)
  {
    v14 = v6;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__drugInteractionClassForConcept_ancestorIdentifier_, v14, CFSTR("HDDrugInteractionEngine.m"), 884, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ontologyConcept != nil"));

  }
  v7 = [HDDrugInteractionClass alloc];
  objc_msgSend(v5, "localizedPreferredName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "relationships");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "validInRegions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = -[HDDrugInteractionClass initWithName:relationships:ancestorIdentifier:ontologyIdentifier:validRegionCodes:](v7, "initWithName:relationships:ancestorIdentifier:ontologyIdentifier:validRegionCodes:", v8, v9, v4, v10, v11);
  return v12;
}

+ (BOOL)_interactionClassForLifestyleFactorConceptIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 interactionClassOut:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;

  v8 = a2;
  v9 = a3;
  objc_opt_self();
  +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v8, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (a4)
      *a4 = objc_retainAutorelease(v11);

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:].cold.1();

  }
  return v10 != 0;
}

+ (id)_fetchKnownConceptWithIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 errorOut:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v15;
  void *v16;
  id v17;

  v6 = a2;
  v7 = a3;
  v8 = objc_opt_self();
  if (!v6)
  {
    v15 = v8;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", sel__fetchKnownConceptWithIdentifier_ontologyTransaction_errorOut_, v15, CFSTR("HDDrugInteractionEngine.m"), 812, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  objc_msgSend(v7, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "ontologyConceptManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v10, "conceptForIdentifier:options:transaction:error:", v6, 1, v7, &v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v17;
  if (v11)
  {
    v13 = v11;
  }
  else
  {
    if (v12)
    {
      v12 = v12;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 118, CFSTR("Did not find expected concept in ontology with identifier %@"), v6);
      v12 = (id)objc_claimAutoreleasedReturnValue();
      if (!v12)
        goto LABEL_12;
    }
    if (a4)
      *a4 = objc_retainAutorelease(v12);
    else
      _HKLogDroppedError();

  }
LABEL_12:

  return v11;
}

BOOL __99__HDDrugInteractionEngine__numberOfInteractionsForConceptWithIdentifier_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 813;
}

+ (BOOL)_drugInteractionClassWithRelationshipsFromClass:(void *)a3 ontologyTransaction:(_QWORD *)a4 drugInteractionClassOut:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v18;

  v8 = a2;
  v9 = a3;
  v10 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__drugInteractionClassWithRelationshipsFromClass_ontologyTransaction_drugInteractionClassOut_error_, v10, CFSTR("HDDrugInteractionEngine.m"), 859, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("drugInteractionClass != nil"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v8);
    v11 = 1;
  }
  else
  {
    objc_msgSend(v8, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v12, v9, a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v13 != 0;
    if (v13)
    {
      objc_msgSend(v8, "ancestorIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDDrugInteractionEngine _drugInteractionClassForConcept:ancestorIdentifier:]((uint64_t)HDDrugInteractionEngine, v13, v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (a4)
        *a4 = objc_retainAutorelease(v15);

    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[HDDrugInteractionEngine _drugInteractionClassWithRelationshipsFromClass:ontologyTransaction:drugInteractionClassOut:error:].cold.1(v10, v8);

    }
  }

  return v11;
}

BOOL __140__HDDrugInteractionEngine__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 813;
}

BOOL __140__HDDrugInteractionEngine__interactionResultForFirstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "type") == 813;
}

+ (uint64_t)_drugInteractionResultForConceptWithIdentifier:(void *)a3 firstInteractionClass:(void *)a4 secondInteractionClass:(void *)a5 ontologyTransaction:(NSObject *)a6 interactionResultOut:(_QWORD *)a7 error:
{
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v29;
  NSObject **v30;
  id v31;
  id v32;
  NSObject *v33;

  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = objc_opt_self();
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__drugInteractionResultForConceptWithIdentifier_firstInteractionClass_secondInteractionClass_ontologyTransaction_interactionResultOut_error_, v16, CFSTR("HDDrugInteractionEngine.m"), 1043, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v12, v15, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v33 = 0;
    v18 = +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:]((uint64_t)HDDrugInteractionEngine, v12, v15, &v33, (uint64_t)a7);
    v19 = v33;
    if ((v18 & 1) != 0)
    {
      v30 = a6;
      v31 = v13;
      v20 = (void *)MEMORY[0x1E0D29528];
      objc_msgSend(v17, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      v22 = objc_msgSend(v20, "localizedEducationContentForConceptWithIdentifier:ontologyTransaction:localizedEducationContentOut:error:", v21, v15, &v32, a7);
      v23 = v32;

      if ((v22 & 1) != 0)
      {
        v24 = objc_alloc(MEMORY[0x1E0D2C420]);
        objc_msgSend(v17, "validInRegions");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v24;
        v13 = v31;
        v27 = objc_msgSend(v26, "initWithFirstInteractionClass:secondInteractionClass:severity:educationContent:ontologyIdentifier:validRegionCodes:", v31, v14, v19, v23, v12, v25);

        if (v30)
        {
          v27 = objc_retainAutorelease(v27);
          *v30 = v27;
        }
      }
      else
      {
        _HKInitializeLogging();
        HKLogMedication();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.2();
        v13 = v31;
      }

    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.3();
      v22 = 0;
    }

  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:].cold.1();
    v22 = 0;
  }

  return v22;
}

+ (id)_interactionResultsForInteractionClasses:(uint64_t)a3 lifestyleFactor:(void *)a4 ontologyTransaction:(void *)a5 interactionClassCache:(_QWORD *)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  _BOOL4 v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  id v25;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  id v31;

  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = v10;
  v14 = v12;
  v15 = objc_opt_self();
  if (!v10)
  {
    v27 = v15;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultsForInteractionClasses_lifestyleFactor_ontologyTransaction_interactionClassCache_error_, v27, CFSTR("HDDrugInteractionEngine.m"), 518, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interactionClasses != nil"));

  }
  objc_msgSend(v10, "allObjects");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v31 = 0;
  v18 = v14;
  v19 = +[HDDrugInteractionEngine _interactionClassForLifestyleFactor:ontologyTransaction:interactionClassCache:interactionClassOut:error:]((uint64_t)HDDrugInteractionEngine, a3, v11, v14, &v31, a6);
  v20 = v31;
  v21 = 0;
  if (v19)
  {
    v29 = v18;
    if (objc_msgSend(v16, "count"))
    {
      v22 = 0;
      while (1)
      {
        objc_msgSend(v16, "objectAtIndexedSubscript:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0;
        v24 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v23, v20, v11, &v30, a6);
        v25 = v30;

        if (!v24)
          break;
        if (v25)
          objc_msgSend(v17, "addObject:", v25);

        if (objc_msgSend(v16, "count") <= (unint64_t)++v22)
          goto LABEL_10;
      }

      v21 = 0;
    }
    else
    {
LABEL_10:
      v21 = v17;
    }
    v18 = v29;
    v13 = v10;
  }

  return v21;
}

+ (id)_interactionResultsForFirstInteractionClassSet:(void *)a3 secondInteractionClassSet:(void *)a4 ontologyTransaction:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultsForFirstInteractionClassSet_secondInteractionClassSet_ontologyTransaction_error_, v11, CFSTR("HDDrugInteractionEngine.m"), 556, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("firstInteractionClassSet"));

    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionResultsForFirstInteractionClassSet_secondInteractionClassSet_ontologyTransaction_error_, v11, CFSTR("HDDrugInteractionEngine.m"), 557, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("secondInteractionClassSet"));

LABEL_3:
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v13 = v8;
  v31 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
  if (v31)
  {
    v14 = *(_QWORD *)v41;
    v33 = v13;
    v34 = v9;
    v30 = *(_QWORD *)v41;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v41 != v14)
          objc_enumerationMutation(v13);
        v32 = v15;
        v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v15);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v17 = v9;
        v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v18)
        {
          v19 = v18;
          v20 = *(_QWORD *)v37;
          while (2)
          {
            for (i = 0; i != v19; ++i)
            {
              if (*(_QWORD *)v37 != v20)
                objc_enumerationMutation(v17);
              v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              v35 = 0;
              v23 = +[HDDrugInteractionEngine _interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:]((uint64_t)HDDrugInteractionEngine, v16, v22, v10, &v35, a5);
              v24 = v35;
              v25 = v24;
              if (!v23)
              {

                v13 = v33;
                v26 = 0;
                v9 = v34;
                goto LABEL_22;
              }
              if (v24)
                objc_msgSend(v12, "addObject:", v24);

            }
            v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
            if (v19)
              continue;
            break;
          }
        }

        v15 = v32 + 1;
        v13 = v33;
        v9 = v34;
        v14 = v30;
      }
      while (v32 + 1 != v31);
      v31 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    }
    while (v31);
  }

  v26 = v12;
LABEL_22:

  return v26;
}

+ (uint64_t)_conceptForIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 conceptOut:(_QWORD *)a5 errorOut:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v18;
  id v19;

  v8 = a2;
  v9 = a3;
  v10 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", sel__conceptForIdentifier_ontologyTransaction_conceptOut_errorOut_, v10, CFSTR("HDDrugInteractionEngine.m"), 785, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  objc_msgSend(v9, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "ontologyConceptManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(v12, "conceptForIdentifier:options:transaction:error:", v8, 1, v9, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v19;
  if (v13)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v13);
    goto LABEL_11;
  }
  if (!v14)
  {
LABEL_11:
    v16 = 1;
    goto LABEL_12;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    +[HDDrugInteractionEngine _conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:].cold.1();

  if (a5)
  {
    v16 = 0;
    *a5 = objc_retainAutorelease(v14);
  }
  else
  {
    _HKLogDroppedError();
    v16 = 0;
  }
LABEL_12:

  return v16;
}

+ (uint64_t)_severityConceptForConceptWithIdentifier:(void *)a3 ontologyTransaction:(_QWORD *)a4 severityConceptOut:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a2;
  v9 = a3;
  v10 = objc_opt_self();
  if (!v8)
  {
    v14 = v10;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error_, v14, CFSTR("HDDrugInteractionEngine.m"), 836, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithRelationshipType:withSubjectId:", 799, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __113__HDDrugInteractionEngine__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error___block_invoke;
  v16[3] = &unk_1E6E00950;
  v16[4] = &v17;
  v12 = objc_msgSend(MEMORY[0x1E0D29520], "enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:", v11, 1, 1, v9, a5, v16);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);

  _Block_object_dispose(&v17, 8);
  return v12;
}

uint64_t __113__HDDrugInteractionEngine__severityConceptForConceptWithIdentifier_ontologyTransaction_severityConceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

+ (uint64_t)_severityForConceptWithIdentifier:(void *)a3 ontologyTransaction:(NSObject *)a4 severityOut:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v28;
  id v29;

  v8 = a2;
  v9 = a3;
  v10 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", sel__severityForConceptWithIdentifier_ontologyTransaction_severityOut_error_, v10, CFSTR("HDDrugInteractionEngine.m"), 898, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier != nil"));

  }
  v29 = 0;
  v11 = +[HDDrugInteractionEngine _severityConceptForConceptWithIdentifier:ontologyTransaction:severityConceptOut:error:]((uint64_t)HDDrugInteractionEngine, v8, v9, &v29, a5);
  v12 = v29;
  v13 = v12;
  if ((v11 & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:].cold.3();
    goto LABEL_11;
  }
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 1003, CFSTR("Could not find severity concept with identifier: %@"), v8);
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:].cold.1();
    goto LABEL_11;
  }
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "rawIdentifier");

  if (v15 != 650)
  {
    objc_msgSend(v13, "identifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "rawIdentifier");

    if (v20 == 651)
    {
      v16 = 2;
      goto LABEL_18;
    }
    objc_msgSend(v13, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "rawIdentifier");

    if (v22 == 652)
    {
      v16 = 3;
      goto LABEL_18;
    }
    objc_msgSend(v13, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "rawIdentifier");

    if (v24 == 653)
    {
      v16 = 4;
      goto LABEL_18;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 1003, CFSTR("Could not determine correct severity type for severity concept with identifier: %@"), v8);
    _HKInitializeLogging();
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:].cold.2();
LABEL_11:
    v18 = 0;
    goto LABEL_21;
  }
  v16 = 1;
LABEL_18:
  v25 = objc_alloc(MEMORY[0x1E0D2C428]);
  objc_msgSend(v13, "validInRegions");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v25, "initWithSeverityLevel:validRegionCodes:", v16, v26);

  if (a4)
  {
    v17 = objc_retainAutorelease(v17);
    *a4 = v17;
  }
  v18 = 1;
LABEL_21:

  return v18;
}

+ (NSObject)_interactionClassConceptsForConcept:(void *)a3 ontologyTransaction:(_QWORD *)a4 error:
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unint64_t v13;
  NSObject *v14;
  unint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  uint64_t v32;
  NSObject *v33;
  BOOL v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  id v49;
  NSObject *v50;
  NSObject *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v49 = a3;
  v6 = objc_opt_self();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", sel__interactionClassConceptsForConcept_ontologyTransaction_error_, v6, CFSTR("HDDrugInteractionEngine.m"), 944, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("startingConcept != nil"));

  }
  v7 = v5;
  objc_msgSend(v7, "relationships");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8
    && (v9 = (void *)v8,
        objc_msgSend(v7, "relationships"),
        v10 = (void *)objc_claimAutoreleasedReturnValue(),
        v11 = objc_msgSend(v10, "count"),
        v10,
        v9,
        v11))
  {
    v51 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6E11538);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0x1E0C99000uLL;
    v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    -[NSObject addObject:](v14, "addObject:", v7);
    v50 = v14;
    if (-[NSObject count](v14, "count"))
    {
      v15 = 0;
      v46 = v7;
      do
      {
        v43 = v15;
        v16 = v50;
        v17 = -[NSObject copy](v50, "copy");
        v50 = objc_alloc_init(*(Class *)(v13 + 3560));

        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v18 = v17;
        v44 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
        if (v44)
        {
          v19 = *(_QWORD *)v57;
          v47 = v18;
          v42 = *(_QWORD *)v57;
          do
          {
            v20 = 0;
            do
            {
              if (*(_QWORD *)v57 != v19)
                objc_enumerationMutation(v18);
              v45 = v20;
              v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v20);
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v55 = 0u;
              objc_msgSend(v21, "relationships");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
              if (v23)
              {
                v24 = v23;
                v25 = *(_QWORD *)v53;
                while (2)
                {
                  for (i = 0; i != v24; ++i)
                  {
                    if (*(_QWORD *)v53 != v25)
                      objc_enumerationMutation(v22);
                    v27 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v27, "type"));
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v12, "containsObject:", v28);

                    if (v29)
                    {
                      objc_msgSend(v27, "destination");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      if ((objc_msgSend(v30, "relationshipsAreLoaded") & 1) == 0)
                      {
                        objc_msgSend(v30, "identifier");
                        v31 = (void *)objc_claimAutoreleasedReturnValue();
                        +[HDDrugInteractionEngine _fetchKnownConceptWithIdentifier:ontologyTransaction:errorOut:]((uint64_t)HDDrugInteractionEngine, v31, v49, a4);
                        v32 = objc_claimAutoreleasedReturnValue();

                        v30 = (void *)v32;
                        if (!v32)
                        {
                          _HKInitializeLogging();
                          HKLogMedication();
                          v39 = objc_claimAutoreleasedReturnValue();
                          if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
                            +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:].cold.2();

                          v35 = 0;
                          v7 = v46;
                          goto LABEL_40;
                        }
                      }
                      if (objc_msgSend(v27, "type") == 996)
                        v33 = v51;
                      else
                        v33 = v50;
                      -[NSObject addObject:](v33, "addObject:", v30);

                    }
                  }
                  v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
                  if (v24)
                    continue;
                  break;
                }
              }

              v20 = v45 + 1;
              v13 = 0x1E0C99000;
              v18 = v47;
              v19 = v42;
            }
            while (v45 + 1 != v44);
            v44 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
          }
          while (v44);
        }

        if (-[NSObject count](v50, "count"))
          v34 = v43 >= 6;
        else
          v34 = 1;
        v15 = v43 + 1;
        v7 = v46;
      }
      while (!v34);
    }
    v35 = v51;
LABEL_40:

  }
  else
  {
    v36 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v7, "identifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "hk_assignError:code:format:", a4, 1003, CFSTR("Could not find any relationships for concept: %@ with starting concept: %@"), v37, v38);

    _HKInitializeLogging();
    HKLogMedication();
    v51 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
      +[HDDrugInteractionEngine _interactionClassConceptsForConcept:ontologyTransaction:error:].cold.1(v6, v7);
    v35 = 0;
  }

  return v35;
}

BOOL __60__HDDrugInteractionEngine__allAreOntologyBackedMedications___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "firstOntologyCoding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

+ (void)interactionClassesForMedication:profile:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v6, v4, "[%{public}@] Could not get interaction classes for medication: %{public}@", v5);

  OUTLINED_FUNCTION_11();
}

+ (void)interactionClassForLifestyleFactor:profile:interactionClassOut:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v6, v4, "[%{public}@] Could not get interaction class for lifestyle factor: %{public}@", v5);

  OUTLINED_FUNCTION_11();
}

+ (void)numberOfInteractionsForConceptWithIdentifier:profile:error:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_5(v1, v2, v3, 5.8382e-34);
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v6, v4, "[%{public}@] Could not get number of interactions for concept with identifier: %{public}@", v5);

  OUTLINED_FUNCTION_11();
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.1()
{
  NSObject *v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  OUTLINED_FUNCTION_3_0();
  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "destination");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v0, v4, "[%{public}@] Could not load drug interaction result for interaction with identifier: %{public}@", v5);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.2()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v0, v3, "[%{public}@] Could not load drug relationships for 2nd drug interaction class with identifier: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_interactionResultForFirstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.3()
{
  NSObject *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  OUTLINED_FUNCTION_3_0();
  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(v1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v0, v3, "[%{public}@] Could not load relationships for 1st drug interaction class with identifier: %{public}@", v4);

  OUTLINED_FUNCTION_2_0();
}

+ (void)_interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Found no concept in ontology for concept identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_interactionClassConceptsForConceptWithIdentifier:ontologyTransaction:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not get interaction class for identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_interactionClassForLifestyleFactorConceptIdentifier:ontologyTransaction:interactionClassOut:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not get interaction class for lifestyle factor concept identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_drugInteractionClassWithRelationshipsFromClass:(uint64_t)a1 ontologyTransaction:(void *)a2 drugInteractionClassOut:error:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1B815E000, v4, v5, "[%{public}@] Could not get interaction class concept for identifier: %{public}@, interaction class: %@", v6, v7, v8, v9, v10);

  OUTLINED_FUNCTION_8_0();
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not load interaction concept for drug interaction with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not load localized education concept for drug interaction with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_drugInteractionResultForConceptWithIdentifier:firstInteractionClass:secondInteractionClass:ontologyTransaction:interactionResultOut:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not load severity concept for drug interaction with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_conceptForIdentifier:ontologyTransaction:conceptOut:errorOut:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not find concept in ontology database for concept with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not find severity concept with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not determine correct severity type for severity concept with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_severityForConceptWithIdentifier:ontologyTransaction:severityOut:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B815E000, v0, v1, "[%{public}@] Could not load concept with identifier: %{public}@");
  OUTLINED_FUNCTION_2();
}

+ (void)_interactionClassConceptsForConcept:(uint64_t)a1 ontologyTransaction:(void *)a2 error:.cold.1(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_4(&dword_1B815E000, v5, v6, "[%{public}@] Could not find any relationships for concept: %{public}@ with starting concept: %{public}@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_8_0();
}

+ (void)_interactionClassConceptsForConcept:ontologyTransaction:error:.cold.2()
{
  id v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  OUTLINED_FUNCTION_3_0();
  objc_msgSend(v0, "type");
  objc_msgSend(0, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4(&dword_1B815E000, v1, v2, "[%{public}@] Could not load destination of relationship type %lld for concept with identifier: %{public}@", v3, v4, v5, v6, 2u);

  OUTLINED_FUNCTION_8_0();
}

@end
