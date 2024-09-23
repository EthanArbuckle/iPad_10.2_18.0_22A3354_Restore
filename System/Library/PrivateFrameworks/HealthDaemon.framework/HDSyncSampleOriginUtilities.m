@implementation HDSyncSampleOriginUtilities

+ (BOOL)generateStateSyncCodableDevices:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _BOOL4 v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99DE8];
  v14 = a4;
  v15 = objc_alloc_init(v13);
  +[HDDeviceEntity _propertiesForDevice](HDDeviceEntity, "_propertiesForDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __99__HDSyncSampleOriginUtilities_generateStateSyncCodableDevices_predicate_profile_transaction_error___block_invoke;
  v23[3] = &unk_1E6CED2F8;
  v24 = v11;
  v25 = v12;
  v18 = v15;
  v26 = v18;
  v19 = v12;
  v20 = v11;
  v21 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:healthDatabase:error:block:](HDDeviceEntity, "enumerateEntitiesForSyncWithProperties:predicate:healthDatabase:error:block:", v16, v14, v17, a7, v23);

  if (a3 && v21)
    *a3 = objc_retainAutorelease(v18);

  return v21;
}

BOOL __99__HDSyncSampleOriginUtilities_generateStateSyncCodableDevices_predicate_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _BOOL8 v9;
  id v10;
  void *v11;
  id v14;

  v14 = 0;
  v9 = +[HDDeviceSyncEntity _syncCodableDevice:fromRow:profile:transaction:error:](HDDeviceSyncEntity, "_syncCodableDevice:fromRow:profile:transaction:error:", &v14, a4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a8);
  v10 = v14;
  v11 = v10;
  if (v9 && v10 != 0)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v10);

  return v9;
}

+ (int64_t)ingestSourceSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  _QWORD v18[5];

  v10 = a3;
  v11 = a4;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __79__HDSyncSampleOriginUtilities_ingestSourceSyncObjects_syncStore_profile_error___block_invoke;
  v18[3] = &__block_descriptor_40_e25__16__0__HDCodableSource_8l;
  v18[4] = a1;
  v12 = a5;
  objc_msgSend(v10, "hk_map:", v18);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sourceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v15 = objc_msgSend(v11, "syncProvenance");
  else
    v15 = 0;
  v16 = objc_msgSend(v14, "createSourcesWithCodables:provenance:error:", v13, v15, a6);

  return v16 ^ 1u;
}

id __79__HDSyncSampleOriginUtilities_ingestSourceSyncObjects_syncStore_profile_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v10;
  id v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB7738]);

  if (v4)
  {
    objc_msgSend(v2, "decodedUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)objc_msgSend(v2, "copy");

      objc_msgSend(MEMORY[0x1E0CB6C18], "_generateIdentifierForAppleDeviceWithUUID:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBundleIdentifier:", v7);

      v2 = v6;
    }
    else
    {
      _HKInitializeLogging();
      v8 = (void *)*MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
      {
        v10 = v8;
        v12 = 138543362;
        v13 = (id)objc_opt_class();
        v11 = v13;
        _os_log_error_impl(&dword_1B7802000, v10, OS_LOG_TYPE_ERROR, "[%{public}@]: Decoded UUID found nil.", (uint8_t *)&v12, 0xCu);

      }
    }

  }
  return v2;
}

+ (int64_t)ingestContributorSyncObjects:(id)a3 syncStore:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  HDInsertCodableContributorsOperation *v11;
  int64_t v12;

  v9 = a3;
  v10 = a5;
  if (a4)
    a4 = (id)objc_msgSend(a4, "syncProvenance");
  v11 = -[HDInsertCodableContributorsOperation initWithContributors:provenance:]([HDInsertCodableContributorsOperation alloc], "initWithContributors:provenance:", v9, a4);
  v12 = -[HDJournalableOperation performOrJournalWithProfile:error:](v11, "performOrJournalWithProfile:error:", v10, a6) ^ 1;

  return v12;
}

+ (BOOL)generateStateSyncCodableContributors:(id *)a3 predicate:(id)a4 profile:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  objc_class *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  _BOOL4 v21;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;

  v11 = a5;
  v12 = a6;
  v13 = (objc_class *)MEMORY[0x1E0C99DE8];
  v14 = a4;
  v15 = objc_alloc_init(v13);
  +[HDContributorSyncEntity _orderedProperties](HDContributorSyncEntity, "_orderedProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "database");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __104__HDSyncSampleOriginUtilities_generateStateSyncCodableContributors_predicate_profile_transaction_error___block_invoke;
  v23[3] = &unk_1E6CED2F8;
  v24 = v11;
  v25 = v12;
  v18 = v15;
  v26 = v18;
  v19 = v12;
  v20 = v11;
  v21 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:healthDatabase:error:block:](HDContributorEntity, "enumerateEntitiesForSyncWithProperties:predicate:healthDatabase:error:block:", v16, v14, v17, a7, v23);

  if (a3 && v21)
    *a3 = objc_retainAutorelease(v18);

  return v21;
}

BOOL __104__HDSyncSampleOriginUtilities_generateStateSyncCodableContributors_predicate_profile_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;

  +[HDContributorSyncEntity _syncCodableContributorFromRow:profile:transaction:error:](HDContributorSyncEntity, "_syncCodableContributorFromRow:profile:transaction:error:", a4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v9);

  return v9 != 0;
}

@end
