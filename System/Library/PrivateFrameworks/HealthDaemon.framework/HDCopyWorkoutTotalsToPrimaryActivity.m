@implementation HDCopyWorkoutTotalsToPrimaryActivity

uint64_t ___HDCopyWorkoutTotalsToPrimaryActivity_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v4 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HKIndoorWorkout")))
  {
    v6 = a1[4];
LABEL_7:
    *(_QWORD *)(*(_QWORD *)(v6 + 8) + 24) = v4;
    goto LABEL_8;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HKSwimmingLocationType")))
  {
    v6 = a1[5];
    goto LABEL_7;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HKLapLength")))
  {
    v6 = a1[6];
    goto LABEL_7;
  }
LABEL_8:

  return 1;
}

BOOL ___HDCopyWorkoutTotalsToPrimaryActivity_block_invoke_391(_QWORD *a1, uint64_t a2, _QWORD *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  id v19;
  char v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  char v25;
  id v26;
  id v27;
  void *v28;
  char v29;
  id v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  uint64_t v35;
  void *v36;
  char v37;
  _BOOL8 v38;
  __CFString *v39;
  __CFString *v40;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  _QWORD v49[4];
  id v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  uint64_t v54;
  uint64_t v55;
  double v56;
  double v57;
  double v58;
  _QWORD v59[10];
  _QWORD v60[8];
  _QWORD v61[5];
  id v62;
  _QWORD v63[4];
  _QWORD v64[5];

  MEMORY[0x1BCCAB1E0](a2, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = HDSQLiteColumnAsInt64();
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24);
  v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v10 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  v48 = 0;
  v11 = v7;
  v12 = HDSQLiteColumnAsInt64();
  v64[0] = 0;
  v64[1] = v64;
  v64[2] = 0x2020000000;
  v64[3] = 3;
  v63[0] = 0;
  v63[1] = v63;
  v63[2] = 0x2020000000;
  v63[3] = 0;
  v61[0] = 0;
  v61[1] = v61;
  v61[2] = 0x3032000000;
  v61[3] = __Block_byref_object_copy__157;
  v61[4] = __Block_byref_object_dispose__157;
  v62 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v60[0] = MEMORY[0x1E0C809B0];
  v60[1] = 3221225472;
  v60[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_2;
  v60[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v60[4] = v12;
  v60[5] = v8;
  v60[6] = v9;
  v60[7] = v10;
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_3;
  v59[3] = &unk_1E6D027B8;
  v59[4] = v64;
  v59[5] = v63;
  v59[8] = v9;
  v59[9] = v10;
  v59[6] = v61;
  v59[7] = v8;
  if ((objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_HDInsertPrimaryActivityForRowAndMetadata_metadataKey, &v48, &__block_literal_global_189, v60, v59) & 1) != 0)
  {
    MEMORY[0x1BCCAB18C](a2, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = HDSQLiteColumnAsInt64();
    v16 = MEMORY[0x1BCCAB1A4](a2, 3);
    v17 = MEMORY[0x1BCCAB1A4](a2, 4);
    v18 = MEMORY[0x1BCCAB1A4](a2, 5);
    v49[0] = v13;
    v49[1] = 3221225472;
    v49[2] = ___HDInsertPrimaryActivityForRowAndMetadata_block_invoke_5;
    v49[3] = &unk_1E6D02800;
    v19 = v14;
    v54 = v12;
    v55 = v15;
    v50 = v19;
    v51 = v64;
    v52 = v63;
    v53 = v61;
    v56 = v16;
    v57 = v17;
    v58 = v18;
    v20 = objc_msgSend(v11, "executeCachedStatementForKey:error:SQLGenerator:bindingHandler:enumerationHandler:", &_HDInsertPrimaryActivityForRowAndMetadata_insertionKey, &v48, &__block_literal_global_415, v49, 0);
    if ((v20 & 1) != 0)
    {
      objc_msgSend(v11, "lastInsertRowID");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "unsignedLongLongValue");

    }
    else
    {
      v22 = 0;
    }

  }
  else
  {
    v22 = 0;
    v20 = 0;
  }
  _Block_object_dispose(v61, 8);

  _Block_object_dispose(v63, 8);
  _Block_object_dispose(v64, 8);

  v23 = v48;
  if ((v20 & 1) != 0)
  {
    v24 = (void *)a1[4];
    v47 = 0;
    v25 = _HDInsertStatisticsForColumnAndDataType(a2, 6, 10, v22, v24, (uint64_t)&v47, 1.0);
    v26 = v47;
    v27 = v26;
    if ((v25 & 1) != 0)
    {
      v28 = (void *)a1[4];
      v46 = v26;
      v29 = _HDInsertStatisticsForColumnAndDataType(a2, 7, 9, v22, v28, (uint64_t)&v46, 1.0);
      v30 = v46;

      if ((v29 & 1) != 0)
      {
        v31 = (void *)a1[4];
        v45 = v30;
        v32 = _HDInsertStatisticsForColumnAndDataType(a2, 8, 111, v22, v31, (uint64_t)&v45, 1.0);
        v27 = v45;

        if ((v32 & 1) == 0)
        {
          v39 = CFSTR("Failed to insert statistics for swimming strokes");
          goto LABEL_16;
        }
        v33 = (void *)a1[4];
        v44 = v27;
        v34 = _HDInsertStatisticsForColumnAndDataType(a2, 9, 12, v22, v33, (uint64_t)&v44, 1.0);
        v30 = v44;

        if ((v34 & 1) != 0)
        {
          v35 = _HDDistanceTypeCodeForActivityType(v42);
          v36 = (void *)a1[4];
          v43 = v30;
          v37 = _HDInsertStatisticsForColumnAndDataType(a2, 10, v35, v22, v36, (uint64_t)&v43, 1000.0);
          v27 = v43;

          if ((v37 & 1) != 0)
          {
            ++*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 24);
            v38 = 1;
LABEL_19:

            goto LABEL_20;
          }
          v39 = CFSTR("Failed to insert statistics for distance");
LABEL_16:
          v38 = _HDAssignWorkoutDatabaseMigrationError(a3, v39, v27, v6);
          goto LABEL_19;
        }
        v40 = CFSTR("Failed to insert statistics for flights climbed");
      }
      else
      {
        v40 = CFSTR("Failed to insert statistics for basal energy");
      }
      v38 = _HDAssignWorkoutDatabaseMigrationError(a3, v40, v30, v6);
      v27 = v30;
      goto LABEL_19;
    }
    v39 = CFSTR("Failed to insert statistics for active energy");
    goto LABEL_16;
  }
  v38 = _HDAssignWorkoutDatabaseMigrationError(a3, CFSTR("Failed to insert primary activity"), v23, v6);
LABEL_20:

  return v38;
}

@end
