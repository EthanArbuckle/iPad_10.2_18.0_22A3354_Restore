@implementation HDDismissedDrugInteractionResultEntity

+ (id)databaseTable
{
  return CFSTR("medication_dismissed_interactions");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 7;
  return (const $BAB52C3E828CEF64050DB2B91BCCE94A *)columnDefinitionsWithCount__HDDismissedDrugInteractionResultEntityColumnDefinitions;
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)uniquedColumns
{
  _QWORD v3[6];

  v3[5] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("interaction_identifier");
  v3[1] = CFSTR("first_drug_class_identifier");
  v3[2] = CFSTR("first_drug_class_ancestor_identifier");
  v3[3] = CFSTR("second_drug_class_identifier");
  v3[4] = CFSTR("second_drug_class_ancestor_identifier");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)enumerateDismissedDrugInteractionResultsWithPredicate:(id)a3 transaction:(id)a4 error:(id *)a5 enumerationHandler:(id)a6
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

  +[HDDismissedDrugInteractionResultEntity _propertiesForEntity]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __133__HDDismissedDrugInteractionResultEntity_enumerateDismissedDrugInteractionResultsWithPredicate_transaction_error_enumerationHandler___block_invoke;
  v17[3] = &unk_1E6E00FC0;
  v18 = v10;
  v15 = v10;
  LOBYTE(a5) = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a5, v17);

  return (char)a5;
}

+ (id)_propertiesForEntity
{
  _QWORD v1[7];

  v1[6] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = CFSTR("interaction_identifier");
  v1[1] = CFSTR("first_drug_class_identifier");
  v1[2] = CFSTR("first_drug_class_ancestor_identifier");
  v1[3] = CFSTR("second_drug_class_identifier");
  v1[4] = CFSTR("second_drug_class_ancestor_identifier");
  v1[5] = CFSTR("creation_date");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 6);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __133__HDDismissedDrugInteractionResultEntity_enumerateDismissedDrugInteractionResultsWithPredicate_transaction_error_enumerationHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB64B0]), "initWithRawIdentifier:", HDSQLiteColumnWithNameAsInt64());
  HDSQLiteColumnWithNameAsDate();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D2C400]), "_initWithInteractionIdentifier:firstDrugClassIdentifier:firstDrugClassAncestorIdentifier:secondDrugClassIdentifier:secondDrugClassAncestorIdentifier:creationDate:", v2, v3, v4, v5, v6, v7);
  v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  return v9;
}

+ (BOOL)insertDismissedDrugInteractionResult:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  HDDismissedDrugInteractionResultInsertOperation *v9;
  void *v10;
  HDDismissedDrugInteractionResultInsertOperation *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  v9 = [HDDismissedDrugInteractionResultInsertOperation alloc];
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[HDDismissedDrugInteractionResultInsertOperation initWithDismissedDrugInteractionResults:](v9, "initWithDismissedDrugInteractionResults:", v10);
  LOBYTE(a5) = -[HDJournalableOperation performOrJournalWithProfile:error:](v11, "performOrJournalWithProfile:error:", v7, a5);

  return (char)a5;
}

+ (BOOL)_insertDismissedDrugInteractionResult:(void *)a3 transaction:(uint64_t)a4 error:
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

  +[HDDismissedDrugInteractionResultEntity _propertiesForEntity]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__HDDismissedDrugInteractionResultEntity__insertDismissedDrugInteractionResult_transaction_error___block_invoke;
  v15[3] = &unk_1E6E00E30;
  v16 = v6;
  v11 = v6;
  objc_msgSend(v8, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v9, v10, a4, v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12 != 0;

  return v13;
}

void __98__HDDismissedDrugInteractionResultEntity__insertDismissedDrugInteractionResult_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "interactionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("interaction_identifier"), objc_msgSend(v4, "rawIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "firstDrugClassIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("first_drug_class_identifier"), objc_msgSend(v5, "rawIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "firstDrugClassAncestorIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("first_drug_class_ancestor_identifier"), objc_msgSend(v6, "rawIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "secondDrugClassIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("second_drug_class_identifier"), objc_msgSend(v7, "rawIdentifier"));

  objc_msgSend(*(id *)(a1 + 32), "secondDrugClassAncestorIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD4B8](a2, CFSTR("second_drug_class_ancestor_identifier"), objc_msgSend(v8, "rawIdentifier"));

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAD494](a2, CFSTR("creation_date"), v9);

}

@end
