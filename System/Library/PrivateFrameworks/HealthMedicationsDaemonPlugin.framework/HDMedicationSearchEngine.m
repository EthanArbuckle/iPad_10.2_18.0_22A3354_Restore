@implementation HDMedicationSearchEngine

+ (id)medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDMedicationSearchEngine.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scanResult != nil"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  objc_msgSend(v12, "ontologyDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __84__HDMedicationSearchEngine_medicationClustersFromScanResult_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6E01018;
  v21 = &v23;
  v14 = v11;
  v20 = v14;
  v22 = a4;
  v15 = objc_msgSend(v13, "performTransactionWithError:transactionHandler:", a6, v19);

  if ((v15 & 1) != 0)
    v16 = (id)v24[5];
  else
    v16 = 0;

  _Block_object_dispose(&v23, 8);
  return v16;
}

BOOL __84__HDMedicationSearchEngine_medicationClustersFromScanResult_limit_profile_errorOut___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDMedicationSearchEngine _medicationClustersFromScanResult:limit:ontologyTransaction:errorOut:](HDMedicationSearchEngine, "_medicationClustersFromScanResult:limit:ontologyTransaction:errorOut:", a1[4], a1[6], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

+ (BOOL)medicationCluster:(id *)a3 machineReadableCode:(id)a4 codeAttributeType:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  char v19;
  char v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v13 = a4;
  v14 = a6;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", &unk_1E6E115E0);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "containsObject:", v16);

  if ((v17 & 1) != 0)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__9;
    v30 = __Block_byref_object_dispose__9;
    v31 = 0;
    objc_msgSend(v14, "ontologyDatabase");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __101__HDMedicationSearchEngine_medicationCluster_machineReadableCode_codeAttributeType_profile_errorOut___block_invoke;
    v22[3] = &unk_1E6E00858;
    v24 = &v26;
    v25 = a5;
    v23 = v13;
    v19 = objc_msgSend(v18, "performTransactionWithError:transactionHandler:", a7, v22);

    if (a3)
      v20 = v19;
    else
      v20 = 0;
    if ((v20 & 1) != 0)
      *a3 = objc_retainAutorelease((id)v27[5]);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:invalidArgument:class:selector:", a7, CFSTR("codeAttributeType"), a1, a2);
    v19 = 0;
  }

  return v19;
}

BOOL __101__HDMedicationSearchEngine_medicationCluster_machineReadableCode_codeAttributeType_profile_errorOut___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  id obj;

  v4 = a1[6];
  v5 = a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = +[HDMedicationSearchEngine _medicationClusterFromMachineReadableCode:codeAttributeType:searchResultOut:ontologyTransaction:errorOut:](HDMedicationSearchEngine, "_medicationClusterFromMachineReadableCode:codeAttributeType:searchResultOut:ontologyTransaction:errorOut:", v5, v4, &obj, a2, a3);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (id)medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v11;
  id v12;
  void *v13;
  id v14;
  char v15;
  id v16;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint64_t *v21;
  int64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v11 = a3;
  v12 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDMedicationSearchEngine.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("tokens != nil"));

  }
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__9;
  v27 = __Block_byref_object_dispose__9;
  v28 = 0;
  objc_msgSend(v12, "ontologyDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__HDMedicationSearchEngine_medicationClustersFromTextSearchTokens_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6E01018;
  v21 = &v23;
  v14 = v11;
  v20 = v14;
  v22 = a4;
  v15 = objc_msgSend(v13, "performTransactionWithError:transactionHandler:", a6, v19);

  if ((v15 & 1) != 0)
    v16 = (id)v24[5];
  else
    v16 = 0;

  _Block_object_dispose(&v23, 8);
  return v16;
}

BOOL __90__HDMedicationSearchEngine_medicationClustersFromTextSearchTokens_limit_profile_errorOut___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDMedicationSearchEngine _medicationClustersFromTextSearchTokens:limit:ontologyTransaction:errorOut:](HDMedicationSearchEngine, "_medicationClustersFromTextSearchTokens:limit:ontologyTransaction:errorOut:", a1[4], a1[6], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

+ (id)medicationClustersForCHRImportWithExistingMedications:(id)a3 sinceDate:(id)a4 limit:(int64_t)a5 profile:(id)a6 errorOut:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[4];
  id v37;
  uint64_t *v38;
  int64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  v46 = 0;
  v27 = a4;
  v29 = a6;
  objc_msgSend(a1, "_importEligibleMedicationConceptsSinceDate:limit:profile:errorOut:", v27, a5);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  if (v31)
  {
    if (a7)
    {
      v12 = 0;
      *a7 = objc_retainAutorelease(v31);
    }
    else
    {
      _HKLogDroppedError();
      v12 = 0;
    }
  }
  else
  {
    objc_msgSend(v30, "hk_map:", &__block_literal_global_9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy__9;
    v44 = __Block_byref_object_dispose__9;
    v45 = 0;
    objc_msgSend(v29, "ontologyDatabase");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke_2;
    v36[3] = &unk_1E6E01018;
    v38 = &v40;
    v26 = v13;
    v37 = v26;
    v39 = a5;
    v15 = objc_msgSend(v14, "performTransactionWithError:transactionHandler:", a7, v36);

    if ((v15 & 1) != 0)
    {
      v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v28);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      v17 = (id)v41[5];
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v33 != v19)
              objc_enumerationMutation(v17);
            v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v21, "specificProduct");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "identifier");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v16, "containsObject:", v23);

            if ((v24 & 1) == 0)
              objc_msgSend(v12, "addObject:", v21);
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v32, v47, 16);
        }
        while (v18);
      }

    }
    else
    {
      v12 = 0;
    }

    _Block_object_dispose(&v40, 8);
  }

  return v12;
}

uint64_t __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "numberRepresentation");
}

BOOL __115__HDMedicationSearchEngine_medicationClustersForCHRImportWithExistingMedications_sinceDate_limit_profile_errorOut___block_invoke_2(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDMedicationSearchEngine _medicationClustersFromScanResult:limit:ontologyTransaction:errorOut:](HDMedicationSearchEngine, "_medicationClustersFromScanResult:limit:ontologyTransaction:errorOut:", a1[4], a1[6], a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) != 0;
}

+ (BOOL)_medicationClusterFromMachineReadableCode:(id)a3 codeAttributeType:(int64_t)a4 searchResultOut:(id *)a5 ontologyTransaction:(id)a6 errorOut:(id *)a7
{
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;

  v12 = (void *)MEMORY[0x1E0D29890];
  v13 = (void *)MEMORY[0x1E0D29520];
  v14 = a6;
  objc_msgSend(v13, "predicateMatchingConceptsWithAttributeType:attributeValue:", a4, a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForConceptsNotExcludedFromSearch");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "compoundPredicateWithPredicate:otherPredicate:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a7) = objc_msgSend(a1, "_medicationSearchResultForFirstConcept:predicate:ontologyTransaction:errorOut:", a5, v17, v14, a7);
  return (char)a7;
}

+ (id)_medicationClustersFromScanResult:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  id v9;
  id v10;
  id v11;
  int64_t v12;
  id v13;
  int64_t v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  int64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v40 = 0u;
  v41 = 0u;
  if (a4 <= 1)
    v12 = 1;
  else
    v12 = a4;
  v42 = 0uLL;
  v43 = 0uLL;
  v13 = v9;
  v14 = v12;
  v15 = v13;
  v39 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
  if (v39)
  {
    v38 = *(_QWORD *)v41;
    v37 = v14;
LABEL_6:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v38)
        objc_enumerationMutation(v15);
      v17 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v16);
      if (objc_msgSend(v11, "count") == v14)
        break;
      v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", objc_msgSend(v17, "integerValue"));
      objc_msgSend(v10, "profile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ontologyConceptManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "conceptForIdentifier:options:transaction:error:", v18, 1, v10, a6);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        if (objc_msgSend(v21, "isExcludedFromSearch"))
        {
          _HKInitializeLogging();
          HKLogMedication();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543618;
            v45 = a1;
            v46 = 2112;
            v47 = v18;
            v23 = v22;
            v24 = "[%{public}@] Attempted to seach for med excluded from search with ID: %@";
LABEL_16:
            _os_log_error_impl(&dword_1B815E000, v23, OS_LOG_TYPE_ERROR, v24, buf, 0x16u);
          }
        }
        else
        {
          v25 = v11;
          v26 = v15;
          objc_msgSend(v21, "relationships");
          v27 = objc_claimAutoreleasedReturnValue();
          if (v27
            && (v28 = (void *)v27,
                objc_msgSend(v21, "relationships"),
                v29 = (void *)objc_claimAutoreleasedReturnValue(),
                v30 = objc_msgSend(v29, "count"),
                v29,
                v28,
                v30))
          {
            if (objc_msgSend(v21, "meds_isSpecificProduct"))
            {
              objc_msgSend(a1, "_medicationSearchResultForSpecificProduct:ontologyTransaction:errorOut:", v21, v10, a6);
              v31 = objc_claimAutoreleasedReturnValue();
              v15 = v26;
              v11 = v25;
              v14 = v37;
              if (!v31)
                goto LABEL_29;
            }
            else
            {
              v15 = v26;
              v11 = v25;
              v14 = v37;
              if (!objc_msgSend(v21, "meds_isClinicalProduct"))
                goto LABEL_29;
              objc_msgSend(a1, "_medicationSearchResultForClinicalProduct:ontologyTransaction:errorOut:", v21, v10, a6);
              v31 = objc_claimAutoreleasedReturnValue();
              if (!v31)
                goto LABEL_29;
            }
            v22 = v31;
            objc_msgSend(v11, "addObject:", v31);
          }
          else
          {
            v32 = (void *)MEMORY[0x1E0CB35C8];
            objc_msgSend(v21, "identifier");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "hk_assignError:code:format:", a6, 1003, CFSTR("Could not find any relationships for concept: %@ "), v33);

            _HKInitializeLogging();
            HKLogMedication();
            v22 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              objc_msgSend(v21, "identifier");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v45 = a1;
              v46 = 2114;
              v47 = v34;
              _os_log_error_impl(&dword_1B815E000, v22, OS_LOG_TYPE_ERROR, "[%{public}@] Could not find any relationships for concept: %{public}@", buf, 0x16u);

            }
            v15 = v26;
            v11 = v25;
            v14 = v37;
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        HKLogMedication();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v45 = a1;
          v46 = 2114;
          v47 = v18;
          v23 = v22;
          v24 = "[%{public}@] Could not find a concept: %{public}@";
          goto LABEL_16;
        }
      }

LABEL_29:
      if (v39 == ++v16)
      {
        v39 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
        if (v39)
          goto LABEL_6;
        break;
      }
    }
  }

  return v11;
}

+ (id)_medicationClustersFromTextSearchTokens:(id)a3 limit:(int64_t)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  void *v47;
  NSObject *v48;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  _QWORD v58[4];
  NSObject *v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  void *v69;
  _QWORD v70[2];
  void *v71;
  void *v72;
  _BYTE v73[128];
  uint64_t v74;

  v74 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v56 = a5;
  v57 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", 841);
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithRelationshipType:withObjectId:", 1015, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v53 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithRelationshipType:withObjectId:", 1015, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v12);

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v61;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v61 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithAttributeType:beingsWithAttributeValue:", 960, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithAttributeType:likeAttributeValue:", 960, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v20);
        objc_msgSend(v10, "addObject:", v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v60, v73, 16);
    }
    while (v15);
  }

  v21 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v72, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "predicateMatchingAllPredicates:", v23);
  v55 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v10);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "predicateMatchingAllPredicates:", v26);
  v54 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v13, "count") >= 2)
  {
    objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x1E0D29840];
    objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithAttributeType:beingsWithAttributeValue:", 960, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v70[0] = v29;
    objc_msgSend(MEMORY[0x1E0D29520], "predicateMatchingConceptsWithRelationshipType:withObjectId:", 1015, v53);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v70[1] = v30;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 2);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateMatchingAllPredicates:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v57, "addObject:", v32);
  }
  objc_msgSend(v57, "addObject:", v54);
  objc_msgSend(v57, "addObject:", v55);
  v33 = (void *)MEMORY[0x1E0D29890];
  objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v57);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_predicateForConceptsNotExcludedFromSearch");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "compoundPredicateWithPredicate:otherPredicate:", v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "componentsJoinedByString:", CFSTR(" | "));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_relationshipsForInflation");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  CFAbsoluteTimeGetCurrent();
  v40 = (void *)MEMORY[0x1E0D29520];
  objc_msgSend(a1, "_attributeTypesForInflation");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "inflateGraphWithRootConceptsPredicate:limit:maximumDepth:attributeTypes:relationshipTypes:ontologyTransaction:error:", v36, a4, 4, v41, v39, v56, a6);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v58[0] = MEMORY[0x1E0C809B0];
    v58[1] = 3221225472;
    v58[2] = __103__HDMedicationSearchEngine__medicationClustersFromTextSearchTokens_limit_ontologyTransaction_errorOut___block_invoke;
    v58[3] = &unk_1E6E01080;
    v59 = v39;
    objc_msgSend(v42, "hk_map:", v58);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    _HKInitializeLogging();
    HKLogMedication();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_INFO);

    if (v45)
    {
      HKLogMedication();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        CFAbsoluteTimeGetCurrent();
        HKDiagnosticStringFromDuration();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        v65 = a1;
        v66 = 2114;
        v67 = v38;
        v68 = 2114;
        v69 = v47;
        _os_log_impl(&dword_1B815E000, v46, OS_LOG_TYPE_INFO, "[%{public}@] EXPANDED sub-graph for matches for tokens: [%{public}@] in %{public}@", buf, 0x20u);

      }
    }
    v48 = v59;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
      +[HDMedicationSearchEngine _medicationClustersFromTextSearchTokens:limit:ontologyTransaction:errorOut:].cold.1((uint64_t)a1, (uint64_t)v13, v48);
    v43 = 0;
  }

  return v43;
}

id __103__HDMedicationSearchEngine__medicationClustersFromTextSearchTokens_limit_ontologyTransaction_errorOut___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (objc_class *)MEMORY[0x1E0D2C4D0];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithSeedHgId:specificProduct:traversedRelationships:traversedDepth:", v7, v4, *(_QWORD *)(a1 + 32), 4);

  return v8;
}

+ (id)_relationshipsForInflation
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB68F8]);
  objc_msgSend(v2, "addInteger:", 798);
  objc_msgSend(v2, "addInteger:", 809);
  objc_msgSend(v2, "addInteger:", 985);
  objc_msgSend(v2, "addInteger:", 952);
  objc_msgSend(v2, "addInteger:", 982);
  objc_msgSend(v2, "addInteger:", 983);
  objc_msgSend(v2, "addInteger:", 797);
  objc_msgSend(v2, "addInteger:", 981);
  objc_msgSend(v2, "addInteger:", 980);
  objc_msgSend(v2, "addInteger:", 1015);
  objc_msgSend(v2, "addInteger:", 1013);
  return v2;
}

+ (id)_attributeTypesForInflation
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0CB68F8]);
  objc_msgSend(v2, "addInteger:", 1012);
  objc_msgSend(v2, "addInteger:", 960);
  objc_msgSend(v2, "addInteger:", 961);
  objc_msgSend(v2, "addInteger:", 962);
  objc_msgSend(v2, "addInteger:", 984);
  objc_msgSend(v2, "addInteger:", 796);
  objc_msgSend(v2, "addInteger:", 795);
  return v2;
}

+ (id)_medicationSearchResultForSpecificProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v19;

  v8 = a3;
  v9 = (void *)MEMORY[0x1E0D29520];
  v10 = a4;
  objc_msgSend(v8, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "predicateMatchingConceptWithID:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  LODWORD(v11) = objc_msgSend(a1, "_medicationSearchResultForFirstConcept:predicate:ontologyTransaction:errorOut:", &v19, v12, v10, a5);

  v13 = v19;
  v14 = v13;
  v15 = 0;
  if ((_DWORD)v11)
  {
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      v16 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v8, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "hk_assignError:code:format:", a5, 118, CFSTR("Unable to get search result for specific product %@"), v17);

      v15 = 0;
    }
  }

  return v15;
}

+ (BOOL)_medicationSearchResultForFirstConcept:(id *)a3 predicate:(id)a4 ontologyTransaction:(id)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v20;

  v10 = a5;
  v11 = a4;
  objc_msgSend(a1, "_relationshipsForInflation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  v13 = objc_msgSend(a1, "_inflateFirstConcept:predicate:relationshipTypes:maximumDepth:ontologyTransaction:errorOut:", &v20, v11, v12, 4, v10, a6);

  v14 = v20;
  v15 = v14;
  if (v13 && a3 && v14)
  {
    v16 = objc_alloc(MEMORY[0x1E0D2C4D0]);
    objc_msgSend(v15, "identifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = (id)objc_msgSend(v16, "initWithSeedHgId:specificProduct:traversedRelationships:traversedDepth:", v18, v15, v12, 4);

  }
  return v13;
}

+ (BOOL)_inflateFirstConcept:(id *)a3 predicate:(id)a4 relationshipTypes:(id)a5 maximumDepth:(int64_t)a6 ontologyTransaction:(id)a7 errorOut:(id *)a8
{
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;

  v14 = (void *)MEMORY[0x1E0D29520];
  v15 = a7;
  v16 = a5;
  v17 = a4;
  objc_msgSend(a1, "_attributeTypesForInflation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "inflateGraphWithRootConceptsPredicate:limit:maximumDepth:attributeTypes:relationshipTypes:ontologyTransaction:error:", v17, 1, a6, v18, v16, v15, a8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = objc_msgSend(v19, "count");
    if (a3)
    {
      if (v20)
      {
        objc_msgSend(v19, "firstObject");
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
  }

  return v19 != 0;
}

+ (id)_medicationSearchResultForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 errorOut:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  objc_msgSend(a1, "_genericProductForClinicalProduct:ontologyTransaction:error:", a3, v8, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(a1, "_medicationSearchResultForSpecificProduct:ontologyTransaction:errorOut:", v9, v8, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)_genericProductForClinicalProduct:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  id *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDMedicationSearchEngine.m"), 388, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("clinicalProduct != nil"));

  }
  v28 = 0;
  v29 = (id *)&v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__9;
  v32 = __Block_byref_object_dispose__9;
  v33 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v11 = (void *)MEMORY[0x1E0D29520];
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateMatchingConceptsWithRelationshipType:withObjectId:", 798, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = *MEMORY[0x1E0D29968];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __88__HDMedicationSearchEngine__genericProductForClinicalProduct_ontologyTransaction_error___block_invoke;
  v21[3] = &unk_1E6E010A8;
  v21[4] = &v22;
  v21[5] = &v28;
  if ((objc_msgSend(MEMORY[0x1E0D29520], "enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:", v13, 0, v14, v10, a5, v21) & 1) == 0)goto LABEL_8;
  v15 = v29[5];
  if (!v15)
  {
    objc_storeStrong(v29 + 5, (id)v23[5]);
    v15 = v29[5];
    if (!v15)
    {
      v17 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v9, "identifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_assignError:code:format:", a5, 118, CFSTR("Unable to get generic product for clinical product %@"), v18);

LABEL_8:
      v16 = 0;
      goto LABEL_9;
    }
  }
  v16 = v15;
LABEL_9:

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

uint64_t __88__HDMedicationSearchEngine__genericProductForClinicalProduct_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  id *v6;
  uint64_t v7;
  int v8;

  v4 = a2;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(_QWORD *)(v5 + 40);
  v6 = (id *)(v5 + 40);
  if (!v7)
    objc_storeStrong(v6, a2);
  v8 = objc_msgSend(v4, "isGeneric");
  if (v8)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);

  return v8 ^ 1u;
}

+ (id)_importEligibleMedicationConceptsSinceDate:(id)a3 limit:(int64_t)a4 profile:(id)a5 errorOut:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  int64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v10 = a3;
  v11 = a5;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  v30 = 0;
  v12 = (void *)MEMORY[0x1E0D294E0];
  objc_msgSend(v11, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke;
  v19[3] = &unk_1E6E010F8;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v23 = a1;
  v24 = a4;
  v21 = v15;
  v22 = &v25;
  LODWORD(a6) = objc_msgSend(v12, "performReadTransactionWithHealthDatabase:error:block:", v13, a6, v19);

  if ((_DWORD)a6)
    v16 = (void *)v26[5];
  else
    v16 = 0;
  v17 = v16;

  _Block_object_dispose(&v25, 8);
  return v17;
}

uint64_t __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  __int128 v34;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  void *v46;
  _QWORD v47[4];

  v47[2] = *MEMORY[0x1E0C80C00];
  v37 = a2;
  HDMedicalRecordEntityPredicateForSortDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB6978], "medicationOrderTypeForIdentifier:", *MEMORY[0x1E0CB5428]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v5;
  objc_msgSend(MEMORY[0x1E0CB6978], "medicationRecordTypeForIdentifier:", *MEMORY[0x1E0CB5458]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_2;
  v40[3] = &unk_1E6E010D0;
  v36 = v4;
  v41 = v36;
  objc_msgSend(v7, "hk_map:", v40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", *MEMORY[0x1E0CB53C8], 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v11 = objc_alloc(MEMORY[0x1E0D294E8]);
  v46 = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v46, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithQueryDescriptors:includeDeletedObjects:anchor:sortDescriptors:bufferSize:profile:", v8, 0, 0, v12, 10, a1[5]);

  v39 = 0;
  LODWORD(v11) = objc_msgSend(v13, "advanceWithError:", &v39);
  v14 = v39;
  if (!(_DWORD)v11)
    goto LABEL_18;
  *(_QWORD *)&v15 = 138543618;
  v34 = v15;
  while (1)
  {
    objc_msgSend(v13, "object", v34);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      break;
LABEL_15:

    v39 = v14;
    v25 = objc_msgSend(v13, "advanceWithError:", &v39);
    v26 = v39;

    v14 = v26;
    if ((v25 & 1) == 0)
      goto LABEL_19;
  }
  objc_msgSend(v16, "primaryConcept");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "isAdHoc"))
  {

  }
  else
  {
    objc_msgSend(v16, "primaryConcept");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isNebulous");

    if ((v19 & 1) == 0)
    {
      objc_msgSend(v16, "primaryConcept");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "identifier");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObject:", v22);
      goto LABEL_14;
    }
  }
  v20 = (void *)a1[7];
  v21 = a1[5];
  v38 = 0;
  objc_msgSend(v20, "_resolveIndividualRxNormConceptsFromMedicalRecordsCodings:profile:error:", v16, v21, &v38);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v38;
  if (!v22)
  {
    _HKInitializeLogging();
    HKLogMedication();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v27 = a1[7];
      *(_DWORD *)buf = v34;
      v43 = v27;
      v44 = 2114;
      v45 = v23;
      _os_log_error_impl(&dword_1B815E000, v24, OS_LOG_TYPE_ERROR, "[%{public}@]: unable to resolve individual RxNorm codes. Error: %{public}@", buf, 0x16u);
    }

    goto LABEL_15;
  }
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v10, "addObjectsFromArray:", v22);
LABEL_14:

  if ((unint64_t)objc_msgSend(v10, "count") < a1[8])
    goto LABEL_15;

LABEL_18:
  v26 = v14;
LABEL_19:
  if (v26 && (objc_msgSend(v26, "hk_isHealthKitErrorWithCode:", 900) & 1) == 0)
  {
    _HKInitializeLogging();
    HKLogConceptIndex();
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_cold_1((uint64_t)v26, v32);

    if (a3)
    {
      v31 = 0;
      *a3 = objc_retainAutorelease(v26);
    }
    else
    {
      _HKLogDroppedError();
      v31 = 0;
    }
  }
  else
  {
    objc_msgSend(v10, "array");
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = *(_QWORD *)(a1[6] + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = v28;

    v31 = 1;
  }

  return v31;
}

id __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;

  v3 = (objc_class *)MEMORY[0x1E0D29560];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v5, "initWithSampleTypes:encodingOptions:restrictedSourceEntities:authorizationFilter:samplePredicate:", v6, 0, 0, 0, *(_QWORD *)(a1 + 32));
  return v7;
}

+ (id)_resolveIndividualRxNormConceptsFromMedicalRecordsCodings:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  int v15;
  id v16;
  _QWORD v18[4];
  id v19;

  v7 = a4;
  objc_msgSend(a3, "medicalRecordCodings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hk_filter:", &__block_literal_global_251_0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "hk_map:", &__block_literal_global_255);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v12 = (void *)MEMORY[0x1E0D29520];
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAnyPredicates:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_3;
    v18[3] = &unk_1E6E011A0;
    v14 = v11;
    v19 = v14;
    v15 = objc_msgSend(v12, "enumerateConceptsMatchingPredicate:profile:error:enumerationHandler:", v13, v7, a5, v18);

    if (v15)
      v16 = v14;
    else
      v16 = 0;

  }
  else
  {
    v16 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  }

  return v16;
}

BOOL __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;

  v2 = a2;
  objc_msgSend(v2, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("http://www.nlm.nih.gov/research/umls/rxnorm")))
  {
    objc_msgSend(v2, "code");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D29520];
  objc_msgSend(a2, "code");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateMatchingConceptsWithAttributeType:attributeValue:", 1008, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __100__HDMedicationSearchEngine__resolveIndividualRxNormConceptsFromMedicalRecordsCodings_profile_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hk_addNonNilObject:", v3);

  return 1;
}

+ (id)_predicateForConceptsNotExcludedFromSearch
{
  return (id)objc_msgSend(MEMORY[0x1E0D29520], "predicateForConceptsWithoutAttributeType:attributeValue:", 620, *MEMORY[0x1E0CB4A60]);
}

+ (id)hkt_genericMedicationWithClinicalProductConcept:(id)a3 profile:(id)a4 errorOut:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v9 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__9;
  v23 = __Block_byref_object_dispose__9;
  v24 = 0;
  objc_msgSend(v9, "ontologyDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__HDMedicationSearchEngine_hkt_genericMedicationWithClinicalProductConcept_profile_errorOut___block_invoke;
  v15[3] = &unk_1E6E01018;
  v17 = &v19;
  v18 = a1;
  v11 = v8;
  v16 = v11;
  LODWORD(a5) = objc_msgSend(v10, "performTransactionWithError:transactionHandler:", a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __93__HDMedicationSearchEngine_hkt_genericMedicationWithClinicalProductConcept_profile_errorOut___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 48), "_genericProductForClinicalProduct:ontologyTransaction:error:", *(_QWORD *)(a1 + 32), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (void)_medicationClustersFromTextSearchTokens:(os_log_t)log limit:ontologyTransaction:errorOut:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1B815E000, log, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to query concepts using tokens: [%{public}@]", (uint8_t *)&v3, 0x16u);
}

void __94__HDMedicationSearchEngine__importEligibleMedicationConceptsSinceDate_limit_profile_errorOut___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  HKSensitiveLogItem();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_error_impl(&dword_1B815E000, a2, OS_LOG_TYPE_ERROR, "Failed to iterate medical records: %{public}@", (uint8_t *)&v4, 0xCu);

}

@end
