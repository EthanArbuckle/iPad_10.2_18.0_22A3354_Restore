@implementation HDMedicationScheduleItemEntity

+ (id)medicationScheduleItemEntityPropertiesForModel
{
  _QWORD v1[5];

  v1[4] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("identifier");
  v1[1] = CFSTR("scheduled_date_time");
  v1[2] = CFSTR("notification_sent");
  v1[3] = CFSTR("doses");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)medicationScheduleItemFromRow:error:
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;

  objc_opt_self();
  HDSQLiteColumnWithNameAsDate();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = HDSQLiteColumnWithNameAsBoolean();
  objc_opt_class();
  HDSQLiteColumnWithNameAsArrayOfClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C4A8]), "initWithScheduledDateTime:notificationSent:doses:", v0, v1, v2);

  return v3;
}

+ (id)medicationScheduleItemWithIdentifier:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v8 = a3;
  v9 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__8;
  v24 = __Block_byref_object_dispose__8;
  v25 = 0;
  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke;
  v19[3] = &__block_descriptor_40_e15___NSString_8__0l;
  v19[4] = a1;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_2;
  v17[3] = &unk_1E6E00DB8;
  v12 = v8;
  v18 = v12;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_3;
  v16[3] = &unk_1E6E00DE0;
  v16[4] = &v20;
  v16[5] = a1;
  LODWORD(a5) = objc_msgSend(v10, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &medicationScheduleItemWithIdentifier_transaction_error__lookupKey, a5, v19, v17, v16);

  if ((_DWORD)a5)
    v13 = (void *)v21[5];
  else
    v13 = 0;
  v14 = v13;

  _Block_object_dispose(&v20, 8);
  return v14;
}

id __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend((id)objc_opt_class(), "disambiguatedDatabaseTable");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("SELECT %@, %@, %@, %@ FROM %@ WHERE %@ = ?"), CFSTR("identifier"), CFSTR("scheduled_date_time"), CFSTR("notification_sent"), CFSTR("doses"), v1, CFSTR("identifier"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_2()
{
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __89__HDMedicationScheduleItemEntity_medicationScheduleItemWithIdentifier_transaction_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  +[HDMedicationScheduleItemEntity medicationScheduleItemFromRow:error:]();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return 0;
}

+ (BOOL)enumerateItemsWithPredicate:(id)a3 orderingTerms:(id)a4 transaction:(id)a5 error:(id *)a6 enumerationHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  objc_msgSend(a5, "databaseForEntityClass:", a1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v15, v14, 0, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDMedicationScheduleItemEntity medicationScheduleItemEntityPropertiesForModel]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __113__HDMedicationScheduleItemEntity_enumerateItemsWithPredicate_orderingTerms_transaction_error_enumerationHandler___block_invoke;
  v20[3] = &unk_1E6E00E08;
  v21 = v12;
  v22 = a1;
  v18 = v12;
  LOBYTE(a6) = objc_msgSend(v16, "enumeratePersistentIDsAndProperties:error:enumerationHandler:", v17, a6, v20);

  return (char)a6;
}

uint64_t __113__HDMedicationScheduleItemEntity_enumerateItemsWithPredicate_orderingTerms_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[HDMedicationScheduleItemEntity medicationScheduleItemFromRow:error:]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v3;
}

+ (id)insertMedicationScheduleItem:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDMedicationScheduleItemEntity medicationScheduleItemEntityPropertiesForModel]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __81__HDMedicationScheduleItemEntity_insertMedicationScheduleItem_transaction_error___block_invoke;
  v14[3] = &unk_1E6E00E30;
  v15 = v8;
  v11 = v8;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v9, v10, a5, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __81__HDMedicationScheduleItemEntity_insertMedicationScheduleItem_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4E8](a2, CFSTR("identifier"), v4);

  objc_msgSend(*(id *)(a1 + 32), "scheduledDateTime");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD494](a2, CFSTR("scheduled_date_time"), v5);

  MEMORY[0x1BCCAD488](a2, CFSTR("notification_sent"), objc_msgSend(*(id *)(a1 + 32), "notificationSent"));
  objc_msgSend(*(id *)(a1 + 32), "doses");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindSecureCodingObjectToProperty();

}

+ (BOOL)updateNotification:(BOOL)a3 itemIdentifier:(id)a4 transaction:(id)a5 error:(id *)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  BOOL v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v10 = (void *)MEMORY[0x1E0D29838];
  v11 = a5;
  objc_msgSend(v10, "predicateWithProperty:equalToValue:", CFSTR("identifier"), a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = CFSTR("notification_sent");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "databaseForEntityClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__HDMedicationScheduleItemEntity_updateNotification_itemIdentifier_transaction_error___block_invoke;
  v16[3] = &__block_descriptor_33_e34_v16__0__HDSQLiteStatementBinder__8l;
  v17 = a3;
  LOBYTE(a6) = objc_msgSend(a1, "updateProperties:predicate:database:error:bindingHandler:", v13, v12, v14, a6, v16);

  return (char)a6;
}

void __86__HDMedicationScheduleItemEntity_updateNotification_itemIdentifier_transaction_error___block_invoke()
{
  JUMPOUT(0x1BCCAD488);
}

+ (BOOL)deleteMedicationScheduleItemsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;

  v8 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(a1, "deleteEntitiesInDatabase:predicate:error:", v9, v8, a5);

  return (char)a5;
}

+ (id)databaseTable
{
  return CFSTR("medication_schedule_items");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 5;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__columnDefinitions_0;
}

+ (int64_t)protectionClass
{
  return 2;
}

@end
