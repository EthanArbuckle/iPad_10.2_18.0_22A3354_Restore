@implementation HDMedicationScheduleEntity

+ (id)_medicationScheduleFromRow:(uint64_t)a3 persistentID:(void *)a4 transaction:(NSObject *)a5 error:
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  id v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  void *v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v34 = objc_opt_self();
  HDSQLiteColumnWithNameAsUUID();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsUUID();
  v7 = objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDate();
  v41 = objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v9 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v10 = objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsString();
  v11 = objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsDouble();
  v13 = v12;
  v39 = HDSQLiteColumnWithNameAsBoolean();
  v38 = HDSQLiteColumnWithNameAsInt64();
  v37 = HDSQLiteColumnWithNameAsInt64();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v47 = 0;
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __88__HDMedicationScheduleEntity__medicationScheduleFromRow_persistentID_transaction_error___block_invoke;
  v45[3] = &unk_1E6E01808;
  v15 = v14;
  v46 = v15;
  v16 = +[HDMedicationScheduleIntervalDataEntity enumerateMedicationScheduleIntervalDataWithOwnerID:transaction:error:enumerationHandler:](HDMedicationScheduleIntervalDataEntity, "enumerateMedicationScheduleIntervalDataWithOwnerID:transaction:error:enumerationHandler:", a3, v6, &v47, v45);

  v43 = v47;
  v40 = (void *)v7;
  if (!v16)
  {
    v24 = v15;
    v21 = (void *)v10;
    v23 = (void *)v41;
    _HKInitializeLogging();
    HKLogMedication();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v49 = v34;
      v50 = 2114;
      v51 = (uint64_t)v44;
      v52 = 2114;
      v53 = (uint64_t)v43;
      _os_log_error_impl(&dword_1B815E000, v26, OS_LOG_TYPE_ERROR, "%{public}@: Failed to fetch intervals for schedule UUID: %{public}@ error: %{public}@", buf, 0x20u);
    }

    v27 = v43;
    v28 = v27;
    if (v27)
    {
      v25 = (void *)v9;
      if (a5)
      {
        v28 = objc_retainAutorelease(v27);
        v22 = 0;
        *a5 = v28;
      }
      else
      {
        _HKLogDroppedError();
        v22 = 0;
      }
    }
    else
    {
      v22 = 0;
      v25 = (void *)v9;
    }
    v20 = (void *)v11;
    goto LABEL_16;
  }
  v33 = HDSQLiteColumnWithNameAsInt64();
  v17 = HDSQLiteColumnWithNameAsInt64();
  v32 = HDSQLiteColumnWithNameAsInt64();
  v31 = HDSQLiteColumnWithNameAsInt64();
  v18 = objc_alloc(MEMORY[0x1E0D2C480]);
  v36 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v9);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)v11;
  LOBYTE(v30) = v39;
  v21 = (void *)v10;
  v22 = (void *)objc_msgSend(v18, "initWithUUID:medicationUUID:medicationIdentifier:createdUTCOffset:startDateTime:endDateTime:timeIntervals:scheduleType:displayOptions:cycleStartDateComponents:deleted:creationTimestamp:note:compatibilityVersionRange:", v44, v7, v42, v19, v8, v41, v13, v15, v33, v17, v10, v30, v11, v38, v37);

  v23 = (void *)v41;
  v24 = v15;
  if ((objc_msgSend(v22, "isUnavailable") & 1) != 0)
  {
    v25 = v36;
    goto LABEL_17;
  }
  v25 = v36;
  if ((objc_msgSend(v22, "isDeleted") & 1) == 0 && !objc_msgSend(v22, "scheduleType"))
  {
    _HKInitializeLogging();
    HKLogMedication();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v49 = v34;
      v50 = 2048;
      v51 = v32;
      v52 = 2048;
      v53 = v31;
      v54 = 2114;
      v55 = v22;
      _os_log_error_impl(&dword_1B815E000, v28, OS_LOG_TYPE_ERROR, "[%{public}@] Attempting to enumerate unexpected schedule with sync_provenance: %ld and sync_identity: %ld: %{public}@", buf, 0x2Au);
    }
LABEL_16:

  }
LABEL_17:

  return v22;
}

uint64_t __88__HDMedicationScheduleEntity__medicationScheduleFromRow_persistentID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (id)databaseTable
{
  return CFSTR("medication_schedules");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 19;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_1;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)privateSubEntities
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)enumerateSchedulesWithPredicate:(id)a3 limit:(unint64_t)a4 orderingTerms:(id)a5 transaction:(id)a6 error:(id *)a7 enumerationHandler:(id)a8
{
  return +[HDMedicationScheduleEntity _enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, a3, a4, a5, a6, (uint64_t)a7, a8);
}

+ (uint64_t)_enumerateSchedulesWithPredicate:(uint64_t)a3 limit:(void *)a4 orderingTerms:(void *)a5 transaction:(uint64_t)a6 error:(void *)a7 enumerationHandler:
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  _QWORD v24[4];
  id v25;
  id v26;
  void *v27;

  v12 = a5;
  v13 = a7;
  v14 = a4;
  v15 = a2;
  v16 = (void *)objc_opt_self();
  objc_msgSend(v12, "databaseForEntityClass:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v17, v15, a3, v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  HDMedicationsScheduleEntityAllProperties();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __120__HDMedicationScheduleEntity__enumerateSchedulesWithPredicate_limit_orderingTerms_transaction_error_enumerationHandler___block_invoke;
  v24[3] = &unk_1E6E01A20;
  v26 = v13;
  v27 = v16;
  v25 = v12;
  v20 = v13;
  v21 = v12;
  v22 = objc_msgSend(v18, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v19, a6, v24);

  return v22;
}

+ (id)allActiveMedicationSchedulesWithTransaction:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)MEMORY[0x1E0C99DE8];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationSchedulePredicateForActiveMedications();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0D29840];
  v19[0] = v8;
  v19[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateMatchingAllPredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __80__HDMedicationScheduleEntity_allActiveMedicationSchedulesWithTransaction_error___block_invoke;
  v17[3] = &unk_1E6E00418;
  v18 = v7;
  v13 = v7;
  LODWORD(a4) = +[HDMedicationScheduleEntity enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:](HDMedicationScheduleEntity, "enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:", v12, 0, 0, v6, a4, v17);

  if ((_DWORD)a4)
    v14 = v13;
  else
    v14 = 0;
  v15 = v14;

  return v15;
}

uint64_t __80__HDMedicationScheduleEntity_allActiveMedicationSchedulesWithTransaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

+ (int64_t)allActiveSchedulesCreatedWithinTimeZone:(id)a3 transaction:(id)a4 offsetChange:(int64_t *)a5 error:(id *)a6
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int64_t v19;
  uint64_t v22;
  id v23;
  id v24;
  _QWORD v25[7];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  _QWORD v31[5];

  v31[3] = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = a4;
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  HDMedicationSchedulePredicateForActiveMedications();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29848], "doesNotContainPredicateWithProperty:values:", CFSTR("schedule_type"), &unk_1E6E116E8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x1E0D29840];
  v31[0] = v9;
  v31[1] = v10;
  v31[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "predicateMatchingAllPredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("creation_date"), objc_opt_class(), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 1;
  if (a5)
    *a5 = 0x7FFFFFFFFFFFFFFFLL;
  v16 = objc_msgSend(v24, "secondsFromGMT", a6);
  v30 = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *MEMORY[0x1E0D29968];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __101__HDMedicationScheduleEntity_allActiveSchedulesCreatedWithinTimeZone_transaction_offsetChange_error___block_invoke;
  v25[3] = &unk_1E6E019F8;
  v25[5] = v16;
  v25[6] = a5;
  v25[4] = &v26;
  LODWORD(v16) = +[HDMedicationScheduleEntity _enumerateSchedulesWithPredicate:limit:orderingTerms:transaction:error:enumerationHandler:]((uint64_t)a1, v14, v18, v17, v23, v22, v25);

  if ((_DWORD)v16)
    v19 = v27[3];
  else
    v19 = 0;
  _Block_object_dispose(&v26, 8);

  return v19;
}

BOOL __101__HDMedicationScheduleEntity_allActiveSchedulesCreatedWithinTimeZone_transaction_offsetChange_error___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  objc_msgSend(a2, "createdUTCOffset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "secondsFromGMT");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "secondsFromGMT");

  }
  v7 = a1[5];
  if (v7 >= 0)
    v8 = a1[5];
  else
    v8 = -v7;
  if (v5 >= 0)
    v9 = v5;
  else
    v9 = -v5;
  if (v8 != v9)
  {
    v10 = (_QWORD *)a1[6];
    if (v10)
      *v10 = v7 - v5;
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = 2;
  }
  return v8 == v9;
}

uint64_t __120__HDMedicationScheduleEntity__enumerateSchedulesWithPredicate_limit_orderingTerms_transaction_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, NSObject **a5)
{
  void *v6;
  uint64_t v7;

  +[HDMedicationScheduleEntity _medicationScheduleFromRow:persistentID:transaction:error:](*(_QWORD *)(a1 + 48), a4, a2, *(void **)(a1 + 32), a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v7 = 0;

  return v7;
}

+ (BOOL)insertMedicationSchedule:(id)a3 syncProvenance:(int64_t)a4 syncIdentity:(int64_t)a5 profile:(id)a6 transaction:(id)a7 error:(id *)a8
{
  return +[HDMedicationScheduleEntity _insertMedicationSchedule:syncProvenance:syncIdentity:profile:transaction:error:]((uint64_t)a1, a3, a4, a5, a6, a7, a8);
}

+ (uint64_t)_insertMedicationSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(_QWORD *)a7 error:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v12 = a2;
  v13 = a5;
  v14 = a6;
  v15 = objc_opt_self();
  v16 = +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:](v15, v12, v13, v14, a7);
  if (v16 == 1)
  {
    +[HDMedicationScheduleEntity _insertSchedule:syncProvenance:syncIdentity:profile:transaction:error:](v15, v12, a3, a4, v13, v14, (uint64_t)a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v12, "timeIntervals");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = +[HDMedicationScheduleEntity _insertTimeIntervals:schedulePrimaryKey:transaction:error:](v15, v18, v17, v14, (uint64_t)a7);

    }
    else
    {
      v19 = 0;
    }

  }
  else
  {
    v19 = v16 == 2;
  }

  return v19;
}

+ (uint64_t)_shouldProceedWithInsertionForSchedule:(void *)a3 profile:(void *)a4 transaction:(_QWORD *)a5 error:
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  NSObject *v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  id v33;

  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = objc_opt_self();
  if (objc_msgSend(v8, "compatibilityRange") >= 2 && (objc_msgSend(v8, "isUnavailable") & 1) == 0)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    objc_msgSend(v8, "description");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hk_assignError:code:format:", a5, 100, CFSTR("Attempted to save a HKMedicationSchedule [%@] that should have been made unavailable. Before inserting a schedule that is not understood by the current operating system, you must call -[HKMedicationSchedule unavailableSchedule] before insertion, and insert the copy returned instead."), v28);

    v15 = 0;
    goto LABEL_33;
  }
  if (!objc_msgSend(v8, "isDeleted"))
  {
    if ((objc_msgSend(v8, "isUnavailable") & 1) == 0 && !objc_msgSend(v8, "scheduleType"))
    {
      _HKInitializeLogging();
      HKLogMedication();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:].cold.3();

    }
    objc_msgSend(v8, "medicationUUID");
    v17 = objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = (void *)v17;
      v19 = (void *)MEMORY[0x1E0D29840];
      HDUserDomainConceptEntityPredicateForConceptUUID();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", *MEMORY[0x1E0D293B0], MEMORY[0x1E0C9AAA0]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "compoundPredicateWithPredicate:otherPredicate:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = (void *)MEMORY[0x1E0D295B0];
      objc_msgSend(v10, "protectedDatabase");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v23, "anyInDatabase:predicate:error:", v24, v22, &v33);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v33;

      if (!v25)
      {
        if (v26)
        {
          if (a5)
          {
            v15 = 0;
            *a5 = objc_retainAutorelease(v26);
          }
          else
          {
            _HKLogDroppedError();
            v15 = 0;
          }
        }
        else
        {
          v15 = 2;
        }

        goto LABEL_32;
      }

    }
    else
    {
      v29 = (void *)MEMORY[0x1E0D295B0];
      objc_msgSend(v8, "medicationIdentifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:profile:transaction:error:", v30, v9, v10, a5);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        _HKInitializeLogging();
        HKLogMedication();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:].cold.2(v11, v8, v31);

        v18 = 0;
        v15 = 2;
        goto LABEL_32;
      }
      if (!objc_msgSend(MEMORY[0x1E0D295B0], "incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:profile:transaction:error:", v18, v9, v10, a5))
      {
        v15 = 0;
        goto LABEL_32;
      }
      objc_msgSend(v8, "_setMedicationUUID:", v18);
    }
    v15 = +[HDMedicationScheduleEntity _isNewestSchedule:transaction:error:](v11, v8, v10, (uint64_t)a5);
LABEL_32:

    goto LABEL_33;
  }
  _HKInitializeLogging();
  HKLogMedication();
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);

  if (v13)
  {
    HKLogMedication();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      +[HDMedicationScheduleEntity _shouldProceedWithInsertionForSchedule:profile:transaction:error:].cold.1(v11, v14);

  }
  v15 = 1;
LABEL_33:

  return v15;
}

+ (id)_insertSchedule:(uint64_t)a3 syncProvenance:(uint64_t)a4 syncIdentity:(void *)a5 profile:(void *)a6 transaction:(uint64_t)a7 error:
{
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v27[4];
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD v31[5];
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v12 = a2;
  v13 = a5;
  v14 = a6;
  v15 = objc_opt_self();
  objc_msgSend(v14, "protectedDatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke;
  v31[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v31[4] = v15;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2;
  v27[3] = &unk_1E6E01A48;
  v17 = v12;
  v28 = v17;
  v29 = a4;
  v30 = a3;
  v18 = 0;
  if (objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_insertSchedule_syncProvenance_syncIdentity_profile_transaction_error__statementKey, a7, v31, v27, 0))
  {
    if ((int)objc_msgSend(v16, "getChangesCount") < 1)
    {
      v24 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v17, "UUID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "hk_assignError:code:format:", a7, 115, CFSTR("Duplicate medication schedule with UUID %@"), v25);

      v18 = 0;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v16, "lastInsertRowID");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "longLongValue");
        *(_DWORD *)buf = 138544386;
        v33 = v15;
        v34 = 2048;
        v35 = v21;
        v36 = 2048;
        v37 = a4;
        v38 = 2048;
        v39 = a3;
        v40 = 2114;
        v41 = v17;
        _os_log_impl(&dword_1B815E000, v19, OS_LOG_TYPE_DEFAULT, "[%{public}@] Inserted schedule with persistent ID: %lld sync_identity: %lld, sync_provenance=%lld description: %{public}@", buf, 0x34u);

      }
      objc_msgSend(v13, "healthMedicationsProfileExtension");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "medicationScheduleManager");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v23, "batchNotifyObserversOnCommitOfTransaction:didAddOrModifySchedule:syncIdentity:", v14, v17, a4);
      objc_msgSend(v16, "lastInsertRowID");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v18;
}

+ (uint64_t)_insertTimeIntervals:(void *)a3 schedulePrimaryKey:(void *)a4 transaction:(uint64_t)a5 error:
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v9 = a3;
  v10 = a4;
  objc_opt_self();
  objc_msgSend(v10, "databaseForEntityClass:", objc_opt_class());
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = v8;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
    while (2)
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v21 != v15)
          objc_enumerationMutation(v12);
        +[HDMedicationScheduleIntervalDataEntity insertPersistableMedicationScheduleIntervalData:ownerID:database:error:](HDMedicationScheduleIntervalDataEntity, "insertPersistableMedicationScheduleIntervalData:ownerID:database:error:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16), v9, v11, a5, (_QWORD)v20);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v17)
        {
          v18 = 0;
          goto LABEL_11;
        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v14)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_11:

  return v18;
}

+ (uint64_t)_isNewestSchedule:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  _BOOL4 v22;
  NSObject *v23;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a2;
  v8 = (void *)objc_opt_self();
  objc_msgSend(v7, "UUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:value:comparisonType:", CFSTR("uuid"), v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "medicationIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("medication_identifier"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1E0D29840];
  v25[0] = v10;
  v25[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "predicateMatchingAnyPredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationTimestamp");
  HDMedicationSchedulePredicateForCreationDate(5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "databaseForEntityClass:", v8);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "countValueForProperty:predicate:database:error:", CFSTR("creation_date"), v17, v18, a4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    if (objc_msgSend(v19, "integerValue") < 1)
    {
      v21 = 1;
    }
    else
    {
      _HKInitializeLogging();
      HKLogMedication();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = 2;
      v22 = os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG);

      if (v22)
      {
        HKLogMedication();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          +[HDMedicationScheduleEntity _isNewestSchedule:transaction:error:].cold.1();

        v21 = 2;
      }
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

const __CFString *__100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke()
{
  objc_opt_self();
  return CFSTR("INSERT OR REPLACE INTO medication_schedules (uuid, medication_uuid, medication_identifier, start_date_time, end_date_time, created_time_zone, frequency_type, cycle_start_date_components, note, creation_date, deleted, sync_identity, sync_provenance, minimum_compatibility_version, origin_compatibility_version, schedule_type, display_options, sync_anchor)VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM medication_schedules), 1))");
}

uint64_t __100__HDMedicationScheduleEntity__insertSchedule_syncProvenance_syncIdentity_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  double v22;
  sqlite3_int64 v23;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "medicationUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "medicationIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v6 != &stru_1E6E01EA0)
  {
    v7 = v6;
    objc_msgSend(*(id *)(a1 + 32), "medicationIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", &stru_1E6E01EA0))
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "medicationIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(*(id *)(a1 + 32), "medicationIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        HDSQLiteBindStringToStatement();

        goto LABEL_7;
      }
    }
  }
  sqlite3_bind_null(a2, 3);
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "startDateTime");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "endDateTime");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 32), "createdUTCOffset");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  sqlite3_bind_int64(a2, 7, objc_msgSend(*(id *)(a1 + 32), "frequencyType"));
  objc_msgSend(*(id *)(a1 + 32), "cycleStartDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v16 = (void *)MEMORY[0x1E0CB36F8];
    objc_msgSend(*(id *)(a1 + 32), "cycleStartDate");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "archivedDataWithRootObject:requiringSecureCoding:error:", v17, 1, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = objc_retainAutorelease(v18);
    sqlite3_bind_blob64(a2, 8, (const void *)objc_msgSend(v19, "bytes"), objc_msgSend(v19, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  objc_msgSend(*(id *)(a1 + 32), "note");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 32), "note");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindStringToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 9);
  }
  objc_msgSend(*(id *)(a1 + 32), "creationTimestamp");
  sqlite3_bind_double(a2, 10, v22);
  sqlite3_bind_int(a2, 11, objc_msgSend(*(id *)(a1 + 32), "isDeleted"));
  sqlite3_bind_int64(a2, 12, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 13, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 14, objc_msgSend(*(id *)(a1 + 32), "compatibilityRange"));
  objc_msgSend(*(id *)(a1 + 32), "compatibilityRange");
  sqlite3_bind_int64(a2, 15, v23);
  sqlite3_bind_int64(a2, 16, objc_msgSend(*(id *)(a1 + 32), "scheduleType"));
  return sqlite3_bind_int64(a2, 17, objc_msgSend(*(id *)(a1 + 32), "displayOptions"));
}

+ (BOOL)updateMedicationSchedulesToBeDeletedWithMedicationUUID:(id)a3 profile:(id)a4 transaction:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  _QWORD v18[4];
  __CFString *v19;

  v9 = a3;
  v10 = a4;
  objc_msgSend(a5, "protectedDatabase");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "currentSyncIdentityPersistentID");

  v18[0] = MEMORY[0x1E0C809B0];
  v18[2] = __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke;
  v18[3] = &unk_1E6E01A70;
  v18[1] = 3221225472;
  v19 = CFSTR("INSERT OR REPLACE INTO medication_schedules (uuid, medication_uuid, medication_identifier, start_date_time, created_time_zone, frequency_type, creation_date, deleted, sync_provenance, sync_identity, minimum_compatibility_version, origin_compatibility_version, schedule_type, display_options, sync_anchor) SELECT uuid, medication_uuid, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, COALESCE((SELECT MAX(sync_anchor) + 1 FROM medication_schedules), 1) FROM medication_schedules WHERE medication_uuid = ? AND deleted = ?");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke_2;
  v15[3] = &unk_1E6E01A98;
  v16 = v9;
  v17 = v12;
  v13 = v9;
  LOBYTE(a6) = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error__statementKeyUDCUpdate, a6, v18, v15, 0);

  return (char)a6;
}

id __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

uint64_t __111__HDMedicationScheduleEntity_updateMedicationSchedulesToBeDeletedWithMedicationUUID_profile_transaction_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  double Current;

  sqlite3_bind_null(a2, 1);
  sqlite3_bind_double(a2, 2, 0.0);
  objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  sqlite3_bind_int64(a2, 4, 0);
  Current = CFAbsoluteTimeGetCurrent();
  sqlite3_bind_double(a2, 5, Current);
  sqlite3_bind_int64(a2, 6, 1);
  sqlite3_bind_int64(a2, 7, 0);
  sqlite3_bind_int64(a2, 8, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 9, 0);
  sqlite3_bind_int64(a2, 10, 1);
  sqlite3_bind_int64(a2, 11, 0);
  sqlite3_bind_int64(a2, 12, 0);
  HDSQLiteBindFoundationValueToStatement();
  return sqlite3_bind_int(a2, 14, 0);
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

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  HDMedicationScheduleEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([HDMedicationScheduleEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (HDCodableMedicationSchedule)_codableRepresentationForMedicationScheduleID:(uint64_t)a3 row:(void *)a4 profile:(void *)a5 transaction:(uint64_t)a6 error:
{
  id v9;
  id v10;
  HDCodableMedicationSchedule *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  HDCodableMedicationScheduleCompatibilityVersionRange *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  HDCodableMedicationSchedule *v32;
  NSObject *v33;
  id v35;

  v9 = a5;
  v10 = a4;
  objc_opt_self();
  v11 = objc_alloc_init(HDCodableMedicationSchedule);
  HDSQLiteColumnWithNameAsUUID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hk_dataForUUIDBytes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setUuid:](v11, "setUuid:", v13);

  HDSQLiteColumnWithNameAsUUID();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "hk_dataForUUIDBytes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setMedicationUUID:](v11, "setMedicationUUID:", v15);

  HDSQLiteColumnWithNameAsString();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
    v18 = (const __CFString *)v16;
  else
    v18 = &stru_1E6E01EA0;
  -[HDCodableMedicationSchedule setMedicationIdentifier:](v11, "setMedicationIdentifier:", v18);

  HDSQLiteColumnWithNameAsDate();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "timeIntervalSinceReferenceDate");
  -[HDCodableMedicationSchedule setStartDateTime:](v11, "setStartDateTime:");

  HDSQLiteColumnWithNameAsDate();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "timeIntervalSinceReferenceDate");
  -[HDCodableMedicationSchedule setEndDateTime:](v11, "setEndDateTime:");

  HDSQLiteColumnWithNameAsString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setCreatedTimeZone:](v11, "setCreatedTimeZone:", v21);

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableMedicationSchedule setFrequencyType:](v11, "setFrequencyType:");
  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "hk_codableDateComponents");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setCycleStartDateComponents:](v11, "setCycleStartDateComponents:", v23);

  HDSQLiteColumnWithNameAsString();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setNote:](v11, "setNote:", v24);

  HDSQLiteColumnWithNameAsDouble();
  -[HDCodableMedicationSchedule setCreationDate:](v11, "setCreationDate:");
  -[HDCodableMedicationSchedule setDeleted:](v11, "setDeleted:", HDSQLiteColumnWithNameAsBoolean());
  v25 = objc_alloc_init(HDCodableMedicationScheduleCompatibilityVersionRange);
  -[HDCodableMedicationScheduleCompatibilityVersionRange setMinimum:](v25, "setMinimum:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableMedicationScheduleCompatibilityVersionRange setOrigin:](v25, "setOrigin:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableMedicationSchedule setCompatibilityVersionRange:](v11, "setCompatibilityVersionRange:", v25);
  -[HDCodableMedicationSchedule setScheduleType:](v11, "setScheduleType:", HDSQLiteColumnWithNameAsInt64());
  -[HDCodableMedicationSchedule setDisplayOptions:](v11, "setDisplayOptions:", HDSQLiteColumnWithNameAsInt64());
  v26 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(v10, "syncIdentityManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(v27, "identityForEntityID:transaction:error:", v26, v9, &v35);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v35;

  if (!v28)
  {
    _HKInitializeLogging();
    v33 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
      +[HDMedicationScheduleEntity _codableRepresentationForMedicationScheduleID:row:profile:transaction:error:].cold.1((uint64_t)v29, v33);
    goto LABEL_9;
  }
  objc_msgSend(v28, "identity");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "codableSyncIdentity");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDCodableMedicationSchedule setSyncIdentity:](v11, "setSyncIdentity:", v31);

  if (!+[HDMedicationScheduleIntervalDataEntity addIntervalDataToCodable:withScheduleID:transaction:error:](HDMedicationScheduleIntervalDataEntity, "addIntervalDataToCodable:withScheduleID:transaction:error:", v11, a2, v9, a6))
  {
LABEL_9:
    v32 = 0;
    goto LABEL_10;
  }
  v32 = v11;
LABEL_10:

  return v32;
}

+ (id)availableSchedulePredicate
{
  return (id)objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:comparisonType:otherProperty:", CFSTR("minimum_compatibility_version"), 4, CFSTR("origin_compatibility_version"));
}

+ (id)compatibilityVersion0ScheduleTypesPredicate
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0D29840];
  objc_msgSend(MEMORY[0x1E0D29880], "isNullPredicateWithProperty:", CFSTR("end_date_time"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0D29848], "containsPredicateWithProperty:values:", CFSTR("schedule_type"), &unk_1E6E11700);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "predicateMatchingAllPredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (void)_shouldProceedWithInsertionForSchedule:(uint64_t)a1 profile:(NSObject *)a2 transaction:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1B815E000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] Schedule is deleted", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

+ (void)_shouldProceedWithInsertionForSchedule:(NSObject *)a3 profile:transaction:error:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "medicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HKSensitiveLogItem();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138543618;
  v9 = a1;
  v10 = 2114;
  v11 = v6;
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, a3, v7, "[%{public}@] Medication not found for medication with identifier: %{public}@", (uint8_t *)&v8);

}

+ (void)_shouldProceedWithInsertionForSchedule:profile:transaction:error:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2_1(&dword_1B815E000, v0, (uint64_t)v0, "[%{public}@] Attempting to insert unexepcted schedule with type null: %{public}@", v1);
  OUTLINED_FUNCTION_2();
}

+ (void)_isNewestSchedule:transaction:error:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1B815E000, v0, OS_LOG_TYPE_DEBUG, "[%{public}@] Not inserting as there are %{public}@ newer schedules", v1, 0x16u);
  OUTLINED_FUNCTION_2();
}

+ (void)_codableRepresentationForMedicationScheduleID:(uint64_t)a1 row:(NSObject *)a2 profile:transaction:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_fault_impl(&dword_1B815E000, a2, OS_LOG_TYPE_FAULT, "Unable to fetch sync identity from HDMedicationScheduleEntity %{public}@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
