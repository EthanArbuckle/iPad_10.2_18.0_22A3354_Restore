@implementation _HDQuantitySampleSeriesEntityEncoder

- (id)orderedProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[9];

  v8[8] = *MEMORY[0x1E0C80C00];
  v8[0] = CFSTR("count");
  v8[1] = CFSTR("insertion_era");
  v8[2] = CFSTR("hfd_key");
  v8[3] = CFSTR("min");
  v8[4] = CFSTR("max");
  v8[5] = CFSTR("most_recent");
  v8[6] = CFSTR("most_recent_date");
  v8[7] = CFSTR("most_recent_duration");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orderedProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
    objc_msgSend(MEMORY[0x1E0CB6A70], "dataTypeWithCode:", HDSQLiteColumnAsInt64());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11 = (void *)objc_msgSend(objc_alloc((Class)objc_msgSend(v10, "dataObjectClass")), "_init");
  if (-[_HDQuantitySampleSeriesEntityEncoder applyPropertiesToObject:persistentID:row:error:](self, "applyPropertiesToObject:persistentID:row:error:", v11, a3, a4, a5))
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
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  double v27;
  void *v28;

  v10 = a3;
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "applyPropertiesToObject:persistentID:row:error:", v10, a4, a5, a6);

  if ((v12 & 1) != 0 && (HDSQLiteColumnWithNameIsNull() & 1) == 0)
  {
    objc_msgSend(v10, "_setCount:", HDSQLiteColumnWithNameAsInt64());
    objc_msgSend(v10, "_setFrozen:", HDSQLiteColumnWithNameIsNull());
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = v10;
      objc_msgSend(v13, "quantity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_unit");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      v16 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a5, v16) & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0CB6A28];
        MEMORY[0x1BCCAB1A4](a5, v16);
        objc_msgSend(v17, "quantityWithUnit:doubleValue:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setMinimumQuantity:", v18);

      }
      v19 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a5, v19) & 1) == 0)
      {
        v20 = (void *)MEMORY[0x1E0CB6A28];
        MEMORY[0x1BCCAB1A4](a5, v19);
        objc_msgSend(v20, "quantityWithUnit:doubleValue:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setMaximumQuantity:", v21);

      }
      v22 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a5, v22) & 1) == 0)
      {
        v23 = (void *)MEMORY[0x1E0CB6A28];
        MEMORY[0x1BCCAB1A4](a5, v22);
        objc_msgSend(v23, "quantityWithUnit:doubleValue:", v15);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "_setMostRecentQuantity:", v24);

      }
      HDSQLiteColumnWithNameAsDate();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
      {
        v26 = (int)HDSQLiteColumnWithName();
        v27 = 0.0;
        if ((MEMORY[0x1BCCAB204](a5, v26) & 1) == 0)
          v27 = MEMORY[0x1BCCAB1A4](a5, v26);
        v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:duration:", v25, v27);
        objc_msgSend(v13, "_setMostRecentQuantityDateInterval:", v28);

      }
    }
  }

  return v12;
}

- (id)codableRepresentationForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, double, double, double);
  void *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;

  HDSQLiteColumnWithNameAsNumber();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_HDQuantitySampleSeriesEntityEncoder _codableQuantitySampleForPersistentID:row:error:](self, a3, (uint64_t)a4, (uint64_t)a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "longLongValue");
    v12 = v10;
    v13 = v12;
    if (self)
    {
      v27 = 0;
      v28 = &v27;
      v29 = 0x2020000000;
      v30 = 0;
      -[HDEntityEncoder transaction](self, "transaction");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __78___HDQuantitySampleSeriesEntityEncoder_addSeriesDataForHFDKey_toSample_error___block_invoke;
      v24 = &unk_1E6CFDB70;
      v26 = &v27;
      v15 = v13;
      v25 = v15;
      v16 = +[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", v11, v14, a5, &v21);

      if (v16)
      {
        objc_msgSend(v15, "setCount:", v28[3], v21, v22, v23, v24);
        objc_msgSend(v15, "setFinal:", 1);
        v17 = v15;
      }
      else
      {
        v17 = 0;
      }

      _Block_object_dispose(&v27, 8);
    }
    else
    {

      v17 = 0;
    }
    v18 = v17;
  }
  else
  {
    -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "codableRepresentationForPersistentID:row:error:", a3, a4, a5);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = v18;

  return v19;
}

- (id)_codableQuantitySampleForPersistentID:(uint64_t)a3 row:(uint64_t)a4 error:
{
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  if (a1)
  {
    objc_msgSend(a1, "superclassEncoder");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "codableRepresentationForPersistentID:row:error:", a2, a3, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "setFrozen:", HDSQLiteColumnWithNameIsNull());
      v9 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a3, v9) & 1) == 0)
      {
        MEMORY[0x1BCCAB1A4](a3, v9);
        objc_msgSend(v8, "setMin:");
      }
      v10 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a3, v10) & 1) == 0)
      {
        MEMORY[0x1BCCAB1A4](a3, v10);
        objc_msgSend(v8, "setMax:");
      }
      v11 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a3, v11) & 1) == 0)
      {
        MEMORY[0x1BCCAB1A4](a3, v11);
        objc_msgSend(v8, "setMostRecent:");
      }
      v12 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a3, v12) & 1) == 0)
      {
        MEMORY[0x1BCCAB1A4](a3, v12);
        objc_msgSend(v8, "setMostRecentDate:");
      }
      v13 = (int)HDSQLiteColumnWithName();
      if ((MEMORY[0x1BCCAB204](a3, v13) & 1) == 0)
      {
        MEMORY[0x1BCCAB1A4](a3, v13);
        objc_msgSend(v8, "setMostRecentDuration:");
      }
      v14 = v8;
    }

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (BOOL)generateCodableRepresentationsForPersistentID:(int64_t)a3 row:(HDSQLiteRow *)a4 maxBytesPerRepresentation:(int64_t)a5 error:(id *)a6 handler:(id)a7
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  BOOL v21;
  id v22;
  void *v23;
  id v24;
  _BOOL4 v25;
  id v26;
  id *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  BOOL v33;
  char v34;
  id v35;
  id v36;
  id *v38;
  id v39;
  id v40;
  id obj;
  _QWORD v42[4];
  id v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  _QWORD *v47;
  uint64_t *v48;
  uint64_t *v49;
  int64_t v50;
  uint64_t v51;
  id v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t (*v56)(uint64_t, uint64_t);
  void (*v57)(uint64_t);
  id v58;
  _QWORD v59[3];
  char v60;
  uint64_t v61;
  uint64_t *v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[4];
  id v76;
  id v77[2];

  v12 = a7;
  HDSQLiteColumnWithNameAsNumber();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    -[_HDQuantitySampleSeriesEntityEncoder _codableQuantitySampleForPersistentID:row:error:](self, a3, (uint64_t)a4, (uint64_t)a6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "longLongValue", v14);
    v16 = v14;
    v40 = v12;
    if (!self)
    {
      v34 = 0;
      goto LABEL_24;
    }
    v39 = v16;
    objc_msgSend(v16, "data");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = a6;
    v18 = objc_msgSend(v17, "length");

    -[HDEntityEncoder transaction](self, "transaction");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v77[0] = 0;
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke;
    v75[3] = &unk_1E6CFDB98;
    v20 = v16;
    v76 = v20;
    v21 = +[HDQuantitySeriesDataEntity getRangeAndCountForSeriesIdentifier:transaction:error:handler:](HDQuantitySeriesDataEntity, "getRangeAndCountForSeriesIdentifier:transaction:error:handler:", v15, v19, v77, v75);
    v22 = v77[0];

    if (!v21)
    {
      v35 = v22;
      v26 = v35;
      v16 = v39;
      if (v35)
      {
        if (v38)
          *v38 = objc_retainAutorelease(v35);
        else
          _HKLogDroppedError();
      }

      v34 = 0;
      goto LABEL_23;
    }
    v69 = 0;
    v70 = &v69;
    v71 = 0x3032000000;
    v72 = __Block_byref_object_copy__126;
    v73 = __Block_byref_object_dispose__126;
    v74 = (id)objc_msgSend(v20, "copy");
    v65 = 0;
    v66 = &v65;
    v67 = 0x2020000000;
    v68 = v18;
    v61 = 0;
    v62 = &v61;
    v63 = 0x2020000000;
    v64 = 1;
    v59[0] = 0;
    v59[1] = v59;
    v59[2] = 0x2020000000;
    v60 = 0;
    v53 = 0;
    v54 = &v53;
    v55 = 0x3032000000;
    v56 = __Block_byref_object_copy__126;
    v57 = __Block_byref_object_dispose__126;
    v58 = 0;
    -[HDEntityEncoder transaction](self, "transaction");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = v22;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __127___HDQuantitySampleSeriesEntityEncoder_generateCodableRepresentationsForHFDKey_sample_maxBytesPerRepresentation_error_handler___block_invoke_2;
    v42[3] = &unk_1E6CFDBC0;
    v45 = &v65;
    v46 = &v69;
    v50 = a5;
    v47 = v59;
    v24 = v40;
    v44 = v24;
    v48 = &v53;
    v49 = &v61;
    v43 = v20;
    v51 = v18;
    v25 = +[HDQuantitySeriesDataEntity enumerateSeries:transaction:error:handler:](HDQuantitySeriesDataEntity, "enumerateSeries:transaction:error:handler:", v15, v23, &v52, v42);
    v26 = v52;

    v16 = v39;
    if (v25)
    {
      v27 = v38;
      if (*((_BYTE *)v62 + 24))
      {
        v28 = (void *)v70[5];
        if (!v28)
          goto LABEL_8;
        objc_msgSend(v28, "setFinal:", 1);
        v29 = v70[5];
        v30 = v66[3];
        v31 = (id *)(v54 + 5);
        obj = (id)v54[5];
        v32 = (*((uint64_t (**)(id, uint64_t, uint64_t, uint64_t, id *))v24 + 2))(v24, v29, v30, 1, &obj);
        objc_storeStrong(v31, obj);
        v33 = v32 == 2;
        *((_BYTE *)v62 + 24) = v32 != 2;
        v16 = v39;
        if (!v33)
        {
LABEL_8:
          v34 = 1;
LABEL_20:

          _Block_object_dispose(&v53, 8);
          _Block_object_dispose(v59, 8);
          _Block_object_dispose(&v61, 8);
          _Block_object_dispose(&v65, 8);
          _Block_object_dispose(&v69, 8);

LABEL_23:
LABEL_24:

          goto LABEL_25;
        }
      }
      v36 = (id)v54[5];
      if (v36)
      {
        if (!v38)
        {
          _HKLogDroppedError();
          goto LABEL_19;
        }
        goto LABEL_18;
      }
    }
    else
    {
      v36 = v26;
      v27 = v38;
      if (v36)
      {
        if (v38)
        {
LABEL_18:
          v36 = objc_retainAutorelease(v36);
          *v27 = v36;
          goto LABEL_19;
        }
        _HKLogDroppedError();
      }
    }
LABEL_19:

    v34 = 0;
    goto LABEL_20;
  }
  -[HDEntityEncoder superclassEncoder](self, "superclassEncoder");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v16, "generateCodableRepresentationsForPersistentID:row:maxBytesPerRepresentation:error:handler:", a3, a4, a5, a6, v12);
LABEL_25:

  return v34;
}

@end
