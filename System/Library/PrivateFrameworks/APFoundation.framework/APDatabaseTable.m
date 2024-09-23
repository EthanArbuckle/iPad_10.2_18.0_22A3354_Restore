@implementation APDatabaseTable

- (APDatabaseTable)initWithDatabaseManager:(id)a3
{
  id v4;
  APDatabaseTable *v5;
  APDatabaseTable *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  APDatabaseTable *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)APDatabaseTable;
  v5 = -[APDatabaseTable init](&v12, sel_init);
  v6 = v5;
  if (v5 && (objc_storeWeak((id *)&v5->_manager, v4), !objc_msgSend__tableExists(v6, v7, v8, v9)))
    v10 = 0;
  else
    v10 = v6;

  return v10;
}

- (APDatabaseManager)manager
{
  return (APDatabaseManager *)objc_loadWeakRetained((id *)&self->_manager);
}

- (NSString)tableName
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (Class)rowClass
{
  APSimulateCrash((const char *)5, CFSTR("Error: Path 'rowClass' to be implemented for each subclass."), 0);
  return (Class)objc_opt_class();
}

- (id)selectAll
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  void *v13;
  NSObject *v14;
  id v15;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend_manager(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(v6, v9, (uint64_t)CFSTR("SELECT rowid, * FROM %@"), v10, v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_executeSelectQuery_forTable_withParameters_(v5, v12, (uint64_t)v11, (uint64_t)self, MEMORY[0x1E0C9AA60]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    APLogForCategory(0xBuLL);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v18 = (id)objc_opt_class();
      v15 = v18;
      _os_log_impl(&dword_1CF251000, v14, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to select all.", buf, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)_tableExists
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  APDatabaseColumn *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  NSObject *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  BOOL v20;
  id v21;
  NSObject *v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend_manager(self, a2, v2, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [APDatabaseColumn alloc];
    objc_msgSend_tableName(self, v7, v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend_initWithName_forColumnType_withValue_(v6, v11, (uint64_t)CFSTR("name"), 3, v10);

    v23 = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v13, (uint64_t)&v23, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_executeSelectStringsQuery_withParameters_(v5, v15, (uint64_t)CFSTR("SELECT name FROM sqlite_master WHERE type='table' AND name=?"), (uint64_t)v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = objc_msgSend_count(v16, v17, v18, v19) != 0;
  }
  else
  {
    APLogForCategory(0xBuLL);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138477827;
      v25 = (id)objc_opt_class();
      v21 = v25;
      _os_log_impl(&dword_1CF251000, v12, OS_LOG_TYPE_ERROR, "[%{private}@]: Database manager is nil when trying to select all.", buf, 0xCu);

    }
    v20 = 0;
  }

  return v20;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_manager);
}

@end
