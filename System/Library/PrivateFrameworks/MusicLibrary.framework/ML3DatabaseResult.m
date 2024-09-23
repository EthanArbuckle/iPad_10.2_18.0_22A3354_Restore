@implementation ML3DatabaseResult

- (id)objectForFirstRowAndColumn
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__18457;
  v9 = __Block_byref_object_dispose__18458;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__ML3DatabaseResult_objectForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5B65200;
  v4[4] = &v5;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)enumerateRowsWithBlock:(id)a3
{
  void (**v4)(id, _QWORD, void *, unsigned __int8 *);
  ML3DatabaseStatement *statement;
  sqlite3_stmt *v6;
  ML3DatabaseConnection *v7;
  uint64_t v8;
  unsigned int v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  int v14;
  int v15;
  NSObject *v16;
  char *v17;
  ML3DatabaseStatement *v18;
  char *v19;
  NSObject *v20;
  const char *v21;
  void *v22;
  int64_t v23;
  ML3DatabaseRow *v24;
  unsigned __int8 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  _BYTE v29[18];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *, unsigned __int8 *))a3;
  statement = self->_statement;
  if (!statement)
    goto LABEL_30;
  v6 = -[ML3DatabaseStatement sqliteStatement](statement, "sqliteStatement");
  v24 = -[ML3DatabaseRow initWithParentResult:]([ML3DatabaseRow alloc], "initWithParentResult:", self);
  v7 = self->_connection;
  v25 = 0;
  -[ML3DatabaseConnection _ensureConnectionIsOpen](v7, "_ensureConnectionIsOpen");
  v8 = -[ML3DatabaseStatement setIsExecuting:](self->_statement, "setIsExecuting:", 1);
  v9 = 0;
  v23 = 0;
  while (2)
  {
    while (1)
    {
      v10 = (void *)MEMORY[0x1AF43CC0C](v8);
      v11 = sqlite3_step(v6);
      v25 = 0;
      if (v11 <= 0x19u)
        break;
      switch(v11)
      {
        case 0x1Au:
LABEL_6:
          if (-[ML3DatabaseConnection _alreadyAttemptedCorruptionRecovery](v7, "_alreadyAttemptedCorruptionRecovery"))
            goto LABEL_19;
          v12 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AC149000, v12, OS_LOG_TYPE_DEFAULT, "Attempting corruption recovery using disk IO recovery routine", buf, 2u);
          }

          v13 = -[ML3DatabaseConnection _handleDiskIOError](v7, "_handleDiskIOError");
          -[ML3DatabaseConnection _setAlreadyAttemptedCorruptionRecovery:](v7, "_setAlreadyAttemptedCorruptionRecovery:", 1);
          if (!v13)
          {
LABEL_19:
            ML3DatabaseCreateCorruptionError();
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[ML3DatabaseConnection _handleDatabaseCorruption](v7, "_handleDatabaseCorruption");
            if (!v22)
            {
LABEL_20:
              -[ML3DatabaseConnection sqliteError](v7, "sqliteError");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
            }
            v16 = os_log_create("com.apple.amp.medialibrary", "Default");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              v17 = (char *)objc_opt_class();
              v18 = self->_statement;
              *(_DWORD *)buf = 138543874;
              v27 = v17;
              v28 = 2114;
              *(_QWORD *)v29 = v18;
              *(_WORD *)&v29[8] = 2114;
              *(_QWORD *)&v29[10] = v22;
              v19 = v17;
              _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "[%{public}@] Error while enumerating rows for statement %{public}@. %{public}@", buf, 0x20u);

            }
LABEL_24:
            v4[2](v4, 0, v22, &v25);
            goto LABEL_25;
          }
          -[ML3DatabaseStatement reset](self->_statement, "reset");
          objc_autoreleasePoolPop(v10);
          break;
        case 0x65u:
          if (-[ML3DatabaseStatement clearBindingsAfterRunning](self->_statement, "clearBindingsAfterRunning"))
            -[ML3DatabaseStatement clearBindings](self->_statement, "clearBindings");
LABEL_34:
          v22 = 0;
          goto LABEL_25;
        case 0x64u:
LABEL_13:
          if (self->_limitProperty)
          {
            v23 += sqlite3_column_int64(v6, self->_limitIndex);
            if (v23 > self->_limitValue)
              goto LABEL_34;
          }
          ((void (**)(id, ML3DatabaseRow *, void *, unsigned __int8 *))v4)[2](v4, v24, 0, &v25);
          v14 = v25;
          objc_autoreleasePoolPop(v10);
          if (v14)
          {
            v22 = 0;
            goto LABEL_26;
          }
          break;
        default:
          goto LABEL_20;
      }
    }
    switch((char)v11)
    {
      case 0:
        goto LABEL_13;
      case 5:
      case 6:
        v15 = v11;
        if (!-[ML3DatabaseConnection _handleBusyLockWithNumberOfRetries:](v7, "_handleBusyLockWithNumberOfRetries:", v9))
        {
          ++v9;
          objc_autoreleasePoolPop(v10);
          continue;
        }
        -[ML3DatabaseConnection sqliteError](v7, "sqliteError");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _ML3LogCategoryDefault();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = "locked";
          *(_DWORD *)buf = 136315650;
          if (v15 == 5)
            v21 = "busy";
          v27 = v21;
          v28 = 1024;
          *(_DWORD *)v29 = v9;
          *(_WORD *)&v29[4] = 2114;
          *(_QWORD *)&v29[6] = v22;
          _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "(enumerateRowsWithBlock:) SQLite was %s after %u retries. %{public}@", buf, 0x1Cu);
        }

LABEL_25:
        objc_autoreleasePoolPop(v10);
LABEL_26:
        -[ML3DatabaseStatement setIsExecuting:](self->_statement, "setIsExecuting:", 0);
        if (objc_msgSend(v22, "code") == 500)
          -[ML3DatabaseConnection _handleDiskIOError](v7, "_handleDiskIOError");
        else
          -[ML3DatabaseStatement reset](self->_statement, "reset");

LABEL_30:
        return;
      case 10:
        ML3DatabaseCreateDiskIOError();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 11:
        goto LABEL_6;
      default:
        goto LABEL_20;
    }
  }
}

- (id)_statement
{
  return self->_statement;
}

- (ML3DatabaseResult)initWithStatement:(id)a3 connection:(id)a4
{
  id v7;
  id v8;
  ML3DatabaseResult *v9;
  ML3DatabaseResult *v10;
  NSDictionary *columnNameIndexMap;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)ML3DatabaseResult;
  v9 = -[ML3DatabaseResult init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_statement, a3);
    objc_storeStrong((id *)&v10->_connection, a4);
    columnNameIndexMap = v10->_columnNameIndexMap;
    v10->_columnNameIndexMap = 0;

  }
  return v10;
}

uint64_t __37__ML3DatabaseResult_hasAtLeastOneRow__block_invoke(uint64_t result, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  if (a2 && !a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_limitProperty, 0);
  objc_storeStrong((id *)&self->_columnNameIndexMap, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_statement, 0);
}

uint64_t __51__ML3DatabaseResult_int64ValueForFirstRowAndColumn__block_invoke(uint64_t result, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v5;

  if (!a3)
  {
    v5 = result;
    result = objc_msgSend(a2, "int64ForColumnIndex:");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 32) + 8) + 24) = result;
  }
  *a4 = 1;
  return result;
}

void __47__ML3DatabaseResult_objectForFirstRowAndColumn__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!a3)
  {
    objc_msgSend(a2, "objectAtIndexedSubscript:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;
}

- (int64_t)int64ValueForFirstRowAndColumn
{
  int64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __51__ML3DatabaseResult_int64ValueForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5B65200;
  v4[4] = &v5;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)hasAtLeastOneRow
{
  char v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __37__ML3DatabaseResult_hasAtLeastOneRow__block_invoke;
  v4[3] = &unk_1E5B65200;
  v4[4] = &v5;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (ML3DatabaseResult)init
{
  objc_class *v3;
  void *v4;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ init] is unsupported. Use -[%@ initWithStatement:] instead."), v4, v4);

  return 0;
}

- (void)setLimitProperty:(id)a3
{
  NSString *v4;
  NSString *limitProperty;
  id v6;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  limitProperty = self->_limitProperty;
  self->_limitProperty = v4;

  -[NSString pathExtension](self->_limitProperty, "pathExtension");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  self->_limitIndex = -[ML3DatabaseResult indexForColumnName:](self, "indexForColumnName:", v6);

}

- (void)setLimitProperty:(id)a3 limitValue:(int64_t)a4
{
  -[ML3DatabaseResult setLimitProperty:](self, "setLimitProperty:", a3);
  -[ML3DatabaseResult setLimitValue:](self, "setLimitValue:", a4);
}

- (unint64_t)indexForColumnName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v4 = a3;
  -[ML3DatabaseResult columnNameIndexMap](self, "columnNameIndexMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "unsignedIntegerValue");
  return v7;
}

- (id)columnNameIndexMap
{
  NSDictionary *columnNameIndexMap;
  int v4;
  NSDictionary *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  void *v9;
  NSDictionary *v10;

  columnNameIndexMap = self->_columnNameIndexMap;
  if (!columnNameIndexMap)
  {
    v4 = sqlite3_column_count(-[ML3DatabaseStatement sqliteStatement](self->_statement, "sqliteStatement"));
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    if (v4 >= 1)
    {
      v6 = 0;
      do
      {
        v7 = sqlite3_column_name(-[ML3DatabaseStatement sqliteStatement](self->_statement, "sqliteStatement"), v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v5, "setObject:forKeyedSubscript:", v8, v9);

        v6 = (v6 + 1);
      }
      while (v4 != (_DWORD)v6);
    }
    v10 = self->_columnNameIndexMap;
    self->_columnNameIndexMap = v5;

    columnNameIndexMap = self->_columnNameIndexMap;
  }
  return columnNameIndexMap;
}

- (id)rows
{
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __25__ML3DatabaseResult_rows__block_invoke;
  v6[3] = &unk_1E5B65EE0;
  v4 = v3;
  v7 = v4;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v6);

  return v4;
}

- (id)stringValueForFirstRowAndColumn
{
  id v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__18457;
  v9 = __Block_byref_object_dispose__18458;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__ML3DatabaseResult_stringValueForFirstRowAndColumn__block_invoke;
  v4[3] = &unk_1E5B65200;
  v4[4] = &v5;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (id)objectsInColumn:(unint64_t)a3
{
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__18457;
  v12 = __Block_byref_object_dispose__18458;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__ML3DatabaseResult_objectsInColumn___block_invoke;
  v7[3] = &unk_1E5B65228;
  v7[4] = &v8;
  v7[5] = a3;
  -[ML3DatabaseResult enumerateRowsWithBlock:](self, "enumerateRowsWithBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (NSString)limitProperty
{
  return self->_limitProperty;
}

- (int64_t)limitValue
{
  return self->_limitValue;
}

- (void)setLimitValue:(int64_t)a3
{
  self->_limitValue = a3;
}

void __37__ML3DatabaseResult_objectsInColumn___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (a3)
  {
    *a4 = 1;
  }
  else
  {
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    objc_msgSend(a2, "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = (id)v5;
    if (v5)
    {
      objc_msgSend(v4, "addObject:", v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v6);

    }
  }
}

void __52__ML3DatabaseResult_stringValueForFirstRowAndColumn__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  if (!a3)
  {
    objc_msgSend(a2, "stringForColumnIndex:");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  *a4 = 1;
}

void __25__ML3DatabaseResult_rows__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  ML3DatabaseCachedRow *v4;
  void *v5;
  ML3DatabaseCachedRow *v6;

  v3 = a2;
  v4 = [ML3DatabaseCachedRow alloc];
  objc_msgSend(v3, "arrayRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[ML3DatabaseCachedRow initWithArray:](v4, "initWithArray:", v5);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

@end
