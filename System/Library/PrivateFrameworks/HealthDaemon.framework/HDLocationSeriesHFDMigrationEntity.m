@implementation HDLocationSeriesHFDMigrationEntity

+ (uint64_t)enumerateAllKeys:(uint64_t)a3 error:(void *)a4 enumerationHandler:
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
  v11[2] = __80__HDLocationSeriesHFDMigrationEntity_enumerateAllKeys_error_enumerationHandler___block_invoke;
  v11[3] = &unk_1E6CEB010;
  v8 = v7;
  v12 = v8;
  v9 = objc_msgSend(v6, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT data_series.hfd_key, samples.start_date, samples.end_date FROM data_series LEFT JOIN samples ON data_series.data_id = samples.data_id WHERE (data_series.hfd_key IS NOT NULL)"), a3, 0, v11);

  return v9;
}

uint64_t __80__HDLocationSeriesHFDMigrationEntity_enumerateAllKeys_error_enumerationHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;

  HDSQLiteColumnAsInt64();
  v4 = MEMORY[0x1BCCAB1A4](a2, 1);
  v5 = MEMORY[0x1BCCAB1A4](a2, 2);
  return (*(uint64_t (**)(double, double))(*(_QWORD *)(a1 + 32) + 16))(v4, v5);
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
  v33[2] = __99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke;
  v33[3] = &__block_descriptor_72_ea8_32c112_ZTSKZ99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error__E3__0_e18_B40__0q8d16d24__32l;
  v33[4] = &v34;
  v33[5] = &v35;
  v33[6] = a3;
  v33[7] = a4;
  v33[8] = &v36;
  v13 = +[HDLocationSeriesHFDMigrationEntity enumerateAllKeys:error:enumerationHandler:]((uint64_t)a1, a5, (uint64_t)a7, v33);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("workoutRouteRecoveredCount"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "longLongValue");
    objc_msgSend(v14, "numberWithLongLong:", v36 + v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v17, CFSTR("workoutRouteRecoveredCount"));

    v18 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("workoutRouteDiscardedCount"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "longLongValue");
    objc_msgSend(v18, "numberWithLongLong:", v35 + v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v21, CFSTR("workoutRouteDiscardedCount"));

    v22 = (void *)MEMORY[0x1E0CB37E8];
    v23 = v34;
    if (v34)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("workoutRouteRecoveredCount"));
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
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v26, CFSTR("workoutRouteMigrationFraction"));

    if (v23)
    v27 = (void *)MEMORY[0x1E0CB37E8];
    v28 = v34;
    if (v34)
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("workoutRouteDiscardedCount"));
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
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v31, CFSTR("workoutRouteDiscardFraction"));

    if (v28)
  }

  return v13;
}

uint64_t __99__HDLocationSeriesHFDMigrationEntity_migrateDataFromDataStore_to_database_recoveryAnalytics_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5)
{
  uint64_t v6;
  char *v7;
  __int128 v8;
  _QWORD *v9;
  uint64_t v10;
  unsigned __int8 v12;
  double v13[3];
  uint64_t v14;
  uint64_t v15;
  _BYTE v16[24];
  _BYTE *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a2;
  ++**(_QWORD **)(a1 + 32);
  v13[0] = a4 + -86400.0;
  v13[1] = a5 + 86400.0;
  v13[2] = *(double *)(a1 + 40);
  v12 = 0;
  v6 = *(_QWORD *)(a1 + 64);
  v7 = (char *)operator new(0x40uLL);
  *(_QWORD *)v7 = &off_1E6D02CD8;
  *((_QWORD *)v7 + 1) = &v15;
  *((_QWORD *)v7 + 2) = &v12;
  v8 = *(_OWORD *)(a1 + 48);
  *(_OWORD *)(v7 + 24) = v8;
  *((_QWORD *)v7 + 5) = v13;
  *((_QWORD *)v7 + 6) = v6;
  *((_QWORD *)v7 + 7) = &v14;
  v17 = v7;
  health::DataStore::performReadTransactionWithLambda(v8, (uint64_t)v16);
  v9 = v17;
  if (v17 == v16)
  {
    v10 = 4;
    v9 = v16;
    goto LABEL_5;
  }
  if (v17)
  {
    v10 = 5;
LABEL_5:
    (*(void (**)(void))(*v9 + 8 * v10))();
  }
  return v12;
}

uint64_t __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke(_QWORD *a1, void *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)a1[4];
  v18 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2;
  v15[3] = &unk_1E6CEB038;
  v17 = a1[6];
  v7 = v5;
  v16 = v7;
  v8 = objc_msgSend(v6, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO location_series_data (series_identifier, timestamp, latitude, longitude, altitude, speed, course, horizontal_accuracy, vertical_accuracy, speed_accuracy, course_accuracy, signal_environment) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), &v18, v15, 0);
  v9 = v18;
  v10 = v9;
  if ((v8 & 1) != 0 || !objc_msgSend(v9, "hd_isConstraintViolation"))
  {
    v12 = v10;
    v13 = v12;
    if (v12)
    {
      if (a3)
        *a3 = objc_retainAutorelease(v12);
      else
        _HKLogDroppedError();
    }

  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v20 = v7;
      v21 = 2112;
      v22 = v10;
      _os_log_error_impl(&dword_1B7802000, v11, OS_LOG_TYPE_ERROR, "[HFDToSQLite] Could not encode HFD location %@ in SQLite (%@); suppressing",
        buf,
        0x16u);
    }
    v8 = 1;
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }

  return v8;
}

uint64_t __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v16;

  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  v4 = *(void **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v4, "clientLocation");
    v5 = v16;
  }
  else
  {
    v5 = 0.0;
  }
  sqlite3_bind_double(a2, 2, v5);
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  sqlite3_bind_double(a2, 3, v6);
  objc_msgSend(*(id *)(a1 + 32), "coordinate");
  sqlite3_bind_double(a2, 4, v7);
  objc_msgSend(*(id *)(a1 + 32), "altitude");
  sqlite3_bind_double(a2, 5, v8);
  objc_msgSend(*(id *)(a1 + 32), "speed");
  sqlite3_bind_double(a2, 6, v9);
  objc_msgSend(*(id *)(a1 + 32), "course");
  sqlite3_bind_double(a2, 7, v10);
  objc_msgSend(*(id *)(a1 + 32), "horizontalAccuracy");
  sqlite3_bind_double(a2, 8, v11);
  objc_msgSend(*(id *)(a1 + 32), "verticalAccuracy");
  sqlite3_bind_double(a2, 9, v12);
  objc_msgSend(*(id *)(a1 + 32), "speedAccuracy");
  sqlite3_bind_double(a2, 10, v13);
  objc_msgSend(*(id *)(a1 + 32), "courseAccuracy");
  sqlite3_bind_double(a2, 11, v14);
  return sqlite3_bind_int(a2, 12, objc_msgSend(*(id *)(a1 + 32), "signalEnvironmentType"));
}

BOOL __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke_199(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  char v7;
  _QWORD *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v21;
  __int16 v22;
  id v23;
  _BYTE v24[24];
  _BYTE *v25;
  _BYTE v26[24];
  _BYTE *v27;
  __int128 buf;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v22 = 0;
  v4 = a1[6];
  v5 = a1[7];
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = v5;
  v6 = operator new(0x30uLL);
  *v6 = &off_1E6D034A8;
  v6[1] = &v22;
  v6[2] = v5;
  v6[3] = a1 + 4;
  v6[4] = &v23;
  v6[5] = (char *)&v22 + 1;
  v27 = v6;
  v7 = health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV1>(v4, (uint64_t)&buf, (uint64_t)v26);
  v8 = v27;
  if (v27 == v26)
  {
    v9 = 4;
    v8 = v26;
  }
  else
  {
    if (!v27)
      goto LABEL_6;
    v9 = 5;
  }
  (*(void (**)(void))(*v8 + 8 * v9))();
LABEL_6:
  LOBYTE(v22) = v7;
  if (HIBYTE(v22))
    v10 = v7;
  else
    v10 = 0;
  if ((v10 & 1) == 0)
  {
    v11 = a1[6];
    v12 = a1[7];
    *(_QWORD *)&buf = 3;
    *((_QWORD *)&buf + 1) = v12;
    v25 = 0;
    v13 = operator new(0x28uLL);
    *v13 = &off_1E6D035A8;
    v13[1] = &v22;
    v13[2] = v12;
    v13[3] = a1 + 4;
    v13[4] = &v23;
    v25 = v13;
    LOBYTE(v22) = health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV2>(v11, (uint64_t)&buf, (uint64_t)v24);
    v14 = v25;
    if (v25 == v24)
    {
      v15 = 4;
      v14 = v24;
      goto LABEL_14;
    }
    if (v25)
    {
      v15 = 5;
LABEL_14:
      (*(void (**)(void))(*v14 + 8 * v15))();
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_FAULT))
    {
      v21 = a1[7];
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v21;
      _os_log_fault_impl(&dword_1B7802000, v16, OS_LOG_TYPE_FAULT, "[HFDToSQLite] Suppressed constraint violations when migrating location series %lld", (uint8_t *)&buf, 0xCu);
    }
  }
  v17 = v23;
  if (v23)
  {
    v18 = v23;
    v19 = v18;
    if (a2)
      *a2 = objc_retainAutorelease(v18);
    else
      _HKLogDroppedError();

  }
  return v17 == 0;
}

+ (BOOL)migrateDataToSQLFromStore:(const void *)a3 database:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  const void *v14;
  id v15;

  v8 = a4;
  if ((objc_msgSend(v8, "executeUncachedSQL:error:", CFSTR("DELETE FROM location_series_data"), a5) & 1) != 0)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __79__HDLocationSeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke;
    v12[3] = &unk_1E6D02CA8;
    v14 = a3;
    v15 = a1;
    v9 = v8;
    v13 = v9;
    if ((+[HDLocationSeriesHFDMigrationEntity enumerateAllKeys:error:enumerationHandler:]((uint64_t)a1, v9, (uint64_t)a5, v12) & 1) != 0)v10 = objc_msgSend(v9, "executeUncachedSQL:error:", CFSTR("UPDATE data_series SET series_location = 2"), a5);
    else
      v10 = 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t __79__HDLocationSeriesHFDMigrationEntity_migrateDataToSQLFromStore_database_error___block_invoke(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  _QWORD aBlock[4];
  id v14;
  uint8_t *v15;
  uint64_t v16;
  uint8_t buf[8];
  uint8_t *v18;
  uint64_t v19;
  char v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(id *)(a1 + 32);
  objc_opt_self();
  *(_QWORD *)buf = 0;
  v18 = buf;
  v19 = 0x2020000000;
  v20 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __90__HDLocationSeriesHFDMigrationEntity__migrateSeriesWithKey_toSQLFromStore_database_error___block_invoke;
  aBlock[3] = &unk_1E6D02C58;
  v6 = v5;
  v15 = buf;
  v16 = a2;
  v14 = v6;
  v12 = _Block_copy(aBlock);
  v7 = v12;
  LOBYTE(a2) = HKWithAutoreleasePool();

  _Block_object_dispose(buf, 8);
  v8 = 0;

  if ((a2 & 1) == 0)
  {
    v9 = v8;
    v10 = v9;
    if (v9)
    {
      if (a3)
      {
        v10 = objc_retainAutorelease(v9);
        *a3 = v10;
      }
      else
      {
        _HKLogDroppedError();
      }
      v8 = v10;
    }
    else
    {
      v8 = 0;
    }

  }
  return 1;
}

+ (void)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
}

+ (__n128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  __n128 result;
  __n128 v6;
  __n128 v7;
  __n128 v8;

  v6 = *a3;
  v7 = a3[1];
  v8 = a3[2];
  +[HDLocationSeriesHFDMigrationEntity migrateDataFromDataStore:to:database:recoveryAnalytics:error:]::$_0::operator() const(long long,double,double,NSError * {__autoreleasing}*)::{lambda(double,long long)#1}::operator()(*(double **)(a1 + 8), **(_QWORD **)(a1 + 16), *a2);
  *a4 = v6;
  a4[1] = v7;
  result = v8;
  a4[2] = v8;
  return result;
}

+ (__int128)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  uint64_t **v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD **v11;
  _QWORD *v12;
  NSObject *v13;
  uint8_t *v14;
  uint64_t v15;
  uint8_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD **v19;
  NSObject *v20;
  uint8_t *v21;
  uint8_t *v22;
  uint64_t v23;
  BOOL v24;
  id v25;
  void *v26;
  uint64_t (***v27)();
  uint64_t v28;
  __int128 *result;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t (**v33)();
  uint64_t v34;
  uint64_t (***v35)();
  __int128 v36;
  uint64_t *v37;
  __int128 *v38;
  id v39[2];
  uint8_t buf[4];
  uint64_t v41;
  __int16 v42;
  uint64_t v43;
  uint8_t *v44;
  char v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v3 = (uint64_t **)(a1 + 8);
  v4 = **(_QWORD **)(a1 + 8);
  v33 = 0;
  v34 = v4;
  v36 = *(_OWORD *)(a2 + 32);
  v37 = (uint64_t *)a2;
  health::bplustree::Tree<health::BlockAccessFile::ReadTransaction::BPlusTreeConfiguration<health::DataStore::ObjectIdentifier,health::BlockPointer>>::valueForKey<health::DataStore::ObjectIdentifier>((uint64_t *)&v36, &v33, 0, buf);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *v3;
  v8 = **v3;
  v9 = *(_QWORD *)(a1 + 40);
  if (!v45)
  {
    *(_QWORD *)&v36 = &off_1E6D03388;
    *((_QWORD *)&v36 + 1) = v9;
    v37 = v7;
    v38 = &v36;
    v18 = *(_QWORD *)(a1 + 48);
    v19 = *(_QWORD ***)(a1 + 56);
    v33 = &off_1E6D03418;
    v34 = v18;
    v35 = &v33;
    v12 = *v19;
    v31 = 3;
    v32 = v8;
    _HKInitializeLogging();
    v20 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218240;
      v41 = 3;
      v42 = 2048;
      v43 = v8;
      _os_log_debug_impl(&dword_1B7802000, v20, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
    }
    v39[0] = 0;
    v44 = 0;
    v21 = (uint8_t *)operator new(0x30uLL);
    *(_QWORD *)v21 = &off_1E6D030A8;
    *((_QWORD *)v21 + 1) = &v36;
    *((_QWORD *)v21 + 2) = v6;
    *((_QWORD *)v21 + 3) = &v31;
    *((_QWORD *)v21 + 4) = &v33;
    *((_QWORD *)v21 + 5) = v39;
    v44 = v21;
    health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV2>(v5, (uint64_t)&v31, (uint64_t)buf);
    v22 = v44;
    if (v44 == buf)
    {
      v23 = 4;
      v22 = buf;
    }
    else
    {
      if (!v44)
        goto LABEL_19;
      v23 = 5;
    }
    (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v22 + 8 * v23))(v22, v15);
LABEL_19:
    v24 = v39[0] == 0;
    if (!v39[0])
      goto LABEL_24;
    v25 = v39[0];
    v26 = v25;
    if (!v12)
      goto LABEL_22;
    goto LABEL_21;
  }
  *(_QWORD *)&v36 = &off_1E6D02F98;
  *((_QWORD *)&v36 + 1) = v9;
  v37 = v7;
  v38 = &v36;
  v10 = *(_QWORD *)(a1 + 48);
  v11 = *(_QWORD ***)(a1 + 56);
  v33 = &off_1E6D03028;
  v34 = v10;
  v35 = &v33;
  v12 = *v11;
  v31 = 0;
  v32 = v8;
  _HKInitializeLogging();
  v13 = *MEMORY[0x1E0CB52B0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v41 = 0;
    v42 = 2048;
    v43 = v8;
    _os_log_debug_impl(&dword_1B7802000, v13, OS_LOG_TYPE_DEBUG, "HFD rebuild: Migrating (%lld, %llu)", buf, 0x16u);
  }
  v39[0] = 0;
  v44 = 0;
  v14 = (uint8_t *)operator new(0x30uLL);
  *(_QWORD *)v14 = &off_1E6D02D48;
  *((_QWORD *)v14 + 1) = &v36;
  *((_QWORD *)v14 + 2) = v6;
  *((_QWORD *)v14 + 3) = &v31;
  *((_QWORD *)v14 + 4) = &v33;
  *((_QWORD *)v14 + 5) = v39;
  v44 = v14;
  health::DataStore::accessSampleHistoryWithIdentifierForReading<LocationHistoryBehaviorV1>(v5, (uint64_t)&v31, (uint64_t)buf);
  v16 = v44;
  if (v44 == buf)
  {
    v17 = 4;
    v16 = buf;
  }
  else
  {
    if (!v44)
      goto LABEL_14;
    v17 = 5;
  }
  (*(void (**)(uint8_t *, uint64_t))(*(_QWORD *)v16 + 8 * v17))(v16, v15);
LABEL_14:
  v24 = v39[0] == 0;
  if (!v39[0])
    goto LABEL_24;
  v25 = v39[0];
  v26 = v25;
  if (!v12)
  {
LABEL_22:
    _HKLogDroppedError();
    goto LABEL_23;
  }
LABEL_21:
  *v12 = objc_retainAutorelease(v25);
LABEL_23:

LABEL_24:
  **(_BYTE **)(a1 + 16) = v24;
  v27 = v35;
  if (v35 == &v33)
  {
    v28 = 4;
    v27 = &v33;
  }
  else
  {
    if (!v35)
      goto LABEL_29;
    v28 = 5;
  }
  ((void (*)(uint64_t (***)(), uint64_t))(*v27)[v28])(v27, v15);
LABEL_29:
  result = v38;
  if (v38 == &v36)
  {
    v30 = 4;
    result = &v36;
  }
  else
  {
    if (!v38)
      return result;
    v30 = 5;
  }
  return (__int128 *)(*(uint64_t (**)(__int128 *, uint64_t))(*(_QWORD *)result + 8 * v30))(result, v15);
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

+ (double)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  NSObject *v4;
  std::runtime_error *exception;
  double *v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (*result > a3 || result[1] < a3)
  {
    v6 = result;
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E0CB52B0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v8 = a2;
      _os_log_impl(&dword_1B7802000, v4, OS_LOG_TYPE_DEFAULT, "Discarding workout route with hfd key %ld for out of range data", buf, 0xCu);
    }
    ++**((_QWORD **)v6 + 2);
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    _ZN6health21data_corruption_errorCI1St13runtime_errorEPKc(exception, "Invalid datum dates.");
  }
  return result;
}

+ (_QWORD)migrateDataFromDataStore:to:database:recoveryAnalytics:error:
{
  _QWORD *result;
  uint64_t v3;

  result = operator new(0x10uLL);
  v3 = *(_QWORD *)(a1 + 8);
  *result = &off_1E6D03418;
  result[1] = v3;
  return result;
}

@end
