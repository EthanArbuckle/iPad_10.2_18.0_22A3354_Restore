@implementation HDSharedSummaryTransactionMetadataEntity

+ (id)databaseTable
{
  return CFSTR("shared_summary_transaction_metadata");
}

+ (const)columnDefinitionsWithCount:(unint64_t *)a3
{
  *a3 = 8;
  return (const $74B29A3897B97E76C443A7D6635F6E34 *)columnDefinitionsWithCount__HDSharedSummaryTransactionMetadataEntityColumnDefinitions;
}

+ (id)foreignKeys
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("transaction_id");
  +[HDHealthEntity defaultForeignKey](HDSharedSummaryTransactionEntity, "defaultForeignKey");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)uniquedColumns
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("transaction_id");
  v3[1] = CFSTR("key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (int64_t)protectionClass
{
  return 2;
}

+ (id)insertWithTransactionID:(int64_t)a3 metadata:(id)a4 databaseTransaction:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t *v23;
  id v24;
  int64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v10 = a4;
  v11 = a5;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__111;
  v30 = __Block_byref_object_dispose__111;
  v31 = 0;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __103__HDSharedSummaryTransactionMetadataEntity_insertWithTransactionID_metadata_databaseTransaction_error___block_invoke;
  v20[3] = &unk_1E6CFB550;
  v24 = a1;
  v25 = a3;
  v13 = v11;
  v21 = v13;
  v23 = &v26;
  v14 = v12;
  v22 = v14;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v20);
  v15 = (id)v27[5];
  v16 = v15;
  if (v15)
  {
    if (a6)
      *a6 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();
  }

  if (v27[5])
    v17 = 0;
  else
    v17 = v14;
  v18 = v17;

  _Block_object_dispose(&v26, 8);
  return v18;
}

void __103__HDSharedSummaryTransactionMetadataEntity_insertWithTransactionID_metadata_databaseTransaction_error___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  void *v32;
  id v33;
  id *v34;
  id obj;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[9];

  v44[7] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 64);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v9 = *(void **)(v7 + 40);
  v8 = (id *)(v7 + 40);
  obj = v9;
  v10 = a2;
  v11 = a3;
  v12 = v6;
  v13 = (void *)objc_opt_self();
  objc_opt_class();
  v33 = v11;
  v34 = v8;
  v32 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v14 = v11;
    v15 = 0;
    v16 = 0;
    v17 = 0;
    v18 = 0;
LABEL_11:
    objc_msgSend(v12, "databaseForEntityClass:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = CFSTR("transaction_id");
    v44[1] = CFSTR("key");
    v44[2] = CFSTR("value_type");
    v44[3] = CFSTR("string_value");
    v44[4] = CFSTR("numerical_value");
    v44[5] = CFSTR("date_value");
    v44[6] = CFSTR("data_value");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 7);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 3221225472;
    v36[2] = __105__HDSharedSummaryTransactionMetadataEntity__insertWithTransactionID_key_value_databaseTransaction_error___block_invoke;
    v36[3] = &unk_1E6CFB578;
    v42 = v5;
    v37 = v32;
    v38 = v14;
    v39 = v15;
    v40 = v16;
    v43 = v18;
    v41 = v17;
    v25 = v17;
    v26 = v16;
    v27 = v15;
    v28 = v14;
    objc_msgSend(v13, "insertOrReplaceEntity:database:properties:error:bindingHandler:", 0, v23, v24, &obj, v36);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v32;
    v11 = v33;
    v8 = v34;
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v11;
    v16 = 0;
    v17 = 0;
    v14 = 0;
    v18 = 1;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v16 = v11;
    v15 = 0;
    v17 = 0;
    v14 = 0;
    v18 = 2;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = v11;
    objc_msgSend(v20, "_unit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "doubleValueForUnit:", v21);
    objc_msgSend(v19, "numberWithDouble:");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v20, "_unit");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "unitString");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    v16 = 0;
    v17 = 0;
    v18 = 3;
    goto LABEL_11;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v17 = v11;
    v15 = 0;
    v16 = 0;
    v14 = 0;
    v18 = 4;
    goto LABEL_11;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &obj, 3, CFSTR("Received invalid metadata value type %@ (%@)"), v11, objc_opt_class());
  v29 = 0;
LABEL_12:

  objc_storeStrong(v8, obj);
  if (v29)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v29);
  else
    *a4 = 1;

}

+ (id)metadataForTransactionID:(int64_t)a3 databaseTransaction:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  _QWORD v21[4];
  id v22;
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v8 = (objc_class *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = objc_alloc_init(v8);
  v11 = (void *)MEMORY[0x1E0D29838];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predicateWithProperty:equalToValue:", CFSTR("transaction_id"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "databaseForEntityClass:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "queryWithDatabase:predicate:", v14, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v23[0] = CFSTR("key");
  v23[1] = CFSTR("value_type");
  v23[2] = CFSTR("string_value");
  v23[3] = CFSTR("numerical_value");
  v23[4] = CFSTR("date_value");
  v23[5] = CFSTR("data_value");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __95__HDSharedSummaryTransactionMetadataEntity_metadataForTransactionID_databaseTransaction_error___block_invoke;
  v21[3] = &unk_1E6CF6008;
  v22 = v10;
  v17 = v10;
  if (objc_msgSend(v15, "enumerateProperties:error:enumerationHandler:", v16, a5, v21))
    v18 = v17;
  else
    v18 = 0;
  v19 = v18;

  return v19;
}

uint64_t __95__HDSharedSummaryTransactionMetadataEntity_metadataForTransactionID_databaseTransaction_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;

  HDSQLiteColumnWithNameAsString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HDSQLiteColumnWithNameAsInt64();
  switch(v7)
  {
    case 0:
      HDSQLiteColumnWithNameAsString();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 1:
      HDSQLiteColumnWithNameAsNumber();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 2:
      HDSQLiteColumnWithNameAsDate();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 3:
      HDSQLiteColumnWithNameAsDouble();
      v10 = v9;
      HDSQLiteColumnWithNameAsString();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)MEMORY[0x1E0CB6A28];
      objc_msgSend(MEMORY[0x1E0CB6CD0], "unitFromString:", v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "quantityWithUnit:doubleValue:", v13, v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v14)
        goto LABEL_6;
      goto LABEL_9;
    case 4:
      HDSQLiteColumnWithNameAsData();
      v8 = objc_claimAutoreleasedReturnValue();
LABEL_8:
      v14 = (void *)v8;
      if (!v8)
        goto LABEL_6;
LABEL_9:
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v6);
      v16 = 1;
      break;
    default:
LABEL_6:
      v15 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "hk_assignError:code:format:", a4, 3, CFSTR("Read invalid metadata type %@ "), v14);
      v16 = 0;
      break;
  }

  return v16;
}

void __105__HDSharedSummaryTransactionMetadataEntity__insertWithTransactionID_key_value_databaseTransaction_error___block_invoke(_QWORD *a1, uint64_t a2)
{
  MEMORY[0x1BCCAB114](a2, CFSTR("transaction_id"), a1[9]);
  MEMORY[0x1BCCAB144](a2, CFSTR("key"), a1[4]);
  MEMORY[0x1BCCAB114](a2, CFSTR("value_type"), a1[10]);
  MEMORY[0x1BCCAB144](a2, CFSTR("string_value"), a1[5]);
  MEMORY[0x1BCCAB12C](a2, CFSTR("numerical_value"), a1[6]);
  MEMORY[0x1BCCAB0E4](a2, CFSTR("date_value"), a1[7]);
  JUMPOUT(0x1BCCAB0D8);
}

@end
