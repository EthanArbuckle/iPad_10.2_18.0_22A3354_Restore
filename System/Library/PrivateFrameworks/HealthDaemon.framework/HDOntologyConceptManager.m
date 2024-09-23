@implementation HDOntologyConceptManager

- (HDOntologyConceptManager)init
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

- (HDOntologyConceptManager)initWithProfile:(id)a3
{
  id v4;
  HDOntologyConceptManager *v5;
  HDOntologyConceptManager *v6;
  HDDatabaseValueCache *v7;
  void *v8;
  uint64_t v9;
  HDDatabaseValueCache *conceptsByIdentifier;
  NSMutableDictionary *v11;
  NSMutableDictionary *attributeIdentifierByCodingSystemURN;
  id WeakRetained;
  void *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HDOntologyConceptManager;
  v5 = -[HDOntologyConceptManager init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    v7 = [HDDatabaseValueCache alloc];
    -[HDOntologyConceptManager hk_classNameWithTag:](v6, "hk_classNameWithTag:", CFSTR("concepts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[HDDatabaseValueCache initWithName:cacheScope:](v7, "initWithName:cacheScope:", v8, 1);
    conceptsByIdentifier = v6->_conceptsByIdentifier;
    v6->_conceptsByIdentifier = (HDDatabaseValueCache *)v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    attributeIdentifierByCodingSystemURN = v6->_attributeIdentifierByCodingSystemURN;
    v6->_attributeIdentifierByCodingSystemURN = v11;

    v6->_attributeIdentifierByCodingSystemURNLock._os_unfair_lock_opaque = 0;
    WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    objc_msgSend(WeakRetained, "daemon");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "registerForDaemonReady:", v6);

  }
  return v6;
}

- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v8 = (void *)MEMORY[0x1E0C99D20];
  v9 = a3;
  objc_msgSend(v8, "arrayWithObjects:count:", &v14, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDOntologyConceptManager conceptsForIdentifiers:options:error:](self, "conceptsForIdentifiers:options:error:", v10, a4, a5, v14, v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "firstObject");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)conceptForIdentifier:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v10 = (void *)MEMORY[0x1E0C99D20];
  v11 = a5;
  v12 = a3;
  objc_msgSend(v10, "arrayWithObjects:count:", &v17, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[HDOntologyConceptManager conceptsForIdentifiers:options:transaction:error:](self, "conceptsForIdentifiers:options:transaction:error:", v13, a4, v11, a6, v17, v18);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__134;
  v23 = __Block_byref_object_dispose__134;
  v24 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "ontologyDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __65__HDOntologyConceptManager_conceptsForIdentifiers_options_error___block_invoke;
  v15[3] = &unk_1E6CFF5E8;
  v17 = &v19;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v18 = a4;
  LODWORD(a5) = objc_msgSend(v10, "performTransactionWithError:transactionHandler:", a5, v15);

  if ((_DWORD)a5)
    v12 = (void *)v20[5];
  else
    v12 = 0;
  v13 = v12;

  _Block_object_dispose(&v19, 8);
  return v13;
}

BOOL __65__HDOntologyConceptManager_conceptsForIdentifiers_options_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "conceptsForIdentifiers:options:transaction:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) != 0;
}

- (id)conceptsForIdentifiers:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  HDDatabaseValueCache *conceptsByIdentifier;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  void *v35;
  int v36;
  id v37;
  HDDatabaseValueCache *v38;
  void *v39;
  void *v40;
  void *v41;
  id v43;
  id obj;
  id obja;
  id v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  id v58;
  unint64_t v59;
  id v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v62;
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v62 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * i);
        conceptsByIdentifier = self->_conceptsByIdentifier;
        objc_msgSend(v9, "databaseTransaction");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = 0;
        v57[0] = MEMORY[0x1E0C809B0];
        v57[1] = 3221225472;
        v57[2] = __77__HDOntologyConceptManager_conceptsForIdentifiers_options_transaction_error___block_invoke;
        v57[3] = &unk_1E6CFF610;
        v57[4] = v15;
        v59 = a4;
        v58 = v9;
        -[HDDatabaseValueCache fetchObjectForKey:transaction:error:faultHandler:](conceptsByIdentifier, "fetchObjectForKey:transaction:error:faultHandler:", v15, v17, &v60, v57);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v60;

        if (v18)
        {
          objc_msgSend(obj, "addObject:", v18);
        }
        else if (v19)
        {
          if (a6)
            *a6 = objc_retainAutorelease(v19);
          else
            _HKLogDroppedError();
          v29 = obj;

          v41 = 0;
          goto LABEL_38;
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
      if (v12)
        continue;
      break;
    }
  }

  if (a4)
  {
    v43 = v10;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v22 = obj;
    v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
    if (v23)
    {
      v24 = v23;
      v25 = *(_QWORD *)v54;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v54 != v25)
            objc_enumerationMutation(v22);
          v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * j);
          if ((a4 & ~objc_msgSend(v27, "options")) != 0)
            v28 = v21;
          else
            v28 = v20;
          objc_msgSend(v28, "addObject:", v27);
        }
        v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v53, v66, 16);
      }
      while (v24);
    }

    v29 = v20;
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    obja = v21;
    v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v50;
      while (2)
      {
        for (k = 0; k != v31; ++k)
        {
          if (*(_QWORD *)v50 != v32)
            objc_enumerationMutation(obja);
          v34 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * k);
          objc_msgSend(v34, "identifier");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = 0;
          v36 = +[HDOntologyConceptManager _conceptWithIdentifier:options:transaction:conceptOut:error:]((uint64_t)HDOntologyConceptManager, v35, a4, v9, &v48, (uint64_t)a6);
          v37 = v48;

          if (!v36)
          {

            v41 = 0;
            v10 = v43;
            goto LABEL_38;
          }
          objc_msgSend(v29, "hk_addNonNilObject:", v37);
          v38 = self->_conceptsByIdentifier;
          objc_msgSend(v34, "identifier");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "databaseTransaction");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          -[HDDatabaseValueCache setObject:forKey:transaction:](v38, "setObject:forKey:transaction:", v37, v39, v40);

        }
        v31 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v49, v65, 16);
        if (v31)
          continue;
        break;
      }
    }

    v10 = v43;
  }
  else
  {
    v29 = obj;
  }
  v29 = v29;
  v41 = v29;
LABEL_38:

  return v41;
}

id __77__HDOntologyConceptManager_conceptsForIdentifiers_options_transaction_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  id v10;
  id v12;

  v5 = (void *)a1[5];
  v4 = a1[6];
  v6 = (void *)a1[4];
  v12 = 0;
  v7 = +[HDOntologyConceptManager _conceptWithIdentifier:options:transaction:conceptOut:error:]((uint64_t)HDOntologyConceptManager, v6, v4, v5, &v12, a3);
  v8 = v12;
  v9 = v8;
  if (!v7)
    v8 = 0;
  v10 = v8;

  return v10;
}

+ (uint64_t)_conceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(_QWORD *)a5 conceptOut:(uint64_t)a6 error:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  void *v31;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  _QWORD v42[4];
  id v43;
  _QWORD *v44;
  uint64_t v45;
  unint64_t v46;
  _QWORD v47[4];
  _QWORD *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  id v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  objc_opt_self();
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__134;
  v40 = __Block_byref_object_dispose__134;
  v41 = 0;
  v31 = v7;
  v53 = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v53, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __88__HDOntologyConceptManager__conceptWithIdentifier_options_transaction_conceptOut_error___block_invoke;
  v35[3] = &unk_1E6CEA110;
  v35[4] = &v36;
  v10 = v9;
  v11 = v8;
  v12 = v35;
  v30 = objc_opt_self();
  v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  v15 = v10;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v50;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v50 != v17)
          objc_enumerationMutation(v15);
        v19 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "isAdHoc");
        objc_msgSend(v19, "numberRepresentation");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v20)
          v22 = v14;
        else
          v22 = v13;
        objc_msgSend(v22, "addObject:", v21);

      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v16);
  }

  if (!objc_msgSend(v14, "count"))
    goto LABEL_22;
  objc_msgSend(v11, "profile");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = MEMORY[0x1E0C809B0];
  v47[1] = 3221225472;
  v47[2] = __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke;
  v47[3] = &unk_1E6CFF7C8;
  v48 = v12;
  v24 = +[HDAdHocConceptEntity enumerateAdHocConceptWithRawIdentifiers:options:profile:error:enumerationHandler:](HDAdHocConceptEntity, "enumerateAdHocConceptWithRawIdentifiers:options:profile:error:enumerationHandler:", v14, a3, v23, a6, v47);

  if (!v24)
  {
    v28 = 0;
  }
  else
  {
LABEL_22:
    if (objc_msgSend(v13, "count"))
    {
      objc_msgSend(v11, "graphDatabase");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      HDSimpleGraphDatabaseNodeEntityPredicateForIdentifiers((uint64_t)v13);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = *MEMORY[0x1E0D29968];
      v42[0] = MEMORY[0x1E0C809B0];
      v42[1] = 3221225472;
      v42[2] = __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke_2;
      v42[3] = &unk_1E6CFF7F0;
      v45 = v30;
      v46 = a3;
      v43 = v11;
      v44 = v12;
      v28 = objc_msgSend(v25, "enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:", v26, (a3 >> 1) & 1, v27, a6, v42);

    }
    else
    {
      v28 = 1;
    }
  }

  if (a5)
    *a5 = objc_retainAutorelease((id)v37[5]);
  _Block_object_dispose(&v36, 8);

  return v28;
}

+ (id)conceptForCodingCollection:(id)a3 configuration:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  NSObject *v24;
  id v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  uint64_t *v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__134;
  v39 = __Block_byref_object_dispose__134;
  v40 = 0;
  objc_msgSend(v12, "daemon");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "ontologyConfigurationProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "countryCode");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "ontologyConfigurationForCountryCode:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDDatabaseTransactionContext contextForWritingProtectedData](HDDatabaseTransactionContext, "contextForWritingProtectedData");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke;
  v28[3] = &unk_1E6CFF660;
  v19 = v12;
  v29 = v19;
  v20 = v16;
  v30 = v20;
  v21 = v10;
  v31 = v21;
  v33 = &v35;
  v22 = v11;
  v32 = v22;
  v34 = a1;
  LOBYTE(a6) = objc_msgSend(v17, "performTransactionWithContext:error:block:inaccessibilityHandler:", v18, a6, v28, 0);

  if ((a6 & 1) != 0)
  {
    v23 = (id)v36[5];
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      v26 = (id)objc_claimAutoreleasedReturnValue();
      HKSensitiveLogItem();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v42 = v26;
      v43 = 2112;
      v44 = v27;
      v45 = 2112;
      v46 = 0;
      _os_log_error_impl(&dword_1B7802000, v24, OS_LOG_TYPE_ERROR, "Error resolving concept for context: %@, country: %@, error: %@", buf, 0x20u);

    }
    v23 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v23;
}

uint64_t __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  __int128 v11;
  _QWORD v12[4];
  id v13;
  id v14;
  __int128 v15;
  uint64_t v16;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "ontologyDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_2;
  v12[3] = &unk_1E6CFF638;
  v13 = *(id *)(a1 + 40);
  v14 = *(id *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 56);
  v8 = (id)v11;
  v15 = v11;
  v16 = *(_QWORD *)(a1 + 72);
  v9 = objc_msgSend(v7, "performTransactionWithDatabaseTransaction:error:transactionHandler:", v6, a3, v12);

  return v9;
}

BOOL __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_2(uint64_t a1, void *a2, _QWORD *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  unint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  id v66;
  id v67;
  void *v68;
  id v69;
  uint64_t v70;
  void *v71;
  _BOOL8 v72;
  void *v73;
  uint64_t v74;
  id v75;
  id v76;
  void *v77;
  void *v78;
  id v79;
  void *v80;
  id v81;
  id v82;
  uint64_t v83;
  void *v84;
  id v85;
  void *v86;
  id v87;
  void *v88;
  id v91;
  id v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  id obj;
  uint64_t v98;
  uint64_t v99;
  id v100;
  id v101;
  void *v102;
  void *v103;
  id v104;
  id v105;
  _QWORD v106[4];
  id v107;
  id v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t (*v121)(uint64_t, uint64_t);
  void (*v122)(uint64_t);
  id v123;
  id v124[18];

  v124[16] = *(id *)MEMORY[0x1E0C80C00];
  v4 = a2;
  v94 = a1;
  objc_msgSend(*(id *)(a1 + 32), "supportedCodingSystems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "codings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v106[0] = MEMORY[0x1E0C809B0];
  v106[1] = 3221225472;
  v106[2] = __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_3;
  v106[3] = &unk_1E6CF5850;
  v91 = v5;
  v107 = v91;
  objc_msgSend(v6, "hk_filter:", v106);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(v94 + 48);
  v105 = 0;
  v9 = v7;
  v101 = v8;
  v100 = v4;
  objc_opt_self();
  v109 = 0u;
  v110 = 0u;
  v111 = 0u;
  v112 = 0u;
  obj = v9;
  v99 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
  if (!v99)
  {

    v10 = 0;
    goto LABEL_47;
  }
  v95 = 0;
  v10 = 0;
  v11 = 0;
  v98 = *(_QWORD *)v110;
  v96 = *MEMORY[0x1E0D29968];
  do
  {
    v12 = 0;
    v13 = v10;
    v104 = v11;
    do
    {
      v102 = v13;
      if (*(_QWORD *)v110 != v98)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v109 + 1) + 8 * v12);
      v15 = objc_msgSend(v101, "options");
      v108 = 0;
      v16 = v14;
      v17 = v100;
      v18 = objc_opt_self();
      v118 = 0;
      v119 = (uint64_t)&v118;
      v120 = 0x3032000000;
      v121 = __Block_byref_object_copy__134;
      v122 = __Block_byref_object_dispose__134;
      v123 = 0;
      objc_msgSend(v17, "profile");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "ontologyConceptManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "codingSystem");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "attributeIdentifierForCodingSystem:", v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        v23 = objc_msgSend(v22, "longLongValue");
        objc_msgSend(v16, "code");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        HDSimpleGraphDatabaseNodeEntityPredicateForAttribute(v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "graphDatabase");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v113 = MEMORY[0x1E0C809B0];
        v114 = 3221225472;
        v115 = (uint64_t)__76__HDOntologyConceptManager__findConceptForCoding_options_transaction_error___block_invoke;
        v116 = (uint64_t)&unk_1E6CFF750;
        v117 = &v118;
        LOBYTE(v23) = objc_msgSend(v26, "enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:", v25, (v15 >> 1) & 1, v96, &v108, &v113);

        if ((v23 & 1) != 0)
        {
          v27 = *(void **)(v119 + 40);
          if (v27)
          {
            +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](v18, v27, v15, v17, (uint64_t)&v108);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_13;
          }
          v30 = (void *)MEMORY[0x1E0CB35C8];
          HKSensitiveLogItem();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "hk_assignError:code:format:", &v108, 118, CFSTR("Failed to find concept for coding %@."), v31);

        }
      }
      else
      {
        v29 = (void *)MEMORY[0x1E0CB35C8];
        HKSensitiveLogItem();
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "hk_assignError:code:format:", &v108, 118, CFSTR("Failed to find concept for coding %@ (attribute identifier not found)."), v25);
      }
      v28 = 0;
LABEL_13:

      _Block_object_dispose(&v118, 8);
      v32 = v108;
      v103 = v32;
      if (!v28)
      {
        if ((objc_msgSend(v32, "hk_isObjectNotFoundError") & 1) == 0)
        {
          v67 = v103;
          v68 = v67;
          if (v67)
            v105 = objc_retainAutorelease(v67);

          goto LABEL_53;
        }
LABEL_19:
        v10 = v102;
        v11 = v104;
        goto LABEL_20;
      }
      if ((objc_msgSend(v28, "isNebulous") & 1) != 0)
        goto LABEL_19;
      objc_msgSend(v28, "validInRegions");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v101, "countryCode");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v33, "containsObject:", v34);

      if (!v35)
        goto LABEL_19;
      v36 = v17;
      v37 = v28;
      objc_opt_self();
      v38 = v37;
      v39 = v36;
      objc_opt_self();
      v113 = 0;
      v114 = (uint64_t)&v113;
      v115 = 0x2020000000;
      v116 = 0x7FFFFFFFFFFFFFFFLL;
      v40 = (void *)MEMORY[0x1E0D29890];
      v41 = (void *)MEMORY[0x1E0D29838];
      objc_msgSend(v38, "identifier");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "numberRepresentation");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "predicateWithProperty:equalToValue:", CFSTR("subject_id"), v43);
      v44 = objc_claimAutoreleasedReturnValue();
      HDSimpleGraphRelationshipEntityPredicateForRelationshipType(1013);
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "compoundPredicateWithPredicate:otherPredicate:", v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v39, "graphDatabase");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "underlyingDatabase");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = MEMORY[0x1E0C809B0];
      v119 = 3221225472;
      v120 = (uint64_t)__74__HDOntologyConceptManager__grouperConceptIDForConcept_transaction_error___block_invoke;
      v121 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6CFF778;
      v122 = (void (*)(uint64_t))&v113;
      LOBYTE(v44) = +[HDSimpleGraphDatabaseRelationshipEntity enumerateRelationshipsWithPredicate:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseRelationshipEntity, "enumerateRelationshipsWithPredicate:skipDeleted:database:error:enumerationHandler:", v46, 1, v48, &v105, &v118);

      if ((v44 & 1) != 0)
        v49 = *(_QWORD *)(v114 + 24);
      else
        v49 = 0;

      _Block_object_dispose(&v113, 8);
      if (!v49)
      {
LABEL_52:
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v105, 1002, CFSTR("Inconsistent grouper concepts encountered. Unable to resolve concept for codings: %@, configuration: %@"), obj, v101);
        goto LABEL_53;
      }
      if (v95)
      {
        if (v49 != v95)
          goto LABEL_52;
      }
      else
      {
        v95 = v49;
      }
      v50 = v101;
      v11 = v104;
      v10 = v102;
      v51 = v38;
      v52 = v16;
      objc_opt_self();
      if (!v10 || !v11)
      {

LABEL_33:
        v53 = v51;

        v50 = v10;
        v10 = v52;
        v11 = v53;
LABEL_34:

        goto LABEL_20;
      }
      if (objc_msgSend(v51, "isEqual:", v11))
      {

        goto LABEL_34;
      }
      v93 = v50;
      objc_opt_self();
      v54 = objc_msgSend(v93, "recordCategoryType");

      v55 = (void *)MEMORY[0x1E0C9AA60];
      if ((unint64_t)(v54 - 1) <= 9)
        v55 = (void *)qword_1E6CFF8D8[v54 - 1];
      v92 = v55;
      objc_msgSend(v10, "codingSystem");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "identifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "indexOfObject:", v57);

      objc_msgSend(v52, "codingSystem");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "identifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v92, "indexOfObject:", v59);

      v60 = HKCompareIntegers();
      if (!v60)
      {
        objc_msgSend(v11, "preferredName");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "length");
        objc_msgSend(v51, "preferredName");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "length");
        v60 = HKCompareIntegers();

        if (!v60)
        {
          objc_msgSend(v51, "identifier");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v63, "rawIdentifier");
          objc_msgSend(v11, "identifier");
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v64, "rawIdentifier");
          v60 = HKCompareIntegers();

        }
      }

      if (v60 == -1)
        goto LABEL_33;
      if (!v60)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v105, 1002, CFSTR("Multiple concepts of equal priority encountered. Unable to resolve concept for codings: %@, configuration: %@"), obj, v93);
LABEL_53:

        v66 = 0;
        v10 = v102;
        goto LABEL_54;
      }
LABEL_20:

      ++v12;
      v13 = v10;
      v104 = v11;
    }
    while (v99 != v12);
    v65 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v109, v124, 16);
    v99 = v65;
  }
  while (v65);

  if (v11)
    goto LABEL_48;
LABEL_47:
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v105, 118, CFSTR("Unable to find valid concept for codings: %@, configuration: %@"), obj, v101);
  v11 = 0;
LABEL_48:
  v104 = v11;
  v66 = v104;
LABEL_54:

  v69 = v105;
  v70 = *(_QWORD *)(*(_QWORD *)(v94 + 56) + 8);
  v71 = *(void **)(v70 + 40);
  *(_QWORD *)(v70 + 40) = v66;

  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v94 + 56) + 8) + 40))
  {
    v72 = 1;
    goto LABEL_72;
  }
  if ((objc_msgSend(v69, "hk_isHealthKitErrorWithCode:", 118) & 1) != 0
    || (objc_msgSend(v69, "hk_isHealthKitErrorWithCode:", 1002) & 1) != 0)
  {
    v73 = *(void **)(v94 + 40);
    v74 = objc_msgSend(*(id *)(v94 + 48), "options");
    v75 = v73;
    v76 = v100;
    objc_opt_self();
    objc_msgSend(v76, "profile");
    v77 = (void *)objc_claimAutoreleasedReturnValue();

    v124[0] = 0;
    +[HDAdHocConceptEntity adHocConceptForCodingCollection:options:profile:error:](HDAdHocConceptEntity, "adHocConceptForCodingCollection:options:profile:error:", v75, v74, v77, v124);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = v124[0];
    v80 = v79;
    if (v78)
    {
      v81 = v78;
      goto LABEL_62;
    }
    if ((objc_msgSend(v79, "hk_isHealthKitErrorWithCode:", 118) & 1) != 0)
    {
      +[HDAdHocConceptEntity generateAdHocConceptForCodingCollection:options:profile:error:](HDAdHocConceptEntity, "generateAdHocConceptForCodingCollection:options:profile:error:", v75, v74, v77, a3);
      v81 = (id)objc_claimAutoreleasedReturnValue();
LABEL_62:
      v82 = v81;
    }
    else
    {
      v87 = v80;
      v88 = v87;
      if (v87)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v87);
        else
          _HKLogDroppedError();
      }

      v82 = 0;
    }

    v83 = *(_QWORD *)(*(_QWORD *)(v94 + 56) + 8);
    v84 = *(void **)(v83 + 40);
    *(_QWORD *)(v83 + 40) = v82;

    v72 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v94 + 56) + 8) + 40) != 0;
    goto LABEL_72;
  }
  v85 = v69;
  v86 = v85;
  if (v85)
  {
    if (a3)
      *a3 = objc_retainAutorelease(v85);
    else
      _HKLogDroppedError();
  }

  v72 = 0;
LABEL_72:

  return v72;
}

uint64_t __83__HDOntologyConceptManager_conceptForCodingCollection_configuration_profile_error___block_invoke_3(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "codingSystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

+ (id)relationshipsForConceptWithIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
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
  v22 = __Block_byref_object_copy__134;
  v23 = __Block_byref_object_dispose__134;
  v24 = 0;
  objc_msgSend(v9, "ontologyDatabase");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__HDOntologyConceptManager_relationshipsForConceptWithIdentifier_profile_error___block_invoke;
  v15[3] = &unk_1E6CFF688;
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

BOOL __80__HDOntologyConceptManager_relationshipsForConceptWithIdentifier_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  +[HDOntologyConceptManager _relationshipsForConceptWithIdentifier:options:transaction:error:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32), 0, a2, a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

+ (id)_relationshipsForConceptWithIdentifier:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  BOOL (*v21)(uint64_t, void *, uint64_t);
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;

  v8 = a4;
  v9 = a2;
  v10 = objc_opt_self();
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = (a3 >> 3) & 1;
  objc_msgSend(v8, "graphDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "rawIdentifier");

  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __93__HDOntologyConceptManager__relationshipsForConceptWithIdentifier_options_transaction_error___block_invoke;
  v22 = &unk_1E6CFF818;
  v25 = v10;
  v26 = a3;
  v23 = v8;
  v15 = v11;
  v24 = v15;
  v16 = v8;
  LODWORD(a5) = objc_msgSend(v13, "enumerateRelationshipsWithSubjectID:includeDeleted:error:enumerationHandler:", v14, v12, a5, &v19);

  if ((_DWORD)a5)
    v17 = (void *)objc_msgSend(v15, "copy", v19, v20, v21, v22, v23, v24, v25, v26);
  else
    v17 = 0;

  return v17;
}

+ (BOOL)enumerateRelationshipsMatchingPredicate:(id)a3 options:(unint64_t)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  unint64_t v24;

  v12 = a5;
  v13 = a7;
  v14 = (a4 >> 3) & 1;
  v15 = a3;
  objc_msgSend(v12, "graphDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __113__HDOntologyConceptManager_enumerateRelationshipsMatchingPredicate_options_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6CFF6B0;
  v23 = a1;
  v24 = a4;
  v21 = v12;
  v22 = v13;
  v17 = v13;
  v18 = v12;
  LOBYTE(a6) = objc_msgSend(v16, "enumerateRelationshipsForPredicate:includeDeleted:error:enumerationHandler:", v15, v14, a6, v20);

  return (char)a6;
}

uint64_t __113__HDOntologyConceptManager_enumerateRelationshipsMatchingPredicate_options_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL4 v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v9;

  v9 = 0;
  v4 = +[HDOntologyConceptManager _conceptRelationshipFromGraphRelationship:relationshipOut:options:transaction:error:](*(_QWORD *)(a1 + 48), a2, &v9, *(_QWORD *)(a1 + 56), *(void **)(a1 + 32), a3);
  v5 = v9;
  v6 = v5;
  if (v4)
  {
    if (v5)
      v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (BOOL)_conceptRelationshipFromGraphRelationship:(_QWORD *)a3 relationshipOut:(uint64_t)a4 options:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  void *v18;

  v10 = a2;
  v11 = a5;
  v12 = objc_opt_self();
  objc_msgSend(v11, "graphDatabase");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "nodeForID:error:", objc_msgSend(v10, "objectID"), a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    if ((a4 & 2) != 0 || (objc_msgSend(v14, "isDeleted") & 1) == 0)
    {
      +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](v12, v14, a4 & 0xFFFFFFFFFFFFFFFELL, v11, a6);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16 != 0;
      if (v16)
      {
        v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64C0]), "initWithType:destination:version:deleted:", objc_msgSend(v10, "type"), v16, objc_msgSend(v10, "version"), objc_msgSend(v10, "isDeleted"));
        v18 = v17;
        if (a3)
          *a3 = objc_retainAutorelease(v17);

      }
    }
    else
    {
      v15 = 1;
    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 profile:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;

  v10 = a3;
  v11 = a6;
  objc_msgSend(a4, "ontologyDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __96__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_profile_error_enumerationHandler___block_invoke;
  v16[3] = &unk_1E6CFF6D8;
  v18 = v11;
  v19 = a1;
  v17 = v10;
  v13 = v11;
  v14 = v10;
  LOBYTE(a5) = objc_msgSend(v12, "performTransactionWithError:transactionHandler:", a5, v16);

  return (char)a5;
}

uint64_t __96__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_profile_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "enumerateConceptsMatchingPredicate:options:limit:transaction:error:enumerationHandler:", *(_QWORD *)(a1 + 32), 1, *MEMORY[0x1E0D29968], a2, a3, *(_QWORD *)(a1 + 40));
}

+ (BOOL)enumerateConceptsMatchingPredicate:(id)a3 options:(unint64_t)a4 limit:(unint64_t)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  id v13;
  id v14;
  unint64_t v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  unint64_t v24;

  v13 = a6;
  v14 = a8;
  v15 = (a4 >> 1) & 1;
  v16 = a3;
  objc_msgSend(v13, "graphDatabase");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __114__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_options_limit_transaction_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6CFF700;
  v23 = v14;
  v24 = a4;
  v22 = v13;
  v18 = v14;
  v19 = v13;
  LOBYTE(a7) = objc_msgSend(v17, "enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:", v16, v15, a5, a7, v21);

  return (char)a7;
}

uint64_t __114__HDOntologyConceptManager_enumerateConceptsMatchingPredicate_options_limit_transaction_error_enumerationHandler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:]((uint64_t)HDOntologyConceptManager, a2, *(_QWORD *)(a1 + 48), *(void **)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return v5;
}

+ (id)_conceptFromGraphNode:(unint64_t)a3 options:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[4];
  id v22;

  v8 = a2;
  v9 = a4;
  v10 = objc_opt_self();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", sel__conceptFromGraphNode_options_transaction_error_, v10, CFSTR("HDOntologyConceptManager.m"), 803, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("node"));

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v9, "graphDatabase");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "rowID");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__HDOntologyConceptManager__conceptFromGraphNode_options_transaction_error___block_invoke;
  v21[3] = &unk_1E6CFF7A0;
  v14 = v11;
  v22 = v14;
  v15 = objc_msgSend(v12, "enumerateAttributesForNodeWithID:includeDeleted:error:enumerationHandler:", v13, (a3 >> 2) & 1, a5, v21);

  if (v15)
  {
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", objc_msgSend(v8, "rowID"));
    if ((a3 & 1) != 0)
    {
      +[HDOntologyConceptManager _relationshipsForConceptWithIdentifier:options:transaction:error:](v10, v16, a3, v9, a5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v18 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      v17 = 0;
    }
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64A0]), "initWithIdentifier:attributes:relationships:version:deleted:options:", v16, v14, v17, objc_msgSend(v8, "version"), objc_msgSend(v8, "isDeleted"), a3);

LABEL_9:
    goto LABEL_10;
  }
  v18 = 0;
LABEL_10:

  return v18;
}

+ (BOOL)followRelationshipsWithTypes:(id)a3 startingIdentifier:(id)a4 options:(unint64_t)a5 ontologyTransaction:(id)a6 conceptOut:(id *)a7 deletedRelationshipVersionOut:(int64_t *)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v28;
  id v30;
  id obj;
  char v33;
  id v34;
  _QWORD v35[5];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v34 = a6;
  if (!objc_msgSend(v14, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDOntologyConceptManager.m"), 333, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("relationshipTypes.count > 0"));

  }
  v30 = v15;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v14;
  v16 = 0;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
  if (v17)
  {
    v18 = a5 & 0xFFFFFFFFFFFFFFFELL;
    v19 = *(_QWORD *)v43;
    v20 = v30;
LABEL_5:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v43 != v19)
        objc_enumerationMutation(obj);
      +[HDOntologyConceptManager predicateMatchingRelationshipsWithSubjectId:relationshipType:](HDOntologyConceptManager, "predicateMatchingRelationshipsWithSubjectId:relationshipType:", v20, objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * v21), "integerValue"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 0;
      v37 = &v36;
      v38 = 0x3032000000;
      v39 = __Block_byref_object_copy__134;
      v40 = __Block_byref_object_dispose__134;
      v41 = 0;
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __151__HDOntologyConceptManager_followRelationshipsWithTypes_startingIdentifier_options_ontologyTransaction_conceptOut_deletedRelationshipVersionOut_error___block_invoke;
      v35[3] = &unk_1E6CFF728;
      v35[4] = &v36;
      if (+[HDOntologyConceptManager enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:](HDOntologyConceptManager, "enumerateRelationshipsMatchingPredicate:options:transaction:error:enumerationHandler:", v22, v18, v34, a9, v35))
      {
        v23 = (void *)v37[5];
        if (!v23)
          goto LABEL_14;
        if (!objc_msgSend(v23, "isDeleted"))
        {
          objc_msgSend((id)v37[5], "destination");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "identifier");
          v26 = objc_claimAutoreleasedReturnValue();

          v24 = 1;
          v20 = (void *)v26;
          v16 = v25;
          goto LABEL_17;
        }
        if (a8)
        {
          v24 = 0;
          *a8 = objc_msgSend((id)v37[5], "version");
        }
        else
        {
LABEL_14:
          v24 = 0;
        }
        v33 = 1;
      }
      else
      {
        v33 = 0;
        v24 = 0;
      }
LABEL_17:
      _Block_object_dispose(&v36, 8);

      if (!v24)
      {

        goto LABEL_26;
      }
      if (v17 == ++v21)
      {
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v17)
          goto LABEL_5;
        goto LABEL_23;
      }
    }
  }
  v20 = v30;
LABEL_23:

  if (a7)
  {
    v16 = objc_retainAutorelease(v16);
    *a7 = v16;
  }
  v33 = 1;
LABEL_26:

  return v33 & 1;
}

uint64_t __151__HDOntologyConceptManager_followRelationshipsWithTypes_startingIdentifier_options_ontologyTransaction_conceptOut_deletedRelationshipVersionOut_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

+ (id)inflateGraphWithRootConceptsPredicate:(id)a3 limit:(int64_t)a4 maximumDepth:(int64_t)a5 attributeTypes:(id)a6 relationshipTypes:(id)a7 ontologyTransaction:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  _HDOntologyGraphInflationCache *v30;
  id v31;
  void *v32;
  id v33;
  id v34;
  _HDOntologyGraphInflationCache *v35;
  id v36;
  id v37;
  void *v38;
  id v39;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  int64_t v45;
  int64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  id v53;
  _HDOntologyGraphInflationCache *v54;
  id v55;
  id v56;
  uint64_t v57;
  int64_t v58;

  v16 = a3;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  if (a4 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDOntologyConceptManager.m"), 383, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("limit >= 0"));

  }
  v45 = a5;
  if (a5 < 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDOntologyConceptManager.m"), 384, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("maximumDepth >= 0"));

  }
  v44 = v19;
  v20 = v18;
  v21 = v17;
  v47 = v16;
  v22 = objc_opt_self();
  v23 = v21;
  objc_opt_self();
  v24 = MEMORY[0x1E0C809B0];
  if (v23)
  {
    if (objc_msgSend(v23, "count"))
    {
      v48 = v24;
      v49 = 3221225472;
      v50 = __66__HDOntologyConceptManager__attributesPredicateForAttributeTypes___block_invoke;
      v51 = &unk_1E6CFF868;
      v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v25 = v52;
      objc_msgSend(v23, "enumerateIntegersUsingBlock:", &v48);
      objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("attribute_type"), v25);
      v43 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v43 = 0;
  }

  v26 = v20;
  objc_opt_self();
  v46 = a4;
  if (v26)
  {
    if (objc_msgSend(v26, "count"))
    {
      v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v48 = v24;
      v49 = 3221225472;
      v50 = __71__HDOntologyConceptManager__relationshipPredicateForRelationshipTypes___block_invoke;
      v51 = &unk_1E6CFF868;
      v52 = v27;
      v28 = v27;
      objc_msgSend(v26, "enumerateIntegersUsingBlock:", &v48);
      objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("relationship_type"), v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v29 = 0;
  }

  v30 = objc_alloc_init(_HDOntologyGraphInflationCache);
  v31 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v44, "graphDatabase");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = v24;
  v49 = 3221225472;
  v50 = __145__HDOntologyConceptManager__inflateGraphWithRootConceptsPredicate_limit_maximumDepth_attributeTypes_relationshipTypes_ontologyTransaction_error___block_invoke;
  v51 = &unk_1E6CFF840;
  v57 = v22;
  v58 = v45;
  v52 = v43;
  v53 = v29;
  v54 = v30;
  v55 = v44;
  v56 = v31;
  v33 = v31;
  v34 = v44;
  v35 = v30;
  v36 = v29;
  v37 = v43;
  LODWORD(v30) = objc_msgSend(v32, "enumerateNodesForPredicate:includeDeleted:limit:error:enumerationHandler:", v47, 0, v46, a9, &v48);

  if ((_DWORD)v30)
    v38 = v33;
  else
    v38 = 0;
  v39 = v38;

  return v39;
}

+ (id)predicateMatchingConceptWithID:(id)a3
{
  return HDSimpleGraphDatabaseNodeEntityPredicateForIdentifier(objc_msgSend(a3, "rawIdentifier"), 1);
}

+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withSubjectId:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29840];
  HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToSubjectID(objc_msgSend(a4, "rawIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateMatchingConceptsWithRelationshipType:(int64_t)a3 withObjectId:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29840];
  HDSimpleGraphDatabaseNodeEntityPredicateForNodesRelatedToObjectID(objc_msgSend(a4, "rawIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v6;
  HDSimpleGraphDatabaseNodeEntityPredicateForNodesWithRelationshipType(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingAllPredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)predicateMatchingRelationshipsWithSubjectId:(id)a3 relationshipType:(int64_t)a4
{
  return HDSimpleGraphRelationshipEntityPredicateForSubject(objc_msgSend(a3, "rawIdentifier"), a4);
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 attributeValue:(id)a4
{
  return HDSimpleGraphDatabaseNodeEntityPredicateForAttribute(a3, a4);
}

+ (id)predicateForConceptsWithoutAttributeType:(int64_t)a3 attributeValue:(id)a4
{
  return HDSimpleGraphDatabaseNodeEntityPredicateWithoutAttribute(a3, a4);
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 likeAttributeValue:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%%%@%%"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(960, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v4, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateMatchingConceptsWithAttributeType:(int64_t)a3 beingsWithAttributeValue:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%%"), a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeType(960, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSimpleGraphDatabaseNodeEntityPredicateForAttributeValue(v4, 8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)predicateForConceptsFollowingRelationshipOfTypes:(id)a3 fromSubjectId:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a4;
  v6 = a3;
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", CFSTR("relationship_type"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteSchemaEntity disambiguatedSQLForProperty:](HDSimpleGraphDatabaseRelationshipEntity, "disambiguatedSQLForProperty:", CFSTR("subject_id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(v5, "numberRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "predicateWithProperty:equalToValue:", v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)predicateForRelationshipsWithTypes:(id)a3 onConceptId:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0D29840];
  v6 = a3;
  HDSimpleGraphRelationshipEntityPredicateForFetchType(0, objc_msgSend(a4, "rawIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("relationship_type"), v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateMatchingAllPredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)predicateToExcludeSentinel
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", 204);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateWithProperty:notEqualToValue:", CFSTR("rowid"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __76__HDOntologyConceptManager__findConceptForCoding_options_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

uint64_t __74__HDOntologyConceptManager__grouperConceptIDForConcept_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(a2, "objectID");
  return 0;
}

uint64_t __76__HDOntologyConceptManager__conceptFromGraphNode_options_transaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB64A8];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "version");
  v9 = objc_msgSend(v4, "isDeleted");

  v10 = (void *)objc_msgSend(v5, "initWithType:value:version:deleted:", v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  return 1;
}

uint64_t __88__HDOntologyConceptManager__conceptWithIdentifier_options_transaction_conceptOut_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
  return 0;
}

uint64_t __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __107__HDOntologyConceptManager__enumerateConceptsWithIdentifiers_options_transaction_error_enumerationHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;

  +[HDOntologyConceptManager _conceptFromGraphNode:options:transaction:error:](*(_QWORD *)(a1 + 48), a2, *(_QWORD *)(a1 + 56), *(void **)(a1 + 32), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v5 = 0;

  return v5;
}

BOOL __93__HDOntologyConceptManager__relationshipsForConceptWithIdentifier_options_transaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  _BOOL8 v4;
  id v5;
  id v7;

  v7 = 0;
  v4 = +[HDOntologyConceptManager _conceptRelationshipFromGraphRelationship:relationshipOut:options:transaction:error:](*(_QWORD *)(a1 + 48), a2, &v7, *(_QWORD *)(a1 + 56), *(void **)(a1 + 32), a3);
  v5 = v7;
  if (v4)
    objc_msgSend(*(id *)(a1 + 40), "hk_addNonNilObject:", v5);

  return v4;
}

uint64_t __145__HDOntologyConceptManager__inflateGraphWithRootConceptsPredicate_limit_maximumDepth_attributeTypes_relationshipTypes_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v13;

  v4 = *(_QWORD *)(a1 + 72);
  v5 = *(_QWORD *)(a1 + 80);
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v8 = *(void **)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v13 = 0;
  v10 = +[HDOntologyConceptManager _inflateConcept:rootNode:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v4, &v13, a2, v5, v6, v7, v8, v9, a3);
  v11 = v13;
  if ((_DWORD)v10)
    objc_msgSend(*(id *)(a1 + 64), "hk_addNonNilObject:", v11);

  return v10;
}

+ (uint64_t)_inflateConcept:(void *)a3 rootNode:(unint64_t)a4 maximumDepth:(void *)a5 attributesPredicate:(void *)a6 relationshipsPredicate:(void *)a7 cache:(void *)a8 ontologyTransaction:(uint64_t)a9 error:
{
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  id v62;
  id v65;
  _QWORD v66[4];
  id v67;
  _QWORD v68[3];

  v68[2] = *MEMORY[0x1E0C80C00];
  v13 = a5;
  v65 = a6;
  v14 = a7;
  v15 = a8;
  v16 = a3;
  v17 = objc_opt_self();
  v18 = v16;
  v19 = v13;
  v20 = v14;
  v21 = v15;
  objc_opt_self();
  if (v20)
    v22 = (void *)v20[1];
  else
    v22 = 0;
  v23 = (void *)MEMORY[0x1E0CB37E8];
  v24 = v22;
  objc_msgSend(v23, "numberWithLongLong:", objc_msgSend(v18, "rowID"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "objectForKeyedSubscript:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    v27 = v26;
    v28 = v65;
    goto LABEL_16;
  }
  v29 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v66[0] = MEMORY[0x1E0C809B0];
  v66[1] = 3221225472;
  v66[2] = __96__HDOntologyConceptManager__conceptForNode_attributesPredicate_cache_ontologyTransaction_error___block_invoke;
  v66[3] = &unk_1E6CFF7A0;
  v62 = v29;
  v67 = v62;
  v30 = v18;
  v60 = v19;
  v31 = v19;
  v32 = v21;
  v33 = v66;
  v34 = v31;
  objc_opt_self();
  v61 = v17;
  if (v31)
  {
    v59 = v21;
    v35 = v32;
    v36 = (void *)MEMORY[0x1E0D29840];
    HDSimpleGraphAttributeEntityPredicateForNodeID(objc_msgSend(v30, "rowID"), 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v68[0] = v37;
    v68[1] = v34;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v68, 2);
    v58 = v30;
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "predicateMatchingAllPredicates:", v38);
    v39 = v34;
    v40 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "graphDatabase");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "underlyingDatabase");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v39;
    v44 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesWithPredicate:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseAttributeEntity, "enumerateAttributesWithPredicate:skipDeleted:database:error:enumerationHandler:", v40, 1, v42, a9, v33);

    v30 = v58;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v45)
    {

      goto LABEL_12;
    }
    v59 = v21;
    objc_msgSend(v32, "graphDatabase");
    v43 = 0;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v32;
    v44 = objc_msgSend(v40, "enumerateAttributesForNodeWithID:error:enumerationHandler:", objc_msgSend(v30, "rowID"), a9, v33);
  }

  v21 = v59;
  if ((v44 & 1) != 0)
  {
LABEL_12:
    v46 = objc_alloc(MEMORY[0x1E0CB64A0]);
    v47 = v30;
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", objc_msgSend(v30, "rowID"));
    v49 = objc_msgSend(v30, "version");
    v50 = objc_msgSend(v47, "isDeleted");
    v27 = (id)objc_msgSend(v46, "initWithIdentifier:attributes:relationships:version:deleted:options:", v48, v62, MEMORY[0x1E0C9AA60], v49, v50, 0);

    v28 = v65;
    v19 = v60;
    if (v20)
      v51 = (void *)v20[1];
    else
      v51 = 0;
    v52 = v51;
    objc_msgSend(v27, "identifier");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "numberRepresentation");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setObject:forKeyedSubscript:", v27, v54);

    v17 = v61;
    goto LABEL_15;
  }
  v27 = 0;
  v28 = v65;
  v19 = v60;
  v17 = v61;
LABEL_15:

LABEL_16:
  if (v27)
  {
    v55 = +[HDOntologyConceptManager _inflateRelationshipsIfPossibleForConcept:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v17, v27, a4, v19, v28, v20, v21, a9);
    v56 = v55;
    if (a2 && (_DWORD)v55)
    {
      *a2 = objc_retainAutorelease(v27);
      v56 = 1;
    }
  }
  else
  {
    v56 = 0;
  }

  return v56;
}

void __66__HDOntologyConceptManager__attributesPredicateForAttributeTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __71__HDOntologyConceptManager__relationshipPredicateForRelationshipTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

+ (uint64_t)_inflateRelationshipsIfPossibleForConcept:(unint64_t)a3 maximumDepth:(void *)a4 attributesPredicate:(void *)a5 relationshipsPredicate:(void *)a6 cache:(void *)a7 ontologyTransaction:(uint64_t)a8 error:
{
  id v12;
  id v13;
  id v14;
  _QWORD *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  void *v23;
  id v24;
  void *v25;
  _QWORD *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t i;
  void *v45;
  void *v46;
  int v47;
  _QWORD *v48;
  void *v49;
  id v51;
  id v52;
  id v53;
  id v54;
  _QWORD *v55;
  id v56;
  void *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  _QWORD *v69;
  _QWORD *v70;
  _QWORD *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  void *v78;
  id obj;
  _QWORD *obja;
  void *v82;
  void *v83;
  id v84;
  id v85;
  int v87;
  _QWORD v88[2];
  uint64_t (*v89)(uint64_t, uint64_t);
  void *v90;
  id v91;
  _QWORD v92[4];
  id v93;
  id v94;
  _QWORD *v95;
  id v96;
  _QWORD *v97;
  uint64_t v98;
  unint64_t v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  objc_opt_self();
  if (v15)
    v17 = (void *)v15[2];
  else
    v17 = 0;
  v18 = v17;
  objc_msgSend(v12, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "containsObject:", v19))
  {

    goto LABEL_5;
  }
  if (v15)
    v21 = (void *)v15[2];
  else
    v21 = 0;
  v22 = objc_msgSend(v21, "count");

  if (v22 >= a3)
  {
    v20 = 1;
    goto LABEL_24;
  }
  if (v15)
    v23 = (void *)v15[2];
  else
    v23 = 0;
  v24 = v23;
  objc_msgSend(v12, "identifier");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v25);

  v74 = v16;
  v84 = v16;
  v26 = v15;
  v75 = v14;
  v27 = v14;
  v76 = v13;
  v28 = v13;
  v29 = v12;
  objc_opt_self();
  v30 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v88[0] = MEMORY[0x1E0C809B0];
  v88[1] = 3221225472;
  v89 = __158__HDOntologyConceptManager__subgraphPopulatedRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error___block_invoke;
  v90 = &unk_1E6CFF890;
  v91 = v30;
  v73 = v30;
  v31 = v29;
  v32 = v28;
  v33 = v27;
  v34 = v26;
  v85 = v84;
  v35 = v88;
  v36 = objc_opt_self();
  objc_msgSend(v31, "relationships");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "count");

  v77 = v12;
  v78 = v31;
  v82 = v32;
  v83 = v33;
  if (v38)
  {
    v39 = v36;
    v102 = 0u;
    v103 = 0u;
    v100 = 0u;
    v101 = 0u;
    objc_msgSend(v31, "relationships");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v92, 16);
    if (v40)
    {
      v41 = v40;
      v71 = v15;
      v42 = *(_QWORD *)v101;
      v43 = v83;
      while (2)
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v101 != v42)
            objc_enumerationMutation(obj);
          v45 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
          objc_msgSend(v45, "destination");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          v47 = +[HDOntologyConceptManager _inflateRelationshipsIfPossibleForConcept:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v39, v46, a3, v32, v43, v34, v85, a8);

          if (!v47 || !((unsigned int (*)(_QWORD *, void *, uint64_t))v89)(v35, v45, a8))
          {
            v87 = 0;
            v14 = v75;
            v13 = v76;
            v18 = v73;
            v16 = v74;
            v15 = v71;
            goto LABEL_29;
          }
          v43 = v83;
        }
        v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v92, 16);
        if (v41)
          continue;
        break;
      }
      v14 = v75;
      v13 = v76;
      v18 = v73;
      v16 = v74;
      v15 = v71;
      v48 = v34;
      v49 = obj;
      v87 = 1;
    }
    else
    {
      v87 = 1;
      v14 = v75;
      v13 = v76;
      v18 = v73;
      v16 = v74;
LABEL_29:
      v48 = v34;
      v49 = obj;
    }
    goto LABEL_34;
  }
  v92[0] = MEMORY[0x1E0C809B0];
  v92[1] = 3221225472;
  v92[2] = __169__HDOntologyConceptManager__enumerateRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error_enumerationHandler___block_invoke;
  v92[3] = &unk_1E6CFF8B8;
  v98 = v36;
  v99 = a3;
  v93 = v32;
  v51 = v33;
  v94 = v51;
  v70 = v34;
  v95 = v34;
  v52 = v85;
  v96 = v52;
  obja = v35;
  v97 = v35;
  v53 = v51;
  v54 = v52;
  v55 = v92;
  v56 = v78;
  objc_opt_self();
  objc_msgSend(v56, "identifier");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  v58 = objc_msgSend(v57, "rawIdentifier");
  v72 = v53;
  if (v53)
  {
    v59 = (void *)MEMORY[0x1E0D29840];
    HDSimpleGraphRelationshipEntityPredicateForFetchType(0, v58);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&v100 = v60;
    *((_QWORD *)&v100 + 1) = v53;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 2);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "predicateMatchingAllPredicates:", v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v54, "graphDatabase");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v63, "enumerateRelationshipsForPredicate:error:enumerationHandler:", v62, a8, v55);

    v64 = v55;
    v14 = v75;
    v13 = v76;
    v18 = v73;
    v16 = v74;
  }
  else
  {
    v69 = v55;
    objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
    v65 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = v75;
    v13 = v76;
    v18 = v73;
    v16 = v74;
    if (!v65)
    {
      v87 = 1;
      v64 = v69;
      v48 = v70;
      goto LABEL_33;
    }
    objc_msgSend(v54, "graphDatabase");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = v58;
    v64 = v69;
    v87 = objc_msgSend(v62, "enumerateRelationshipsWithSubjectID:includeDeleted:error:enumerationHandler:", v66, 0, a8, v69);
  }
  v48 = v70;

LABEL_33:
  v49 = v93;
  v35 = obja;
LABEL_34:

  if (v87)
    v67 = v18;
  else
    v67 = 0;
  v20 = v67;

  if (v15)
    v68 = (void *)v48[2];
  else
    v68 = 0;
  objc_msgSend(v68, "removeLastObject");
  v12 = v77;
  if (!v20)
  {
    v18 = 0;
    goto LABEL_6;
  }
  if (objc_msgSend((id)v20, "count"))
    objc_msgSend(v78, "mutateBySettingRelationships:", v20);
LABEL_5:
  v20 = 1;
LABEL_6:

LABEL_24:
  return v20;
}

uint64_t __96__HDOntologyConceptManager__conceptForNode_attributesPredicate_cache_ontologyTransaction_error___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0CB64A8];
  v4 = a2;
  v5 = [v3 alloc];
  v6 = objc_msgSend(v4, "type");
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "version");
  v9 = objc_msgSend(v4, "isDeleted");

  v10 = (void *)objc_msgSend(v5, "initWithType:value:version:deleted:", v6, v7, v8, v9);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

  return 1;
}

uint64_t __158__HDOntologyConceptManager__subgraphPopulatedRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

uint64_t __169__HDOntologyConceptManager__enumerateRelationshipsForConcept_maximumDepth_attributesPredicate_relationshipsPredicate_cache_ontologyTransaction_error_enumerationHandler___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  int v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  id v38;

  v34 = a1[10];
  v5 = (void *)a1[4];
  v6 = (void *)a1[5];
  v7 = (void *)a1[6];
  v8 = (void *)a1[7];
  v9 = a2;
  v10 = v5;
  v11 = v6;
  v12 = v7;
  v13 = v8;
  v14 = objc_opt_self();
  objc_msgSend(v13, "graphDatabase");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v9;
  objc_msgSend(v15, "nodeForID:error:", objc_msgSend(v9, "objectID"), a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v11;
  v37 = v10;
  if (v17)
  {
    v38 = 0;
    v18 = +[HDOntologyConceptManager _inflateConcept:rootNode:maximumDepth:attributesPredicate:relationshipsPredicate:cache:ontologyTransaction:error:](v14, &v38, v17, v34, v10, v11, v12, v13, a3);
    v19 = v38;
    v20 = v19;
    v21 = 0;
    v22 = a3;
    v23 = v16;
    if (v18)
    {
      if (v19)
      {
        if (v12)
          v24 = (void *)v12[2];
        else
          v24 = 0;
        v25 = v24;
        objc_msgSend(v20, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v25, "containsObject:", v26);

        v28 = objc_alloc(MEMORY[0x1E0CB64C0]);
        v35 = objc_msgSend(v23, "type");
        v29 = objc_msgSend(v23, "version");
        v30 = objc_msgSend(v23, "isDeleted");
        if (v27)
          v31 = objc_msgSend(v28, "initWithType:weakDestination:version:deleted:", v35, v20, v29, v30);
        else
          v31 = objc_msgSend(v28, "initWithType:destination:version:deleted:", v35, v20, v29, v30);
        v21 = (void *)v31;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", v22, 118, CFSTR("No destination found for node %@"), v17);
        v21 = 0;
      }
    }

  }
  else
  {
    v21 = 0;
    v23 = v16;
  }

  if (v21)
    v32 = (*(uint64_t (**)(void))(a1[8] + 16))();
  else
    v32 = 0;

  return v32;
}

- (id)attributeIdentifierForCodingSystem:(id)a3
{
  id v5;
  _BOOL4 attributeIdentifierByCodingSystemURNIsReady;
  NSObject *v7;
  id v8;
  id WeakRetained;
  void *v10;
  id v11;
  char v12;
  HDOntologyConceptManager *v13;
  NSObject *v14;
  NSMutableDictionary *attributeIdentifierByCodingSystemURN;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v26;
  id v27;
  uint8_t v28[4];
  HDOntologyConceptManager *v29;
  _BYTE buf[24];
  void *v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDOntologyConceptManager.m"), 1335, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("codingSystem"));

  }
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  attributeIdentifierByCodingSystemURNIsReady = self->_attributeIdentifierByCodingSystemURNIsReady;
  os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
  if (!attributeIdentifierByCodingSystemURNIsReady)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ will now populate the attribute identifier map", buf, 0xCu);
    }

    os_unfair_lock_assert_not_owner(&self->_attributeIdentifierByCodingSystemURNLock);
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    objc_msgSend(WeakRetained, "ontologyDatabase");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke;
    v31 = &unk_1E6CEFA20;
    v11 = v8;
    v32 = v11;
    v12 = objc_msgSend(v10, "performTransactionWithError:transactionHandler:", &v27, buf);
    v13 = (HDOntologyConceptManager *)v27;

    if ((v12 & 1) != 0)
    {
      os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
      -[NSMutableDictionary removeAllObjects](self->_attributeIdentifierByCodingSystemURN, "removeAllObjects");
      -[NSMutableDictionary addEntriesFromDictionary:](self->_attributeIdentifierByCodingSystemURN, "addEntriesFromDictionary:", v11);
      self->_attributeIdentifierByCodingSystemURNIsReady = 1;
      os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
      _HKInitializeLogging();
      HKLogHealthOntology();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v28 = 138543362;
        v29 = self;
        _os_log_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ did populate the attribute identifier map", v28, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)v28 = 138543362;
        v29 = v13;
        _os_log_fault_impl(&dword_1B7802000, v14, OS_LOG_TYPE_FAULT, "HDOntologyConceptManager failed to populate the attribute identifier map. Error: %{public}@", v28, 0xCu);
      }
    }

  }
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  attributeIdentifierByCodingSystemURN = self->_attributeIdentifierByCodingSystemURN;
  objc_msgSend(v5, "identifier");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E6D11BB8;
  -[NSMutableDictionary objectForKeyedSubscript:](attributeIdentifierByCodingSystemURN, "objectForKeyedSubscript:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
  if (!v19)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      HKSensitiveLogItem();
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v21;
      _os_log_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: no attribute identifier found for %{public}@", buf, 0x16u);

    }
    objc_msgSend(v5, "ontology_hasCodingSystemAttributeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      _HKInitializeLogging();
      HKLogHealthOntology();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        HKSensitiveLogItem();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v23;
        _os_log_impl(&dword_1B7802000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@: attribute identifier found in fallback mapping for coding system \"%{public}@\", buf, 0x16u);

      }
      v24 = v19;
    }

  }
  return v19;
}

BOOL __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _BOOL8 v9;
  _QWORD v11[4];
  id v12;

  v5 = a2;
  +[HDSimpleGraphDatabaseAttributeEntity predicateForAttributesWithType:](HDSimpleGraphDatabaseAttributeEntity, "predicateForAttributesWithType:", 500);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "graphDatabase");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "underlyingDatabase");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke_2;
  v11[3] = &unk_1E6CFF7A0;
  v12 = *(id *)(a1 + 32);
  v9 = +[HDSimpleGraphDatabaseAttributeEntity enumerateAttributesWithPredicate:skipDeleted:database:error:enumerationHandler:](HDSimpleGraphDatabaseAttributeEntity, "enumerateAttributesWithPredicate:skipDeleted:database:error:enumerationHandler:", v6, 1, v8, a3, v11);

  return v9;
}

uint64_t __59__HDOntologyConceptManager__populateAttributeIdentifierMap__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = a2;
  objc_msgSend(v3, "numberWithLongLong:", objc_msgSend(v4, "nodeID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, v7);
  return 1;
}

- (BOOL)unitTesting_attributeIdentifierByCodingSystemURNMapIsReady
{
  HDOntologyConceptManager *v2;
  os_unfair_lock_s *p_attributeIdentifierByCodingSystemURNLock;

  v2 = self;
  p_attributeIdentifierByCodingSystemURNLock = &self->_attributeIdentifierByCodingSystemURNLock;
  os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
  LOBYTE(v2) = v2->_attributeIdentifierByCodingSystemURNIsReady;
  os_unfair_lock_unlock(p_attributeIdentifierByCodingSystemURNLock);
  return (char)v2;
}

- (void)daemonReady:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "daemon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "ontologyUpdateCoordinator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addOntologyShardImporterObserver:queue:", self, 0);

}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  void *v5;
  int v6;
  NSObject *v7;
  _BOOL4 attributeIdentifierByCodingSystemURNIsReady;
  void *v9;
  void *v10;
  int v11;
  HDOntologyConceptManager *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "identifier", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB5720]);

  if (v6)
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = self;
      _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ got notified that the \"Universal\" shard was imported. Will reset attribute identifier map if necessary.", (uint8_t *)&v11, 0xCu);
    }

    if (self)
    {
      os_unfair_lock_lock(&self->_attributeIdentifierByCodingSystemURNLock);
      attributeIdentifierByCodingSystemURNIsReady = self->_attributeIdentifierByCodingSystemURNIsReady;
      self->_attributeIdentifierByCodingSystemURNIsReady = 0;
      -[NSMutableDictionary removeAllObjects](self->_attributeIdentifierByCodingSystemURN, "removeAllObjects");
      os_unfair_lock_unlock(&self->_attributeIdentifierByCodingSystemURNLock);
      v9 = _Block_copy(self->_unitTesting_didResetAttributeIdentifierMap);
      v10 = v9;
      if (v9)
        (*((void (**)(void *, _BOOL4))v9 + 2))(v9, attributeIdentifierByCodingSystemURNIsReady);

    }
  }
}

- (id)unitTesting_didResetAttributeIdentifierMap
{
  return self->_unitTesting_didResetAttributeIdentifierMap;
}

- (void)setUnitTesting_didResetAttributeIdentifierMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didResetAttributeIdentifierMap, 0);
  objc_storeStrong((id *)&self->_attributeIdentifierByCodingSystemURN, 0);
  objc_storeStrong((id *)&self->_conceptsByIdentifier, 0);
  objc_destroyWeak((id *)&self->_profile);
}

@end
