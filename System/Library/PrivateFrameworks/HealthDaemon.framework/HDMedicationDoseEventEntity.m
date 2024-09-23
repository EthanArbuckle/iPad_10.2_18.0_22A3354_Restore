@implementation HDMedicationDoseEventEntity

+ (id)databaseTable
{
  return CFSTR("medication_dose_event_samples");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  objc_opt_self();
  *a3 = 10;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)_columnDefinitionsWithCount__columnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data_id");
  +[HDDataEntity defaultForeignKey](HDSampleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)indicesWithBehavior:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D29860]);
  v4 = objc_opt_class();
  v20 = CFSTR("medication_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntity:name:columns:", v4, CFSTR("medication_identifiers"), v5);
  v21[0] = v6;
  v7 = objc_alloc(MEMORY[0x1E0D29860]);
  v8 = objc_opt_class();
  v19 = CFSTR("medication_uuid");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithEntity:name:columns:", v8, CFSTR("medication_uuids"), v9);
  v21[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_alloc(MEMORY[0x1E0D29860]);
  v13 = objc_opt_class();
  v18 = CFSTR("hashed_medication_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithEntity:name:columns:", v13, CFSTR("hashed_medication_identifiers"), v14);
  objc_msgSend(v11, "arrayByAddingObject:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (int64_t)shouldInsertObject:(id)a3 sourceID:(id)a4 profile:(id)a5 transaction:(id)a6 objectToReplace:(id *)a7 objectID:(id *)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
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
  BOOL v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  id v53;
  objc_super v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v53 = a4;
  v15 = a5;
  v16 = a6;
  objc_msgSend(v14, "medicationUUID");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    v51 = v15;
    v19 = (void *)MEMORY[0x1E0D29840];
    HDUserDomainConceptEntityPredicateForConceptUUID(v17, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29838], "predicateWithProperty:equalToValue:", CFSTR("deleted"), MEMORY[0x1E0C9AAA0]);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "compoundPredicateWithPredicate:otherPredicate:", v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = v16;
    objc_msgSend(v16, "protectedDatabase");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    +[HDSQLiteEntity anyInDatabase:predicate:error:](HDUserDomainConceptEntity, "anyInDatabase:predicate:error:", v24, v22, &v55);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v55;

    if (!v25)
    {
      if (v26)
      {
        v27 = v53;
        if (a9)
          *a9 = objc_retainAutorelease(v26);
        else
          _HKLogDroppedError();
        v41 = 2;
      }
      else
      {
        _HKInitializeLogging();
        HKLogMedication();
        v42 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "UUID");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "hk_shortRepresentation");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = a1;
          v59 = 2114;
          v60 = v44;
          v61 = 2114;
          v62 = v18;
          _os_log_impl(&dword_1B7802000, v42, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because medication with UUID %{public}@ is deleted", buf, 0x20u);

        }
        v41 = 1;
        v27 = v53;
      }

      v28 = v51;
      goto LABEL_30;
    }

    v27 = v53;
    v28 = v51;
  }
  else
  {
    objc_msgSend(v14, "medicationIdentifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = 0;
    +[HDUserDomainConceptEntity userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:profile:transaction:error:](HDUserDomainConceptEntity, "userDomainConceptUUIDForCanonicalConceptWithSemanticIdentifierString:profile:transaction:error:", v29, v15, v16, &v56);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v56;

    v28 = v15;
    if (!v18)
    {
      v23 = v16;
      if (v26)
      {
        v27 = v53;
        if (a9)
        {
          v26 = objc_retainAutorelease(v26);
          v18 = 0;
          *a9 = v26;
        }
        else
        {
          _HKLogDroppedError();
          v18 = 0;
        }
        v41 = 2;
      }
      else
      {
        v45 = v28;
        _HKInitializeLogging();
        HKLogMedication();
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v14, "UUID");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "hk_shortRepresentation");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "medicationIdentifier");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543874;
          v58 = a1;
          v59 = 2114;
          v60 = v48;
          v61 = 2112;
          v62 = v49;
          _os_log_impl(&dword_1B7802000, v46, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because medicationUUID is nil for %@", buf, 0x20u);

        }
        v26 = 0;
        v18 = 0;
        v41 = 1;
        v27 = v53;
        v28 = v45;
      }
      goto LABEL_30;
    }
    objc_msgSend(v14, "_setMedicationUUID:", v18);
    v30 = +[HDUserDomainConceptEntity incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:profile:transaction:error:](HDUserDomainConceptEntity, "incrementSyncAnchorAndAdjustSyncProvenanceIfNotLocalForUserDomainConceptWithUUID:profile:transaction:error:", v18, v15, v16, a9);
    v23 = v16;
    if (!v30)
    {
      v41 = 2;
      v27 = v53;
LABEL_30:

      goto LABEL_31;
    }
    v27 = v53;
  }

  v54.receiver = a1;
  v54.super_class = (Class)&OBJC_METACLASS___HDMedicationDoseEventEntity;
  v31 = objc_msgSendSuper2(&v54, sel_shouldInsertObject_sourceID_profile_transaction_objectToReplace_objectID_error_, v14, v27, v28, v23, a7, a8, a9);
  if (v31 == (id)1)
  {
    v32 = a1;
    v33 = v23;
    v34 = v28;
    objc_msgSend(v14, "metadata");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D0]);
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "metadata");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x1E0CB55D8]);
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    _HKInitializeLogging();
    HKLogMedication();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v14, "UUID");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "hk_shortRepresentation");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544130;
      v58 = v32;
      v59 = 2114;
      v60 = v40;
      v61 = 2114;
      v62 = v26;
      v63 = 2114;
      v64 = v37;
      _os_log_impl(&dword_1B7802000, v38, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignore insert of %{public}@, because of dedupe logic for (%{public}@, %{public}@)", buf, 0x2Au);

      v27 = v53;
    }

    v41 = 1;
    v28 = v34;
    v23 = v33;
    goto LABEL_30;
  }
  v41 = (int64_t)v31;
LABEL_31:

  return v41;
}

+ (id)insertDataObject:(id)a3 withProvenance:(id)a4 inDatabase:(id)a5 persistentID:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  id *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  int v33;
  void *v34;
  id v35;
  void *v37;
  _QWORD v38[4];
  id v39;
  id v40;
  _QWORD v41[5];

  v12 = a3;
  v13 = a6;
  v14 = a5;
  v15 = (void *)objc_opt_class();
  if ((objc_msgSend(v15, "isEqual:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HDMedicationDoseEventEntity.m"), 175, CFSTR("Subclasses must override %s"), "+[HDMedicationDoseEventEntity insertDataObject:withProvenance:inDatabase:persistentID:error:]");

  }
  v16 = v14;
  v17 = v12;
  v18 = v13;
  v19 = objc_opt_self();
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_210);
  v20 = (void *)qword_1ED552368;
  v21 = MEMORY[0x1E0C809B0];
  if (!qword_1ED552368)
  {
    v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v23 = (void *)qword_1ED552368;
    qword_1ED552368 = (uint64_t)v22;

    v41[0] = v21;
    v41[1] = 3221225472;
    v41[2] = __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke;
    v41[3] = &__block_descriptor_40_e5_v8__0l;
    v41[4] = v19;
    objc_msgSend(v16, "onCommit:orRollback:", v41, &__block_literal_global_245_0);
    v20 = (void *)qword_1ED552368;
  }
  if ((unint64_t)objc_msgSend(v20, "count") <= 0x63)
  {
    v24 = (void *)qword_1ED552368;
    v25 = objc_alloc(MEMORY[0x1E0CB3940]);
    v26 = objc_msgSend(v18, "longLongValue");
    objc_msgSend(v17, "UUID");
    v27 = a7;
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "hk_shortRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = (void *)objc_msgSend(v25, "initWithFormat:", CFSTR("(%lld, %@)"), v26, v29);
    objc_msgSend(v24, "addObject:", v30);

    a7 = v27;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_210);

  v38[0] = v21;
  v38[1] = 3221225472;
  v38[2] = __93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2;
  v38[3] = &unk_1E6CE7750;
  v39 = v18;
  v40 = v17;
  v31 = v17;
  v32 = v18;
  v33 = objc_msgSend(v16, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &insertDataObject_withProvenance_inDatabase_persistentID_error__insertKey_2, a7, &__block_literal_global_119, v38, 0);

  if (v33)
    v34 = v32;
  else
    v34 = 0;
  v35 = v34;

  return v35;
}

const __CFString *__93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke()
{
  return CFSTR("INSERT INTO medication_dose_event_samples (data_id, log_origin, schedule_item_identifier, medication_uuid, medication_identifier, scheduled_dose_quantity, dose_quantity, scheduled_date, status, hashed_medication_identifier) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
}

void __93__HDMedicationDoseEventEntity_insertDataObject_withProvenance_inDatabase_persistentID_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
  sqlite3_bind_int64(a2, 2, objc_msgSend(*(id *)(a1 + 40), "logOrigin"));
  objc_msgSend(*(id *)(a1 + 40), "scheduleItemIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheduleItemIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteBindFoundationValueToStatement();

  }
  else
  {
    sqlite3_bind_null(a2, 3);
  }
  objc_msgSend(*(id *)(a1 + 40), "medicationUUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 40), "medicationIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

  objc_msgSend(*(id *)(a1 + 40), "scheduledDoseQuantity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheduledDoseQuantity");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "doubleValue");
    sqlite3_bind_double(a2, 6, v10);

  }
  else
  {
    sqlite3_bind_null(a2, 6);
  }
  objc_msgSend(*(id *)(a1 + 40), "doseQuantity");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(*(id *)(a1 + 40), "doseQuantity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "doubleValue");
    sqlite3_bind_double(a2, 7, v13);

  }
  else
  {
    sqlite3_bind_null(a2, 7);
  }
  objc_msgSend(*(id *)(a1 + 40), "scheduledDate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 40), "scheduledDate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceReferenceDate");
    sqlite3_bind_double(a2, 8, v16);

  }
  else
  {
    sqlite3_bind_null(a2, 8);
  }
  sqlite3_bind_int64(a2, 9, objc_msgSend(*(id *)(a1 + 40), "status"));
  v17 = objc_alloc(MEMORY[0x1E0CB68B8]);
  objc_msgSend(*(id *)(a1 + 40), "medicationIdentifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_msgSend(v17, "initWithSemanticIdentifierString:", v18);

  objc_msgSend(v20, "underlyingIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindFoundationValueToStatement();

}

void __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_210);
  v2 = (void *)objc_msgSend((id)qword_1ED552368, "copy");
  v3 = (void *)qword_1ED552368;
  qword_1ED552368 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_210);
  _HKInitializeLogging();
  HKLogMedication();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = objc_msgSend(v2, "count");
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543874;
    v9 = v5;
    v10 = 2048;
    v11 = v6;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: persisted %ld [%{public}@]", (uint8_t *)&v8, 0x20u);

  }
}

void __93__HDMedicationDoseEventEntity__logPersistedDoseEventOnCommitDatabase_doseEvent_persistentID___block_invoke_244()
{
  void *v0;

  os_unfair_lock_lock((os_unfair_lock_t)&_MergedGlobals_210);
  v0 = (void *)qword_1ED552368;
  qword_1ED552368 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_210);
}

+ (BOOL)isConcreteEntity
{
  return 1;
}

+ (id)codableObjectsFromObjectCollection:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "generatedObjectCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "medicationDoseEvents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (BOOL)addCodableObject:(id)a3 toCollection:(id)a4
{
  if (a3)
    objc_msgSend(a4, "addMedicationDoseEvent:", a3);
  return a3 != 0;
}

+ (id)entityEncoderForProfile:(id)a3 transaction:(id)a4 purpose:(int64_t)a5 encodingOptions:(id)a6 authorizationFilter:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  _HDMedicationDoseEventEntityEncoder *v15;

  v11 = a7;
  v12 = a6;
  v13 = a4;
  v14 = a3;
  v15 = -[HDEntityEncoder initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:]([_HDMedicationDoseEventEntityEncoder alloc], "initWithHealthEntityClass:profile:transaction:purpose:encodingOptions:authorizationFilter:", objc_opt_class(), v14, v13, a5, v12, v11);

  return v15;
}

+ (id)syntheticQuantityColumnName
{
  return CFSTR("dose_quantity");
}

@end
