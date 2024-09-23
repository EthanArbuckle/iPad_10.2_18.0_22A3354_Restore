@implementation HDMedicationScheduleSyncEntity

+ (HDSyncEntityIdentifier)syncEntityIdentifier
{
  return (HDSyncEntityIdentifier *)objc_msgSend(MEMORY[0x1E0D29598], "identifierWithSchema:entity:", *MEMORY[0x1E0D2C228], 1);
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
  v27[2] = __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke;
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

BOOL __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  _BOOL8 v17;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  +[HDMedicationScheduleEntity entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:](HDMedicationScheduleEntity, "entityEncoderForProfile:transaction:purpose:encodingOptions:authorizationFilter:", *(_QWORD *)(a1 + 32), a2, 0, 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "orderedProperties");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationScheduleSyncEntity _syncPredicate]();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24;
  v9 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2;
  v19[3] = &unk_1E6E01488;
  v11 = *(_QWORD *)(a1 + 72);
  v20 = v5;
  v23 = v11;
  v12 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 64);
  v21 = v12;
  v22 = v13;
  v24 = *(_QWORD *)(a1 + 96);
  v15 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(a1 + 88);
  v16 = v5;
  v17 = +[HDHealthEntity enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:](HDMedicationScheduleEntity, "enumerateEntitiesForSyncWithProperties:predicate:session:syncAnchorRange:limit:lastSyncAnchor:healthDatabase:error:block:", v6, v7, v9, v15, v14, 0, v8, v10, a3, v19);

  return v17;
}

+ (id)_syncPredicate
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  objc_opt_self();
  v0 = (void *)MEMORY[0x1E0D29890];
  +[HDMedicationScheduleEntity availableSchedulePredicate](HDMedicationScheduleEntity, "availableSchedulePredicate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationScheduleEntity compatibilityVersion0ScheduleTypesPredicate](HDMedicationScheduleEntity, "compatibilityVersion0ScheduleTypesPredicate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "compoundPredicateWithPredicate:otherPredicate:", v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

BOOL __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _BYTE *a7, uint64_t a8)
{
  void *v10;
  NSObject *v11;

  objc_msgSend(*(id *)(a1 + 32), "codableRepresentationForPersistentID:row:error:", objc_msgSend(a2, "persistentID"), a4, a8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setDuplicate:", 1);
  if (v10)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v10);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v10, "encodedByteCount");
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) >= *(_QWORD *)(a1 + 64))
      *a7 = 1;
  }
  else
  {
    _HKInitializeLogging();
    HKLogMedication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(a1, v11);

  }
  return v10 != 0;
}

+ (int64_t)nextSyncAnchorWithSession:(id)a3 startSyncAnchor:(int64_t)a4 profile:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  int64_t v13;

  v9 = a5;
  v10 = a3;
  +[HDMedicationScheduleSyncEntity _syncPredicate]();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = +[HDHealthEntity nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:](HDMedicationScheduleEntity, "nextSyncAnchorWithStartAnchor:predicate:session:healthDatabase:error:", a4, v11, v10, v12, a6);
  return v13;
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
  _BOOL4 v18;
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
      _os_log_debug_impl(&dword_1B815E000, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] Received %{public}@ sync objects, for version: minimum=%{public}d, current=%{public}d", (uint8_t *)&v21, 0x22u);

    }
  }
  v18 = +[HDMedicationScheduleSyncEntity _insertCodableMedicationSchedules:version:syncStore:profile:error:]((uint64_t)a1, v12, a4.var0, v13, v14, (uint64_t)a7);

  return !v18;
}

+ (BOOL)_insertCodableMedicationSchedules:(int)a3 version:(void *)a4 syncStore:(void *)a5 profile:(uint64_t)a6 error:
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v10 = a2;
  v11 = a4;
  v12 = a5;
  v13 = objc_opt_self();
  if (a3 < 3)
  {
    objc_msgSend(MEMORY[0x1E0D2C480], "hd_medicationSchedulesFromCodables:profile:ignoreDuplicates:", v10, v12, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "healthMedicationsProfileExtension");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "medicationScheduleManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke;
    v33[3] = &unk_1E6E014B0;
    v34 = v20;
    v35 = v22;
    v36 = v11;
    v24 = v22;
    v15 = v20;
    v25 = (void *)MEMORY[0x1BCCADA70](v33);
    objc_msgSend(v12, "database");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v23;
    v31[1] = 3221225472;
    v31[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_2;
    v31[3] = &unk_1E6DFFF08;
    v32 = v25;
    v29[0] = v23;
    v29[1] = 3221225472;
    v29[2] = __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_3;
    v29[3] = &unk_1E6DFFF30;
    v30 = v32;
    v27 = v32;
    v19 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:](HDMedicationScheduleEntity, "performWriteTransactionWithHealthDatabase:error:block:inaccessibilityHandler:", v26, a6, v31, v29);

  }
  else
  {
    v14 = v13;
    _HKInitializeLogging();
    HKLogMedication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_msgSend(v10, "count");
      HDSyncVersionRangeToString();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      HDSyncVersionRangeToString();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v38 = v14;
      v39 = 2048;
      v40 = v16;
      v41 = 2114;
      v42 = v11;
      v43 = 2114;
      v44 = v17;
      v45 = 2114;
      v46 = v18;
      _os_log_impl(&dword_1B815E000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring %lu sync objects from sync store %{public}@ with version %{public}@ because our current version is %{public}@", buf, 0x34u);

    }
    v19 = 0;
  }

  return v19;
}

+ (id)syncEntityDependenciesForSyncProtocolVersion:(int)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class());
}

+ (BOOL)supportsSyncStore:(id)a3
{
  return 1;
}

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke(uint64_t a1, uint64_t a2)
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
        v12 = objc_msgSend(*(id *)(a1 + 48), "syncProvenance");
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

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __100__HDMedicationScheduleSyncEntity__insertCodableMedicationSchedules_version_syncStore_profile_error___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __109__HDMedicationScheduleSyncEntity_generateSyncObjectsForSession_syncAnchorRange_profile_messageHandler_error___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl(&dword_1B815E000, a2, OS_LOG_TYPE_ERROR, "[%{public}@] Codeable is nil", (uint8_t *)&v3, 0xCu);
}

@end
