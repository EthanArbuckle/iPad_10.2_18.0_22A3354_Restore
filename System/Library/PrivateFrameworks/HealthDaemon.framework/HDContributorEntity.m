@implementation HDContributorEntity

+ (id)databaseTable
{
  return CFSTR("contributors");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDContributorEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertOrLookupContributorEntityForNoContributorWithTransaction:(id)a3 syncIdentity:(int64_t)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v16;
  _QWORD v17[4];
  id v18;
  int64_t v19;
  id v20;
  id v21;
  _QWORD v22[10];

  v22[9] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "databaseForEntityClass:", a1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "noneContributorUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v8, v10, &v21);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v21;
  v13 = v12;
  if (v11)
  {
    v14 = v11;
  }
  else if (v12)
  {
    if (a5)
    {
      v13 = objc_retainAutorelease(v12);
      v14 = 0;
      *a5 = v13;
    }
    else
    {
      _HKLogDroppedError();
      v14 = 0;
    }
  }
  else
  {
    v22[0] = CFSTR("uuid");
    v22[1] = CFSTR("apple_id");
    v22[2] = CFSTR("caller_id");
    v22[3] = CFSTR("deleted");
    v22[4] = CFSTR("mod_date");
    v22[5] = CFSTR("sync_anchor");
    v22[6] = CFSTR("sync_provenance");
    v22[7] = CFSTR("sync_identity");
    v22[8] = CFSTR("primary_user");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __105__HDContributorEntity_insertOrLookupContributorEntityForNoContributorWithTransaction_syncIdentity_error___block_invoke;
    v17[3] = &unk_1E6CECA50;
    v18 = v9;
    v19 = a4;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v8, v16, &v20, v17);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v20;

  }
  return v14;
}

+ (id)_predicateForContributorWithUUID:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  v3 = (void *)MEMORY[0x1E0D29838];
  _HDSQLiteValueForUUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "predicateWithProperty:equalToValue:", CFSTR("uuid"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void __105__HDContributorEntity_insertOrLookupContributorEntityForNoContributorWithTransaction_syncIdentity_error___block_invoke(uint64_t a1, uint64_t a2)
{
  double Current;

  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  MEMORY[0x1BCCAB120](a2, CFSTR("apple_id"));
  MEMORY[0x1BCCAB120](a2, CFSTR("caller_id"));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("deleted"), 0);
  Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1BCCAB0F0](a2, CFSTR("mod_date"), Current);
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_anchor"), 0);
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), 0);
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity"), *(_QWORD *)(a1 + 40));
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 profile:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  id v29;
  uint64_t *v30;
  id v31;
  BOOL v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__40;
  v37 = __Block_byref_object_dispose__40;
  v38 = 0;
  objc_msgSend(v17, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __81__HDContributorEntity_insertWithUUID_appleID_callerID_primaryUser_profile_error___block_invoke;
  v25[3] = &unk_1E6CEF610;
  v30 = &v33;
  v31 = a1;
  v19 = v14;
  v26 = v19;
  v20 = v15;
  v27 = v20;
  v21 = v16;
  v28 = v21;
  v22 = v17;
  v29 = v22;
  v32 = a6;
  objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v18, a8, v25);

  v23 = (id)v34[5];
  _Block_object_dispose(&v33, 8);

  return v23;
}

uint64_t __81__HDContributorEntity_insertWithUUID_appleID_callerID_primaryUser_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  double Current;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  id v33;

  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 72));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 72);
  v33 = 0;
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:](v6, v5, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v33;
  v9 = v8;
  if (!v7)
  {
    v25 = v8;
    v21 = v25;
    if (v25)
    {
      if (a3)
      {
        v21 = objc_retainAutorelease(v25);
        *a3 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    goto LABEL_13;
  }
  v28 = a3;
  v10 = *(_QWORD *)(a1 + 72);
  v11 = *(void **)(a1 + 32);
  v12 = *(void **)(a1 + 40);
  v31 = *(void **)(a1 + 48);
  Current = CFAbsoluteTimeGetCurrent();
  v29 = v7;
  v14 = objc_msgSend(v7, "longLongValue");
  objc_msgSend(*(id *)(a1 + 56), "syncIdentityManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "currentSyncIdentity");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "entity");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "persistentID");
  v19 = *(_BYTE *)(a1 + 80);
  v32 = v9;
  v30 = v5;
  +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, v10, v11, v12, v31, v14, 0, v18, v19, v5, (uint64_t)&v32);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v32;

  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v20;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
  {
    v26 = v21;
    v21 = v26;
    if (v26)
    {
      if (v28)
      {
        v21 = objc_retainAutorelease(v26);
        *v28 = v21;
      }
      else
      {
        _HKLogDroppedError();
      }
    }
    v7 = v29;
    v5 = v30;
LABEL_13:

    v24 = 0;
    goto LABEL_14;
  }
  v24 = 1;
  v7 = v29;
  v5 = v30;
LABEL_14:

  return v24;
}

+ (id)_nextSyncAnchorInDatabase:(_QWORD *)a3 error:
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v10;

  v4 = a2;
  v10 = 0;
  objc_msgSend((id)objc_opt_self(), "maxValueForProperty:predicate:database:error:", CFSTR("sync_anchor"), 0, v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v10;
  v7 = v6;
  if (v5 || !v6)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v5, "longLongValue") + 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (a3)
  {
    v8 = 0;
    *a3 = objc_retainAutorelease(v6);
  }
  else
  {
    _HKLogDroppedError();
    v8 = 0;
  }

  return v8;
}

+ (id)_insertWithUUID:(double)a1 appleID:(uint64_t)a2 callerID:(void *)a3 deleted:(void *)a4 modificationDate:(void *)a5 syncAnchor:(uint64_t)a6 syncProvenance:(uint64_t)a7 syncIdentity:(uint64_t)a8 primaryUser:(char)a9 database:(void *)a10 error:(uint64_t)a11
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  _QWORD v29[4];
  id v30;
  id v31;
  id v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  char v38;
  _QWORD v39[11];

  v39[9] = *MEMORY[0x1E0C80C00];
  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a10;
  v22 = (void *)objc_opt_self();
  v39[0] = CFSTR("uuid");
  v39[1] = CFSTR("apple_id");
  v39[2] = CFSTR("caller_id");
  v39[3] = CFSTR("deleted");
  v39[4] = CFSTR("mod_date");
  v39[5] = CFSTR("sync_anchor");
  v39[6] = CFSTR("sync_provenance");
  v39[7] = CFSTR("sync_identity");
  v39[8] = CFSTR("primary_user");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 9);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = MEMORY[0x1E0C809B0];
  v29[1] = 3221225472;
  v29[2] = __147__HDContributorEntity__insertWithUUID_appleID_callerID_deleted_modificationDate_syncAnchor_syncProvenance_syncIdentity_primaryUser_database_error___block_invoke;
  v29[3] = &unk_1E6CEF638;
  v30 = v18;
  v31 = v19;
  v32 = v20;
  v37 = 0;
  v33 = a1;
  v34 = a6;
  v35 = a7;
  v36 = a8;
  v38 = a9;
  v24 = v20;
  v25 = v19;
  v26 = v18;
  objc_msgSend(v22, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v21, v23, a11, v29);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

+ (id)insertWithUUID:(id)a3 appleID:(id)a4 callerID:(id)a5 primaryUser:(BOOL)a6 syncProvenance:(int64_t)a7 syncIdentity:(int64_t)a8 transaction:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  double Current;
  void *v22;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  objc_msgSend(a9, "databaseForEntityClass:", a1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)a1, v19, a10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {
    Current = CFAbsoluteTimeGetCurrent();
    +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, (uint64_t)a1, v16, v17, v18, objc_msgSend(v20, "longLongValue"), a7, a8, a6, v19, (uint64_t)a10);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = 0;
  }

  return v22;
}

+ (id)insertPrimaryUserWithAppleID:(id)a3 callerID:(id)a4 syncIdentity:(int64_t)a5 database:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double Current;
  void *v18;

  v12 = a3;
  v13 = a4;
  v14 = a6;
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)a1, v14, a7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    Current = CFAbsoluteTimeGetCurrent();
    +[HDContributorEntity _insertWithUUID:appleID:callerID:deleted:modificationDate:syncAnchor:syncProvenance:syncIdentity:primaryUser:database:error:](Current, (uint64_t)a1, v16, v12, v13, objc_msgSend(v15, "longLongValue"), 0, a5, 1, v14, (uint64_t)a7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

void __147__HDContributorEntity__insertWithUUID_appleID_callerID_deleted_modificationDate_syncAnchor_syncProvenance_syncIdentity_primaryUser_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  MEMORY[0x1BCCAB168](a2, CFSTR("uuid"), *(_QWORD *)(a1 + 32));
  if (*(_QWORD *)(a1 + 40))
    MEMORY[0x1BCCAB144](a2, CFSTR("apple_id"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("apple_id"));
  if (*(_QWORD *)(a1 + 48))
    MEMORY[0x1BCCAB144](a2, CFSTR("caller_id"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("caller_id"));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("deleted"), *(unsigned __int8 *)(a1 + 88));
  MEMORY[0x1BCCAB0F0](a2, CFSTR("mod_date"), *(double *)(a1 + 56));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_anchor"), *(_QWORD *)(a1 + 64));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_provenance"), *(_QWORD *)(a1 + 72));
  MEMORY[0x1BCCAB114](a2, CFSTR("sync_identity"), *(_QWORD *)(a1 + 80));
  JUMPOUT(0x1BCCAB0CCLL);
}

+ (BOOL)deleteContributorWithUUID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v8 = a3;
  objc_msgSend(a4, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke;
  v12[3] = &unk_1E6CEF660;
  v13 = v8;
  v14 = a1;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(a1, "performWriteTransactionWithHealthDatabase:error:block:", v9, a5, v12);

  return (char)a5;
}

uint64_t __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[6];

  v25[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntityClass:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 40);
  v23 = 0;
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:](v6, v5, &v23);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v23;
  v9 = v8;
  if (v7)
  {
    v25[0] = CFSTR("apple_id");
    v25[1] = CFSTR("caller_id");
    v25[2] = CFSTR("deleted");
    v25[3] = CFSTR("mod_date");
    v25[4] = CFSTR("sync_anchor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 5);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    +[HDContributorEntity _predicateForContributorWithUUID:](*(_QWORD *)(a1 + 40), *(void **)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v11;
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v24[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D29840], "predicateMatchingAllPredicates:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(void **)(a1 + 40);
    v22 = v9;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke_2;
    v20[3] = &unk_1E6CE84C8;
    v21 = v7;
    v16 = objc_msgSend(v15, "updateProperties:predicate:database:error:bindingHandler:", v10, v14, v5, &v22, v20);
    v17 = v22;

  }
  else
  {
    v19 = v8;
    v10 = v19;
    if (v19)
    {
      if (a3)
      {
        v10 = objc_retainAutorelease(v19);
        v16 = 0;
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
        v16 = 0;
      }
      v17 = v10;
    }
    else
    {
      v17 = 0;
      v16 = 0;
    }
  }

  return v16;
}

void __63__HDContributorEntity_deleteContributorWithUUID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double Current;

  MEMORY[0x1BCCAB120](a2, CFSTR("apple_id"));
  MEMORY[0x1BCCAB120](a2, CFSTR("caller_id"));
  MEMORY[0x1BCCAB0CC](a2, CFSTR("deleted"), 1);
  Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1BCCAB0F0](a2, CFSTR("mod_date"), Current);
  objc_msgSend(*(id *)(a1 + 32), "longLongValue");
  JUMPOUT(0x1BCCAB114);
}

+ (id)contributorEntityWithUUID:(id)a3 profile:(id)a4 includeDeleted:(BOOL)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a5)
  {
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D29840];
    v19[0] = v11;
    v19[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v10, "database");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v11, v16, a6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

+ (id)contributorEntityForNoContributorWithProfile:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  objc_msgSend(a1, "noneContributorUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)a1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)primaryUserContributorInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = a3;
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("primary_user"), MEMORY[0x1E0C9AAB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "anyWithPredicate:healthDatabase:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)primaryUserContributorInDatabase:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0D29838];
  v7 = a3;
  objc_msgSend(v6, "predicateWithProperty:equalToValue:", CFSTR("primary_user"), MEMORY[0x1E0C9AAB0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "anyInDatabase:predicate:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)contributorForReference:(id)a3 profile:(id)a4 error:(id *)a5
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
  id v17;
  int v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[3];

  v31[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v8, "contributorType") == 2)
  {
    v10 = 0;
  }
  else
  {
    +[HDContributorEntity _predicateForContributorReference:]((uint64_t)a1, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0D29840];
    v31[0] = v11;
    v31[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    v26 = &v25;
    v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__40;
    v29 = __Block_byref_object_dispose__40;
    v30 = 0;
    objc_msgSend(v9, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __61__HDContributorEntity_contributorForReference_profile_error___block_invoke;
    v21[3] = &unk_1E6CEC9E0;
    v24 = a1;
    v17 = v15;
    v22 = v17;
    v23 = &v25;
    v18 = objc_msgSend(a1, "performReadTransactionWithHealthDatabase:error:block:", v16, a5, v21);

    if (v18)
      v19 = (void *)v26[5];
    else
      v19 = 0;
    v10 = v19;

    _Block_object_dispose(&v25, 8);
  }

  return v10;
}

+ (id)_predicateForContributorReference:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  switch(objc_msgSend(v2, "contributorType"))
  {
    case 1:
      v4 = (void *)MEMORY[0x1E0D29838];
      v5 = *MEMORY[0x1E0D29618];
      objc_msgSend(v2, "persistentID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "predicateWithProperty:equalToValue:", v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    case 2:
      objc_msgSend(v3, "noneContributorUUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("primary_user"), MEMORY[0x1E0C9AAB0]);
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4:
      objc_msgSend(v2, "UUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = v9;
      +[HDContributorEntity _predicateForContributorWithUUID:]((uint64_t)v3, v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_9;
    default:
      objc_msgSend(MEMORY[0x1E0D29890], "falsePredicate");
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v7 = (void *)v8;
LABEL_9:

      return v7;
  }
}

uint64_t __61__HDContributorEntity_contributorForReference_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryWithDatabase:predicate:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("uuid");
  v13[1] = CFSTR("apple_id");
  v13[2] = CFSTR("caller_id");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__HDContributorEntity_contributorForReference_profile_error___block_invoke_2;
  v11[3] = &unk_1E6CEF688;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v8, a3, v11);

  return v9;
}

uint64_t __61__HDContributorEntity_contributorForReference_profile_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "noneContributorUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    HDSQLiteColumnWithNameAsString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB6510]), "_initWithUUID:appleID:callerID:", v2, v5, v6);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return 0;
}

+ (id)externalReferenceForContributorReference:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  id *v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD v35[3];

  v35[2] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  switch(objc_msgSend(v9, "contributorType"))
  {
    case 1:
    case 3:
      v24 = a5;
      +[HDContributorEntity _predicateForContributorReference:]((uint64_t)a1, v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_self();
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)MEMORY[0x1E0D29840];
      v35[0] = v11;
      v35[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "predicateMatchingAllPredicates:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = v15;
      v17 = v10;
      v18 = (void *)objc_opt_self();
      v29 = 0;
      v30 = &v29;
      v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__40;
      v33 = __Block_byref_object_dispose__40;
      v34 = 0;
      objc_msgSend(v17, "database");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke;
      v25[3] = &unk_1E6CEC9E0;
      v28 = v18;
      v20 = v16;
      v26 = v20;
      v27 = &v29;
      v21 = objc_msgSend(v18, "performReadTransactionWithHealthDatabase:error:block:", v19, v24, v25);

      if (v21)
        v22 = (void *)v30[5];
      else
        v22 = 0;
      v5 = v22;

      _Block_object_dispose(&v29, 8);
      break;
    case 2:
    case 4:
      v5 = v9;
      break;
    default:
      break;
  }

  return v5;
}

- (id)appleIDInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("apple_id"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)updateAppleID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __51__HDContributorEntity_updateAppleID_profile_error___block_invoke;
  v14[3] = &unk_1E6CE7950;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = objc_msgSend(v10, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v14);

  return (char)a5;
}

uint64_t __51__HDContributorEntity_updateAppleID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)HDContributorEntity, v5, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = v7;
  if (v6)
  {
    v20[0] = CFSTR("apple_id");
    v20[1] = CFSTR("mod_date");
    v20[2] = CFSTR("sync_anchor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __51__HDContributorEntity_updateAppleID_profile_error___block_invoke_2;
    v15[3] = &unk_1E6CE89A8;
    v10 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v17 = v6;
    v11 = objc_msgSend(v10, "updateProperties:database:error:bindingHandler:", v9, v5, &v18, v15);
    v12 = v18;

  }
  else
  {
    v14 = v7;
    v9 = v14;
    if (v14)
    {
      if (a3)
      {
        v9 = objc_retainAutorelease(v14);
        v11 = 0;
        *a3 = v9;
      }
      else
      {
        _HKLogDroppedError();
        v11 = 0;
      }
      v12 = v9;
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
  }

  return v11;
}

void __51__HDContributorEntity_updateAppleID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double Current;

  if (*(_QWORD *)(a1 + 32))
    MEMORY[0x1BCCAB144](a2, CFSTR("apple_id"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("apple_id"));
  Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1BCCAB0F0](a2, CFSTR("mod_date"), Current);
  objc_msgSend(*(id *)(a1 + 40), "longLongValue");
  JUMPOUT(0x1BCCAB114);
}

- (id)callerIDInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("caller_id"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)updateCallerID:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_opt_class();
  objc_msgSend(v9, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __52__HDContributorEntity_updateCallerID_profile_error___block_invoke;
  v14[3] = &unk_1E6CE7950;
  v14[4] = self;
  v15 = v8;
  v12 = v8;
  LOBYTE(a5) = objc_msgSend(v10, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v14);

  return (char)a5;
}

uint64_t __52__HDContributorEntity_updateCallerID_profile_error___block_invoke(uint64_t a1, void *a2, _QWORD *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "databaseForEntity:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  +[HDContributorEntity _nextSyncAnchorInDatabase:error:]((uint64_t)HDContributorEntity, v5, &v19);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v19;
  v8 = v7;
  if (v6)
  {
    v20[0] = CFSTR("caller_id");
    v20[1] = CFSTR("mod_date");
    v20[2] = CFSTR("sync_anchor");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v18 = v8;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__HDContributorEntity_updateCallerID_profile_error___block_invoke_2;
    v15[3] = &unk_1E6CE89A8;
    v10 = *(void **)(a1 + 32);
    v16 = *(id *)(a1 + 40);
    v17 = v6;
    v11 = objc_msgSend(v10, "updateProperties:database:error:bindingHandler:", v9, v5, &v18, v15);
    v12 = v18;

  }
  else
  {
    v14 = v7;
    v9 = v14;
    if (v14)
    {
      if (a3)
      {
        v9 = objc_retainAutorelease(v14);
        v11 = 0;
        *a3 = v9;
      }
      else
      {
        _HKLogDroppedError();
        v11 = 0;
      }
      v12 = v9;
    }
    else
    {
      v12 = 0;
      v11 = 0;
    }
  }

  return v11;
}

void __52__HDContributorEntity_updateCallerID_profile_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  double Current;

  if (*(_QWORD *)(a1 + 32))
    MEMORY[0x1BCCAB144](a2, CFSTR("caller_id"));
  else
    MEMORY[0x1BCCAB120](a2, CFSTR("caller_id"));
  Current = CFAbsoluteTimeGetCurrent();
  MEMORY[0x1BCCAB0F0](a2, CFSTR("mod_date"), Current);
  objc_msgSend(*(id *)(a1 + 40), "longLongValue");
  JUMPOUT(0x1BCCAB114);
}

- (id)modificationDateInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("mod_date"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0C99D68];
    objc_msgSend(v7, "doubleValue");
    objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)syncAnchorInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("sync_anchor"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)deletedInProfile:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;

  objc_msgSend(a3, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDHealthEntity valueForProperty:healthDatabase:error:](self, "valueForProperty:healthDatabase:error:", CFSTR("deleted"), v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(self) = objc_msgSend(v7, "BOOLValue");
  return (char)self;
}

+ (id)noneContributorUUID
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("00000000-0000-0000-0000-000000000000"));
}

uint64_t __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[4];
  __int128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v5 = *(void **)(a1 + 48);
  objc_msgSend(a2, "databaseForEntityClass:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryWithDatabase:predicate:", v6, *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13[0] = CFSTR("uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke_2;
  v11[3] = &unk_1E6CEF688;
  v12 = *(_OWORD *)(a1 + 40);
  v9 = objc_msgSend(v7, "enumerateProperties:error:enumerationHandler:", v8, a3, v11);

  return v9;
}

uint64_t __85__HDContributorEntity__contributorReferenceForEntityMatchingPredicate_profile_error___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  HDSQLiteColumnWithNameAsUUID();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "noneContributorUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  if (v4)
    +[HDContributorReference contributorReferenceForNoContributor](HDContributorReference, "contributorReferenceForNoContributor");
  else
    +[HDContributorReference contributorReferenceForOtherUserWithUUID:](HDContributorReference, "contributorReferenceForOtherUserWithUUID:", v2);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 0;
}

+ (id)propertyForSyncProvenance
{
  return CFSTR("sync_provenance");
}

+ (id)propertyForSyncAnchor
{
  return CFSTR("sync_anchor");
}

+ (id)propertyForSyncIdentity
{
  return CFSTR("sync_identity");
}

@end
