@implementation HDAuthorizationEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)authorizationStatusesForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "status"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)authorizationRequestsForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKeyedSubscript:", v13, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v14, "request"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, v13);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (id)authorizationRecordsByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(a1, "readAuthorizationStatusesByTypeForBundleIdentifier:types:profile:error:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__HDAuthorizationEntity_authorizationRecordsByTypeForBundleIdentifier_types_profile_error___block_invoke;
    v11[3] = &unk_1E6D115F0;
    v12 = v7;
    v8 = v7;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
    v9 = (void *)objc_msgSend(v8, "copy");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __91__HDAuthorizationEntity_authorizationRecordsByTypeForBundleIdentifier_types_profile_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "authorizationRecord");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

+ (id)readAuthorizationStatusesByTypeForBundleIdentifier:(id)a3 types:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  char v43;
  void *v44;
  char v45;
  void *v46;
  id v47;
  void *v49;
  int v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  id v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _QWORD v62[4];
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  objc_msgSend(v13, "sourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allSourcesForBundleIdentifier:error:", v11, a6);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    if (objc_msgSend(v15, "count"))
    {
      v56 = v13;
      v57 = v11;
      v55 = v12;
      objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v12);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hk_map:", &__block_literal_global_248);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
      v19 = objc_claimAutoreleasedReturnValue();

      v54 = (void *)v19;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ in (%@)"), CFSTR("source_id"), v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v16, "count"))
      {
        objc_msgSend(v16, "allObjects");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "hk_map:", &__block_literal_global_226_0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR(", "));
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(" AND %@ in (%@)"), CFSTR("object_type"), v23);
        v24 = objc_claimAutoreleasedReturnValue();

        v20 = (void *)v24;
      }
      v25 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(a1, "disambiguatedDatabaseTable");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = v20;
      objc_msgSend(v25, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@, %@, %@, %@ FROM %@ WHERE %@ ORDER BY %@ ASC, %@ DESC, %@ DESC, %@ DESC"), CFSTR("object_type"), CFSTR("status"), CFSTR("request"), CFSTR("mode"), CFSTR("deleted_object_anchor"), CFSTR("object_limit_anchor"), CFSTR("object_limit_modified"), v26, v20, CFSTR("object_type"), CFSTR("modification_epoch"), CFSTR("date_modified"), CFSTR("status"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      v28 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v13, "database");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v62[0] = MEMORY[0x1E0C809B0];
      v62[1] = 3221225472;
      v62[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_3;
      v62[3] = &unk_1E6D00180;
      v68 = a1;
      v52 = v27;
      v63 = v52;
      v64 = v15;
      v51 = v16;
      v65 = v51;
      v30 = v28;
      v66 = v30;
      v67 = v57;
      v50 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v29, a6, v62);

      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      objc_msgSend(v30, "allKeys");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v59;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v59 != v34)
              objc_enumerationMutation(v31);
            v36 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
            objc_msgSend(v36, "parentType");
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            if (v37)
            {
              objc_msgSend(v30, "objectForKeyedSubscript:", v36);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "parentType");
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "objectForKeyedSubscript:", v39);
              v40 = (void *)objc_claimAutoreleasedReturnValue();

              if (v40
                && (objc_msgSend(v40, "authorizationRequest") == 203
                 || (v41 = objc_msgSend(v38, "authorizationRequest"), v41 == objc_msgSend(v40, "authorizationRequest"))))
              {
                objc_msgSend(v40, "authorizationRecord");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                v43 = objc_msgSend(v42, "readingEnabled");

                if ((v43 & 1) == 0)
                  objc_msgSend(v38, "disableReading");
                objc_msgSend(v40, "authorizationRecord");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                v45 = objc_msgSend(v44, "sharingEnabled");

                if ((v45 & 1) == 0)
                  objc_msgSend(v38, "disableSharing");
              }
              else
              {
                objc_msgSend(v30, "removeObjectForKey:", v36);
              }

            }
          }
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v58, v69, 16);
        }
        while (v33);
      }

      if (v50)
        v46 = v30;
      else
        v46 = 0;
      v47 = v46;

      v13 = v56;
      v11 = v57;
      v12 = v55;
    }
    else
    {
      v47 = (id)MEMORY[0x1E0C9AA70];
    }
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

const __CFString *__96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke()
{
  return CFSTR("?");
}

const __CFString *__96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_2()
{
  return CFSTR("?");
}

uint64_t __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_4;
  v14[3] = &unk_1E6CE7750;
  v7 = *(_QWORD *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  v10[0] = v6;
  v10[1] = 3221225472;
  v10[2] = __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_5;
  v10[3] = &unk_1E6CF16E0;
  v11 = *(id *)(a1 + 56);
  v12 = *(id *)(a1 + 64);
  v13 = *(id *)(a1 + 40);
  v8 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", v7, a3, v14, v10);

  return v8;
}

void __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    v8 = 1;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        sqlite3_bind_int64(a2, v10 + v9, objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v9), "persistentID"));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v8 = v10 + v9;
    }
    while (v6);
    v11 = v10 + v9;
  }
  else
  {
    v11 = 1;
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v12 = *(id *)(a1 + 40);
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v12);
        sqlite3_bind_int64(a2, v11 + i, objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "code", (_QWORD)v17));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
      v11 += i;
    }
    while (v14);
  }

}

BOOL __96__HDAuthorizationEntity_readAuthorizationStatusesByTypeForBundleIdentifier_types_profile_error___block_invoke_5(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  HDReadAuthorizationStatus *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  HDReadAuthorizationStatus *v18;
  void *v19;
  HDReadAuthorizationStatus *v20;

  v6 = HDSQLiteColumnAsInt64();
  objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = HDSQLiteColumnAsInt64();
      v10 = HDSQLiteColumnAsInt64();
      v11 = [HDReadAuthorizationStatus alloc];
      v12 = HDSQLiteColumnAsInt64();
      if (v9 == 102)
      {
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 48);
      }
      else
      {
        v13 = 0;
        v14 = 0;
      }
      MEMORY[0x1BCCAB1C8](a2, 4);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 == 1)
      {
        MEMORY[0x1BCCAB1C8](a2, 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        MEMORY[0x1BCCAB198](a2, 6);
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = v11;
        v19 = (void *)v17;
        v20 = -[HDReadAuthorizationStatus initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:](v18, "initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:", v9, v12, 1, v13, v14, v15, v16, v17);

      }
      else
      {
        v20 = -[HDReadAuthorizationStatus initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:](v11, "initWithReadAuthorizationStatus:authorizationRequest:authorizationMode:restrictedBundleIdentifier:restrictedSourceEntities:deletedObjectBaselineAnchor:objectLimitAnchor:objectLimitModifiedDate:", v9, v12, v10, v13, v14, v15, 0, 0);
      }

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v20, v7);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("Unable to instantiate object type for code: %ld"), v6);
  }

  return v7 != 0;
}

+ (id)modificationDateForSourceEntity:(id)a3 type:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 262, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

    if (v11)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 263, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

    goto LABEL_3;
  }
  if (!v11)
    goto LABEL_5;
LABEL_3:
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__211;
  v30 = __Block_byref_object_dispose__211;
  v31 = 0;
  objc_msgSend(v13, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __76__HDAuthorizationEntity_modificationDateForSourceEntity_type_profile_error___block_invoke;
  v21[3] = &unk_1E6D00EF8;
  v25 = a1;
  v15 = v11;
  v22 = v15;
  v16 = v12;
  v23 = v16;
  v24 = &v26;
  objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v21);

  v17 = (id)v27[5];
  _Block_object_dispose(&v26, 8);

  return v17;
}

uint64_t __76__HDAuthorizationEntity_modificationDateForSourceEntity_type_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  objc_msgSend(a2, "databaseForEntityClass:", a1[7]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = a1[7];
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[4]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", a1[5]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAuthorizationEntity _predicateForSourceEntities:types:](v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)a1[7], "anyInDatabase:predicate:error:", v5, v9, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "dateForProperty:database:", CFSTR("date_modified"), v5);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[6] + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

  }
  return 1;
}

+ (id)_predicateForSourceEntities:(void *)a3 types:
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = a2;
  v6 = objc_opt_self();
  +[HDAuthorizationEntity _predicateForSourceEntities:](v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDAuthorizationEntity _predicateForTypes:](v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)setAuthorizationStatuses:(id)a3 sourceEntity:(id)a4 profile:(id)a5 error:(id *)a6
{
  return objc_msgSend(a1, "setAuthorizationStatuses:authorizationRequests:authorizationModes:sourceEntity:options:profile:error:", a3, MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], a4, 0, a5, a6);
}

+ (id)_maxObjectPersistentIDForProfile:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v10;

  v4 = a2;
  objc_opt_self();
  v10 = 0;
  +[HDKeyValueEntity numberForKey:domain:category:profile:entity:error:](HDUnprotectedKeyValueEntity, "numberForKey:domain:category:profile:entity:error:", CFSTR("HDMaxObjectPersistentID"), &stru_1E6D11BB8, 0, v4, 0, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  v7 = v6;
  if (v5)
  {
    v8 = v5;
  }
  else if (v6)
  {
    if (a3)
    {
      v8 = 0;
      *a3 = objc_retainAutorelease(v6);
    }
    else
    {
      _HKLogDroppedError();
      v8 = 0;
    }
  }
  else
  {
    v8 = &unk_1E6DFEAF8;
  }

  return v8;
}

+ (BOOL)setAuthorizationStatuses:(id)a3 authorizationRequests:(id)a4 authorizationModes:(id)a5 sourceEntity:(id)a6 options:(unint64_t)a7 profile:(id)a8 error:(id *)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  char v29;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  unint64_t v42;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 322, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationStatuses != nil"));

  }
  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 323, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

    if (v20)
      goto LABEL_5;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 324, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("profile !=nil"));

    goto LABEL_5;
  }
  if (!v20)
    goto LABEL_7;
LABEL_5:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "database");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __126__HDAuthorizationEntity_setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_options_profile_error___block_invoke;
  v34[3] = &unk_1E6CE9140;
  v35 = v19;
  v36 = v20;
  v37 = v16;
  v38 = v17;
  v39 = v18;
  v40 = v21;
  v41 = a1;
  v42 = a7;
  v23 = v21;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v20;
  v28 = v19;
  v29 = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v22, a9, v34);

  return v29;
}

uint64_t __126__HDAuthorizationEntity_setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_options_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t i;
  uint64_t v46;
  void *v47;
  void *v48;
  int v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  void *v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD *v82;
  id v83;
  void *v84;
  id v85;
  id v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _QWORD v92[4];
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  _QWORD aBlock[4];
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  void *v106;
  _BYTE v107[128];
  _QWORD v108[6];

  v108[4] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 80));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(*(id *)(a1 + 32), "existsInDatabase:", v6))
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 3, CFSTR("Source %lld does not exist"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    goto LABEL_23;
  }
  +[HDAuthorizationEntity _maxObjectPersistentIDForProfile:error:](*(_QWORD *)(a1 + 80), *(void **)(a1 + 40), a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
LABEL_23:
    v50 = 0;
    goto LABEL_33;
  }
  v82 = a3;
  v8 = *(void **)(a1 + 72);
  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 56);
  v11 = *(void **)(a1 + 32);
  v12 = *(void **)(a1 + 64);
  v75 = v7;
  v73 = objc_msgSend(v7, "longLongValue");
  v74 = *(_QWORD *)(a1 + 88);
  v13 = *(void **)(a1 + 40);
  v14 = v9;
  v87 = v10;
  v15 = v12;
  v16 = v11;
  v86 = v8;
  v85 = v13;
  v17 = v6;
  v18 = v5;
  v83 = v16;
  v84 = (void *)objc_opt_self();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "handleFailureInMethod:object:file:lineNumber:description:", sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v84, CFSTR("HDAuthorizationEntity.m"), 844, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

  }
  v80 = v18;
  v81 = v17;
  v19 = v14;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "handleFailureInMethod:object:file:lineNumber:description:", sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v84, CFSTR("HDAuthorizationEntity.m"), 845, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationStatuses != nil"));

  }
  v20 = (uint64_t)v82;
  if (!v87)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "handleFailureInMethod:object:file:lineNumber:description:", sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v84, CFSTR("HDAuthorizationEntity.m"), 846, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationRequests != nil"));

  }
  v76 = v6;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "handleFailureInMethod:object:file:lineNumber:description:", sel__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error_, v84, CFSTR("HDAuthorizationEntity.m"), 847, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationModes != nil"));

  }
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "allKeys");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v23);

  objc_msgSend(v87, "allKeys");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v24);

  objc_msgSend(v15, "allKeys");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addObjectsFromArray:", v25);

  v78 = v22;
  v26 = v83;
  v27 = v85;
  v77 = v5;
  if (!objc_msgSend(v22, "count"))
    goto LABEL_29;
  v72 = a1;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke;
  aBlock[3] = &unk_1E6D116F0;
  v99 = &unk_1E6DFEB10;
  v100 = v19;
  v28 = v85;
  v101 = v28;
  v102 = v87;
  v103 = v15;
  v104 = v86;
  v105 = v21;
  v106 = v84;
  v29 = _Block_copy(aBlock);
  objc_msgSend(v28, "sourceManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "clientSourceForSourceEntity:error:", v83, v82);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v31;
  if (v31)
  {
    v71 = v29;
    objc_msgSend(v28, "sourceManager");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v31;
    objc_msgSend(v31, "bundleIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "allSourcesForBundleIdentifier:error:", v34, v82);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v69 = v35;
    if (v35)
    {
      v66 = v21;
      v67 = v15;
      v68 = v19;
      +[HDAuthorizationEntity _predicateForSourceEntities:types:]((uint64_t)v84, v35, v78);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "queryWithDatabase:predicate:", v81);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v108[0] = CFSTR("object_type");
      v108[1] = CFSTR("request");
      v108[2] = CFSTR("mode");
      v108[3] = CFSTR("sync_identity");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 4);
      v37 = objc_claimAutoreleasedReturnValue();
      v92[0] = MEMORY[0x1E0C809B0];
      v92[1] = 3221225472;
      v92[2] = __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke_288;
      v92[3] = &unk_1E6D11718;
      v38 = v28;
      v93 = v38;
      v94 = v80;
      v95 = v79;
      v39 = v71;
      v97 = v39;
      v40 = v78;
      v96 = v40;
      v63 = (void *)v37;
      v64 = v36;
      objc_msgSend(v36, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v37, v82, v92);
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      v41 = v40;
      v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
      if (v42)
      {
        v43 = v42;
        v44 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v89 != v44)
              objc_enumerationMutation(v41);
            v46 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
            objc_msgSend(v38, "syncIdentityManager");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v47, "currentSyncIdentity");
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            (*((void (**)(id, uint64_t, _QWORD, void *, void *))v39 + 2))(v39, v46, 0, &unk_1E6DFEB28, v48);

          }
          v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v88, v107, 16);
        }
        while (v43);
      }

      v49 = 0;
      v20 = (uint64_t)v82;
      v15 = v67;
      v19 = v68;
      v21 = v66;
    }
    else
    {
      v49 = 1;
    }
    v29 = v71;

    a1 = v72;
    v26 = v83;
    v27 = v85;
    v32 = v70;
  }
  else
  {
    v49 = 1;
    a1 = v72;
    v27 = v85;
  }

  if (v49)
  {
    v51 = v19;
    v52 = v15;
    v50 = 0;
    v53 = v86;
    v55 = v80;
    v54 = v81;
  }
  else
  {
LABEL_29:
    v51 = v19;
    v52 = v15;
    v55 = v80;
    v54 = v81;
    v62 = v20;
    v53 = v86;
    v50 = +[HDAuthorizationEntity _insertCodableAuthorizations:sourceEntity:syncProvenance:objectAnchor:currentDate:options:profile:database:transaction:error:]((uint64_t)v84, v21, v26, 0, v73, v86, v74, v27, v81, v80, v62);
  }

  if ((_DWORD)v50)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Authorization status changed for source %lld"), objc_msgSend(*(id *)(a1 + 32), "persistentID"));
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    HDSetHealthInUseDefaultWithReason(v56);

  }
  v6 = v76;
  v5 = v77;
LABEL_33:

  return v50;
}

+ (id)authorizationRecordsBySourceForType:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v24;
  void *v25;
  id obj;
  id v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type != nil"));

  }
  objc_msgSend(v9, "sourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allSourcesWithError:", a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v27 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v25 = v11;
    obj = v11;
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v30;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v30 != v14)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v16, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v8);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1, "authorizationRecordsByTypeForBundleIdentifier:types:profile:error:", v17, v18, v9, a5);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v19)
          {

            v22 = 0;
            v21 = v27;
            goto LABEL_16;
          }
          objc_msgSend(v19, "objectForKeyedSubscript:", v8);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, v16);

        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        if (v13)
          continue;
        break;
      }
    }

    v21 = v27;
    v22 = v27;
LABEL_16:

    v11 = v25;
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)allSourcesRequestingTypes:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  void *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v7 = a3;
  v8 = a4;
  v9 = (void *)objc_opt_self();
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__211;
  v26 = __Block_byref_object_dispose__211;
  v27 = 0;
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke;
  v16[3] = &unk_1E6CF5470;
  v21 = v9;
  v11 = v7;
  v17 = v11;
  v18 = 0;
  v12 = v8;
  v19 = v12;
  v20 = &v22;
  LODWORD(a5) = objc_msgSend(v9, "performReadTransactionWithHealthDatabase:error:block:", v10, a5, v16);

  if ((_DWORD)a5)
    v13 = (void *)v23[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v22, 8);
  return v14;
}

BOOL __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  +[HDAuthorizationEntity _predicateForTypes:](*(_QWORD *)(a1 + 64), *(void **)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v5, *(_QWORD *)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v8 = *(void **)(a1 + 64);
  v21[0] = CFSTR("source_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke_2;
  v19[3] = &unk_1E6CE9FC0;
  v11 = v7;
  v20 = v11;
  LODWORD(v8) = objc_msgSend(v8, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v9, v6, v10, a3, v19);

  if ((_DWORD)v8)
  {
    objc_msgSend(*(id *)(a1 + 48), "sourceManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientSourcesForSourceIDs:error:", v13, a3);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

    v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) != 0;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

+ (id)_predicateForTypes:(uint64_t)a1
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "code", (_QWORD)v12));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

    objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("object_type"), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __86__HDAuthorizationEntity__allSourcesRequestingTypes_additionalPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  void *v2;

  HDSQLiteColumnWithNameAsNumber();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v2);

  return 1;
}

+ (BOOL)resetAuthorizationStatusesForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v14;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationEntity.m"), 449, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleIdentifier != nil"));

  }
  +[HDAuthorizationEntity _predicateForBundleIdentifier:profile:error:]((uint64_t)a1, v9, v10, (uint64_t)a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = +[HDAuthorizationEntity _resetAuthorizationStatusesWithPredicate:profile:error:]((uint64_t)a1, v11, v10, (uint64_t)a5);
  else
    v12 = 0;

  return v12;
}

+ (id)_predicateForBundleIdentifier:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a2;
  v8 = objc_opt_self();
  objc_msgSend(v6, "sourceManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "allSourcesForBundleIdentifier:error:", v7, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    +[HDAuthorizationEntity _predicateForSourceEntities:](v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (uint64_t)_resetAuthorizationStatusesWithPredicate:(void *)a3 profile:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  void *v17;

  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_self();
  objc_msgSend(v7, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke;
  v14[3] = &unk_1E6CE9280;
  v16 = v7;
  v17 = v8;
  v15 = v6;
  v10 = v7;
  v11 = v6;
  v12 = objc_msgSend(v8, "performWriteTransactionWithHealthDatabase:error:block:", v9, a4, v14);

  return v12;
}

+ (BOOL)resetAllAuthorizationStatusesWithProfile:(id)a3 error:(id *)a4
{
  return +[HDAuthorizationEntity _resetAuthorizationStatusesWithPredicate:profile:error:]((uint64_t)a1, 0, a3, (uint64_t)a4);
}

+ (uint64_t)_insertCodableSourceAuthorizations:(char)a3 overwriteExisting:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  void *v24;
  char v25;

  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_self();
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke;
  v20[3] = &unk_1E6D11680;
  v21 = v12;
  v22 = v10;
  v23 = v11;
  v24 = v13;
  v25 = a3;
  v15 = v11;
  v16 = v10;
  v17 = v12;
  v18 = objc_msgSend(v13, "performWriteTransactionWithHealthDatabase:error:block:", v14, a6, v20);

  return v18;
}

uint64_t __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  int v13;
  uint64_t v14;
  id obj;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(v5, "databaseForEntityClass:", *(_QWORD *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAuthorizationEntity _maxObjectPersistentIDForProfile:error:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    obj = *(id *)(a1 + 40);
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v24;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v24 != v11)
            objc_enumerationMutation(obj);
          v17 = *(id *)(a1 + 48);
          v18 = *(id *)(a1 + 32);
          v19 = v6;
          v20 = v8;
          v21 = v7;
          v22 = v5;
          v13 = HKWithAutoreleasePool();

          if (!v13)
          {
            v14 = 0;
            goto LABEL_12;
          }
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v10)
          continue;
        break;
      }
    }
    v14 = 1;
LABEL_12:

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __102__HDAuthorizationEntity__insertCodableSourceAuthorizations_overwriteExisting_syncStore_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  void *v45;
  id v46;
  void *v47;
  NSObject *v48;
  void *v49;
  id v50;
  void *v51;
  NSObject *v52;
  void *v53;
  id v54;
  NSObject *v55;
  void *v56;
  id v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  id v65;
  id v66;
  id v67;
  id v68;
  char v69;
  _BYTE buf[12];
  __int16 v71;
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  v75 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "decodedSourceUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = *(void **)(a1 + 48);
  v7 = *(void **)(a1 + 56);
  v68 = 0;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  objc_opt_self();
  objc_msgSend(v8, "decodedSourceUUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", &v68, 100, CFSTR("Missing source UUID on codable source authorization"));
    v16 = 0;
    goto LABEL_13;
  }
  v14 = v3;
  HDSourceEntityPredicateForSourceWithUUID(v12, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  +[HDSourceEntity firstSourceWithPredicate:database:error:](HDSourceEntity, "firstSourceWithPredicate:database:error:", v15, v11, buf);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(id *)buf;
  v18 = v17;
  if (!v16)
  {
    if (v17)
    {
      v16 = 0;
      v68 = objc_retainAutorelease(v17);
    }
    else
    {
      if (objc_msgSend(v8, "hasSource"))
      {
        v69 = 0;
        objc_msgSend(v10, "sourceManager");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "sourceForCodableSource:provenance:createIfNecessary:isDeleted:error:", v58, objc_msgSend(v9, "syncProvenance"), 1, &v69, &v68);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v16 || !v69)
          goto LABEL_12;
        v61 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "UUIDString");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "hk_assignError:code:format:", &v68, 100, CFSTR("Source %@ is deleted"), v59);

      }
      else
      {
        v62 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(v13, "UUIDString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "hk_assignError:code:format:", &v68, 100, CFSTR("Failed to find source for UUID %@"), v16);
      }

      v16 = 0;
    }
  }
LABEL_12:

  v3 = v14;
LABEL_13:

  v19 = v68;
  v20 = v19;
  if (v16)
  {
    if (*(_BYTE *)(a1 + 96))
    {
LABEL_15:
      v21 = *(_QWORD *)(a1 + 88);
      objc_msgSend(*(id *)(a1 + 32), "authorizations");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[HDAuthorizationEntity _insertCodableAuthorizations:sourceEntity:syncProvenance:objectAnchor:currentDate:options:profile:database:transaction:error:](v21, v22, v16, objc_msgSend(*(id *)(a1 + 40), "syncProvenance"), objc_msgSend(*(id *)(a1 + 64), "longLongValue"), *(void **)(a1 + 72), 0, *(void **)(a1 + 48), *(void **)(a1 + 56), *(void **)(a1 + 80), a2);

      goto LABEL_19;
    }
    v26 = *(_QWORD *)(a1 + 56);
    v67 = v19;
    objc_msgSend(v16, "sourceBundleIdentifierInDatabase:error:", v26, &v67);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v67;

    if (v27)
    {
      v29 = *(_QWORD *)(a1 + 88);
      v30 = *(void **)(a1 + 48);
      v66 = v28;
      +[HDAuthorizationEntity _predicateForBundleIdentifier:profile:error:](v29, v27, v30, (uint64_t)&v66);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v66;

      if (v31)
      {
        v63 = v3;
        v33 = (void *)MEMORY[0x1E0D29838];
        objc_msgSend(*(id *)(a1 + 88), "propertyForSyncProvenance");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(*(id *)(a1 + 40), "syncProvenance"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "predicateWithProperty:notEqualToValue:", v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v31, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = *(void **)(a1 + 88);
        v39 = *(_QWORD *)(a1 + 56);
        v65 = v32;
        objc_msgSend(v38, "anyInDatabase:predicate:error:", v39, v37, &v65);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = v65;

        if (!v40)
        {
          if (!v20)
          {

            v3 = v63;
            goto LABEL_15;
          }
          _HKInitializeLogging();
          v41 = (void *)*MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
          {
            v55 = v41;
            v56 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138543874;
            *(_QWORD *)&buf[4] = v56;
            v71 = 2114;
            v72 = v27;
            v73 = 2114;
            v74 = v20;
            v57 = v56;
            _os_log_error_impl(&dword_1B7802000, v55, OS_LOG_TYPE_ERROR, "%{public}@: Failed to look up existing authorizations for \"%{public}@\": %{public}@", buf, 0x20u);

          }
        }

        v23 = 1;
        v3 = v63;
        goto LABEL_19;
      }
      _HKInitializeLogging();
      v43 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v52 = v43;
        v53 = (void *)objc_opt_class();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v53;
        v71 = 2114;
        v72 = v27;
        v73 = 2114;
        v74 = v32;
        v54 = v53;
        _os_log_error_impl(&dword_1B7802000, v52, OS_LOG_TYPE_ERROR, "%{public}@: Failed to create source authorization predicate for \"%{public}@\": %{public}@", buf, 0x20u);

      }
      v23 = 1;
      v20 = v32;
    }
    else
    {
      _HKInitializeLogging();
      v42 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v48 = v42;
        v49 = (void *)objc_opt_class();
        v50 = v49;
        objc_msgSend(v3, "UUIDString");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v49;
        v71 = 2114;
        v72 = v51;
        v73 = 2114;
        v74 = v28;
        _os_log_error_impl(&dword_1B7802000, v48, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get source bundle identifier for UUID %{public}@: %{public}@", buf, 0x20u);

      }
      v23 = 1;
      v20 = v28;
    }
  }
  else
  {
    _HKInitializeLogging();
    v24 = (void *)*MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v44 = v24;
      v45 = (void *)objc_opt_class();
      v46 = v45;
      objc_msgSend(v3, "UUIDString");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = v45;
      v71 = 2114;
      v72 = v47;
      v73 = 2114;
      v74 = v20;
      _os_log_error_impl(&dword_1B7802000, v44, OS_LOG_TYPE_ERROR, "%{public}@: Failed to find source for UUID %{public}@: %{public}@", buf, 0x20u);

    }
    v23 = 1;
  }
LABEL_19:

  return v23;
}

+ (uint64_t)_insertCodableAuthorizations:(void *)a3 sourceEntity:(uint64_t)a4 syncProvenance:(uint64_t)a5 objectAnchor:(void *)a6 currentDate:(char)a7 options:(void *)a8 profile:(void *)a9 database:(void *)a10 transaction:(uint64_t)a11 error:
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  _BOOL4 v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  char v38;
  uint64_t v39;
  NSObject *v40;
  NSObject *v41;
  void *v43;
  id v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  uint64_t v51;
  id obj;
  id v53;
  id v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  id v58;
  id v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  id v65;
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = a2;
  v15 = a3;
  v54 = a6;
  v16 = a8;
  v53 = a9;
  v46 = a10;
  v51 = objc_opt_self();
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", sel__insertCodableAuthorizations_sourceEntity_syncProvenance_objectAnchor_currentDate_options_profile_database_transaction_error_, v51, CFSTR("HDAuthorizationEntity.m"), 630, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sourceEntity != nil"));

  }
  v47 = objc_msgSend(v15, "persistentID");
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  obj = v14;
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
  if (!v55)
  {
    v39 = 1;
    goto LABEL_51;
  }
  v45 = *(_QWORD *)v61;
  v44 = v15;
  while (2)
  {
    v17 = 0;
    v18 = v45;
    do
    {
      if (*(_QWORD *)v61 != v18)
        objc_enumerationMutation(obj);
      v19 = *(id *)(*((_QWORD *)&v60 + 1) + 8 * v17);
      v20 = objc_msgSend(v19, "hasObjectType")
         && (objc_msgSend(v19, "_dataTypeCode"), _HKValidDataTypeCode())
         && objc_msgSend(v19, "hasAuthorizationStatus")
         && objc_msgSend(v19, "_authorizationStatus") >= 100
         && objc_msgSend(v19, "_authorizationStatus") <= 104
         && objc_msgSend(v19, "hasAuthorizationRequest")
         && objc_msgSend(v19, "_authorizationRequest") >= 201
         && objc_msgSend(v19, "_authorizationRequest") < 204;
      if (objc_msgSend(v19, "hasAuthorizationMode"))
      {
        if (!v20 || objc_msgSend(v19, "_authorizationMode") < 0 || objc_msgSend(v19, "_authorizationMode") >= 2)
        {
LABEL_47:
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a11, 3, CFSTR("Invalid authorization %@"), v19);

LABEL_48:
          v39 = 0;
LABEL_49:
          v15 = v44;
          goto LABEL_51;
        }
      }
      else if (!v20)
      {
        goto LABEL_47;
      }
      if ((objc_msgSend(v19, "hasModificationDate") & 1) == 0)
        goto LABEL_47;

      if (objc_msgSend(v19, "hasAuthorizationMode"))
        v21 = objc_msgSend(v19, "_authorizationMode");
      else
        v21 = 0;
      objc_msgSend(v16, "syncIdentityManager");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "legacySyncIdentity");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "hasSyncIdentity"))
      {
        objc_msgSend(v19, "syncIdentity");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v59 = 0;
        +[HDSyncIdentity syncIdentityWithCodable:error:](HDSyncIdentity, "syncIdentityWithCodable:error:", v24, &v59);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v59;

        if (v25)
        {
          v57 = v21;
          objc_msgSend(v16, "syncIdentityManager");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v58 = v26;
          objc_msgSend(v27, "concreteIdentityForIdentity:shouldCreate:transaction:error:", v25, 1, v46, &v58);
          v28 = v23;
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v58;

          if (v23)
          {

            goto LABEL_32;
          }
          _HKInitializeLogging();
          v41 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v65 = v29;
            _os_log_fault_impl(&dword_1B7802000, v41, OS_LOG_TYPE_FAULT, "ConcreteSyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }
          v26 = v29;
        }
        else
        {
          _HKInitializeLogging();
          v40 = *MEMORY[0x1E0CB52B0];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138543362;
            v65 = v26;
            _os_log_fault_impl(&dword_1B7802000, v40, OS_LOG_TYPE_FAULT, "SyncIdentity from received codable is nil %{public}@", buf, 0xCu);
          }

        }
        goto LABEL_44;
      }
      v57 = v21;
LABEL_32:
      v56 = v23;
      v30 = objc_msgSend(v19, "_dataTypeCode");
      v31 = objc_msgSend(v19, "_authorizationStatus");
      v32 = objc_msgSend(v19, "_authorizationRequest");
      objc_msgSend(v19, "modificationDate");
      HDDecodeDateForValue();
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "entity");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "persistentID");
      if (objc_msgSend(v19, "hasModificationEpoch"))
      {
        v36 = v16;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v19, "modificationEpoch"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](v51, v47, v30, v31, v32, v57, v33, v54, a4, v35, a5, v37, a7, v36, v53, a11);

        v16 = v36;
        v18 = v45;

        if ((v38 & 1) == 0)
          goto LABEL_48;
      }
      else
      {
        v39 = +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](v51, v47, v30, v31, v32, v57, v33, v54, a4, v35, a5, 0, a7, v16, v53, a11);

        if (!(_DWORD)v39)
          goto LABEL_49;
      }
LABEL_44:
      ++v17;
    }
    while (v55 != v17);
    v39 = 1;
    v15 = v44;
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v66, 16);
    if (v55)
      continue;
    break;
  }
LABEL_51:

  return v39;
}

+ (uint64_t)_insertAuthorizationWithSourceIdentifier:(uint64_t)a3 dataTypeCode:(uint64_t)a4 authorizationStatus:(uint64_t)a5 authorizationRequest:(uint64_t)a6 authorizationMode:(void *)a7 modificationDate:(void *)a8 currentDate:(uint64_t)a9 syncProvenance:(uint64_t)a10 syncIdentity:(uint64_t)a11 objectAnchor:(void *)a12 modificationEpoch:(char)a13 options:(void *)a14 profile:(void *)a15 database:(uint64_t)a16 error:
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v38;
  void *v39;
  id v40;
  id v41;
  HDSourceEntity *v42;
  id v43;
  void *v44;
  id obj;
  uint64_t v49;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD v64[5];
  _QWORD v65[6];
  _QWORD v66[6];
  _QWORD v67[5];
  uint64_t v68;
  id *v69;
  uint64_t v70;
  uint64_t (*v71)(uint64_t, uint64_t);
  void (*v72)(uint64_t);
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD v78[5];
  _QWORD v79[4];
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t (*v85)(uint64_t, uint64_t);
  void (*v86)(uint64_t);
  id v87;

  v18 = a7;
  obj = a8;
  v19 = a8;
  v20 = a12;
  v21 = a14;
  v22 = a15;
  v23 = objc_opt_self();
  v24 = v23;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 0;
  v68 = 0;
  v69 = (id *)&v68;
  v70 = 0x3032000000;
  v71 = __Block_byref_object_copy__211;
  v72 = __Block_byref_object_dispose__211;
  v73 = 0;
  v49 = a6;
  if (a6 == 1)
  {
    v67[1] = 3221225472;
    v67[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke;
    v67[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v67[4] = v23;
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_2;
    v66[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
    v66[4] = a2;
    v66[5] = a3;
    v67[0] = MEMORY[0x1E0C809B0];
    v65[0] = MEMORY[0x1E0C809B0];
    v65[1] = 3221225472;
    v65[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_3;
    v65[3] = &unk_1E6CEB2A8;
    v65[4] = &v74;
    v65[5] = &v68;
    if (!objc_msgSend(v22, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error__lookupKey, a16, v67, v66, v65))goto LABEL_18;
  }
  v25 = v20;
  if (v25)
    goto LABEL_15;
  v41 = v21;
  v43 = v22;
  v39 = (void *)objc_opt_self();
  v42 = -[HDSQLiteEntity initWithPersistentID:]([HDSourceEntity alloc], "initWithPersistentID:", a2);
  -[HDSourceEntity sourceBundleIdentifierInDatabase:error:](v42, "sourceBundleIdentifierInDatabase:error:", v43, a16);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    objc_msgSend(v41, "sourceManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "allSourcesForBundleIdentifier:error:", v44, a16);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    v27 = v40;
    if (v40)
    {
      objc_msgSend(v40, "allObjects");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "hk_map:", &__block_literal_global_274_1);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR(", "));
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      v30 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v39, "disambiguatedDatabaseTable");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "stringWithFormat:", CFSTR("SELECT COALESCE(MAX(%@ + 1), 0) FROM %@ WHERE %@ in (%@) AND %@ = ?"), CFSTR("modification_epoch"), v31, CFSTR("source_id"), v38, CFSTR("object_type"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      v82 = 0;
      v83 = &v82;
      v84 = 0x3032000000;
      v85 = __Block_byref_object_copy__211;
      v86 = __Block_byref_object_dispose__211;
      v87 = 0;
      v33 = MEMORY[0x1E0C809B0];
      v79[0] = MEMORY[0x1E0C809B0];
      v79[1] = 3221225472;
      v79[2] = __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_2;
      v79[3] = &unk_1E6CE82D8;
      v80 = v40;
      v81 = a3;
      v78[0] = v33;
      v78[1] = 3221225472;
      v78[2] = __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_3;
      v78[3] = &unk_1E6CE8540;
      v78[4] = &v82;
      v34 = objc_msgSend(v43, "executeSQL:error:bindingHandler:enumerationHandler:", v32, a16, v79, v78)
          ? (void *)v83[5]
          : 0;
      v25 = v34;

      _Block_object_dispose(&v82, 8);
      v27 = v40;
    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 0;
  }

  if (v25)
  {
LABEL_15:
    if (v49 == 1 && (a13 & 1) != 0)
    {
      v75[3] = a11;
      objc_storeStrong(v69 + 5, obj);
    }
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_4;
    v64[3] = &__block_descriptor_40_e15___NSString_8__0l;
    v64[4] = v24;
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_5;
    v51[3] = &unk_1E6D116A8;
    v56 = a2;
    v57 = a3;
    v58 = a4;
    v59 = a5;
    v60 = v49;
    v62 = a10;
    v63 = a11;
    v52 = v18;
    v54 = &v74;
    v61 = a9;
    v55 = &v68;
    v35 = v25;
    v53 = v35;
    v36 = objc_msgSend(v22, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error__insertKey, a16, v64, v51, 0);

  }
  else
  {
LABEL_18:
    v36 = 0;
  }
  _Block_object_dispose(&v68, 8);

  _Block_object_dispose(&v74, 8);
  return v36;
}

id __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(*(id *)(a1 + 32), "disambiguatedDatabaseTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringWithFormat:", CFSTR("SELECT %@, %@ FROM %@ WHERE %@ = ? AND %@ = ?"), CFSTR("object_limit_anchor"), CFSTR("object_limit_modified"), v2, CFSTR("source_id"), CFSTR("object_type"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  return sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 40));
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB198](a2, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 0;
}

id __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_4(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v5[13];

  v5[12] = *MEMORY[0x1E0C80C00];
  v5[0] = CFSTR("source_id");
  v5[1] = CFSTR("object_type");
  v5[2] = CFSTR("status");
  v5[3] = CFSTR("request");
  v5[4] = CFSTR("mode");
  v5[5] = CFSTR("date_modified");
  v5[6] = CFSTR("provenance");
  v5[7] = CFSTR("sync_identity");
  v5[8] = CFSTR("deleted_object_anchor");
  v5[9] = CFSTR("object_limit_anchor");
  v5[10] = CFSTR("object_limit_modified");
  v5[11] = CFSTR("modification_epoch");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 12);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "insertSQLForProperties:shouldReplace:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __257__HDAuthorizationEntity__insertAuthorizationWithSourceIdentifier_dataTypeCode_authorizationStatus_authorizationRequest_authorizationMode_modificationDate_currentDate_syncProvenance_syncIdentity_objectAnchor_modificationEpoch_options_profile_database_error___block_invoke_5(uint64_t a1, sqlite3_stmt *a2)
{
  double v4;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 64));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 72));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 80));
  sqlite3_bind_int64(a2, 4, *(_QWORD *)(a1 + 88));
  sqlite3_bind_int64(a2, 5, *(_QWORD *)(a1 + 96));
  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  sqlite3_bind_double(a2, 6, v4);
  sqlite3_bind_int64(a2, 7, *(_QWORD *)(a1 + 104));
  sqlite3_bind_int64(a2, 8, *(_QWORD *)(a1 + 112));
  sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 120));
  sqlite3_bind_int64(a2, 10, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int64(a2, 12, objc_msgSend(*(id *)(a1 + 40), "longLongValue"));
}

const __CFString *__95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke()
{
  return CFSTR("?");
}

uint64_t __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      v9 = 0;
      v10 = v8;
      do
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        sqlite3_bind_int64(a2, v10 + v9, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "persistentID", (_QWORD)v13));
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 = v10 + v9;
    }
    while (v6);
    v11 = v10 + v9;
  }
  else
  {
    v11 = 1;
  }

  return sqlite3_bind_int64(a2, v11, *(_QWORD *)(a1 + 40));
}

uint64_t __95__HDAuthorizationEntity__nextModificationEpochForSourceIdentifier_type_profile_database_error___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  MEMORY[0x1BCCAB1C8](a2, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 0;
}

void __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  HDCodableAuthorization *v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  id v41;
  uint8_t buf[4];
  id v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = *(id *)(a1 + 32);
  v14 = v10;
  v15 = v11;
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v9);
    v17 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "syncIdentityManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "currentSyncIdentity");
    v19 = objc_claimAutoreleasedReturnValue();

    v13 = (id)v17;
    v12 = (id)v19;
  }
  objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "syncIdentityManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "currentSyncIdentity");
    v23 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v23;
  }
  else
  {
    v21 = v14;
  }
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", v9);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 48), "syncIdentityManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "currentSyncIdentity");
    v27 = objc_claimAutoreleasedReturnValue();

    v12 = (id)v27;
    if (!v13)
      goto LABEL_13;
  }
  else
  {
    v25 = v15;
    if (!v13)
      goto LABEL_13;
  }
  if (v21 && v25)
  {
    v28 = objc_alloc_init(HDCodableAuthorization);
    -[HDCodableAuthorization _setDataTypeCodeWithObjectType:](v28, "_setDataTypeCodeWithObjectType:", v9);
    -[HDCodableAuthorization _setAuthorizationStatusWithNumber:](v28, "_setAuthorizationStatusWithNumber:", v13);
    -[HDCodableAuthorization _setAuthorizationRequestWithNumber:](v28, "_setAuthorizationRequestWithNumber:", v21);
    -[HDCodableAuthorization _setAuthorizationModeWithNumber:](v28, "_setAuthorizationModeWithNumber:", v25);
    -[HDCodableAuthorization _setModificationDate:](v28, "_setModificationDate:", *(_QWORD *)(a1 + 72));
    objc_msgSend(v12, "identity");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "codableSyncIdentity");
    v41 = v9;
    v30 = v12;
    v31 = v25;
    v32 = v13;
    v33 = v21;
    v34 = v15;
    v35 = v14;
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDCodableAuthorization setSyncIdentity:](v28, "setSyncIdentity:", v36);

    v14 = v35;
    v15 = v34;
    v21 = v33;
    v13 = v32;
    v25 = v31;
    v12 = v30;
    v9 = v41;

    objc_msgSend(*(id *)(a1 + 80), "addObject:", v28);
    goto LABEL_15;
  }
LABEL_13:
  _HKInitializeLogging();
  v37 = (void *)*MEMORY[0x1E0CB5280];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_ERROR))
  {
    v38 = v14;
    v39 = v37;
    *(_DWORD *)buf = 138413058;
    v43 = (id)objc_opt_class();
    v44 = 2112;
    v45 = v9;
    v46 = 2112;
    v47 = v13;
    v48 = 2112;
    v49 = v21;
    v40 = v43;
    _os_log_error_impl(&dword_1B7802000, v39, OS_LOG_TYPE_ERROR, "%@: skipping authorization for type %@ with status %@ request %@", buf, 0x2Au);

    v14 = v38;
  }
LABEL_15:

}

BOOL __189__HDAuthorizationEntity__setAuthorizationStatuses_authorizationRequests_authorizationModes_sourceEntity_dateModified_syncProvenance_objectAnchor_options_profile_database_transaction_error___block_invoke_288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v21;

  v7 = HDSQLiteColumnAsInt64();
  v8 = HDSQLiteColumnAsInt64();
  v9 = HDSQLiteColumnAsInt64();
  v10 = HDSQLiteColumnAsInt64();
  objc_msgSend(*(id *)(a1 + 32), "syncIdentityManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 40);
  v21 = 0;
  objc_msgSend(v11, "identityForEntityID:transaction:error:", v10, v12, &v21);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v21;

  if (v13)
  {
    objc_msgSend(MEMORY[0x1E0CB6978], "dataTypeWithCode:", v7);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 48), "containsObject:", v15) & 1) == 0)
    {
      v16 = *(_QWORD *)(a1 + 64);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id, void *, void *, void *))(v16 + 16))(v16, v15, v17, v18, v13);

      objc_msgSend(*(id *)(a1 + 48), "addObject:", v15);
      objc_msgSend(*(id *)(a1 + 56), "removeObject:", v15);
    }
  }
  else
  {
    v19 = v14;
    v15 = v19;
    if (v19)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v19);
        *a5 = v15;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
  }

  return v13 != 0;
}

uint64_t __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  id v22;
  _QWORD v23[4];

  v23[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = CFSTR("source_id");
  v23[1] = CFSTR("object_type");
  v23[2] = CFSTR("request");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v22 = 0;
  objc_msgSend(v8, "maxPersistentIDWithPredicate:database:error:", 0, v5, &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;
  v11 = v10;
  if (v9)
    goto LABEL_2;
  if (!v10)
  {
    v9 = &unk_1E6DFEAF8;
LABEL_2:
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", *MEMORY[0x1E0D29618], v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v12, *(_QWORD *)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "queryWithDatabase:predicate:", v5, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke_2;
    v17[3] = &unk_1E6D11740;
    v21 = *(_QWORD *)(a1 + 48);
    v18 = v6;
    v19 = *(id *)(a1 + 40);
    v20 = v5;
    v15 = objc_msgSend(v14, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v7, a3, v17);

    goto LABEL_3;
  }
  if (a3)
  {
    v15 = 0;
    *a3 = objc_retainAutorelease(v10);
  }
  else
  {
    _HKLogDroppedError();
    v15 = 0;
  }
LABEL_3:

  return v15;
}

uint64_t __80__HDAuthorizationEntity__resetAuthorizationStatusesWithPredicate_profile_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v7 = HDSQLiteColumnAsInt64();
  v8 = HDSQLiteColumnAsInt64();
  v9 = HDSQLiteColumnAsInt64();
  return +[HDAuthorizationEntity _insertAuthorizationWithSourceIdentifier:dataTypeCode:authorizationStatus:authorizationRequest:authorizationMode:modificationDate:currentDate:syncProvenance:syncIdentity:objectAnchor:modificationEpoch:options:profile:database:error:](*(_QWORD *)(a1 + 56), v7, v8, 100, v9, 0, *(void **)(a1 + 32), *(void **)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 40), "currentSyncIdentityPersistentID"), 0, 0, 0, *(void **)(a1 + 40), *(void **)(a1 + 48), a5);
}

+ (id)_predicateForSourceEntities:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  objc_opt_self();
  objc_msgSend(v2, "hk_map:", &__block_literal_global_290_0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("source_id"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __53__HDAuthorizationEntity__predicateForSourceEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(a2, "persistentID"));
}

+ (id)databaseTable
{
  return CFSTR("authorization");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 13;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_110;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("source_id");
  +[HDHealthEntity defaultForeignKey](HDSourceEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("source_id");
  v3[1] = CFSTR("object_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("provenance");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

@end
