@implementation HDAppSubscriptionAppLaunchEntity

+ (int64_t)protectionClass
{
  return 1;
}

+ (BOOL)setLaunchTime:(id)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v12, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke;
  v18[3] = &unk_1E6CE7C58;
  v19 = v11;
  v20 = v12;
  v21 = v10;
  v22 = a1;
  v14 = v10;
  v15 = v12;
  v16 = v11;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAppSubscriptionAppLaunchEntity, "performWriteTransactionWithHealthDatabase:error:block:", v13, a6, v18);

  return (char)a6;
}

uint64_t __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  BOOL v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  const __CFString *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 56);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](*(_QWORD *)(a1 + 56), *(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "anyInDatabase:predicate:error:", v6, v7, &v28);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v28;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (v10)
  {
    if (v8)
    {
      v29 = CFSTR("last_launch_time");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v29, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v9;
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_3;
      v21[3] = &unk_1E6CE84C8;
      v22 = *(id *)(a1 + 48);
      v13 = objc_msgSend(v8, "updateProperties:healthDatabase:error:bindingHandler:", v11, v12, &v23, v21);
      v14 = v23;

    }
    else
    {
      v15 = *(void **)(a1 + 56);
      objc_msgSend(*(id *)(a1 + 40), "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = CFSTR("bundle_id");
      v30[1] = CFSTR("last_launch_time");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v9;
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_2;
      v24[3] = &unk_1E6CE89A8;
      v25 = *(id *)(a1 + 32);
      v26 = *(id *)(a1 + 48);
      objc_msgSend(v15, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v16, v17, &v27, v24);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v27;

      if (v18)
        v19 = 1;
      else
        v19 = v14 == 0;
      v13 = v19;
      if (!v19)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

    }
  }
  else if (a3)
  {
    v14 = objc_retainAutorelease(v9);
    v13 = 0;
    *a3 = v14;
  }
  else
  {
    _HKLogDroppedError();
    v13 = 0;
    v14 = v9;
  }

  return v13;
}

void __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB144](a2, CFSTR("bundle_id"), *(_QWORD *)(a1 + 32));
  JUMPOUT(0x1BCCAB12CLL);
}

void __76__HDAppSubscriptionAppLaunchEntity_setLaunchTime_forBundleID_profile_error___block_invoke_3()
{
  JUMPOUT(0x1BCCAB12CLL);
}

+ (id)launchTimeForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  int v19;
  void *v20;
  void *v21;
  void *v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAppSubscriptionEntity.m"), 313, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != nil"));

  }
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10;
  v13 = v11;
  v14 = (void *)objc_opt_self();
  v15 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26[0] = CFSTR("last_launch_time");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __76__HDAppSubscriptionAppLaunchEntity__launchTimesWithPredicate_profile_error___block_invoke;
  v24[3] = &unk_1E6CE9FC0;
  v18 = v15;
  v25 = v18;
  v19 = objc_msgSend(v14, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v16, v13, v17, a5, v24);

  if (v19)
    v20 = (void *)objc_msgSend(v18, "copy");
  else
    v20 = 0;

  objc_msgSend(v20, "firstObject");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

+ (BOOL)removeBundleIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a5) = objc_msgSend(a1, "deleteEntitiesWithPredicate:healthDatabase:error:", v9, v10, a5);
  return (char)a5;
}

uint64_t __76__HDAppSubscriptionAppLaunchEntity__launchTimesWithPredicate_profile_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v5;

  v4 = *(void **)(a1 + 32);
  MEMORY[0x1BCCAB1BC](a4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);

  return 1;
}

+ (BOOL)insertOrUpdateAppSDKVersionToken:(unint64_t)a3 forBundleID:(id)a4 profile:(id)a5 error:(id *)a6
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
  unint64_t v20;

  v10 = a4;
  v11 = a5;
  objc_msgSend(v11, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke;
  v16[3] = &unk_1E6CEA620;
  v17 = v10;
  v18 = v11;
  v19 = a1;
  v20 = a3;
  v13 = v11;
  v14 = v10;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDAppSubscriptionAppLaunchEntity, "performWriteTransactionWithHealthDatabase:error:block:", v12, a6, v16);

  return (char)a6;
}

uint64_t __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *v20;
  BOOL v21;
  _QWORD v23[5];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  const __CFString *v31;
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:](*(_QWORD *)(a1 + 48), *(void **)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  objc_msgSend(v5, "anyInDatabase:predicate:error:", v6, v7, &v30);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v30;

  if (v8)
    v10 = 1;
  else
    v10 = v9 == 0;
  if (v10)
  {
    if (v8)
    {
      v31 = CFSTR("sdk_version");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "database");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v9;
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_2;
      v23[3] = &__block_descriptor_40_e34_v16__0__HDSQLiteStatementBinder__8l;
      v23[4] = *(_QWORD *)(a1 + 56);
      v13 = objc_msgSend(v8, "updateProperties:healthDatabase:error:bindingHandler:", v11, v12, &v24, v23);
      v14 = v24;

    }
    else
    {
      v15 = *(void **)(a1 + 48);
      objc_msgSend(*(id *)(a1 + 40), "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32[0] = CFSTR("bundle_id");
      v32[1] = CFSTR("sdk_version");
      v32[2] = CFSTR("last_launch_time");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v9;
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_256;
      v25[3] = &unk_1E6CE8268;
      v18 = *(id *)(a1 + 32);
      v19 = *(_QWORD *)(a1 + 56);
      v26 = v18;
      v27 = &unk_1E6DFE930;
      v28 = v19;
      objc_msgSend(v15, "insertOrReplaceEntity:healthDatabase:properties:error:bindingHandler:", 0, v16, v17, &v29, v25);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v29;

      if (v20)
        v21 = 1;
      else
        v21 = v14 == 0;
      v13 = v21;
      if (!v21)
      {
        if (a3)
          *a3 = objc_retainAutorelease(v14);
        else
          _HKLogDroppedError();
      }

    }
  }
  else if (a3)
  {
    v14 = objc_retainAutorelease(v9);
    v13 = 0;
    *a3 = v14;
  }
  else
  {
    _HKLogDroppedError();
    v13 = 0;
    v14 = v9;
  }

  return v13;
}

void __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_256(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  MEMORY[0x1BCCAB144](a2, CFSTR("bundle_id"), *(_QWORD *)(a1 + 32));
  v3 = HKBitPatternCastUnsignedToSignedInt64();
  MEMORY[0x1BCCAB114](a2, CFSTR("sdk_version"), v3);
  JUMPOUT(0x1BCCAB12CLL);
}

void __95__HDAppSubscriptionAppLaunchEntity_insertOrUpdateAppSDKVersionToken_forBundleID_profile_error___block_invoke_2()
{
  HKBitPatternCastUnsignedToSignedInt64();
  JUMPOUT(0x1BCCAB114);
}

+ (unint64_t)appSDKVersionTokenForBundleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  unint64_t v15;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDAppSubscriptionEntity.m"), 394, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID != nil"));

  }
  +[HDAppSubscriptionEntity _predicateForBundleIdentifier:]((uint64_t)a1, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v23[0] = CFSTR("sdk_version");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __80__HDAppSubscriptionAppLaunchEntity_appSDKVersionTokenForBundleID_profile_error___block_invoke;
  v18[3] = &unk_1E6D0D550;
  v18[4] = &v19;
  v14 = objc_msgSend(a1, "enumerateProperties:withPredicate:healthDatabase:error:enumerationHandler:", v12, v11, v13, a5, v18);

  if (v14)
    v15 = v20[3];
  else
    v15 = 0;
  _Block_object_dispose(&v19, 8);

  return v15;
}

uint64_t __80__HDAppSubscriptionAppLaunchEntity_appSDKVersionTokenForBundleID_profile_error___block_invoke(uint64_t a1)
{
  HDSQLiteColumnWithNameAsInt64();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HKBitPatternCastSignedToUnsignedInt64();
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("subscription_app_launch");
}

+ (id)tableAliases
{
  return &unk_1E6DFA610;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_264;
}

@end
