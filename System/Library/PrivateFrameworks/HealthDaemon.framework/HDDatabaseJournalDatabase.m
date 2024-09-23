@implementation HDDatabaseJournalDatabase

- (HDDatabaseJournalDatabase)init
{
  void *v3;
  uint64_t v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99DA0];
  v4 = *MEMORY[0x1E0C99778];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "raise:format:", v4, CFSTR("The -%@ method is not available on %@"), v5, objc_opt_class());

  return 0;
}

- (HDDatabaseJournalDatabase)initWithURL:(id)a3
{
  id v4;
  HDDatabaseJournalDatabase *v5;
  uint64_t v6;
  NSURL *databaseURL;
  NSNumber *size;
  NSDate *modificationDate;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDDatabaseJournalDatabase;
  v5 = -[HDDatabaseJournalDatabase init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("journaldb.sqlite"));
    v6 = objc_claimAutoreleasedReturnValue();
    databaseURL = v5->_databaseURL;
    v5->_databaseURL = (NSURL *)v6;

    size = v5->_size;
    v5->_size = 0;

    modificationDate = v5->_modificationDate;
    v5->_modificationDate = 0;

    v5->_enumeratedBytesThreshold = 0x40000;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[HDDatabaseJournalDatabase close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)HDDatabaseJournalDatabase;
  -[HDDatabaseJournalDatabase dealloc](&v3, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  _BOOL4 v5;
  const __CFString *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL path](self->_databaseURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[HDDatabaseJournalDatabase isOpen](self, "isOpen");
  v6 = CFSTR("closed");
  if (v5)
    v6 = CFSTR("open");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ (%@)"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)getIdentifierAndCreationDate:(id *)a3 error:(id *)a4
{
  if (!-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a4, 3, CFSTR("Cannot get identifier for %@"), self);
  return -[HDDatabaseJournalDatabase _getIdentifierAndCreationDate:error:]((uint64_t)self, a3, (uint64_t)a4);
}

- (id)_getIdentifierAndCreationDate:(uint64_t)a3 error:
{
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  if (!a1)
    return 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__112;
  v18 = __Block_byref_object_dispose__112;
  v19 = 0;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v5 = *(void **)(a1 + 16);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke_2;
  v9[3] = &unk_1E6CEB2A8;
  v9[4] = &v14;
  v9[5] = &v10;
  if ((objc_msgSend(v5, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT value, modification_date FROM key_value_store WHERE key = ?"), a3, &__block_literal_global_263, v9) & 1) != 0)
  {
    v6 = (void *)v15[5];
    if (v6)
    {
      if (a2)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v11[3]);
        *a2 = (id)objc_claimAutoreleasedReturnValue();
        v6 = (void *)v15[5];
      }
      v7 = v6;
      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 100, CFSTR("No database identifier has been set"));
  }
  v7 = 0;
LABEL_9:
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v7;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[NSURL URLByDeletingLastPathComponent](self->_databaseURL, "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)journalPath
{
  void *v2;
  void *v3;
  void *v4;

  -[NSURL URLByDeletingLastPathComponent](self->_databaseURL, "URLByDeletingLastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

- (BOOL)isOpen
{
  HDSQLiteDatabase *database;

  database = self->_database;
  if (database)
    LOBYTE(database) = -[HDSQLiteDatabase isOpen](database, "isOpen");
  return (char)database;
}

- (int64_t)size
{
  NSNumber *size;

  size = self->_size;
  if (!size)
  {
    -[HDDatabaseJournalDatabase _faultCachedProperties]((uint64_t)self);
    size = self->_size;
  }
  return -[NSNumber integerValue](size, "integerValue");
}

- (void)_faultCachedProperties
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  id v31[2];
  _QWORD v32[4];

  v32[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = *MEMORY[0x1E0C99998];
    v3 = *MEMORY[0x1E0C998D8];
    v32[0] = *MEMORY[0x1E0C99998];
    v32[1] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = a1;
    v31[0] = *(id *)(a1 + 8);
    objc_msgSend(v31[0], "URLByDeletingPathExtension");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("sqlite-wal"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceReferenceDate");
    v10 = v9;

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v7;
    v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v27 != v14)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "resourceValuesForKeys:error:", v4, 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v2);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v3);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            v13 += objc_msgSend(v17, "integerValue");
          if (v18)
          {
            objc_msgSend(v18, "timeIntervalSinceReferenceDate");
            if (v10 < v19)
              v10 = v19;
          }

        }
        v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v13);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(void **)(v24 + 24);
    *(_QWORD *)(v24 + 24) = v20;

    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", v10);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = *(void **)(v24 + 32);
    *(_QWORD *)(v24 + 32) = v22;

  }
}

- (double)modificationTime
{
  NSDate *modificationDate;
  double result;

  modificationDate = self->_modificationDate;
  if (!modificationDate)
  {
    -[HDDatabaseJournalDatabase _faultCachedProperties]((uint64_t)self);
    modificationDate = self->_modificationDate;
  }
  -[NSDate timeIntervalSinceReferenceDate](modificationDate, "timeIntervalSinceReferenceDate");
  return result;
}

- (BOOL)appendData:(id)a3 entryClass:(Class)a4 error:(id *)a5
{
  id v8;
  HDSQLiteDatabase *database;
  id v10;
  HDSQLiteDatabase *v11;
  uint64_t v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  Class v19;

  v8 = a3;
  if (-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
  {
    -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
    database = self->_database;
    v10 = v8;
    v11 = database;
    v12 = objc_opt_self();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __67__HDDatabaseJournalDatabase__appendData_entryClass_database_error___block_invoke;
    v16[3] = &unk_1E6CFB5E8;
    v18 = v12;
    v19 = a4;
    v17 = v10;
    v13 = v10;
    v14 = -[HDSQLiteDatabase performTransactionWithType:error:usingBlock:](v11, "performTransactionWithType:error:usingBlock:", 1, a5, v16);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("Cannot append data because journal database is not open"));
    v14 = 0;
  }

  return v14;
}

- (void)_clearCachedProperties
{
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 8), "removeAllCachedResourceValues");
    v2 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v3 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

  }
}

- (void)close
{
  HDSQLiteDatabase *database;
  HDSQLiteDatabase *v3;

  database = self->_database;
  self->_database = 0;
  v3 = database;

  -[HDSQLiteDatabase close](v3, "close");
}

- (BOOL)createAndOpenForWritingWithError:(id *)a3
{
  id v6;
  void *v7;
  int v8;
  BOOL v9;
  void *v11;
  void *v12;

  if (-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_databaseURL, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseJournalDatabase.m"), 141, CFSTR("Cannot create and open %@ because it is already open"), v12);

  }
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[NSURL URLByDeletingLastPathComponent](self->_databaseURL, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v7, 1, 0, a3);

  if (!v8)
    goto LABEL_7;
  -[HDDatabaseJournalDatabase _createDatabaseConnectionWithURL:]((uint64_t)self, self->_databaseURL);
  if ((+[HDDatabaseJournalDatabase _openDatabase:error:]((uint64_t)HDDatabaseJournalDatabase, self->_database, (uint64_t)a3) & 1) == 0)
  {
    -[HDDatabaseJournalDatabase close](self, "close");
LABEL_7:
    v9 = 0;
    goto LABEL_8;
  }
  -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
  v9 = 1;
LABEL_8:

  return v9;
}

- (void)_createDatabaseConnectionWithURL:(uint64_t)a1
{
  objc_class *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0D29850];
    v4 = a2;
    v5 = objc_msgSend([v3 alloc], "initWithDatabaseURL:", v4);

    v6 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v5;

    objc_msgSend(*(id *)(a1 + 16), "setFileProtectionType:", *MEMORY[0x1E0CB2AB8]);
    v7 = _Block_copy(*(const void **)(a1 + 64));
    if (v7)
    {
      v8 = v7;
      (*((void (**)(void *, uint64_t))v7 + 2))(v7, a1);
      v7 = v8;
    }

  }
}

+ (uint64_t)_openDatabase:(uint64_t)a3 error:
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v4 = a2;
  objc_opt_self();
  if (!objc_msgSend(v4, "openWithError:", a3))
  {
    v6 = v4;
    objc_opt_self();
    v12 = 0;
    v7 = v6;
    objc_opt_self();
    v8 = objc_msgSend(v7, "userVersionWithDatabaseName:error:", 0, &v12);

    v9 = v12;
    if (v8 == 1)
    {
LABEL_4:
      v5 = 1;
LABEL_10:

      goto LABEL_11;
    }
    if ((v8 & 0x8000000000000000) != 0)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:underlyingError:", a3, 100, CFSTR("Unable to read schema version"), v9);
    }
    else
    {
      if (v8 < 2)
      {
        v11 = v7;
        objc_opt_self();
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke;
        v13[3] = &unk_1E6CFB5C0;
        v14 = &unk_1E6DF9AB8;
        v5 = objc_msgSend(v11, "performTransactionWithType:error:usingBlock:", 1, a3, v13);

        if (!(_DWORD)v5)
          goto LABEL_10;
        goto LABEL_4;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a3, 116, CFSTR("Journal database schema version '%ld' greater than current '%ld'"), v8, 1);
    }
    v5 = 0;
    goto LABEL_10;
  }
  v5 = 0;
LABEL_11:

  return v5;
}

- (unsigned)enumerateEntriesWithProfile:(id)a3 transaction:(id)a4 error:(id *)a5 handler:(id)a6
{
  id v9;
  id v10;
  id v11;
  HDKeyValueDomain *unitTesting_keyValueDomainOverride;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HDKeyValueDomain *v17;
  HDKeyValueDomain *keyValueDomain;
  HDKeyValueDomain *v19;
  HDKeyValueDomain *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  int64_t enumeratedBytesThreshold;
  HDSQLiteDatabase *v28;
  HDSQLiteDatabase *v29;
  uint64_t v30;
  uint64_t v31;
  unsigned int v32;
  HDSQLiteDatabase *database;
  uint64_t v34;
  HDKeyValueDomain *v35;
  id v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  HDKeyValueDomain *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  _QWORD v56[5];
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t *v67;
  uint64_t v68;
  uint64_t v69;
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[2];
  _BYTE buf[24];
  void *v74;
  uint64_t *v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  int64_t v79;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a6;
  if (-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
  {
    v51 = v10;
    v54 = 0;
    -[HDDatabaseJournalDatabase _getIdentifierAndCreationDate:error:]((uint64_t)self, 0, (uint64_t)&v54);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v54;
    if (v52)
    {
      v11 = v9;
      if (self)
      {
        unitTesting_keyValueDomainOverride = self->_unitTesting_keyValueDomainOverride;
        if (!unitTesting_keyValueDomainOverride)
        {
          unitTesting_keyValueDomainOverride = self->_keyValueDomain;
          if (!unitTesting_keyValueDomainOverride)
          {
            v13 = (void *)MEMORY[0x1E0CB3940];
            -[HDDatabaseJournalDatabase journalPath](self, "journalPath");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "lastPathComponent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringWithFormat:", CFSTR("JournalDatabase-%@"), v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            v17 = -[HDKeyValueDomain initWithCategory:domainName:profile:]([HDKeyValueDomain alloc], "initWithCategory:domainName:profile:", 100, v16, v11);
            keyValueDomain = self->_keyValueDomain;
            self->_keyValueDomain = v17;

            unitTesting_keyValueDomainOverride = self->_keyValueDomain;
          }
        }
        v19 = unitTesting_keyValueDomainOverride;
      }
      else
      {
        v19 = 0;
      }

      v72[0] = CFSTR("IDENTIFIER");
      v72[1] = CFSTR("anchor");
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 2);
      v20 = (HDKeyValueDomain *)objc_claimAutoreleasedReturnValue();
      -[HDKeyValueDomain valuesForKeys:error:](v19, "valuesForKeys:error:", v20, a5);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (!v21)
      {
        v32 = 0;
LABEL_52:

        goto LABEL_53;
      }
      objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("anchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "longLongValue");

      objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("IDENTIFIER"));
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v52, "isEqualToString:", v49))
        v25 = v24;
      else
        v25 = 0;
      _HKInitializeLogging();
      v26 = *MEMORY[0x1E0CB52B0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB52B0], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v25;
        _os_log_impl(&dword_1B7802000, v26, OS_LOG_TYPE_INFO, "Enumerate %@ from anchor %lld", buf, 0x16u);
      }
      enumeratedBytesThreshold = self->_enumeratedBytesThreshold;
      v28 = self->_database;
      v48 = v51;
      objc_opt_self();
      v29 = v28;
      objc_opt_self();
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v30 = MEMORY[0x1E0C809B0];
      v69 = 0;
      v61 = MEMORY[0x1E0C809B0];
      v62 = 3221225472;
      v63 = (uint64_t)__61__HDDatabaseJournalDatabase__maxEntryAnchorInDatabase_error___block_invoke;
      v64 = &unk_1E6CE8540;
      v65 = &v66;
      if (-[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](v29, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT MAX(ROWID) FROM entries"), a5, 0, &v61))v31 = v67[3];
      else
        v31 = -1;
      _Block_object_dispose(&v66, 8);

      if (v31 < 0)
      {

LABEL_50:
        v32 = 0;
LABEL_51:

        goto LABEL_52;
      }
      v36 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v61 = 0;
      v62 = (uint64_t)&v61;
      v63 = 0x2020000000;
      v64 = 0;
      v66 = 0;
      v67 = &v66;
      v68 = 0x2020000000;
      v69 = v25;
      v57 = 0;
      v58 = &v57;
      v59 = 0x2020000000;
      v60 = 3;
      v56[0] = v30;
      v56[1] = 3221225472;
      v56[2] = __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke;
      v56[3] = &__block_descriptor_40_e23_v16__0__sqlite3_stmt__8l;
      v56[4] = v25;
      *(_QWORD *)buf = v30;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke_2;
      v74 = &unk_1E6CFB610;
      v76 = &v66;
      v77 = &v61;
      v37 = (uint64_t *)v36;
      v78 = &v57;
      v79 = enumeratedBytesThreshold;
      v75 = v37;
      if ((-[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](v29, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT entries.ROWID AS anchor, string, size, data FROM entries INNER JOIN unique_strings ON unique_strings.ROWID = entries.class_name WHERE anchor > ? ORDER BY anchor ASC"), a5, v56, buf) & 1) != 0)
      {
        v38 = objc_msgSend(v37, "count");
        v39 = v67[3];
        if (v38)
        {
          v40 = *(_QWORD *)(v62 + 24);
          v55 = 0;
          v32 = (*((uint64_t (**)(id, uint64_t *, uint64_t, BOOL, id *))v48 + 2))(v48, v37, v40, v39 >= v31, &v55);
          v41 = v55;
          if (v32 - 3 >= 2)
          {
            v43 = v41;
            v44 = v43;
            if (v43)
            {
              if (a5)
                *a5 = objc_retainAutorelease(v43);
              else
                _HKLogDroppedError();
            }

            v39 = v67[3];
LABEL_48:

            _Block_object_dispose(&v57, 8);
            _Block_object_dispose(&v66, 8);
            _Block_object_dispose(&v61, 8);

            if (v32 - 3 > 1)
              goto LABEL_51;
            v71[0] = v52;
            v70[0] = CFSTR("IDENTIFIER");
            v70[1] = CFSTR("anchor");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v39);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v71[1] = v45;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
            v46 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v45) = -[HDKeyValueDomain setValuesWithDictionary:error:](v19, "setValuesWithDictionary:error:", v46, a5);
            if ((_DWORD)v45)
              goto LABEL_51;
            goto LABEL_50;
          }

          v39 = v67[3];
          if (v32 != 3)
          {
            v32 = 4;
            goto LABEL_48;
          }
        }
      }
      else
      {
        if ((*((_DWORD *)v58 + 6) - 3) < 2)
        {
          v32 = 0;
          v39 = v25;
          goto LABEL_48;
        }
        v39 = v25;
      }
      v32 = *((_DWORD *)v58 + 6);
      goto LABEL_48;
    }
    v53 = 0;
    if (self)
    {
      v61 = 0;
      v62 = (uint64_t)&v61;
      v63 = 0x2020000000;
      v64 = 0;
      database = self->_database;
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __54__HDDatabaseJournalDatabase__hasEmptySchemaWithError___block_invoke;
      v74 = &unk_1E6CE8540;
      v75 = &v61;
      if ((-[HDSQLiteDatabase executeSQL:error:bindingHandler:enumerationHandler:](database, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT COUNT(*) FROM sqlite_master"), &v53, 0, buf) & 1) != 0)
      {
        v34 = *(_QWORD *)(v62 + 24);
        _Block_object_dispose(&v61, 8);
        v19 = (HDKeyValueDomain *)v53;
        if (v34 < 1)
        {
          v32 = 3;
LABEL_54:

          v10 = v51;
          goto LABEL_55;
        }
        v35 = (HDKeyValueDomain *)v50;
        v20 = v35;
        if (v35)
        {
          if (a5)
          {
            v20 = objc_retainAutorelease(v35);
            v32 = 0;
            *a5 = v20;
LABEL_53:

            goto LABEL_54;
          }
          _HKLogDroppedError();
        }
LABEL_59:
        v32 = 0;
        goto LABEL_53;
      }
      _Block_object_dispose(&v61, 8);
      v42 = (HDKeyValueDomain *)v53;
      v20 = v42;
      if (v42)
      {
        if (a5)
        {
          v20 = objc_retainAutorelease(v42);
          v32 = 0;
          *a5 = v20;
        }
        else
        {
          _HKLogDroppedError();
          v32 = 0;
        }
        v19 = v20;
        goto LABEL_53;
      }
    }
    else
    {
      v20 = 0;
    }
    v19 = 0;
    goto LABEL_59;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a5, 3, CFSTR("Cannot enumerate data because journal database is not open"));
  v32 = 0;
LABEL_55:

  return v32;
}

- (BOOL)flushDataToDisk:(id *)a3
{
  return 1;
}

- (BOOL)openForReadingWithError:(id *)a3
{
  char v6;
  void *v8;
  void *v9;

  if (-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_databaseURL, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseJournalDatabase.m"), 245, CFSTR("Cannot open %@ because it is already open"), v9);

  }
  -[HDDatabaseJournalDatabase _createDatabaseConnectionWithURL:]((uint64_t)self, self->_databaseURL);
  v6 = +[HDDatabaseJournalDatabase _openDatabase:error:]((uint64_t)HDDatabaseJournalDatabase, self->_database, (uint64_t)a3);
  if ((v6 & 1) == 0)
    -[HDDatabaseJournalDatabase close](self, "close");
  return v6;
}

- (unsigned)readVersionWithError:(id *)a3
{
  return 6;
}

- (BOOL)removeWithError:(id *)a3
{
  id v6;
  void *v7;
  char v8;
  void *v10;
  void *v11;

  if (-[HDDatabaseJournalDatabase isOpen](self, "isOpen"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](self->_databaseURL, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDDatabaseJournalDatabase.m"), 265, CFSTR("Cannot remove %@ because it is still open"), v11);

  }
  -[HDDatabaseJournalDatabase _clearCachedProperties]((uint64_t)self);
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  -[NSURL URLByDeletingLastPathComponent](self->_databaseURL, "URLByDeletingLastPathComponent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "removeItemAtURL:error:", v7, a3);

  return v8;
}

uint64_t __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;

  v5 = a2;
  if (objc_msgSend(v5, "executeSQLStatements:error:", *(_QWORD *)(a1 + 32), a3)
    && objc_msgSend(v5, "executeUncachedSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT OR IGNORE INTO key_value_store (key, value, modification_date) VALUES (?, ?, ?)"), a3, &__block_literal_global_120, 0))
  {
    v6 = objc_msgSend(v5, "setUserVersion:withDatabaseName:error:", 1, 0, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __60__HDDatabaseJournalDatabase__createSchemaForDatabase_error___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  void *v3;
  void *v4;
  double Current;

  HDSQLiteBindStringToStatement();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  HDSQLiteBindStringToStatement();

  Current = CFAbsoluteTimeGetCurrent();
  return sqlite3_bind_double(a2, 3, Current);
}

uint64_t __67__HDDatabaseJournalDatabase__appendData_entryClass_database_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;

  v5 = a2;
  v6 = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0CB6F18], "sharedBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentOSBuild");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = +[HDDatabaseJournalDatabase _getIDForString:database:error:](v6, v8, v5, a3);

  if (v9 < 1
    || (v10 = *(_QWORD *)(a1 + 40),
        NSStringFromClass(*(Class *)(a1 + 48)),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = +[HDDatabaseJournalDatabase _getIDForString:database:error:](v10, v11, v5, a3),
        v11,
        v12 < 1))
  {
    v16 = 0;
  }
  else
  {
    v13 = *(id *)(a1 + 32);
    v14 = v5;
    objc_opt_self();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __90__HDDatabaseJournalDatabase__insertData_osBuildStringID_classNameStringID_database_error___block_invoke;
    v18[3] = &unk_1E6CE8518;
    v20 = v9;
    v21 = v12;
    v19 = v13;
    v15 = v13;
    v16 = objc_msgSend(v14, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO entries (os_build, class_name, size, data) VALUES (?, ?, ?, ?)"), a3, v18, 0);

  }
  return v16;
}

+ (uint64_t)_getIDForString:(void *)a3 database:(uint64_t)a4 error:
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[5];
  _QWORD v16[4];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = a2;
  v7 = a3;
  objc_opt_self();
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = -1;
  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke;
  v16[3] = &unk_1E6CE9508;
  v9 = v6;
  v17 = v9;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_2;
  v15[3] = &unk_1E6CE8540;
  v15[4] = &v18;
  if ((objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("SELECT ROWID FROM unique_strings WHERE string = ?"), a4, v16, v15) & 1) != 0)
  {
    v10 = v19[3];
    if (v10 <= 0)
    {
      v13[0] = v8;
      v13[1] = 3221225472;
      v13[2] = __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_3;
      v13[3] = &unk_1E6CE9508;
      v14 = v9;
      if (objc_msgSend(v7, "executeSQL:error:bindingHandler:enumerationHandler:", CFSTR("INSERT INTO unique_strings (string) VALUES (?)"), a4, v13, 0))
      {
        objc_msgSend(v7, "lastInsertRowID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v11, "longLongValue");

      }
      else
      {
        v10 = -1;
      }

    }
  }
  else
  {
    v10 = -1;
  }

  _Block_object_dispose(&v18, 8);
  return v10;
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_2(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __60__HDDatabaseJournalDatabase__getIDForString_database_error___block_invoke_3()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __90__HDDatabaseJournalDatabase__insertData_osBuildStringID_classNameStringID_database_error___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 40));
  sqlite3_bind_int64(a2, 2, *(_QWORD *)(a1 + 48));
  sqlite3_bind_int64(a2, 3, objc_msgSend(*(id *)(a1 + 32), "length"));
  return HDSQLiteBindFoundationValueToStatement();
}

uint64_t __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  return sqlite3_bind_int64(a2, 1, *(_QWORD *)(a1 + 32));
}

BOOL __103__HDDatabaseJournalDatabase__enumerateEntriesInDatabase_anchor_enumeratedBytesThreshold_error_handler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  HDJournalChapterItem *v8;
  unint64_t v9;
  unint64_t v10;
  _BOOL8 v11;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB1D4](a2, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = HDSQLiteColumnAsInt64();
  MEMORY[0x1BCCAB18C](a2, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) += v5;
  v7 = (void *)a1[4];
  v8 = -[HDJournalChapterItem initWithEntryClassName:serializedEntryData:]([HDJournalChapterItem alloc], "initWithEntryClassName:serializedEntryData:", v4, v6);
  objc_msgSend(v7, "addObject:", v8);

  v9 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
  v10 = a1[8];
  if (v9 >= v10)
    *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = 4;
  v11 = v9 < v10;

  return v11;
}

uint64_t __61__HDDatabaseJournalDatabase__maxEntryAnchorInDatabase_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __54__HDDatabaseJournalDatabase__hasEmptySchemaWithError___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = HDSQLiteColumnAsInt64();
  return 1;
}

uint64_t __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke()
{
  return HDSQLiteBindStringToStatement();
}

uint64_t __65__HDDatabaseJournalDatabase__getIdentifierAndCreationDate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  MEMORY[0x1BCCAB1D4](a2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = MEMORY[0x1BCCAB1A4](a2, 1);
  return 1;
}

- (HDSQLiteDatabase)unitTesting_underlyingDatabase
{
  return self->_database;
}

- (void)setUnitTesting_underlyingDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void)unitTesting_setEnumeratedBytesThreshold:(int64_t)a3
{
  self->_enumeratedBytesThreshold = a3;
}

- (HDKeyValueDomain)unitTesting_keyValueDomainOverride
{
  return self->_unitTesting_keyValueDomainOverride;
}

- (void)setUnitTesting_keyValueDomainOverride:(id)a3
{
  objc_storeStrong((id *)&self->_unitTesting_keyValueDomainOverride, a3);
}

- (id)unitTesting_didCreateDatabaseConnectionHandler
{
  return self->_unitTesting_didCreateDatabaseConnectionHandler;
}

- (void)setUnitTesting_didCreateDatabaseConnectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTesting_didCreateDatabaseConnectionHandler, 0);
  objc_storeStrong((id *)&self->_unitTesting_keyValueDomainOverride, 0);
  objc_storeStrong((id *)&self->_keyValueDomain, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_size, 0);
  objc_storeStrong((id *)&self->_database, 0);
  objc_storeStrong((id *)&self->_databaseURL, 0);
}

@end
