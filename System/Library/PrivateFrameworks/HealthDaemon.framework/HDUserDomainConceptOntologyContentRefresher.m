@implementation HDUserDomainConceptOntologyContentRefresher

+ (id)refreshOntologyContentForUserDomainConcept:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
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
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__12;
  v28 = __Block_byref_object_dispose__12;
  v29 = 0;
  objc_msgSend(v11, "ontologyDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __116__HDUserDomainConceptOntologyContentRefresher_refreshOntologyContentForUserDomainConcept_profile_transaction_error___block_invoke;
  v19[3] = &unk_1E6CEA0C0;
  v23 = a1;
  v14 = v10;
  v20 = v14;
  v15 = v11;
  v21 = v15;
  v22 = &v24;
  LODWORD(a6) = objc_msgSend(v13, "performTransactionWithDatabaseTransaction:error:transactionHandler:", v12, a6, v19);

  if ((_DWORD)a6)
    v16 = (void *)v25[5];
  else
    v16 = 0;
  v17 = v16;

  _Block_object_dispose(&v24, 8);
  return v17;
}

uint64_t __116__HDUserDomainConceptOntologyContentRefresher_refreshOntologyContentForUserDomainConcept_profile_transaction_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id obj;

  v4 = a1[4];
  v5 = a1[5];
  v6 = (void *)a1[7];
  v7 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "_determineIfEligibleForRefreshAndPerformRefreshOperationForConcept:profile:ontologyTransaction:outRefreshedUserDomainConcept:error:", v4, v5, a2, &obj, a3);
  objc_storeStrong((id *)(v7 + 40), obj);
  return v8;
}

+ (id)propertyCollectionWithOntologyConcept:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (BOOL)supportsAutomaticGrouperPromotion
{
  return 0;
}

+ (int64_t)resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  return 2;
}

+ (BOOL)performAdditionalCleanupAfterRefreshingUserDomainConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 error:(id *)a6
{
  return 1;
}

+ (BOOL)_determineIfEligibleForRefreshAndPerformRefreshOperationForConcept:(id)a3 profile:(id)a4 ontologyTransaction:(id)a5 outRefreshedUserDomainConcept:(id *)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char v21;
  int64_t v23;
  id v24;
  id v25;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v24 = 0;
  v25 = 0;
  v15 = objc_msgSend(a1, "_isAbleToUpdateUserDomainConcept:outAdditionalCodings:outConceptToRefreshWith:ontologyTransaction:error:", v12, &v25, &v24, v14, a7);
  v16 = v25;
  v17 = v24;
  if (v15 == 1)
  {
    objc_msgSend(a1, "_refreshUserDomainConcept:withOntologyConcept:codings:ontologyTransaction:error:", v12, v17, v16, v14, a7);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    if (v18
      && ((id)v18 == v12
       || (objc_msgSend(v14, "databaseTransaction"),
           v20 = (void *)objc_claimAutoreleasedReturnValue(),
           v23 = +[HDUserDomainConceptEntity storeUserDomainConcept:method:profile:transaction:error:](HDUserDomainConceptEntity, "storeUserDomainConcept:method:profile:transaction:error:", v19, 3, v13, v20, a7), v20, v23)))
    {
      if (a6)
        *a6 = objc_retainAutorelease(v19);
      v21 = objc_msgSend(a1, "performAdditionalCleanupAfterRefreshingUserDomainConcept:profile:ontologyTransaction:error:", v19, v13, v14, a7);
    }
    else
    {
      v21 = 0;
    }

  }
  else
  {
    if (a6)
      *a6 = objc_retainAutorelease(v12);
    v21 = v15 == 2;
  }

  return v21;
}

+ (int64_t)_isAbleToUpdateUserDomainConcept:(id)a3 outAdditionalCodings:(id *)a4 outConceptToRefreshWith:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  int64_t v16;

  v12 = a6;
  v13 = a3;
  objc_msgSend(v13, "firstOntologyCoding");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    v15 = objc_msgSend(a1, "_loadMercuryConceptForRefreshFromUserDomainConcept:ontologyCoding:outConcept:ontologyTransaction:error:", v13, v14, a5, v12, a7);
  else
    v15 = objc_msgSend(a1, "resolveOntologyConceptForRefreshFromUserDomainConceptWithoutOntologyCoding:outAdditionalCodings:outConceptToRefreshWith:ontologyTransaction:error:", v13, a4, a5, v12, a7);
  v16 = v15;

  return v16;
}

+ (int64_t)_loadMercuryConceptForRefreshFromUserDomainConcept:(id)a3 ontologyCoding:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  objc_class *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  int64_t v23;
  id v25;

  v12 = a3;
  v13 = a6;
  v14 = (objc_class *)MEMORY[0x1E0CB64B0];
  v15 = a4;
  v16 = [v14 alloc];
  objc_msgSend(v15, "code");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)objc_msgSend(v16, "initWithRawIdentifier:", objc_msgSend(v17, "integerValue"));
  objc_msgSend(v13, "profile");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "ontologyConceptManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  objc_msgSend(v20, "conceptForIdentifier:options:error:", v18, 4, &v25);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v25;

  if (v21)
  {
    if ((objc_msgSend(a1, "supportsAutomaticGrouperPromotion") & 1) != 0)
    {
      v23 = objc_msgSend(a1, "_performAutomaticGrouperPromotionForConcept:userDomainConcept:outConcept:ontologyTransaction:error:", v21, v12, a5, v13, a7);
    }
    else
    {
      if (a5)
        *a5 = objc_retainAutorelease(v21);
      v23 = 1;
    }
  }
  else if (v22)
  {
    if (a7)
    {
      v23 = 0;
      *a7 = objc_retainAutorelease(v22);
    }
    else
    {
      _HKLogDroppedError();
      v23 = 0;
    }
  }
  else
  {
    v23 = 2;
  }

  return v23;
}

+ (int64_t)_performAutomaticGrouperPromotionForConcept:(id)a3 userDomainConcept:(id)a4 outConcept:(id *)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  int64_t v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  id v31;
  _BYTE buf[24];
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a6;
  v14 = objc_msgSend(a1, "_isAbleToPromoteConceptToGrouper:ontologyTransaction:error:", v11, v13, a7);
  v15 = v14;
  if (v14)
  {
    if (v14 == 2)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

      if (v17)
      {
        HKLogHealthOntology();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v12, "UUID");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "hk_shortRepresentation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          *(_QWORD *)&buf[4] = a1;
          *(_WORD *)&buf[12] = 2114;
          *(_QWORD *)&buf[14] = v20;
          _os_log_impl(&dword_1B7802000, v18, OS_LOG_TYPE_INFO, "%{public}@: UDC %{public}@ is already a grouper concept, so we will not proceed with promoting it, even though this generator class supports automatic grouper promotion.", buf, 0x16u);

        }
      }
      if (a5)
        *a5 = objc_retainAutorelease(v11);
      v15 = 1;
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v33 = __Block_byref_object_copy__12;
      v34 = __Block_byref_object_dispose__12;
      v35 = v11;
      objc_msgSend(v35, "identifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:withSubjectId:](HDOntologyConceptManager, "predicateMatchingConceptsWithRelationshipType:withSubjectId:", 1013, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      +[HDOntologyConceptManager predicateToExcludeSentinel](HDOntologyConceptManager, "predicateToExcludeSentinel");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29840], "compoundPredicateWithPredicate:otherPredicate:", v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = *MEMORY[0x1E0D29968];
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __146__HDUserDomainConceptOntologyContentRefresher__performAutomaticGrouperPromotionForConcept_userDomainConcept_outConcept_ontologyTransaction_error___block_invoke;
      v28[3] = &unk_1E6CEA0E8;
      v31 = a1;
      v29 = v12;
      v30 = buf;
      if (+[HDOntologyConceptManager enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:](HDOntologyConceptManager, "enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:", v24, 4, v25, v13, a7, v28))
      {
        if (a5)
          *a5 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));
        v15 = 1;
      }
      else
      {
        v15 = 0;
      }

      _Block_object_dispose(buf, 8);
    }
  }

  return v15;
}

uint64_t __146__HDUserDomainConceptOntologyContentRefresher__performAutomaticGrouperPromotionForConcept_userDomainConcept_outConcept_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v13;
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogHealthOntology();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 32), "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "hk_shortRepresentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543618;
      v14 = v7;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_1B7802000, v6, OS_LOG_TYPE_INFO, "%{public}@: UDC %{public}@ will be refreshed with a new mercury grouper concept, since this generator class supports automatic grouper concept promotion.", (uint8_t *)&v13, 0x16u);

    }
  }
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v3;

  return 0;
}

+ (int64_t)_isAbleToPromoteConceptToGrouper:(id)a3 ontologyTransaction:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  int64_t v12;
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDOntologyConceptManager predicateMatchingConceptsWithRelationshipType:withObjectId:](HDOntologyConceptManager, "predicateMatchingConceptsWithRelationshipType:withObjectId:", 1013, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v11 = *MEMORY[0x1E0D29968];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __106__HDUserDomainConceptOntologyContentRefresher__isAbleToPromoteConceptToGrouper_ontologyTransaction_error___block_invoke;
  v14[3] = &unk_1E6CEA110;
  v14[4] = &v15;
  if (+[HDOntologyConceptManager enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:](HDOntologyConceptManager, "enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:", v10, 4, v11, v8, a5, v14))
  {
    if (*((_BYTE *)v16 + 24))
      v12 = 1;
    else
      v12 = 2;
  }
  else
  {
    v12 = 0;
  }
  _Block_object_dispose(&v15, 8);

  return v12;
}

uint64_t __106__HDUserDomainConceptOntologyContentRefresher__isAbleToPromoteConceptToGrouper_ontologyTransaction_error___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
  return 0;
}

+ (id)_refreshUserDomainConcept:(id)a3 withOntologyConcept:(id)a4 codings:(id)a5 ontologyTransaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  id v38;
  NSObject *v39;
  _BOOL4 v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  void *v57;
  id v58;
  uint8_t buf[4];
  id v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  __int16 v67;
  void *v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(a1, "propertyCollectionWithOntologyConcept:ontologyTransaction:error:", v13, a6, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v16 = v12;
    v17 = v16;
    if (objc_msgSend(v15, "count") >= 1)
    {
      objc_msgSend(v16, "propertyCollection");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB6D20], "propertyCollectionByMergingCollection:otherCollection:options:", v18, v15, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v16;
      if (v19 != v18)
      {
        _HKInitializeLogging();
        HKLogHealthOntology();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);

        if (v21)
        {
          HKLogHealthOntology();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v16, "UUID");
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "hk_shortRepresentation");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "propertyCollection");
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138544130;
            v60 = a1;
            v61 = 2114;
            v62 = v23;
            v63 = 2048;
            v64 = objc_msgSend(v53, "count");
            v65 = 2048;
            v66 = objc_msgSend(v19, "count");
            _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ with new property collection (%ld -> %ld)", buf, 0x2Au);

          }
        }
        objc_msgSend(v19, "properties");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v16, "copyUserDomainConceptBySettingProperties:", v24);

      }
    }
    if (objc_msgSend(v16, "isAdHocUserDomainConcept") && objc_msgSend(v13, "isAdHoc"))
    {
      v25 = v17;
LABEL_30:

      goto LABEL_31;
    }
    v26 = objc_alloc(MEMORY[0x1E0C99E20]);
    objc_msgSend(v13, "coding");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)objc_msgSend(v26, "initWithObjects:", v27, 0);

    if (v14 && objc_msgSend(v13, "isAdHoc"))
      objc_msgSend(v28, "addObjectsFromArray:", v14);
    objc_msgSend(v17, "codingCollection");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "codingsSet");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v14;
    if (v30 == v28)
    {

    }
    else
    {
      v31 = v30;
      if (!v28)
      {

LABEL_24:
        v38 = v12;
        _HKInitializeLogging();
        HKLogHealthOntology();
        v39 = objc_claimAutoreleasedReturnValue();
        v40 = os_log_type_enabled(v39, OS_LOG_TYPE_INFO);

        if (v40)
        {
          HKLogHealthOntology();
          v41 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v17, "UUID");
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v57, "hk_shortRepresentation");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "codingCollection");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "codingsSet");
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "allObjects");
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v51, "componentsJoinedByString:", CFSTR(", "));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "codingCollection");
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = objc_msgSend(v50, "count");
            objc_msgSend(v28, "allObjects");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "componentsJoinedByString:", CFSTR(", "));
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = objc_msgSend(v28, "count");
            *(_DWORD *)buf = 138544642;
            v60 = a1;
            v61 = 2114;
            v62 = v49;
            v63 = 2112;
            v64 = (uint64_t)v42;
            v65 = 2048;
            v66 = v48;
            v67 = 2112;
            v68 = v44;
            v69 = 2048;
            v70 = v45;
            _os_log_impl(&dword_1B7802000, v41, OS_LOG_TYPE_INFO, "%{public}@: Update UDC %{public}@ with new medical codings set[%@]%ld -> set[%@]%ld", buf, 0x3Eu);

          }
        }
        objc_msgSend(v28, "allObjects");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "userDomainConceptByReplacingCodings:", v46);
        v25 = (id)objc_claimAutoreleasedReturnValue();

        v12 = v38;
        goto LABEL_29;
      }
      objc_msgSend(v17, "codingCollection");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "codingsSet");
      v33 = v15;
      v34 = v13;
      v35 = a1;
      v36 = v12;
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v56 = objc_msgSend(v37, "isEqualToSet:", v28);

      v12 = v36;
      a1 = v35;
      v13 = v34;
      v15 = v33;

      if (!v56)
        goto LABEL_24;
    }
    v25 = v17;
LABEL_29:

    v14 = v58;
    goto LABEL_30;
  }
  v25 = 0;
LABEL_31:

  return v25;
}

@end
