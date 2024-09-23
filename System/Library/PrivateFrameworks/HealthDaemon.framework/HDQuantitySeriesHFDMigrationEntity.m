@implementation HDQuantitySeriesHFDMigrationEntity

+ (uint64_t)_enumerateAllSeriesWithDatabase:(uint64_t)a3 error:(void *)a4 handler:
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;

  v6 = a2;
  v7 = a4;
  objc_opt_self();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __84__HDQuantitySeriesHFDMigrationEntity__enumerateAllSeriesWithDatabase_error_handler___block_invoke;
  v11[3] = &unk_1E6CEB010;
  v8 = v7;
  v12 = v8;
  v9 = objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT quantity_sample_series.hfd_key, samples.start_date, samples.end_date, quantity_sample_series.count FROM quantity_sample_series LEFT JOIN samples ON quantity_sample_series.data_id = samples.data_id WHERE (quantity_sample_series.hfd_key IS NOT NULL)"), a3, 0, v11);

  return v9;
}

uint64_t __84__HDQuantitySeriesHFDMigrationEntity__enumerateAllSeriesWithDatabase_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;

  HDSQLiteColumnAsInt64();
  v4 = MEMORY[0x1BCCAB1A4](a2, 1);
  v5 = MEMORY[0x1BCCAB1A4](a2, 2);
  HDSQLiteColumnAsInt64();
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v4, v5);
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke(_QWORD *a1, double a2, double a3, double a4)
{
  void *v7;
  uint64_t v8;
  char v9;
  uint64_t result;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[8];
  id obj;
  uint8_t buf[4];
  double v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = (void *)a1[4];
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2;
  v14[3] = &__block_descriptor_64_e23_v16__0__sqlite3_stmt__8l;
  v14[4] = a1[7];
  *(double *)&v14[5] = a2;
  *(double *)&v14[6] = a3;
  *(double *)&v14[7] = a4;
  v9 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO quantity_series_data (series_identifier, timestamp, value, duration) VALUES (?, ?, ?, ?)"), &obj, v14, 0);
  objc_storeStrong((id *)(v8 + 40), obj);
  if ((v9 & 1) == 0)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "hd_isConstraintViolation");
    if (!(_DWORD)result)
      return result;
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v17 = a3;
      v18 = 2048;
      v19 = a4;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[HFDToSQLite] Failed to insert quantity series datum (%f, %f); skipping",
        buf,
        0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    v12 = *(_QWORD *)(a1[5] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;

  }
  return 1;
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
  sqlite3_bind_double(a2, 2, *(double *)(a1 + 40));
  sqlite3_bind_double(a2, 3, *(double *)(a1 + 48));
  return sqlite3_bind_double(a2, 4, *(double *)(a1 + 56));
}

uint64_t __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_190(uint64_t a1, __n128 a2, __n128 a3, float a4)
{
  return (*(uint64_t (**)(__n128, __n128, double))(*(_QWORD *)(a1 + 32) + 16))(a2, a3, a4);
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  char v9;
  char v10;
  _QWORD v12[7];
  id v13;
  id v14;

  v14 = a1;
  v8 = a4;
  v13 = v8;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:", CFSTR("DELETE FROM quantity_series_data"), a5) & 1) == 0)
    goto LABEL_4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3321888768;
  v12[2] = __79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke;
  v12[3] = &__block_descriptor_56_ea8_32c92_ZTSKZ79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error__E3__0_e21_B48__0q8d16d24q32__40l;
  v12[4] = a3;
  v12[5] = &v14;
  v12[6] = &v13;
  v9 = +[HDQuantitySeriesHFDMigrationEntity _enumerateAllSeriesWithDatabase:error:handler:]((uint64_t)a1, v8, (uint64_t)a5, v12);
  v8 = v13;
  if ((v9 & 1) != 0)
  {
    v10 = objc_msgSend(v13, "executeUncachedSQL:error:", CFSTR("UPDATE quantity_sample_series SET series_location = 2"), a5);
    v8 = v13;
  }
  else
  {
LABEL_4:
    v10 = 0;
  }

  return v10;
}

uint64_t __79__HDQuantitySeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  uint8_t *v11;
  char v12;
  uint8_t *v13;
  uint64_t v14;
  char v15;
  char v16;
  id v17;
  void *v18;
  uint8_t *v19;
  char v20;
  uint8_t *v21;
  uint64_t v22;
  id v23;
  int v24;
  id v25;
  char v26;
  char v27;
  id v28;
  id v29;
  void *v30;
  NSObject *v31;
  id v32;
  id v33;
  id v34;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, __n128, __n128, float);
  void *v39;
  id v40;
  _QWORD aBlock[4];
  id v42;
  uint8_t *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  char v50;
  id v51;
  char *v52;
  char *v53;
  uint64_t **v54;
  id v55;
  char v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t *v62;
  char v63;
  uint8_t v64[8];
  uint8_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint8_t buf[4];
  uint64_t v71;
  uint8_t *v72;
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(a1 + 32);
  v7 = **(id **)(a1 + 48);
  objc_opt_self();
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  *(_QWORD *)v64 = 0;
  v65 = v64;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__47;
  v68 = __Block_byref_object_dispose__47;
  v69 = 0;
  v8 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke;
  aBlock[3] = &unk_1E6CF0700;
  v9 = v7;
  v42 = v9;
  v43 = v64;
  v44 = &v46;
  v45 = a2;
  v36 = v8;
  v37 = 3221225472;
  v38 = __90__HDQuantitySeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_190;
  v39 = &unk_1E6CF0728;
  v10 = _Block_copy(aBlock);
  v40 = v10;
  v62 = &v36;
  objc_opt_self();
  v60 = 2;
  v61 = a2;
  v58 = 1;
  v59 = a2;
  v57 = 0;
  v56 = 1;
  v52 = &v57;
  v53 = &v56;
  v54 = &v62;
  v55 = 0;
  LOBYTE(v51) = 0;
  v72 = 0;
  v11 = (uint8_t *)operator new(0x20uLL);
  *(_QWORD *)v11 = &off_1E6CF1068;
  *((_QWORD *)v11 + 1) = &v63;
  *((_QWORD *)v11 + 2) = &v51;
  *((_QWORD *)v11 + 3) = &v52;
  v72 = v11;
  v12 = health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV1>(v6, (uint64_t)&v60, (uint64_t)buf);
  v13 = v72;
  if (v72 == buf)
  {
    v14 = 4;
    v13 = buf;
  }
  else
  {
    if (!v72)
      goto LABEL_6;
    v14 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v13 + 8 * v14))();
LABEL_6:
  if ((_BYTE)v51)
    v15 = 1;
  else
    v15 = v12;
  if ((v15 & 1) != 0)
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v55, 1100, CFSTR("unable to access sample history during enumeration for (%lld, %lld)"), v60, v61, v36, v37, v38, v39);
    v16 = 0;
  }
  v17 = v55;
  v18 = v17;
  if ((v16 & 1) != 0 || !v56)
  {
    if ((v16 & 1) != 0)
    {
      v23 = 0;
      v24 = 1;
      v25 = v17;
      goto LABEL_35;
    }
    v25 = v17;
    goto LABEL_29;
  }
  v51 = v17;
  v52 = &v57;
  v53 = &v56;
  v54 = &v62;
  v63 = 0;
  v72 = 0;
  v19 = (uint8_t *)operator new(0x20uLL);
  *(_QWORD *)v19 = &off_1E6CF1168;
  *((_QWORD *)v19 + 1) = &v50;
  *((_QWORD *)v19 + 2) = &v63;
  *((_QWORD *)v19 + 3) = &v52;
  v72 = v19;
  v20 = health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV0>(v6, (uint64_t)&v58, (uint64_t)buf);
  v21 = v72;
  if (v72 == buf)
  {
    v22 = 4;
    v21 = buf;
  }
  else
  {
    if (!v72)
      goto LABEL_22;
    v22 = 5;
  }
  (*(void (**)(void))(*(_QWORD *)v21 + 8 * v22))();
LABEL_22:
  if (v63)
    v26 = 1;
  else
    v26 = v20;
  if ((v26 & 1) != 0)
  {
    v27 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", &v51, 1100, CFSTR("unable to access sample history during enumeration for (%lld, %lld)"), v58, v59);
    v27 = 0;
  }
  v25 = v51;

  if ((v27 & 1) != 0)
    goto LABEL_31;
LABEL_29:
  if (!v57 && (objc_msgSend(v25, "hk_isHealthKitErrorWithCode:", 1100) & 1) != 0)
  {
LABEL_31:
    v23 = 0;
    v24 = 1;
    goto LABEL_35;
  }
  v28 = v25;
  v23 = v28;
  if (v28)
    v29 = objc_retainAutorelease(v28);

  v24 = 0;
  v25 = v23;
LABEL_35:

  v30 = (void *)*((_QWORD *)v65 + 5);
  if (v30)
  {
    v23 = objc_retainAutorelease(v30);
    LOBYTE(v24) = 0;
  }
  else if (v24)
  {
    if (*((_BYTE *)v47 + 24))
    {
      _HKInitializeLogging();
      v31 = *MEMORY[0x1E0CB52B0];
      LOBYTE(v24) = 1;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v71 = a2;
        _os_log_impl(&dword_1B7802000, v31, OS_LOG_TYPE_INFO, "Suppressed constraint violations for migration of quantity series %lld", buf, 0xCu);
      }
    }
    else
    {
      LOBYTE(v24) = 1;
    }
  }

  _Block_object_dispose(v64, 8);
  _Block_object_dispose(&v46, 8);

  v32 = v23;
  if ((v24 & 1) == 0)
  {
    v33 = v32;
    v34 = v33;
    if (v33)
    {
      if (a4)
      {
        v34 = objc_retainAutorelease(v33);
        *a4 = v34;
      }
      else
      {
        _HKLogDroppedError();
      }
      v32 = v34;
    }
    else
    {
      v32 = 0;
    }

  }
  return 1;
}

+ (BOOL)migrateDataFromDataStore:(const void *)a3 to:(void *)a4 database:(id)a5 recoveryAnalytics:(id)a6 error:(id *)a7
{
  id v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  void *v26;
  void *v27;
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  _QWORD v33[9];
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v12 = a6;
  v35 = 0;
  v36 = 0;
  v34 = 0;
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3321888768;
  v33[2] = __99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke;
  v33[3] = &__block_descriptor_72_ea8_32c112_ZTSKZ99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error__E3__1_e21_B48__0q8d16d24q32__40l;
  v33[4] = &v34;
  v33[5] = &v36;
  v33[6] = &v35;
  v33[7] = a3;
  v33[8] = a4;
  v13 = +[HDQuantitySeriesHFDMigrationEntity _enumerateAllSeriesWithDatabase:error:handler:]((uint64_t)a1, a5, (uint64_t)a7, v33);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("quantitySeriesRecoveredCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");
    objc_msgSend(v14, "numberWithLongLong:", v36 + v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("quantitySeriesRecoveredCount"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("quantitySeriesDiscardedCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longLongValue");
    objc_msgSend(v18, "numberWithLongLong:", v35 + v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("quantitySeriesDiscardedCount"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v34;
    if (v34)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("quantitySeriesRecoveredCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v19, "longLongValue");
      v25 = (double)v24 / (double)v34;
    }
    else
    {
      v25 = 1.0;
    }
    objc_msgSend(v22, "numberWithDouble:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("quantitySeriesMigrationFraction"));

    if (v23)
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = v34;
    if (v34)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("quantitySeriesDiscardedCount"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "doubleValue");
      v30 = v29 / (double)v34;
    }
    else
    {
      v30 = 1.0;
    }
    objc_msgSend(v27, "numberWithDouble:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("quantitySeriesDiscardFraction"));

    if (v28)
  }

  return v13;
}

uint64_t __99__HDQuantitySeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, double a5, double a6)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  _QWORD *v15;
  _QWORD *v16;
  uint64_t v17;
  BOOL v18;
  id v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  _QWORD *v30;
  NSObject *v31;
  _QWORD *v32;
  _QWORD *v33;
  uint64_t v34;
  id v35;
  void *v36;
  _QWORD *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  char v43;
  double v44;
  double v45;
  __int16 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD v50[2];
  _BYTE v51[24];
  _BYTE *v52;
  _QWORD v53[3];
  _QWORD *v54;
  _BYTE v55[24];
  _BYTE *v56;
  _BYTE v57[24];
  _BYTE *v58;
  _BYTE v59[24];
  _BYTE *v60;
  id v61;
  _BYTE buf[12];
  __int16 v63;
  uint64_t v64;
  _BYTE *v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  v49 = a2;
  ++**(_QWORD **)(a1 + 32);
  v47 = 0;
  v46 = 0;
  v9 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 48);
  v44 = a6 + 86400.0;
  v45 = a5 + -86400.0;
  v43 = 0;
  v10 = *(_QWORD *)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 64);
  v12 = operator new(0x30uLL);
  *v12 = &off_1E6CF0B38;
  v12[1] = (char *)&v46 + 1;
  v12[2] = &v45;
  v12[3] = &v44;
  v12[4] = &v47;
  v12[5] = &v43;
  v58 = v12;
  v56 = 0;
  v13 = operator new(0x40uLL);
  *v13 = &off_1E6CF0BC8;
  v13[1] = &v47;
  v13[2] = &v48;
  v13[3] = (char *)&v46 + 1;
  v13[4] = v9;
  v13[5] = &v46;
  v13[6] = &v49;
  v13[7] = v8;
  v56 = v13;
  v53[0] = 1;
  v53[1] = a2;
  _HKInitializeLogging();
  v14 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = 1;
    v63 = 2048;
    v64 = a2;
    _os_log_debug_impl(&dword_1B7802000, v14, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
  }
  *(_QWORD *)buf = 0;
  v60 = 0;
  v15 = operator new(0x30uLL);
  *v15 = &off_1E6CF0838;
  v15[1] = v57;
  v15[2] = v11;
  v15[3] = v53;
  v15[4] = v55;
  v15[5] = buf;
  v60 = v15;
  health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV0>(v10, (uint64_t)v53, (uint64_t)v59);
  v16 = v60;
  if (v60 == v59)
  {
    v17 = 4;
    v16 = v59;
  }
  else
  {
    if (!v60)
      goto LABEL_8;
    v17 = 5;
  }
  (*(void (**)(void))(*v16 + 8 * v17))();
LABEL_8:
  v18 = *(_QWORD *)buf == 0;
  if (*(_QWORD *)buf)
  {
    v19 = *(id *)buf;
    v20 = v19;
    if (a4)
      *a4 = objc_retainAutorelease(v19);
    else
      _HKLogDroppedError();

  }
  v21 = v56;
  if (v56 == v55)
  {
    v22 = 4;
    v21 = v55;
  }
  else
  {
    if (!v56)
      goto LABEL_18;
    v22 = 5;
  }
  (*(void (**)(void))(*v21 + 8 * v22))();
LABEL_18:
  v23 = v58;
  if (v58 == v57)
  {
    v24 = 4;
    v23 = v57;
  }
  else
  {
    if (!v58)
      goto LABEL_23;
    v24 = 5;
  }
  (*(void (**)(void))(*v23 + 8 * v24))();
LABEL_23:
  if (!v18)
    return 0;
  if (!v43)
  {
    v26 = *(_QWORD *)(a1 + 56);
    v27 = *(_QWORD *)(a1 + 64);
    v28 = v49;
    v29 = operator new(0x30uLL);
    *v29 = &off_1E6CF0FD8;
    v29[1] = (char *)&v46 + 1;
    v29[2] = &v45;
    v29[3] = &v44;
    v29[4] = &v47;
    v29[5] = &v46;
    v54 = v29;
    v52 = 0;
    v30 = operator new(0x40uLL);
    *v30 = &off_1E6CF0BC8;
    v30[1] = &v47;
    v30[2] = &v48;
    v30[3] = (char *)&v46 + 1;
    v30[4] = v9;
    v30[5] = &v46;
    v30[6] = &v49;
    v30[7] = v8;
    v52 = v30;
    v50[0] = 2;
    v50[1] = v28;
    _HKInitializeLogging();
    v31 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = 2;
      v63 = 2048;
      v64 = v28;
      _os_log_debug_impl(&dword_1B7802000, v31, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
    }
    v61 = 0;
    v65 = 0;
    v32 = operator new(0x30uLL);
    *v32 = &off_1E6CF0CD8;
    v32[1] = v53;
    v32[2] = v27;
    v32[3] = v50;
    v32[4] = v51;
    v32[5] = &v61;
    v65 = v32;
    health::DataStore::accessSampleHistoryWithIdentifierForReading<QuantitySampleValueBehaviorV1>(v26, (uint64_t)v50, (uint64_t)buf);
    v33 = v65;
    if (v65 == buf)
    {
      v34 = 4;
      v33 = buf;
    }
    else
    {
      if (!v65)
        goto LABEL_34;
      v34 = 5;
    }
    (*(void (**)(void))(*v33 + 8 * v34))();
LABEL_34:
    v25 = v61 == 0;
    if (v61)
    {
      v35 = v61;
      v36 = v35;
      if (a4)
        *a4 = objc_retainAutorelease(v35);
      else
        _HKLogDroppedError();

    }
    v37 = v52;
    if (v52 == v51)
    {
      v38 = 4;
      v37 = v51;
    }
    else
    {
      if (!v52)
        goto LABEL_44;
      v38 = 5;
    }
    (*(void (**)(void))(*v37 + 8 * v38))();
LABEL_44:
    v39 = v54;
    if (v54 == v53)
    {
      v40 = 4;
      v39 = v53;
    }
    else
    {
      if (!v54)
        return v25;
      v40 = 5;
    }
    (*(void (**)(void))(*v39 + 8 * v40))();
    return v25;
  }
  return 1;
}

+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
}

+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  __n128 result;
  __int128 v3;

  *(_QWORD *)a2 = &off_1E6CF0FD8;
  result = *(__n128 *)(a1 + 8);
  v3 = *(_OWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 40);
  *(_OWORD *)(a2 + 24) = v3;
  *(__n128 *)(a2 + 8) = result;
  return result;
}

+ (uint64_t)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

+ (void)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
}

+ (__n128)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
  __n128 result;

  *(_QWORD *)a2 = &off_1E6CF11D8;
  result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

+ (uint64_t)enumerateRawDataFromHFDWithStore:(id *)const HFDKey:(health:(NSError * *){__autoreleasing} :(id)const& DataStore:(id)const& :ObjectIdentifier)const& error:handler:
{
  uint64_t (***result)();
  uint64_t v3;
  uint64_t (**v4)();
  __int128 v5;
  uint64_t (***v6)();
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v4 = &off_1E6CF11D8;
  v5 = *(_OWORD *)(a1 + 16);
  v6 = &v4;
  health::DataStore::SampleHistory<QuantitySampleValueBehaviorV0>::enumerateSamples(a2, (uint64_t)&v4);
  result = v6;
  if (v6 == &v4)
  {
    v3 = 4;
    result = &v4;
  }
  else
  {
    if (!v6)
      return result;
    v3 = 5;
  }
  return (uint64_t (***)())(*result)[v3]();
}

+ (uint64_t)enumerateRawDataFromHFDWithStore:(NSError * *){__autoreleasing} HFDKey:(id)const& error:(id)const& handler:
{
  {
    return a1 + 8;
  }
  else
  {
    return 0;
  }
}

@end
