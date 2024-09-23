@implementation HDMedicationScheduleIntervalDataEntity

+ (id)_medicationScheduleIntervalDataEntityPropertiesForModel
{
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("schedule_id");
  v3[1] = CFSTR("start_time_components");
  v3[2] = CFSTR("day_of_week");
  v3[3] = CFSTR("cycle_index");
  v3[4] = CFSTR("cycle_interval_days");
  v3[5] = CFSTR("dose");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)_medicationScheduleIntervalDataFromRow:(HDSQLiteRow *)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsNumber();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteColumnWithNameAsNumber();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4A0]), "initWithStartTimeComponent:daysOfWeek:cycleIndex:cycleIntervalDays:dose:", v3, v4, v5, v6, v7);

  return v8;
}

+ (id)databaseTable
{
  return CFSTR("medication_schedule_interval_data");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_2;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("schedule_id");
  +[HDHealthEntity defaultForeignKey](HDMedicationScheduleEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (BOOL)enumerateMedicationScheduleIntervalDataWithOwnerID:(int64_t)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[7];

  v24[6] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v11 = (void *)MEMORY[0x1E0D29838];
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a4;
  objc_msgSend(v12, "numberWithLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("schedule_id"), v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "databaseForEntityClass:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = CFSTR("schedule_id");
  v24[1] = CFSTR("start_time_components");
  v24[2] = CFSTR("day_of_week");
  v24[3] = CFSTR("cycle_index");
  v24[4] = CFSTR("cycle_interval_days");
  v24[5] = CFSTR("dose");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __130__HDMedicationScheduleIntervalDataEntity_enumerateMedicationScheduleIntervalDataWithOwnerID_transaction_error_enumerationHandler___block_invoke;
  v21[3] = &unk_1E6E01CD0;
  v22 = v10;
  v23 = a1;
  v19 = v10;
  LOBYTE(a5) = objc_msgSend(v17, "enumerateProperties:error:enumerationHandler:", v18, a5, v21);

  return (char)a5;
}

uint64_t __130__HDMedicationScheduleIntervalDataEntity_enumerateMedicationScheduleIntervalDataWithOwnerID_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 40), "_medicationScheduleIntervalDataFromRow:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (id)insertPersistableMedicationScheduleIntervalData:(id)a3 ownerID:(id)a4 database:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(a1, "_medicationScheduleIntervalDataEntityPropertiesForModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __113__HDMedicationScheduleIntervalDataEntity_insertPersistableMedicationScheduleIntervalData_ownerID_database_error___block_invoke;
  v18[3] = &unk_1E6E01CF8;
  v19 = v11;
  v20 = v10;
  v14 = v10;
  v15 = v11;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v12, v13, a6, v18);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __113__HDMedicationScheduleIntervalDataEntity_insertPersistableMedicationScheduleIntervalData_ownerID_database_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  MEMORY[0x1BCCAD4D0](a2, CFSTR("schedule_id"), *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "startTimeComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

  MEMORY[0x1BCCAD4B8](a2, CFSTR("day_of_week"), objc_msgSend(*(id *)(a1 + 40), "daysOfWeek"));
  objc_msgSend(*(id *)(a1 + 40), "cycleIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v5;
  if (v5)
    MEMORY[0x1BCCAD4A0](a2, CFSTR("cycle_index"), (double)objc_msgSend(v5, "integerValue"));
  else
    MEMORY[0x1BCCAD4C4](a2, CFSTR("cycle_index"));
  objc_msgSend(*(id *)(a1 + 40), "cycleIntervalDays");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    MEMORY[0x1BCCAD4A0](a2, CFSTR("cycle_interval_days"), (double)objc_msgSend(v6, "integerValue"));
  else
    MEMORY[0x1BCCAD4C4](a2, CFSTR("cycle_interval_days"));
  objc_msgSend(*(id *)(a1 + 40), "dose");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "doubleValue");
    MEMORY[0x1BCCAD4A0](a2, CFSTR("dose"));
  }
  else
  {
    MEMORY[0x1BCCAD4C4](a2, CFSTR("dose"));
  }

}

+ (BOOL)addIntervalDataToCodable:(id)a3 withScheduleID:(int64_t)a4 transaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v10 = a3;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__HDMedicationScheduleIntervalDataEntity_addIntervalDataToCodable_withScheduleID_transaction_error___block_invoke;
  v13[3] = &unk_1E6E01D20;
  v14 = v10;
  v15 = a1;
  v11 = v10;
  LOBYTE(a6) = objc_msgSend(a1, "enumerateMedicationScheduleIntervalDataWithOwnerID:transaction:error:enumerationHandler:", a4, a5, a6, v13);

  return (char)a6;
}

uint64_t __100__HDMedicationScheduleIntervalDataEntity_addIntervalDataToCodable_withScheduleID_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_codableRepresentationForMedicationScheduleIntervalData:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addIntervalData:", v3);

  return 1;
}

+ (id)_codableRepresentationForMedicationScheduleIntervalData:(id)a3
{
  return (id)objc_msgSend(a3, "hd_codableFromIntervalData");
}

@end
