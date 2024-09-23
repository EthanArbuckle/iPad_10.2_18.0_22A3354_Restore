@implementation HDQuantitySampleValueEnumerator

+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v12 = a3;
  v13 = a7;
  objc_msgSend(a4, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __107__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_profile_options_error_handler___block_invoke;
  v18[3] = &unk_1E6CE91E0;
  v21 = a1;
  v22 = a5;
  v19 = v12;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDQuantitySampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v18);

  return (char)a6;
}

uint64_t __107__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_profile_options_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "orderedQuantityValuesBySeriesForPredicate:transaction:options:error:handler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 56), a3, *(_QWORD *)(a1 + 40));
}

+ (BOOL)orderedQuantityValuesBySeriesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  char v25;
  NSObject *v26;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  int64_t v33;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int64_t v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  uint64_t v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v31 = a7;
  v32 = v12;
  v29 = v11;
  v33 = a5;
  +[HDQuantitySampleValueEnumerator _queryForEnumerationWithPredicate:transaction:options:]((uint64_t)a1, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDQuantitySampleValueEnumerator _propertiesForEnumeration]();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v14, "indexOfObject:", *MEMORY[0x1E0D29618]);
  v15 = objc_msgSend(v14, "indexOfObject:", CFSTR("uuid"));
  v16 = objc_msgSend(v14, "indexOfObject:", CFSTR("data_type"));
  v17 = objc_msgSend(v14, "indexOfObject:", CFSTR("quantity"));
  v18 = objc_msgSend(v14, "indexOfObject:", CFSTR("data_provenances.source_id"));
  v19 = objc_msgSend(v14, "indexOfObject:", CFSTR("start_date"));
  v20 = objc_msgSend(v14, "indexOfObject:", CFSTR("end_date"));
  v21 = objc_msgSend(v14, "indexOfObject:", CFSTR("count"));
  v22 = objc_msgSend(v14, "indexOfObject:", CFSTR("hfd_key"));
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke;
  v35[3] = &unk_1E6CFF9A0;
  v39 = v30;
  v40 = v15;
  v41 = v16;
  v42 = v17;
  v43 = v19;
  v44 = v20;
  v45 = v18;
  v46 = v21;
  v47 = v22;
  v48 = v33;
  v23 = v31;
  v37 = v23;
  v24 = v32;
  v36 = v24;
  v38 = &v49;
  v25 = objc_msgSend(v13, "enumerateProperties:error:enumerationHandler:", v14, a6, v35);
  if (v50[3] >= 1)
  {
    _HKInitializeLogging();
    v26 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      v28 = v50[3];
      *(_DWORD *)buf = 134217984;
      v54 = v28;
      _os_log_error_impl(&dword_1B7802000, v26, OS_LOG_TYPE_ERROR, "Skipped %ld missing sample histories during enumeration", buf, 0xCu);
    }
  }

  _Block_object_dispose(&v49, 8);
  return v25;
}

+ (id)_queryForEnumerationWithPredicate:(void *)a3 transaction:(char)a4 options:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v8 = (void *)objc_opt_class();
  objc_msgSend(v7, "databaseForEntityClass:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 4) == 0)
  {
    objc_msgSend(v8, "additionalPredicateForEnumeration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D29890], "compoundPredicateWithPredicate:otherPredicate:", v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v11;
  }
  objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("start_date"), objc_opt_class(), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a4 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0D29888], "orderingTermWithProperty:entityClass:ascending:", CFSTR("uuid"), objc_opt_class(), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "arrayByAddingObject:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v13 = (void *)v15;
  }
  objc_msgSend(v8, "queryWithDatabase:predicate:limit:orderingTerms:groupBy:", v9, v6, 0, v13, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)_propertiesForEnumeration
{
  _QWORD v1[10];

  v1[9] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v1[0] = *MEMORY[0x1E0D29618];
  v1[1] = CFSTR("uuid");
  v1[2] = CFSTR("data_type");
  v1[3] = CFSTR("quantity");
  v1[4] = CFSTR("data_provenances.source_id");
  v1[5] = CFSTR("start_date");
  v1[6] = CFSTR("end_date");
  v1[7] = CFSTR("count");
  v1[8] = CFSTR("hfd_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v1, 9);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  BOOL v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  NSObject *v28;
  uint64_t v30;
  _QWORD v31[4];
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  double v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  _QWORD v45[4];
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  char v59;
  uint8_t buf[4];
  uint64_t v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = HDSQLiteColumnAsInt64();
  v9 = MEMORY[0x1BCCAB180](a3, *(_QWORD *)(a1 + 64));
  v10 = HDSQLiteColumnAsInt64();
  v11 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 80));
  v12 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 88));
  v13 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 96));
  v14 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a3, *(_QWORD *)(a1 + 112)) & 1) != 0)
    v15 = 1;
  else
    v15 = HDSQLiteColumnAsInt64();
  v16 = MEMORY[0x1BCCAB204](a3, *(_QWORD *)(a1 + 120));
  if ((*(_BYTE *)(a1 + 128) & 1) != 0 && !v16)
  {
    v30 = HDSQLiteColumnAsInt64();
    v56 = 0;
    v57 = &v56;
    v58 = 0x2020000000;
    v59 = 0;
    v50 = 0;
    v51 = &v50;
    v52 = 0x3032000000;
    v53 = __Block_byref_object_copy__135;
    v54 = __Block_byref_object_dispose__135;
    v55 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x2020000000;
    v49 = 0;
    v45[0] = 0;
    v45[1] = v45;
    v45[2] = 0x2020000000;
    *(double *)&v45[3] = v12;
    v44 = 0;
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke_185;
    v31[3] = &unk_1E6CFF978;
    v33 = v45;
    v34 = &v56;
    v17 = v7;
    v18 = *(_QWORD *)(a1 + 32);
    v19 = *(id *)(a1 + 40);
    v38 = v10;
    v39 = v9;
    v40 = v12;
    v41 = v13;
    v42 = v14;
    v43 = v15;
    v32 = v19;
    v35 = &v46;
    v36 = &v50;
    v37 = v8;
    v20 = v18;
    v7 = v17;
    v21 = +[HDQuantitySampleSeriesEntity enumerateRawDataWithTransaction:HFDKey:error:handler:](HDQuantitySampleSeriesEntity, "enumerateRawDataWithTransaction:HFDKey:error:handler:", v20, v30, &v44, v31);
    v22 = v44;
    if (v21)
    {
      if (!v47[3])
      {
        _HKInitializeLogging();
        v28 = *MEMORY[0x1E0CB52B0];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134349056;
          v61 = v30;
          _os_log_debug_impl(&dword_1B7802000, v28, OS_LOG_TYPE_DEBUG, "Skipping missing quantity sample history during enumeration: %{public}lld", buf, 0xCu);
        }
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v24 = (*(uint64_t (**)(double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v12, v13, v11, v12, v13);
        goto LABEL_22;
      }
      v23 = v51;
      if (*((_BYTE *)v57 + 24) && !v51[5])
      {
        v24 = 1;
LABEL_22:

        _Block_object_dispose(v45, 8);
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);

        _Block_object_dispose(&v56, 8);
        goto LABEL_23;
      }
    }
    else
    {
      v23 = v51;
    }
    v25 = (void *)v23[5];
    if (v25)
    {
      v26 = v25;
      v27 = v26;
      if (a4)
        *a4 = objc_retainAutorelease(v26);
      else
        _HKLogDroppedError();

    }
    v24 = 0;
    goto LABEL_22;
  }
  v24 = (*(uint64_t (**)(double, double, double, double, double))(*(_QWORD *)(a1 + 40) + 16))(v12, v13, v11, v12, v13);
LABEL_23:

  return v24;
}

uint64_t __111__HDQuantitySampleValueEnumerator_orderedQuantityValuesBySeriesForPredicate_transaction_options_error_handler___block_invoke_185(uint64_t a1, double a2, double a3, float a4, __n128 a5)
{
  double v7;
  double v8;
  uint64_t v9;
  char v10;
  id obj;

  a5.n128_f64[0] = a2;
  if (a4 == -1.0)
    a5.n128_u64[0] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v7 = -0.0;
  if (a4 != -1.0)
    v7 = a4;
  v8 = v7 + a2;
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v9 + 40);
  v10 = (*(uint64_t (**)(double, double, double, __n128, double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 96), *(double *)(a1 + 104), a3, a5, v7 + a2);
  objc_storeStrong((id *)(v9 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
}

+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 profile:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  int64_t v22;

  v12 = a3;
  v13 = a7;
  objc_msgSend(a4, "database");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __99__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_profile_options_error_handler___block_invoke;
  v18[3] = &unk_1E6CE91E0;
  v21 = a1;
  v22 = a5;
  v19 = v12;
  v20 = v13;
  v15 = v13;
  v16 = v12;
  LOBYTE(a6) = +[HDHealthEntity performReadTransactionWithHealthDatabase:error:block:](HDQuantitySampleEntity, "performReadTransactionWithHealthDatabase:error:block:", v14, a6, v18);

  return (char)a6;
}

uint64_t __99__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_profile_options_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 48), "orderedQuantityValuesForPredicate:transaction:options:error:handler:", *(_QWORD *)(a1 + 32), a2, *(_QWORD *)(a1 + 56), a3, *(_QWORD *)(a1 + 40));
}

+ (BOOL)orderedQuantityValuesForPredicate:(id)a3 transaction:(id)a4 options:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  char v8;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  double v24;
  uint64_t v25;
  BOOL v26;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  _QWORD v36[4];
  id v37;
  id v38;
  id v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;

  v8 = a5;
  v11 = a3;
  v32 = a4;
  v34 = a7;
  v28 = v11;
  +[HDQuantitySampleValueEnumerator _queryForEnumerationWithPredicate:transaction:options:]((uint64_t)a1, v11, v32, v8 | 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  +[HDQuantitySampleValueEnumerator _propertiesForEnumeration]();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v12, "indexOfObject:", *MEMORY[0x1E0D29618]);
  v30 = objc_msgSend(v12, "indexOfObject:", CFSTR("uuid"));
  v29 = objc_msgSend(v12, "indexOfObject:", CFSTR("data_type"));
  v13 = objc_msgSend(v12, "indexOfObject:", CFSTR("quantity"));
  v14 = objc_msgSend(v12, "indexOfObject:", CFSTR("data_provenances.source_id"));
  v15 = objc_msgSend(v12, "indexOfObject:", CFSTR("start_date"));
  v16 = objc_msgSend(v12, "indexOfObject:", CFSTR("end_date"));
  v17 = objc_msgSend(v12, "indexOfObject:", CFSTR("count"));
  v18 = objc_msgSend(v12, "indexOfObject:", CFSTR("hfd_key"));
  v19 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke_2;
  v36[3] = &unk_1E6CFFA08;
  v42 = v31;
  v43 = v30;
  v44 = v29;
  v45 = v13;
  v46 = v15;
  v47 = v16;
  v48 = v14;
  v49 = v17;
  v50 = v18;
  v20 = v32;
  v37 = v20;
  v21 = v19;
  v38 = v21;
  v39 = &__block_literal_global_165;
  v51 = a1;
  v22 = v34;
  v40 = v22;
  v41 = &v52;
  if ((objc_msgSend(v33, "enumerateProperties:error:enumerationHandler:", v12, a6, v36) & 1) != 0)
  {
    if (*((_BYTE *)v53 + 24))
    {
      while (1)
      {
        if (!objc_msgSend(v21, "count", v28))
          goto LABEL_10;
        objc_msgSend(v21, "hk_firstSortedObjectWithComparison:", &__block_literal_global_165);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "nextDatumTime");
        v25 = +[HDQuantitySampleValueEnumerator _enumerateWithEnumerator:endTime:error:handler:](v24, (uint64_t)a1, v23, a6, v22);
        if (objc_msgSend(v23, "done"))
          objc_msgSend(v21, "removeObject:", v23);
        if (!v25)
          break;
        if (v25 == 1)
        {
          v26 = 1;
          goto LABEL_13;
        }

      }
      v26 = 0;
LABEL_13:

      goto LABEL_14;
    }
LABEL_10:
    v26 = 1;
  }
  else
  {
    v26 = 0;
  }
LABEL_14:

  _Block_object_dispose(&v52, 8);
  return v26;
}

uint64_t __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

BOOL __103__HDQuantitySampleValueEnumerator_orderedQuantityValuesForPredicate_transaction_options_error_handler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v7;
  uint64_t v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  _BOOL4 v16;
  HDQuantitySampleSeriesDataEnumerator *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;
  id v29;

  v7 = HDSQLiteColumnAsInt64();
  v28 = MEMORY[0x1BCCAB180](a3, *(_QWORD *)(a1 + 80));
  v8 = HDSQLiteColumnAsInt64();
  v9 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 96));
  v10 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 104));
  v11 = MEMORY[0x1BCCAB1A4](a3, *(_QWORD *)(a1 + 112));
  v12 = HDSQLiteColumnAsInt64();
  if ((MEMORY[0x1BCCAB204](a3, *(_QWORD *)(a1 + 128)) & 1) != 0)
    v13 = 1;
  else
    v13 = HDSQLiteColumnAsInt64();
  v14 = MEMORY[0x1BCCAB204](a3, *(_QWORD *)(a1 + 136));
  if ((v14 & 1) != 0)
  {
    v15 = v7;
    v16 = 0;
    while (objc_msgSend(*(id *)(a1 + 40), "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "hk_firstSortedObjectWithComparison:", *(_QWORD *)(a1 + 48));
      v17 = (HDQuantitySampleSeriesDataEnumerator *)objc_claimAutoreleasedReturnValue();
      if (!v14 || (v22 = v10, objc_msgSend(*(id *)(a1 + 40), "count") != 1))
      {
        -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](v17, "nextDatumTime");
        if (v10 >= v23)
          v22 = v23;
        else
          v22 = v10;
      }
      -[HDQuantitySampleSeriesDataEnumerator nextDatumTime](v17, "nextDatumTime");
      if (v22 < v24)
      {

        break;
      }
      v25 = +[HDQuantitySampleValueEnumerator _enumerateWithEnumerator:endTime:error:handler:](v22, *(_QWORD *)(a1 + 144), v17, a4, *(void **)(a1 + 56));
      if (-[HDQuantitySampleSeriesDataEnumerator done](v17, "done"))
        objc_msgSend(*(id *)(a1 + 40), "removeObject:", v17);
      if (v25 <= 1)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
        goto LABEL_27;
      }
LABEL_15:

    }
    if ((v14 | v16) == 1 && *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
    {
      if (v16)
        v27 = 1;
      else
        v27 = v13;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, _QWORD *, double, double, double, double, double))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), v15, v8, v28, v12, v27, 0, a4, v10, v11, v9, v10, v11);
    }
    return *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) != 0;
  }
  else
  {
    v15 = v7;
    v17 = -[HDQuantitySampleSeriesDataEnumerator initWithTransaction:persistentID:dataTypeCode:UUIDBytes:startTime:endTime:count:sourceID:HFDKey:bufferSize:]([HDQuantitySampleSeriesDataEnumerator alloc], "initWithTransaction:persistentID:dataTypeCode:UUIDBytes:startTime:endTime:count:sourceID:HFDKey:bufferSize:", *(_QWORD *)(a1 + 32), v7, v8, v28, v13, v12, v10, v11, HDSQLiteColumnAsInt64(), 119);
    v29 = 0;
    v18 = -[HDQuantitySampleSeriesDataEnumerator primeEnumeratorWithError:](v17, "primeEnumeratorWithError:", &v29);
    v19 = v29;
    v20 = v19;
    if (v18)
    {
      v16 = -[HDQuantitySampleSeriesDataEnumerator done](v17, "done");
      if (!v16)
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v17);

      goto LABEL_15;
    }
    v21 = v19;
    if (v21)
    {
      if (a4)
        *a4 = objc_retainAutorelease(v21);
      else
        _HKLogDroppedError();
    }

LABEL_27:
    return 0;
  }
}

+ (uint64_t)_enumerateWithEnumerator:(void *)a3 endTime:(_QWORD *)a4 error:(void *)a5 handler:
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v8 = a3;
  v9 = a5;
  objc_opt_self();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__135;
  v28 = __Block_byref_object_dispose__135;
  v29 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __82__HDQuantitySampleValueEnumerator__enumerateWithEnumerator_endTime_error_handler___block_invoke;
  v18[3] = &unk_1E6CFFA30;
  v21 = &v34;
  v22 = &v30;
  v10 = v9;
  v20 = v10;
  v11 = v8;
  v19 = v11;
  v23 = &v24;
  v12 = objc_msgSend(v11, "enumerateDataToTime:error:handler:", a4, v18, a1);
  v13 = (void *)v25[5];
  if (!v12)
  {
    if (!v13)
    {
LABEL_11:
      v14 = 0;
      goto LABEL_12;
    }
LABEL_7:
    v15 = v13;
    v16 = v15;
    if (a4)
      *a4 = objc_retainAutorelease(v15);
    else
      _HKLogDroppedError();

    goto LABEL_11;
  }
  if (v13)
    goto LABEL_7;
  if (*((_BYTE *)v35 + 24) && !*((_BYTE *)v31 + 24))
    v14 = 1;
  else
    v14 = 3;
LABEL_12:

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v34, 8);

  return v14;
}

uint64_t __82__HDQuantitySampleValueEnumerator__enumerateWithEnumerator_endTime_error_handler___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id obj;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  v10 = *(_QWORD *)(a1 + 40);
  v11 = objc_msgSend(*(id *)(a1 + 32), "persistentID");
  v12 = objc_msgSend(*(id *)(a1 + 32), "dataTypeCode");
  v13 = objc_msgSend(*(id *)(a1 + 32), "UUIDBytesPtr");
  objc_msgSend(*(id *)(a1 + 32), "startTime");
  v15 = v14;
  objc_msgSend(*(id *)(a1 + 32), "endTime");
  v17 = v16;
  v18 = objc_msgSend(*(id *)(a1 + 32), "sourceID");
  v19 = objc_msgSend(*(id *)(a1 + 32), "count");
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  obj = *(id *)(v20 + 40);
  LOBYTE(a2) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id *, double, double, double, double, double))(v10 + 16))(v10, v11, v12, v13, v18, v19, a2, &obj, v15, v17, a5, a3, a4);
  objc_storeStrong((id *)(v20 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
}

@end
