@implementation HDDismissedPregnancyLactationInteractionEntity

+ (id)databaseTable
{
  return CFSTR("medication_dismissed_pregnancy_lactation_interactions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 4;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__HDDismissedPregnancyLactationInteractionEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("medication_identifier");
  v3[1] = CFSTR("interaction_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)enumerateDismissedPregnancyLactationInteractionsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;

  v10 = a6;
  v11 = a3;
  objc_msgSend(a4, "databaseForEntityClass:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDismissedPregnancyLactationInteractionEntity _propertiesForEntity]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __149__HDDismissedPregnancyLactationInteractionEntity_enumerateDismissedPregnancyLactationInteractionsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6E00FC0;
  v18 = v10;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a5, v17);

  return (char)a5;
}

+ (id)_propertiesForEntity
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("medication_identifier");
  v1[1] = CFSTR("interaction_type");
  v1[2] = CFSTR("creation_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 3);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __149__HDDismissedPregnancyLactationInteractionEntity_enumerateDismissedPregnancyLactationInteractionsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  v3 = HDSQLiteColumnWithNameAsInt64();
  HDSQLiteColumnWithNameAsDate();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C408]), "_initWithMedicationIdentifier:interactionType:creationDate:", v2, v3, v4);
  v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v6;
}

+ (BOOL)insertDismissedPregnancyLactationInteraction:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HDDismissedPregnancyLactationInteractionInsertOperation *v9;
  void *v10;
  HDDismissedPregnancyLactationInteractionInsertOperation *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = [HDDismissedPregnancyLactationInteractionInsertOperation alloc];
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDDismissedPregnancyLactationInteractionInsertOperation initWithDismissedPregnancyLactationInteractions:](v9, "initWithDismissedPregnancyLactationInteractions:", v10);
  LOBYTE(a5) = -[HDJournalableOperation performOrJournalWithProfile:error:](v11, "performOrJournalWithProfile:error:", v7, a5);

  return (char)a5;
}

+ (BOOL)_insertDismissedPregnancyLactationInteraction:(void *)a3 transaction:(uint64_t)a4 error:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;

  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_opt_self();
  objc_msgSend(v7, "databaseForEntityClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[HDDismissedPregnancyLactationInteractionEntity _propertiesForEntity]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __114__HDDismissedPregnancyLactationInteractionEntity__insertDismissedPregnancyLactationInteraction_transaction_error___block_invoke;
  v15[3] = &unk_1E6E00E30;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v8, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v9, v10, a4, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v13;
}

void __114__HDDismissedPregnancyLactationInteractionEntity__insertDismissedPregnancyLactationInteraction_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "medicationIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("medication_identifier"), objc_msgSend(v4, "rawIdentifier"));

  MEMORY[0x1BCCAD4B8](a2, CFSTR("interaction_type"), objc_msgSend(*(id *)(a1 + 32), "interactionType"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD494](a2, CFSTR("creation_date"), v5);

}

@end
