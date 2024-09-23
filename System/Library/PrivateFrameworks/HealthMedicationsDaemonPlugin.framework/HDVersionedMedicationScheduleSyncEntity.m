@implementation HDVersionedMedicationScheduleSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)objc_msgSend(MEMORY[0x1E0D29598], "identifierWithSchema:entity:", *MEMORY[0x1E0D2C228], 2);
}

+ ($2825F4736939C4A6D3AD43837233062D)supportedSyncVersionRange
{
  return ($2825F4736939C4A6D3AD43837233062D)0x200000000;
}

+ ($2825F4736939C4A6D3AD43837233062D)syncVersionRangeForSession:(id)a3
{
  return ($2825F4736939C4A6D3AD43837233062D)0x200000000;
}

+ (BOOL)generateSyncObjectsForSession:(id)a3 syncAnchorRange:(HDSyncAnchorRange)a4 profile:(id)a5 messageHandler:(id)a6 error:(id *)a7
{
  int64_t var1;
  int64_t var0;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  char v24;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  _BYTE *v31;
  _QWORD *v32;
  id v33;
  int64_t v34;
  int64_t v35;
  uint64_t v36;
  _QWORD v37[4];
  _BYTE buf[24];
  uint64_t v39;
  uint64_t v40;

  var1 = a4.var1;
  var0 = a4.var0;
  v40 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v14 = a5;
  v26 = a6;
  _HKInitializeLogging();
  HKLogMedication();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138543874;
      *(_QWORD *)&buf[4] = a1;
      *(_WORD *)&buf[12] = 2050;
      *(_QWORD *)&buf[14] = var0;
      *(_WORD *)&buf[22] = 2050;
      v39 = var1;
      _os_log_debug_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Generating sync objects for session with sync anchor: start=%{public}lld, end=%{public}lld", buf, 0x20u);
    }

  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v39 = -1;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v19 = objc_msgSend(v13, "maxEncodedBytesPerCodableChangeForSyncEntityClass:", a1);
  objc_msgSend(v14, "database");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
  v27[3] = &unk_1E6DFFE90;
  v21 = v14;
  v28 = v21;
  v33 = a1;
  v22 = v13;
  v34 = var0;
  v35 = var1;
  v29 = v22;
  v31 = buf;
  v23 = v18;
  v30 = v23;
  v32 = v37;
  v36 = v19;
  LOBYTE(v19) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDMedicationScheduleEntity, "performReadTransactionWithHealthDatabase:error:block:", v20, a7, v27);

  if ((v19 & 1) != 0)
    v24 = objc_msgSend(v26, "sendCodableChange:version:resultAnchor:sequence:done:error:", v23, 0x200000000, *(_QWORD *)(*(_QWORD *)&buf[8] + 24), 0, 1, a7);
  else
    v24 = 0;

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(buf, 8);

  return v24;
}

BOOL __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _BOOL8 v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;

  +[HDMedicationScheduleEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDMedicationScheduleEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), a2, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDVersionedMedicationScheduleSyncEntity _syncPredicateForSyncSession:](*(_QWORD *)(a1 + 72), *(void **)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v18[3] = &unk_1E6DFFE68;
  v19 = v5;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  v20 = v11;
  v21 = v12;
  v22 = *(_QWORD *)(a1 + 96);
  v14 = *(_QWORD *)(a1 + 80);
  v13 = *(_QWORD *)(a1 + 88);
  v15 = v5;
  v16 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDMedicationScheduleEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, v7, v9, v14, v13, 0, v8, v10, a3, v18);

  return v16;
}

+ (id)_syncPredicateForSyncSession:(uint64_t)a1
{
  id v2;
  void *v3;
  char v4;
  void *v5;

  v2 = a2;
  objc_opt_self();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(v2, "nanoSyncStore"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isMaster"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = 0;
  }
  else
  {
    +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

BOOL __118__HDVersionedMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v10, "encodedByteCount");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 56))
      *a7 = 1;
  }

  return v10 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  int64_t v14;

  v10 = a5;
  v11 = a3;
  +[HDVersionedMedicationScheduleSyncEntity _syncPredicateForSyncSession:]((uint64_t)a1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "database");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDMedicationScheduleEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v12, v11, v13, a6);
  return v14;
}

+ (id)decodeSyncObjectWithData:(id)a3
{
  id v3;
  HDCodableMedicationSchedule *v4;

  v3 = a3;
  v4 = -[HDCodableMedicationSchedule initWithData:]([HDCodableMedicationSchedule alloc], "initWithData:", v3);

  return v4;
}

+ (int64_t)receiveSyncObjects:(id)a3 version:(id)a4 syncStore:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  int v18;
  void *v20;
  int v21;
  id v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  int var0;
  __int16 v27;
  int var1;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  _HKInitializeLogging();
  HKLogMedication();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138544130;
      v22 = a1;
      v23 = 2114;
      v24 = v20;
      v25 = 1026;
      var0 = a4.var0;
      v27 = 1026;
      var1 = a4.var1;
      _os_log_debug_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Received %{public}@ sync objects for version: minimum=%{public}u, current=%{public}u", (uint8_t *)&v21, 0x22u);

    }
  }
  v18 = +[HDVersionedMedicationScheduleSyncEntity _insertCodableMedicationSchedules:version:syncStore:profile:error:]((uint64_t)a1, v12, a4.var0, v13, v14, (uint64_t)a7);

  return v18 ^ 1u;
}

+ (uint64_t)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v20;
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = (void *)objc_opt_self();
  if (a3 < 3)
  {
    v18 = objc_msgSend(v13, "receiveCodableSchedules:syncProvenance:profile:error:", v10, objc_msgSend(v11, "syncProvenance"), v12, a6);
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      v15 = objc_msgSend(v10, "count");
      HDSyncVersionRangeToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      HDSyncVersionRangeToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544386;
      v21 = v13;
      v22 = 2048;
      v23 = v15;
      v24 = 2114;
      v25 = v11;
      v26 = 2114;
      v27 = v16;
      v28 = 2114;
      v29 = v17;
      _os_log_impl(&dword_1B815E000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %lu sync objects from sync store %{public}@ with version %{public}@ because our current version is %{public}@", (uint8_t *)&v20, 0x34u);

    }
    v18 = 0;
  }

  return v18;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

+ (BOOL)enumerateCodableObjectsForPredicate:(id)a3 limit:(int64_t)a4 orderingTerms:(id)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8 handler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;

  v15 = a9;
  v16 = a7;
  v17 = a5;
  v18 = a3;
  +[HDMedicationScheduleEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDMedicationScheduleEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", a6, v16, 0, 0, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "protectedDatabase");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDMedicationScheduleEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v20, v18, a4, v17, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "orderedProperties");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __133__HDVersionedMedicationScheduleSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke;
  v26[3] = &unk_1E6DFFEB8;
  v27 = v19;
  v28 = v15;
  v23 = v15;
  v24 = v19;
  LOBYTE(a8) = objc_msgSend(v21, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v22, a8, v26);

  return (char)a8;
}

uint64_t __133__HDVersionedMedicationScheduleSyncEntity_enumerateCodableObjectsForPredicate_limit_orderingTerms_profile_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v4 = 0;

  return v4;
}

+ (BOOL)receiveCodableSchedules:(id)a3 syncProvenance:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  int64_t v28;

  v9 = (void *)MEMORY[0x1E0D2C480];
  v10 = a5;
  objc_msgSend(v9, "hd_medicationSchedulesFromCodables:profile:ignoreDuplicates:", a3, v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "healthMedicationsProfileExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "medicationScheduleManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke;
  v25[3] = &unk_1E6DFFEE0;
  v26 = v11;
  v27 = v13;
  v28 = a4;
  v15 = v13;
  v16 = v11;
  v17 = (void *)MEMORY[0x1BCCADA70](v25);
  objc_msgSend(v10, "database");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_2;
  v23[3] = &unk_1E6DFFF08;
  v24 = v17;
  v21[0] = v14;
  v21[1] = 3221225472;
  v21[2] = __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_3;
  v21[3] = &unk_1E6DFFF30;
  v22 = v24;
  v19 = v24;
  LOBYTE(a6) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDMedicationScheduleEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v18, a6, v23, v21);

  return (char)a6;
}

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v10 = *(void **)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9, (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 48);
        objc_msgSend(v9, "entity");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v10) = objc_msgSend(v10, "insertMedicationSchedules:syncProvenance:syncIdentity:error:", v11, v12, objc_msgSend(v13, "persistentID"), a2);

        if (!(_DWORD)v10)
        {
          v14 = 0;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
  v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __96__HDVersionedMedicationScheduleSyncEntity_receiveCodableSchedules_syncProvenance_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)pruneSyncedObjectsThroughAnchor:(id)a3 limit:(unint64_t)a4 nowDate:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  _BOOL4 v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint64_t (*v27)(uint64_t, uint64_t);
  _QWORD v28[4];
  id v29;
  _BYTE *v30;
  unint64_t v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[24];
  uint64_t (*v37)(uint64_t, uint64_t);
  __int128 v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  _HKInitializeLogging();
  HKLogMedication();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG);

  if (v16)
  {
    HKLogMedication();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
      v27 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v36 = 138544130;
      *(_QWORD *)&v36[4] = a1;
      *(_WORD *)&v36[12] = 2114;
      *(_QWORD *)&v36[14] = v12;
      *(_WORD *)&v36[22] = 2114;
      v37 = v27;
      LOWORD(v38) = 2114;
      *(_QWORD *)((char *)&v38 + 2) = v13;
      _os_log_debug_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Pruning sync objects through anchor limit: %{public}@, limit: %{public}@, now date: %{public}@", v36, 0x2Au);

    }
  }
  +[HDVersionedMedicationScheduleSyncEntity _pruningPredicateThroughAnchor:nowDate:]((uint64_t)a1, v12, v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)v36 = 0;
  *(_QWORD *)&v36[8] = v36;
  *(_QWORD *)&v36[16] = 0x3032000000;
  v37 = __Block_byref_object_copy__0;
  *(_QWORD *)&v38 = __Block_byref_object_dispose__0;
  *((_QWORD *)&v38 + 1) = &unk_1E6E10D18;
  objc_msgSend(v14, "database");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __103__HDVersionedMedicationScheduleSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke;
  v28[3] = &unk_1E6DFFF58;
  v20 = v18;
  v30 = v36;
  v31 = a4;
  v29 = v20;
  v21 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:](HDMedicationScheduleEntity, "performWriteTransactionWithHealthDatabase:error:block:", v19, a7, v28);

  _HKInitializeLogging();
  HKLogMedication();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    v23 = *(_QWORD *)(*(_QWORD *)&v36[8] + 40);
    *(_DWORD *)buf = 138543618;
    v33 = a1;
    v34 = 2112;
    v35 = v23;
    _os_log_impl(&dword_1B815E000, v22, OS_LOG_TYPE_DEFAULT, "[%{public}@] Deleted %@ schedules", buf, 0x16u);
  }

  if (v21)
    v24 = *(void **)(*(_QWORD *)&v36[8] + 40);
  else
    v24 = 0;
  v25 = v24;

  _Block_object_dispose(v36, 8);
  return v25;
}

+ (id)_pruningPredicateThroughAnchor:(void *)a3 nowDate:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = a3;
  objc_opt_self();
  objc_msgSend(v5, "dateByAddingTimeInterval:", -31536000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanValue:", CFSTR("creation_date"), v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v4)
  {
    v9 = (void *)MEMORY[0x1E0D29840];
    v17[0] = v7;
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:lessThanOrEqualToValue:", *MEMORY[0x1E0D29618], v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v10;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "predicateMatchingAnyPredicates:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  v13 = (void *)MEMORY[0x1E0D29890];
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAB0]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "compoundPredicateWithPredicate:otherPredicate:", v8, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

uint64_t __103__HDVersionedMedicationScheduleSyncEntity_pruneSyncedObjectsThroughAnchor_limit_nowDate_profile_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a2, "protectedDatabase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDSQLiteEntity queryWithDatabase:predicate:limit:orderingTerms:groupBy:](HDMedicationScheduleEntity, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v5, a1[4], a1[6], 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "deleteAllEntitiesWithError:", a3);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "getChangesCount"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(a1[5] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  return v7;
}

@end
