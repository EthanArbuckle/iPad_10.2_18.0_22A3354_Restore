@implementation HDUserDomainConceptAPIObjectManager

+ (BOOL)generateAPIObjectForUserDomainConcept:(id)a3 apiObjectOut:(id *)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  char v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v10, "daemon");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "userDomainConceptEntityRegistry");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "userDomainConceptEntityClassForTypeIdentifier:", v13);

  if (v14)
  {
    v26 = 0;
    v27 = &v26;
    v28 = 0x3032000000;
    v29 = __Block_byref_object_copy__123;
    v30 = __Block_byref_object_dispose__123;
    v31 = 0;
    objc_msgSend(v10, "database");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __104__HDUserDomainConceptAPIObjectManager_generateAPIObjectForUserDomainConcept_apiObjectOut_profile_error___block_invoke;
    v22[3] = &unk_1E6CFD3C8;
    v25 = v14;
    v23 = v9;
    v24 = &v26;
    v16 = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v15, a6, v22);

    v17 = !v16;
    if (!a4)
      v17 = 1;
    if ((v17 & 1) == 0)
      *a4 = objc_retainAutorelease((id)v27[5]);

    _Block_object_dispose(&v26, 8);
  }
  else
  {
    v18 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v9, "description");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "hk_error:format:", 100, CFSTR("User Domain Concept entity was not ever registered for identifier %@"), v19);
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      if (a6)
        *a6 = objc_retainAutorelease(v20);
      else
        _HKLogDroppedError();
    }

    v16 = 0;
  }

  return v16;
}

uint64_t __104__HDUserDomainConceptAPIObjectManager_generateAPIObjectForUserDomainConcept_apiObjectOut_profile_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v4 = (void *)a1[6];
  v5 = a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "generateAPIObjectForUserDomainConcept:apiObjectOut:transaction:error:", v5, &obj, a2, a3);
  objc_storeStrong((id *)(v6 + 40), obj);
  return v7;
}

+ (id)allAPIObjectsFromUserDomainConceptsWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v6, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke;
  v14[3] = &unk_1E6CE9280;
  v16 = v7;
  v17 = a1;
  v15 = v6;
  v9 = v7;
  v10 = v6;
  LODWORD(a4) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDUserDomainConceptEntity, "performReadTransactionWithHealthDatabase:error:block:", v8, a4, v14);

  if ((_DWORD)a4)
    v11 = v9;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

uint64_t __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "userDomainConceptManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke_2;
  v11[3] = &unk_1E6CFD3F0;
  v7 = *(void **)(a1 + 40);
  v15 = *(_QWORD *)(a1 + 48);
  v12 = v7;
  v13 = *(id *)(a1 + 32);
  v14 = v5;
  v8 = v5;
  v9 = objc_msgSend(v6, "enumerateUserDomainConceptsWithPredicate:enumerationOptions:limit:orderingTerms:transaction:error:enumerationHandler:", 0, 0, 0, 0, v8, a3, v11);

  return v9;
}

uint64_t __92__HDUserDomainConceptAPIObjectManager_allAPIObjectsFromUserDomainConceptsWithProfile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 56), "_enumerateConceptDeriveAPIObjectAndAddToResults:mutableResults:profile:transaction:error:", a2, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a4);
}

+ (BOOL)_enumerateConceptDeriveAPIObjectAndAddToResults:(id)a3 mutableResults:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v24;

  v11 = a4;
  v12 = a6;
  v13 = a3;
  objc_msgSend(a5, "daemon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userDomainConceptEntityRegistry");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "userDomainConceptEntityClassForTypeIdentifier:", v16);

  if (v17)
  {
    v24 = 0;
    LODWORD(a7) = objc_msgSend(v17, "generateAPIObjectForUserDomainConcept:apiObjectOut:transaction:error:", v13, &v24, v12, a7);

    v18 = v24;
    if ((_DWORD)a7)
      objc_msgSend(v11, "hk_addNonNilObject:", v18);

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0CB35C8];
    v20 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v13, "identifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "stringWithFormat:", CFSTR("Could not determine User Domain Concept entity class for identifier %@"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "hk_assignError:code:description:", a7, 100, v22);

    LOBYTE(a7) = 0;
  }

  return (char)a7;
}

@end
