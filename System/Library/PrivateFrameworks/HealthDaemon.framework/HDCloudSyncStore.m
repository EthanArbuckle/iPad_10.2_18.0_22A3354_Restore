@implementation HDCloudSyncStore

+ (void)samplesDeletedInProfile:(id)a3 byUser:(BOOL)a4 intervals:(id)a5
{
  _BOOL8 v6;
  id v7;
  double v8;
  void *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  NSObject *v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  const __CFString *v22;
  id v23;
  _QWORD v24[2];
  _QWORD v25[2];
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v6 = a4;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v6)
    v8 = 86400.0;
  else
    v8 = 1209600.0;
  v9 = (void *)MEMORY[0x1E0C99D68];
  v10 = a5;
  objc_msgSend(v9, "dateWithTimeIntervalSinceNow:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v12 = +[HDCloudSyncStoreEntity rebaseRequiredByDate:intervals:profile:error:](HDCloudSyncStoreEntity, "rebaseRequiredByDate:intervals:profile:error:", v11, v10, v7, &v23);

  v13 = v23;
  if (!v12)
  {
    _HKInitializeLogging();
    v14 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      v22 = &stru_1E6D11BB8;
      if (v6)
        v22 = CFSTR(" by the user");
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2114;
      v29 = v13;
      _os_log_error_impl(&dword_1B7802000, v14, OS_LOG_TYPE_ERROR, "Failed to record rebase requirement after samples were deleted%{public}@: %{public}@", buf, 0x16u);
    }
  }
  v15 = kHDEventNameCloudSync;
  if (v6)
    v16 = &unk_1E6DFE4B0;
  else
    v16 = &unk_1E6DFE4C8;
  v24[0] = CFSTR("rebase-trigger");
  v24[1] = CFSTR("deadline");
  v25[0] = v16;
  v17 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v11, "timeIntervalSinceReferenceDate");
  objc_msgSend(v17, "numberWithDouble:");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDPowerLog(v15, v19, 1);

  objc_msgSend(v7, "daemon");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "analyticsSubmissionCoordinator");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cloudSync_reportRebaseTriggeredByDeletionByUser:", v6);

}

+ (id)syncStoreForProfile:(id)a3 storeIdentifier:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 syncIdentity:(id)a7 containerIdentifier:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)[HDCloudSyncStore alloc], v19, v18, v17, v16, v15, v14, 0, (uint64_t)a9);

  return v20;
}

- (id)_initWithProfile:(void *)a3 storeIdentifier:(void *)a4 syncCircleName:(void *)a5 ownerIdentifier:(void *)a6 syncIdentity:(void *)a7 containerIdentifier:(void *)a8 sharingIdentifier:(uint64_t)a9 sharingPredicate:shardPredicate:error:
{
  id v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  BOOL v23;
  id *v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  void *v38;
  id *v39;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  objc_super v47;
  _QWORD v48[4];
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  uint64_t (*v61)(uint64_t, uint64_t);
  void (*v62)(uint64_t);
  id v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t v67;

  v16 = a2;
  v46 = a3;
  v41 = a4;
  v45 = a5;
  v44 = a6;
  v43 = a7;
  v42 = a8;
  if (!a1)
  {
    v39 = 0;
    goto LABEL_9;
  }
  v64 = 0;
  v65 = &v64;
  v66 = 0x2020000000;
  v67 = 0;
  v58 = 0;
  v59 = &v58;
  v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__143;
  v62 = __Block_byref_object_dispose__143;
  v63 = 0;
  objc_msgSend(v16, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke;
  v48[3] = &unk_1E6D00680;
  v18 = v46;
  v49 = v18;
  v57 = 2;
  v19 = v16;
  v50 = v19;
  v55 = &v64;
  v20 = v45;
  v51 = v20;
  v21 = v43;
  v52 = v21;
  v22 = v44;
  v53 = v22;
  v54 = v42;
  v56 = &v58;
  v23 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncStoreEntity, "performWriteTransactionWithHealthDatabase:error:block:", v17, a9, v48);

  if (v23)
  {
    v47.receiver = a1;
    v47.super_class = (Class)HDCloudSyncStore;
    v24 = (id *)objc_msgSendSuper2(&v47, sel_init);
    a1 = v24;
    if (v24)
    {
      objc_storeWeak(v24 + 8, v19);
      v25 = objc_msgSend(v20, "copy");
      v26 = a1[5];
      a1[5] = (id)v25;

      v27 = objc_msgSend(v21, "copy");
      v28 = a1[6];
      a1[6] = (id)v27;

      v29 = objc_msgSend(0, "copy");
      v30 = a1[10];
      a1[10] = (id)v29;

      v31 = objc_msgSend(v22, "copy");
      v32 = a1[7];
      a1[7] = (id)v31;

      objc_storeStrong(a1 + 11, 0);
      v33 = objc_msgSend((id)v59[5], "copy");
      v34 = a1[9];
      a1[9] = (id)v33;

      v35 = objc_msgSend(v18, "copy");
      v36 = a1[4];
      a1[4] = (id)v35;

      a1[1] = (id)v65[3];
      *((_DWORD *)a1 + 6) = 16;
      objc_msgSend(a1, "persistedStateWithError:", a9);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v38 = v37;
      if (!v37)
      {
        v39 = 0;
        goto LABEL_8;
      }
      a1[2] = (id)objc_msgSend(v37, "baselineEpoch");

    }
    a1 = a1;
    v39 = a1;
  }
  else
  {
    v39 = 0;
  }
LABEL_8:

  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v64, 8);

LABEL_9:
  return v39;
}

uint64_t __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _HDCloudSyncStorePersistableState *v10;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  HDCloudSyncStoreEntity *v15;
  void *v16;
  void *v17;
  _BOOL4 v18;
  uint64_t v20;
  _QWORD v21[5];

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 96);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSyncStoreEntity syncStoreEntityWithUUID:type:healthDatabase:error:](HDSyncStoreEntity, "syncStoreEntityWithUUID:type:healthDatabase:error:", v7, v6, v8, a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = objc_msgSend(v9, "syncProvenance");
    LODWORD(v20) = 16;
    v10 = -[_HDCloudSyncStorePersistableState initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:]([_HDCloudSyncStorePersistableState alloc], "initWithServerChangeToken:baselineEpoch:rebaseDeadline:lastSyncDate:emptyZones:lastCheckDate:ownerIdentifier:containerIdentifier:syncIdentity:syncProtocolVersion:", 0, 0, 0, 0, 0, 0, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v20);
    v11 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = +[HDCloudSyncStoreEntity persistState:storeUUID:shouldReplace:healthDatabase:error:](HDCloudSyncStoreEntity, "persistState:storeUUID:shouldReplace:healthDatabase:error:", v10, v11, 0, v12, a3);

    v14 = 0;
    if (!v13)
    {
LABEL_13:

      goto LABEL_14;
    }
    if (!*(_QWORD *)(a1 + 72))
    {
      v14 = 1;
      goto LABEL_13;
    }
    v15 = -[HDSQLiteEntity initWithPersistentID:]([HDCloudSyncStoreEntity alloc], "initWithPersistentID:", objc_msgSend(v9, "persistentID"));
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke_2;
    v21[3] = &unk_1E6D00658;
    v21[4] = *(_QWORD *)(a1 + 88);
    if (-[HDCloudSyncStoreEntity fetchShardPropertiesInTransaction:error:handler:](v15, "fetchShardPropertiesInTransaction:error:handler:", v5, a3, v21))
    {
      if ((objc_msgSend(*(id *)(a1 + 72), "isEqual:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40)) & 1) != 0)
      {
LABEL_8:
        v14 = 1;
LABEL_11:

        goto LABEL_13;
      }
      objc_msgSend(*(id *)(a1 + 72), "startDate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 72), "endDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[HDCloudSyncStoreEntity updateShardStartDate:endDate:type:transaction:error:](v15, "updateShardStartDate:endDate:type:transaction:error:", v16, v17, (int)objc_msgSend(*(id *)(a1 + 72), "type"), v5, a3);

      if (v18)
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), *(id *)(a1 + 72));
        goto LABEL_8;
      }
    }
    v14 = 0;
    goto LABEL_11;
  }
  v14 = 0;
LABEL_14:

  return v14;
}

uint64_t __173__HDCloudSyncStore__initWithProfile_storeIdentifier_syncCircleName_ownerIdentifier_syncIdentity_containerIdentifier_sharingIdentifier_sharingPredicate_shardPredicate_error___block_invoke_2(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;

  v7 = a3;
  v8 = a2;
  v9 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", a4, v8, v7);

  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  return 1;
}

+ (id)shardPredicatesForProfile:(id)a3 syncCircleName:(id)a4 currentDate:(id)a5 error:(id *)a6
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;

  v7 = a3;
  v8 = a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "daemon");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "behavior");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "supportsCloudSyncStagingShard");

  if (v12)
  {
    v13 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", 2, 0, 0);
    objc_msgSend(v9, "addObject:", v13);

  }
  v14 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", 0, 0, 0);
  objc_msgSend(v9, "addObject:", v14);

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", 473299200.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", 1, 0, v15);
  objc_msgSend(v9, "addObject:", v16);

  v17 = v15;
  objc_msgSend(v17, "dateByAddingTimeInterval:", 15552000.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "hk_isBeforeDate:", v8))
  {
    v19 = v17;
    do
    {
      v20 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", 1, v19, v18);
      objc_msgSend(v9, "addObject:", v20);

      v21 = v18;
      objc_msgSend(v21, "dateByAddingTimeInterval:", 15552000.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = v21;
    }
    while ((objc_msgSend(v18, "hk_isBeforeDate:", v8) & 1) != 0);
  }
  else
  {
    v21 = v17;
  }
  v22 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", 1, v21, 0);
  objc_msgSend(v9, "addObject:", v22);

  return v9;
}

+ (id)createOrUpdateShardStoresForProfile:(id)a3 throughDate:(id)a4 syncCircleName:(id)a5 ownerIdentifier:(id)a6 containerIdentifier:(id)a7 syncIdentity:(id)a8 error:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  int v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  id v28;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  objc_msgSend(v15, "daemon");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "behavior");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "supportsCloudSyncSharding");

  if (v23)
  {
    v24 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v15, "database");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke;
    v30[3] = &unk_1E6D006D0;
    v31 = v18;
    v32 = v19;
    v33 = v20;
    v34 = v15;
    v35 = v16;
    v38 = a1;
    v36 = v17;
    v37 = v24;
    v26 = v24;
    LODWORD(v24) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDCloudSyncStoreEntity, "performWriteTransactionWithHealthDatabase:error:block:", v25, a9, v30);

    if ((_DWORD)v24)
      v27 = v26;
    else
      v27 = 0;
    v28 = v27;

  }
  else
  {
    v28 = (id)MEMORY[0x1E0C9AA60];
  }

  return v28;
}

uint64_t __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  int v27;
  void *v28;
  void **v29;
  void *v30;
  void *v31;
  uint64_t j;
  void *v33;
  uint64_t v34;
  HDCloudSyncShardPredicate *v35;
  uint64_t v36;
  void *v37;
  id v38;
  HDCloudSyncStore *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  int v48;
  id *v49;
  id *v50;
  uint64_t v51;
  void *v53;
  id v54;
  id v55;
  void *v57;
  id obj;
  void **v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  id v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(a1 + 56);
  v71[0] = MEMORY[0x1E0C809B0];
  v71[1] = 3221225472;
  v71[2] = __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke_2;
  v71[3] = &unk_1E6D006A8;
  v11 = v5;
  v72 = v11;
  v12 = v6;
  v73 = v12;
  v13 = v10;
  v14 = a3;
  v62 = v4;
  if (!+[HDCloudSyncStoreEntity enumerateShardsForOwnerIdentifier:containerIdentifier:syncIdentity:profile:transaction:error:handler:](HDCloudSyncStoreEntity, "enumerateShardsForOwnerIdentifier:containerIdentifier:syncIdentity:profile:transaction:error:handler:", v7, v8, v9, v13, v4, a3, v71))
  {
    v51 = 0;
    goto LABEL_40;
  }
  v55 = v11;
  v59 = (void **)a1;
  v15 = *(id *)(a1 + 64);
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  v16 = v12;
  v17 = v12;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  if (!v18)
    goto LABEL_14;
  v19 = v18;
  v20 = *(_QWORD *)v68;
  do
  {
    for (i = 0; i != v19; ++i)
    {
      if (*(_QWORD *)v68 != v20)
        objc_enumerationMutation(v17);
      v22 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
      objc_msgSend(v22, "startDate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hk_isAfterDate:", v15);

      if (v24)
      {
        objc_msgSend(v22, "startDate");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v22, "endDate");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hk_isAfterDate:", v15);

        if (!v27)
          continue;
        objc_msgSend(v22, "endDate");
        v25 = objc_claimAutoreleasedReturnValue();
      }
      v28 = (void *)v25;

      v15 = v28;
    }
    v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v67, v75, 16);
  }
  while (v19);
LABEL_14:

  v29 = v59;
  objc_msgSend(v59[11], "shardPredicatesForProfile:syncCircleName:currentDate:error:", v59[7], v59[9], v15, a3);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v30;
  if (v30)
  {
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = v30;
    v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
    if (v61)
    {
      v60 = *(_QWORD *)v64;
      v11 = v55;
      v53 = v31;
      v54 = v16;
      while (2)
      {
        for (j = 0; j != v61; ++j)
        {
          if (*(_QWORD *)v64 != v60)
            objc_enumerationMutation(obj);
          v33 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * j);
          v34 = objc_msgSend(v17, "indexOfObject:", v33);
          if (v34 != 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_24;
          v35 = [HDCloudSyncShardPredicate alloc];
          v36 = objc_msgSend(v33, "type");
          objc_msgSend(v33, "startDate");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:](v35, "initForShardType:startDate:endDate:", v36, v37, 0);
          v34 = objc_msgSend(v17, "indexOfObject:", v38);

          if (v34 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v39 = [HDCloudSyncStore alloc];
            v40 = v29[7];
            objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            v42 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)&v39->super.isa, v40, v41, v29[9], v29[4], v29[6], v29[5], v33, v14);

            if (!v42)
              goto LABEL_37;
            objc_msgSend(v29[10], "addObject:", v42);
          }
          else
          {
LABEL_24:
            objc_msgSend(v11, "objectAtIndexedSubscript:", v34);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "storeUUIDInTransaction:error:", v62, v14);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v43)
              goto LABEL_36;
            objc_msgSend(v17, "objectAtIndexedSubscript:", v34);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v44, "isEqual:", v33) & 1) == 0)
            {
              objc_msgSend(v33, "startDate");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "endDate");
              v57 = v44;
              v46 = v14;
              v47 = (void *)objc_claimAutoreleasedReturnValue();
              v48 = objc_msgSend(v42, "updateShardStartDate:endDate:type:transaction:error:", v45, v47, (int)objc_msgSend(v33, "type"), v62, v46);

              v14 = v46;
              v44 = v57;

              v11 = v55;
              if (!v48)
                goto LABEL_35;
            }
            v29 = v59;
            v49 = -[HDCloudSyncStore _initWithProfile:storeIdentifier:syncCircleName:ownerIdentifier:syncIdentity:containerIdentifier:sharingIdentifier:sharingPredicate:shardPredicate:error:]((id *)[HDCloudSyncStore alloc], v59[7], v43, v59[9], v59[4], v59[6], v59[5], v33, v14);
            if (!v49)
            {
LABEL_35:

LABEL_36:
LABEL_37:
              v16 = v54;

              v51 = 0;
              v31 = v53;
              goto LABEL_38;
            }
            v50 = v49;
            objc_msgSend(v59[10], "addObject:", v49);

          }
        }
        v51 = 1;
        v31 = v53;
        v16 = v54;
        v61 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v63, v74, 16);
        if (v61)
          continue;
        break;
      }
    }
    else
    {
      v51 = 1;
      v11 = v55;
    }
LABEL_38:

  }
  else
  {
    v51 = 0;
    v11 = v55;
  }

  v12 = v16;
LABEL_40:

  return v51;
}

uint64_t __138__HDCloudSyncStore_createOrUpdateShardStoresForProfile_throughDate_syncCircleName_ownerIdentifier_containerIdentifier_syncIdentity_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = *(void **)(a1 + 32);
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "addObject:", a2);
  v12 = *(void **)(a1 + 40);
  v13 = -[HDCloudSyncShardPredicate initForShardType:startDate:endDate:]([HDCloudSyncShardPredicate alloc], "initForShardType:startDate:endDate:", a5, v11, v10);

  objc_msgSend(v12, "addObject:", v13);
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  HDCloudSyncStore *v4;
  id WeakRetained;
  uint64_t v6;
  NSString *ownerIdentifier;
  uint64_t v8;
  NSString *containerIdentifier;
  uint64_t v10;
  NSString *sharingIdentifier;
  uint64_t v12;
  NSUUID *storeIdentifier;
  uint64_t v14;
  HDCloudSyncShardPredicate *shardPredicate;

  v4 = objc_alloc_init(HDCloudSyncStore);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_storeWeak((id *)&v4->_profile, WeakRetained);

  v6 = -[NSString copy](self->_ownerIdentifier, "copy");
  ownerIdentifier = v4->_ownerIdentifier;
  v4->_ownerIdentifier = (NSString *)v6;

  v8 = -[NSString copy](self->_containerIdentifier, "copy");
  containerIdentifier = v4->_containerIdentifier;
  v4->_containerIdentifier = (NSString *)v8;

  objc_storeStrong((id *)&v4->_syncIdentity, self->_syncIdentity);
  v10 = -[NSString copy](self->_sharingIdentifier, "copy");
  sharingIdentifier = v4->_sharingIdentifier;
  v4->_sharingIdentifier = (NSString *)v10;

  objc_storeStrong((id *)&v4->_sharingPredicate, self->_sharingPredicate);
  v12 = -[NSUUID copy](self->_storeIdentifier, "copy");
  storeIdentifier = v4->_storeIdentifier;
  v4->_storeIdentifier = (NSUUID *)v12;

  v4->_syncProvenance = self->_syncProvenance;
  v4->_syncEpoch = self->_syncEpoch;
  v4->_syncProtocolVersion = self->_syncProtocolVersion;
  v4->_syncTombstonesOnly = self->_syncTombstonesOnly;
  v14 = -[HDCloudSyncShardPredicate copy](self->_shardPredicate, "copy");
  shardPredicate = v4->_shardPredicate;
  v4->_shardPredicate = (HDCloudSyncShardPredicate *)v14;

  return v4;
}

- (id)syncStoreForEpoch:(int64_t)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)-[HDCloudSyncStore copy](self, "copy");
  v4[2] = a3;
  return v4;
}

- (id)syncStoreForProtocolVersion:(int)a3
{
  _DWORD *v5;
  void *v8;

  if (self->_syncProtocolVersion < a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDCloudSyncStore.m"), 390, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("syncProtocolVersion <= _syncProtocolVersion"));

  }
  v5 = (_DWORD *)-[HDCloudSyncStore copy](self, "copy");
  v5[6] = a3;
  return v5;
}

- (id)syncStoreForTombstoneSyncOnly:(BOOL)a3
{
  _BYTE *v4;

  v4 = (_BYTE *)-[HDCloudSyncStore copy](self, "copy");
  v4[29] = a3;
  return v4;
}

- (int)protocolVersion
{
  return self->_syncProtocolVersion;
}

- (int64_t)syncStoreType
{
  return 2;
}

- (BOOL)supportsRebase
{
  return -[HDCloudSyncShardPredicate type](self->_shardPredicate, "type") != 2;
}

- (id)receivedSyncAnchorMapWithError:(id *)a3
{
  HDSyncAnchorMap *v5;
  id WeakRetained;
  HDSyncAnchorMap *v7;
  HDSyncAnchorMap *v8;

  v5 = objc_alloc_init(HDSyncAnchorMap);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LODWORD(a3) = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 3, v5, self, WeakRetained, a3);

  if ((_DWORD)a3)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (BOOL)resetReceivedSyncAnchorMapWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = +[HDSyncAnchorEntity resetSyncAnchorsOfType:store:profile:error:](HDSyncAnchorEntity, "resetSyncAnchorsOfType:store:profile:error:", 3, self, WeakRetained, a3);

  return (char)a3;
}

- (BOOL)replacePersistedAnchorMap:(id)a3 error:(id *)a4
{
  HDProfile **p_profile;
  id v7;
  id WeakRetained;

  p_profile = &self->_profile;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  LOBYTE(a4) = +[HDSyncAnchorEntity setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:](HDSyncAnchorEntity, "setAcknowledgedAnchorsWithMap:store:resetNext:resetInvalid:profile:error:", v7, self, 1, 1, WeakRetained, a4);

  return (char)a4;
}

- (BOOL)clearAllSyncAnchorsWithError:(id *)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LOBYTE(a3) = +[HDSyncAnchorEntity resetSyncStore:profile:error:](HDSyncAnchorEntity, "resetSyncStore:profile:error:", self, WeakRetained, a3);

  return (char)a3;
}

- (id)getPersistedAnchorMapWithError:(id *)a3
{
  HDSyncAnchorMap *v5;
  id WeakRetained;
  HDSyncAnchorMap *v7;
  HDSyncAnchorMap *v8;

  v5 = objc_alloc_init(HDSyncAnchorMap);
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  LODWORD(a3) = +[HDSyncAnchorEntity getSyncAnchorsOfType:anchorMap:store:profile:error:](HDSyncAnchorEntity, "getSyncAnchorsOfType:anchorMap:store:profile:error:", 0, v5, self, WeakRetained, a3);

  if ((_DWORD)a3)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;

  return v8;
}

- (id)_syncAnchorMapByStrippingBlockedEntities:(id)a3
{
  id v3;
  HDSyncAnchorMap *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  HDSyncAnchorMap *v13;
  id v14;
  HDSyncAnchorMap *v15;
  HDSyncAnchorMap *v16;
  _QWORD v18[4];
  id v19;
  HDSyncAnchorMap *v20;
  _QWORD v21[8];

  v21[7] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(HDSyncAnchorMap);
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 107);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v6;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v7;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 21);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v8;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 57);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[4] = v9;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", CFSTR("ACHAchievementsPlugin"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v21[5] = v10;
  +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", CFSTR("ACHAchievementsPlugin"), 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v21[6] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __61__HDCloudSyncStore__syncAnchorMapByStrippingBlockedEntities___block_invoke;
  v18[3] = &unk_1E6D006F8;
  v19 = v12;
  v13 = v4;
  v20 = v13;
  v14 = v12;
  objc_msgSend(v3, "enumerateAnchorsAndEntityIdentifiersWithBlock:", v18);

  v15 = v20;
  v16 = v13;

  return v16;
}

void __61__HDCloudSyncStore__syncAnchorMapByStrippingBlockedEntities___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "setAnchor:forSyncEntityIdentifier:", a3, v5);

}

- (BOOL)persistState:(id)a3 error:(id *)a4
{
  NSUUID *storeIdentifier;
  HDProfile **p_profile;
  id v7;
  id WeakRetained;
  void *v9;

  storeIdentifier = self->_storeIdentifier;
  p_profile = &self->_profile;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_profile);
  objc_msgSend(WeakRetained, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = +[HDCloudSyncStoreEntity persistState:storeUUID:shouldReplace:healthDatabase:error:](HDCloudSyncStoreEntity, "persistState:storeUUID:shouldReplace:healthDatabase:error:", v7, storeIdentifier, 1, v9, a4);

  return (char)a4;
}

- (id)persistedStateWithError:(id *)a3
{
  NSUUID *storeIdentifier;
  id WeakRetained;
  void *v6;

  storeIdentifier = self->_storeIdentifier;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  +[HDCloudSyncStoreEntity persistedStateForStoreUUID:profile:error:](HDCloudSyncStoreEntity, "persistedStateForStoreUUID:profile:error:", storeIdentifier, WeakRetained, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)replaceFrozenAnchorMap:(id)a3 updateDate:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id WeakRetained;
  void *v11;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_msgSend(WeakRetained, "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__HDCloudSyncStore_replaceFrozenAnchorMap_updateDate_error___block_invoke;
  v15[3] = &unk_1E6CEB3F8;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v12 = v9;
  v13 = v8;
  LOBYTE(a5) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDSyncAnchorEntity, "performWriteTransactionWithHealthDatabase:error:block:", v11, a5, v15);

  return (char)a5;
}

BOOL __60__HDCloudSyncStore_replaceFrozenAnchorMap_updateDate_error___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id WeakRetained;
  _BOOL4 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _BOOL8 v12;

  v5 = a1[4];
  WeakRetained = objc_loadWeakRetained((id *)(v5 + 64));
  v7 = +[HDSyncAnchorEntity resetSyncAnchorsOfType:store:profile:error:](HDSyncAnchorEntity, "resetSyncAnchorsOfType:store:profile:error:", 2, v5, WeakRetained, a3);

  if (!v7)
    return 0;
  v9 = a1[5];
  v8 = a1[6];
  v10 = a1[4];
  v11 = objc_loadWeakRetained((id *)(v10 + 64));
  v12 = +[HDSyncAnchorEntity updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:](HDSyncAnchorEntity, "updateSyncAnchorsWithMap:type:updateDate:store:updatePolicy:resetInvalid:profile:error:", v9, 2, v8, v10, 2, 1, v11, a3);

  return v12;
}

- (int64_t)syncProvenance
{
  return self->_syncProvenance;
}

- (int64_t)syncEpoch
{
  return self->_syncEpoch;
}

- (id)syncStoreIdentifier
{
  return self->_storeIdentifier;
}

- (id)databaseIdentifier
{
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  HDCloudSyncStore *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = 0;
  +[HDKeyValueEntity retrieveDatabaseIdentifierFromProfile:error:](HDUnprotectedKeyValueEntity, "retrieveDatabaseIdentifierFromProfile:error:", WeakRetained, &v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "hk_UUIDWithData:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    _HKInitializeLogging();
    v7 = *MEMORY[0x1E0CB5370];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v11 = self;
      v12 = 2114;
      v13 = v5;
      _os_log_error_impl(&dword_1B7802000, v7, OS_LOG_TYPE_ERROR, "%{public}@: Failed to get database identifier: %{public}@", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)syncStoreDefaultSourceBundleIdentifier
{
  return CFSTR("com.apple.Health");
}

- (id)syncEntityDependenciesForSyncEntity:(Class)a3
{
  void *v3;
  void *v4;
  id v5;

  -[objc_class syncEntityDependenciesForSyncProtocolVersion:](a3, "syncEntityDependenciesForSyncProtocolVersion:", 16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "containsObject:", objc_opt_class()))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "hk_minus:", v4);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = v3;
  }

  return v5;
}

- (BOOL)canRecieveSyncObjectsForEntityClass:(Class)a3
{
  void *v4;

  -[HDCloudSyncStore orderedSyncEntities](self, "orderedSyncEntities");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "containsObject:", a3);

  return (char)a3;
}

- (id)_syncEntityDependencyIdentifiersForEntity:(void *)a1
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v2 = a1;
  v19 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a2, "syncEntityDependenciesForSyncProtocolVersion:", objc_msgSend(a1, "protocolVersion"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v5 = v3;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v15 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
            objc_msgSend(v10, "syncEntityIdentifier", (_QWORD)v14);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObject:", v11);

            -[HDCloudSyncStore _syncEntityDependencyIdentifiersForEntity:](v2, v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "addObjectsFromArray:", v12);

          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v7);
      }

      objc_msgSend(v4, "allObjects");
      v2 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v2 = (void *)MEMORY[0x1E0C9AA60];
    }

  }
  return v2;
}

- (id)_supportedSyncEntities
{
  id v1;
  id WeakRetained;
  void *v3;
  void *v4;
  _QWORD v6[5];

  v1 = a1;
  if (a1)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 8);
    objc_msgSend(WeakRetained, "syncEngine");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allOrderedSyncEntities");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __42__HDCloudSyncStore__supportedSyncEntities__block_invoke;
    v6[3] = &unk_1E6CFC3C8;
    v6[4] = v1;
    objc_msgSend(v4, "hk_filter:", v6);
    v1 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v1;
}

uint64_t __42__HDCloudSyncStore__supportedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return objc_msgSend(a2, "supportsSyncStore:", *(_QWORD *)(a1 + 32));
  else
    return 1;
}

- (_QWORD)_requiredSyncEntitiesForSupportedSyncEntities:(_QWORD *)a1
{
  id v3;
  void *v4;
  _QWORD *v5;
  _QWORD v7[5];
  _QWORD v8[5];

  v8[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (*((_BYTE *)a1 + 29))
    {
      v8[0] = objc_opt_class();
      v8[1] = objc_opt_class();
      v8[2] = objc_opt_class();
      v8[3] = objc_opt_class();
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 4);
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else if (a1[9])
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __66__HDCloudSyncStore__requiredSyncEntitiesForSupportedSyncEntities___block_invoke;
      v7[3] = &unk_1E6CFC3C8;
      v7[4] = a1;
      objc_msgSend(v3, "hk_filter:", v7);
      v5 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = v3;
    }
    a1 = v5;
  }

  return a1;
}

uint64_t __66__HDCloudSyncStore__requiredSyncEntitiesForSupportedSyncEntities___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  int v6;

  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(a2, "supportsDateBasedSharding");
  else
    v4 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(a2, "supportsSyncToInitialShard");
  else
    v5 = v4 ^ 1;
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "type");
  if (v6 == 1)
    return v4;
  if (v6)
    return 1;
  return v5;
}

- (id)primaryOrderedSyncEntities
{
  void *v3;
  void *v4;

  -[HDCloudSyncStore _supportedSyncEntities]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStore _requiredSyncEntitiesForSupportedSyncEntities:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)orderedSyncEntities
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[HDCloudSyncStore _supportedSyncEntities]((id *)&self->super.isa);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCloudSyncStore _requiredSyncEntitiesForSupportedSyncEntities:](self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "syncEntityIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v12);

        -[HDCloudSyncStore _syncEntityDependencyIdentifiersForEntity:](self, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObjectsFromArray:", v13);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __39__HDCloudSyncStore_orderedSyncEntities__block_invoke;
  v17[3] = &unk_1E6CFC3C8;
  v18 = v5;
  v14 = v5;
  objc_msgSend(v3, "hk_filter:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __39__HDCloudSyncStore_orderedSyncEntities__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "syncEntityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "containsObject:", v3);

  return v4;
}

- (BOOL)enforceSyncEntityOrdering
{
  return 1;
}

- (BOOL)supportsSpeculativeChangesForSyncEntityClass:(Class)a3
{
  return 0;
}

- (BOOL)shouldContinueAfterAnchorValidationError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  NSObject *v13;
  id v15;
  id v16;
  uint8_t buf[4];
  HDCloudSyncStore *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0;
  -[HDCloudSyncStore persistedStateWithError:](self, "persistedStateWithError:", &v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  if (v5)
  {
    objc_msgSend(v5, "stateWithGapEncountered:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v6;
    v8 = -[HDCloudSyncStore persistState:error:](self, "persistState:error:", v7, &v15);
    v9 = v15;

    _HKInitializeLogging();
    v10 = *MEMORY[0x1E0CB5370];
    v11 = os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (v11)
      {
        *(_DWORD *)buf = 138543618;
        v18 = self;
        v19 = 2114;
        v20 = v4;
        v12 = "%{public}@: Recorded anchor gap after validation failure: %{public}@";
LABEL_12:
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, v12, buf, 0x16u);
      }
    }
    else if (v11)
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v9;
      v12 = "%{public}@: Failed to update persisted state when recording an encountered anchor gap: %{public}@";
      goto LABEL_12;
    }

    goto LABEL_10;
  }
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543618;
    v18 = self;
    v19 = 2114;
    v20 = v6;
    _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Failed to retrieve current persisted state when recording an encountered anchor gap: %{public}@", buf, 0x16u);
  }
  v9 = v6;
LABEL_10:

  return 1;
}

- (BOOL)shouldEnforceSequenceOrdering
{
  return 0;
}

- (int64_t)expectedSequenceNumberForSyncEntityClass:(Class)a3
{
  return 0;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  int64_t syncProvenance;
  int64_t syncEpoch;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[NSUUID UUIDString](self->_storeIdentifier, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  syncProvenance = self->_syncProvenance;
  syncEpoch = self->_syncEpoch;
  HKSyncProtocolVersionToString();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@:%p %@ (%ld) Epoch %lld, version %@, shard %@>"), v4, self, v5, syncProvenance, syncEpoch, v8, self->_shardPredicate);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (NSUUID)storeIdentifier
{
  return self->_storeIdentifier;
}

- (NSString)ownerIdentifier
{
  return self->_ownerIdentifier;
}

- (NSString)containerIdentifier
{
  return self->_containerIdentifier;
}

- (HDSyncIdentity)syncIdentity
{
  return self->_syncIdentity;
}

- (BOOL)canPush
{
  return self->_canPush;
}

- (HDProfile)profile
{
  return (HDProfile *)objc_loadWeakRetained((id *)&self->_profile);
}

- (HDCloudSyncShardPredicate)shardPredicate
{
  return self->_shardPredicate;
}

- (NSString)sharingIdentifier
{
  return self->_sharingIdentifier;
}

- (HDSharingPredicate)sharingPredicate
{
  return self->_sharingPredicate;
}

- (BOOL)syncTombstonesOnly
{
  return self->_syncTombstonesOnly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingPredicate, 0);
  objc_storeStrong((id *)&self->_sharingIdentifier, 0);
  objc_storeStrong((id *)&self->_shardPredicate, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_syncIdentity, 0);
  objc_storeStrong((id *)&self->_containerIdentifier, 0);
  objc_storeStrong((id *)&self->_ownerIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
}

@end
