@implementation CalAccountsDatabaseMigrationReadOnlyAccountStore

- (CalAccountsDatabaseMigrationReadOnlyAccountStore)initWithDatabaseURL:(id)a3
{
  id v4;
  CalAccountsDatabaseMigrationReadOnlyAccountStore *v5;
  id v6;
  int v7;
  NSObject *v8;
  CalAccountsDatabaseMigrationReadOnlyAccountStore *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalAccountsDatabaseMigrationReadOnlyAccountStore;
  v5 = -[CalAccountsDatabaseMigrationReadOnlyAccountStore init](&v11, sel_init);
  if (v5
    && (objc_msgSend(v4, "path"),
        v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        v7 = sqlite3_open((const char *)objc_msgSend(v6, "UTF8String"), &v5->_database),
        v6,
        v7))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore initWithDatabaseURL:].cold.1(&v5->_database);

    sqlite3_close(v5->_database);
    v9 = 0;
  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (void)dealloc
{
  objc_super v3;

  sqlite3_close(self->_database);
  v3.receiver = self;
  v3.super_class = (Class)CalAccountsDatabaseMigrationReadOnlyAccountStore;
  -[CalAccountsDatabaseMigrationReadOnlyAccountStore dealloc](&v3, sel_dealloc);
}

- (id)accountWithIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  sqlite3_stmt *v6;
  int v7;
  NSObject *v8;
  sqlite3_stmt *v9;
  int v10;
  sqlite3_stmt *v11;
  id v12;
  CalAccountsDatabaseMigrationReadOnlyAccount *v13;
  int v15;
  NSObject *v16;
  const unsigned __int8 *v17;
  int v18;
  int v19;
  const unsigned __int8 *v20;
  int v21;
  int v22;
  void *v23;
  const unsigned __int8 *v24;
  const void *v25;
  int v26;
  BOOL v27;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  const unsigned __int8 *v34;
  uint64_t v35;
  const unsigned __int8 *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  CalAccountsDatabaseMigrationReadOnlyAccount *v43;
  void *v44;
  int v45;
  int v46;
  const unsigned __int8 *v47;
  const unsigned __int8 *v48;
  const unsigned __int8 *v49;
  int v50;
  int v51[2];
  sqlite3_stmt *ppStmt;

  v4 = a3;
  ppStmt = 0;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZACCOUNT.Z_PK, ZPARENTACCOUNT, ZACCOUNTTYPE.ZIDENTIFIER, ZACCOUNTDESCRIPTION, ZVISIBLE, ZAUTHENTICATED, ZUSERNAME, ? IN (SELECT Z_7ENABLEDDATACLASSES FROM Z_2ENABLEDDATACLASSES WHERE Z_2ENABLEDACCOUNTS = ZACCOUNT.Z_PK), ? IN (SELECT Z_7PROVISIONEDDATACLASSES FROM Z_2PROVISIONEDDATACLASSES WHERE Z_2PROVISIONEDACCOUNTS = ZACCOUNT.Z_PK) FROM ZACCOUNT JOIN ZACCOUNTTYPE ON (ZACCOUNT.ZACCOUNTTYPE = ZACCOUNTTYPE.Z_PK) WHERE ZACCOUNT.ZIDENTIFIER = ?", -1, &ppStmt, 0))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
LABEL_4:

LABEL_16:
      v13 = 0;
      goto LABEL_17;
    }
LABEL_3:
    -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(&self->_database);
    goto LABEL_4;
  }
  v6 = ppStmt;
  v7 = objc_msgSend((id)objc_opt_class(), "_calendarDataClassIdentifier:", self->_database);
  if (sqlite3_bind_int(v6, 1, v7))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
LABEL_7:
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.6(&self->_database);
LABEL_14:

LABEL_15:
    sqlite3_finalize(ppStmt);
    goto LABEL_16;
  }
  v9 = ppStmt;
  v10 = objc_msgSend((id)objc_opt_class(), "_calendarDataClassIdentifier:", self->_database);
  if (sqlite3_bind_int(v9, 2, v10))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    goto LABEL_7;
  }
  v11 = ppStmt;
  v12 = objc_retainAutorelease(v4);
  if (sqlite3_bind_text(v11, 3, (const char *)objc_msgSend(v12, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.5(&self->_database);
    goto LABEL_14;
  }
  v15 = sqlite3_step(ppStmt);
  if (v15 != 100)
  {
    if (v15 == 101)
    {
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.2();

      goto LABEL_15;
    }
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.1(&self->_database);
    goto LABEL_14;
  }
  v50 = sqlite3_column_int(ppStmt, 0);
  v49 = sqlite3_column_text(ppStmt, 1);
  v48 = sqlite3_column_text(ppStmt, 2);
  v17 = sqlite3_column_text(ppStmt, 3);
  v18 = sqlite3_column_int(ppStmt, 4);
  v19 = sqlite3_column_int(ppStmt, 5);
  v20 = sqlite3_column_text(ppStmt, 6);
  v21 = sqlite3_column_int(ppStmt, 7);
  v22 = sqlite3_column_int(ppStmt, 8);
  sqlite3_finalize(ppStmt);
  if (sqlite3_prepare_v2(self->_database, "SELECT ZKEY, ZVALUE FROM ZACCOUNTPROPERTY WHERE ZOWNER = ?", -1, &ppStmt, 0))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v5 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    goto LABEL_3;
  }
  v45 = v22;
  v46 = v21;
  v47 = v20;
  if (sqlite3_bind_int(ppStmt, 1, v50))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.3(&self->_database);
    goto LABEL_14;
  }
  *(_QWORD *)v51 = v17;
  v23 = (void *)objc_opt_new();
  while (sqlite3_step(ppStmt) == 100)
  {
    v24 = sqlite3_column_text(ppStmt, 0);
    v25 = sqlite3_column_blob(ppStmt, 1);
    v26 = sqlite3_column_bytes(ppStmt, 1);
    if (v24)
      v27 = v25 == 0;
    else
      v27 = 1;
    if (!v27 && v26 != 0)
    {
      v29 = v26;
      v30 = (void *)objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", v25, v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "_unarchiveData:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v24);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, v33);

    }
  }
  sqlite3_finalize(ppStmt);
  v43 = [CalAccountsDatabaseMigrationReadOnlyAccount alloc];
  v34 = v49;
  if (v49)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v49);
    v35 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v35 = 0;
  }
  v36 = v48;
  v37 = *(_QWORD *)v51;
  v44 = (void *)v35;
  if (v48)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v48);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v38 = 0;
  }
  if (*(_QWORD *)v51)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", *(_QWORD *)v51);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v39 = 0;
  }
  if (v47)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    BYTE1(v42) = v19 != 0;
    v37 = *(_QWORD *)v51;
    LOBYTE(v42) = v18 != 0;
    v41 = v44;
    v13 = -[CalAccountsDatabaseMigrationReadOnlyAccount initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:](v43, "initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:", v12, v44, v38, v39, v46 != 0, v45 != 0, v42, v40, v23);

    v36 = v48;
    v34 = v49;
  }
  else
  {
    BYTE1(v42) = v19 != 0;
    LOBYTE(v42) = v18 != 0;
    v41 = v44;
    v13 = -[CalAccountsDatabaseMigrationReadOnlyAccount initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:](v43, "initWithIdentifier:parentIdentifier:accountTypeIdentifier:description:enabledForCalendarDataClass:provisionedForCalendarDataClass:visible:authenticated:username:properties:", v12, v44, v38, v39, v46 != 0, v45 != 0, v42, 0, v23);
  }
  if (v37)

  if (v36)
  if (v34)

LABEL_17:
  return v13;
}

- (id)topLevelAccountsWithAccountTypeIdentifier:(id)a3 error:(id *)a4
{
  sqlite3 **p_database;
  NSObject *v7;
  void *v9;
  const unsigned __int8 *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  p_database = &self->_database;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZIDENTIFIER FROM ZACCOUNT WHERE ZPARENTACCOUNT ISNULL", -1, &ppStmt, 0))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(p_database);

    if (a4)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCalAccountsDatabaseMigrationReadOnlyAccountStoreErrorDomain"), 0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    return 0;
  }
  else
  {
    v9 = (void *)objc_opt_new();
    if (sqlite3_step(ppStmt) == 100)
    {
      while (1)
      {
        v10 = sqlite3_column_text(ppStmt, 0);
        if (!v10)
          break;
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:](self, "accountWithIdentifier:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
          goto LABEL_16;
        objc_msgSend(v9, "addObject:", v12);

        if (sqlite3_step(ppStmt) != 100)
          goto LABEL_19;
      }
      +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CalAccountsDatabaseMigrationReadOnlyAccountStore topLevelAccountsWithAccountTypeIdentifier:error:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

LABEL_16:
      if (a4)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("kCalAccountsDatabaseMigrationReadOnlyAccountStoreErrorDomain"), 0, 0);
        *a4 = (id)objc_claimAutoreleasedReturnValue();
      }

      v9 = 0;
    }
LABEL_19:
    sqlite3_finalize(ppStmt);
    return v9;
  }
}

- (id)childAccountsForAccount:(id)a3 withTypeIdentifier:(id)a4
{
  id v5;
  sqlite3 **p_database;
  NSObject *v7;
  sqlite3_stmt *v8;
  id v9;
  NSObject *v10;
  void *v11;
  const unsigned __int8 *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  sqlite3_stmt *ppStmt;

  v5 = a3;
  ppStmt = 0;
  p_database = &self->_database;
  if (sqlite3_prepare_v2(self->_database, "SELECT ZIDENTIFIER FROM ZACCOUNT WHERE ZPARENTACCOUNT = ?", -1, &ppStmt, 0))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(p_database);

LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  v8 = ppStmt;
  objc_msgSend(v5, "identifier");
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  LODWORD(v8) = sqlite3_bind_text(v8, 1, (const char *)objc_msgSend(v9, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);

  if ((_DWORD)v8)
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore childAccountsForAccount:withTypeIdentifier:].cold.2(p_database);

    sqlite3_finalize(ppStmt);
    goto LABEL_9;
  }
  v11 = (void *)objc_opt_new();
  if (sqlite3_step(ppStmt) == 100)
  {
    while (1)
    {
      v13 = sqlite3_column_text(ppStmt, 0);
      if (!v13)
        break;
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:](self, "accountWithIdentifier:", v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_19;
      objc_msgSend(v11, "addObject:", v15);

      if (sqlite3_step(ppStmt) != 100)
        goto LABEL_20;
    }
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore childAccountsForAccount:withTypeIdentifier:].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);

LABEL_19:
    v11 = 0;
  }
LABEL_20:
  sqlite3_finalize(ppStmt);
LABEL_10:

  return v11;
}

+ (id)_unarchiveData:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  _QWORD v12[5];

  v12[4] = *MEMORY[0x24BDAC8D0];
  v3 = (objc_class *)MEMORY[0x24BDBCF20];
  v4 = a3;
  v5 = [v3 alloc];
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithArray:", v6);

  v11 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v7, v4, &v11);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v9 = v8;

  return v8;
}

+ (int)_calendarDataClassIdentifier:(sqlite3 *)a3
{
  _QWORD v4[6];

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __81__CalAccountsDatabaseMigrationReadOnlyAccountStore__calendarDataClassIdentifier___block_invoke;
  v4[3] = &__block_descriptor_48_e5_v8__0l;
  v4[4] = a3;
  v4[5] = a1;
  if (_calendarDataClassIdentifier__onceToken != -1)
    dispatch_once(&_calendarDataClassIdentifier__onceToken, v4);
  return _calendarDataClassIdentifier__dataClassID;
}

void __81__CalAccountsDatabaseMigrationReadOnlyAccountStore__calendarDataClassIdentifier___block_invoke(uint64_t a1)
{
  sqlite3 **v2;
  NSObject *v3;
  void *v4;
  const void *v5;
  void *v6;
  void *v7;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v2 = (sqlite3 **)(a1 + 32);
  if (sqlite3_prepare_v2(*(sqlite3 **)(a1 + 32), "SELECT Z_PK, ZNAME FROM ZDATACLASS", -1, &ppStmt, 0))
  {
    +[CalMigrationLog defaultCategory](CalMigrationLog, "defaultCategory");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[CalAccountsDatabaseMigrationReadOnlyAccountStore accountWithIdentifier:].cold.4(v2);

  }
  else
  {
    if (sqlite3_step(ppStmt) == 100)
    {
      while (1)
      {
        v4 = (void *)MEMORY[0x24BDBCE50];
        v5 = sqlite3_column_blob(ppStmt, 1);
        objc_msgSend(v4, "dataWithBytes:length:", v5, sqlite3_column_bytes(ppStmt, 1));
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "_unarchiveData:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(CFSTR("com.apple.Dataclass.Calendars"), "isEqual:", v7))
          break;

        if (sqlite3_step(ppStmt) != 100)
          goto LABEL_10;
      }
      _calendarDataClassIdentifier__dataClassID = sqlite3_column_int(ppStmt, 0);

    }
LABEL_10:
    sqlite3_finalize(ppStmt);
  }
}

- (void)initWithDatabaseURL:(sqlite3 *)a1 .cold.1(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to open database: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.1(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to execute query: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)accountWithIdentifier:.cold.2()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_215A53000, v0, OS_LOG_TYPE_ERROR, "Account not found for identifier: %@", v1, 0xCu);
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.3(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to bind account rowid: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.4(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to prepare statement: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.5(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to bind account identifier: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)accountWithIdentifier:(sqlite3 *)a1 .cold.6(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to bind calendar dataclass ID: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

- (void)topLevelAccountsWithAccountTypeIdentifier:(uint64_t)a3 error:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_215A53000, a1, a3, "Unexpected nil account identifier for account", a5, a6, a7, a8, 0);
}

- (void)childAccountsForAccount:(uint64_t)a3 withTypeIdentifier:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4_1(&dword_215A53000, a1, a3, "Unexpected nil account identifier for child account", a5, a6, a7, a8, 0);
}

- (void)childAccountsForAccount:(sqlite3 *)a1 withTypeIdentifier:.cold.2(sqlite3 **a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_2(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_215A53000, v1, v2, "Failed to bind parent account identifier: %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_2_1();
}

@end
