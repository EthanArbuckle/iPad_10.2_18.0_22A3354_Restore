@implementation HDOnboardingCompletionEntity

+ (id)onboardingCompletionsForHighestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDOnboardingCompletionEntity _onboardingCompletionsForHighestVersion:featureIdentifier:transaction:error:]((uint64_t)a1, 1, a3, a4, (uint64_t)a5);
}

+ (id)_onboardingCompletionsForHighestVersion:(void *)a3 featureIdentifier:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  __CFString *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD *v26;
  int v27;
  void *v28;
  void *v30;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  id v35;
  void *v36;
  _QWORD v37[3];

  v37[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  objc_opt_self();
  v9 = a2 ^ 1u;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("feature_identifier"), v8, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __108__HDOnboardingCompletionEntity__onboardingCompletionsForHighestVersion_featureIdentifier_transaction_error___block_invoke;
  v32[3] = &unk_1E6CF6EE8;
  v12 = v10;
  v33 = v12;
  v13 = v7;
  v14 = v11;
  v15 = v32;
  v16 = CFSTR("version");
  v17 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0], 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v18, v14);
    v19 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v19;
  }
  objc_msgSend(v13, "databaseForEntityClass:", v17, v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("version"), v17, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v37[0] = v21;
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], v17, v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v22;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v20, v18, 0, v23, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  HDOnboardingCompletionEntityAllProperties();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __150__HDOnboardingCompletionEntity__enumerateAllOnboardingCompletionModelsWithTransaction_predicate_orderedByProperty_ascending_error_enumerationHandler___block_invoke;
  v34[3] = &unk_1E6CEED78;
  v35 = v15;
  v36 = v17;
  v26 = v15;
  v27 = objc_msgSend(v24, "enumerateProperties:error:enumerationHandler:", v25, a5, v34);

  v28 = 0;
  if (v27)
    v28 = (void *)objc_msgSend(v30, "copy");

  return v28;
}

+ (id)onboardingCompletionsForLowestVersionOfFeatureIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  return +[HDOnboardingCompletionEntity _onboardingCompletionsForHighestVersion:featureIdentifier:transaction:error:]((uint64_t)a1, 0, a3, a4, (uint64_t)a5);
}

uint64_t __108__HDOnboardingCompletionEntity__onboardingCompletionsForHighestVersion_featureIdentifier_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (v5 = objc_msgSend(v3, "version"), v5 != objc_msgSend(v4, "version")))
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v6 = 1;
  }

  return v6;
}

uint64_t __150__HDOnboardingCompletionEntity__enumerateAllOnboardingCompletionModelsWithTransaction_predicate_orderedByProperty_ascending_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  _OnboardingCompletionFromRow(a3, (uint64_t)&v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v4)
  {
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v12 = v9;
      v13 = 2114;
      v14 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "[%{public}@] Unexpectedly unable to load onboarding completion: %{public}@", buf, 0x16u);
    }
    v6 = 1;
  }

  return v6;
}

+ (BOOL)enumerateAllOnboardingCompletionsWithTransaction:(id)a3 predicate:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = a4;
  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *MEMORY[0x1E0D29618];
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", *MEMORY[0x1E0D29618], a1, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v12, v11, 0, v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  HDOnboardingCompletionEntityAllProperties();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObject:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __116__HDOnboardingCompletionEntity_enumerateAllOnboardingCompletionsWithTransaction_predicate_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6CE91B8;
  v22 = v10;
  v19 = v10;
  LOBYTE(a5) = objc_msgSend(v16, "enumerateProperties:error:enumerationHandler:", v18, a5, v21);

  return (char)a5;
}

uint64_t __116__HDOnboardingCompletionEntity_enumerateAllOnboardingCompletionsWithTransaction_predicate_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  uint64_t v8;

  HDSQLiteColumnWithNameAsBoolean();
  HDSQLiteColumnWithNameAsInt64();
  _OnboardingCompletionFromRow(a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v8;
}

+ (id)insertOnboardingCompletion:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
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
  id v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  int64_t v48;
  id v49;
  id v50;
  id *v51;
  void *v52;
  id v53;
  _QWORD v54[5];

  v54[4] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = v10;
  v13 = v11;
  v14 = (void *)objc_opt_self();
  objc_msgSend(v12, "countryCode");
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = (void *)v15;
    v17 = objc_msgSend(v12, "countryCodeProvenance");

    if (!v17)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a6, 3, CFSTR("Country code provenance must be set when saving a country code"));

LABEL_13:
      v46 = 0;
      goto LABEL_14;
    }
  }
  v48 = a4;
  v49 = a1;
  v50 = v12;
  v51 = a6;
  v18 = v12;
  objc_msgSend(v18, "featureIdentifier");
  v52 = v13;
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "version");
  objc_msgSend(v18, "countryCode");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v18, "countryCodeProvenance");

  v23 = (void *)MEMORY[0x1E0D29840];
  v24 = (void *)MEMORY[0x1E0D29838];
  v25 = v21;
  objc_msgSend(v24, "predicateWithProperty:value:comparisonType:", CFSTR("feature_identifier"), v19, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v26;
  v27 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "predicateWithProperty:value:comparisonType:", CFSTR("version"), v28, 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v54[1] = v29;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("country_code"), v25, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  v54[2] = v30;
  v31 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v22);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "predicateWithProperty:value:comparisonType:", CFSTR("country_code_provenance"), v32, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v54[3] = v33;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "predicateMatchingAllPredicates:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v52;
  objc_msgSend(v52, "databaseForEntityClass:", v14);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0;
  objc_msgSend(v14, "anyInDatabase:predicate:error:", v36, v35, &v53);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v53;

  if (!v37 && v38)
  {
    if (v51)
      *v51 = objc_retainAutorelease(v38);
    else
      _HKLogDroppedError();
    goto LABEL_12;
  }
  if (v37)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", v51, 115, CFSTR("The user has already completed onboarding for this feature, version, and country"));
LABEL_12:
    v12 = v50;

    goto LABEL_13;
  }

  objc_msgSend(v18, "UUID");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "featureIdentifier");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v18, "version");
  objc_msgSend(v18, "completionDate");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "countryCode");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend(v18, "countryCodeProvenance");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:]((uint64_t)v49, v39, v40, v41, v42, v43, v44, v45, 0, 0, v48, v52, (uint64_t)v51);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v50;
LABEL_14:

  return v46;
}

+ (id)_insertEntityWithUUID:(void *)a3 featureIdentifier:(uint64_t)a4 version:(void *)a5 completionDate:(void *)a6 countryCode:(uint64_t)a7 countryCodeProvenance:(void *)a8 modificationDate:(char)a9 deleted:(uint64_t)a10 syncProvenance:(uint64_t)a11 syncIdentity:(void *)a12 transaction:(uint64_t)a13 error:
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char v45;

  v17 = a2;
  v18 = a3;
  v19 = a5;
  v20 = a6;
  v21 = a8;
  v22 = a12;
  v23 = (void *)objc_opt_self();
  objc_msgSend(v22, "databaseForEntityClass:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  HDOnboardingCompletionEntityAllProperties();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __200__HDOnboardingCompletionEntity__insertEntityWithUUID_featureIdentifier_version_completionDate_countryCode_countryCodeProvenance_modificationDate_deleted_syncProvenance_syncIdentity_transaction_error___block_invoke;
  v35[3] = &unk_1E6CF6F10;
  v36 = v17;
  v37 = v18;
  v38 = v19;
  v39 = v20;
  v40 = v21;
  v41 = a4;
  v45 = a9;
  v42 = a7;
  v43 = a10;
  v44 = a11;
  v26 = v21;
  v27 = v20;
  v28 = v19;
  v29 = v18;
  v30 = v17;
  objc_msgSend(v23, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v24, v25, a13, v35);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  return v31;
}

+ (id)insertCodableOnboardingCompletions:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  id v38;
  char v39;
  id v40;
  void *v41;
  void *v42;
  id *v43;
  void *v44;
  void *v45;
  void *v46;
  _BOOL4 v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  NSObject *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  uint64_t v60;
  void *v62;
  void *v63;
  id v64;
  uint64_t v66;
  void *v67;
  uint64_t v68;
  id v69;
  void *v70;
  void *v71;
  id v72;
  uint64_t v73;
  __CFString *v74;
  uint64_t v75;
  void *v76;
  void *v77;
  id *v78;
  id v79;
  id v80;
  id v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint8_t buf[4];
  id v87;
  __int16 v88;
  id v89;
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v72 = a6;
  v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v10, "count"));
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  v12 = v10;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v83;
    v63 = v12;
    v64 = v11;
    v78 = a7;
    v66 = *(_QWORD *)v83;
LABEL_3:
    v16 = 0;
    v73 = v14;
    while (1)
    {
      if (*(_QWORD *)v83 != v15)
        objc_enumerationMutation(v12);
      v17 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * v16);
      v81 = 0;
      v18 = objc_msgSend(v17, "isValidWithError:", &v81);
      v19 = v81;
      if ((v18 & 1) == 0)
      {
        _HKInitializeLogging();
        v30 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v87 = a1;
          v88 = 2114;
          v89 = v19;
          _os_log_error_impl(&dword_1B7802000, v30, OS_LOG_TYPE_ERROR, "[%{public}@] Skipping invalid codable: %{public}@", buf, 0x16u);
        }
        goto LABEL_34;
      }
      objc_msgSend(v11, "syncIdentityManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "legacySyncIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v17, "hasSyncIdentity"))
      {
        objc_msgSend(v17, "syncIdentity");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = v19;
        +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v22, &v80);
        v23 = (id)objc_claimAutoreleasedReturnValue();
        v24 = v80;
        v25 = v19;
        v19 = v24;

        if (!v23)
        {
          _HKInitializeLogging();
          v55 = *MEMORY[0x1E0CB52B0];
          v14 = v73;
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v87 = v19;
            _os_log_fault_impl(&dword_1B7802000, v55, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          v23 = 0;
          goto LABEL_32;
        }
        objc_msgSend(v11, "syncIdentityManager");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v79 = v19;
        objc_msgSend(v26, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v23, 1, v72, &v79);
        v27 = objc_claimAutoreleasedReturnValue();
        v28 = v79;

        if (!v27)
        {
          _HKInitializeLogging();
          v56 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v87 = v28;
            _os_log_fault_impl(&dword_1B7802000, v56, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          v21 = 0;
          v19 = v28;
          v15 = v66;
          v14 = v73;
          a7 = v78;
          v11 = v64;
          goto LABEL_32;
        }

        v21 = (void *)v27;
        v19 = v28;
        a7 = v78;
        v29 = v64;
      }
      else
      {
        v29 = v11;
      }
      v76 = v21;
      objc_msgSend(v21, "entity");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v75 = objc_msgSend(v31, "persistentID");
      v32 = v17;
      v33 = v72;
      v34 = objc_opt_self();
      LODWORD(v35) = objc_msgSend(v32, "deleted");
      objc_msgSend(v32, "decodedUUID");
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = (void *)v36;
      v77 = v19;
      if (v36)
      {
        v70 = (void *)v36;
        v71 = v31;
        v67 = v33;
        v68 = v34;
        if ((_DWORD)v35)
        {
          v38 = v33;
          v39 = v35;
          v40 = v37;
          v41 = (void *)objc_opt_self();
          objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("uuid"), v40, 1);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v38, "databaseForEntityClass:", v41);
          v35 = objc_claimAutoreleasedReturnValue();
          v43 = v78;
          objc_msgSend(v41, "anyInDatabase:predicate:error:", v35, v42, v78);
          v44 = (void *)objc_claimAutoreleasedReturnValue();

          LOBYTE(v35) = v39;
          objc_msgSend(v44, "onboardingCompletionWithTransaction:error:", v38, v78);
          v45 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v45, "featureIdentifier");
          v69 = (id)objc_claimAutoreleasedReturnValue();

          v74 = &stru_1E6D11BB8;
        }
        else
        {
          objc_msgSend(v32, "featureIdentifier");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = (id)objc_msgSend(v48, "copy");

          objc_msgSend(v32, "featureIdentifier");
          v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
          v43 = v78;
        }
        v49 = objc_msgSend(v32, "version");
        objc_msgSend(v32, "decodedCompletionDate");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "countryCode");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v32, "countryCodeProvenance");
        objc_msgSend(v32, "decodedModificationDate");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = (uint64_t)v43;
        v33 = v67;
        +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:](v68, v70, v74, v49, v50, v51, v52, v53, v35, a4, v75, v67, v60);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        if ((v35 & 1) == 0)
        v47 = v54 != 0;

        v11 = v64;
        v15 = v66;
        v14 = v73;
        v31 = v71;
        v37 = v70;
        v46 = v69;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a7, 3, CFSTR("Cannot insert codable without UUID"));
        v46 = 0;
        v47 = 0;
        v11 = v29;
        v15 = v66;
        v14 = v73;
      }

      v23 = v46;
      if (!v47)
      {

        v12 = v63;
        v58 = 0;
        v57 = v62;
        goto LABEL_38;
      }
      v12 = v63;
      v21 = v76;
      if (v23)
      {
        objc_msgSend(v62, "addObject:", v23);
        v19 = v77;
        a7 = v78;
LABEL_32:

        goto LABEL_33;
      }
      v19 = v77;
      a7 = v78;
LABEL_33:

LABEL_34:
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v82, v90, 16);
        if (v14)
          goto LABEL_3;
        break;
      }
    }
  }

  v57 = v62;
  v58 = (void *)objc_msgSend(v62, "copy");
LABEL_38:

  return v58;
}

void __200__HDOnboardingCompletionEntity__insertEntityWithUUID_featureIdentifier_version_completionDate_countryCode_countryCodeProvenance_modificationDate_deleted_syncProvenance_syncIdentity_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB144](a2, CFSTR("feature_identifier"), *(_QWORD *)(a1 + 40));
  MEMORY[0x1BCCAB114](a2, CFSTR("version"), *(_QWORD *)(a1 + 72));
  MEMORY[0x1BCCAB0E4](a2, CFSTR("completion_date"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB144](a2, CFSTR("country_code"), *(_QWORD *)(a1 + 56));
  MEMORY[0x1BCCAB114](a2, CFSTR("country_code_provenance"), *(_QWORD *)(a1 + 80));
  MEMORY[0x1BCCAB0E4](a2, CFSTR("mod_date"), *(_QWORD *)(a1 + 64));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("deleted"), *(unsigned __int8 *)(a1 + 104));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 88));
  JUMPOUT(0x1BCCAB114);
}

+ (BOOL)deleteAllCompletionsForFeatureIdentifier:(id)a3 syncIdentity:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;
  id v32;
  id obj;
  id v34;
  id *v36;
  _QWORD v37[4];
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  const __CFString *v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("feature_identifier"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v43 = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __104__HDOnboardingCompletionEntity_deleteAllCompletionsForFeatureIdentifier_syncIdentity_transaction_error___block_invoke;
  v37[3] = &unk_1E6CF6008;
  v15 = v13;
  v38 = v15;
  v36 = a6;
  LODWORD(v13) = objc_msgSend(v12, "enumerateProperties:error:enumerationHandler:", v14, a6, v37);

  if ((_DWORD)v13)
  {
    v16 = v15;
    v34 = v9;
    objc_opt_self();
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    v18 = 1;
    if (v17)
    {
      v19 = v17;
      v30 = v12;
      v31 = v10;
      v32 = v9;
      v20 = *(_QWORD *)v40;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(obj);
          v22 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          v23 = v34;
          v24 = v22;
          v25 = objc_opt_self();
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 0.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99D68], "date");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          +[HDOnboardingCompletionEntity _insertEntityWithUUID:featureIdentifier:version:completionDate:countryCode:countryCodeProvenance:modificationDate:deleted:syncProvenance:syncIdentity:transaction:error:](v25, v24, &stru_1E6D11BB8, 0, v26, 0, 0, v27, 1, 0, a4, v23, (uint64_t)v36);
          v28 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v28)
          {
            v18 = 0;
            goto LABEL_13;
          }
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
        if (v19)
          continue;
        break;
      }
      v18 = 1;
LABEL_13:
      v10 = v31;
      v9 = v32;
      v12 = v30;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __104__HDOnboardingCompletionEntity_deleteAllCompletionsForFeatureIdentifier_syncIdentity_transaction_error___block_invoke(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

- (id)onboardingCompletionWithTransaction:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v6 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__84;
  v17 = __Block_byref_object_dispose__84;
  v18 = 0;
  HDOnboardingCompletionEntityAllProperties();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntity:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__HDOnboardingCompletionEntity_onboardingCompletionWithTransaction_error___block_invoke;
  v12[3] = &unk_1E6CEEDC8;
  v12[4] = &v13;
  LODWORD(a4) = -[HDSQLiteEntity getValuesForProperties:database:error:handler:](self, "getValuesForProperties:database:error:handler:", v7, v8, a4, v12);

  if ((_DWORD)a4)
    v9 = (void *)v14[5];
  else
    v9 = 0;
  v10 = v9;
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __74__HDOnboardingCompletionEntity_onboardingCompletionWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  _OnboardingCompletionFromRow(a3, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDOnboardingCompletionEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([HDOnboardingCompletionEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)databaseTable
{
  return CFSTR("onboarding_completions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 11;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_47;
}

@end
