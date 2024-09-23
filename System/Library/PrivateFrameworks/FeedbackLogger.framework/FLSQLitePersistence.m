@implementation FLSQLitePersistence

- (NSString)currentBatchIdentifier
{
  return self->_currentBatchIdentifier;
}

- (void)setCurrentBatchCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)dealloc
{
  unsigned __int8 v3;
  sqlite3_stmt *insertRecordsStatement;
  sqlite3_stmt *iteratePayloadStatement;
  objc_super v6;

  if (-[FLSQLitePersistence db](self, "db"))
  {
    v3 = atomic_load((unsigned __int8 *)&self->_configured);
    if ((v3 & 1) != 0 && !-[FLSQLitePersistence user](self, "user"))
      -[FLSQLitePersistence closeOpenBatch](self, "closeOpenBatch");
    -[FLSQLitePersistence finalizeObserver](self, "finalizeObserver");
    insertRecordsStatement = self->_insertRecordsStatement;
    if (insertRecordsStatement)
      sqlite3_finalize(insertRecordsStatement);
    iteratePayloadStatement = self->_iteratePayloadStatement;
    if (iteratePayloadStatement)
      sqlite3_finalize(iteratePayloadStatement);
  }
  v6.receiver = self;
  v6.super_class = (Class)FLSQLitePersistence;
  -[FLSQLitePersistence dealloc](&v6, sel_dealloc);
}

- (id)getUploadIdsWithStatus:(int)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  __int16 v10;
  sqlite3_stmt *pStmt;
  uint8_t buf[2];

  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    pStmt = 0;
    if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId FROM fileUploads WHERE status=? ORDER BY rowid ASC;",
           &pStmt)
      && !sqlite3_bind_int(pStmt, 1, a3))
    {
      -[FLSQLitePersistence _getUploadIdsHelper:](self, "_getUploadIdsHelper:", pStmt);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 0;
      v6 = "getUploadIdsWithStatus failed";
      v7 = (uint8_t *)&v10;
LABEL_11:
      _os_log_error_impl(&dword_1B512E000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    }
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "Can't getUploadIdsWithStatus, initializeConnection failed";
      v7 = buf;
      goto LABEL_11;
    }
  }

  v8 = 0;
  return v8;
}

- (id)getUploadIdsWithAllStatuses
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  sqlite3_stmt *pStmt;
  __int16 v10;

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v3 = 0;
      return v3;
    }
    v10 = 0;
    v5 = "Can't getUploadIdsWithAllStatuses, initializeConnection failed";
    v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId FROM fileUploads ORDER BY rowid ASC;",
          &pStmt))
  {
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v8 = 0;
    v5 = "getUploadIdsWithAllStatuses failed";
    v6 = (uint8_t *)&v8;
    goto LABEL_10;
  }
  -[FLSQLitePersistence _getUploadIdsHelper:](self, "_getUploadIdsHelper:", pStmt);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)getPurgableUploadIds
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  sqlite3_stmt *pStmt;
  __int16 v10;

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v3 = 0;
      return v3;
    }
    v10 = 0;
    v5 = "Can't getPurgableUploadIds, initializeConnection failed";
    v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId FROM fileUploads WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (3, 4, 5))", &pStmt))
  {
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v8 = 0;
    v5 = "getPurgableUploadIds failed";
    v6 = (uint8_t *)&v8;
    goto LABEL_10;
  }
  -[FLSQLitePersistence _getUploadIdsHelper:](self, "_getUploadIdsHelper:", pStmt);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)_getUploadIdsHelper:(sqlite3_stmt *)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v8[16];

  if (a3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (sqlite3_step(a3) == 100)
    {
      tryGetTextProperty(a3, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (v5)
        objc_msgSend(v4, "addObject:", v5);

    }
    sqlite3_finalize(a3);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1B512E000, v6, OS_LOG_TYPE_ERROR, "Can't getUploadIds, no statement", v8, 2u);
    }

    v4 = 0;
  }
  return v4;
}

- (id)getUploadsRangeStart:(int64_t)a3 end:(int64_t)a4
{
  NSObject *v7;
  const char *v8;
  sqlite3_stmt **v9;
  id v10;
  sqlite3 *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];
  sqlite3_stmt *pStmt[2];

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      v8 = "Can't getRecordsRangeStartDate:endDate, initializeConnection failed";
      v9 = pStmt;
      goto LABEL_23;
    }
LABEL_8:

    v10 = 0;
    return v10;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload, dateCreated, uploadId FROM fileUploads WHERE dateCreated >= ? AND dateCreated <= ? ORDER BY dateCreated ASC;",
          pStmt)
    || sqlite3_bind_int64(pStmt[0], 1, a3)
    || sqlite3_bind_int64(pStmt[0], 2, a4))
  {
    sqlite3_finalize(pStmt[0]);
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      v8 = "getRecordsRangeStartDate:endDate, failed";
      v9 = (sqlite3_stmt **)v19;
LABEL_23:
      _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (sqlite3_step(pStmt[0]) == 100)
  {
    v12 = -[FLSQLitePersistence db](self, "db");
    -[FLSQLitePersistence log](self, "log");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    tryGetDataProperty(v12, v13, pStmt[0], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    tryGetDateProperty(pStmt[0], 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      tryGetTextProperty(pStmt[0], 2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSObject addObject:](v17, "addObject:", v14);
        -[NSObject addObject:](v17, "addObject:", v15);
        -[FLSQLitePersistence storeIdentifier](self, "storeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v17, "addObject:", v18);

        -[NSObject addObject:](v17, "addObject:", v16);
        objc_msgSend(v10, "addObject:", v17);
      }
      else
      {
        -[FLSQLitePersistence log](self, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl(&dword_1B512E000, v17, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate uploadId failed", v19, 2u);
        }
      }

    }
    else
    {
      -[FLSQLitePersistence log](self, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1B512E000, v16, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate dateCreated failed", v19, 2u);
      }
    }

  }
  sqlite3_finalize(pStmt[0]);
  return v10;
}

- (BOOL)_updateStatusHelperForUpload:(id)a3 toStatus:(int)a4
{
  id v6;
  BOOL v7;
  sqlite3_stmt *v8;
  id v9;
  NSObject *v10;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE fileUploads SET status=? WHERE uploadId=?;",
          &pStmt))
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
  sqlite3_bind_int(pStmt, 1, a4);
  v8 = pStmt;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 2, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, "Failed to update status for upload %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v7;
}

- (BOOL)_updateMetadataHelperForUpload:(id)a3 query:(const char *)a4
{
  id v6;
  sqlite3_stmt *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", a4, &pStmt))
  {
LABEL_6:
    v9 = 0;
    goto LABEL_7;
  }
  v7 = pStmt;
  v8 = objc_retainAutorelease(v6);
  v9 = 1;
  sqlite3_bind_text(v7, 1, (const char *)objc_msgSend(v8, "UTF8String"), objc_msgSend(v8, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v8;
      _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, "Failed to update status metadata for upload %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v9;
}

- (BOOL)updateStatusForUpload:(id)a3 toStatus:(int)a4
{
  uint64_t v4;
  id v6;
  _BOOL4 v7;
  int v8;
  BOOL v9;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  if ((_DWORD)v4 == 2)
  {
    LOBYTE(v8) = -[FLSQLitePersistence _updateMetadataHelperForUpload:query:](self, "_updateMetadataHelperForUpload:query:", v6, "UPDATE fileUploads SET dateUploaded=strftime('%s',datetime('now')) WHERE uploadId=?;");
  }
  else if ((_DWORD)v4 == 1)
  {
    v7 = -[FLSQLitePersistence _updateMetadataHelperForUpload:query:](self, "_updateMetadataHelperForUpload:query:", v6, "UPDATE fileUploads SET processedAttempts=processedAttempts+1 WHERE uploadId=?;");
    v8 = v7 & -[FLSQLitePersistence _updateMetadataHelperForUpload:query:](self, "_updateMetadataHelperForUpload:query:", v6, "UPDATE fileUploads SET dateLastProcessed=strftime('%s',datetime('now')) WHERE uploadId=?;");
  }
  else
  {
    LOBYTE(v8) = 1;
  }
  v9 = v8 & -[FLSQLitePersistence _updateStatusHelperForUpload:toStatus:](self, "_updateStatusHelperForUpload:toStatus:", v6, v4);

  return v9;
}

- (BOOL)recoverOrphanedProcessingUploads
{
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE fileUploads SET status=0 WHERE status=1;");
}

- (int64_t)doUploadHousekeeping
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  int64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  -[FLSQLitePersistence context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "userDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DisableFileHousekeeping"));

  if (!v5)
  {
    -[FLSQLitePersistence getPurgableUploadIds](self, "getPurgableUploadIds");
    v6 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject count](v6, "count"))
    {
      if (-[FLSQLitePersistence markUploadsForPurge](self, "markUploadsForPurge"))
      {
        v22 = 0u;
        v23 = 0u;
        v20 = 0u;
        v21 = 0u;
        v8 = v6;
        v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v21;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v21 != v11)
                objc_enumerationMutation(v8);
              -[FLSQLitePersistence getUploadRecordWithId:](self, "getUploadRecordWithId:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v12), (_QWORD)v20);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "outcomeTelemetryDictionary");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              -[FLSQLitePersistence context](self, "context");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v15, "reportTelemetry:payload:", CFSTR("com.apple.parsec-fbf.batchUploadOutcome"), v14);

              ++v12;
            }
            while (v10 != v12);
            v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          }
          while (v10);
        }

        v7 = -[FLSQLitePersistence cleanupPurgableUploads](self, "cleanupPurgableUploads");
        v16 = -[NSObject count](v8, "count");
        if (v7 == v16)
        {
          v6 = v8;
          goto LABEL_25;
        }
        v18 = v16;
        -[FLSQLitePersistence log](self, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          v25 = v18;
          v26 = 2048;
          v27 = v7;
          _os_log_error_impl(&dword_1B512E000, v17, OS_LOG_TYPE_ERROR, "Expected %ld purged uploads from housekeeping, but there were %ld.", buf, 0x16u);
        }
      }
      else
      {
        -[FLSQLitePersistence log](self, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B512E000, v17, OS_LOG_TYPE_ERROR, "Error marking uploads for purge, bailing on housekeeping.", buf, 2u);
        }
        v7 = -1;
      }
    }
    else
    {
      -[FLSQLitePersistence log](self, "log");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1B512E000, v17, OS_LOG_TYPE_DEBUG, "Housekeeping found no eligible file uploads.", buf, 2u);
      }
      v7 = 0;
    }

    goto LABEL_25;
  }
  -[FLSQLitePersistence log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1B512E000, v6, OS_LOG_TYPE_DEBUG, "File housekeeping is disabled, doing nothing.", buf, 2u);
  }
  v7 = 0;
LABEL_25:

  return v7;
}

- (BOOL)markUploadsForPurge
{
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE fileUploads SET status=5 WHERE uploadId IN (SELECT uploadId FROM fileUploads WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (3, 4, 5))) AND status NOT IN (2, 3, 4);");
}

- (int64_t)cleanupPurgableUploads
{
  if (-[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "DELETE FROM fileUploads WHERE uploadId IN (SELECT uploadId FROM fileUploads WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (3, 4, 5)));"))
  {
    return sqlite3_changes(-[FLSQLitePersistence db](self, "db"));
  }
  else
  {
    return -1;
  }
}

- (id)persistUploadPayload:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  sqlite3_stmt *v12;
  void *v13;
  id v14;
  const char *v15;
  void *v16;
  void *v17;
  sqlite3_stmt *v18;
  void *v19;
  double v20;
  int v21;
  int v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  unint64_t v35;
  unint64_t v36;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  unint64_t v39;
  __int16 v40;
  unint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 0))
  {
    pStmt = 0;
    if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO fileUploads(uploadId, payload, timestampRefId, dateCreated) VALUES (?, ?, ?, ?);",
           &pStmt))
    {
      v5 = (void *)MEMORY[0x1B5E47614]();
      v6 = (void *)objc_opt_new();
      objc_msgSend(v6, "UUIDString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = pStmt;
      v9 = objc_retainAutorelease(v7);
      sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), 0);
      v10 = pStmt;
      v11 = objc_retainAutorelease(v4);
      sqlite3_bind_blob(v10, 2, (const void *)objc_msgSend(v11, "bytes"), objc_msgSend(v11, "length"), 0);
      v12 = pStmt;
      -[FLSQLitePersistence context](self, "context");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timestampReferenceIdentifier");
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v15 = (const char *)objc_msgSend(v14, "UTF8String");
      -[FLSQLitePersistence context](self, "context");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "timestampReferenceIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      sqlite3_bind_text(v12, 3, v15, objc_msgSend(v17, "length"), 0);

      v18 = pStmt;
      v19 = (void *)objc_opt_new();
      objc_msgSend(v19, "timeIntervalSince1970");
      sqlite3_bind_int64(v18, 4, (uint64_t)v20);

      v21 = sqlite3_step(pStmt);
      if (v21 == 13)
      {
        -[FLSQLitePersistence log](self, "log");
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          v35 = -[FLSQLitePersistence getCurrentDatabaseSize](self, "getCurrentDatabaseSize");
          v36 = -[FLSQLitePersistence maxAllowedDatabaseSizeInBytes](self, "maxAllowedDatabaseSizeInBytes");
          *(_DWORD *)buf = 134218240;
          v39 = v35;
          v40 = 2048;
          v41 = v36;
          _os_log_error_impl(&dword_1B512E000, v29, OS_LOG_TYPE_ERROR, "Database quota exceeded, using %llu out of %llu bytes, failing persist request", buf, 0x16u);
        }

        v30 = (void *)MEMORY[0x1E0CB35C8];
        v31 = -2;
      }
      else
      {
        v22 = v21;
        if (v21 == 101)
        {
          -[FLSQLitePersistence log](self, "log");
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)buf = 0;
            _os_log_debug_impl(&dword_1B512E000, v23, OS_LOG_TYPE_DEBUG, "Successfully added file upload record", buf, 2u);
          }

          v24 = 0;
          goto LABEL_22;
        }
        -[FLSQLitePersistence log](self, "log");
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v39) = v22;
          _os_log_error_impl(&dword_1B512E000, v32, OS_LOG_TYPE_ERROR, "Failed to insert upload record %d", buf, 8u);
        }

        v33 = (void *)MEMORY[0x1E0CB35C8];
        v31 = sqlite3_errcode(-[FLSQLitePersistence db](self, "db"));
        v30 = v33;
      }
      objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), v31, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

      objc_autoreleasePoolPop(v5);
      sqlite3_finalize(pStmt);
      goto LABEL_23;
    }
    -[FLSQLitePersistence log](self, "log");
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v28, OS_LOG_TYPE_ERROR, "Failed to create SQLite iterate uploads statement", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = -7;
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v25, OS_LOG_TYPE_ERROR, "Can't persistUploadPayload, initializeConnection failed", buf, 2u);
    }

    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = -4;
  }
  objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), v27, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_23:

  return v24;
}

- (id)getUploadRecordWithId:(id)a3
{
  id v4;
  sqlite3_stmt *v5;
  id v6;
  int v7;
  int v8;
  UploadRecord *v9;
  sqlite3 *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  UploadRecord *v20;
  NSObject *v22;
  sqlite3_stmt *pStmt[2];
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    pStmt[0] = 0;
    if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload, timestampRefId, status, processedAttempts, dateCreated, dateUploaded, dateLastProcessed, length(payload) FROM fileUploads WHERE uploadId=?;",
           pStmt))
    {
      v5 = pStmt[0];
      v6 = objc_retainAutorelease(v4);
      sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(v6, "UTF8String"), objc_msgSend(v6, "length"), 0);
      v7 = sqlite3_step(pStmt[0]);
      if (v7 == 101)
      {
        v9 = 0;
LABEL_18:
        sqlite3_finalize(pStmt[0]);
        v9 = v9;
        v20 = v9;
        goto LABEL_19;
      }
      v8 = v7;
      if (v7 != 100)
      {
        -[FLSQLitePersistence log](self, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v25 = v8;
          _os_log_error_impl(&dword_1B512E000, v15, OS_LOG_TYPE_ERROR, "SQLite iterate uploads, failed: %d", buf, 8u);
        }
        v9 = 0;
        goto LABEL_17;
      }
      v9 = objc_alloc_init(UploadRecord);
      -[UploadRecord setUploadIdentifier:](v9, "setUploadIdentifier:", v6);
      v10 = -[FLSQLitePersistence db](self, "db");
      -[FLSQLitePersistence log](self, "log");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      tryGetDataProperty(v10, v11, pStmt[0], 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UploadRecord setPayload:](v9, "setPayload:", v12);

      tryGetTextProperty(pStmt[0], 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[UploadRecord setTimestampReferenceIdentifier:](v9, "setTimestampReferenceIdentifier:", v13);

      -[UploadRecord setUploadStatus:](v9, "setUploadStatus:", sqlite3_column_int(pStmt[0], 2));
      -[UploadRecord setProcessedAttempts:](v9, "setProcessedAttempts:", sqlite3_column_int(pStmt[0], 3));
      tryGetDateProperty(pStmt[0], 4);
      v14 = objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        v15 = v14;
        -[UploadRecord setDateCreated:](v9, "setDateCreated:", v14);
        tryGetDateProperty(pStmt[0], 5);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UploadRecord setDateUploaded:](v9, "setDateUploaded:", v16);

        tryGetDateProperty(pStmt[0], 6);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UploadRecord setDateLastProcessed:](v9, "setDateLastProcessed:", v17);

        -[UploadRecord setSize:](v9, "setSize:", sqlite3_column_int(pStmt[0], 7));
        -[FLSQLitePersistence storeIdentifier](self, "storeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[UploadRecord setApplicationIdentifier:](v9, "setApplicationIdentifier:", v18);

LABEL_17:
        goto LABEL_18;
      }
      -[FLSQLitePersistence log](self, "log");
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, v22, OS_LOG_TYPE_ERROR, "Upload record has no creation date.", buf, 2u);
      }

      sqlite3_finalize(pStmt[0]);
    }
    else
    {
      -[FLSQLitePersistence log](self, "log");
      v9 = (UploadRecord *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v9->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, &v9->super, OS_LOG_TYPE_ERROR, "Failed to create SQLite iterate uploads statement", buf, 2u);
      }
    }
    v20 = 0;
LABEL_19:

    goto LABEL_20;
  }
  -[FLSQLitePersistence log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    LOWORD(pStmt[0]) = 0;
    _os_log_error_impl(&dword_1B512E000, v19, OS_LOG_TYPE_ERROR, "Can't getUploadRecordWithId, initializeConnection failed", (uint8_t *)pStmt, 2u);
  }

  v20 = 0;
LABEL_20:

  return v20;
}

- (BOOL)iterateUploadsWithCodeblock:(id)a3
{
  void (**v4)(id, UploadRecord *, _BYTE *);
  void *v5;
  int v6;
  UploadRecord *v7;
  void *v8;
  sqlite3 *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint8_t *v19;
  BOOL v20;
  int v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  sqlite3_stmt *pStmt[2];
  uint8_t buf[4];
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, UploadRecord *, _BYTE *))a3;
  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
LABEL_11:

      goto LABEL_12;
    }
    LOWORD(pStmt[0]) = 0;
    v18 = "Can't iterateUploadsWithCodeblock, initializeConnection failed";
    v19 = (uint8_t *)pStmt;
LABEL_24:
    _os_log_error_impl(&dword_1B512E000, v17, OS_LOG_TYPE_ERROR, v18, v19, 2u);
    goto LABEL_11;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT uploadId, payload, timestampRefId, status, processedAttempts, dateCreated, dateUploaded, dateLastProcessed FROM fileUploads WHERE status=0;",
          pStmt))
  {
    -[FLSQLitePersistence log](self, "log");
    v17 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      goto LABEL_11;
    *(_WORD *)buf = 0;
    v18 = "Failed to create SQLite iterate uploads statement";
    v19 = buf;
    goto LABEL_24;
  }
  v5 = (void *)MEMORY[0x1B5E47614]();
  v25 = 0;
  while (1)
  {
    v6 = sqlite3_step(pStmt[0]);
    if (v6 != 100)
    {
      v22 = v6;
      if (v6 == 101)
      {
LABEL_15:
        v20 = 1;
      }
      else
      {
        -[FLSQLitePersistence log](self, "log");
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          v28 = v22;
          _os_log_error_impl(&dword_1B512E000, v23, OS_LOG_TYPE_ERROR, "SQLite iterate uploads, failed: %d", buf, 8u);
        }

        v20 = 0;
      }
      objc_autoreleasePoolPop(v5);
      sqlite3_finalize(pStmt[0]);
      goto LABEL_13;
    }
    v7 = objc_alloc_init(UploadRecord);
    tryGetTextProperty(pStmt[0], 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UploadRecord setUploadIdentifier:](v7, "setUploadIdentifier:", v8);

    v9 = -[FLSQLitePersistence db](self, "db");
    -[FLSQLitePersistence log](self, "log");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    tryGetDataProperty(v9, v10, pStmt[0], 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UploadRecord setPayload:](v7, "setPayload:", v11);

    tryGetTextProperty(pStmt[0], 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[UploadRecord setTimestampReferenceIdentifier:](v7, "setTimestampReferenceIdentifier:", v12);

    -[UploadRecord setUploadStatus:](v7, "setUploadStatus:", sqlite3_column_int(pStmt[0], 3));
    -[UploadRecord setProcessedAttempts:](v7, "setProcessedAttempts:", sqlite3_column_int(pStmt[0], 4));
    tryGetDateProperty(pStmt[0], 5);
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      break;
    v14 = (void *)v13;
    -[UploadRecord setDateCreated:](v7, "setDateCreated:", v13);
    tryGetDateProperty(pStmt[0], 6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UploadRecord setDateUploaded:](v7, "setDateUploaded:", v15);

    tryGetDateProperty(pStmt[0], 7);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UploadRecord setDateLastProcessed:](v7, "setDateLastProcessed:", v16);

    v4[2](v4, v7, &v25);
    if (v25)
      goto LABEL_15;
  }
  -[FLSQLitePersistence log](self, "log");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B512E000, v24, OS_LOG_TYPE_ERROR, "Upload record has no creation date.", buf, 2u);
  }

  sqlite3_finalize(pStmt[0]);
  objc_autoreleasePoolPop(v5);
LABEL_12:
  v20 = 0;
LABEL_13:

  return v20;
}

- (BOOL)deleteUploadWithIdentifier:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  BOOL v8;
  const char *v9;
  uint8_t *v10;
  __int16 v12;
  uint8_t buf[16];
  __int16 v14;

  v4 = a3;
  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v6 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
LABEL_9:
      v8 = 0;
      goto LABEL_10;
    }
    v14 = 0;
    v9 = "Can't deleteUploadWithIdentifier, initializeConnection failed";
    v10 = (uint8_t *)&v14;
LABEL_12:
    _os_log_error_impl(&dword_1B512E000, v6, OS_LOG_TYPE_ERROR, v9, v10, 2u);
    goto LABEL_9;
  }
  v5 = -[FLSQLitePersistence __deleteStatementHelper:forUploadId:](self, "__deleteStatementHelper:forUploadId:", "DELETE FROM fileUploads WHERE uploadId=?;",
         v4);
  -[FLSQLitePersistence log](self, "log");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  if (!v5)
  {
    if (!v7)
      goto LABEL_9;
    v12 = 0;
    v9 = "Failed to deleteUploadWithIdentifier";
    v10 = (uint8_t *)&v12;
    goto LABEL_12;
  }
  if (v7)
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B512E000, v6, OS_LOG_TYPE_ERROR, "Failed to deleteUploadWithIdentifier, rolling back transaction", buf, 2u);
  }
  v8 = 1;
LABEL_10:

  return v8;
}

- (BOOL)__deleteStatementHelper:(const char *)a3 forUploadId:(id)a4
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  const char *v10;
  int v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1B5E47614]();
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", a3, &pStmt))
  {
    -[FLSQLitePersistence log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = a3;
      v15 = "Can't deleteUpload (%s), statement prep failed";
      v16 = v14;
      v17 = 12;
      goto LABEL_9;
    }
LABEL_6:

    v12 = 0;
    goto LABEL_7;
  }
  sqlite3_reset(pStmt);
  v8 = pStmt;
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = objc_msgSend(v9, "length");
  v12 = 1;
  sqlite3_bind_text(v8, 1, v10, v11, 0);
  v13 = sqlite3_step(pStmt);
  sqlite3_finalize(pStmt);
  if (v13 != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = a3;
      v22 = 1024;
      v23 = v13;
      v15 = "deleteUpload (%s) failed: %d";
      v16 = v14;
      v17 = 18;
LABEL_9:
      _os_log_error_impl(&dword_1B512E000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_autoreleasePoolPop(v7);

  return v12;
}

- (BOOL)deleteAllUploads
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
    return -[FLSQLitePersistence executeInTransactionMultipleSQLStatements:](self, "executeInTransactionMultipleSQLStatements:", &unk_1E68A6270);
  -[FLSQLitePersistence log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "deleteAllUploads: initializeConnection failed", v5, 2u);
  }

  return 0;
}

+ (id)uploadStatusDescription:(int)a3
{
  if (a3 > 5)
    return CFSTR("unknown");
  else
    return off_1E68A2F40[a3];
}

- (id)getBatchIdsWithStatus:(int)a3
{
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  void *v8;
  __int16 v10;
  sqlite3_stmt *pStmt;
  uint8_t buf[2];

  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    pStmt = 0;
    if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId FROM batchStatus WHERE status=? ORDER BY rowid ASC LIMIT 1024;",
           &pStmt)
      && !sqlite3_bind_int(pStmt, 1, a3))
    {
      -[FLSQLitePersistence _getBatchIdsHelper:](self, "_getBatchIdsHelper:", pStmt);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    }
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v10 = 0;
      v6 = "getBatchIdsWithStatus failed";
      v7 = (uint8_t *)&v10;
LABEL_11:
      _os_log_error_impl(&dword_1B512E000, v5, OS_LOG_TYPE_ERROR, v6, v7, 2u);
    }
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v6 = "Can't getBatchIdsWithStatus, initializeConnection failed";
      v7 = buf;
      goto LABEL_11;
    }
  }

  v8 = 0;
  return v8;
}

- (id)getBatchIdsWithAllStatuses
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  sqlite3_stmt *pStmt;
  __int16 v10;

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v3 = 0;
      return v3;
    }
    v10 = 0;
    v5 = "Can't getBatchIdsWithAllStatuses, initializeConnection failed";
    v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId FROM batchStatus ORDER BY rowid ASC;",
          &pStmt))
  {
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v8 = 0;
    v5 = "getBatchIdsWithAllStatuses failed";
    v6 = (uint8_t *)&v8;
    goto LABEL_10;
  }
  -[FLSQLitePersistence _getBatchIdsHelper:](self, "_getBatchIdsHelper:", pStmt);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)getPurgableBatchIds
{
  void *v3;
  NSObject *v4;
  const char *v5;
  uint8_t *v6;
  __int16 v8;
  sqlite3_stmt *pStmt;
  __int16 v10;

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
LABEL_7:

      v3 = 0;
      return v3;
    }
    v10 = 0;
    v5 = "Can't getPurgableBatchIds, initializeConnection failed";
    v6 = (uint8_t *)&v10;
LABEL_10:
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, v5, v6, 2u);
    goto LABEL_7;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (4, 5, 6))", &pStmt))
  {
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      goto LABEL_7;
    v8 = 0;
    v5 = "getPurgableBatchIds failed";
    v6 = (uint8_t *)&v8;
    goto LABEL_10;
  }
  -[FLSQLitePersistence _getBatchIdsHelper:](self, "_getBatchIdsHelper:", pStmt);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)_getBatchIdsHelper:(sqlite3_stmt *)a3
{
  void *v5;
  NSObject *v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint8_t v11[16];

  -[FLSQLitePersistence context](self, "context");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (a3)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    while (sqlite3_step(a3) == 100)
    {
      tryGetTextProperty(a3, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v7, "addObject:", v8);

    }
    sqlite3_finalize(a3);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v11 = 0;
      _os_log_error_impl(&dword_1B512E000, v9, OS_LOG_TYPE_ERROR, "Can't getBatchIds, no statement", v11, 2u);
    }

    v7 = 0;
  }
  return v7;
}

- (id)getRecordsRangeStart:(int64_t)a3 end:(int64_t)a4
{
  NSObject *v7;
  const char *v8;
  sqlite3_stmt **v9;
  id v10;
  sqlite3 *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint8_t v19[16];
  sqlite3_stmt *pStmt[2];

  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      v8 = "Can't getRecordsRangeStartDate:endDate, initializeConnection failed";
      v9 = pStmt;
      goto LABEL_23;
    }
LABEL_8:

    v10 = 0;
    return v10;
  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT r.payload, r.dateCreated, r.batchId FROM records r WHERE r.dateCreated >= ? AND r.dateCreated <= ? ORDER BY r.dateCreated ASC;",
          pStmt)
    || sqlite3_bind_int64(pStmt[0], 1, a3)
    || sqlite3_bind_int64(pStmt[0], 2, a4))
  {
    sqlite3_finalize(pStmt[0]);
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v19 = 0;
      v8 = "getRecordsRangeStartDate:endDate, failed";
      v9 = (sqlite3_stmt **)v19;
LABEL_23:
      _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, v8, (uint8_t *)v9, 2u);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  while (sqlite3_step(pStmt[0]) == 100)
  {
    v12 = -[FLSQLitePersistence db](self, "db");
    -[FLSQLitePersistence log](self, "log");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    tryGetDataProperty(v12, v13, pStmt[0], 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    tryGetDateProperty(pStmt[0], 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      tryGetTextProperty(pStmt[0], 2);
      v16 = objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        -[NSObject addObject:](v17, "addObject:", v14);
        -[NSObject addObject:](v17, "addObject:", v15);
        -[FLSQLitePersistence storeIdentifier](self, "storeIdentifier");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v17, "addObject:", v18);

        -[NSObject addObject:](v17, "addObject:", v16);
        objc_msgSend(v10, "addObject:", v17);
      }
      else
      {
        -[FLSQLitePersistence log](self, "log");
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v19 = 0;
          _os_log_error_impl(&dword_1B512E000, v17, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate batchId failed", v19, 2u);
        }
      }

    }
    else
    {
      -[FLSQLitePersistence log](self, "log");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v19 = 0;
        _os_log_error_impl(&dword_1B512E000, v16, OS_LOG_TYPE_ERROR, "getRecordsRangeStartDate:endDate dateCreated failed", v19, 2u);
      }
    }

  }
  sqlite3_finalize(pStmt[0]);
  return v10;
}

- (id)metadataForBatch:(id)a3 bundleID:(id)a4
{
  id v6;
  id v7;
  sqlite3_stmt *v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BatchMetadata *v12;
  BatchMetadata *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  sqlite3 *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  FLLogger *v25;
  void *v26;
  FLLogger *v27;
  void *v28;
  NSObject *v29;
  _QWORD aBlock[4];
  id v31;
  void *v32;
  id v33;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v11, OS_LOG_TYPE_ERROR, "Can't getBatchSize, initialization failed", buf, 2u);
    }

    goto LABEL_11;
  }
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT s.batchId, s.timestampRefId, COALESCE(sum(length(r.payload)), 0), s.status, s.processedAttempts, s.dateCreated, s.dateUploaded, s.dateLastProcessed, COUNT(DISTINCT(r.rowId)), first_value(r.payload) OVER (ORDER BY r.rowId) FROM batchStatus s LEFT JOIN records r ON s.batchId = r.batchId WHERE s.batchId=? GROUP BY s.batchId;",
          &pStmt)
    || (v8 = pStmt,
        v9 = objc_retainAutorelease(v6),
        sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), 0)))
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, "Failed to get batch metadata", buf, 2u);
    }

    goto LABEL_7;
  }
  if (sqlite3_step(pStmt) != 100)
  {
LABEL_7:
    sqlite3_finalize(pStmt);
LABEL_11:
    v12 = 0;
    goto LABEL_12;
  }
  v14 = objc_alloc_init(BatchMetadata);
  -[BatchMetadata setBatchIdentifier:](v14, "setBatchIdentifier:", v9);
  tryGetTextProperty(pStmt, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[BatchMetadata setTimestampReferenceIdentifier:](v14, "setTimestampReferenceIdentifier:", v15);

  -[BatchMetadata setBatchSize:](v14, "setBatchSize:", sqlite3_column_int(pStmt, 2));
  -[BatchMetadata setBatchStatus:](v14, "setBatchStatus:", sqlite3_column_int(pStmt, 3));
  -[BatchMetadata setProcessedAttempts:](v14, "setProcessedAttempts:", sqlite3_column_int(pStmt, 4));
  tryGetDateProperty(pStmt, 5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[BatchMetadata setDateCreated:](v14, "setDateCreated:", v16);
    tryGetDateProperty(pStmt, 6);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BatchMetadata setDateUploaded:](v14, "setDateUploaded:", v17);

    tryGetDateProperty(pStmt, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BatchMetadata setDateLastProcessed:](v14, "setDateLastProcessed:", v18);

    -[BatchMetadata setEventCount:](v14, "setEventCount:", sqlite3_column_int(pStmt, 8));
    v19 = -[FLSQLitePersistence db](self, "db");
    -[FLSQLitePersistence log](self, "log");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    tryGetDataProperty(v19, v20, pStmt, 9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    +[FLLogger fixedCategoryForBundleID:](FLLogger, "fixedCategoryForBundleID:", v7);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      -[BatchMetadata setCategory:](v14, "setCategory:", v22);
    }
    else if (v21)
    {
      objc_initWeak((id *)buf, self);
      aBlock[1] = 3221225472;
      aBlock[2] = __63__FLSQLitePersistence_BatchManager__metadataForBatch_bundleID___block_invoke;
      aBlock[3] = &unk_1E68A2F78;
      aBlock[0] = MEMORY[0x1E0C809B0];
      objc_copyWeak(&v33, (id *)buf);
      v31 = v7;
      v32 = v21;
      v24 = _Block_copy(aBlock);
      v25 = [FLLogger alloc];
      -[FLSQLitePersistence context](self, "context");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[FLLogger initWithContext:](v25, "initWithContext:", v26);

      -[FLLogger categoryForSiriPayload:autoBugCaptureBlock:](v27, "categoryForSiriPayload:autoBugCaptureBlock:", v21, v24);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[BatchMetadata setCategory:](v14, "setCategory:", v28);

      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      -[BatchMetadata setCategory:](v14, "setCategory:", 0);
      -[FLSQLitePersistence log](self, "log");
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v7;
        _os_log_error_impl(&dword_1B512E000, v29, OS_LOG_TYPE_ERROR, "Batch has no payload for bundleID %@", buf, 0xCu);
      }

    }
    sqlite3_finalize(pStmt);
    v12 = v14;

  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v23, OS_LOG_TYPE_ERROR, "Batch has no creation date.", buf, 2u);
    }

    sqlite3_finalize(pStmt);
    v12 = 0;
  }

LABEL_12:
  return v12;
}

- (BOOL)_updateStatusHelperForBatch:(id)a3 toStatus:(int)a4
{
  id v6;
  BOOL v7;
  sqlite3_stmt *v8;
  id v9;
  NSObject *v10;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE batchStatus SET status=? WHERE batchId=?;",
          &pStmt))
  {
LABEL_6:
    v7 = 0;
    goto LABEL_7;
  }
  v7 = 1;
  sqlite3_bind_int(pStmt, 1, a4);
  v8 = pStmt;
  v9 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v8, 2, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), 0);
  if (sqlite3_step(pStmt) != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v14 = CFSTR("UPDATE batchStatus SET status=? WHERE batchId=?;");
      _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, "Failed to update status for batch with statement: %@", buf, 0xCu);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v7;
}

- (BOOL)_updateMetadataHelperForBatch:(id)a3 query:(const char *)a4
{
  id v6;
  sqlite3_stmt *v7;
  id v8;
  const char *v9;
  int v10;
  BOOL v11;
  NSObject *v12;
  uint8_t v14[8];
  sqlite3_stmt *pStmt;

  v6 = a3;
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", a4, &pStmt))
  {
LABEL_6:
    v11 = 0;
    goto LABEL_7;
  }
  v7 = pStmt;
  v8 = objc_retainAutorelease(v6);
  v9 = (const char *)objc_msgSend(v8, "UTF8String");
  v10 = objc_msgSend(v8, "length");
  v11 = 1;
  sqlite3_bind_text(v7, 1, v9, v10, 0);
  if (sqlite3_step(pStmt) != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v14 = 0;
      _os_log_error_impl(&dword_1B512E000, v12, OS_LOG_TYPE_ERROR, "Failed to update status metadata for batch", v14, 2u);
    }

    goto LABEL_6;
  }
LABEL_7:
  sqlite3_finalize(pStmt);

  return v11;
}

- (BOOL)updateStatusForBatch:(id)a3 toStatus:(int)a4
{
  NSObject *v4;
  id v6;
  _BOOL4 v7;
  int v8;
  uint8_t v10[16];

  v4 = *(NSObject **)&a4;
  v6 = a3;
  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    if ((_DWORD)v4 == 3)
    {
      v8 = -[FLSQLitePersistence _updateMetadataHelperForBatch:query:](self, "_updateMetadataHelperForBatch:query:", v6, "UPDATE batchStatus SET dateUploaded=strftime('%s',datetime('now')) WHERE batchId=?;");
    }
    else if ((_DWORD)v4 == 2)
    {
      v7 = -[FLSQLitePersistence _updateMetadataHelperForBatch:query:](self, "_updateMetadataHelperForBatch:query:", v6, "UPDATE batchStatus SET processedAttempts=processedAttempts+1 WHERE batchId=?;");
      v8 = v7 & -[FLSQLitePersistence _updateMetadataHelperForBatch:query:](self, "_updateMetadataHelperForBatch:query:", v6, "UPDATE batchStatus SET dateLastProcessed=strftime('%s',datetime('now')) WHERE batchId=?;");
    }
    else
    {
      v8 = 1;
    }
    LODWORD(v4) = v8 & -[FLSQLitePersistence _updateStatusHelperForBatch:toStatus:](self, "_updateStatusHelperForBatch:toStatus:", v6, v4);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "Can't getBatchSize, initialization failed", v10, 2u);
    }

    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

- (int)getDataVersion
{
  NSObject *v3;
  uint8_t v5[12];
  int v6;

  v6 = 1;
  if (!-[FLSQLitePersistence getIntValueForPragma:into:](self, "getIntValueForPragma:into:", CFSTR("data_version"), &v6))
  {
    -[FLSQLitePersistence log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B512E000, v3, OS_LOG_TYPE_ERROR, "Could not infer data_version, assuming 1", v5, 2u);
    }

  }
  return v6;
}

- (BOOL)initializeNewBatch
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  sqlite3_stmt *v7;
  NSObject *v8;
  sqlite3_stmt *v9;
  void *v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  sqlite3_stmt *v15;
  void *v16;
  double v17;
  int v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  sqlite3_stmt *pStmt[2];
  uint8_t buf[4];
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1B5E47614](self, a2);
  if (!-[FLSQLitePersistence closeOpenBatch](self, "closeOpenBatch"))
  {
    -[FLSQLitePersistence log](self, "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      LOWORD(pStmt[0]) = 0;
      _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "Couldn't close open batches, failing", (uint8_t *)pStmt, 2u);
    }

  }
  pStmt[0] = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO batchStatus(batchId, timestampRefId, dateCreated) VALUES (?, ?, ?);",
          pStmt))
  {
    -[FLSQLitePersistence log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Couldn't prepare batch initializer statement, failing", buf, 2u);
    }
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "UUIDString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  sqlite3_reset(pStmt[0]);
  v7 = pStmt[0];
  v8 = objc_retainAutorelease(v6);
  sqlite3_bind_text(v7, 1, (const char *)-[NSObject UTF8String](v8, "UTF8String"), -[NSObject length](v8, "length"), 0);
  v9 = pStmt[0];
  -[FLSQLitePersistence context](self, "context");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timestampReferenceIdentifier");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v12 = (const char *)objc_msgSend(v11, "UTF8String");
  -[FLSQLitePersistence context](self, "context");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timestampReferenceIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  sqlite3_bind_text(v9, 2, v12, objc_msgSend(v14, "length"), 0);

  v15 = pStmt[0];
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "timeIntervalSince1970");
  sqlite3_bind_int64(v15, 3, (uint64_t)v17);

  v18 = sqlite3_step(pStmt[0]);
  sqlite3_finalize(pStmt[0]);
  if (v18 != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v25 = v18;
      _os_log_error_impl(&dword_1B512E000, v21, OS_LOG_TYPE_ERROR, "SQLite initialize new batch failed: %d", buf, 8u);
    }

LABEL_13:
    v20 = 0;
    goto LABEL_14;
  }
  -[FLSQLitePersistence setCurrentBatchIdentifier:](self, "setCurrentBatchIdentifier:", v8);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLSQLitePersistence setCurrentBatchCreationDate:](self, "setCurrentBatchCreationDate:", v19);

  -[FLSQLitePersistence setCurrentBatchPayloadSize:](self, "setCurrentBatchPayloadSize:", 0);
  -[FLSQLitePersistence setCurrentBatchEventCount:](self, "setCurrentBatchEventCount:", 0);
  v20 = 1;
LABEL_14:

  objc_autoreleasePoolPop(v3);
  return v20;
}

- (BOOL)closeOrphanedBatches
{
  __int128 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  __int128 v9;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT batchId, dateCreated FROM batchStatus WHERE status=0 AND dateCreated < strftime('%s',datetime('now', '-16 minute'));",
         &pStmt))
  {
    *(_QWORD *)&v3 = 138412546;
    v9 = v3;
    while (sqlite3_step(pStmt) == 100)
    {
      tryGetTextProperty(pStmt, 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      tryGetDateProperty(pStmt, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[FLSQLitePersistence log](self, "log");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v9;
        v12 = v4;
        v13 = 2112;
        v14 = v5;
        _os_log_error_impl(&dword_1B512E000, v6, OS_LOG_TYPE_ERROR, "Found orphaned batch %@ created at %@", buf, 0x16u);
      }

    }
    sqlite3_finalize(pStmt);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, "Failed to get orphaned batches", buf, 2u);
    }

  }
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE batchStatus SET status=1 WHERE status=0 AND dateCreated < strftime('%s',datetime('now', '-16 minute'));",
           v9);
}

- (BOOL)forceCloseOpenBatches
{
  NSObject *v3;
  uint8_t v5[16];

  -[FLSQLitePersistence log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B512E000, v3, OS_LOG_TYPE_INFO, "Force closing open batches", v5, 2u);
  }

  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE batchStatus SET status=1 WHERE status=0;");
}

- (BOOL)closeOpenBatch
{
  void *v3;
  sqlite3_stmt *v4;
  id v5;
  const char *v6;
  void *v7;
  int v8;
  int v10;
  NSObject *v11;
  const char *v12;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 1;
  pStmt = 0;
  if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "UPDATE batchStatus SET status=1 WHERE status=0 AND batchId=?;",
         &pStmt))
  {
    v4 = pStmt;
    -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v6 = (const char *)objc_msgSend(v5, "UTF8String");
    -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    sqlite3_bind_text(v4, 1, v6, objc_msgSend(v7, "length"), 0);

    v8 = sqlite3_step(pStmt);
    if (v8 == 101)
    {
      sqlite3_finalize(pStmt);
      -[FLSQLitePersistence setCurrentBatchCreationDate:](self, "setCurrentBatchCreationDate:", 0);
      -[FLSQLitePersistence setCurrentBatchIdentifier:](self, "setCurrentBatchIdentifier:", 0);
      return 1;
    }
    v10 = v8;
    -[FLSQLitePersistence log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = sqlite3_errmsg(-[FLSQLitePersistence db](self, "db"));
      *(_DWORD *)buf = 138412802;
      v15 = CFSTR("UPDATE batchStatus SET status=1 WHERE status=0 AND batchId=?;");
      v16 = 1024;
      v17 = v10;
      v18 = 2080;
      v19 = v12;
      _os_log_error_impl(&dword_1B512E000, v11, OS_LOG_TYPE_ERROR, "Failed to close batch with statement %@ with status %d, error: %s", buf, 0x1Cu);
    }

  }
  sqlite3_finalize(pStmt);
  return 0;
}

- (BOOL)recoverOrphanedProcessingBatches
{
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE batchStatus SET status=1 WHERE status=2;");
}

- (BOOL)markBatchesforPurge
{
  return -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "UPDATE batchStatus SET status=6 WHERE batchId IN (SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (4, 5, 6))) AND status NOT IN (3, 4, 5);");
}

- (int64_t)doBatchesHousekeeping
{
  if (-[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "DELETE FROM records WHERE batchId IN (SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('now', '-7 day')) OR status IN (4, 5, 6))); DELETE FROM batchStatus WHERE batchI"
         "d IN (SELECT batchId FROM batchStatus WHERE (dateUploaded IS NOT NULL OR dateCreated < strftime('%s',datetime('"
         "now', '-7 day')) OR status IN (4, 5, 6)));"))
  {
    return sqlite3_changes(-[FLSQLitePersistence db](self, "db"));
  }
  else
  {
    return -1;
  }
}

- (BOOL)vacuum
{
  return -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "VACUUM;",
           0);
}

- (BOOL)purgeBatch:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  FLSQLitePersistence *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  BOOL v13;
  NSObject *v14;
  uint8_t v16[16];
  uint8_t buf[2];
  __int16 v18;

  v4 = a3;
  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
LABEL_9:

      v13 = 0;
      goto LABEL_14;
    }
    v18 = 0;
    v11 = "Can't purgeBatch, initializeConnection failed";
    v12 = (uint8_t *)&v18;
LABEL_16:
    _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, v11, v12, 2u);
    goto LABEL_9;
  }
  v5 = objc_msgSend(CFSTR("BEGIN TRANSACTION;"), "UTF8String");
  v6 = objc_msgSend(CFSTR("END TRANSACTION;"), "UTF8String");
  v7 = objc_msgSend(CFSTR("ROLLBACK;"), "UTF8String");
  if (!-[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", v5, 0))
  {
    -[FLSQLitePersistence log](self, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      goto LABEL_9;
    *(_WORD *)buf = 0;
    v11 = "Can't purgeBatch, couldn't begin transaction";
    v12 = buf;
    goto LABEL_16;
  }
  if (-[FLSQLitePersistence __purgeStatementHelper:forBatchId:](self, "__purgeStatementHelper:forBatchId:", "DELETE FROM records WHERE batchId=?;",
         v4)
    && -[FLSQLitePersistence __purgeStatementHelper:forBatchId:](self, "__purgeStatementHelper:forBatchId:", "DELETE FROM batchStatus WHERE batchId=?;",
         v4))
  {
    v8 = self;
    v9 = v6;
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v16 = 0;
      _os_log_error_impl(&dword_1B512E000, v14, OS_LOG_TYPE_ERROR, "Failed to purgeBatch, rolling back transaction", v16, 2u);
    }

    v8 = self;
    v9 = v7;
  }
  v13 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](v8, "executeSQLStatement:usingTransaction:", v9, 0);
LABEL_14:

  return v13;
}

- (BOOL)__purgeStatementHelper:(const char *)a3 forBatchId:(id)a4
{
  id v6;
  void *v7;
  sqlite3_stmt *v8;
  id v9;
  const char *v10;
  int v11;
  BOOL v12;
  int v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)MEMORY[0x1B5E47614]();
  pStmt = 0;
  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", a3, &pStmt))
  {
    -[FLSQLitePersistence log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v21 = a3;
      v15 = "Can't purgeBatch (%s), statement prep failed";
      v16 = v14;
      v17 = 12;
      goto LABEL_9;
    }
LABEL_6:

    v12 = 0;
    goto LABEL_7;
  }
  sqlite3_reset(pStmt);
  v8 = pStmt;
  v9 = objc_retainAutorelease(v6);
  v10 = (const char *)objc_msgSend(v9, "UTF8String");
  v11 = objc_msgSend(v9, "length");
  v12 = 1;
  sqlite3_bind_text(v8, 1, v10, v11, 0);
  v13 = sqlite3_step(pStmt);
  sqlite3_finalize(pStmt);
  if (v13 != 101)
  {
    -[FLSQLitePersistence log](self, "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v21 = a3;
      v22 = 1024;
      v23 = v13;
      v15 = "purgeBatch (%s) failed: %d";
      v16 = v14;
      v17 = 18;
LABEL_9:
      _os_log_error_impl(&dword_1B512E000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      goto LABEL_6;
    }
    goto LABEL_6;
  }
LABEL_7:
  objc_autoreleasePoolPop(v7);

  return v12;
}

- (BOOL)purgeAllBatches
{
  NSObject *v4;
  uint8_t v5[16];

  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
    return -[FLSQLitePersistence executeInTransactionMultipleSQLStatements:](self, "executeInTransactionMultipleSQLStatements:", &unk_1E68A6288);
  -[FLSQLitePersistence log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "Can't purgeAllBatches, initializeConnection failed", v5, 2u);
  }

  return 0;
}

void __63__FLSQLitePersistence_BatchManager__metadataForBatch_bundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id WeakRetained;
  FLAutoBugHelper *v7;
  void *v8;
  void *v9;
  FLAutoBugHelper *v10;
  id v11;

  v11 = a3;
  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = [FLAutoBugHelper alloc];
  objc_msgSend(WeakRetained, "context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "autoBugCapture");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[FLAutoBugHelper initWithAutoBugCapture:bundleID:eventValue:](v7, "initWithAutoBugCapture:bundleID:eventValue:", v9, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  if (v11)
    -[FLAutoBugHelper triggerABCWithSubtype:additionalEventName:](v10, "triggerABCWithSubtype:additionalEventName:", v5, v11);
  else
    -[FLAutoBugHelper triggerABCWithSubtype:](v10, "triggerABCWithSubtype:", v5);

}

+ (id)batchStatusDescription:(int)a3
{
  if (a3 > 6)
    return CFSTR("unknown");
  else
    return off_1E68A2F98[a3];
}

- (BOOL)prepareSchema
{
  return -[FLSQLitePersistence isSchemaReady](self, "isSchemaReady")
      || -[FLSQLitePersistence updateSchema](self, "updateSchema");
}

- (BOOL)isSchemaReady
{
  return -[FLSQLitePersistence getSchemaVersion](self, "getSchemaVersion") > 5;
}

- (BOOL)updateSchema
{
  void (**v3)(void *, uint64_t);
  unsigned int v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  BOOL v10;
  NSObject *v11;
  BOOL v12;
  const char *v14;
  _QWORD aBlock[5];
  uint8_t buf[4];
  _DWORD v17[7];

  *(_QWORD *)&v17[5] = *MEMORY[0x1E0C80C00];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __50__FLSQLitePersistence_SchemaManager__updateSchema__block_invoke;
  aBlock[3] = &unk_1E68A2FE0;
  aBlock[4] = self;
  v3 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v4 = -[FLSQLitePersistence getSchemaVersion](self, "getSchemaVersion");
  -[FLSQLitePersistence log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 67109376;
    v17[0] = v4;
    LOWORD(v17[1]) = 1024;
    *(_DWORD *)((char *)&v17[1] + 2) = 6;
    _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "db's schema version %d. required schema version %d.", buf, 0xEu);
  }

  if (v4 < 5)
  {
    if (-[FLSQLitePersistence deleteDatabase](self, "deleteDatabase")
      && -[FLSQLitePersistence createDatabase](self, "createDatabase"))
    {
      v6 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA journal_mode=WAL;",
             0);
      -[FLSQLitePersistence log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = v7;
      if (!v6)
      {
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        goto LABEL_29;
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v17 = "CREATE TABLE batchStatus(batchId TEXT NOT NULL PRIMARY KEY, timestampRefId TEXT NOT NULL, statu"
                         "s INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DE"
                         "FAULT NULL, dateLastProcessed INT DEFAULT NULL);CREATE TABLE records(batchId TEXT NOT NULL, pay"
                         "load BLOB, dateCreated INT NOT NULL, FOREIGN KEY (batchId) REFERENCES batchStatus(batchId));CRE"
                         "ATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT"
                         " NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUpl"
                         "oaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);";
        _os_log_impl(&dword_1B512E000, v8, OS_LOG_TYPE_DEFAULT, "migrating schema with: %s", buf, 0xCu);
      }

      if (!-[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "DROP TABLE IF EXISTS records; DROP TABLE IF EXISTS batchStatus;")
        || !-[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "CREATE TABLE batchStatus(batchId TEXT NOT NULL PRIMARY KEY, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);CREATE TABLE records(batchId TEXT NOT NULL, payload BLOB, dateCreated INT NOT NU"
              "LL, FOREIGN KEY (batchId) REFERENCES batchStatus(batchId));CREATE TABLE fileUploads(uploadId TEXT NOT NULL"
              " PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFA"
              "ULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);"))
      {
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_32;
        goto LABEL_29;
      }
LABEL_24:
      v3[2](v3, 6);
      goto LABEL_25;
    }
    -[FLSQLitePersistence log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B512E000, v9, OS_LOG_TYPE_DEFAULT, "could not recreate database for migration", buf, 2u);
    }
LABEL_19:

LABEL_30:
    v12 = 0;
    goto LABEL_31;
  }
  if (v4 == 5)
  {
    v10 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA journal_mode=WAL;",
            0);
    -[FLSQLitePersistence log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    v8 = v11;
    if (!v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_32:
        v14 = sqlite3_errmsg(-[FLSQLitePersistence db](self, "db"));
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)v17 = v14;
        _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "%s", buf, 0xCu);
      }
LABEL_29:

      goto LABEL_30;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)v17 = "CREATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NO"
                       "T NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUplo"
                       "aded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);";
      _os_log_impl(&dword_1B512E000, v8, OS_LOG_TYPE_DEFAULT, "migrating schema with: %s", buf, 0xCu);
    }

    -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", "CREATE TABLE fileUploads(uploadId TEXT NOT NULL PRIMARY KEY, payload BLOB, timestampRefId TEXT NOT NULL, status INT DEFAULT 0, processedAttempts INT DEFAULT 0, dateCreated INT NOT NULL, dateUploaded INT DEFAULT NULL, dateLastProcessed INT DEFAULT NULL);");
    goto LABEL_24;
  }
  if (v4 != 6)
  {
    -[FLSQLitePersistence log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v9, OS_LOG_TYPE_ERROR, "Received unexpected schema version, failing migration", buf, 2u);
    }
    goto LABEL_19;
  }
LABEL_25:
  v12 = -[FLSQLitePersistence getSchemaVersion](self, "getSchemaVersion") == 6;
LABEL_31:

  return v12;
}

- (int)getSchemaVersion
{
  NSObject *v3;
  uint8_t v5[12];
  int v6;

  v6 = 0;
  if (!-[FLSQLitePersistence getIntValueForPragma:into:](self, "getIntValueForPragma:into:", CFSTR("user_version"), &v6))
  {
    -[FLSQLitePersistence log](self, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1B512E000, v3, OS_LOG_TYPE_ERROR, "Could not infer schema_version, assuming 0", v5, 2u);
    }

  }
  return v6;
}

- (unint64_t)getCurrentDatabaseSize
{
  uint64_t v4;

  v4 = 0;
  -[FLSQLitePersistence getIntValueForPragma:into:](self, "getIntValueForPragma:into:", CFSTR("page_size"), &v4);
  -[FLSQLitePersistence getIntValueForPragma:into:](self, "getIntValueForPragma:into:", CFSTR("page_count"), (char *)&v4 + 4);
  return (int)v4 * (uint64_t)SHIDWORD(v4);
}

- (BOOL)setDatabaseSizeLimit
{
  BOOL v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t buf[12];
  int v12;

  if (-[FLSQLitePersistence shouldIgnoreQuota](self, "shouldIgnoreQuota"))
    return 1;
  v12 = 0;
  if (-[FLSQLitePersistence getIntValueForPragma:into:](self, "getIntValueForPragma:into:", CFSTR("page_size"), &v12))
  {
    v4 = -[FLSQLitePersistence maxAllowedDatabaseSizeInBytes](self, "maxAllowedDatabaseSizeInBytes");
    v5 = v4 / v12;
    v6 = (void *)MEMORY[0x1B5E47614]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA max_page_count = %i;"), v5);
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v8 = objc_msgSend(v7, "UTF8String");

    v3 = -[FLSQLitePersistence executeSQLStatement:](self, "executeSQLStatement:", v8);
    objc_autoreleasePoolPop(v6);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v9, OS_LOG_TYPE_ERROR, "Couldn't infer page_size, failing request to set database size limit", buf, 2u);
    }

    return 0;
  }
  return v3;
}

- (BOOL)shouldIgnoreQuota
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  BOOL v16;
  uint8_t v18[16];

  -[FLSQLitePersistence context](self, "context");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend((id)objc_opt_class(), "isInternalBuild");

  if (!v4)
    return 0;
  v5 = (void *)MEMORY[0x1E0C99E98];
  -[FLSQLitePersistence databasePath](self, "databasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "URLByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", CFSTR(".com.apple.feedbacklogger.ignore_quota"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "standardizedURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11
    && (-[FLSQLitePersistence context](self, "context"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v12, "fileManager"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        v14 = objc_msgSend(v13, "fileExistsAtPath:", v11),
        v13,
        v12,
        v14))
  {
    -[FLSQLitePersistence log](self, "log");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v18 = 0;
      _os_log_debug_impl(&dword_1B512E000, v15, OS_LOG_TYPE_DEBUG, "Ignoring FeedbackLogger DB size quota.", v18, 2u);
    }

    v16 = 1;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t __50__FLSQLitePersistence_SchemaManager__updateSchema__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t buf[16];

  v4 = (void *)MEMORY[0x1B5E47614]();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA user_version = %i;"), a2);
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = objc_msgSend(v5, "UTF8String");

  if (!v6)
  {
LABEL_7:
    v7 = 0;
    goto LABEL_8;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "executeSQLStatement:", v6) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Schema updateVersion failed", buf, 2u);
    }

    goto LABEL_7;
  }
  v7 = 1;
LABEL_8:
  objc_autoreleasePoolPop(v4);
  return v7;
}

- (FLSQLitePersistence)initWithStoreId:(id)a3 dbConnection:(id)a4 loggingContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  FLSQLitePersistence *v11;
  FLSQLitePersistence *v12;
  uint64_t v13;
  NSString *databasePath;
  uint64_t v15;
  OS_os_log *log;
  uint64_t v17;
  NSString *storeIdentifier;
  NSString *currentBatchIdentifier;
  NSDate *currentBatchCreationDate;
  NSObject *v21;
  NSString *v23;
  objc_super v24;
  uint8_t buf[4];
  NSString *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)FLSQLitePersistence;
  v11 = -[FLSQLitePersistence init](&v24, sel_init);
  v12 = v11;
  if (FLSignpostLoggingInit_onceToken == -1)
  {
    if (!v11)
      goto LABEL_5;
  }
  else
  {
    dispatch_once(&FLSignpostLoggingInit_onceToken, &__block_literal_global_638);
    if (!v12)
      goto LABEL_5;
  }
  *(_OWORD *)&v12->_maxBatchPayloadInBytes = xmmword_1B514EB00;
  objc_msgSend(v9, "storePath");
  v13 = objc_claimAutoreleasedReturnValue();
  databasePath = v12->_databasePath;
  v12->_databasePath = (NSString *)v13;

  flLogForObject(v12);
  v15 = objc_claimAutoreleasedReturnValue();
  log = v12->_log;
  v12->_log = (OS_os_log *)v15;

  objc_storeStrong((id *)&v12->_context, a5);
  v17 = objc_msgSend(v8, "copy");
  storeIdentifier = v12->_storeIdentifier;
  v12->_storeIdentifier = (NSString *)v17;

  currentBatchIdentifier = v12->_currentBatchIdentifier;
  v12->_currentBatchIdentifier = 0;

  currentBatchCreationDate = v12->_currentBatchCreationDate;
  v12->_currentBatchCreationDate = 0;

  v12->_currentBatchPayloadSize = 0;
  v12->_currentBatchEventCount = 0;
  v12->_batchMaximumDuration = 900.0;
  objc_storeStrong((id *)&v12->_dbConnection, a4);
  v12->_user = -1;
  v12->_configured = 0;
  v21 = v12->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
  {
    v23 = v12->_databasePath;
    *(_DWORD *)buf = 138412290;
    v26 = v23;
    _os_log_debug_impl(&dword_1B512E000, v21, OS_LOG_TYPE_DEBUG, "Initialized SQLite persistent store manager for %@", buf, 0xCu);
  }
LABEL_5:

  return v12;
}

- (FLSQLitePersistence)initWithStoreId:(id)a3 loggingContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  FLSQLiteDatabaseConnection *v11;
  FLSQLitePersistence *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "fileManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "urlForStoreWithId:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[FLSQLiteDatabaseConnection initWithStorePath:]([FLSQLiteDatabaseConnection alloc], "initWithStorePath:", v10);
  v12 = -[FLSQLitePersistence initWithStoreId:dbConnection:loggingContext:](self, "initWithStoreId:dbConnection:loggingContext:", v7, v11, v6);

  return v12;
}

- (sqlite3)db
{
  return -[FLSQLiteDatabaseConnection db](self->_dbConnection, "db");
}

- (BOOL)initializeConnectionForUseBy:(int)a3
{
  unsigned __int8 v3;
  uint64_t v4;
  BOOL v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = atomic_load((unsigned __int8 *)&self->_configured);
  if ((v3 & 1) != 0)
    return 1;
  v4 = *(_QWORD *)&a3;
  switch(a3)
  {
    case -1:
      -[FLSQLitePersistence log](self, "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v11) = 0;
        _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, "Can't open a connection for unknown user.", (uint8_t *)&v11, 2u);
      }

      goto LABEL_32;
    case 0:
    case 2:
      if (!-[FLSQLitePersistence createDatabase](self, "createDatabase"))
      {
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        goto LABEL_30;
      }
      if (!-[FLSQLitePersistence prepareSchema](self, "prepareSchema"))
      {
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        goto LABEL_30;
      }
      switch((_DWORD)v4)
      {
        case 0:
          -[FLSQLitePersistence setDatabaseSizeLimit](self, "setDatabaseSizeLimit");
          if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "INSERT INTO records (batchId, payload, dateCreated) VALUES (?, ?, ?);",
                 &self->_insertRecordsStatement)
            && -[FLSQLitePersistence initializeNewBatch](self, "initializeNewBatch"))
          {
            goto LABEL_17;
          }
          goto LABEL_29;
        case 2:
          goto LABEL_16;
        case 1:
          goto LABEL_15;
      }
      goto LABEL_17;
    case 1:
      if (!-[FLSQLitePersistence open](self, "open"))
      {
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
LABEL_31:

          goto LABEL_32;
        }
LABEL_30:
        v11 = 136315138;
        v12 = sqlite3_errmsg(-[FLSQLitePersistence db](self, "db"));
        _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v11, 0xCu);
        goto LABEL_31;
      }
      if (-[FLSQLitePersistence isSchemaReady](self, "isSchemaReady"))
      {
LABEL_15:
        -[FLSQLitePersistence closeOrphanedBatches](self, "closeOrphanedBatches");
LABEL_16:
        if (-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", "SELECT payload FROM records WHERE batchId=?;",
               &self->_iteratePayloadStatement))
        {
LABEL_17:
          v6 = 1;
          atomic_store(1u, (unsigned __int8 *)&self->_configured);
          -[FLSQLitePersistence setUser:](self, "setUser:", v4);
          return v6;
        }
LABEL_29:
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_31;
        goto LABEL_30;
      }
      -[FLSQLitePersistence log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v11) = 0;
        _os_log_debug_impl(&dword_1B512E000, v9, OS_LOG_TYPE_DEBUG, "Database is not yet initialized by client", (uint8_t *)&v11, 2u);
      }

      -[FLSQLitePersistence closeDatabase](self, "closeDatabase");
LABEL_32:
      v6 = 0;
      break;
    default:
      goto LABEL_17;
  }
  return v6;
}

- (id)persist:(id)a3
{
  return -[FLSQLitePersistence persist:preferredBatchSize:](self, "persist:preferredBatchSize:", a3, 0);
}

- (id)persist:(id)a3 preferredBatchSize:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  os_signpost_id_t v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  sqlite3_stmt *insertRecordsStatement;
  id v13;
  sqlite3_stmt *v14;
  void *v15;
  double v16;
  int v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  int64x2_t v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  uint64_t v35;
  unint64_t maxBatchPayloadInBytes;
  unint64_t v37;
  unint64_t maxAllowedDatabaseSizeInBytes;
  const char *v39;
  int v40;
  unint64_t v41;
  __int16 v42;
  unint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (a4 <= 0x10000)
    v7 = 0x10000;
  else
    v7 = a4;
  v8 = os_signpost_id_generate((os_log_t)FL_LOG_SIGNPOSTS);
  if (objc_msgSend(v6, "length") > self->_maxBatchPayloadInBytes)
  {
    -[FLSQLitePersistence log](self, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v35 = objc_msgSend(v6, "length");
      maxBatchPayloadInBytes = self->_maxBatchPayloadInBytes;
      v40 = 134218240;
      v41 = v35;
      v42 = 2048;
      v43 = maxBatchPayloadInBytes;
      _os_log_error_impl(&dword_1B512E000, v9, OS_LOG_TYPE_ERROR, "Can't persist blob sizes(%lu) greater than maximum allowed(%llu)", (uint8_t *)&v40, 0x16u);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -5;
LABEL_36:
    objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("FLErrorDomain"), v11, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_37;
  }
  if (!-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 0))
  {
    -[FLSQLitePersistence log](self, "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_1B512E000, v24, OS_LOG_TYPE_ERROR, "Can't persist, initialization failed", (uint8_t *)&v40, 2u);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -4;
    goto LABEL_36;
  }
  if (!-[FLSQLitePersistence tryRolloverBatchIfNecessary:preferredBatchSize:](self, "tryRolloverBatchIfNecessary:preferredBatchSize:", objc_msgSend(v6, "length"), v7))
  {
    -[FLSQLitePersistence log](self, "log");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v40) = 0;
      _os_log_error_impl(&dword_1B512E000, v25, OS_LOG_TYPE_ERROR, "Detected necessary rollover, but couldn't succeed, failing persist request", (uint8_t *)&v40, 2u);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -6;
    goto LABEL_36;
  }
  sqlite3_reset(self->_insertRecordsStatement);
  sqlite3_bind_text(self->_insertRecordsStatement, 1, -[NSString UTF8String](self->_currentBatchIdentifier, "UTF8String"), -[NSString length](self->_currentBatchIdentifier, "length"), 0);
  insertRecordsStatement = self->_insertRecordsStatement;
  v13 = objc_retainAutorelease(v6);
  sqlite3_bind_blob(insertRecordsStatement, 2, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), 0);
  v14 = self->_insertRecordsStatement;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "timeIntervalSince1970");
  sqlite3_bind_int64(v14, 3, (uint64_t)v16);

  v17 = sqlite3_step(self->_insertRecordsStatement);
  if (v17 == 13)
  {
    -[FLSQLitePersistence log](self, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v37 = -[FLSQLitePersistence getCurrentDatabaseSize](self, "getCurrentDatabaseSize");
      maxAllowedDatabaseSizeInBytes = self->_maxAllowedDatabaseSizeInBytes;
      v40 = 134218240;
      v41 = v37;
      v42 = 2048;
      v43 = maxAllowedDatabaseSizeInBytes;
      _os_log_error_impl(&dword_1B512E000, v26, OS_LOG_TYPE_ERROR, "Database quota exceeded, using %llu out of %llu bytes, failing persist request", (uint8_t *)&v40, 0x16u);
    }

    v27 = (id)FL_LOG_SIGNPOSTS;
    v28 = v27;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B512E000, v28, OS_SIGNPOST_EVENT, v8, "database quota exceeded", ", (uint8_t *)&v40, 2u);
    }

    v10 = (void *)MEMORY[0x1E0CB35C8];
    v11 = -2;
    goto LABEL_36;
  }
  v18 = v17;
  if (v17 != 101)
  {
    v29 = (id)FL_LOG_SIGNPOSTS;
    v30 = v29;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_with_name_impl(&dword_1B512E000, v30, OS_SIGNPOST_EVENT, v8, "persist request failed", ", (uint8_t *)&v40, 2u);
    }

    -[FLSQLitePersistence log](self, "log");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v40 = 67109120;
      LODWORD(v41) = v18;
      _os_log_error_impl(&dword_1B512E000, v31, OS_LOG_TYPE_ERROR, "SQLite insertion failed: %d", (uint8_t *)&v40, 8u);
    }

    -[FLSQLitePersistence log](self, "log");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      v39 = sqlite3_errmsg(-[FLSQLitePersistence db](self, "db"));
      v40 = 136315138;
      v41 = (unint64_t)v39;
      _os_log_debug_impl(&dword_1B512E000, v32, OS_LOG_TYPE_DEBUG, "Failure detail: %s", (uint8_t *)&v40, 0xCu);
    }

    v33 = (void *)MEMORY[0x1E0CB35C8];
    v11 = sqlite3_errcode(-[FLSQLitePersistence db](self, "db"));
    v10 = v33;
    goto LABEL_36;
  }
  v19 = (id)FL_LOG_SIGNPOSTS;
  v20 = v19;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    LOWORD(v40) = 0;
    _os_signpost_emit_with_name_impl(&dword_1B512E000, v20, OS_SIGNPOST_EVENT, v8, "data persisted", ", (uint8_t *)&v40, 2u);
  }

  v21 = objc_msgSend(v13, "length");
  v22 = 0;
  v23 = vdupq_n_s64(1uLL);
  v23.i64[0] = v21;
  *(int64x2_t *)&self->_currentBatchPayloadSize = vaddq_s64(*(int64x2_t *)&self->_currentBatchPayloadSize, v23);
LABEL_37:

  return v22;
}

- (BOOL)open
{
  return -[FLSQLiteDatabaseConnection open](self->_dbConnection, "open");
}

- (BOOL)tryRolloverBatchIfNecessary:(unint64_t)a3 preferredBatchSize:(unint64_t)a4
{
  void *v7;
  NSObject *v8;
  id v9;
  const char *v10;
  unint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _BOOL4 v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  _BYTE v25[22];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (-[FLSQLitePersistence currentBatchPayloadSize](self, "currentBatchPayloadSize") <= a4)
    {
      v11 = -[FLSQLitePersistence currentBatchPayloadSize](self, "currentBatchPayloadSize") + a3;
      if (v11 <= -[FLSQLitePersistence maxBatchPayloadInBytes](self, "maxBatchPayloadInBytes"))
      {
        -[FLSQLitePersistence currentBatchCreationDate](self, "currentBatchCreationDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "timeIntervalSinceNow");
        v14 = -v13;
        -[FLSQLitePersistence batchMaximumDuration](self, "batchMaximumDuration");
        v16 = v15;

        if (v16 >= v14)
        {
LABEL_17:
          LOBYTE(v17) = 1;
          return v17;
        }
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          goto LABEL_12;
        -[FLSQLitePersistence currentBatchCreationDate](self, "currentBatchCreationDate");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v22 = v21;
        -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)v25 = 134218242;
        *(_QWORD *)&v25[4] = v22;
        *(_WORD *)&v25[12] = 2080;
        *(_QWORD *)&v25[14] = objc_msgSend(v23, "UTF8String");
        _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Batch exceeded maximum allowed life time (%f), rolling over Id(%s).", v25, 0x16u);

        goto LABEL_9;
      }
      -[FLSQLitePersistence log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)v25 = 136315138;
        *(_QWORD *)&v25[4] = objc_msgSend(v9, "UTF8String");
        v10 = "Batch exceeded maximum size, rolling over Id(%s)";
        goto LABEL_8;
      }
    }
    else
    {
      -[FLSQLitePersistence log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
        v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *(_DWORD *)v25 = 136315138;
        *(_QWORD *)&v25[4] = objc_msgSend(v9, "UTF8String");
        v10 = "Batch is already larger than preferred size, rolling over Id(%s)";
LABEL_8:
        _os_log_impl(&dword_1B512E000, v8, OS_LOG_TYPE_INFO, v10, v25, 0xCu);
LABEL_9:

      }
    }
LABEL_12:

  }
  v17 = -[FLSQLitePersistence initializeNewBatch](self, "initializeNewBatch", *(_OWORD *)v25);
  if (v17)
  {
    -[FLSQLitePersistence log](self, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      -[FLSQLitePersistence currentBatchIdentifier](self, "currentBatchIdentifier");
      v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v20 = objc_msgSend(v19, "UTF8String");
      *(_DWORD *)v25 = 136315138;
      *(_QWORD *)&v25[4] = v20;
      _os_log_debug_impl(&dword_1B512E000, v18, OS_LOG_TYPE_DEBUG, "Rolled over to new batch with Id(%s)", v25, 0xCu);

    }
    goto LABEL_17;
  }
  return v17;
}

- (BOOL)tryPrepare:(const char *)a3 preparedStatement:(sqlite3_stmt *)a4
{
  int v6;
  NSObject *v7;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = sqlite3_prepare_v2(-[FLSQLitePersistence db](self, "db"), a3, -1, a4, 0);
  if (v6)
  {
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 136315394;
      v10 = a3;
      v11 = 1024;
      v12 = v6;
      _os_log_error_impl(&dword_1B512E000, v7, OS_LOG_TYPE_ERROR, "SQLite statement (%s) prep failed: %d", (uint8_t *)&v9, 0x12u);
    }

  }
  return v6 == 0;
}

- (BOOL)executeSQLStatement:(const char *)a3 usingTransaction:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  int v12;
  int v13;
  NSObject *v14;
  char *errmsg;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  char *v22;
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  errmsg = 0;
  if (-[FLSQLitePersistence db](self, "db") || (v7 = -[FLSQLitePersistence open](self, "open")))
  {
    if (v4 && sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "BEGIN TRANSACTION;", 0, 0, 0))
    {
      -[FLSQLitePersistence log](self, "log");
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Failed to start transaction", buf, 2u);
      }

LABEL_18:
      LOBYTE(v7) = 0;
      return v7;
    }
    v9 = sqlite3_exec(-[FLSQLitePersistence db](self, "db"), a3, 0, 0, &errmsg);
    if (v9)
    {
      v10 = v9;
      -[FLSQLitePersistence log](self, "log");
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v18 = a3;
        v19 = 1024;
        v20 = v10;
        v21 = 2080;
        v22 = errmsg;
        _os_log_error_impl(&dword_1B512E000, v11, OS_LOG_TYPE_ERROR, "SQL statement failed - SQL:%s error-code: %d error-message: %s", buf, 0x1Cu);
      }

      sqlite3_free(errmsg);
      if (v4)
        sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "ROLLBACK;", 0, 0, 0);
      goto LABEL_18;
    }
    if (v4)
    {
      v12 = sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "COMMIT;", 0, 0, &errmsg);
      if (v12)
      {
        v13 = v12;
        -[FLSQLitePersistence log](self, "log");
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v18 = a3;
          v19 = 1024;
          v20 = v13;
          v21 = 2080;
          v22 = errmsg;
          _os_log_error_impl(&dword_1B512E000, v14, OS_LOG_TYPE_ERROR, "SQL statement failed - SQL:%s error-code: %d error-message: %s", buf, 0x1Cu);
        }

        sqlite3_free(errmsg);
        goto LABEL_18;
      }
    }
    LOBYTE(v7) = 1;
  }
  return v7;
}

- (BOOL)executeSQLStatement:(const char *)a3
{
  return -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", a3, 1);
}

- (BOOL)executeInTransactionMultipleSQLStatements:(id)a3
{
  id v4;
  NSObject *v5;
  BOOL v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  char *errmsg;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FLSQLitePersistence db](self, "db") || -[FLSQLitePersistence open](self, "open"))
  {
    v13 = 0;
    v14 = &v13;
    v15 = 0x2020000000;
    v16 = 1;
    if (sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "BEGIN TRANSACTION;", 0, 0, 0))
    {
      -[FLSQLitePersistence log](self, "log");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, v5, OS_LOG_TYPE_ERROR, "Failed to start transaction", buf, 2u);
      }

LABEL_7:
      v6 = 0;
LABEL_19:
      _Block_object_dispose(&v13, 8);
      goto LABEL_20;
    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__FLSQLitePersistence_executeInTransactionMultipleSQLStatements___block_invoke;
    v12[3] = &unk_1E68A3010;
    v12[4] = self;
    v12[5] = &v13;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v12);
    if (*((_BYTE *)v14 + 24))
    {
      errmsg = 0;
      v7 = sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "COMMIT;", 0, 0, &errmsg);
      if (v7)
      {
        -[FLSQLitePersistence log](self, "log");
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v18 = v7;
          v19 = 2080;
          v20 = errmsg;
          _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Failed to commit transaction - error-code: %d error-message: %s", buf, 0x12u);
        }

        sqlite3_free(errmsg);
        goto LABEL_7;
      }
    }
    else if (sqlite3_exec(-[FLSQLitePersistence db](self, "db"), "ROLLBACK;", 0, 0, 0))
    {
      -[FLSQLitePersistence log](self, "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B512E000, v9, OS_LOG_TYPE_ERROR, "Failed to rollback transaction", buf, 2u);
      }

    }
    v6 = *((_BYTE *)v14 + 24) != 0;
    goto LABEL_19;
  }
  v6 = 0;
LABEL_20:

  return v6;
}

- (BOOL)iteratePayloadForBatch:(id)a3 codeblock:(id)a4
{
  id v6;
  void (**v7)(id, void *, _BYTE *, void *);
  sqlite3_stmt *iteratePayloadStatement;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  const void *v13;
  void *v14;
  void *v15;
  char v16;
  int v17;
  char v18;
  NSObject *v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _BYTE *, void *))a4;
  sqlite3_reset(self->_iteratePayloadStatement);
  iteratePayloadStatement = self->_iteratePayloadStatement;
  v9 = objc_retainAutorelease(v6);
  v10 = sqlite3_bind_text(iteratePayloadStatement, 1, (const char *)objc_msgSend(v9, "UTF8String"), objc_msgSend(v9, "length"), 0);
  v11 = (void *)MEMORY[0x1B5E47614](v10);
  v25 = 0;
  while (1)
  {
    v12 = sqlite3_step(self->_iteratePayloadStatement);
    if (v12 != 100)
      break;
    v13 = sqlite3_column_blob(self->_iteratePayloadStatement, 0);
    if (sqlite3_errcode(-[FLSQLitePersistence db](self, "db")) == 7)
    {
      -[FLSQLitePersistence log](self, "log");
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      *(_WORD *)buf = 0;
      v21 = "SQLite payload blob iteration OOM";
      v22 = v19;
      v23 = 2;
      goto LABEL_15;
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13, sqlite3_column_bytes(self->_iteratePayloadStatement, 0));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[FLSQLitePersistence context](self, "context");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v14, &v25, v15);

    if (v25)
    {
      v16 = 1;
LABEL_8:
      v18 = 1;
      goto LABEL_13;
    }
  }
  v17 = v12;
  if (v12 == 101)
  {
    v16 = 0;
    goto LABEL_8;
  }
  -[FLSQLitePersistence log](self, "log");
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    v20 = objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
    *(_DWORD *)buf = 136315394;
    v27 = v20;
    v28 = 1024;
    v29 = v17;
    v21 = "SQLite iterate payload for batch (%s) failed: %d";
    v22 = v19;
    v23 = 18;
LABEL_15:
    _os_log_error_impl(&dword_1B512E000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
  }
LABEL_12:

  v16 = 0;
  v18 = 0;
LABEL_13:
  objc_autoreleasePoolPop(v11);

  return v16 | v18;
}

- (BOOL)getIntValueForPragma:(id)a3 into:(int *)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  BOOL v10;
  NSObject *v11;
  sqlite3_stmt *pStmt;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void *)MEMORY[0x1B5E47614]();
  pStmt = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("PRAGMA %@;"), v6);
  v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v9 = objc_msgSend(v8, "UTF8String");

  if (!-[FLSQLitePersistence tryPrepare:preparedStatement:](self, "tryPrepare:preparedStatement:", v9, &pStmt))
  {
LABEL_7:
    v10 = 0;
    goto LABEL_8;
  }
  if (sqlite3_step(pStmt) != 100)
  {
    sqlite3_finalize(pStmt);
    -[FLSQLitePersistence log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v6;
      _os_log_error_impl(&dword_1B512E000, v11, OS_LOG_TYPE_ERROR, "Could not infer PRAGMA %@", buf, 0xCu);
    }

    goto LABEL_7;
  }
  *a4 = sqlite3_column_int(pStmt, 0);
  sqlite3_finalize(pStmt);
  v10 = 1;
LABEL_8:
  objc_autoreleasePoolPop(v7);

  return v10;
}

- (BOOL)createDatabase
{
  _BOOL4 v3;

  v3 = -[FLSQLitePersistence open](self, "open");
  if (v3)
    LOBYTE(v3) = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", "PRAGMA foreign_keys=ON;",
                   0);
  return v3;
}

- (void)closeDatabase
{
  NSObject *v3;
  uint8_t v4[16];

  -[FLSQLitePersistence log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v4 = 0;
    _os_log_debug_impl(&dword_1B512E000, v3, OS_LOG_TYPE_DEBUG, "Closing database file", v4, 2u);
  }

  -[FLSQLiteDatabaseConnection close](self->_dbConnection, "close");
}

- (BOOL)deleteDatabase
{
  NSObject *v3;
  NSObject *v4;
  const char *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (!-[FLSQLiteDatabaseConnection db](self->_dbConnection, "db"))
    return 1;
  -[FLSQLitePersistence log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_1B512E000, v3, OS_LOG_TYPE_DEBUG, "Resetting to an empty database file.", (uint8_t *)&v7, 2u);
  }

  -[FLSQLiteDatabaseConnection db](self->_dbConnection, "db");
  if (!_sqlite3_db_truncate())
    return 1;
  -[FLSQLitePersistence log](self, "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v6 = sqlite3_errmsg(-[FLSQLiteDatabaseConnection db](self->_dbConnection, "db"));
    v7 = 136315138;
    v8 = v6;
    _os_log_error_impl(&dword_1B512E000, v4, OS_LOG_TYPE_ERROR, "%s", (uint8_t *)&v7, 0xCu);
  }

  return 0;
}

- (BOOL)deleteAllUploadsQueuedBefore:(id)a3
{
  id v4;
  double v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  id v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[FLSQLitePersistence initializeConnectionForUseBy:](self, "initializeConnectionForUseBy:", 1))
  {
    objc_msgSend(v4, "timeIntervalSince1970");
    v6 = (uint64_t)v5;
    -[FLSQLitePersistence log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v17 = v6;
      _os_log_debug_impl(&dword_1B512E000, v7, OS_LOG_TYPE_DEBUG, "Deleting all uploads queued before %lld (timestampInSecondsSince1970)", buf, 0xCu);
    }

    v8 = (void *)MEMORY[0x1B5E47614]();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM fileUploads WHERE dateCreated <= %lld;"),
      v6);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v10 = -[FLSQLitePersistence executeSQLStatement:usingTransaction:](self, "executeSQLStatement:usingTransaction:", objc_msgSend(v9, "UTF8String"), 0);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM records     WHERE dateCreated <= %lld;"),
      v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM batchStatus WHERE dateCreated <= %lld;"),
      v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(self) = v10 & -[FLSQLitePersistence executeInTransactionMultipleSQLStatements:](self, "executeInTransactionMultipleSQLStatements:", v13);

    objc_autoreleasePoolPop(v8);
  }
  else
  {
    -[FLSQLitePersistence log](self, "log");
    self = (FLSQLitePersistence *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&self->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1B512E000, &self->super, OS_LOG_TYPE_ERROR, "deleteAllQueuedFileAndBatchedRecordUploads: initializeConnection failed", buf, 2u);
    }

    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (FLLoggingContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (sqlite3_stmt)insertRecordsStatement
{
  return self->_insertRecordsStatement;
}

- (void)setInsertRecordsStatement:(sqlite3_stmt *)a3
{
  self->_insertRecordsStatement = a3;
}

- (sqlite3_stmt)iteratePayloadStatement
{
  return self->_iteratePayloadStatement;
}

- (void)setIteratePayloadStatement:(sqlite3_stmt *)a3
{
  self->_iteratePayloadStatement = a3;
}

- (NSString)storeIdentifier
{
  return self->_storeIdentifier;
}

- (BOOL)configured
{
  unsigned __int8 v2;

  v2 = atomic_load((unsigned __int8 *)&self->_configured);
  return v2 & 1;
}

- (void)setConfigured:(BOOL)a3
{
  atomic_store(a3, (unsigned __int8 *)&self->_configured);
}

- (unint64_t)maxBatchPayloadInBytes
{
  return self->_maxBatchPayloadInBytes;
}

- (void)setMaxBatchPayloadInBytes:(unint64_t)a3
{
  self->_maxBatchPayloadInBytes = a3;
}

- (unint64_t)maxAllowedDatabaseSizeInBytes
{
  return self->_maxAllowedDatabaseSizeInBytes;
}

- (void)setMaxAllowedDatabaseSizeInBytes:(unint64_t)a3
{
  self->_maxAllowedDatabaseSizeInBytes = a3;
}

- (void)setCurrentBatchIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSDate)currentBatchCreationDate
{
  return self->_currentBatchCreationDate;
}

- (unint64_t)currentBatchPayloadSize
{
  return self->_currentBatchPayloadSize;
}

- (void)setCurrentBatchPayloadSize:(unint64_t)a3
{
  self->_currentBatchPayloadSize = a3;
}

- (unint64_t)currentBatchEventCount
{
  return self->_currentBatchEventCount;
}

- (void)setCurrentBatchEventCount:(unint64_t)a3
{
  self->_currentBatchEventCount = a3;
}

- (double)batchMaximumDuration
{
  return self->_batchMaximumDuration;
}

- (void)setBatchMaximumDuration:(double)a3
{
  self->_batchMaximumDuration = a3;
}

- (sqlite3_stmt)maxRowIdStatement
{
  return self->_maxRowIdStatement;
}

- (void)setMaxRowIdStatement:(sqlite3_stmt *)a3
{
  self->_maxRowIdStatement = a3;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (FLSQLiteDatabaseConnection)dbConnection
{
  return self->_dbConnection;
}

- (void)setDbConnection:(id)a3
{
  objc_storeStrong((id *)&self->_dbConnection, a3);
}

- (int)user
{
  return self->_user;
}

- (void)setUser:(int)a3
{
  self->_user = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dbConnection, 0);
  objc_storeStrong((id *)&self->_currentBatchCreationDate, 0);
  objc_storeStrong((id *)&self->_currentBatchIdentifier, 0);
  objc_storeStrong((id *)&self->_storeIdentifier, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_databasePath, 0);
}

void __65__FLSQLitePersistence_executeInTransactionMultipleSQLStatements___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char v7;
  uint64_t v8;
  char v9;
  NSObject *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = objc_retainAutorelease(a2);
  v7 = objc_msgSend(*(id *)(a1 + 32), "executeSQLStatement:usingTransaction:", objc_msgSend(v6, "UTF8String"), 0);
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v8 + 24))
    v9 = v7;
  else
    v9 = 0;
  *(_BYTE *)(v8 + 24) = v9;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    objc_msgSend(*(id *)(a1 + 32), "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_1B512E000, v10, OS_LOG_TYPE_ERROR, "Failed to execute (%@) in set, rolling back", (uint8_t *)&v11, 0xCu);
    }

  }
}

- (void)finalizeObserver
{
  if (-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement"))
  {
    sqlite3_finalize(-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement"));
    -[FLSQLitePersistence setMaxRowIdStatement:](self, "setMaxRowIdStatement:", 0);
  }
}

- (int64_t)maxRowId
{
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  sqlite3_int64 v6;
  __int16 v8;
  __int16 v9;
  sqlite3_stmt *ppStmt;

  if (!-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement"))
  {
    ppStmt = 0;
    if (sqlite3_prepare_v2(-[FLSQLitePersistence db](self, "db"), "SELECT MAX(ROWID) FROM records;", -1, &ppStmt, 0) == 1)
    {
      -[FLSQLitePersistence log](self, "log");
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        v9 = 0;
        v4 = "Max ID calculation failed to prepare statement";
        v5 = (uint8_t *)&v9;
LABEL_12:
        _os_log_error_impl(&dword_1B512E000, v3, OS_LOG_TYPE_ERROR, v4, v5, 2u);
        goto LABEL_8;
      }
      goto LABEL_8;
    }
    -[FLSQLitePersistence setMaxRowIdStatement:](self, "setMaxRowIdStatement:", ppStmt);
  }
  if (sqlite3_step(-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement")) != 1)
  {
    v6 = sqlite3_column_int64(-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement"), 0);
    sqlite3_reset(-[FLSQLitePersistence maxRowIdStatement](self, "maxRowIdStatement"));
    return v6;
  }
  -[FLSQLitePersistence log](self, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v8 = 0;
    v4 = "Max ID calculation failed to run";
    v5 = (uint8_t *)&v8;
    goto LABEL_12;
  }
LABEL_8:

  return 0;
}

- (id)registerInsertionObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FLSQLitePersistence open](self, "open");
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v21 = -[FLSQLitePersistence maxRowId](self, "maxRowId");
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v17 = 0;
  v17 = v19[3] + 1;
  -[FLSQLitePersistence log](self, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v11 = v19[3];
    *(_DWORD *)buf = 134217984;
    v23 = v11;
    _os_log_debug_impl(&dword_1B512E000, v5, OS_LOG_TYPE_DEBUG, "Registering new insertion observer, starting max row: %lld", buf, 0xCu);
  }

  -[FLSQLitePersistence context](self, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v7);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__FLSQLitePersistence_Observer__registerInsertionObserver___block_invoke;
  v12[3] = &unk_1E68A30C8;
  v14 = &v18;
  v15 = v16;
  v12[4] = self;
  v13 = v4;
  v9 = v4;
  dispatch_source_set_event_handler(v8, v12);
  dispatch_source_set_timer(v8, 0, 0x3B9ACA00uLL, 0x3B9ACA00uLL);
  dispatch_activate(v8);

  _Block_object_dispose(v16, 8);
  _Block_object_dispose(&v18, 8);
  return v8;
}

- (void)observeInsertionAtRow:(int64_t)a3 observer:(id)a4
{
  void (**v6)(id, NSObject *);
  const void *v7;
  NSObject *v8;
  uint8_t v9[8];
  sqlite3_stmt *ppStmt;

  v6 = (void (**)(id, NSObject *))a4;
  ppStmt = 0;
  if (sqlite3_prepare_v2(-[FLSQLitePersistence db](self, "db"), "SELECT payload FROM records WHERE rowId=?;",
         -1,
         &ppStmt,
         0)
    || sqlite3_bind_int64(ppStmt, 1, a3)
    || sqlite3_step(ppStmt) != 100)
  {
    -[FLSQLitePersistence log](self, "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v9 = 0;
      _os_log_error_impl(&dword_1B512E000, v8, OS_LOG_TYPE_ERROR, "Row insertion observer failed", v9, 2u);
    }
  }
  else
  {
    v7 = sqlite3_column_blob(ppStmt, 0);
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v7, sqlite3_column_bytes(ppStmt, 0));
    v8 = objc_claimAutoreleasedReturnValue();
    v6[2](v6, v8);
    sqlite3_finalize(ppStmt);
  }

}

uint64_t __59__FLSQLitePersistence_Observer__registerInsertionObserver___block_invoke(uint64_t a1)
{
  uint64_t result;
  __int128 v3;
  NSObject *v4;
  uint64_t v5;
  __int128 v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = objc_msgSend(*(id *)(a1 + 32), "maxRowId");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                + 24))
  {
    *(_QWORD *)&v3 = 134217984;
    v6 = v3;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "log", v6);
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        *(_DWORD *)buf = v6;
        v8 = v5;
        _os_log_debug_impl(&dword_1B512E000, v4, OS_LOG_TYPE_DEBUG, "Informing observer about insertion at row: %lld", buf, 0xCu);
      }

      result = objc_msgSend(*(id *)(a1 + 32), "observeInsertionAtRow:observer:", (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))++, *(_QWORD *)(a1 + 40));
    }
    while (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) <= *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                 + 8)
                                                                                     + 24));
  }
  return result;
}

@end
