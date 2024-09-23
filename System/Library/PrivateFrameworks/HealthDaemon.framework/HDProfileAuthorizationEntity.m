@implementation HDProfileAuthorizationEntity

+ (id)databaseTable
{
  return CFSTR("profile_authorization");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_5;
}

+ (int64_t)protectionClass
{
  return 1;
}

+ (id)_allProperties
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("source_bundle_id");
  v1[1] = CFSTR("status");
  v1[2] = CFSTR("date_modified");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)setStatusIfNeeded:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
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
  int64_t v20;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v10, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__HDProfileAuthorizationEntity_setStatusIfNeeded_profile_bundleIdentifier_error___block_invoke;
  v16[3] = &unk_1E6CEA620;
  v17 = v10;
  v18 = v11;
  v19 = a1;
  v20 = a3;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __81__HDProfileAuthorizationEntity_setStatusIfNeeded_profile_bundleIdentifier_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v13 = 0;
  if (!objc_msgSend(*(id *)(a1 + 48), "fetchStatus:profile:bundleIdentifier:error:", &v13, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a3))return 0;
  v5 = *(_QWORD *)(a1 + 56);
  if (v13 == v5)
    return 1;
  v7 = *(_QWORD *)(a1 + 32);
  v10 = a1 + 40;
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(void **)(v10 + 8);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "setStatus:profile:bundleIdentifier:dateModified:error:", v5, v7, v8, v11, a3);

  return v6;
}

+ (BOOL)setStatus:(int64_t)a3 profile:(id)a4 bundleIdentifier:(id)a5 dateModified:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  int64_t v24;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (objc_msgSend(v12, "profileType") == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_invalidProfileError");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      if (a7)
        *a7 = objc_retainAutorelease(v15);
      else
        _HKLogDroppedError();
    }

    v19 = 0;
  }
  else
  {
    objc_msgSend(v12, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[HDProfileAuthorizationEntity _allProperties]();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__HDProfileAuthorizationEntity_setStatus_profile_bundleIdentifier_dateModified_error___block_invoke;
    v21[3] = &unk_1E6CE8268;
    v22 = v13;
    v24 = a3;
    v23 = v14;
    objc_msgSend(a1, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 1, v16, v17, a7, v21);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v18 != 0;
    v15 = v22;
  }

  return v19;
}

void __86__HDProfileAuthorizationEntity_setStatus_profile_bundleIdentifier_dateModified_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB144](a2, CFSTR("source_bundle_id"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB114](a2, CFSTR("status"), *(_QWORD *)(a1 + 48));
  JUMPOUT(0x1BCCAB0E4);
}

+ (BOOL)fetchStatus:(int64_t *)a3 profile:(id)a4 bundleIdentifier:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  unint64_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v11 = a5;
  if (objc_msgSend(v10, "profileType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("source_bundle_id"), v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(a1, "propertyValueForAnyWithProperty:predicate:healthDatabase:error:", CFSTR("status"), v13, v14, &v20);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;

    if (!v15)
    {
      if (v16)
      {
        if (a6)
        {
          v12 = 0;
          *a6 = objc_retainAutorelease(v16);
        }
        else
        {
          _HKLogDroppedError();
          v12 = 0;
        }
        goto LABEL_16;
      }
      *a3 = 0;
LABEL_15:
      v12 = 1;
LABEL_16:

      goto LABEL_17;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = objc_msgSend(v15, "integerValue");
      if (v17 < 3)
      {
LABEL_14:
        *a3 = v17;
        goto LABEL_15;
      }
    }
    else
    {
      v17 = -1;
    }
    _HKInitializeLogging();
    HKLogInfrastructure();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v22 = a1;
      v23 = 2048;
      v24 = v17;
      _os_log_error_impl(&dword_1B7802000, v18, OS_LOG_TYPE_ERROR, "%{public}@ Encountered unexpected value %ld in table profile_authorization", buf, 0x16u);
    }

    v17 = 0;
    goto LABEL_14;
  }
  v12 = 1;
  *a3 = 1;
LABEL_17:

  return v12;
}

+ (id)anyForBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v8 = (void *)MEMORY[0x1E0D29838];
  v9 = a4;
  objc_msgSend(v8, "predicateWithProperty:equalToValue:", CFSTR("source_bundle_id"), a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v10, v11, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)unitTest_getBundleIdentifier:(id *)a3 status:(int64_t *)a4 dateModified:(id *)a5 forProfile:(id)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  _QWORD v17[7];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v12 = a6;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__14;
  v28 = __Block_byref_object_dispose__14;
  v29 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  v23 = 0;
  +[HDProfileAuthorizationEntity _allProperties]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__HDProfileAuthorizationEntity_unitTest_getBundleIdentifier_status_dateModified_forProfile_error___block_invoke;
  v17[3] = &unk_1E6CEA648;
  v17[4] = &v24;
  v17[5] = &v18;
  v17[6] = a4;
  v15 = -[HDHealthEntity getValuesForProperties:healthDatabase:error:handler:](self, "getValuesForProperties:healthDatabase:error:handler:", v13, v14, a7, v17);

  if (v15)
  {
    if (a3)
      *a3 = objc_retainAutorelease((id)v25[5]);
    if (a5)
      *a5 = objc_retainAutorelease((id)v19[5]);
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

void __98__HDProfileAuthorizationEntity_unitTest_getBundleIdentifier_status_dateModified_forProfile_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  if (*(_QWORD *)(a1 + 48))
    **(_QWORD **)(a1 + 48) = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsString();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  HDSQLiteColumnWithNameAsDate();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end
