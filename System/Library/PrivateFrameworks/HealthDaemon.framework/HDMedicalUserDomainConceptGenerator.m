@implementation HDMedicalUserDomainConceptGenerator

+ (BOOL)generateUserDomainConceptForMedicalRecord:(id)a3 entityPersistentID:(id)a4 insertionContext:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  id *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  BOOL v25;
  int v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend((id)objc_opt_class(), "groupsByUserDomainConcept"))
  {
    v16 = a8;
    v17 = v12;
    v37 = v14;
    v18 = v14;
    v19 = v15;
    v20 = objc_opt_self();
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy__151;
    v52 = __Block_byref_object_dispose__151;
    v53 = 0;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0;
    objc_msgSend(v18, "ontologyDatabase");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __116__HDMedicalUserDomainConceptGenerator__userDomainConceptForMedicalRecord_profile_transaction_shouldUpdateOut_error___block_invoke;
    v38[3] = &unk_1E6D01998;
    v41 = &v48;
    v43 = v20;
    v22 = v17;
    v39 = v22;
    v23 = v18;
    v40 = v23;
    v42 = &v44;
    LOBYTE(v18) = objc_msgSend(v21, "performTransactionWithDatabaseTransaction:error:transactionHandler:", v19, a8, v38);

    if ((v18 & 1) != 0)
      v24 = (void *)v49[5];
    else
      v24 = 0;
    v26 = *((unsigned __int8 *)v45 + 24);
    v27 = v24;

    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

    if (v27
      && (!v26
       || +[HDUserDomainConceptEntity storeUserDomainConcept:method:profile:transaction:error:](HDUserDomainConceptEntity, "storeUserDomainConcept:method:profile:transaction:error:", v27, 2, v23, v19, a8)))
    {
      v36 = v13;
      v28 = v19;
      v29 = v27;
      objc_opt_self();
      objc_msgSend(v28, "protectedDatabase");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "UUID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      HDDataEntityPredicateForDataUUID();
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSQLiteEntity anyInDatabase:predicate:error:](HDMedicalUserDomainConceptEntity, "anyInDatabase:predicate:error:", v30, v32, v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      if (v33)
      {
        v34 = v36;
        v25 = +[HDMedicalUserDomainConceptMappingEntity insertUserDomainConceptID:medicalRecordID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "insertUserDomainConceptID:medicalRecordID:transaction:error:", objc_msgSend(v33, "persistentID"), objc_msgSend(v36, "integerValue"), v28, v16);
        v14 = v37;
      }
      else
      {
        v25 = 0;
        v14 = v37;
        v34 = v36;
      }

    }
    else
    {
      v25 = 0;
      v14 = v37;
    }

  }
  else
  {
    v25 = 1;
  }

  return v25;
}

+ (BOOL)remapMedicalRecordsIfNeededForUserDomainConcept:(id)a3 shouldExcludeExistingConcept:(BOOL)a4 profile:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t *v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t *v28;
  id v29;
  uint64_t v31;
  uint64_t v32;
  BOOL (*v33)(uint64_t, void *, uint64_t, uint64_t);
  void *v34;
  id v35;
  id v36;
  id v37;
  id v38;
  BOOL v39;
  _QWORD v40[4];
  id v41;
  uint64_t *v42;
  _QWORD v43[3];

  v43[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  HDMedicalRecordEntityPredicateForMedicalUserDomainConcept(v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseTransaction");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = MEMORY[0x1E0C809B0];
  v31 = MEMORY[0x1E0C809B0];
  v32 = 3221225472;
  v33 = __150__HDMedicalUserDomainConceptGenerator_remapMedicalRecordsIfNeededForUserDomainConcept_shouldExcludeExistingConcept_profile_ontologyTransaction_error___block_invoke;
  v34 = &unk_1E6D01970;
  v39 = a4;
  v35 = v12;
  v36 = v13;
  v37 = v14;
  v38 = a1;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  v21 = v19;
  v22 = &v31;
  v23 = v16;
  v24 = v15;
  objc_opt_self();
  objc_msgSend(v23, "databaseForEntityClass:", objc_opt_class(), v31, v32, v33, v34);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity queryWithDatabase:predicate:](HDMedicalRecordEntity, "queryWithDatabase:predicate:", v25, v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = CFSTR("data_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v17;
  v40[1] = 3221225472;
  v40[2] = __117__HDMedicalUserDomainConceptGenerator__enumerateMedicalRecordSamplesWithPredicate_profile_transaction_error_handler___block_invoke;
  v40[3] = &unk_1E6CEE9A0;
  v41 = v21;
  v42 = v22;
  v28 = v22;
  v29 = v21;
  LOBYTE(a7) = objc_msgSend(v26, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v27, a7, v40);

  return (char)a7;
}

BOOL __150__HDMedicalUserDomainConceptGenerator_remapMedicalRecordsIfNeededForUserDomainConcept_shouldExcludeExistingConcept_profile_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int64_t v24;
  void *v25;
  void *v26;
  char v27;
  _BOOL8 v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  uint64_t v56;
  id v57;
  char v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a2;
  objc_msgSend(v7, "numberWithLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(unsigned __int8 *)(a1 + 64);
  v11 = *(void **)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v13 = *(void **)(a1 + 48);
  v14 = v8;
  v15 = v9;
  v16 = v11;
  v17 = v12;
  v18 = a4;
  v19 = v17;
  v20 = v13;
  v21 = objc_opt_self();
  v58 = 0;
  +[HDMedicalUserDomainConceptGenerator _fetchUserDomainConceptForMedicalRecord:existingUserDomainConcept:shouldExcludeExistingUserDomainConcept:profile:ontologyTransaction:outShouldUpdateNewUserDomainConcept:error:](v21, v14, v16, v10, v19, v20, &v58, v18);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v57 = v15;
    if (v58)
    {
      objc_msgSend(v20, "databaseTransaction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = +[HDUserDomainConceptEntity storeUserDomainConcept:method:profile:transaction:error:](HDUserDomainConceptEntity, "storeUserDomainConcept:method:profile:transaction:error:", v22, 2, v19, v23, v18);

      if (!v24)
      {
        v28 = 0;
        goto LABEL_15;
      }
    }
    objc_msgSend(v16, "UUID");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "UUID");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if ((v27 & 1) != 0)
    {
      v28 = 1;
LABEL_15:
      v15 = v57;
      goto LABEL_20;
    }
    v56 = v18;
    _HKInitializeLogging();
    HKLogHealthOntology();
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = os_log_type_enabled(v29, OS_LOG_TYPE_INFO);

    v31 = v57;
    if (v30)
    {
      HKLogHealthOntology();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v14, "UUID");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "hk_shortRepresentation");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "UUID");
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "hk_shortRepresentation");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "UUID");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "hk_shortRepresentation");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544130;
        v60 = v21;
        v61 = 2114;
        v62 = v50;
        v63 = 2114;
        v64 = v33;
        v65 = 2114;
        v66 = v34;
        _os_log_impl(&dword_1B7802000, v32, OS_LOG_TYPE_INFO, "%{public}@: Move UDC mapping for record %{public}@, %{public}@ -> %{public}@", buf, 0x2Au);

        v31 = v57;
      }

    }
    objc_msgSend(v20, "databaseTransaction");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v31;
    v55 = v22;
    v36 = v35;
    v37 = v16;
    objc_opt_self();
    v53 = v36;
    objc_msgSend(v36, "protectedDatabase");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "UUID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    HDDataEntityPredicateForDataUUID();
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDMedicalUserDomainConceptEntity, "anyInDatabase:predicate:error:", v38, v40, v56);
    v41 = objc_claimAutoreleasedReturnValue();

    v49 = (void *)v41;
    if (v41)
    {
      objc_msgSend(v53, "protectedDatabase");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "UUID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      HDDataEntityPredicateForDataUUID();
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDSQLiteEntity anyInDatabase:predicate:error:](HDMedicalUserDomainConceptEntity, "anyInDatabase:predicate:error:", v42, v44, v56);
      v45 = (void *)objc_claimAutoreleasedReturnValue();

      if (v45)
      {
        v46 = v53;
        v28 = +[HDMedicalUserDomainConceptMappingEntity updateMappingFromRecordWithPersistentID:withMapToUDCWithPersistentID:toMapToUDCWithPersistentID:transaction:error:](HDMedicalUserDomainConceptMappingEntity, "updateMappingFromRecordWithPersistentID:withMapToUDCWithPersistentID:toMapToUDCWithPersistentID:transaction:error:", objc_msgSend(v51, "longLongValue"), objc_msgSend(v49, "persistentID"), objc_msgSend(v45, "persistentID"), v53, v56);
        v15 = v57;
      }
      else
      {
        v28 = 0;
        v15 = v57;
        v46 = v53;
      }

    }
    else
    {
      v28 = 0;
      v15 = v57;
      v46 = v53;
    }

  }
  else
  {
    v28 = 0;
  }
LABEL_20:

  return v28;
}

+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  void *v25;
  id *v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v27 = a5;
  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v28 = a4;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v29 = v6;
  objc_msgSend(v6, "attributes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v32 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        v14 = 150004;
        if (objc_msgSend(v13, "type", v27) != 61813)
        {
          if (objc_msgSend(v13, "type") == 61839)
          {
            v14 = 150005;
          }
          else
          {
            if (objc_msgSend(v13, "type") != 989)
              continue;
            v14 = 150009;
          }
        }
        v15 = v7;
        v16 = v13;
        v17 = objc_msgSend(v16, "isDeleted");
        v18 = (void *)MEMORY[0x1E0CB6CF0];
        if (v17)
        {
          v19 = v15;
          objc_msgSend(v18, "nullPropertyWithType:version:", v14, objc_msgSend(v16, "version"));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObject:", v20);

        }
        else
        {
          v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6CF0]), "initWithType:version:BOOLValue:", v14, objc_msgSend(v16, "version"), objc_msgSend(v16, "BOOLValue"));
          objc_msgSend(v15, "addObject:", v20);
        }

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v10);
  }

  +[HDOntologyLocalizedStringProvider localizedOntologyPreferredNamesForConcept:withUserDomainConceptPropertyType:](HDOntologyLocalizedStringProvider, "localizedOntologyPreferredNamesForConcept:withUserDomainConceptPropertyType:", v29, 160012);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObjectsFromArray:", v21);
  objc_msgSend(v29, "identifier");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v23 = +[HDOntologyEducationContentProvider localizedEducationContentForConceptWithIdentifier:ontologyTransaction:localizedEducationContentOut:error:](HDOntologyEducationContentProvider, "localizedEducationContentForConceptWithIdentifier:ontologyTransaction:localizedEducationContentOut:error:", v22, v28, &v30, v27);
  v24 = v30;

  v25 = 0;
  if (v23)
  {
    objc_msgSend(v7, "hk_addNonNilObject:", v24);
    v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6D20]), "initWithProperties:", v7);
  }

  return v25;
}

+ (BOOL)supportsAutomaticGrouperPromotion
{
  return 1;
}

+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int64_t v23;
  void *v24;
  void *v25;
  HDConceptResolutionConfiguration *v26;
  void *v27;
  int v28;
  id *v30;
  id *v31;
  void *v32;
  id v33;
  id *v34;

  v11 = a3;
  v12 = a6;
  objc_msgSend(MEMORY[0x1E0CB6838], "adHocConceptSystem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "codingCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "codingsExcludingCodingSystem:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v15, "count"))
  {
    v34 = a7;
    v30 = a4;
    v31 = a5;
    v16 = v11;
    v17 = v12;
    v18 = v15;
    v19 = objc_opt_self();
    objc_msgSend(v16, "categoryTypes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = v13;
    v33 = v12;
    if (v21)
      v22 = objc_msgSend(v21, "longLongValue");
    else
      v22 = 8;
    objc_msgSend(v16, "countryCode");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    HKCurrentLocaleCountryCodeIfUnknown();
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:]([HDConceptResolutionConfiguration alloc], "initWithCountryCode:recordCategoryType:options:", v25, v22, 0);
    +[HDMedicalUserDomainConceptGenerator _fetchGroupByConceptAndLoadRelationshipsWith:codings:ontologyTransaction:error:](v19, v26, v18, v17, (uint64_t)v34);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      v28 = objc_msgSend(v27, "isAdHoc");
      if (v30 && v28)
        *v30 = objc_retainAutorelease(v18);
      v13 = v32;
      v12 = v33;
      if (v31)
        *v31 = objc_retainAutorelease(v27);
      v23 = 1;
    }
    else
    {
      v23 = 0;
      v13 = v32;
      v12 = v33;
    }

  }
  else
  {
    v23 = 2;
  }

  return v23;
}

+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "remapMedicalRecordsIfNeededForUserDomainConcept:shouldExcludeExistingConcept:profile:ontologyTransaction:error:", a3, 0, a4, a5, a6);
}

BOOL __116__HDMedicalUserDomainConceptGenerator__userDomainConceptForMedicalRecord_profile_transaction_shouldUpdateOut_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDMedicalUserDomainConceptGenerator _fetchUserDomainConceptForMedicalRecord:existingUserDomainConcept:shouldExcludeExistingUserDomainConcept:profile:ontologyTransaction:outShouldUpdateNewUserDomainConcept:error:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32), 0, 0, *(void **)(a1 + 40), a2, (char *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24), a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

+ (id)_fetchUserDomainConceptForMedicalRecord:(void *)a3 existingUserDomainConcept:(int)a4 shouldExcludeExistingUserDomainConcept:(void *)a5 profile:(void *)a6 ontologyTransaction:(char *)a7 outShouldUpdateNewUserDomainConcept:(uint64_t)a8 error:
{
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  HDConceptResolutionConfiguration *v19;
  void *v20;
  void *v21;
  HDConceptResolutionConfiguration *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  NSObject *v35;
  _BOOL4 v36;
  NSObject *v37;
  void *v38;
  void *v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void *v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  void *v57;
  int v58;
  id v59;
  id v60;
  void *v61;
  char v62;
  char v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  id v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t (*v78)(uint64_t, uint64_t);
  NSObject *v79;
  _BOOL4 v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  int v92;
  id v93;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  id v99;
  uint64_t v100;
  id v101;
  id v102;
  void *v103;
  id v104;
  _QWORD v105[2];
  _QWORD v106[5];
  void *v107;
  _BYTE buf[24];
  uint64_t (*v109)(uint64_t, uint64_t);
  void (*v110)(uint64_t);
  id v111;
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v13 = a2;
  v104 = a3;
  v102 = a5;
  v14 = a6;
  v15 = objc_opt_self();
  v16 = v14;
  v17 = v13;
  v18 = objc_opt_self();
  v19 = [HDConceptResolutionConfiguration alloc];
  objc_msgSend(v17, "country");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  HKCurrentLocaleCountryCodeIfUnknown();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[HDConceptResolutionConfiguration initWithCountryCode:recordCategoryType:options:](v19, "initWithCountryCode:recordCategoryType:options:", v21, objc_msgSend(v17, "recordCategoryType"), 0);

  v23 = (void *)MEMORY[0x1E0CB6830];
  objc_msgSend(MEMORY[0x1E0CB6838], "adHocConceptSystem");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "medicalRecordCodings");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "stripCodingsMatchingSystem:fromCodings:", v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMedicalUserDomainConceptGenerator _fetchGroupByConceptAndLoadRelationshipsWith:codings:ontologyTransaction:error:](v18, v22, v26, v16, a8);
  v103 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v103)
  {
    v29 = 0;
    goto LABEL_60;
  }
  if (!v104 || (a4 & 1) != 0)
  {
LABEL_29:
    if (a4)
      v41 = v104;
    else
      v41 = 0;
    v93 = v103;
    v99 = v41;
    v101 = v17;
    v91 = v16;
    v42 = v102;
    v88 = (void *)objc_opt_self();
    objc_msgSend(v93, "coding");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "country");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    HKCurrentLocaleCountryCodeIfUnknown();
    v89 = (void *)objc_claimAutoreleasedReturnValue();

    v44 = objc_alloc(MEMORY[0x1E0C99DE8]);
    HDUserDomainConceptEntityPredicateForMedicalCoding(v90);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v105[0] = v45;
    HDMedicalUserDomainConceptEntityPredicateForCountryCode((uint64_t)v89);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v105[1] = v46;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 2);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = (void *)objc_msgSend(v44, "initWithArray:", v47);

    if (v99)
    {
      objc_msgSend(v99, "UUID");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      HDUserDomainConceptEntityPredicateForConceptUUID((uint64_t)v48, 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v97, "addObject:", v49);

    }
    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v97);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v91, "databaseTransaction");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v50;
    v53 = v42;
    v54 = v51;
    objc_opt_self();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v109 = __Block_byref_object_copy__151;
    v110 = __Block_byref_object_dispose__151;
    v111 = 0;
    v55 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D29888]), "initWithExpression:ascending:", CFSTR("creation_date"), 1);
    objc_msgSend(v53, "userDomainConceptManager");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v107, 1);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v106[0] = MEMORY[0x1E0C809B0];
    v106[1] = 3221225472;
    v106[2] = __130__HDMedicalUserDomainConceptGenerator__oldestUserDomainConceptForPredicate_profile_transaction_medicalUserDomainConceptOut_error___block_invoke;
    v106[3] = &unk_1E6D019C0;
    v106[4] = buf;
    v58 = objc_msgSend(v56, "enumerateUserDomainConceptsWithPredicate:limit:orderingTerms:error:enumerationHandler:", v52, 1, v57, a8, v106);

    if ((v58 & 1) != 0)
      v59 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
    else
      v59 = 0;

    _Block_object_dispose(buf, 8);
    v60 = v59;

    if (!v58)
    {
      v29 = 0;
LABEL_59:

      goto LABEL_60;
    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v101, "recordCategoryType"));
    v87 = (void *)objc_claimAutoreleasedReturnValue();
    if (v60)
    {
      objc_msgSend(v60, "categoryTypes");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = objc_msgSend(v61, "containsObject:", v87);

      if ((v62 & 1) != 0)
      {
        v63 = 0;
LABEL_55:
        if (a7)
          *a7 = v63;
        v60 = v60;
        goto LABEL_58;
      }
      objc_msgSend(v60, "medicalConceptByAddingCategoryType:", objc_msgSend(v101, "recordCategoryType"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();

      _HKInitializeLogging();
      HKLogHealthOntology();
      v79 = objc_claimAutoreleasedReturnValue();
      v80 = os_log_type_enabled(v79, OS_LOG_TYPE_INFO);

      if (!v80)
      {
LABEL_54:
        v63 = 1;
        v60 = v72;
        goto LABEL_55;
      }
      HKLogHealthOntology();
      v64 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v72, "UUID");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "hk_shortRepresentation");
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "UUID");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "hk_shortRepresentation");
        v84 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v88;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v82;
        *(_WORD *)&buf[22] = 2114;
        v109 = v84;
        _os_log_impl(&dword_1B7802000, v64, OS_LOG_TYPE_INFO, "%{public}@: Updated UDC %{public}@ for medical record %{public}@ with new category type", buf, 0x20u);

      }
    }
    else
    {
      objc_msgSend(v88, "propertyCollectionWithOntologyConcept:ontologyTransaction:error:", v93, v91, a8);
      v64 = objc_claimAutoreleasedReturnValue();
      if (!v64)
      {
        v60 = 0;
LABEL_58:

        v29 = v60;
        goto LABEL_59;
      }
      v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v90, 0);
      if (objc_msgSend(v93, "isAdHoc"))
      {
        v65 = (void *)MEMORY[0x1E0CB6830];
        objc_msgSend(MEMORY[0x1E0CB6838], "adHocConceptSystem");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v101, "medicalRecordCodings");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "stripCodingsMatchingSystem:fromCodings:", v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v86, "addObjectsFromArray:", v68);
      }
      v69 = objc_alloc(MEMORY[0x1E0CB6870]);
      v106[0] = v87;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v106, 1);
      v70 = (void *)objc_claimAutoreleasedReturnValue();
      v71 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB6830]), "initWithCodings:", v86);
      v72 = (void *)objc_msgSend(v69, "initWithCategoryTypes:countryCode:codingCollection:propertyCollection:", v70, v89, v71, v64);

      _HKInitializeLogging();
      HKLogHealthOntology();
      v73 = objc_claimAutoreleasedReturnValue();
      LODWORD(v71) = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);

      if ((_DWORD)v71)
      {
        HKLogHealthOntology();
        v74 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v72, "UUID");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v75, "hk_shortRepresentation");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v101, "UUID");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v77, "hk_shortRepresentation");
          v78 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          *(_QWORD *)&buf[4] = v88;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v76;
          *(_WORD *)&buf[22] = 2114;
          v109 = v78;
          _os_log_impl(&dword_1B7802000, v74, OS_LOG_TYPE_INFO, "%{public}@: Created a new UDC %{public}@ for medical record %{public}@", buf, 0x20u);

        }
      }

    }
    goto LABEL_54;
  }
  objc_msgSend(v104, "firstOntologyCoding");
  v27 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v104, "firstAdhocCoding");
  v100 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v103, "coding");
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  if (!(v27 | v100))
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v15;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v104;
      _os_log_error_impl(&dword_1B7802000, v28, OS_LOG_TYPE_ERROR, "%{public}@ was not able to find either an ontology coding or an adhoc coding on User Domain Concept %{public}@", buf, 0x16u);
    }

    goto LABEL_20;
  }
  if (v27)
  {
    objc_msgSend((id)v27, "code");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "code");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    if (v30 != v95)
    {
      objc_msgSend(v98, "code");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      if (v31)
      {
        objc_msgSend((id)v27, "code");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "code");
        v33 = objc_claimAutoreleasedReturnValue();
        goto LABEL_17;
      }
      goto LABEL_23;
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!v100)
  {
LABEL_24:
    _HKInitializeLogging();
    HKLogHealthOntology();
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = os_log_type_enabled(v35, OS_LOG_TYPE_INFO);

    if (v36)
    {
      HKLogHealthOntology();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v17, "UUID");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "hk_shortRepresentation");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v104, "UUID");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "hk_shortRepresentation");
        v40 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v15;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v96;
        *(_WORD *)&buf[22] = 2114;
        v109 = v40;
        _os_log_impl(&dword_1B7802000, v37, OS_LOG_TYPE_INFO, "%{public}@: Medical record %{public}@ no longer maps to UDC %{public}@", buf, 0x20u);

      }
    }

    goto LABEL_29;
  }
  objc_msgSend((id)v100, "code");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "code");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  if (v30 == v95)
    goto LABEL_19;
  objc_msgSend(v98, "code");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v31)
  {
LABEL_23:

    goto LABEL_24;
  }
  objc_msgSend((id)v100, "code");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v98, "code");
  v33 = objc_claimAutoreleasedReturnValue();
LABEL_17:
  v34 = (void *)v33;
  v92 = objc_msgSend(v32, "isEqual:", v33);

  if (!v92)
    goto LABEL_24;
LABEL_20:
  if (a7)
    *a7 = 0;
  v29 = v104;

LABEL_60:
  return v29;
}

uint64_t __130__HDMedicalUserDomainConceptGenerator__oldestUserDomainConceptForPredicate_profile_transaction_medicalUserDomainConceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 1;
}

+ (id)_fetchGroupByConceptAndLoadRelationshipsWith:(void *)a3 codings:(void *)a4 ontologyTransaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a4;
  v9 = a3;
  v10 = a2;
  objc_opt_self();
  objc_msgSend(MEMORY[0x1E0CB6830], "collectionWithCodings:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "profile");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOntologyConceptManager conceptForCodingCollection:configuration:profile:error:](HDOntologyConceptManager, "conceptForCodingCollection:configuration:profile:error:", v11, v10, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v8, "profile");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "ontologyConceptManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "conceptForIdentifier:options:error:", v14, 5, a5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v17, "groupByConcept");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

uint64_t __117__HDMedicalUserDomainConceptGenerator__enumerateMedicalRecordSamplesWithPredicate_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  const __CFString *v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v8 = HDSQLiteColumnAsInt64();
  if ((_HKValidDataTypeCode() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend((id)objc_msgSend(v9, "dataObjectClass"), "hd_dataEntityClass");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = CFSTR("SkipApplyingConceptIndex");
    v17[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, &v16, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectWithID:encodingOptions:profile:error:", v11, v12, *(_QWORD *)(a1 + 32), a5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      v14 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      v14 = 0;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 100, CFSTR("Type code %ld is not valid"), v8);
    return 0;
  }
  return v14;
}

@end
