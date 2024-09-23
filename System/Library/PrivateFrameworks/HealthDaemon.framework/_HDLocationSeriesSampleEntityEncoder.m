@implementation _HDLocationSeriesSampleEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("frozen");
  v8[1] = CFSTR("count");
  v8[2] = CFSTR("hfd_key");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  HDCodableLocationSeries *v11;
  void *v12;
  void *v13;
  HDCodableLocationSeries *v14;
  _BOOL4 v15;
  HDCodableLocationSeries *v16;
  HDCodableLocationSeries *v17;
  _QWORD v19[4];
  HDCodableLocationSeries *v20;

  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = objc_alloc_init(HDCodableLocationSeries);
    -[HDCodableLocationSeries setSample:](v11, "setSample:", v10);
    -[HDCodableLocationSeries setFrozen:](v11, "setFrozen:", HDSQLiteColumnWithNameAsBoolean());
    HDSQLiteColumnWithNameAsNumber();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HDEntityEncoder transaction](self, "transaction");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __87___HDLocationSeriesSampleEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke;
    v19[3] = &unk_1E6CFD890;
    v14 = v11;
    v20 = v14;
    v15 = -[_HDLocationSeriesSampleEntityEncoder _enumerateCodableSeries:transaction:error:handler:]((uint64_t)self, v12, v13, (uint64_t)a5, v19);

    if (v15)
      v16 = v14;
    else
      v16 = 0;
    v17 = v16;

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)_enumerateCodableSeries:(void *)a3 transaction:(uint64_t)a4 error:(void *)a5 handler:
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _BOOL8 v13;
  _QWORD v15[4];
  id v16;

  v9 = a2;
  v10 = a3;
  v11 = a5;
  if (a1)
  {
    v12 = objc_msgSend(v9, "longLongValue");
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __90___HDLocationSeriesSampleEntityEncoder__enumerateCodableSeries_transaction_error_handler___block_invoke;
    v15[3] = &unk_1E6CFD758;
    v16 = v11;
    v13 = +[HDLocationSeriesDataEntity enumerateSeries:transaction:error:handler:](HDLocationSeriesDataEntity, "enumerateSeries:transaction:error:handler:", v12, v10, a4, v15);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  id *v21;
  id v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v30;
  void *v31;
  void *v33;
  id obj;
  _QWORD v35[4];
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  int64_t v41;
  uint64_t v42;
  char v43;
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  HDCodableLocationSeries *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;

  v12 = a7;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "codableRepresentationForPersistentID:row:error:", a3, a4, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = HDSQLiteColumnWithNameAsBoolean();
    v16 = objc_msgSend(v14, "encodedByteCount");
    HDSQLiteColumnWithNameAsNumber();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v58 = &v57;
    v59 = 0x2020000000;
    v60 = v16;
    v51 = 0;
    v52 = &v51;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__125;
    v55 = __Block_byref_object_dispose__125;
    v56 = objc_alloc_init(HDCodableLocationSeries);
    objc_msgSend((id)v52[5], "setSample:", v14);
    objc_msgSend((id)v52[5], "setFrozen:", v15);
    v45 = 0;
    v46 = &v45;
    v47 = 0x3032000000;
    v48 = __Block_byref_object_copy__125;
    v49 = __Block_byref_object_dispose__125;
    v50 = 0;
    -[HDEntityEncoder transaction](self, "transaction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = 0;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __130___HDLocationSeriesSampleEntityEncoder_generateCodableRepresentationsForPersistentID_row_maxBytesPerRepresentation_error_handler___block_invoke;
    v35[3] = &unk_1E6CFD8B8;
    v38 = &v57;
    v41 = a5;
    v18 = v12;
    v37 = v18;
    v39 = &v51;
    v40 = &v45;
    v43 = v15;
    v36 = v14;
    v42 = v16;
    LOBYTE(v15) = -[_HDLocationSeriesSampleEntityEncoder _enumerateCodableSeries:transaction:error:handler:]((uint64_t)self, v33, v17, (uint64_t)&v44, v35);
    v19 = v44;

    if ((v15 & 1) != 0 || (objc_msgSend(v19, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
    {
      v21 = (id *)(v46 + 5);
      v20 = (void *)v46[5];
      if (!v20)
      {
        v24 = v52[5];
        if (!v24
          || (v25 = v58[3],
              obj = 0,
              v26 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, id *))v18 + 2))(v18, v24, v25, 1, &obj),
              objc_storeStrong(v21, obj),
              !v26))
        {
          v23 = 1;
          goto LABEL_17;
        }
        v27 = (void *)v46[5];
        if (v27)
        {
          v22 = v27;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "hk_errorForInvalidArgument:class:selector:format:", CFSTR("@\"\"), objc_opt_class(), a2, CFSTR("Failed to lookup HFD series for location sample."));
          v30 = objc_claimAutoreleasedReturnValue();
          v31 = (void *)v46[5];
          v46[5] = v30;

          v22 = (id)v46[5];
          if (!v22)
            goto LABEL_16;
        }
        if (!a6)
        {
          _HKLogDroppedError();
          goto LABEL_16;
        }
        v28 = objc_retainAutorelease(v22);
        v22 = v28;
        goto LABEL_15;
      }
      v22 = v20;
      if (!a6)
        goto LABEL_6;
    }
    else
    {
      v22 = v19;
      if (!v22)
        goto LABEL_16;
      if (!a6)
      {
LABEL_6:
        _HKLogDroppedError();
LABEL_16:

        v23 = 0;
LABEL_17:

        _Block_object_dispose(&v45, 8);
        _Block_object_dispose(&v51, 8);

        _Block_object_dispose(&v57, 8);
        goto LABEL_18;
      }
    }
    v28 = objc_retainAutorelease(v22);
LABEL_15:
    *a6 = v28;
    goto LABEL_16;
  }
  v23 = 0;
LABEL_18:

  return v23;
}

- (id)objectForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  int v9;
  void *v10;
  void *v11;
  id v12;

  v9 = HDSQLiteColumnWithName();
  if ((MEMORY[0x1BCCAB204](a4, v9) & 1) != 0)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB6B00], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if (-[_HDLocationSeriesSampleEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v11, a3, a4, a5))
  {
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)applyPropertiesToObject:(id)a3 persistentID:(int64_t)a4 row:(HDSQLiteRow *)a5 error:(id *)a6
{
  id v10;
  void *v11;
  char v12;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((v12 & 1) != 0)
  {
    objc_msgSend(v10, "_setFrozen:", HDSQLiteColumnWithNameAsBoolean());
    objc_msgSend(v10, "_setCount:", HDSQLiteColumnWithNameAsInt64());
  }

  return v12;
}

@end
