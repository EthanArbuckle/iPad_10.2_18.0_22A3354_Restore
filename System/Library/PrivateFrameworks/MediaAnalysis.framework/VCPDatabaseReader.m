@implementation VCPDatabaseReader

+ (BOOL)shouldQueryInternalFields
{
  return 0;
}

- (VCPDatabaseReader)initWithPhotoLibrary:(id)a3
{
  id v4;
  VCPDatabaseReader *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *sqlSerialQueue;
  uint64_t v8;
  NSString *filepath;
  VCPDatabaseReader *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VCPDatabaseReader;
  v5 = -[VCPDatabaseReader init](&v12, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    if (v4)
      objc_msgSend(v4, "vcp_mediaAnalysisDatabaseFilepath");
    else
      objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultMediaAnalysisDatabaseFilepath");
    v8 = objc_claimAutoreleasedReturnValue();
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v8;

    v5->_database = 0;
    v10 = v5;
  }

  return v5;
}

- (VCPDatabaseReader)initWithPhotoLibraryURL:(id)a3
{
  id v4;
  VCPDatabaseReader *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *sqlSerialQueue;
  __CFString *v8;
  void *v9;
  uint64_t v10;
  NSString *filepath;
  VCPDatabaseReader *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)VCPDatabaseReader;
  v5 = -[VCPDatabaseReader init](&v14, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    if ((objc_msgSend(MEMORY[0x1E0CD16F0], "isSystemPhotoLibraryURL:", v4) & 1) != 0)
    {
      v8 = CFSTR("/var/mobile/Media/MediaAnalysis");
    }
    else
    {
      objc_msgSend(v4, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("private/com.apple.mediaanalysisd/MediaAnalysis"));
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    -[__CFString stringByAppendingPathComponent:](v8, "stringByAppendingPathComponent:", CFSTR("mediaanalysis.db"));
    v10 = objc_claimAutoreleasedReturnValue();
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v10;

    v5->_database = 0;
    v12 = v5;

  }
  return v5;
}

- (VCPDatabaseReader)initWithDatabaseURL:(id)a3
{
  id v4;
  VCPDatabaseReader *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *sqlSerialQueue;
  uint64_t v8;
  NSString *filepath;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VCPDatabaseReader;
  v5 = -[VCPDatabaseReader init](&v11, sel_init);
  if (v5)
  {
    v6 = dispatch_queue_create("com.apple.mediaanalysis.sql", 0);
    sqlSerialQueue = v5->_sqlSerialQueue;
    v5->_sqlSerialQueue = (OS_dispatch_queue *)v6;

    objc_msgSend(v4, "absoluteString");
    v8 = objc_claimAutoreleasedReturnValue();
    filepath = v5->_filepath;
    v5->_filepath = (NSString *)v8;

    v5->_database = 0;
  }

  return v5;
}

+ (id)databaseForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPhotoLibrary:", v3);

  return v4;
}

+ (id)databaseForPhotoLibraryURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithPhotoLibraryURL:", v3);

  return v4;
}

+ (id)databaseWithURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDatabaseURL:", v3);

  return v4;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_close(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)VCPDatabaseReader;
  -[VCPDatabaseReader dealloc](&v3, sel_dealloc);
}

- (BOOL)exists
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = objc_msgSend(v3, "fileExistsAtPath:", self->_filepath);

  return (char)self;
}

- (id)databaseDirectoryPath
{
  return -[NSString stringByDeletingLastPathComponent](self->_filepath, "stringByDeletingLastPathComponent");
}

- (int)openDatabase
{
  void *v3;
  char v4;
  const char *v5;
  sqlite3 **p_database;
  int v7;
  int v8;
  int result;
  int v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", self->_filepath);

  if ((v4 & 1) != 0)
  {
    v5 = -[NSString UTF8String](self->_filepath, "UTF8String");
    p_database = &self->_database;
    v7 = sqlite3_open(v5, p_database);
    if (v7)
    {
      v8 = v7;
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v11[0] = 67109120;
        v11[1] = v8;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Failed to open database: %d", (uint8_t *)v11, 8u);
      }
    }
    else
    {
      result = sqlite3_busy_handler(*p_database, (int (__cdecl *)(void *, int))busyHandler, 0);
      if (!result)
        return result;
      v10 = result;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        -[VCPDatabaseReader openDatabase].cold.1(v10);
    }
    *p_database = 0;
  }
  else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LOWORD(v11[0]) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] No database file exists", (uint8_t *)v11, 2u);
  }
  return -23;
}

- (void)closeDatabase
{
  sqlite3_close(self->_database);
  self->_database = 0;
}

- (int)parseHeader:(sqlite3_stmt *)a3 startColumn:(int)a4 analysis:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(a3, a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("version"));

  if (sqlite3_column_type(a3, a4 + 1) == 5)
  {
    v9 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a3, a4 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("dateModified"));

  if (sqlite3_column_type(a3, a4 + 2) == 5)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(a3, a4 + 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("dateAnalyzed"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 3));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, CFSTR("performedAnalysisTypes"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", sqlite3_column_int(a3, a4 + 4));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v12, CFSTR("flags"));

  if (sqlite3_column_double(a3, a4 + 5) != -1.0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, CFSTR("quality"));

  }
  if (sqlite3_column_type(a3, a4 + 6) == 5)
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a3, a4 + 6));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  if (sqlite3_column_type(a3, a4 + 7) == 5)
  {
    v15 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(a3, a4 + 7));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  +[VCPFingerprint fingerprintWithMaster:adjusted:](VCPFingerprint, "fingerprintWithMaster:adjusted:", v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vcp_setFingerprint:", v16);

  if (objc_msgSend((id)objc_opt_class(), "shouldQueryInternalFields"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int64(a3, a4 + 8));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, CFSTR("statsFlags"));

  }
  if ((int)objc_msgSend(v7, "vcp_version") < 3 && (objc_msgSend(v7, "vcp_types") & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "vcp_types") | 8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, CFSTR("performedAnalysisTypes"));

  }
  return 0;
}

- (int)parseResults:(sqlite3_stmt *)a3 typeColumn:(int)a4 dataColumn:(int)a5 results:(id)a6
{
  id v9;
  int v10;
  void *v11;
  const void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  id v21;
  uint8_t buf[4];
  int v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v9 = a6;
  v10 = sqlite3_column_int(a3, a4);
  if (sqlite3_column_type(a3, a5) == 5
    || (v11 = (void *)MEMORY[0x1E0C99D50],
        v12 = sqlite3_column_blob(a3, a5),
        objc_msgSend(v11, "dataWithBytesNoCopy:length:freeWhenDone:", v12, sqlite3_column_bytes(a3, a5), 0),
        (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_10:
    v19 = -18;
    goto LABEL_11;
  }
  v21 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v13, 0, 0, &v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v21;
  v16 = v15;
  if (!v14)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v16, "description");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109378;
      v23 = a5;
      v24 = 2112;
      v25 = v18;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to extract NSArray from column %d (%@)", buf, 0x12u);

    }
    goto LABEL_10;
  }

  MediaAnalysisResultsTypeToKey(v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    objc_msgSend(v9, "setObject:forKey:", v14, v17);
  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v23 = v10;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MediaAnalysis] Unknown result key for result type %u", buf, 8u);
  }

  v19 = 0;
LABEL_11:

  return v19;
}

- (int)queryHeaderForAsset:(id)a3 analysis:(id *)a4 assetId:(int64_t *)a5
{
  id v8;
  void *v9;
  sqlite3 *database;
  id v11;
  int v12;
  sqlite3_stmt *v13;
  id v14;
  void *v15;
  int v16;
  char *v17;
  int v18;
  id v19;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v24 = 1024;
    v25 = 228;
    v26 = 2080;
    v27 = "-[VCPDatabaseReader queryHeaderForAsset:analysis:assetId:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  ppStmt = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT id, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "shouldQueryInternalFields"))
    objc_msgSend(v9, "appendString:", CFSTR(", statsFlags"));
  objc_msgSend(v9, "appendString:", CFSTR(" FROM Assets WHERE localIdentifier=(?);"));
  database = self->_database;
  v11 = objc_retainAutorelease(v9);
  v12 = sqlite3_prepare_v2(database, (const char *)objc_msgSend(v11, "UTF8String"), -1, &ppStmt, 0);
  if (!v12)
  {
    v13 = ppStmt;
    v14 = v8;
    v15 = v14;
    v16 = v14
        ? sqlite3_bind_text(v13, 1, (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"), -1, 0)
        : sqlite3_bind_null(v13, 1);
    v12 = v16;

    if (!v12)
    {
      v17 = sqlite3_expanded_sql(ppStmt);
      if (v17)
      {
        if (MediaAnalysisEnableDatabaseLog()
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v23 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          v24 = 1024;
          v25 = 243;
          v26 = 2080;
          v27 = v17;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
        sqlite3_free(v17);
      }
      v18 = sqlite3_step(ppStmt);
      if (v18 == 100)
      {
        *a5 = sqlite3_column_int(ppStmt, 0);
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        *a4 = v19;
        v12 = -[VCPDatabaseReader parseHeader:startColumn:analysis:](self, "parseHeader:startColumn:analysis:", ppStmt, 1, v19);
        if (v12)
          goto LABEL_22;
        v18 = sqlite3_step(ppStmt);
      }
      if (v18 == 101)
        v12 = 0;
      else
        v12 = v18;
    }
  }
LABEL_22:
  sqlite3_finalize(ppStmt);

  return v12;
}

- (int)queryResultsForAssetId:(int64_t)a3 analysis:(id)a4
{
  id v6;
  void *v7;
  int v8;
  char *v10;
  int v11;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v15 = 1024;
    v16 = 264;
    v17 = 2080;
    v18 = "-[VCPDatabaseReader queryResultsForAssetId:analysis:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  ppStmt = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = sqlite3_prepare_v2(self->_database, "SELECT resultsType, results FROM Results WHERE assetId=(?);",
         -1,
         &ppStmt,
         0);
  if (!v8)
  {
    v8 = sqlite3_bind_int64(ppStmt, 1, a3);
    if (!v8)
    {
      v10 = sqlite3_expanded_sql(ppStmt);
      if (v10)
      {
        if (MediaAnalysisEnableDatabaseLog()
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          v15 = 1024;
          v16 = 273;
          v17 = 2080;
          v18 = v10;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
        sqlite3_free(v10);
      }
      while (1)
      {
        v11 = sqlite3_step(ppStmt);
        if (v11 != 100)
          break;
        v8 = -[VCPDatabaseReader parseResults:typeColumn:dataColumn:results:](self, "parseResults:typeColumn:dataColumn:results:", ppStmt, 0, 1, v7);
        if (v8)
          goto LABEL_6;
      }
      if (v11 == 101)
      {
        if (objc_msgSend(v7, "count"))
          objc_msgSend(v6, "setObject:forKey:", v7, CFSTR("metadataRanges"));
        v8 = 0;
      }
      else
      {
        v8 = -18;
      }
    }
  }
LABEL_6:
  sqlite3_finalize(ppStmt);

  return v8;
}

- (int)queryResultsForAssetId:(int64_t)a3 withTypes:(id)a4 analysis:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  unint64_t i;
  sqlite3 *database;
  id v14;
  int v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t j;
  sqlite3_int64 v21;
  char *v22;
  int v23;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  sqlite3_stmt *ppStmt;
  uint8_t v32[128];
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v34 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v35 = 1024;
    v36 = 297;
    v37 = 2080;
    v38 = "-[VCPDatabaseReader queryResultsForAssetId:withTypes:analysis:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (v8 && !objc_msgSend(v8, "count"))
  {
    v15 = 0;
  }
  else
  {
    ppStmt = 0;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT resultsType, results FROM Results WHERE assetId=(?"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v11, "appendString:", CFSTR(") AND resultsType IN (?"));
      for (i = 1; i < objc_msgSend(v8, "count"); ++i)
        objc_msgSend(v11, "appendString:", CFSTR(",?"));
    }
    objc_msgSend(v11, "appendString:", CFSTR(");"));
    database = self->_database;
    v14 = objc_retainAutorelease(v11);
    v15 = sqlite3_prepare_v2(database, (const char *)objc_msgSend(v14, "UTF8String"), -1, &ppStmt, 0);
    if (!v15)
    {
      v15 = sqlite3_bind_int64(ppStmt, 1, a3);
      if (!v15)
      {
        v25 = v10;
        v26 = v9;
        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v16 = v8;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v17)
        {
          v18 = *(_QWORD *)v28;
          v19 = 2;
          while (2)
          {
            for (j = 0; j != v17; ++j)
            {
              if (*(_QWORD *)v28 != v18)
                objc_enumerationMutation(v16);
              v21 = objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "unsignedIntegerValue", v25, v26, (_QWORD)v27);
              v15 = sqlite3_bind_int64(ppStmt, v19 + j, v21);
              if (v15)
              {

                v10 = v25;
                v9 = v26;
                goto LABEL_36;
              }
            }
            v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
            v19 += j;
            if (v17)
              continue;
            break;
          }
        }

        v10 = v25;
        v9 = v26;
        v22 = sqlite3_expanded_sql(ppStmt);
        if (v22)
        {
          if (MediaAnalysisEnableDatabaseLog()
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v34 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            v35 = 1024;
            v36 = 322;
            v37 = 2080;
            v38 = v22;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
          sqlite3_free(v22);
        }
        while (1)
        {
          v23 = sqlite3_step(ppStmt);
          if (v23 != 100)
            break;
          v15 = -[VCPDatabaseReader parseResults:typeColumn:dataColumn:results:](self, "parseResults:typeColumn:dataColumn:results:", ppStmt, 0, 1, v25);
          if (v15)
            goto LABEL_36;
        }
        if (v23 && v23 != 101)
        {
          v15 = -18;
        }
        else
        {
          if (objc_msgSend(v25, "count", v25, v26))
            objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("metadataRanges"));
          v15 = 0;
        }
      }
    }
LABEL_36:
    sqlite3_finalize(ppStmt);

  }
  return v15;
}

- (int)queryHeadersForAssets:(id)a3 analyses:(id)a4 idMap:(id)a5
{
  id v7;
  void *v8;
  unint64_t i;
  sqlite3 *database;
  int v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t j;
  sqlite3_stmt *v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  int v22;
  sqlite3_stmt *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  id v30;
  id v31;
  id v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  _BYTE buf[12];
  __int16 v40;
  int v41;
  __int16 v42;
  const char *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v31 = a4;
  v32 = a5;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v40 = 1024;
    v41 = 346;
    v42 = 2080;
    v43 = "-[VCPDatabaseReader queryHeadersForAssets:analyses:idMap:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT id, localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "shouldQueryInternalFields"))
    objc_msgSend(v8, "appendString:", CFSTR(", statsFlags"));
  objc_msgSend(v8, "appendString:", CFSTR(" FROM Assets WHERE localIdentifier IN (?"));
  for (i = 1; i < objc_msgSend(v7, "count"); ++i)
    objc_msgSend(v8, "appendString:", CFSTR(",?"));
  objc_msgSend(v8, "appendString:", CFSTR(");"));
  database = self->_database;
  v30 = objc_retainAutorelease(v8);
  v11 = sqlite3_prepare_v2(database, (const char *)objc_msgSend(v30, "UTF8String"), -1, (sqlite3_stmt **)buf, 0);
  if (!v11)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v35;
      v15 = 1;
      while (2)
      {
        for (j = 0; j != v13; ++j)
        {
          if (*(_QWORD *)v35 != v14)
            objc_enumerationMutation(v12);
          v17 = *(sqlite3_stmt **)buf;
          v18 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * j);
          v19 = v18;
          if (v18)
            v20 = sqlite3_bind_text(v17, v15 + j, (const char *)objc_msgSend(objc_retainAutorelease(v18), "UTF8String"), -1, 0);
          else
            v20 = sqlite3_bind_null(v17, v15 + j);
          v11 = v20;

          if (v11)
          {

            goto LABEL_31;
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
        v15 += j;
        if (v13)
          continue;
        break;
      }
    }

    v21 = sqlite3_step(*(sqlite3_stmt **)buf);
    if (v21 == 100)
    {
      while (1)
      {
        v22 = sqlite3_column_int(*(sqlite3_stmt **)buf, 0);
        v23 = *(sqlite3_stmt **)buf;
        if (sqlite3_column_type(*(sqlite3_stmt **)buf, 1) == 5)
        {
          v24 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v23, 1));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v25 = v22;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v22);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKey:", v24, v26);

        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = -[VCPDatabaseReader parseHeader:startColumn:analysis:](self, "parseHeader:startColumn:analysis:", *(_QWORD *)buf, 2, v27);
        if (v11)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKey:", v27, v28);

        v21 = sqlite3_step(*(sqlite3_stmt **)buf);
        if (v21 != 100)
          goto LABEL_27;
      }

    }
    else
    {
LABEL_27:
      if (v21 == 101)
        v11 = 0;
      else
        v11 = v21;
    }
  }
LABEL_31:
  sqlite3_finalize(*(sqlite3_stmt **)buf);

  return v11;
}

- (int)queryResultsForAssets:(id)a3 withTypes:(id)a4 batchResults:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  unint64_t i;
  unint64_t j;
  sqlite3 *database;
  int v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  sqlite3_int64 v21;
  int v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  sqlite3_int64 v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t m;
  uint64_t v33;
  void *v34;
  void *v35;
  int v36;
  int v38;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  sqlite3_stmt *ppStmt;
  _BYTE v55[128];
  _BYTE v56[128];
  uint8_t v57[128];
  uint8_t buf[4];
  const char *v59;
  __int16 v60;
  int v61;
  __int16 v62;
  const char *v63;
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  v41 = v8;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v59 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v60 = 1024;
    v61 = 401;
    v62 = 2080;
    v63 = "-[VCPDatabaseReader queryResultsForAssets:withTypes:batchResults:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (v8 && !objc_msgSend(v8, "count"))
  {
    v14 = 0;
  }
  else
  {
    ppStmt = 0;
    objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT assetId, resultsType, results FROM Results WHERE assetId IN (?"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 1; i < objc_msgSend(v7, "count"); ++i)
      objc_msgSend(v10, "appendString:", CFSTR(",?"));
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v10, "appendString:", CFSTR(") AND resultsType IN (?"));
      for (j = 1; j < objc_msgSend(v8, "count"); ++j)
        objc_msgSend(v10, "appendString:", CFSTR(",?"));
    }
    objc_msgSend(v10, "appendString:", CFSTR(");"));
    database = self->_database;
    v40 = objc_retainAutorelease(v10);
    v14 = sqlite3_prepare_v2(database, (const char *)objc_msgSend(v40, "UTF8String"), -1, &ppStmt, 0);
    if (!v14)
    {
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v15 = v7;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
      if (v16)
      {
        v17 = *(_QWORD *)v51;
        v18 = 1;
        while (2)
        {
          v19 = 0;
          v20 = v18;
          do
          {
            if (*(_QWORD *)v51 != v17)
              objc_enumerationMutation(v15);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * v19), "unsignedIntegerValue");
            v14 = sqlite3_bind_int64(ppStmt, v20 + v19, v21);
            if (v14)
            {

              goto LABEL_59;
            }
            ++v19;
          }
          while (v16 != v19);
          v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v50, v57, 16);
          v18 = v20 + v19;
          if (v16)
            continue;
          break;
        }
        v22 = v20 + v19;
      }
      else
      {
        v22 = 1;
      }

      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v23 = v41;
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
      if (v24)
      {
        v25 = *(_QWORD *)v47;
        while (2)
        {
          for (k = 0; k != v24; ++k)
          {
            if (*(_QWORD *)v47 != v25)
              objc_enumerationMutation(v23);
            v27 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * k), "unsignedIntegerValue");
            v14 = sqlite3_bind_int64(ppStmt, v22 + k, v27);
            if (v14)
            {

              goto LABEL_59;
            }
          }
          v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v46, v56, 16);
          v22 += k;
          if (v24)
            continue;
          break;
        }
      }

      v28 = sqlite3_expanded_sql(ppStmt);
      if (v28)
      {
        if (MediaAnalysisEnableDatabaseLog()
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v59 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          v60 = 1024;
          v61 = 435;
          v62 = 2080;
          v63 = v28;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
        sqlite3_free(v28);
      }
      v38 = sqlite3_step(ppStmt);
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v29 = v15;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
      if (v30)
      {
        v31 = *(_QWORD *)v43;
        do
        {
          for (m = 0; m != v30; ++m)
          {
            if (*(_QWORD *)v43 != v31)
              objc_enumerationMutation(v29);
            v33 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * m);
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v34, v33);

          }
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v42, v55, 16);
        }
        while (v30);
      }
      while (1)
      {

        if (v38 != 100)
          break;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", sqlite3_column_int(ppStmt, 0));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v35);
        v29 = (id)objc_claimAutoreleasedReturnValue();

        if (!v29)
        {
          v14 = -18;
          goto LABEL_59;
        }
        v14 = -[VCPDatabaseReader parseResults:typeColumn:dataColumn:results:](self, "parseResults:typeColumn:dataColumn:results:", ppStmt, 1, 2, v29);
        if (v14)
        {

          goto LABEL_59;
        }
        v38 = sqlite3_step(ppStmt);
      }
      if (v38 == 101)
        v36 = 0;
      else
        v36 = -18;
      if (v38)
        v14 = v36;
      else
        v14 = 0;
    }
LABEL_59:
    sqlite3_finalize(ppStmt);

  }
  return v14;
}

- (int)executeDatabaseBlock:(id)a3
{
  id v4;
  NSObject *sqlSerialQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  sqlSerialQueue = self->_sqlSerialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__VCPDatabaseReader_executeDatabaseBlock___block_invoke;
  block[3] = &unk_1E6B176F8;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(sqlSerialQueue, block);
  LODWORD(sqlSerialQueue) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)sqlSerialQueue;
}

void __42__VCPDatabaseReader_executeDatabaseBlock___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v5 = 67109120;
        v6 = v2;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Database already opened, failed to execute query block: %d", (uint8_t *)&v5, 8u);
      }
    }
  }
  v3 = *(_QWORD **)(a1 + 32);
  if (!v3[3] || *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    objc_msgSend(v3, "closeDatabase");
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "openDatabase");
    if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
      {
        if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
          v5 = 67109120;
          v6 = v4;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[VCPDatabaseReader] Failed to execute query block: %d", (uint8_t *)&v5, 8u);
        }
      }
    }
  }
}

- (BOOL)isAssetBlacklisted:(id)a3 blacklistDate:(id *)a4
{
  id v6;
  id v7;
  BOOL v8;
  _QWORD v10[5];
  id v11;
  _BYTE *v12;
  id *v13;
  _BYTE buf[28];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 500;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader isAssetBlacklisted:blacklistDate:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  buf[24] = 0;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__VCPDatabaseReader_isAssetBlacklisted_blacklistDate___block_invoke;
  v10[3] = &unk_1E6B17720;
  v10[4] = self;
  v7 = v6;
  v12 = buf;
  v13 = a4;
  v11 = v7;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v10);
  v8 = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;

  _Block_object_dispose(buf, 8);
  return v8;
}

uint64_t __54__VCPDatabaseReader_isAssetBlacklisted_blacklistDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  uint64_t v6;
  char *v7;
  int v8;
  const char *v9;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT date FROM Blacklist WHERE localIdentifier=(?) AND count>=(?);",
         -1,
         &ppStmt,
         0);
  if (!(_DWORD)v2)
  {
    v3 = ppStmt;
    v4 = *(id *)(a1 + 40);
    v5 = v4;
    v6 = v4
       ? sqlite3_bind_text(v3, 1, (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String"), -1, 0)
       : sqlite3_bind_null(v3, 1);
    v2 = v6;

    if (!(_DWORD)v2)
    {
      v2 = sqlite3_bind_int(ppStmt, 2, 2);
      if (!(_DWORD)v2)
      {
        v7 = sqlite3_expanded_sql(ppStmt);
        if (v7)
        {
          if (MediaAnalysisEnableDatabaseLog()
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            v14 = 1024;
            v15 = 510;
            v16 = 2080;
            v17 = v7;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
          sqlite3_free(v7);
        }
        v8 = sqlite3_step(ppStmt);
        if (v8 == 100)
        {
          if (*(_QWORD *)(a1 + 56))
          {
            sqlite3_column_nsdate(ppStmt, 0);
            **(_QWORD **)(a1 + 56) = (id)objc_claimAutoreleasedReturnValue();
          }
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
          v8 = sqlite3_step(ppStmt);
        }
        if (v8 == 101)
        {
          sqlite3_finalize(ppStmt);
          return 0;
        }
        v2 = 4294967278;
      }
    }
  }
  sqlite3_finalize(ppStmt);
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v9 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v13 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Error querying blacklist status for %@", buf, 0xCu);
  }
  return v2;
}

- (id)blacklistedLocalIdentifiersFromAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  VCPDatabaseReader *v9;
  _BYTE *v10;
  _BYTE buf[32];
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 533;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader blacklistedLocalIdentifiersFromAssets:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
    v12 = __Block_byref_object_dispose__19;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __59__VCPDatabaseReader_blacklistedLocalIdentifiersFromAssets___block_invoke;
    v7[3] = &unk_1E6B17748;
    v8 = v4;
    v9 = self;
    v10 = buf;
    -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v7);
    v5 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __59__VCPDatabaseReader_blacklistedLocalIdentifiersFromAssets___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t i;
  sqlite3 *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t j;
  sqlite3_stmt *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  int k;
  void *v17;
  sqlite3_stmt *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  char *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT localIdentifier FROM Blacklist WHERE count>=(?) AND localIdentifier IN (?"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
    objc_msgSend(v2, "appendString:", CFSTR(",?"));
  objc_msgSend(v2, "appendString:", CFSTR(");"));
  ppStmt = 0;
  v4 = *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 24);
  v23 = objc_retainAutorelease(v2);
  v5 = sqlite3_prepare_v2(v4, (const char *)objc_msgSend(v23, "UTF8String"), -1, &ppStmt, 0);
  if (!(_DWORD)v5)
  {
    v5 = sqlite3_bind_int(ppStmt, 1, 2);
    if (!(_DWORD)v5)
    {
      v26 = 0u;
      v27 = 0u;
      v24 = 0u;
      v25 = 0u;
      v6 = *(id *)(a1 + 32);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
      if (v7)
      {
        v8 = *(_QWORD *)v25;
        v9 = 2;
        while (2)
        {
          for (j = 0; j != v7; ++j)
          {
            if (*(_QWORD *)v25 != v8)
              objc_enumerationMutation(v6);
            v11 = ppStmt;
            objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * j), "localIdentifier");
            v12 = (id)objc_claimAutoreleasedReturnValue();
            v13 = v12;
            if (v12)
              v14 = sqlite3_bind_text(v11, v9 + j, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, 0);
            else
              v14 = sqlite3_bind_null(v11, v9 + j);
            v5 = v14;

            if ((_DWORD)v5)
            {

              goto LABEL_32;
            }
          }
          v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v35, 16);
          v9 += j;
          if (v7)
            continue;
          break;
        }
      }

      v15 = sqlite3_expanded_sql(ppStmt);
      if (v15)
      {
        if (MediaAnalysisEnableDatabaseLog()
          && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v30 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
          v31 = 1024;
          v32 = 553;
          v33 = 2080;
          v34 = v15;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
        }
        sqlite3_free(v15);
      }
      for (k = sqlite3_step(ppStmt); k == 100; k = sqlite3_step(ppStmt))
      {
        v17 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v18 = ppStmt;
        if (sqlite3_column_type(ppStmt, 0) == 5)
        {
          v19 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v18, 0));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v17, "addObject:", v19);

      }
      if (k == 101)
        v5 = 0;
      else
        v5 = 4294967278;
    }
  }
LABEL_32:
  sqlite3_finalize(ppStmt);
  if ((_DWORD)v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query blacklisted assets", buf, 2u);
    }
    v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(void **)(v20 + 40);
    *(_QWORD *)(v20 + 40) = 0;

  }
  return v5;
}

- (id)queryBlacklistedLocalIdentifiers
{
  id v3;
  _QWORD v5[6];
  _BYTE buf[32];
  void (*v7)(uint64_t);
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 578;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryBlacklistedLocalIdentifiers]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v7 = __Block_byref_object_dispose__19;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__VCPDatabaseReader_queryBlacklistedLocalIdentifiers__block_invoke;
  v5[3] = &unk_1E6B17770;
  v5[4] = self;
  v5[5] = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v5);
  v3 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v3;
}

uint64_t __53__VCPDatabaseReader_queryBlacklistedLocalIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  uint64_t v4;
  void *v5;
  char *v7;
  int i;
  void *v9;
  sqlite3_stmt *v10;
  void *v11;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  char *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT localIdentifier FROM Blacklist WHERE count>=(?);",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v2)
  {
LABEL_2:
    v3 = ppStmt;
    goto LABEL_4;
  }
  v2 = sqlite3_bind_int(ppStmt, 1, 2);
  v3 = ppStmt;
  if (!(_DWORD)v2)
  {
    v7 = sqlite3_expanded_sql(ppStmt);
    if (v7)
    {
      if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v14 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        v15 = 1024;
        v16 = 588;
        v17 = 2080;
        v18 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
      sqlite3_free(v7);
    }
    for (i = sqlite3_step(ppStmt); i == 100; i = sqlite3_step(ppStmt))
    {
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      v10 = ppStmt;
      if (sqlite3_column_type(ppStmt, 0) == 5)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v10, 0));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(v9, "addObject:", v11);

    }
    if (i == 101)
    {
      sqlite3_finalize(ppStmt);
      return 0;
    }
    v2 = 4294967278;
    goto LABEL_2;
  }
LABEL_4:
  sqlite3_finalize(v3);
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query blacklisted assets", buf, 2u);
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  return v2;
}

- (id)queryAnalysisForAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  _BYTE *v10;
  _BYTE buf[32];
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 611;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAnalysisForAsset:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __43__VCPDatabaseReader_queryAnalysisForAsset___block_invoke;
  v8[3] = &unk_1E6B17748;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v8);
  v6 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v6;
}

uint64_t __43__VCPDatabaseReader_queryAnalysisForAsset___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v4 + 40);
  v11 = 0;
  v5 = objc_msgSend(v2, "queryHeaderForAsset:analysis:assetId:", v3, &obj, &v11);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!(_DWORD)v5)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      return 0;
    v5 = objc_msgSend(*(id *)(a1 + 32), "queryResultsForAssetId:analysis:", v11);
    if (!(_DWORD)v5)
      return v5;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v13 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query asset %@", buf, 0xCu);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  return v5;
}

- (id)queryAnalysisPropertiesForAsset:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  _BYTE *v10;
  _BYTE buf[32];
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 633;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAnalysisPropertiesForAsset:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__VCPDatabaseReader_queryAnalysisPropertiesForAsset___block_invoke;
  v8[3] = &unk_1E6B17748;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v8);
  v6 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v6;
}

uint64_t __53__VCPDatabaseReader_queryAnalysisPropertiesForAsset___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id obj;
  uint64_t v11;
  uint8_t buf[4];
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v4 + 40);
  v11 = 0;
  v5 = objc_msgSend(v2, "queryHeaderForAsset:analysis:assetId:", v3, &obj, &v11);
  objc_storeStrong((id *)(v4 + 40), obj);
  if ((_DWORD)v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v6 = a1[5];
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query analysis properties of asset %@", buf, 0xCu);
    }
    v7 = *(_QWORD *)(a1[6] + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

  }
  return v5;
}

- (id)queryAnalysisPropertiesForAssets:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  _BYTE *v9;
  _BYTE buf[32];
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 650;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAnalysisPropertiesForAssets:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (objc_msgSend(v4, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
    v11 = __Block_byref_object_dispose__19;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __54__VCPDatabaseReader_queryAnalysisPropertiesForAssets___block_invoke;
    v7[3] = &unk_1E6B17748;
    v7[4] = self;
    v8 = v4;
    v9 = buf;
    -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v7);
    v5 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __54__VCPDatabaseReader_queryAnalysisPropertiesForAssets___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t i;
  sqlite3 *v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  sqlite3_stmt *v12;
  id v13;
  void *v14;
  uint64_t v15;
  char *v16;
  unsigned int v17;
  void *v18;
  sqlite3_stmt *v19;
  void *v20;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  char *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("SELECT id, localIdentifier, version, dateModified, dateAnalyzed, analysisTypes, flags, quality, masterFingerprint, adjustedFingerprint"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "shouldQueryInternalFields"))
    objc_msgSend(v2, "appendString:", CFSTR(", statsFlags"));
  objc_msgSend(v2, "appendString:", CFSTR(" FROM Assets WHERE localIdentifier IN (?"));
  for (i = 1; i < objc_msgSend(*(id *)(a1 + 40), "count"); ++i)
    objc_msgSend(v2, "appendString:", CFSTR(",?"));
  objc_msgSend(v2, "appendString:", CFSTR(");"));
  v4 = *(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24);
  v5 = objc_retainAutorelease(v2);
  v6 = sqlite3_prepare_v2(v4, (const char *)objc_msgSend(v5, "UTF8String"), -1, &ppStmt, 0);
  v22 = v5;
  if (!(_DWORD)v6)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v7 = *(id *)(a1 + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v24;
      v10 = 1;
LABEL_9:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v7);
        v12 = ppStmt;
        v13 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v11);
        v14 = v13;
        v15 = v13
            ? sqlite3_bind_text(v12, v10 + v11, (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"), -1, 0): sqlite3_bind_null(v12, v10 + v11);
        v6 = v15;

        if ((_DWORD)v6)
          goto LABEL_32;
        if (v8 == ++v11)
        {
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v34, 16);
          v10 += v11;
          if (v8)
            goto LABEL_9;
          break;
        }
      }
    }

    v16 = sqlite3_expanded_sql(ppStmt);
    if (v16)
    {
      if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v29 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        v30 = 1024;
        v31 = 680;
        v32 = 2080;
        v33 = v16;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
      sqlite3_free(v16);
    }
    v17 = sqlite3_step(ppStmt);
    if (v17 == 100)
    {
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v7 = (id)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(*(id *)(a1 + 32), "parseHeader:startColumn:analysis:", ppStmt, 2, v7);
        if ((_DWORD)v6)
          break;
        v18 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
        v19 = ppStmt;
        if (sqlite3_column_type(ppStmt, 1) == 5)
        {
          v20 = 0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v19, 1));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
        }
        objc_msgSend(v18, "setObject:forKey:", v7, v20);

        v17 = sqlite3_step(ppStmt);
        if (v17 != 100)
          goto LABEL_29;
      }
LABEL_32:

      goto LABEL_33;
    }
LABEL_29:
    if (v17 == 101)
      v6 = 0;
    else
      v6 = v17;
  }
LABEL_33:
  sqlite3_finalize(ppStmt);

  return v6;
}

- (id)queryAnalysisForAsset:(id)a3 withTypes:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  id v14;
  _BYTE *v15;
  _BYTE buf[32];
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 704;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAnalysisForAsset:withTypes:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v17 = __Block_byref_object_dispose__19;
  v18 = 0;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__VCPDatabaseReader_queryAnalysisForAsset_withTypes___block_invoke;
  v12[3] = &unk_1E6B17798;
  v12[4] = self;
  v8 = v6;
  v13 = v8;
  v15 = buf;
  v9 = v7;
  v14 = v9;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v12);
  v10 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v10;
}

uint64_t __53__VCPDatabaseReader_queryAnalysisForAsset_withTypes___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id obj;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v4 + 40);
  v13 = 0;
  v5 = objc_msgSend(v2, "queryHeaderForAsset:analysis:assetId:", v3, &obj, &v13);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (!(_DWORD)v5)
  {
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
      return 0;
    if (!objc_msgSend(*(id *)(a1 + 48), "count"))
      return 0;
    v9 = (void *)objc_msgSend(*(id *)(a1 + 48), "mutableCopy");
    MediaAnalysisResultsTypesForAnalysisTypes(objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "vcp_types"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "intersectSet:", v10);
    v5 = objc_msgSend(*(id *)(a1 + 32), "queryResultsForAssetId:withTypes:analysis:", v13, v9, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));

    if (!(_DWORD)v5)
      return 0;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v6 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query asset %@", buf, 0xCu);
  }
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = 0;

  return v5;
}

- (id)queryAnalysesForAssets:(id)a3 withTypes:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  _BYTE *v13;
  _BYTE buf[32];
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 731;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAnalysesForAssets:withTypes:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (objc_msgSend(v6, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
    v15 = __Block_byref_object_dispose__19;
    v16 = 0;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__VCPDatabaseReader_queryAnalysesForAssets_withTypes___block_invoke;
    v10[3] = &unk_1E6B177C0;
    v10[4] = self;
    v11 = v6;
    v12 = v7;
    v13 = buf;
    -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v10);
    v8 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __54__VCPDatabaseReader_queryAnalysesForAssets_withTypes___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  void *v23;
  id obj;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 32), "queryHeadersForAssets:analyses:idMap:", *(_QWORD *)(a1 + 40), v1, v2);
  if ((_DWORD)v4
    || objc_msgSend(v1, "count")
    && ((v7 = *(void **)(a1 + 48)) == 0 || objc_msgSend(v7, "count"))
    && (v8 = *(void **)(a1 + 32),
        objc_msgSend(v1, "allKeys"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v8, "queryResultsForAssets:withTypes:batchResults:", v9, *(_QWORD *)(a1 + 48), v3),
        v9,
        (_DWORD)v4))
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] queryAnalysesForAssets Failed", buf, 2u);
    }
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v6 = *(void **)(v5 + 40);
    *(_QWORD *)(v5 + 40) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v1, "allKeys");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v4)
    {
      v13 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v1, "objectForKeyedSubscript:", v15);
          v17 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addEntriesFromDictionary:", v17);

          objc_msgSend(v3, "objectForKeyedSubscript:", v15);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v17) = v18 == 0;

          if ((v17 & 1) == 0)
          {
            objc_msgSend(v3, "objectForKeyedSubscript:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "setObject:forKey:", v19, CFSTR("metadataRanges"));

          }
          objc_msgSend(v2, "objectForKeyedSubscript:", v15);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = v20 == 0;

          if (!v21)
          {
            v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
            objc_msgSend(v2, "objectForKeyedSubscript:", v15);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "setObject:forKey:", v16, v23);

          }
        }
        v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v4);
    }
    v6 = obj;
  }

  return v4;
}

- (id)queryAssetsAnalyzedSince:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[5];
  id v9;
  _BYTE *v10;
  _BYTE buf[32];
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 777;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryAssetsAnalyzedSince:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v12 = __Block_byref_object_dispose__19;
  v13 = 0;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__VCPDatabaseReader_queryAssetsAnalyzedSince___block_invoke;
  v8[3] = &unk_1E6B17748;
  v8[4] = self;
  v5 = v4;
  v9 = v5;
  v10 = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v8);
  v6 = *(id *)(*(_QWORD *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  return v6;
}

uint64_t __46__VCPDatabaseReader_queryAssetsAnalyzedSince___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  sqlite3_stmt *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT localIdentifier FROM Assets WHERE dateAnalyzed>=(?) UNION SELECT localIdentifier FROM Blacklist WHERE count>=(?) AND date>=(?);",
         -1,
         &ppStmt,
         0);
  if (!(_DWORD)v2)
  {
    v3 = ppStmt;
    v4 = *(id *)(a1 + 40);
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "timeIntervalSinceReferenceDate");
      v7 = sqlite3_bind_double(v3, 1, v6);
    }
    else
    {
      v7 = sqlite3_bind_null(v3, 1);
    }
    v2 = v7;

    if (!(_DWORD)v2)
    {
      v2 = sqlite3_bind_int(ppStmt, 2, 2);
      if (!(_DWORD)v2)
      {
        v8 = ppStmt;
        v9 = *(id *)(a1 + 40);
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "timeIntervalSinceReferenceDate");
          v12 = sqlite3_bind_double(v8, 3, v11);
        }
        else
        {
          v12 = sqlite3_bind_null(v8, 3);
        }
        v2 = v12;

        if (!(_DWORD)v2)
        {
          v13 = sqlite3_expanded_sql(ppStmt);
          if (v13)
          {
            if (MediaAnalysisEnableDatabaseLog()
              && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315650;
              v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
              v26 = 1024;
              v27 = 790;
              v28 = 2080;
              v29 = v13;
              _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
            }
            sqlite3_free(v13);
          }
          v14 = sqlite3_step(ppStmt);
          objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          v15 = objc_claimAutoreleasedReturnValue();
          v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          v17 = *(void **)(v16 + 40);
          *(_QWORD *)(v16 + 40) = v15;
          while (1)
          {

            if (v14 != 100)
              break;
            v18 = ppStmt;
            if (sqlite3_column_type(ppStmt, 0) == 5)
            {
              v17 = 0;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v18, 0));
              v17 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v17);
            v14 = sqlite3_step(ppStmt);
          }
          if (v14 == 101)
          {
            sqlite3_finalize(ppStmt);
            return 0;
          }
          v2 = 4294967278;
        }
      }
    }
  }
  sqlite3_finalize(ppStmt);
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v19 = *(const char **)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v25 = v19;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query assets since %@", buf, 0xCu);
  }
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = 0;

  return v2;
}

- (id)queryFailedProcessingStatusFromAssets:(id)a3 forTaskID:(unint64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  VCPDatabaseReader *v11;
  _BYTE *v12;
  unint64_t v13;
  _BYTE buf[32];
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 818;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryFailedProcessingStatusFromAssets:forTaskID:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (objc_msgSend(v6, "count"))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
    v15 = __Block_byref_object_dispose__19;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__VCPDatabaseReader_queryFailedProcessingStatusFromAssets_forTaskID___block_invoke;
    v9[3] = &unk_1E6B17720;
    v10 = v6;
    v11 = self;
    v12 = buf;
    v13 = a4;
    -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v9);
    v7 = *(id *)(*(_QWORD *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __69__VCPDatabaseReader_queryFailedProcessingStatusFromAssets_forTaskID___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t i;
  sqlite3 *v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t j;
  sqlite3_stmt *v11;
  id v12;
  void *v13;
  uint64_t v14;
  char *v15;
  int v16;
  sqlite3_stmt *v17;
  void *v18;
  uint64_t v19;
  sqlite3_int64 v20;
  sqlite3_int64 v21;
  sqlite3_stmt *v22;
  void *v23;
  sqlite3_stmt *v24;
  void *v25;
  void *v26;
  void *v27;
  sqlite3_stmt *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  void *v32;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v41;
  __int16 v42;
  int v43;
  __int16 v44;
  char *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("SELECT localIdentifier, status, attempts, lastAttemptDate, nextAttemptDate FROM ProcessingStatus WHERE taskID=(?) AND status!=(?) AND localIdentifier IN (?"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 1; i < objc_msgSend(*(id *)(a1 + 32), "count"); ++i)
    objc_msgSend(v2, "appendString:", CFSTR(",?"));
  objc_msgSend(v2, "appendString:", CFSTR(");"));
  ppStmt = 0;
  v4 = *(sqlite3 **)(*(_QWORD *)(a1 + 40) + 24);
  v34 = objc_retainAutorelease(v2);
  v5 = sqlite3_prepare_v2(v4, (const char *)objc_msgSend(v34, "UTF8String"), -1, &ppStmt, 0);
  if (!(_DWORD)v5)
  {
    v5 = sqlite3_bind_int64(ppStmt, 1, *(_QWORD *)(a1 + 56));
    if (!(_DWORD)v5)
    {
      v5 = sqlite3_bind_int64(ppStmt, 2, 1);
      if (!(_DWORD)v5)
      {
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v6 = *(id *)(a1 + 32);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
        if (v7)
        {
          v8 = *(_QWORD *)v36;
          v9 = 3;
          while (2)
          {
            for (j = 0; j != v7; ++j)
            {
              if (*(_QWORD *)v36 != v8)
                objc_enumerationMutation(v6);
              v11 = ppStmt;
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * j), "localIdentifier");
              v12 = (id)objc_claimAutoreleasedReturnValue();
              v13 = v12;
              if (v12)
                v14 = sqlite3_bind_text(v11, v9 + j, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"), -1, 0);
              else
                v14 = sqlite3_bind_null(v11, v9 + j);
              v5 = v14;

              if ((_DWORD)v5)
              {

                goto LABEL_42;
              }
            }
            v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v35, v46, 16);
            v9 += j;
            if (v7)
              continue;
            break;
          }
        }

        v15 = sqlite3_expanded_sql(ppStmt);
        if (v15)
        {
          if (MediaAnalysisEnableDatabaseLog()
            && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315650;
            v41 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
            v42 = 1024;
            v43 = 839;
            v44 = 2080;
            v45 = v15;
            _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
          }
          sqlite3_free(v15);
        }
        v16 = sqlite3_step(ppStmt);
        while (v16 == 100)
        {
          v17 = ppStmt;
          if (sqlite3_column_type(ppStmt, 0) == 5)
          {
            v18 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v17, 0));
            v18 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v19 = *(_QWORD *)(a1 + 56);
          v20 = sqlite3_column_int64(ppStmt, 1);
          v21 = sqlite3_column_int64(ppStmt, 2);
          v22 = ppStmt;
          if (sqlite3_column_type(ppStmt, 3) == 5)
          {
            v23 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v22, 3));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v24 = ppStmt;
          if (sqlite3_column_type(ppStmt, 4) == 5)
          {
            v25 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v24, 4));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
          }
          +[VCPProcessingStatusEntry entryWithLocalIdentifier:taskID:status:attempts:lastAttemptDate:andNextAttemptDate:](VCPProcessingStatusEntry, "entryWithLocalIdentifier:taskID:status:attempts:lastAttemptDate:andNextAttemptDate:", v18, v19, v20, v21, v23, v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          v27 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v28 = ppStmt;
          if (sqlite3_column_type(ppStmt, 0) == 5)
          {
            v29 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v28, 0));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
          }
          objc_msgSend(v27, "setObject:forKeyedSubscript:", v26, v29);

          v16 = sqlite3_step(ppStmt);
        }
        if (v16 == 101)
          v5 = 0;
        else
          v5 = 4294967278;
      }
    }
  }
LABEL_42:
  sqlite3_finalize(ppStmt);
  if ((_DWORD)v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v30 = *(const char **)(a1 + 56);
      *(_DWORD *)buf = 134217984;
      v41 = v30;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MediaAnalysis] Failed to query failed assets for taskID: %lu", buf, 0xCu);
    }
    v31 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v32 = *(void **)(v31 + 40);
    *(_QWORD *)(v31 + 40) = 0;

  }
  return v5;
}

- (id)queryLocalIdentifiersForTaskID:(unint64_t)a3 withStatus:(unint64_t)a4
{
  id v7;
  _QWORD v9[8];
  _BYTE buf[32];
  void (*v11)(uint64_t);
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 872;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryLocalIdentifiersForTaskID:withStatus:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v11 = __Block_byref_object_dispose__19;
  v12 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__VCPDatabaseReader_queryLocalIdentifiersForTaskID_withStatus___block_invoke;
  v9[3] = &unk_1E6B177E8;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v9);
  v7 = *(id *)(*(_QWORD *)&buf[8] + 40);
  _Block_object_dispose(buf, 8);

  return v7;
}

uint64_t __63__VCPDatabaseReader_queryLocalIdentifiersForTaskID_withStatus___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char *v7;
  NSObject *v8;
  sqlite3_stmt *v9;
  void *v10;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  ppStmt = 0;
  v3 = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 24), "SELECT localIdentifier FROM ProcessingStatus WHERE taskID=(?) AND status=(?);",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v3)
    goto LABEL_4;
  v3 = sqlite3_bind_int64(ppStmt, 1, a1[6]);
  if ((_DWORD)v3)
    goto LABEL_4;
  v3 = sqlite3_bind_int64(ppStmt, 2, a1[7]);
  if ((_DWORD)v3)
    goto LABEL_4;
  v7 = sqlite3_expanded_sql(ppStmt);
  if (v7)
  {
    if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v13 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      v14 = 1024;
      v15 = 883;
      v16 = 2080;
      v17 = v7;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
    }
    sqlite3_free(v7);
  }
  v3 = sqlite3_step(ppStmt);
  v8 = MEMORY[0x1E0C81028];
  while ((_DWORD)v3 == 100)
  {
    v9 = ppStmt;
    if (sqlite3_column_type(ppStmt, 0) == 5
      || (objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v9, 0)),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, v8, OS_LOG_TYPE_DEBUG, "[MediaAnalysis] WARNING: ProcessingStatus entry with nil localIdentifier", buf, 2u);
      }
      v10 = 0;
    }
    else
    {
      objc_msgSend(v2, "addObject:", v10);
    }
    v3 = sqlite3_step(ppStmt);

  }
  if ((_DWORD)v3 && (_DWORD)v3 != 101)
  {
LABEL_4:

    v2 = 0;
  }
  else
  {
    v3 = 0;
  }
  sqlite3_finalize(ppStmt);
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v2;

  return v3;
}

- (unint64_t)countForTaskID:(unint64_t)a3 withProcessingStatus:(unint64_t)a4
{
  unint64_t v7;
  _QWORD v9[8];
  _BYTE buf[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 907;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader countForTaskID:withProcessingStatus:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  *(_QWORD *)&buf[24] = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__VCPDatabaseReader_countForTaskID_withProcessingStatus___block_invoke;
  v9[3] = &unk_1E6B177E8;
  v9[6] = a3;
  v9[7] = a4;
  v9[4] = self;
  v9[5] = buf;
  -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v9);
  v7 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);
  _Block_object_dispose(buf, 8);
  return v7;
}

uint64_t __57__VCPDatabaseReader_countForTaskID_withProcessingStatus___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  sqlite3_int64 v4;
  char *v6;
  char *v7;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(a1[4] + 24), "SELECT COUNT(*) FROM ProcessingStatus WHERE taskID=(?) AND status=(?);",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v2
    || (v2 = sqlite3_bind_int64(ppStmt, 1, a1[6]), (_DWORD)v2)
    || (v2 = sqlite3_bind_int64(ppStmt, 2, a1[7]), (_DWORD)v2))
  {
    v3 = v2;
    v4 = 0;
  }
  else
  {
    v6 = sqlite3_expanded_sql(ppStmt);
    if (v6)
    {
      v7 = v6;
      if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315650;
        v10 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
        v11 = 1024;
        v12 = 916;
        v13 = 2080;
        v14 = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
      }
      sqlite3_free(v7);
    }
    if (sqlite3_step(ppStmt) == 100)
    {
      v4 = sqlite3_column_int64(ppStmt, 0);
      v3 = 0;
    }
    else
    {
      v4 = 0;
      v3 = 4294967278;
    }
  }
  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
  sqlite3_finalize(ppStmt);
  return v3;
}

- (int)_queryValue:(int64_t *)a3 forKey:(id)a4
{
  id v6;
  int v7;
  sqlite3_stmt *v8;
  id v9;
  void *v10;
  int v11;
  int v12;
  char *v14;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    v18 = 1024;
    v19 = 931;
    v20 = 2080;
    v21 = "-[VCPDatabaseReader _queryValue:forKey:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  ppStmt = 0;
  *a3 = 0;
  v7 = sqlite3_prepare_v2(self->_database, "SELECT value FROM KeyValueStore WHERE key = (?);", -1, &ppStmt, 0);
  if (v7)
    goto LABEL_26;
  v8 = ppStmt;
  v9 = v6;
  v10 = v9;
  v11 = v9
      ? sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"), -1, 0)
      : sqlite3_bind_null(v8, 1);
  v7 = v11;

  if (v7)
    goto LABEL_26;
  v14 = sqlite3_expanded_sql(ppStmt);
  if (v14)
  {
    if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      v18 = 1024;
      v19 = 939;
      v20 = 2080;
      v21 = v14;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
    }
    sqlite3_free(v14);
  }
  v7 = sqlite3_step(ppStmt);
  if (v7 == 100)
  {
    *a3 = sqlite3_column_int64(ppStmt, 0);
    v7 = sqlite3_step(ppStmt);
  }
  v12 = 0;
  if (v7)
  {
    if (v7 != 101)
    {
LABEL_26:
      if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v17) = v7;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to query KeyValueStore (error code: %d)", buf, 8u);
      }
      v12 = v7;
    }
  }
  sqlite3_finalize(ppStmt);

  return v12;
}

- (int64_t)valueForKey:(id)a3
{
  id v4;
  int64_t v5;
  _QWORD v7[5];
  id v8;
  _BYTE *v9;
  _BYTE buf[32];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 955;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader valueForKey:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  if (v4)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    *(_QWORD *)&buf[24] = 0;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __33__VCPDatabaseReader_valueForKey___block_invoke;
    v7[3] = &unk_1E6B17810;
    v7[4] = self;
    v9 = buf;
    v8 = v4;
    -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v7);
    v5 = *(_QWORD *)(*(_QWORD *)&buf[8] + 24);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __33__VCPDatabaseReader_valueForKey___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queryValue:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24, *(_QWORD *)(a1 + 40));
}

- (int)querySchedulingHistoryRecords:(id *)a3 forActivityID:(unint64_t)a4 startDate:(id)a5 endDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  _QWORD v16[5];
  id v17;
  id v18;
  _BYTE *v19;
  unint64_t v20;
  _BYTE buf[32];
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = a6;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 968;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader querySchedulingHistoryRecords:forActivityID:startDate:endDate:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v22 = __Block_byref_object_dispose__19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__VCPDatabaseReader_querySchedulingHistoryRecords_forActivityID_startDate_endDate___block_invoke;
  v16[3] = &unk_1E6B17838;
  v16[4] = self;
  v20 = a4;
  v12 = v10;
  v17 = v12;
  v13 = v11;
  v18 = v13;
  v19 = buf;
  v14 = -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v16);
  *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
  return v14;
}

uint64_t __83__VCPDatabaseReader_querySchedulingHistoryRecords_forActivityID_startDate_endDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  void *v15;
  char *v17;
  MADActivitySchedulingRecord *v18;
  sqlite3_stmt *v19;
  void *v20;
  sqlite3_stmt *v21;
  void *v22;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT activityID, startTime, duration, exitStatus, sessionLog FROM BackgroundActivitySchedulingHistory WHERE activityID=(?) AND startTime>=(?) AND startTime<=(?);",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v2)
    goto LABEL_35;
  v2 = sqlite3_bind_int64(ppStmt, 1, *(_QWORD *)(a1 + 64));
  if ((_DWORD)v2)
    goto LABEL_35;
  v3 = ppStmt;
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = sqlite3_bind_double(v3, 2, v6);
  }
  else
  {
    v7 = sqlite3_bind_null(v3, 2);
  }
  v2 = v7;

  if ((_DWORD)v2)
    goto LABEL_35;
  v8 = ppStmt;
  v9 = *(id *)(a1 + 48);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v12 = sqlite3_bind_double(v8, 3, v11);
  }
  else
  {
    v12 = sqlite3_bind_null(v8, 3);
  }
  v2 = v12;

  if ((_DWORD)v2)
    goto LABEL_35;
  v17 = sqlite3_expanded_sql(ppStmt);
  if (v17)
  {
    if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v25 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      v26 = 1024;
      v27 = 980;
      v28 = 2080;
      v29 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
    }
    sqlite3_free(v17);
  }
  v2 = sqlite3_step(ppStmt);
  while ((_DWORD)v2 == 100)
  {
    v18 = objc_alloc_init(MADActivitySchedulingRecord);
    -[MADActivitySchedulingRecord setActivityID:](v18, "setActivityID:", sqlite3_column_int64(ppStmt, 0));
    v19 = ppStmt;
    if (sqlite3_column_type(ppStmt, 1) == 5)
    {
      v20 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v19, 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MADActivitySchedulingRecord setStartTime:](v18, "setStartTime:", v20);

    -[MADActivitySchedulingRecord setDuration:](v18, "setDuration:", sqlite3_column_double(ppStmt, 2));
    -[MADActivitySchedulingRecord setExitStatus:](v18, "setExitStatus:", sqlite3_column_int64(ppStmt, 3));
    v21 = ppStmt;
    if (sqlite3_column_type(ppStmt, 4) == 5)
    {
      v22 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v21, 4));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MADActivitySchedulingRecord setSessionLog:](v18, "setSessionLog:", v22);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v18);
    v2 = sqlite3_step(ppStmt);

  }
  if ((_DWORD)v2 && (_DWORD)v2 != 101)
  {
LABEL_35:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      VCPTaskIDDescription(*(_QWORD *)(a1 + 64));
      v13 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v13;
      v26 = 1024;
      v27 = v2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[SchedulingHistory] Failed to query history for %@ - %d", buf, 0x12u);

    }
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = 0;

  }
  else
  {
    v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (int)querySchedulingHistoryRecords:(id *)a3 startDate:(id)a4 endDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  _QWORD v14[5];
  id v15;
  id v16;
  _BYTE *v17;
  _BYTE buf[32];
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1013;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader querySchedulingHistoryRecords:startDate:endDate:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v19 = __Block_byref_object_dispose__19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __69__VCPDatabaseReader_querySchedulingHistoryRecords_startDate_endDate___block_invoke;
  v14[3] = &unk_1E6B177C0;
  v14[4] = self;
  v10 = v8;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  v17 = buf;
  v12 = -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v14);
  *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
  return v12;
}

uint64_t __69__VCPDatabaseReader_querySchedulingHistoryRecords_startDate_endDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  sqlite3_stmt *v8;
  id v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char *v16;
  MADActivitySchedulingRecord *v17;
  sqlite3_stmt *v18;
  void *v19;
  sqlite3_stmt *v20;
  void *v21;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  char *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT activityID, startTime, duration, exitStatus, sessionLog FROM BackgroundActivitySchedulingHistory WHERE startTime>=(?) AND startTime<=(?);",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v2)
    goto LABEL_34;
  v3 = ppStmt;
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = sqlite3_bind_double(v3, 1, v6);
  }
  else
  {
    v7 = sqlite3_bind_null(v3, 1);
  }
  v2 = v7;

  if ((_DWORD)v2)
    goto LABEL_34;
  v8 = ppStmt;
  v9 = *(id *)(a1 + 48);
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "timeIntervalSinceReferenceDate");
    v12 = sqlite3_bind_double(v8, 2, v11);
  }
  else
  {
    v12 = sqlite3_bind_null(v8, 2);
  }
  v2 = v12;

  if ((_DWORD)v2)
    goto LABEL_34;
  v16 = sqlite3_expanded_sql(ppStmt);
  if (v16)
  {
    if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v24 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      v25 = 1024;
      v26 = 1024;
      v27 = 2080;
      v28 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
    }
    sqlite3_free(v16);
  }
  v2 = sqlite3_step(ppStmt);
  while ((_DWORD)v2 == 100)
  {
    v17 = objc_alloc_init(MADActivitySchedulingRecord);
    -[MADActivitySchedulingRecord setActivityID:](v17, "setActivityID:", sqlite3_column_int64(ppStmt, 0));
    v18 = ppStmt;
    if (sqlite3_column_type(ppStmt, 1) == 5)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v18, 1));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MADActivitySchedulingRecord setStartTime:](v17, "setStartTime:", v19);

    -[MADActivitySchedulingRecord setDuration:](v17, "setDuration:", sqlite3_column_double(ppStmt, 2));
    -[MADActivitySchedulingRecord setExitStatus:](v17, "setExitStatus:", sqlite3_column_int64(ppStmt, 3));
    v20 = ppStmt;
    if (sqlite3_column_type(ppStmt, 4) == 5)
    {
      v21 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v20, 4));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MADActivitySchedulingRecord setSessionLog:](v17, "setSessionLog:", v21);

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v17);
    v2 = sqlite3_step(ppStmt);

  }
  if ((_DWORD)v2 && (_DWORD)v2 != 101)
  {
LABEL_34:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v24) = v2;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[SchedulingHistory] Failed to query all background activities - %d", buf, 8u);
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = 0;

  }
  else
  {
    v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (int)queryProgressHistoryRecords:(id *)a3 sinceDate:(id)a4
{
  id v6;
  id v7;
  int v8;
  _QWORD v10[5];
  id v11;
  _BYTE *v12;
  _BYTE buf[32];
  void (*v14)(uint64_t);
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315650;
    *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 1055;
    *(_WORD *)&buf[18] = 2080;
    *(_QWORD *)&buf[20] = "-[VCPDatabaseReader queryProgressHistoryRecords:sinceDate:]";
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Executing: %s[line:%d]: %s", buf, 0x1Cu);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  *(_QWORD *)&buf[24] = __Block_byref_object_copy__19;
  v14 = __Block_byref_object_dispose__19;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__VCPDatabaseReader_queryProgressHistoryRecords_sinceDate___block_invoke;
  v10[3] = &unk_1E6B17748;
  v10[4] = self;
  v7 = v6;
  v11 = v7;
  v12 = buf;
  v8 = -[VCPDatabaseReader executeDatabaseBlock:](self, "executeDatabaseBlock:", v10);
  *a3 = objc_retainAutorelease(*(id *)(*(_QWORD *)&buf[8] + 40));

  _Block_object_dispose(buf, 8);
  return v8;
}

uint64_t __59__VCPDatabaseReader_queryProgressHistoryRecords_sinceDate___block_invoke(uint64_t a1)
{
  uint64_t v2;
  sqlite3_stmt *v3;
  id v4;
  void *v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v11;
  MADBackgroundAnalysisProgressRecord *v12;
  sqlite3_stmt *v13;
  void *v14;
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v2 = sqlite3_prepare_v2(*(sqlite3 **)(*(_QWORD *)(a1 + 32) + 24), "SELECT activityID, analysisSubtype, storeDate, version, processedAssetCount, totalAssetCount FROM BackgroundAnalysisProgressHistory WHERE storeDate>=(?) ORDER BY activityID ASC, analysisSubtype ASC, storeDate DESC;",
         -1,
         &ppStmt,
         0);
  if ((_DWORD)v2)
    goto LABEL_27;
  v3 = ppStmt;
  v4 = *(id *)(a1 + 40);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v7 = sqlite3_bind_double(v3, 1, v6);
  }
  else
  {
    v7 = sqlite3_bind_null(v3, 1);
  }
  v2 = v7;

  if ((_DWORD)v2)
    goto LABEL_27;
  v11 = sqlite3_expanded_sql(ppStmt);
  if (v11)
  {
    if (MediaAnalysisEnableDatabaseLog() && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315650;
      v17 = "/Library/Caches/com.apple.xbs/Sources/MediaAnalysis/MediaAnalysis/DatabaseReader.mm";
      v18 = 1024;
      v19 = 1066;
      v20 = 2080;
      v21 = v11;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[MADB] Statement: %s[line:%d]: %s", buf, 0x1Cu);
    }
    sqlite3_free(v11);
  }
  v2 = sqlite3_step(ppStmt);
  while ((_DWORD)v2 == 100)
  {
    v12 = objc_alloc_init(MADBackgroundAnalysisProgressRecord);
    -[MADBackgroundAnalysisProgressRecord setActivityID:](v12, "setActivityID:", sqlite3_column_int64(ppStmt, 0));
    -[MADBackgroundAnalysisProgressRecord setAnalysisSubtype:](v12, "setAnalysisSubtype:", sqlite3_column_int64(ppStmt, 1));
    v13 = ppStmt;
    if (sqlite3_column_type(ppStmt, 2) == 5)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", sqlite3_column_double(v13, 2));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    -[MADBackgroundAnalysisProgressRecord setStoreDate:](v12, "setStoreDate:", v14);

    -[MADBackgroundAnalysisProgressRecord setVersion:](v12, "setVersion:", sqlite3_column_int64(ppStmt, 3));
    -[MADBackgroundAnalysisProgressRecord setProcessedAssetCount:](v12, "setProcessedAssetCount:", sqlite3_column_int64(ppStmt, 4));
    -[MADBackgroundAnalysisProgressRecord setTotalAssetCount:](v12, "setTotalAssetCount:", sqlite3_column_int64(ppStmt, 5));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", v12);
    v2 = sqlite3_step(ppStmt);

  }
  if ((_DWORD)v2 && (_DWORD)v2 != 101)
  {
LABEL_27:
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to query BackgroundAnalysisProgressHistory table", buf, 2u);
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

  }
  else
  {
    v2 = 0;
  }
  sqlite3_finalize(ppStmt);
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filepath, 0);
  objc_storeStrong((id *)&self->_sqlSerialQueue, 0);
}

- (void)openDatabase
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_fault_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[VCPDatabaseReader] Failed to set busy handler: %d", (uint8_t *)v1, 8u);
}

@end
