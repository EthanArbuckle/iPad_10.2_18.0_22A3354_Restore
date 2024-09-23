@implementation HDStatisticsCalculatorEntity

+ (id)statisticsForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__121;
  v34 = __Block_byref_object_dispose__121;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__121;
  v28 = __Block_byref_object_dispose__121;
  v29 = 0;
  v36[0] = CFSTR("anchor");
  v36[1] = CFSTR("statistics");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _HDPredicateForOwnerAndType(v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseForEntityClass:", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__HDStatisticsCalculatorEntity_statisticsForOwner_type_anchor_transaction_error___block_invoke;
  v23[3] = &unk_1E6CFD100;
  v23[4] = &v24;
  v23[5] = &v30;
  v19 = objc_msgSend(v18, "enumerateProperties:error:enumerationHandler:", v15, a7, v23);
  if (a5)
    *a5 = objc_retainAutorelease((id)v25[5]);
  if (v19)
    v20 = (void *)v31[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

uint64_t __81__HDStatisticsCalculatorEntity_statisticsForOwner_type_anchor_transaction_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  HDSQLiteColumnWithNameAsNumber();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_opt_class();
  HDSQLiteColumnWithNameAsObject();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  return 1;
}

+ (id)calculatorForOwner:(id)a3 type:(id)a4 anchor:(id *)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  id v21;
  _QWORD v23[6];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  _QWORD v36[3];

  v36[2] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__121;
  v34 = __Block_byref_object_dispose__121;
  v35 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__121;
  v28 = __Block_byref_object_dispose__121;
  v29 = 0;
  v36[0] = CFSTR("anchor");
  v36[1] = CFSTR("calculator");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  _HDPredicateForOwnerAndType(v12, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "databaseForEntityClass:", a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "queryWithDatabase:predicate:", v17, v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __81__HDStatisticsCalculatorEntity_calculatorForOwner_type_anchor_transaction_error___block_invoke;
  v23[3] = &unk_1E6CFD100;
  v23[4] = &v30;
  v23[5] = &v24;
  v19 = objc_msgSend(v18, "enumerateProperties:error:enumerationHandler:", v15, a7, v23);
  if (a5)
    *a5 = objc_retainAutorelease((id)v31[5]);
  if (v19)
    v20 = (void *)v25[5];
  else
    v20 = 0;
  v21 = v20;

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);

  return v21;
}

BOOL __81__HDStatisticsCalculatorEntity_calculatorForOwner_type_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _BOOL8 v13;

  HDSQLiteColumnWithNameAsNumber();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  HDSQLiteColumnWithNameAsData();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 1;
  if (v9)
  {
    +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:error:](HDStatisticsCollectionCalculator, "calculatorForArchivedRepresentation:error:", v9, a4);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      v13 = 0;
  }

  return v13;
}

+ (BOOL)setStatistics:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v28[0] = CFSTR("owner_id");
  v28[1] = CFSTR("quantity_type");
  v28[2] = CFSTR("anchor");
  v28[3] = CFSTR("statistics");
  v15 = (void *)MEMORY[0x1E0C99D20];
  v16 = a6;
  objc_msgSend(v15, "arrayWithObjects:count:", v28, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "databaseForEntityClass:", a1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __80__HDStatisticsCalculatorEntity_setStatistics_forOwner_anchor_transaction_error___block_invoke;
  v24[3] = &unk_1E6CFD128;
  v25 = v12;
  v26 = v13;
  v27 = v14;
  v19 = v14;
  v20 = v13;
  v21 = v12;
  objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v18, v17, a7, v24);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22 != 0;
}

void __80__HDStatisticsCalculatorEntity_setStatistics_forOwner_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "quantityType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("owner_id"), objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("quantity_type"), objc_msgSend(v4, "code"));
  MEMORY[0x1BCCAB12C](a2, CFSTR("anchor"), *(_QWORD *)(a1 + 48));
  HDSQLiteBindSecureCodingObjectToProperty();

}

+ (BOOL)setCalculator:(id)a3 forOwner:(id)a4 anchor:(id)a5 transaction:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];

  v27[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "archivedRepresentationWithError:", a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v27[0] = CFSTR("owner_id");
    v27[1] = CFSTR("quantity_type");
    v27[2] = CFSTR("anchor");
    v27[3] = CFSTR("calculator");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "databaseForEntityClass:", a1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __80__HDStatisticsCalculatorEntity_setCalculator_forOwner_anchor_transaction_error___block_invoke;
    v22[3] = &unk_1E6CFD150;
    v23 = v12;
    v24 = v13;
    v25 = v14;
    v26 = v16;
    objc_msgSend(a1, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 1, v18, v17, a7, v22);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = v19 != 0;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __80__HDStatisticsCalculatorEntity_setCalculator_forOwner_anchor_transaction_error___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "quantityType");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  MEMORY[0x1BCCAB114](a2, CFSTR("owner_id"), objc_msgSend(*(id *)(a1 + 40), "persistentID"));
  MEMORY[0x1BCCAB114](a2, CFSTR("quantity_type"), objc_msgSend(v4, "code"));
  MEMORY[0x1BCCAB12C](a2, CFSTR("anchor"), *(_QWORD *)(a1 + 48));
  MEMORY[0x1BCCAB0D8](a2, CFSTR("calculator"), *(_QWORD *)(a1 + 56));

}

+ (BOOL)enumerateStatisticsForOwner:(id)a3 transaction:(id)a4 error:(id *)a5 block:(id)a6
{
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  _QWORD v26[5];

  v26[4] = *MEMORY[0x1E0C80C00];
  v10 = a6;
  v26[0] = CFSTR("quantity_type");
  v26[1] = CFSTR("anchor");
  v26[2] = CFSTR("statistics");
  v26[3] = CFSTR("calculator");
  v11 = (void *)MEMORY[0x1E0C99D20];
  v12 = a4;
  v13 = a3;
  objc_msgSend(v11, "arrayWithObjects:count:", v26, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)MEMORY[0x1E0D29838];
  v16 = (void *)MEMORY[0x1E0CB37E8];
  v17 = objc_msgSend(v13, "persistentID");

  objc_msgSend(v16, "numberWithLongLong:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "predicateWithProperty:equalToValue:", CFSTR("owner_id"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "databaseForEntityClass:", a1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v20, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __84__HDStatisticsCalculatorEntity_enumerateStatisticsForOwner_transaction_error_block___block_invoke;
  v24[3] = &unk_1E6CE91B8;
  v25 = v10;
  v22 = v10;
  LOBYTE(a5) = objc_msgSend(v21, "enumerateProperties:error:enumerationHandler:", v14, a5, v24);

  return (char)a5;
}

uint64_t __84__HDStatisticsCalculatorEntity_enumerateStatisticsForOwner_transaction_error_block___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v6 = HDSQLiteColumnWithNameAsInt64();
  objc_msgSend(MEMORY[0x1E0CB6A70], "_quantityTypeWithCode:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    HDSQLiteColumnWithNameAsNumber();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    HDSQLiteColumnWithNameAsObject();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    HDSQLiteColumnWithNameAsData();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      +[HDStatisticsCollectionCalculator calculatorForArchivedRepresentation:error:](HDStatisticsCollectionCalculator, "calculatorForArchivedRepresentation:error:", v10, a4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v11)
      {
        v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {
      v11 = 0;
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

    v12 = 1;
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 100, CFSTR("Unable to deserialize statistics with improper quantity type code %lld"), v6);
  v12 = 0;
LABEL_9:

  return v12;
}

+ (id)databaseTable
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (Class)ownerEntityClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (id)ownerEntityReferenceColumn
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 0;
}

+ (int64_t)protectionClass
{
  objc_opt_class();
  NSRequestConcreteImplementation();
  return 2;
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 6;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__columnDefinitions_61;
}

+ (id)foreignKeys
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v9 = CFSTR("owner_id");
  v3 = objc_alloc(MEMORY[0x1E0D29858]);
  v4 = objc_msgSend(a1, "ownerEntityClass");
  objc_msgSend(a1, "ownerEntityReferenceColumn");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithEntityClass:property:deletionAction:", v4, v5, 2);
  v10[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("owner_id");
  v3[1] = CFSTR("quantity_type");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
