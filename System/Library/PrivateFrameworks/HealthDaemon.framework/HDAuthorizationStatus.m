@implementation HDAuthorizationStatus

+ (id)authorizationStatusForTypes:(id)a3 bundleIdentifier:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  HDMutableDatabaseTransactionContext *v12;
  void *v13;
  id v14;
  BOOL v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  char v24;
  void *v25;
  void *v26;
  _BOOL4 v27;
  void *v28;
  const __CFString *v29;
  id *v30;
  uint64_t v31;
  void *v33;
  id v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v35 = v9;
  if (!v10)
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = CFSTR("Missing application-identifier entitlement.");
    v30 = a6;
    v31 = 4;
LABEL_20:
    objc_msgSend(v28, "hk_assignError:code:description:", v30, v31, v29);
    v16 = 0;
    goto LABEL_23;
  }
  if (!objc_msgSend(v9, "count"))
  {
    v28 = (void *)MEMORY[0x1E0CB35C8];
    v29 = CFSTR("The types argument may not be empty");
    v30 = a6;
    v31 = 3;
    goto LABEL_20;
  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__178;
  v49 = __Block_byref_object_dispose__178;
  v50 = 0;
  v12 = objc_alloc_init(HDMutableDatabaseTransactionContext);
  -[HDMutableDatabaseTransactionContext setHighPriority:](v12, "setHighPriority:", 1);
  objc_msgSend(v11, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __84__HDAuthorizationStatus_authorizationStatusForTypes_bundleIdentifier_profile_error___block_invoke;
  v40[3] = &unk_1E6CF4F20;
  v44 = &v45;
  v41 = v10;
  v14 = v9;
  v42 = v14;
  v43 = v11;
  v15 = +[HDHealthEntity performReadTransactionWithHealthDatabase:context:error:block:](HDAuthorizationEntity, "performReadTransactionWithHealthDatabase:context:error:block:", v13, v12, a6, v40);
  v34 = v11;

  if (!v15)
  {
    v16 = 0;
    goto LABEL_22;
  }
  v16 = (void *)objc_msgSend((id)v46[5], "mutableCopy");
  objc_msgSend(MEMORY[0x1E0CB6978], "_typesIncludingParentTypes:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v16, "count");
  if (v18 == objc_msgSend(v17, "count"))
    goto LABEL_17;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v19 = v17;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  v33 = v17;
  if (!v20)
    goto LABEL_16;
  v21 = *(_QWORD *)v37;
  do
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v37 != v21)
        objc_enumerationMutation(v19);
      v23 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
      objc_msgSend(v23, "code", v33);
      v24 = HKDataTypeRequiresAuthorization();
      v25 = &unk_1E6DFE750;
      if ((v24 & 1) != 0)
      {
        objc_msgSend((id)v46[5], "objectForKeyedSubscript:", v23);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v26 == 0;

        if (!v27)
          continue;
        v25 = &unk_1E6DFE738;
      }
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v25, v23);
    }
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v36, v51, 16);
  }
  while (v20);
LABEL_16:

  v17 = v33;
LABEL_17:

LABEL_22:
  _Block_object_dispose(&v45, 8);

  v11 = v34;
LABEL_23:

  return v16;
}

BOOL __84__HDAuthorizationStatus_authorizationStatusForTypes_bundleIdentifier_profile_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  +[HDAuthorizationEntity authorizationStatusesForBundleIdentifier:types:profile:error:](HDAuthorizationEntity, "authorizationStatusesForBundleIdentifier:types:profile:error:", a1[4], a1[5], a1[6], a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(a1[7] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v7 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  if (!v7)
  {
    _HKInitializeLogging();
    v8 = *MEMORY[0x1E0CB5280];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5280], OS_LOG_TYPE_INFO))
    {
      v9 = a1[5];
      v11 = 138412290;
      v12 = v9;
      _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_INFO, "Could not determine authorization status for types %@", (uint8_t *)&v11, 0xCu);
    }
  }
  return v7 != 0;
}

+ (BOOL)isAuthorizedForObjectType:(id)a3 authorizationStatus:(id)a4 clientEntitlements:(id)a5 sharing:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v7;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  void *v19;
  int v20;
  char v21;
  BOOL v22;
  void *v23;
  void *v24;
  void *v26;
  void *v28;

  v7 = a6;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationStatus.m"), 95, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("authorizationStatus != nil"));

  }
  v15 = objc_msgSend(v13, "integerValue");
  v16 = HKAuthorizationStatusAllowsSharing();
  v17 = HKAuthorizationStatusAllowsReading();
  v18 = *MEMORY[0x1E0CB5DF0];
  v28 = v12;
  objc_msgSend(v12, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v14, "arrayEntitlement:containsString:", v18, v19);

  if ((unint64_t)(v15 - 101) < 4)
  {
    if (v7)
      v21 = v16;
    else
      v21 = v17;
    if ((v21 & 1) != 0)
      goto LABEL_8;
    goto LABEL_14;
  }
  if (v15 != 100)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAuthorizationStatus.m"), 117, CFSTR("Unexpected authorization status %@"), v13);

LABEL_14:
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 4, CFSTR("Not authorized"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_15;
  }
  if (v7 || v20 != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:description:", 5, CFSTR("Authorization is not determined"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_15:
    v22 = 0;
    *a7 = v23;
    goto LABEL_16;
  }
LABEL_8:
  v22 = 1;
LABEL_16:

  return v22;
}

@end
