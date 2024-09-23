@implementation HDUserDomainConceptProcessor

- (HDUserDomainConceptProcessor)init
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

+ (BOOL)processUserDomainConceptsAfter:(int64_t)a3 transactionLimit:(int64_t)a4 outAnchor:(int64_t *)a5 outProcessedConceptsCount:(int64_t *)a6 profile:(id)a7 transaction:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  _QWORD v26[4];
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int64_t v39;
  _QWORD v40[3];

  v40[1] = *MEMORY[0x1E0C80C00];
  v15 = a7;
  v16 = a8;
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("sync_anchor"), objc_opt_class(), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = a3;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDUserDomainConceptEntityPredicateForConceptsWithAnchorAfter((uint64_t)v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "userDomainConceptManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __142__HDUserDomainConceptProcessor_processUserDomainConceptsAfter_transactionLimit_outAnchor_outProcessedConceptsCount_profile_transaction_error___block_invoke;
  v26[3] = &unk_1E6CF2578;
  v22 = v15;
  v27 = v22;
  v31 = a1;
  v23 = v16;
  v28 = v23;
  v29 = &v32;
  v30 = &v36;
  v24 = objc_msgSend(v21, "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:transaction:error:enumerationHandler:", v20, 2, a4, v18, v23, a9, v26);

  if (v24)
  {
    if (a6)
      *a6 = v33[3];
    if (a5)
      *a5 = v37[3];
  }

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v24;
}

uint64_t __142__HDUserDomainConceptProcessor_processUserDomainConceptsAfter_transactionLimit_outAnchor_outProcessedConceptsCount_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  char v29;
  NSObject *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  _QWORD *v47;
  void *v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint8_t buf[4];
  uint64_t v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  void *v60;
  _QWORD v61[4];

  v61[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "userDomainConceptEntityRegistry");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v8, "userDomainConceptEntityClassForTypeIdentifier:", v9);

  if (!v10)
  {
    v32 = (void *)MEMORY[0x1E0CB35C8];
    v33 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v6, "identifier");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringWithFormat:", CFSTR("Could not determine User Domain Concept entity class for identifier %@"), v21);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "hk_assignError:code:description:", a4, 100, v34);

    v11 = 0;
    goto LABEL_16;
  }
  v11 = (uint64_t)v6;
  objc_msgSend(*(id *)(a1 + 32), "daemon");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "behavior");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "supportsOntology");

  if (v14)
  {
    v15 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v17 = v15;
    v18 = (id)v11;
    objc_opt_self();
    objc_msgSend(v10, "refreshOntologyContentForUserDomainConcept:profile:transaction:error:", v18, v17, v16, a4);
    v11 = objc_claimAutoreleasedReturnValue();

  }
  if (!v11)
  {
    v21 = 0;
    goto LABEL_16;
  }
  v19 = *(void **)(a1 + 32);
  v20 = *(void **)(a1 + 40);
  v21 = (id)v11;
  v22 = v19;
  v23 = v20;
  v39 = objc_opt_self();
  objc_msgSend(v10, "predicateMatchingSemanticDuplicatesOf:", v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v24)
  {

LABEL_15:
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a3;
    v11 = 1;
    goto LABEL_16;
  }
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("modification_date"), objc_opt_class(), 0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__57;
  v49[4] = __Block_byref_object_dispose__57;
  v40 = v21;
  v50 = v40;
  objc_msgSend(v22, "userDomainConceptManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v61[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 1);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __124__HDUserDomainConceptProcessor__enumerateAndDeduplicateConceptsWithOriginConcept_withEntityClass_profile_transaction_error___block_invoke;
  v43[3] = &unk_1E6CF25A0;
  v46 = &v51;
  v47 = v49;
  v48 = v10;
  v27 = v22;
  v44 = v27;
  v28 = v23;
  v45 = v28;
  v29 = objc_msgSend(v25, "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:transaction:error:enumerationHandler:", v24, 2, 0, v26, v28, a4, v43);

  _HKInitializeLogging();
  HKLogHealthOntology();
  v30 = objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG);

  if ((_DWORD)v26)
  {
    HKLogHealthOntology();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v38 = v52[3];
      objc_msgSend(v40, "UUID");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "hk_shortRepresentation");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v56 = v39;
      v57 = 2048;
      v58 = v38;
      v59 = 2114;
      v60 = v37;
      _os_log_debug_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEBUG, "%{public}@: Enumerated %ld potential duplicates for UDC %{public}@", buf, 0x20u);

    }
  }

  _Block_object_dispose(v49, 8);
  _Block_object_dispose(&v51, 8);

  if ((v29 & 1) != 0)
    goto LABEL_15;
  v11 = 0;
  v21 = v40;
LABEL_16:

  return v11;
}

uint64_t __124__HDUserDomainConceptProcessor__enumerateAndDeduplicateConceptsWithOriginConcept_withEntityClass_profile_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v6 = a2;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {

  }
  else
  {
    v9 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "isSemanticallyEquivalent:", v6);

    if (v9)
    {
      objc_msgSend(*(id *)(a1 + 64), "deduplicateUserDomainConcept:with:profile:transaction:error:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v6, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a4);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(void **)(v11 + 40);
      *(_QWORD *)(v11 + 40) = v10;

      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      {
        v13 = 0;
        goto LABEL_6;
      }
    }
  }
  v13 = 1;
LABEL_6:

  return v13;
}

@end
