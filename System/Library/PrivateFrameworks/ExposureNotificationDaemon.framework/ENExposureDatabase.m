@implementation ENExposureDatabase

- (ENExposureDatabase)initWithURL:(id)a3
{
  id v5;
  ENExposureDatabase *v6;
  void *v8;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENExposureDatabase.m"), 53, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL != nil"));

  }
  v6 = -[ENExposureDatabase _initWithURL:](self, "_initWithURL:", v5);

  return v6;
}

- (ENExposureDatabase)initWithDirectoryURL:(id)a3
{
  void *v4;
  ENExposureDatabase *v5;

  objc_msgSend(a3, "URLByAppendingPathComponent:", CFSTR("en_exposure.sqlite"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ENExposureDatabase initWithURL:](self, "initWithURL:", v4);

  return v5;
}

- (id)initInMemoryDatabase
{
  return -[ENExposureDatabase _initWithURL:](self, "_initWithURL:", 0);
}

- (id)_initWithURL:(id)a3
{
  id v4;
  ENExposureDatabase *v5;
  uint64_t v6;
  NSURL *databaseURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ENExposureDatabase;
  v5 = -[ENExposureDatabase init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = (NSURL *)v6;

  }
  return v5;
}

- (void)_reportErrorMetric:(unsigned int)a3
{
  void (**errorMetricReporter)(id, _QWORD);

  errorMetricReporter = (void (**)(id, _QWORD))self->_errorMetricReporter;
  if (errorMetricReporter)
    errorMetricReporter[2](errorMetricReporter, *(_QWORD *)&a3);
}

- (void)_reportSQLiteResult:(int)a3
{
  uint64_t v3;

  if (a3 <= 12)
  {
    if (a3 == 1)
    {
      v3 = 4001;
      goto LABEL_8;
    }
    if (a3 != 11)
      return;
    goto LABEL_9;
  }
  if (a3 == 26)
  {
LABEL_9:
    v3 = 4000;
    goto LABEL_8;
  }
  if (a3 == 13)
  {
    v3 = 4002;
LABEL_8:
    -[ENExposureDatabase _reportErrorMetric:](self, "_reportErrorMetric:", v3);
  }
}

- (BOOL)isOpen
{
  return -[ENSQLiteConnection isOpen](self->_connection, "isOpen");
}

- (BOOL)openWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v12;
  void *v13;
  uint64_t v14;

  if (!-[ENExposureDatabase isOpen](self, "isOpen"))
  {
    if (!self->_databaseURL)
    {
LABEL_7:
      v5 = -[ENExposureDatabase _reallyOpenDatabaseWithError:](self, "_reallyOpenDatabaseWithError:", a3);
      if (!v5)
        return v5;
      v14 = 0;
      if (-[ENSQLiteConnection getUserVersion:error:](self->_connection, "getUserVersion:error:", &v14, a3)
        && -[ENExposureDatabase _createOrMigrateSchemaFromVersion:error:](self, "_createOrMigrateSchemaFromVersion:error:", v14, a3))
      {
        if (gLogCategory_ENExposureDatabase <= 30
          && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
        {
          LogPrintF_safe();
        }
        goto LABEL_2;
      }
      -[ENExposureDatabase close](self, "close");
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    v6 = objc_alloc_init(MEMORY[0x1E0CB3618]);
    -[NSURL URLByDeletingLastPathComponent](self->_databaseURL, "URLByDeletingLastPathComponent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a3) & 1) != 0)
    {
      if ((objc_msgSend(v7, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA8], *MEMORY[0x1E0C999E0], a3) & 1) != 0)
      {

        goto LABEL_7;
      }
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        v10 = 4005;
        goto LABEL_25;
      }
      objc_msgSend(v7, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v9;
      LogPrintF_safe();
      v10 = 4005;
    }
    else
    {
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        v10 = 4004;
        goto LABEL_25;
      }
      v8 = objc_opt_class();
      objc_msgSend(v7, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (void *)v8;
      v13 = v9;
      LogPrintF_safe();
      v10 = 4004;
    }

LABEL_25:
    -[ENExposureDatabase _reportErrorMetric:](self, "_reportErrorMetric:", v10, v12, v13);

    goto LABEL_26;
  }
LABEL_2:
  LOBYTE(v5) = 1;
  return v5;
}

- (void)close
{
  ENSQLiteConnection *connection;

  if (-[ENSQLiteConnection isOpen](self->_connection, "isOpen"))
  {
    -[ENSQLiteConnection close](self->_connection, "close");
    if (gLogCategory_ENExposureDatabase <= 30
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  connection = self->_connection;
  self->_connection = 0;

}

- (BOOL)_reallyOpenDatabaseWithError:(id *)a3
{
  ENSQLiteConnection *v5;
  ENSQLiteConnection *connection;
  ENSQLiteConnection *v7;
  ENSQLiteConnection *v8;
  uint64_t v9;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (self->_connection)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ENExposureDatabase.m"), 158, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_connection == nil"));

  }
  if (self->_databaseURL)
  {
    v5 = -[ENSQLiteConnection initWithDatabaseURL:]([ENSQLiteConnection alloc], "initWithDatabaseURL:", self->_databaseURL);
    connection = self->_connection;
    self->_connection = v5;

    -[ENSQLiteConnection setAdditionalOpenFlags:](self->_connection, "setAdditionalOpenFlags:", 0x200000);
  }
  else
  {
    v7 = objc_alloc_init(ENSQLiteConnection);
    v8 = self->_connection;
    self->_connection = v7;

  }
  v9 = -[ENSQLiteConnection openWithError:](self->_connection, "openWithError:", a3);
  if ((_DWORD)v9)
  {
    -[ENExposureDatabase close](self, "close");
    if ((_DWORD)v9 == 23)
    {
      if (gLogCategory_ENExposureDatabase <= 50
        && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
      {
        -[NSURL path](self->_databaseURL, "path");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    else if (gLogCategory_ENExposureDatabase <= 115
           && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      -[NSURL path](self->_databaseURL, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      -[ENExposureDatabase _reportSQLiteResult:](self, "_reportSQLiteResult:", v9, v15, v9);
    }
    else
    {
      -[ENExposureDatabase _reportSQLiteResult:](self, "_reportSQLiteResult:", v9, v13, v16);
    }
  }
  return (_DWORD)v9 == 0;
}

- (BOOL)_checkDatabaseOpenWithError:(id *)a3
{
  BOOL v4;
  BOOL v5;

  v4 = -[ENSQLiteConnection isOpen](self->_connection, "isOpen");
  v5 = v4;
  if (a3 && !v4)
  {
    ENErrorF();
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_createOrMigrateSchemaFromVersion:(int64_t)a3 error:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v12;
  uint64_t v13;
  int64_t v14;
  uint64_t v15;
  ENSQLiteConnection *v16;
  BOOL v17;
  id v18;
  void *v19;
  ENSQLiteConnection *connection;
  int64_t v22;
  void *v23;
  _QWORD v25[6];
  id v26;
  _QWORD v27[19];

  if (a3 == 8)
  {
    LOBYTE(v8) = 1;
    return v8;
  }
  v27[5] = v7;
  v27[6] = v6;
  v27[17] = v4;
  v27[18] = v5;
  if ((unint64_t)(a3 - 9) < 0xFFFFFFFFFFFFFFF9)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      v22 = a3;
      LogPrintF_safe();
    }
    if (-[ENSQLiteConnection truncateWithError:](self->_connection, "truncateWithError:", a4, v22))
    {
      connection = self->_connection;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke;
      v27[3] = &unk_1E87DBA70;
      v27[4] = self;
      LOBYTE(v8) = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a4, v27);
    }
    else
    {
      if (gLogCategory__ENExposureDatabase > 90)
        goto LABEL_32;
      if (gLogCategory__ENExposureDatabase != -1 || (v8 = _LogCategory_Initialize()) != 0)
      {
        LogPrintF_safe();
        goto LABEL_32;
      }
    }
    return v8;
  }
  v12 = 0;
  v13 = MEMORY[0x1E0C809B0];
  while (1)
  {
    v14 = *(_QWORD *)((char *)&unk_1E87DBA90 + v12);
    if (v14 > a3)
      break;
LABEL_15:
    v12 += 16;
    if (v12 == 96)
    {
      LOBYTE(v8) = 1;
      return v8;
    }
  }
  v15 = *(_QWORD *)((char *)&unk_1E87DBA90 + v12 + 8);
  if (gLogCategory_ENExposureDatabase <= 50
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    v22 = v14;
    LogPrintF_safe();
  }
  v16 = self->_connection;
  v25[5] = v15;
  v26 = 0;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke_2;
  v25[3] = &__block_descriptor_48_e32_B24__0__ENSQLiteConnection_8__16l;
  v25[4] = v14;
  v17 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](v16, "performTransactionWithType:error:usingBlock:", 1, &v26, v25, v22);
  v18 = v26;
  v19 = v18;
  if (v17)
  {

    goto LABEL_15;
  }
  if (gLogCategory__ENExposureDatabase <= 90
    && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    v22 = v14;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

  }
  -[ENExposureDatabase _reportErrorMetric:](self, "_reportErrorMetric:", 4003, v22, v23);
  if (a4)
    *a4 = objc_retainAutorelease(v19);

LABEL_32:
  LOBYTE(v8) = 0;
  return v8;
}

uint64_t __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_createSchemaWithConnection:error:", a2, a3);
}

uint64_t __62__ENExposureDatabase__createOrMigrateSchemaFromVersion_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if ((*(unsigned int (**)(void))(a1 + 40))())
    v6 = objc_msgSend(v5, "setUserVersion:error:", *(_QWORD *)(a1 + 32), a3);
  else
    v6 = 0;

  return v6;
}

- (BOOL)_createSchemaWithConnection:(id)a3 error:(id *)a4
{
  id v5;
  BOOL v6;

  v5 = a3;
  if (!objc_msgSend(v5, "executeUncachedSQLStatements:error:", &unk_1E87EDDF0, a4))
  {
LABEL_8:
    v6 = 0;
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "setUserVersion:error:", 8, a4) & 1) == 0)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      objc_opt_class();
      LogPrintF_safe();
    }
    goto LABEL_8;
  }
  v6 = 1;
LABEL_9:

  return v6;
}

- (int64_t)insertMatchedAdvertisements:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ENSQLiteConnection *connection;
  int64_t v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a3;
  v9 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a5))
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __63__ENExposureDatabase_insertMatchedAdvertisements_forKey_error___block_invoke;
    v13[3] = &unk_1E87DBB18;
    v13[4] = self;
    v14 = v9;
    v16 = &v17;
    v15 = v8;
    if (-[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a5, v13))
    {
      v11 = v18[3];
    }
    else
    {
      v11 = 0;
    }

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __63__ENExposureDatabase_insertMatchedAdvertisements_forKey_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  id v23;
  uint64_t v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v23 = 0;
  v24 = -1;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "key");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyData");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_getExistingPersistentTemporaryExposureKey:rowID:keyData:connection:error:", &v23, &v24, v8, v5, a3);
  v10 = v23;

  if ((v9 & 1) == 0)
  {
    if (gLogCategory__ENExposureDatabase > 90
      || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_29;
    }
    goto LABEL_8;
  }
  if (!v10)
  {
    v12 = 1;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
    v11 = (id *)(a1 + 48);
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      goto LABEL_30;
    if ((objc_msgSend(*(id *)(a1 + 32), "_insertPersistentTemporaryExposureKey:connection:error:", *(_QWORD *)(a1 + 40), v5, a3) & 1) != 0)
    {
      v24 = objc_msgSend(v5, "lastInsertedRowID");
      goto LABEL_12;
    }
    if (gLogCategory__ENExposureDatabase > 90
      || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    {
LABEL_29:
      v12 = 0;
      goto LABEL_30;
    }
LABEL_8:
    LogPrintF_safe();
    goto LABEL_29;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_updateExistingPersistentKeyIfNecessary:replacementKey:existingKeyID:connection:error:", v10, *(_QWORD *)(a1 + 40), v24, v5, a3);
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    goto LABEL_29;
  v11 = (id *)(a1 + 48);
  if (!objc_msgSend(*(id *)(a1 + 48), "count"))
  {
    v12 = 1;
    goto LABEL_30;
  }
LABEL_12:
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = *v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        if (!objc_msgSend(*(id *)(a1 + 32), "_insertAdvertisement:keyRowID:connection:error:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v24, v5, a3, (_QWORD)v19))
        {
          v12 = 0;
          goto LABEL_22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
      if (v15)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_22:

LABEL_30:
  return v12;
}

- (BOOL)_insertAdvertisement:(id)a3 keyRowID:(int64_t)a4 connection:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  int64_t v14;

  v9 = a3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__ENExposureDatabase__insertAdvertisement_keyRowID_connection_error___block_invoke;
  v12[3] = &unk_1E87DBB40;
  v13 = v9;
  v14 = a4;
  v10 = v9;
  LOBYTE(a6) = objc_msgSend(a5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO advertisements (rpi, encrypted_aem, timestamp, scan_interval, rssi, max_rssi, saturated, counter, tek_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"), a6, v12, 0);

  return (char)a6;
}

uint64_t __69__ENExposureDatabase__insertAdvertisement_keyRowID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  double v6;

  objc_msgSend(*(id *)(a1 + 32), "rpi");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 1, v4);

  objc_msgSend(*(id *)(a1 + 32), "encryptedAEM");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 2, v5);

  objc_msgSend(*(id *)(a1 + 32), "timestamp");
  sqlite3_bind_int64(a2, 3, (uint64_t)v6);
  sqlite3_bind_int(a2, 4, objc_msgSend(*(id *)(a1 + 32), "scanInterval"));
  sqlite3_bind_int(a2, 5, objc_msgSend(*(id *)(a1 + 32), "typicalRSSI"));
  sqlite3_bind_int(a2, 6, objc_msgSend(*(id *)(a1 + 32), "maxRSSI"));
  sqlite3_bind_int(a2, 7, objc_msgSend(*(id *)(a1 + 32), "saturated"));
  sqlite3_bind_int(a2, 8, objc_msgSend(*(id *)(a1 + 32), "counter"));
  return sqlite3_bind_int64(a2, 9, *(_QWORD *)(a1 + 40));
}

- (BOOL)_getExistingPersistentTemporaryExposureKey:(id *)a3 rowID:(int64_t *)a4 keyData:(id)a5 connection:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  int v16;
  void *v17;
  _QWORD v19[7];
  _QWORD v20[4];
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v12 = a5;
  v13 = a6;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = -1;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__9;
  v26 = __Block_byref_object_dispose__9;
  v27 = 0;
  v14 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke;
  v20[3] = &unk_1E87DBB68;
  v15 = v12;
  v21 = v15;
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke_2;
  v19[3] = &unk_1E87DBB90;
  v19[5] = &v28;
  v19[6] = &v22;
  v19[4] = self;
  v16 = objc_msgSend(v13, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, key, app_bundle_id, region_id, start, period, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type FROM teks WHERE key = ?"), a7, v20, v19);
  if (v16)
  {
    v17 = (void *)v23[5];
    if (v17)
    {
      *a3 = objc_retainAutorelease(v17);
      *a4 = v29[3];
    }
  }

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);

  return v16;
}

void __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  ENSQLiteBindFoundationValue(a2, 1, *(void **)(a1 + 32));
}

uint64_t __96__ENExposureDatabase__getExistingPersistentTemporaryExposureKey_rowID_keyData_connection_error___block_invoke_2(_QWORD *a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  sqlite3_int64 v6;
  sqlite3_int64 v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  sqlite3_int64 v17;
  void *v18;
  void *v19;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = sqlite3_column_int64(a2, 0);
  v19 = (void *)a1[4];
  ENSQLiteColumnAsData(a2, 1);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsString(a2, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsString(a2, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = sqlite3_column_int64(a2, 4);
  v6 = sqlite3_column_int64(a2, 5);
  v7 = sqlite3_column_int64(a2, 6);
  v8 = sqlite3_column_int(a2, 7);
  v9 = sqlite3_column_int(a2, 8);
  v10 = sqlite3_column_int(a2, 9);
  v11 = sqlite3_column_int(a2, 10);
  LODWORD(v16) = sqlite3_column_int(a2, 11);
  objc_msgSend(v19, "_persistentTemporaryExposureKeyWithKeyData:appBundleIdentifier:regionCountryCode:rollingStartNumber:rollingPeriod:daysSinceOnsetOfSymptoms:diagnosisReportType:originalReportType:transmissionRiskLevel:variantOfConcernType:originalVariantOfConcernType:", v18, v4, v5, v17, v6, v7, __PAIR64__(v9, v8), __PAIR64__(v11, v10), v16);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1[6] + 8);
  v14 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v12;

  return 1;
}

- (int64_t)_updateExistingPersistentKeyIfNecessary:(id)a3 replacementKey:(id)a4 existingKeyID:(int64_t)a5 connection:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  int64_t v23;
  uint64_t v24;
  _QWORD v26[5];
  int v27;
  int v28;

  v11 = a6;
  v12 = a4;
  v13 = a3;
  v14 = objc_msgSend(v13, "originalReportType");
  objc_msgSend(v13, "key");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "diagnosisReportType");

  objc_msgSend(v12, "key");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "diagnosisReportType");

  objc_msgSend(v13, "key");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_msgSend(v19, "variantOfConcernType");
  objc_msgSend(v12, "key");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "variantOfConcernType");
  v23 = 4;
  if (v14 && v14 == v16 && !v20)
  {
    v24 = ENCompareDiagnosisReportTypes();
    if (v24 != -1)
    {
      if (v24)
      {
        v23 = 4;
        if (!v22)
          goto LABEL_12;
      }
      else
      {
        v23 = 2;
        if (!v22)
          goto LABEL_12;
      }
    }
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __108__ENExposureDatabase__updateExistingPersistentKeyIfNecessary_replacementKey_existingKeyID_connection_error___block_invoke;
    v26[3] = &__block_descriptor_48_e23_v16__0__sqlite3_stmt__8l;
    v27 = v18;
    v28 = v22;
    v26[4] = a5;
    if (objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("UPDATE teks SET (report_type, variant_of_concern_type) = (?, ?) WHERE ROWID = ?"), a7, v26, 0))v23 = 3;
    else
      v23 = 0;
  }
LABEL_12:

  return v23;
}

uint64_t __108__ENExposureDatabase__updateExistingPersistentKeyIfNecessary_replacementKey_existingKeyID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(unsigned int *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(unsigned int *)(a1 + 44));
  return sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 32));
}

- (id)_persistentTemporaryExposureKeyWithKeyData:(id)a3 appBundleIdentifier:(id)a4 regionCountryCode:(id)a5 rollingStartNumber:(int64_t)a6 rollingPeriod:(int64_t)a7 daysSinceOnsetOfSymptoms:(int64_t)a8 diagnosisReportType:(int)a9 originalReportType:(int)a10 transmissionRiskLevel:(int)a11 variantOfConcernType:(int)a12 originalVariantOfConcernType:(int)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  ENPersistentTemporaryExposureKey *v22;
  void *v23;
  int v24;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  if (v18)
  {
    v21 = objc_alloc_init(MEMORY[0x1E0CAA3D0]);
    objc_msgSend(v21, "setKeyData:", v18);
    objc_msgSend(v21, "setRollingStartNumber:", a6);
    objc_msgSend(v21, "setRollingPeriod:", a7);
    objc_msgSend(v21, "setDaysSinceOnsetOfSymptoms:", a8);
    objc_msgSend(v21, "setDiagnosisReportType:", a9);
    objc_msgSend(v21, "setTransmissionRiskLevel:", a11);
    objc_msgSend(v21, "setVariantOfConcernType:", a12);
    objc_msgSend(v21, "setOriginalVariantOfConcernType:", a13);
    v22 = -[ENPersistentTemporaryExposureKey initWithTemporaryExposureKey:appBundleIdentifier:regionCountryCode:]([ENPersistentTemporaryExposureKey alloc], "initWithTemporaryExposureKey:appBundleIdentifier:regionCountryCode:", v21, v19, v20);
    -[ENPersistentTemporaryExposureKey setOriginalReportType:](v22, "setOriginalReportType:", a10);
    -[ENPersistentTemporaryExposureKey setOriginalVariantOfConcernType:](v22, "setOriginalVariantOfConcernType:", a13);

  }
  else
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "isSensitiveLoggingAllowed");

    if (v24
      && gLogCategory_ENExposureDatabase <= 90
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    v22 = 0;
  }

  return v22;
}

- (BOOL)_insertPersistentTemporaryExposureKey:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __77__ENExposureDatabase__insertPersistentTemporaryExposureKey_connection_error___block_invoke;
  v10[3] = &unk_1E87DBB68;
  v11 = v7;
  v8 = v7;
  LOBYTE(a5) = objc_msgSend(a4, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO teks (app_bundle_id, region_id, key, start, period, end, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"), a5, v10, 0);

  return (char)a5;
}

void __77__ENExposureDatabase__insertPersistentTemporaryExposureKey_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 1, v4);

  objc_msgSend(*(id *)(a1 + 32), "regionCountryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 2, v5);

  objc_msgSend(*(id *)(a1 + 32), "key");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "keyData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 3, v6);

  sqlite3_bind_int64(a2, 4, objc_msgSend(v7, "rollingStartNumber"));
  sqlite3_bind_int64(a2, 5, objc_msgSend(v7, "rollingPeriod"));
  sqlite3_bind_int64(a2, 6, objc_msgSend(v7, "rollingPeriod") + objc_msgSend(v7, "rollingStartNumber"));
  sqlite3_bind_int64(a2, 7, objc_msgSend(v7, "daysSinceOnsetOfSymptoms"));
  sqlite3_bind_int64(a2, 8, objc_msgSend(v7, "diagnosisReportType"));
  sqlite3_bind_int64(a2, 9, objc_msgSend(*(id *)(a1 + 32), "originalReportType"));
  sqlite3_bind_int(a2, 10, objc_msgSend(v7, "transmissionRiskLevel"));
  sqlite3_bind_int64(a2, 11, objc_msgSend(v7, "variantOfConcernType"));
  sqlite3_bind_int64(a2, 12, objc_msgSend(*(id *)(a1 + 32), "originalVariantOfConcernType"));

}

- (BOOL)enumerateMatchedAdvertisementsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  ENSQLiteConnection *connection;
  BOOL v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a3))
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke;
    v10[3] = &unk_1E87DBC00;
    v10[4] = self;
    v11 = v6;
    v8 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 0, a3, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  _QWORD v10[5];
  id v11;
  id v12;

  v5 = a2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke_2;
  v10[3] = &unk_1E87DBBD8;
  v6 = *(void **)(a1 + 40);
  v10[4] = *(_QWORD *)(a1 + 32);
  v11 = v5;
  v12 = v6;
  v7 = v5;
  v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID, key, app_bundle_id, region_id, start, period, onset_days, report_type, original_report_type, transmission_risk, variant_of_concern_type, original_variant_of_concern_type FROM teks"), a3, 0, v10);

  return v8;
}

uint64_t __70__ENExposureDatabase_enumerateMatchedAdvertisementsWithError_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2, uint64_t a3)
{
  sqlite3_int64 v5;
  void *v6;
  void *v7;
  sqlite3_int64 v8;
  sqlite3_int64 v9;
  int v10;
  int v11;
  int v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  uint64_t v24;
  sqlite3_int64 v26;
  void *v27;
  void *v28;
  sqlite3_int64 v29;

  v5 = sqlite3_column_int64(a2, 0);
  v28 = *(void **)(a1 + 32);
  v29 = v5;
  ENSQLiteColumnAsData(a2, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsString(a2, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsString(a2, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = sqlite3_column_int64(a2, 4);
  v8 = sqlite3_column_int64(a2, 5);
  v9 = sqlite3_column_int64(a2, 6);
  v10 = sqlite3_column_int(a2, 7);
  v11 = sqlite3_column_int(a2, 8);
  v12 = sqlite3_column_int(a2, 9);
  v13 = sqlite3_column_int(a2, 10);
  LODWORD(v24) = sqlite3_column_int(a2, 11);
  objc_msgSend(v28, "_persistentTemporaryExposureKeyWithKeyData:appBundleIdentifier:regionCountryCode:rollingStartNumber:rollingPeriod:daysSinceOnsetOfSymptoms:diagnosisReportType:originalReportType:transmissionRiskLevel:variantOfConcernType:originalVariantOfConcernType:", v27, v6, v7, v26, v8, v9, __PAIR64__(v11, v10), __PAIR64__(v13, v12), v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "_advertisementsForTemporaryExposureKeyRowID:connection:error:", v29, *(_QWORD *)(a1 + 40), a3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "count"))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
LABEL_22:

        goto LABEL_23;
      }
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isSensitiveLoggingAllowed");

      if (!v22
        || gLogCategory_ENExposureDatabase > 90
        || gLogCategory_ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    else
    {
      +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "isSensitiveLoggingAllowed");

      if (!v20
        || gLogCategory_ENExposureDatabase > 90
        || gLogCategory_ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_22;
      }
    }
    LogPrintF_safe();
    goto LABEL_22;
  }
  +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isSensitiveLoggingAllowed");

  if (v18
    && gLogCategory_ENExposureDatabase <= 90
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
LABEL_23:

  return 1;
}

- (id)advertisementCountsByTemporaryKeyDatasWithError:(id *)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v5 = objc_alloc_init(MEMORY[0x1E0C99E00]);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __70__ENExposureDatabase_advertisementCountsByTemporaryKeyDatasWithError___block_invoke;
  v10[3] = &unk_1E87DBC28;
  v11 = v5;
  v6 = v5;
  if (-[ENExposureDatabase enumerateMatchedAdvertisementsWithError:handler:](self, "enumerateMatchedAdvertisementsWithError:handler:", a3, v10))
  {
    v7 = v6;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8;
}

void __70__ENExposureDatabase_advertisementCountsByTemporaryKeyDatasWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)MEMORY[0x1E0CB37E0];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v6, "key");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "keyData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v9);

}

- (id)_advertisementsForTemporaryExposureKeyRowID:(int64_t)a3 connection:(id)a4 error:(id *)a5
{
  objc_class *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  v8 = (objc_class *)MEMORY[0x1E0C99DE0];
  v9 = a4;
  v15 = objc_alloc_init(v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke;
  v16[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
  v16[4] = a3;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke_2;
  v14[3] = &unk_1E87DBC70;
  v14[4] = self;
  v10 = v15;
  LODWORD(a5) = objc_msgSend(v9, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT rpi, encrypted_aem, timestamp, scan_interval, rssi, max_rssi, saturated, counter FROM advertisements WHERE tek_id = ?"), a5, v16, v14);

  if ((_DWORD)a5)
    v11 = v10;
  else
    v11 = 0;
  v12 = v11;

  return v12;
}

uint64_t __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

uint64_t __83__ENExposureDatabase__advertisementsForTemporaryExposureKeyRowID_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_int64 v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v13;
  int v14;

  v4 = sqlite3_column_int64(a2, 2);
  v5 = *(void **)(a1 + 32);
  ENSQLiteColumnAsData(a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsData(a2, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = sqlite3_column_int(a2, 3);
  v9 = sqlite3_column_int(a2, 4);
  v10 = sqlite3_column_int(a2, 5);
  v11 = sqlite3_column_int(a2, 6);
  objc_msgSend(v5, "_advertisementWithRPIData:encryptedAEMData:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:", v6, v7, v4, v8, v9, v10, __PAIR64__(sqlite3_column_int(a2, 7), v11));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v12);
  }
  else
  {
    +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isSensitiveLoggingAllowed");

    if (v14
      && gLogCategory_ENExposureDatabase <= 90
      && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }

  return 1;
}

- (id)_advertisementWithRPIData:(id)a3 encryptedAEMData:(id)a4 timestamp:(int64_t)a5 scanInterval:(int)a6 typicalRSSI:(int)a7 maxRSSI:(int)a8 saturated:(int)a9 counter:(int)a10
{
  char v10;
  char v11;
  unsigned __int16 v12;
  id v15;
  id v16;
  id v17;
  ENAdvertisement *v18;
  ENAdvertisement *v19;
  ENAdvertisement *v20;
  void *v21;
  uint64_t v23;

  v10 = a8;
  v11 = a7;
  v12 = a6;
  v15 = a3;
  v16 = a4;
  v17 = v15;
  if (v17)
  {
    v18 = [ENAdvertisement alloc];
    v19 = v18;
    if (v16)
    {
      LOBYTE(v23) = a10;
      v20 = -[ENAdvertisement initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:](v18, "initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:", v17, v16, v12, v11, v10, a9 != 0, (double)a5, v23);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D58], "data");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v23) = a10;
      v20 = -[ENAdvertisement initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:](v19, "initWithRPI:encryptedAEM:timestamp:scanInterval:typicalRSSI:maxRSSI:saturated:counter:", v17, v21, v12, v11, v10, a9 != 0, (double)a5, v23);

    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (BOOL)getAdvertisementCount:(unsigned int *)a3 error:(id *)a4
{
  ENSQLiteConnection *connection;
  BOOL v8;
  char v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  if (!-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a4))
    return 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  connection = self->_connection;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__ENExposureDatabase_getAdvertisementCount_error___block_invoke;
  v11[3] = &unk_1E87DBC98;
  v11[4] = &v12;
  v8 = -[ENSQLiteConnection executeSQL:error:bindingHandler:enumerationHandler:](connection, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM advertisements"), a4, 0, v11);
  v9 = !v8;
  if (!a3)
    v9 = 1;
  if ((v9 & 1) == 0)
    *a3 = *((_DWORD *)v13 + 6);
  _Block_object_dispose(&v12, 8);
  return v8;
}

uint64_t __50__ENExposureDatabase_getAdvertisementCount_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  return 1;
}

- (BOOL)upsertExposureDetectionHistorySession:(id)a3 error:(id *)a4
{
  id v6;
  ENSQLiteConnection *connection;
  BOOL v8;
  _QWORD v10[5];
  id v11;

  v6 = a3;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a4))
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __66__ENExposureDatabase_upsertExposureDetectionHistorySession_error___block_invoke;
    v10[3] = &unk_1E87DBCC0;
    v10[4] = self;
    v11 = v6;
    v8 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a4, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __66__ENExposureDatabase_upsertExposureDetectionHistorySession_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_insertOrUpdateExposureDetectionHistorySession:connection:error:", *(_QWORD *)(a1 + 40), a2, a3);
}

- (BOOL)_insertOrUpdateExposureDetectionHistorySession:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;

  v7 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __86__ENExposureDatabase__insertOrUpdateExposureDetectionHistorySession_connection_error___block_invoke;
  v10[3] = &unk_1E87DBB68;
  v11 = v7;
  v8 = v7;
  LOBYTE(a5) = objc_msgSend(a4, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO session_history (uuid, date, app_bundle_id, region_cc, region_sc, file_count, match_count, build, exp_class) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?) ON CONFLICT(uuid) DO UPDATE SET date=excluded.date, app_bundle_id=excluded.app_bundle_id, region_cc=excluded.region_cc, region_sc=excluded.region_sc, file_count=excluded.file_count, match_count=excluded.match_count, build=excluded.build, exp_class=excluded.exp_class"), a5, v10, 0);

  return (char)a5;
}

void __86__ENExposureDatabase__insertOrUpdateExposureDetectionHistorySession_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 1, v4);

  objc_msgSend(*(id *)(a1 + 32), "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 2, v5);

  objc_msgSend(*(id *)(a1 + 32), "appBundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 3, v6);

  objc_msgSend(*(id *)(a1 + 32), "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "countryCode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 4, v8);

  objc_msgSend(*(id *)(a1 + 32), "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subdivisionCode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 5, v10);

  sqlite3_bind_int64(a2, 6, objc_msgSend(*(id *)(a1 + 32), "fileCount"));
  sqlite3_bind_int64(a2, 7, objc_msgSend(*(id *)(a1 + 32), "matchCount"));
  objc_msgSend(*(id *)(a1 + 32), "systemBuildVersion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 8, v11);

  objc_msgSend(*(id *)(a1 + 32), "exposureClassificationIdentifier");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 9, v12);

}

- (id)_sessionIDForUUID:(id)a3 connection:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v7 = a3;
  v8 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  v9 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke;
  v15[3] = &unk_1E87DBB68;
  v10 = v7;
  v16 = v10;
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke_2;
  v14[3] = &unk_1E87DBC98;
  v14[4] = &v17;
  if (!objc_msgSend(v8, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM session_history WHERE uuid=?"), a5, v15, v14))
  {
    v11 = 0;
    goto LABEL_6;
  }
  v11 = (void *)v18[5];
  if (v11)
  {
LABEL_6:
    v12 = v11;
    goto LABEL_7;
  }
  if (a5)
  {
    ENErrorF();
    v12 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
LABEL_7:

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  ENSQLiteBindFoundationValue(a2, 1, *(void **)(a1 + 32));
}

uint64_t __57__ENExposureDatabase__sessionIDForUUID_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithLongLong:", sqlite3_column_int64(a2, 0));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return 1;
}

- (BOOL)enumerateExposureDetectionHistorySessionsWithError:(id *)a3 handler:(id)a4
{
  id v6;
  ENSQLiteConnection *connection;
  BOOL v8;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a3))
  {
    connection = self->_connection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __81__ENExposureDatabase_enumerateExposureDetectionHistorySessionsWithError_handler___block_invoke;
    v10[3] = &unk_1E87DBCE8;
    v11 = v6;
    v8 = -[ENSQLiteConnection executeSQL:error:bindingHandler:enumerationHandler:](connection, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT uuid, date, app_bundle_id, region_cc, region_sc, file_count, match_count, build, exp_class FROM session_history ORDER BY date DESC"), a3, 0, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

BOOL __81__ENExposureDatabase_enumerateExposureDetectionHistorySessionsWithError_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v16;

  ENSQLiteColumnAsUUID(a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 1;
  ENSQLiteColumnAsDate(a2, 1);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v4 && v6)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA328]), "initWithUUID:", v4);
    objc_msgSend(v8, "setDate:", v7);
    ENSQLiteColumnAsString(a2, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAppBundleIdentifier:", v9);

    ENSQLiteColumnAsString(a2, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ENSQLiteColumnAsString(a2, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:subdivisionCode:", v10, v11);
      objc_msgSend(v8, "setRegion:", v12);

    }
    objc_msgSend(v8, "setFileCount:", sqlite3_column_int64(a2, 5));
    objc_msgSend(v8, "setMatchCount:", sqlite3_column_int64(a2, 6));
    ENSQLiteColumnAsString(a2, 7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setSystemBuildVersion:", v13);

    ENSQLiteColumnAsString(a2, 8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setExposureClassificationIdentifier:", v14);

    v16 = 0;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v5 = v16 == 0;

  }
  return v5;
}

- (BOOL)insertExposureDetectionFile:(id)a3 session:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  ENSQLiteConnection *connection;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a5))
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__ENExposureDatabase_insertExposureDetectionFile_session_error___block_invoke;
    v13[3] = &unk_1E87DBD10;
    v13[4] = self;
    v14 = v9;
    v15 = v8;
    v11 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a5, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __64__ENExposureDatabase_insertExposureDetectionFile_session_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v5 = a2;
  v6 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sessionIDForUUID:connection:error:", v7, v5, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = objc_msgSend(*(id *)(a1 + 32), "_insertExposureDetectionFile:sessionID:connection:error:", *(_QWORD *)(a1 + 48), v8, v5, a3);
  else
    v9 = 0;

  return v9;
}

- (BOOL)_insertExposureDetectionFile:(id)a3 sessionID:(id)a4 connection:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  uint64_t v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  objc_msgSend(v9, "metadata");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = 1;
  while (v12 && (v14 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB38B8], "dataWithPropertyList:format:options:error:", v12, 200, 0, a6);
    v15 = objc_claimAutoreleasedReturnValue();

    v14 = 0;
    v13 = (void *)v15;
    if (!v15)
      goto LABEL_7;
  }

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __78__ENExposureDatabase__insertExposureDetectionFile_sessionID_connection_error___block_invoke;
  v17[3] = &unk_1E87DBD38;
  v18 = v9;
  v19 = v10;
  v20 = v13;
  v12 = v13;
  v14 = objc_msgSend(v11, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO file_history (hash, date, session_id, key_count, match_count, app_bundle_id, region_cc, region_sc, metadata) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)"), a6, v17, 0);

LABEL_7:
  return v14;
}

void __78__ENExposureDatabase__insertExposureDetectionFile_sessionID_connection_error___block_invoke(id *a1, sqlite3_stmt *a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  objc_msgSend(a1[4], "fileHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 1, v4);

  objc_msgSend(a1[4], "processDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 2, v5);

  sqlite3_bind_int64(a2, 3, objc_msgSend(a1[5], "longLongValue"));
  objc_msgSend(a1[4], "keyCount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_int64(a2, 4, objc_msgSend(v6, "longLongValue"));

  objc_msgSend(a1[4], "matchCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1[4], "matchCount");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_int64(a2, 5, objc_msgSend(v8, "longLongValue"));

  }
  else
  {
    sqlite3_bind_null(a2, 5);
  }
  objc_msgSend(a1[4], "sourceAppBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 6, v9);

  objc_msgSend(a1[4], "sourceRegion");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "countryCode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 7, v11);

  objc_msgSend(a1[4], "sourceRegion");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subdivisionCode");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteBindFoundationValue(a2, 8, v13);

  ENSQLiteBindFoundationValue(a2, 9, a1[6]);
}

- (BOOL)enumerateExposureDetectionHistoryFilesForSessionUUID:(id)a3 error:(id *)a4 handler:(id)a5
{
  id v8;
  id v9;
  ENSQLiteConnection *connection;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  id v15;

  v8 = a3;
  v9 = a5;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a4))
  {
    connection = self->_connection;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke;
    v13[3] = &unk_1E87DBD60;
    v13[4] = self;
    v14 = v8;
    v15 = v9;
    v11 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a4, v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  _QWORD v12[5];

  objc_msgSend(*(id *)(a1 + 32), "_sessionIDForUUID:connection:error:", *(_QWORD *)(a1 + 40), a2, a3);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_2;
    v12[3] = &unk_1E87DBB68;
    v12[4] = v5;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_3;
    v10[3] = &unk_1E87DBCE8;
    v11 = *(id *)(a1 + 48);
    v8 = objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT hash, date, key_count, match_count, app_bundle_id, region_cc, region_sc, metadata FROM file_history WHERE session_id=? ORDER BY date DESC"), a3, v12, v10);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, objc_msgSend(*(id *)(a1 + 32), "longLongValue"));
}

uint64_t __89__ENExposureDatabase_enumerateExposureDetectionHistoryFilesForSessionUUID_error_handler___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v18;

  ENSQLiteColumnAsData(a2, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ENSQLiteColumnAsDate(a2, 1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v4 && v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CAA320]);
    objc_msgSend(v7, "setFileHash:", v4);
    objc_msgSend(v7, "setProcessDate:", v6);
    objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithLongLong:", sqlite3_column_int64(a2, 2));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setKeyCount:", v8);

    if (sqlite3_column_type(a2, 3) != 5)
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithLongLong:", sqlite3_column_int64(a2, 3));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setMatchCount:", v9);

    }
    ENSQLiteColumnAsString(a2, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourceAppBundleIdentifier:", v10);

    ENSQLiteColumnAsString(a2, 5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    ENSQLiteColumnAsString(a2, 6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAA378]), "initWithCountryCode:subdivisionCode:", v11, v12);
      objc_msgSend(v7, "setSourceRegion:", v13);

    }
    ENSQLiteColumnAsData(a2, 7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v14)
      goto LABEL_21;
    v18 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B8], "propertyListWithData:options:format:error:", v14, 0, 0, &v18);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v18;
    if (v15)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v7, "setMetadata:", v15);
LABEL_20:

LABEL_21:
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));

        goto LABEL_22;
      }
      if (gLogCategory__ENExposureDatabase > 90
        || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
      {
        goto LABEL_20;
      }
    }
    else if (gLogCategory__ENExposureDatabase > 90
           || gLogCategory__ENExposureDatabase == -1 && !_LogCategory_Initialize())
    {
      goto LABEL_20;
    }
    LogPrintF_safe();
    goto LABEL_20;
  }
LABEL_22:

  return 1;
}

- (BOOL)deleteExposureDetectionHistoryWithError:(id *)a3
{
  BOOL v5;
  ENSQLiteConnection *connection;
  BOOL v7;
  id v8;
  id v10;

  if (!-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:"))
    return 0;
  v5 = -[ENSQLiteConnection executeUncachedSQL:error:](self->_connection, "executeUncachedSQL:error:", CFSTR("DELETE FROM session_history"), a3);
  connection = self->_connection;
  v10 = 0;
  v7 = -[ENSQLiteConnection executeUncachedSQL:error:](connection, "executeUncachedSQL:error:", CFSTR("PRAGMA wal_checkpoint(TRUNCATE)"), &v10);
  v8 = v10;
  if (!v7
    && gLogCategory__ENExposureDatabase <= 90
    && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }

  return v5;
}

- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 error:(id *)a6
{
  id v10;
  ENSQLiteConnection *connection;
  BOOL v12;
  char v13;
  _QWORD v15[5];
  id v16;
  uint64_t *v17;
  Class v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v10 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a6))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__9;
    v23 = __Block_byref_object_dispose__9;
    v24 = 0;
    connection = self->_connection;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __52__ENExposureDatabase_getValue_forKey_ofClass_error___block_invoke;
    v15[3] = &unk_1E87DBD88;
    v15[4] = self;
    v17 = &v19;
    v16 = v10;
    v18 = a5;
    v12 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 0, a6, v15);
    v13 = !v12;
    if (!a3)
      v13 = 1;
    if ((v13 & 1) == 0)
      *a3 = objc_retainAutorelease((id)v20[5]);

    _Block_object_dispose(&v19, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __52__ENExposureDatabase_getValue_forKey_ofClass_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id obj;

  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v5 = objc_msgSend(*(id *)(a1 + 32), "getValue:forKey:ofClass:connection:error:", &obj, *(_QWORD *)(a1 + 40), v3, a2, a3);
  objc_storeStrong((id *)(v4 + 40), obj);
  return v5;
}

- (BOOL)getValue:(id *)a3 forKey:(id)a4 ofClass:(Class)a5 connection:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  _BOOL4 v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  objc_class *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v11 = a4;
  v12 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__9;
  v40 = __Block_byref_object_dispose__9;
  v41 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 3;
  v13 = MEMORY[0x1E0C809B0];
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke;
  v30[3] = &unk_1E87DBB68;
  v14 = v11;
  v31 = v14;
  v29[0] = v13;
  v29[1] = 3221225472;
  v29[2] = __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke_2;
  v29[3] = &unk_1E87DBDB0;
  v29[4] = &v32;
  v29[5] = &v36;
  if ((objc_msgSend(v12, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT type, value FROM kvs WHERE key LIKE ?"), a7, v30, v29) & 1) != 0)
  {
    if (v37[5])
    {
      v15 = (void *)MEMORY[0x1D17A7CB8]();
      v16 = v33[3];
      if (v16 == 1)
      {
        v19 = (id)v37[5];
        v28 = 0;
        objc_msgSend(MEMORY[0x1E0CB3708], "unarchivedObjectOfClass:fromData:error:", a5, v19, &v28);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v28;
      }
      else
      {
        if (v16 != 2)
        {
          if (v16 != 3 || (objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = 0;
            v18 = 1;
            goto LABEL_14;
          }
          v25 = (objc_class *)objc_opt_class();
          NSStringFromClass(v25);
          v19 = (id)objc_claimAutoreleasedReturnValue();
          NSStringFromClass(a5);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          ENErrorF();
          v17 = (id)objc_claimAutoreleasedReturnValue();

          v18 = 0;
LABEL_13:

LABEL_14:
          objc_autoreleasePoolPop(v15);
          if (v18)
          {
            v23 = (void *)v37[5];
            a7 = a3;
          }
          else
          {
            v23 = v17;
            if (!a7)
            {
LABEL_18:

              goto LABEL_19;
            }
          }
          *a7 = objc_retainAutorelease(v23);
          goto LABEL_18;
        }
        v19 = (id)v37[5];
        v27 = 0;
        objc_msgSend(MEMORY[0x1E0CB38B8], "propertyListWithData:options:format:error:", v19, 0, 0, &v27);
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = v27;
      }
      v17 = v21;
      v22 = (void *)v37[5];
      v37[5] = v20;

      v18 = v37[5] != 0;
      goto LABEL_13;
    }
    *a3 = 0;
    LOBYTE(v18) = 1;
  }
  else
  {
    LOBYTE(v18) = 0;
  }
LABEL_19:

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v18;
}

void __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  ENSQLiteBindFoundationValue(a2, 1, *(void **)(a1 + 32));
}

uint64_t __63__ENExposureDatabase_getValue_forKey_ofClass_connection_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = sqlite3_column_int64(a2, 0);
  ENSQLiteColumnAsNaturalType(a2, 1);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return 1;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  ENSQLiteConnection *connection;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  _QWORD v20[5];
  id v21;
  id v22;
  id v23;
  uint64_t v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v13 = 3;
  }
  else
  {
    v13 = 1;
  }
  connection = self->_connection;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __55__ENExposureDatabase_setValue_forKey_expiryDate_error___block_invoke;
  v20[3] = &unk_1E87DBDD8;
  v20[4] = self;
  v21 = v10;
  v23 = v12;
  v24 = v13;
  v22 = v11;
  v15 = v12;
  v16 = v11;
  v17 = v10;
  v18 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a6, v20);

  return v18;
}

uint64_t __55__ENExposureDatabase_setValue_forKey_expiryDate_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v7 = a1[7];
  v6 = a1[8];
  v8 = a1[6];
  v9 = (void *)MEMORY[0x1E0C99D60];
  v10 = a2;
  objc_msgSend(v9, "date");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "setValue:forKey:type:expiryDate:modDate:connection:error:", v5, v8, v6, v7, v11, v10, a3);

  return v12;
}

- (BOOL)setPropertyListValue:(id)a3 forKey:(id)a4 expiryDate:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  ENSQLiteConnection *connection;
  id v14;
  id v15;
  id v16;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  connection = self->_connection;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __67__ENExposureDatabase_setPropertyListValue_forKey_expiryDate_error___block_invoke;
  v18[3] = &unk_1E87DBE00;
  v18[4] = self;
  v19 = v10;
  v20 = v11;
  v21 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  LOBYTE(a6) = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a6, v18);

  return (char)a6;
}

uint64_t __67__ENExposureDatabase_setPropertyListValue_forKey_expiryDate_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = a1[6];
  v7 = a1[7];
  v8 = (void *)MEMORY[0x1E0C99D60];
  v9 = a2;
  objc_msgSend(v8, "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v4, "setValue:forKey:type:expiryDate:modDate:connection:error:", v5, v6, 2, v7, v10, v9, a3);

  return v11;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 type:(int64_t)a5 expiryDate:(id)a6 modDate:(id)a7 connection:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  int v24;
  id v25;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  int64_t v32;
  id v33;
  void *v34;
  void *v35;

  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = (void *)MEMORY[0x1D17A7CB8]();
  if (!v14)
    goto LABEL_5;
  if (a5 == 2)
  {
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B8], "dataWithPropertyList:format:options:error:", v14, 200, 0, &v34);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v34;
    goto LABEL_7;
  }
  if (a5 != 1)
  {
LABEL_5:
    v22 = 0;
    goto LABEL_9;
  }
  v35 = 0;
  objc_msgSend(MEMORY[0x1E0CB3700], "archivedDataWithRootObject:requiringSecureCoding:error:", v14, 1, &v35);
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v35;
LABEL_7:
  v22 = v21;

  if (!v20)
  {
    v23 = 0;
    v24 = 0;
    goto LABEL_10;
  }
  v14 = (id)v20;
LABEL_9:
  v33 = v22;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __79__ENExposureDatabase_setValue_forKey_type_expiryDate_modDate_connection_error___block_invoke;
  v27[3] = &unk_1E87DBE28;
  v28 = v15;
  v23 = v14;
  v29 = v23;
  v32 = a5;
  v30 = v17;
  v31 = v16;
  v24 = objc_msgSend(v18, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR REPLACE INTO kvs(key, value, type, mod_date, expiration_date) VALUES (?, ?, ?, ?, ?)"), &v33, v27, 0);
  v25 = v33;

  v22 = v25;
LABEL_10:
  objc_autoreleasePoolPop(v19);
  if (a9 && !v24 && v22)
    *a9 = objc_retainAutorelease(v22);

  return v24;
}

void __79__ENExposureDatabase_setValue_forKey_type_expiryDate_modDate_connection_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  ENSQLiteBindFoundationValue(a2, 1, *(void **)(a1 + 32));
  ENSQLiteBindFoundationValue(a2, 2, *(void **)(a1 + 40));
  sqlite3_bind_int64(a2, 3, *(_QWORD *)(a1 + 64));
  ENSQLiteBindFoundationValue(a2, 4, *(void **)(a1 + 48));
  ENSQLiteBindFoundationValue(a2, 5, *(void **)(a1 + 56));
}

- (BOOL)purgeRecordsWithInterval:(double)a3 nowDate:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  double v10;
  unsigned int v11;
  ENSQLiteConnection *connection;
  id v13;
  BOOL v14;
  ENSQLiteConnection *v15;
  id v16;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  unsigned int v22;

  v8 = a4;
  if (-[ENExposureDatabase _checkDatabaseOpenWithError:](self, "_checkDatabaseOpenWithError:", a5))
  {
    objc_msgSend(v8, "dateByAddingTimeInterval:", -a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v11 = ((v10 + *MEMORY[0x1E0C9ADF0]) / 600.0);
    connection = self->_connection;
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke;
    v19[3] = &unk_1E87DBE70;
    v22 = v11;
    v20 = v8;
    v13 = v9;
    v21 = v13;
    v14 = -[ENSQLiteConnection performTransactionWithType:error:usingBlock:](connection, "performTransactionWithType:error:usingBlock:", 1, a5, v19);
    v15 = self->_connection;
    v18 = 0;
    LOBYTE(connection) = -[ENSQLiteConnection executeUncachedSQL:error:](v15, "executeUncachedSQL:error:", CFSTR("PRAGMA wal_checkpoint(TRUNCATE)"), &v18);
    v16 = v18;
    if ((connection & 1) == 0
      && gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  int v14;

  v5 = a2;
  v6 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_2;
  v13[3] = &__block_descriptor_36_e23_v16__0__sqlite3_stmt__8l;
  v14 = *(_DWORD *)(a1 + 48);
  if (objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM teks WHERE end <= ?"), a3, v13, 0))
  {
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_3;
    v11[3] = &unk_1E87DBB68;
    v12 = *(id *)(a1 + 32);
    if (objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM kvs WHERE expiration_date IS NOT NULL AND expiration_date <= ?"), a3, v11, 0))
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_4;
      v9[3] = &unk_1E87DBB68;
      v10 = *(id *)(a1 + 40);
      v7 = objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("DELETE FROM session_history WHERE date < ?"), a3, v9, 0);

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(unsigned int *)(a1 + 32));
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_3(uint64_t a1, sqlite3_stmt *a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 1, v3);
}

uint64_t __61__ENExposureDatabase_purgeRecordsWithInterval_nowDate_error___block_invoke_4(uint64_t a1, sqlite3_stmt *a2)
{
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "timeIntervalSinceReferenceDate");
  return sqlite3_bind_double(a2, 1, v3);
}

- (void)purgeAllAndCloseWithReason:(id)a3
{
  id v4;
  ENSQLiteConnection *connection;
  BOOL v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  if (gLogCategory_ENExposureDatabase <= 50
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    -[NSURL path](self->_databaseURL, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v4;
    LogPrintF_safe();

  }
  connection = self->_connection;
  if (!connection)
    goto LABEL_13;
  v11 = 0;
  v6 = -[ENSQLiteConnection truncateWithError:](connection, "truncateWithError:", &v11);
  v7 = v11;
  v8 = v7;
  if (!v6)
  {
    if (gLogCategory__ENExposureDatabase <= 90
      && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
    {
      v9 = v8;
      LogPrintF_safe();
    }

LABEL_13:
    -[ENExposureDatabase close](self, "close", v9, v10);
    +[ENExposureDatabase _obliterateDatabaseAtURL:reason:generateStackshot:](ENExposureDatabase, "_obliterateDatabaseAtURL:reason:generateStackshot:", self->_databaseURL, v4, 0);
    goto LABEL_14;
  }

  -[ENExposureDatabase close](self, "close");
LABEL_14:

}

+ (void)_obliterateDatabaseAtURL:(id)a3 reason:(id)a4 generateStackshot:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  char v24;
  id v25;
  void *v26;
  int v27;
  void *v28;
  uint64_t v29;
  BOOL v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  id v45[5];

  v5 = a5;
  v45[3] = *(id *)MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3490], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ENExposureDatabase.m"), 1211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("databaseURL != nil"));

  }
  if (v5)
    v11 = 115;
  else
    v11 = 50;
  if (v11 >= gLogCategory_ENExposureDatabase
    && (gLogCategory_ENExposureDatabase != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v9, "path");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v10;
    LogPrintF_safe();

  }
  v37 = v10;
  v38 = v9;
  objc_msgSend(v9, "path", v32, v34);
  v45[0] = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45[0], "stringByAppendingString:", CFSTR("-wal"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v12;
  v36 = v45[0];
  objc_msgSend(v45[0], "stringByAppendingString:", CFSTR("-shm"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D18], "arrayWithObjects:count:", v45, 3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc_init(MEMORY[0x1E0CB3618]);
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v16 = v14;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  v18 = 0x1ED89B000uLL;
  if (v17)
  {
    v19 = v17;
    v20 = *(_QWORD *)v41;
    v21 = *MEMORY[0x1E0CB28B0];
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v41 != v20)
          objc_enumerationMutation(v16);
        v23 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i);
        v39 = 0;
        v24 = objc_msgSend(v15, "removeItemAtPath:error:", v23, &v39, v33, v35);
        v25 = v39;
        v26 = v25;
        if ((v24 & 1) != 0)
        {
          v27 = *(_DWORD *)(v18 + 3744);
          if (v27 <= 50 && (v27 != -1 || _LogCategory_Initialize()))
          {
            v33 = v23;
LABEL_26:
            LogPrintF_safe();
          }
        }
        else
        {
          objc_msgSend(v25, "domain");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v28, "isEqualToString:", v21))
          {
            if (objc_msgSend(v26, "code") == 4)
            {

              goto LABEL_33;
            }
            v29 = objc_msgSend(v26, "code");

            v30 = v29 == 260;
            v18 = 0x1ED89B000;
            if (v30)
              goto LABEL_33;
          }
          else
          {

          }
          if (gLogCategory__ENExposureDatabase <= 90
            && (gLogCategory__ENExposureDatabase != -1 || _LogCategory_Initialize()))
          {
            v33 = v23;
            v35 = v26;
            goto LABEL_26;
          }
        }
LABEL_33:

      }
      v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v19);
  }

}

- (id)errorMetricReporter
{
  return self->_errorMetricReporter;
}

- (void)setErrorMetricReporter:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (ENSQLiteConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_errorMetricReporter, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
