@implementation CXCallDirectoryStore

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removeIdentificationEntriesSQL, 0);
  objc_storeStrong((id *)&self->_addPhoneNumbersSQL, 0);
  objc_storeStrong((id *)&self->_addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL, 0);
  objc_storeStrong((id *)&self->_addIdentificationEntriesInsertLabelsSQL, 0);
  objc_storeStrong((id *)&self->_removeBlockingEntriesSQL, 0);
  objc_storeStrong((id *)&self->_addBlockingEntriesInsertPhoneNumberBlockingEntrySQL, 0);
  objc_storeStrong((id *)&self->_database, 0);
}

- (id)_sqlStringListPlaceholderStringWithNumberOfEntries:(int64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 1)
  {
    v5 = a3 + 1;
    do
    {
      objc_msgSend(v4, "addObject:", CFSTR("?"));
      --v5;
    }
    while (v5 > 1);
  }
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("(%@)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)initReadOnly:(BOOL)a3 temporary:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  _BOOL8 v7;
  void *v9;
  CXCallDirectoryStore *v10;

  v6 = a4;
  v7 = a3;
  objc_msgSend((id)objc_opt_class(), "databaseTemplateURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = -[CXCallDirectoryStore initWithTemplateURL:readOnly:temporary:error:](self, "initWithTemplateURL:readOnly:temporary:error:", v9, v7, v6, a5);
  }
  else
  {

    v10 = 0;
  }

  return v10;
}

- (CXCallDirectoryStore)initWithTemplateURL:(id)a3 readOnly:(BOOL)a4 temporary:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  CXCallDirectoryStore *v11;
  CXCallDirectoryStore *v12;
  void *v13;
  CXDatabase *v14;
  CXDatabase *database;
  CXDatabase *v16;
  objc_super v18;

  v8 = a4;
  v10 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CXCallDirectoryStore;
  v11 = -[CXCallDirectoryStore init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_temporary = a5;
    objc_msgSend((id)objc_opt_class(), "databaseURLUsingTemporaryDirectory:error:", v11->_temporary, a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_9;
    if (!objc_msgSend((id)objc_opt_class(), "initializeDatabaseIfNecessaryAtURL:usingTemplateAtURL:error:", v13, v10, a6))goto LABEL_9;
    v14 = -[CXDatabase initWithURL:readOnly:error:]([CXDatabase alloc], "initWithURL:readOnly:error:", v13, v8, a6);
    database = v12->_database;
    v12->_database = v14;

    v16 = v12->_database;
    if (!v16)
      goto LABEL_9;
    if (!v8)
    {
      if (!-[CXDatabase enableForeignKeysWithError:](v16, "enableForeignKeysWithError:", a6))
        goto LABEL_9;
      v16 = v12->_database;
    }
    if (-[CXDatabase setBusyTimeout:error:](v16, "setBusyTimeout:error:", a6, 120.0))
    {
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:

    v12 = 0;
    goto LABEL_10;
  }
LABEL_11:

  return v12;
}

+ (NSURL)databaseTemplateURL
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("CallDirectoryTemplate.db"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)firstIdentificationEntriesForEnabledExtensionsWithPhoneNumbers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT Extension.bundle_id, Label.localized_label, PhoneNumber.number FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number IN %@) GROUP BY PhoneNumber.number HAVING MIN(Extension.priority)"), 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStore _firstIdentificationEntriesForSQL:bindings:error:](self, "_firstIdentificationEntriesForSQL:bindings:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_firstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __73__CXCallDirectoryStore__firstIdentificationEntriesForSQL_bindings_error___block_invoke;
  v16[3] = &unk_1E4B89030;
  v12 = v11;
  v17 = v12;
  v13 = (void *)MEMORY[0x1A859A7A4](v16);
  LOBYTE(a5) = -[CXCallDirectoryStore _parseFirstIdentificationEntriesForSQL:bindings:handler:error:](self, "_parseFirstIdentificationEntriesForSQL:bindings:handler:error:", v10, v9, v13, a5);

  if ((a5 & 1) == 0)
  {

    v12 = 0;
  }
  v14 = (void *)objc_msgSend(v12, "copy");

  return v14;
}

- (BOOL)_parseFirstIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CXCallDirectoryStore *v21;
  id v22;

  v10 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __86__CXCallDirectoryStore__parseFirstIdentificationEntriesForSQL_bindings_handler_error___block_invoke;
  v20 = &unk_1E4B89058;
  v21 = self;
  v22 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  v14 = (void *)MEMORY[0x1A859A7A4](&v17);
  -[CXCallDirectoryStore database](self, "database", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v15, "selectSQL:withBindings:expectedColumnCount:transient:resultRowHandler:error:", v13, v12, 3, 1, v14, a6);

  return (char)a6;
}

- (CXDatabase)database
{
  return self->_database;
}

+ (BOOL)initializeDatabaseIfNecessaryAtURL:(id)a3 usingTemplateAtURL:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  int v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  int v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

  if ((v11 & 1) == 0)
  {
    objc_msgSend(v8, "path");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v9, "fileExistsAtPath:", v12);

    if (v13)
    {
      v14 = objc_msgSend(v9, "copyItemAtURL:toURL:error:", v8, v7, a5);
      CXDefaultLog();
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v15;
      if (v14)
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v19 = 138412546;
          v20 = v8;
          v21 = 2112;
          v22 = v7;
          _os_log_impl(&dword_1A402D000, v16, OS_LOG_TYPE_DEFAULT, "Copied database template from URL %@ to URL %@", (uint8_t *)&v19, 0x16u);
        }

        goto LABEL_7;
      }
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        +[CXCallDirectoryStore initializeDatabaseIfNecessaryAtURL:usingTemplateAtURL:error:].cold.1((uint64_t)v8, (uint64_t)v7, v16);

    }
    else if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "cx_callDirectoryStoreErrorWithCode:", 1);
      v17 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    v17 = 0;
    goto LABEL_14;
  }
LABEL_7:
  v17 = 1;
LABEL_14:

  return v17;
}

+ (id)databaseURLUsingTemporaryDirectory:(BOOL)a3 error:(id *)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  int v16;
  void *v17;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0C99E98];
  if (v5)
  {
    NSTemporaryDirectory();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "globallyUniqueString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fileURLWithPath:isDirectory:", v11, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
      goto LABEL_3;
LABEL_8:
    v17 = 0;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/var/mobile/Library"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
    goto LABEL_8;
LABEL_3:
  objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", CFSTR("CallDirectory"), 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v6, "fileExistsAtPath:", v14);

  if ((v15 & 1) != 0
    || (v16 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v13, 1, 0, a4),
        v17 = 0,
        v16))
  {
    objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("CallDirectory.db"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_9:
  return v17;
}

- (id)initForReadingAndWritingWithError:(id *)a3
{
  return -[CXCallDirectoryStore initReadOnly:temporary:error:](self, "initReadOnly:temporary:error:", 0, 0, a3);
}

- (void)dealloc
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "database");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1(&dword_1A402D000, v2, v3, "Error closing database %@: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_5_0();
}

- (BOOL)isTemporary
{
  return self->_temporary;
}

- (id)initForReadingWithError:(id *)a3
{
  return -[CXCallDirectoryStore initReadOnly:temporary:error:](self, "initReadOnly:temporary:error:", 1, 0, a3);
}

- (CXCallDirectoryStore)init
{

  return 0;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[CXCallDirectoryStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p database=%@>"), v4, self, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[CXCallDirectoryStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (int64_t)schemaVersion
{
  int64_t v2;
  id v3;
  NSObject *v4;
  id v6;
  uint8_t buf[4];
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v2 = -[CXCallDirectoryStore schemaVersionWithError:](self, "schemaVersionWithError:", &v6);
  v3 = v6;
  if (v2 == -1)
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v3;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] Error querying schema version, possibly because the schema is too old. Error: %@", buf, 0xCu);
    }

    v2 = 0;
  }

  return v2;
}

- (int64_t)schemaVersionWithError:(id *)a3
{
  void *v5;
  void *v6;
  int64_t v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = -1;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__CXCallDirectoryStore_schemaVersionWithError___block_invoke;
  v9[3] = &unk_1E4B88F18;
  v9[4] = &v10;
  v5 = (void *)MEMORY[0x1A859A7A4](v9, a2);
  -[CXCallDirectoryStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT MAX(version) FROM SchemaVersion"), MEMORY[0x1E0C9AA60], 1, v5, a3);

  v7 = v11[3];
  _Block_object_dispose(&v10, 8);
  return v7;
}

void __47__CXCallDirectoryStore_schemaVersionWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "objectAtIndexedSubscript:", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

- (BOOL)isCorrupt
{
  int64_t v2;
  id v3;
  void *v4;
  BOOL v5;
  void *v6;
  id v8;

  v8 = 0;
  v2 = -[CXCallDirectoryStore schemaVersionWithError:](self, "schemaVersionWithError:", &v8);
  v3 = v8;
  v4 = v3;
  if (v2 == -1)
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.callkit.database.sqlite")))
      v5 = objc_msgSend(v4, "code") == 11;
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)containsExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  -[CXCallDirectoryStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __62__CXCallDirectoryStore_containsExtensionWithIdentifier_error___block_invoke;
  v10[3] = &unk_1E4B88F18;
  v10[4] = &v11;
  objc_msgSend(v7, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT EXISTS (SELECT 1 FROM Extension WHERE bundle_id = ?)"), v8, 1, v10, a4);

  LOBYTE(a4) = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);

  return (char)a4;
}

void __62__CXCallDirectoryStore_containsExtensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

}

- (id)extensionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__CXCallDirectoryStore_extensionWithIdentifier_error___block_invoke;
  v13[3] = &unk_1E4B88F18;
  v13[4] = &v14;
  v7 = (void *)MEMORY[0x1A859A7A4](v13);
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id, bundle_id, priority, state, state_last_modified FROM Extension WHERE bundle_id = ?"), v9, 5, v7, a4);

  if ((_DWORD)a4)
    v10 = (id)v15[5];
  else
    v10 = 0;
  v11 = v10;

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __54__CXCallDirectoryStore_extensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  CXCallDirectoryStoreExtension *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = objc_alloc_init(CXCallDirectoryStoreExtension);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPrimaryKey:", objc_msgSend(v7, "longLongValue"));

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setIdentifier:", v8);

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setPriority:", objc_msgSend(v9, "longLongValue"));

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setState:", objc_msgSend(v10, "longLongValue"));

  v11 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "doubleValue");
  objc_msgSend(v11, "dateWithTimeIntervalSince1970:");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setStateLastModified:", v12);

}

- (int64_t)addExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v7, "executeSQL:withBindings:error:", CFSTR("INSERT INTO Extension (bundle_id, priority, state_last_modified) VALUES (?, (SELECT IFNULL(MAX(priority), 0) + 1 FROM Extension), ((julianday('now') - 2440587.5)*86400.0))"), v8, a4);

  if ((_DWORD)a4)
  {
    -[CXCallDirectoryStore database](self, "database");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "lastInsertedRowID");

    notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }
  else
  {
    v10 = -1;
  }

  return v10;
}

- (int64_t)addExtensionWithIdentifier:(id)a3 priority:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int64_t v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v9, "executeSQL:withBindings:error:", CFSTR("INSERT INTO Extension (bundle_id, priority, state_last_modified) VALUES (?, ?, ((julianday('now') - 2440587.5)*86400.0))"), v11, a5);

  if ((_DWORD)a5)
  {
    -[CXCallDirectoryStore database](self, "database");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "lastInsertedRowID");

    notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }
  else
  {
    v13 = -1;
  }

  return v13;
}

- (BOOL)removeExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "executeSQL:withBindings:transient:error:", CFSTR("DELETE FROM Extension WHERE (bundle_id = ?)"), v8, 1, a4);

  if (v9)
  {
    -[CXCallDirectoryStore database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countOfRecordsModifiedByLastQuery");

    if (v11 >= 1)
      notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }

  return v9;
}

- (BOOL)setState:(int64_t)a3 forExtensionWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "executeSQL:withBindings:error:", CFSTR("UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0) WHERE (bundle_id = ?)"), v11, a5);

  if (v12)
  {
    -[CXCallDirectoryStore database](self, "database");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countOfRecordsModifiedByLastQuery");

    if (v14 >= 1)
      notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }

  return v12;
}

- (BOOL)setState:(int64_t)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5
{
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "executeSQL:withBindings:error:", CFSTR("UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0) WHERE (id = ?)"), v12, a5);

  if (v13)
  {
    -[CXCallDirectoryStore database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "countOfRecordsModifiedByLastQuery");

    if (v15 >= 1)
      notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }
  return v13;
}

- (BOOL)setStateLastModifiedDate:(id)a3 forExtensionWithID:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSince1970");
  v12 = v11;

  objc_msgSend(v10, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v9, "executeSQL:withBindings:error:", CFSTR("UPDATE Extension SET state_last_modified = ? WHERE (id = ?)"), v15, a5);

  if (v16)
  {
    -[CXCallDirectoryStore database](self, "database");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countOfRecordsModifiedByLastQuery");

    if (v18 >= 1)
      notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }
  return v16;
}

- (BOOL)setStateForAllExtensions:(int64_t)a3 error:(id *)a4
{
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[CXCallDirectoryStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "executeSQL:withBindings:error:", CFSTR("UPDATE Extension SET state = ?, state_last_modified = ((julianday('now') - 2440587.5)*86400.0)"), v9, a4);

  if (v10)
  {
    -[CXCallDirectoryStore database](self, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countOfRecordsModifiedByLastQuery");

    if (v12 >= 1)
      notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
  }
  return v10;
}

- (BOOL)removeUnreferencedRecordsWithError:(id *)a3
{
  _BOOL4 v5;

  v5 = -[CXCallDirectoryStore _removeUnreferencedPhoneNumbersWithError:](self, "_removeUnreferencedPhoneNumbersWithError:");
  if (v5)
    LOBYTE(v5) = -[CXCallDirectoryStore _removeUnreferencedLabelsWithError:](self, "_removeUnreferencedLabelsWithError:", a3);
  return v5;
}

- (BOOL)_removeUnreferencedPhoneNumbersWithError:(id *)a3
{
  void *v4;

  -[CXCallDirectoryStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "executeSQL:error:", CFSTR("DELETE FROM PhoneNumber WHERE id NOT IN (SELECT DISTINCT phone_number_id FROM PhoneNumberIdentificationEntry UNION SELECT DISTINCT phone_number_id FROM PhoneNumberBlockingEntry)"), a3);

  return (char)a3;
}

- (BOOL)_removeUnreferencedLabelsWithError:(id *)a3
{
  void *v4;

  -[CXCallDirectoryStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "executeSQL:error:", CFSTR("DELETE FROM Label WHERE id NOT IN (SELECT DISTINCT label_id FROM PhoneNumberIdentificationEntry)"), a3);

  return (char)a3;
}

- (id)prioritizedExtensionsWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__CXCallDirectoryStore_prioritizedExtensionsWithError___block_invoke;
  v11[3] = &unk_1E4B88F40;
  v6 = v5;
  v12 = v6;
  v7 = (void *)MEMORY[0x1A859A7A4](v11);
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id, bundle_id, priority, state, state_last_modified FROM Extension ORDER BY priority"), MEMORY[0x1E0C9AA60], 5, v7, a3);

  if ((a3 & 1) == 0)
  {

    v6 = 0;
  }
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

void __55__CXCallDirectoryStore_prioritizedExtensionsWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CXCallDirectoryStoreExtension *v11;

  v3 = a2;
  v11 = objc_alloc_init(CXCallDirectoryStoreExtension);
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreExtension setPrimaryKey:](v11, "setPrimaryKey:", objc_msgSend(v4, "longLongValue"));

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreExtension setIdentifier:](v11, "setIdentifier:", v5);

  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreExtension setPriority:](v11, "setPriority:", objc_msgSend(v6, "longLongValue"));

  objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreExtension setState:](v11, "setState:", objc_msgSend(v7, "longLongValue"));

  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "doubleValue");
  objc_msgSend(v8, "dateWithTimeIntervalSince1970:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreExtension setStateLastModified:](v11, "setStateLastModified:", v10);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
}

- (id)prioritizedExtensionIdentifiersWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __65__CXCallDirectoryStore_prioritizedExtensionIdentifiersWithError___block_invoke;
  v11[3] = &unk_1E4B88F40;
  v6 = v5;
  v12 = v6;
  v7 = (void *)MEMORY[0x1A859A7A4](v11);
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT bundle_id FROM Extension ORDER BY priority"), MEMORY[0x1E0C9AA60], 1, v7, a3);

  if ((a3 & 1) == 0)
  {

    v6 = 0;
  }
  v9 = (void *)objc_msgSend(v6, "copy");

  return v9;
}

void __65__CXCallDirectoryStore_prioritizedExtensionIdentifiersWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

- (BOOL)setPrioritizedExtensionIdentifiers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  BOOL v10;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    -[CXCallDirectoryStore _sqlCaseMappingPlaceholderStringWithKeyColumnName:defaultValue:numberOfPairs:](self, "_sqlCaseMappingPlaceholderStringWithKeyColumnName:defaultValue:numberOfPairs:", CFSTR("bundle_id"), CFSTR("priority"), objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UPDATE Extension SET priority = %@"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke;
    v12[3] = &unk_1E4B88F68;
    v12[4] = self;
    v13 = v6;
    v14 = v8;
    v9 = v8;
    v10 = -[CXCallDirectoryStore performTransactionWithBlock:error:](self, "performTransactionWithBlock:error:", v12, a4);

  }
  else
  {
    v10 = 1;
  }

  return v10;
}

uint64_t __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(id, id *);
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  uint64_t v15;
  char v16;
  id v17;
  NSObject *v18;
  id v20;

  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_sqlBindingsForPrioritizedExtensionIdentifiers:withPriorityOffset:", *(_QWORD *)(a1 + 40), 0x3FFFFFFFFFFFFFFFLL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 48);
  v9 = (void *)objc_msgSend(v6, "copy");
  LODWORD(v8) = objc_msgSend(v7, "executeSQL:withBindings:error:", v8, v9, a3);

  if (!(_DWORD)v8)
    goto LABEL_4;
  objc_msgSend(*(id *)(a1 + 32), "_sqlBindingsForPrioritizedExtensionIdentifiers:withPriorityOffset:", *(_QWORD *)(a1 + 40), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "database");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 48);
  v13 = (void *)objc_msgSend(v10, "copy");
  v14 = objc_msgSend(v11, "executeSQL:withBindings:error:", v12, v13, a3);

  if (v14)
  {
    notify_post(CXCallDirectoryStoreExtensionsChangedNotification);
    v15 = 1;
  }
  else
  {
LABEL_4:
    v20 = 0;
    v16 = v5[2](v5, &v20);
    v17 = v20;
    if ((v16 & 1) == 0)
    {
      CXDefaultLog();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke_cold_1();

    }
    v15 = 0;
  }

  return v15;
}

- (id)_sqlCaseMappingPlaceholderStringWithKeyColumnName:(id)a3 defaultValue:(id)a4 numberOfPairs:(unint64_t)a5
{
  id v7;
  void *i;
  void *v9;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("CASE %@ "), a3);
  for (i = (void *)objc_claimAutoreleasedReturnValue(); a5; --a5)
    objc_msgSend(i, "appendFormat:", CFSTR("WHEN ? THEN ? "));
  objc_msgSend(i, "appendFormat:", CFSTR("ELSE %@ END"), v7);
  v9 = (void *)objc_msgSend(i, "copy");

  return v9;
}

- (id)_sqlBindingsForPrioritizedExtensionIdentifiers:(id)a3 withPriorityOffset:(int64_t)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v6, "addObject:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4 + v11 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      a4 += v11;
    }
    while (v9);
  }

  v13 = (void *)objc_msgSend(v6, "copy");
  return v13;
}

- (BOOL)addBlockingEntryWithPhoneNumber:(int64_t)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  CXCallDirectoryMutablePhoneNumberEntryData *v9;

  v9 = objc_alloc_init(CXCallDirectoryMutablePhoneNumberEntryData);
  -[CXCallDirectoryMutablePhoneNumberEntryData appendPhoneNumber:](v9, "appendPhoneNumber:", a3);
  LOBYTE(a5) = -[CXCallDirectoryStore addBlockingEntriesWithData:extensionID:error:](self, "addBlockingEntriesWithData:extensionID:error:", v9, a4, a5);

  return (char)a5;
}

- (BOOL)addBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CXCallDirectoryStore *v14;
  int64_t v15;

  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E4B88F90;
  v13 = v8;
  v14 = self;
  v15 = a4;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "performTransactionWithBlock:error:", v12, a5);

  return (char)a5;
}

uint64_t __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(id, id *);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if ((objc_msgSend(*(id *)(a1 + 40), "_addBlockingEntriesWithData:startIndex:count:extensionID:error:", *(_QWORD *)(a1 + 32), v6, v8, *(_QWORD *)(a1 + 48), a3) & 1) == 0)break;
      v6 += v8;
      if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_8;
    }
    v14 = 0;
    v10 = v5[2](v5, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();

    }
    v9 = 0;
  }
  else
  {
LABEL_8:
    v9 = 1;
  }

  return v9;
}

- (BOOL)_addBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  unint64_t v22;
  unint64_t v23;
  int64_t v24;

  v12 = a3;
  if (a5)
  {
    if (-[CXCallDirectoryStore lastAddBlockingEntriesCount](self, "lastAddBlockingEntriesCount") != a5)
    {
      -[CXCallDirectoryStore _sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:](self, "_sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:", a5, CFSTR("(?, (SELECT id FROM PhoneNumber WHERE (number = ?)))"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO PhoneNumberBlockingEntry (extension_id, phone_number_id) VALUES %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:](self, "setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:", v14);

      -[CXCallDirectoryStore setLastAddBlockingEntriesCount:](self, "setLastAddBlockingEntriesCount:", a5);
    }
    if (-[CXCallDirectoryStore _addPhoneNumbersWithEntryData:startIndex:count:error:](self, "_addPhoneNumbersWithEntryData:startIndex:count:error:", v12, a4, a5, a7))
    {
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __87__CXCallDirectoryStore__addBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke;
      v20[3] = &unk_1E4B88FB8;
      v22 = a5;
      v23 = a4;
      v24 = a6;
      v21 = v12;
      v15 = (void *)MEMORY[0x1A859A7A4](v20);
      -[CXCallDirectoryStore database](self, "database");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore addBlockingEntriesInsertPhoneNumberBlockingEntrySQL](self, "addBlockingEntriesInsertPhoneNumberBlockingEntrySQL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v16, "executeSQL:withStatementPreparationBlock:error:", v17, v15, a7);

    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 1;
  }

  return v18;
}

BOOL __87__CXCallDirectoryStore__addBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  char v11;

  v5 = a2;
  v6 = 0;
  v7 = 1;
  do
  {
    v8 = v6;
    v9 = *(_QWORD *)(a1 + 40);
    if (v9 <= v6)
      break;
    v10 = *(_QWORD *)(a1 + 48);
    if (!objc_msgSend(v5, "bindInt64:atIndex:error:", *(_QWORD *)(a1 + 56), v7, a3))
      break;
    v11 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v8 + (int)v10), (v7 + 1), a3);
    v6 = v8 + 1;
    v7 = (v7 + 2);
  }
  while ((v11 & 1) != 0);

  return v9 <= v8;
}

- (BOOL)removeBlockingEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CXCallDirectoryStore *v14;
  int64_t v15;

  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__CXCallDirectoryStore_removeBlockingEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E4B88F90;
  v13 = v8;
  v14 = self;
  v15 = a4;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "performTransactionWithBlock:error:", v12, a5);

  return (char)a5;
}

uint64_t __72__CXCallDirectoryStore_removeBlockingEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(id, id *);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if ((objc_msgSend(*(id *)(a1 + 40), "_removeBlockingEntriesWithData:startIndex:count:extensionID:error:", *(_QWORD *)(a1 + 32), v6, v8, *(_QWORD *)(a1 + 48), a3) & 1) == 0)break;
      v6 += v8;
      if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_8;
    }
    v14 = 0;
    v10 = v5[2](v5, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();

    }
    v9 = 0;
  }
  else
  {
LABEL_8:
    v9 = 1;
  }

  return v9;
}

- (BOOL)_removeBlockingEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a3;
  if (a5)
  {
    if (-[CXCallDirectoryStore lastRemoveBlockingEntriesCount](self, "lastRemoveBlockingEntriesCount") != a5)
    {
      -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM PhoneNumberBlockingEntry WHERE extension_id = ? AND phone_number_id IN (SELECT id FROM PhoneNumber WHERE number IN %@)"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setRemoveBlockingEntriesSQL:](self, "setRemoveBlockingEntriesSQL:", v14);

      -[CXCallDirectoryStore setLastRemoveBlockingEntriesCount:](self, "setLastRemoveBlockingEntriesCount:", a5);
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __90__CXCallDirectoryStore__removeBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke;
    v20[3] = &unk_1E4B88FB8;
    v22 = a6;
    v23 = a5;
    v24 = a4;
    v21 = v12;
    v15 = (void *)MEMORY[0x1A859A7A4](v20);
    -[CXCallDirectoryStore database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallDirectoryStore removeBlockingEntriesSQL](self, "removeBlockingEntriesSQL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "executeSQL:withStatementPreparationBlock:error:", v17, v15, a7);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

BOOL __90__CXCallDirectoryStore__removeBlockingEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  char v9;

  v5 = a2;
  if (objc_msgSend(v5, "bindInt64:atIndex:error:", *(_QWORD *)(a1 + 40), 1, a3))
  {
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = v7 <= v6;
      if (v7 <= v6)
        break;
      v9 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v6 + *(_DWORD *)(a1 + 56)), (v6 + 2), a3);
      ++v6;
    }
    while ((v9 & 1) != 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeBlockingEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CXCallDirectoryStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "executeSQL:withBindings:error:", CFSTR("DELETE FROM PhoneNumberBlockingEntry WHERE extension_id = ?"), v8, a4);

  return (char)a4;
}

- (BOOL)addIdentificationEntryWithPhoneNumber:(int64_t)a3 labelID:(int64_t)a4 extensionID:(int64_t)a5 error:(id *)a6
{
  int64_t v10;
  int64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  v10 = -[CXCallDirectoryStore _findOrCreateIDForPhoneNumber:error:](self, "_findOrCreateIDForPhoneNumber:error:", a3, a6);
  if (v10 == -1)
    return 0;
  v11 = v10;
  -[CXCallDirectoryStore database](self, "database");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v14;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "executeSQL:withBindings:error:", CFSTR("INSERT INTO PhoneNumberIdentificationEntry (extension_id, phone_number_id, label_id) VALUES (?, ?, ?)"), v16, a6);

  return v17;
}

- (int64_t)_findOrCreateIDForPhoneNumber:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int64_t v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = -1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "executeSQL:withBindings:error:", CFSTR("INSERT OR IGNORE INTO PhoneNumber (number) VALUES (?)"), v7, a4);

  if (v9)
  {
    -[CXCallDirectoryStore database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __60__CXCallDirectoryStore__findOrCreateIDForPhoneNumber_error___block_invoke;
    v13[3] = &unk_1E4B88F18;
    v13[4] = &v14;
    objc_msgSend(v10, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id FROM PhoneNumber WHERE (number = ?)"), v7, 1, v13, a4);

  }
  v11 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __60__CXCallDirectoryStore__findOrCreateIDForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

- (int64_t)idForExtensionWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __59__CXCallDirectoryStore_idForExtensionWithIdentifier_error___block_invoke;
  v11[3] = &unk_1E4B88F18;
  v11[4] = &v12;
  objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id FROM Extension WHERE (bundle_id = ?)"), v7, 1, v11, a4);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __59__CXCallDirectoryStore_idForExtensionWithIdentifier_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

- (int64_t)idForPhoneNumber:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __47__CXCallDirectoryStore_idForPhoneNumber_error___block_invoke;
  v11[3] = &unk_1E4B88F18;
  v11[4] = &v12;
  objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id FROM PhoneNumber WHERE (number = ?)"), v7, 1, v11, a4);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

void __47__CXCallDirectoryStore_idForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

- (int64_t)idForLabel:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = -1;
  v16[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __41__CXCallDirectoryStore_idForLabel_error___block_invoke;
  v11[3] = &unk_1E4B88F18;
  v11[4] = &v12;
  objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id FROM Label WHERE (localized_label = ?)"), v7, 1, v11, a4);

  v9 = v13[3];
  _Block_object_dispose(&v12, 8);

  return v9;
}

void __41__CXCallDirectoryStore_idForLabel_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "longLongValue");

}

- (int64_t)addLabel:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int64_t v11;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectoryStore database](self, "database", v13, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = objc_msgSend(v9, "executeSQL:withBindings:error:", CFSTR("INSERT INTO Label (localized_label) VALUES (?)"), v8, a4);

  if ((_DWORD)a4)
  {
    -[CXCallDirectoryStore database](self, "database");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "lastInsertedRowID");

  }
  else
  {
    v11 = -1;
  }

  return v11;
}

- (BOOL)addIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CXCallDirectoryStore *v14;
  int64_t v15;

  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__CXCallDirectoryStore_addIdentificationEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E4B88F90;
  v13 = v8;
  v14 = self;
  v15 = a4;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "performTransactionWithBlock:error:", v12, a5);

  return (char)a5;
}

uint64_t __75__CXCallDirectoryStore_addIdentificationEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(id, id *);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if ((objc_msgSend(*(id *)(a1 + 40), "_addIdentificationEntriesWithData:startIndex:count:extensionID:error:", *(_QWORD *)(a1 + 32), v6, v8, *(_QWORD *)(a1 + 48), a3) & 1) == 0)break;
      v6 += v8;
      if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_8;
    }
    v14 = 0;
    v10 = v5[2](v5, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();

    }
    v9 = 0;
  }
  else
  {
LABEL_8:
    v9 = 1;
  }

  return v9;
}

- (BOOL)_addIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  int64_t v27;
  _QWORD v28[4];
  id v29;
  unint64_t v30;
  unint64_t v31;
  int64_t v32;
  _QWORD v33[4];
  id v34;
  unint64_t v35;
  unint64_t v36;

  v12 = a3;
  if (a5)
  {
    if (-[CXCallDirectoryStore lastAddIdentificationEntriesCount](self, "lastAddIdentificationEntriesCount") != a5)
    {
      -[CXCallDirectoryStore _sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:](self, "_sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:", a5, CFSTR("(?)"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO Label (localized_label) VALUES %@"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setAddIdentificationEntriesInsertLabelsSQL:](self, "setAddIdentificationEntriesInsertLabelsSQL:", v14);

      -[CXCallDirectoryStore _sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:](self, "_sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:", a5, CFSTR("(?, (SELECT id FROM PhoneNumber WHERE (number = ?)), (SELECT id FROM Label WHERE (localized_label = ?)))"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT INTO PhoneNumberIdentificationEntry (extension_id, phone_number_id, label_id) VALUES %@"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:](self, "setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:", v16);

      -[CXCallDirectoryStore setLastAddIdentificationEntriesCount:](self, "setLastAddIdentificationEntriesCount:", a5);
    }
    if (-[CXCallDirectoryStore _addPhoneNumbersWithEntryData:startIndex:count:error:](self, "_addPhoneNumbersWithEntryData:startIndex:count:error:", v12, a4, a5, a7))
    {
      v27 = a6;
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke;
      v33[3] = &unk_1E4B88FE0;
      v35 = a5;
      v36 = a4;
      v17 = v12;
      v34 = v17;
      v18 = (void *)MEMORY[0x1A859A7A4](v33);
      -[CXCallDirectoryStore database](self, "database");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore addIdentificationEntriesInsertLabelsSQL](self, "addIdentificationEntriesInsertLabelsSQL");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v19, "executeSQL:withStatementPreparationBlock:error:", v20, v18, a7);

      if (v21)
      {
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke_2;
        v28[3] = &unk_1E4B88FB8;
        v30 = a5;
        v31 = a4;
        v29 = v17;
        v32 = v27;
        v22 = (void *)MEMORY[0x1A859A7A4](v28);
        -[CXCallDirectoryStore database](self, "database");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[CXCallDirectoryStore addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL](self, "addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v23, "executeSQL:withStatementPreparationBlock:error:", v24, v22, a7);

      }
      else
      {
        v25 = 0;
      }

    }
    else
    {
      v25 = 0;
    }
  }
  else
  {
    v25 = 1;
  }

  return v25;
}

uint64_t __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned __int16 v11;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = 0;
    while (1)
    {
      v7 = v6 + *(_DWORD *)(a1 + 48);
      v11 = 0;
      v8 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "utf8LabelAtIndex:length:", v7, &v11);
      if (!v8)
        break;
      v9 = objc_msgSend(v5, "bindText:ofLength:atIndex:error:", v8, v11, ++v6, a3);
      if ((v9 & 1) == 0 || *(_QWORD *)(a1 + 40) <= v6)
        goto LABEL_9;
    }
    v9 = 0;
  }
  else
  {
    v9 = 1;
  }
LABEL_9:

  return v9;
}

uint64_t __93__CXCallDirectoryStore__addIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int16 v13;

  v5 = a2;
  if (*(_QWORD *)(a1 + 40))
  {
    v6 = 0;
    v7 = 3;
    while (1)
    {
      v8 = (int)v6 + *(_DWORD *)(a1 + 48);
      v9 = objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", v8);
      v13 = 0;
      v10 = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "utf8LabelAtIndex:length:", v8, &v13);
      if (!objc_msgSend(v5, "bindInt64:atIndex:error:", *(_QWORD *)(a1 + 56), (v7 - 2), a3)
        || (objc_msgSend(v5, "bindInt64:atIndex:error:", v9, (v7 - 1), a3) & 1) == 0)
      {
        break;
      }
      v11 = objc_msgSend(v5, "bindText:ofLength:atIndex:error:", v10, v13, v7, a3);
      if ((v11 & 1) != 0)
      {
        ++v6;
        v7 = (v7 + 3);
        if (*(_QWORD *)(a1 + 40) > v6)
          continue;
      }
      goto LABEL_10;
    }
    v11 = 0;
  }
  else
  {
    v11 = 1;
  }
LABEL_10:

  return v11;
}

- (BOOL)_addPhoneNumbersWithEntryData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 error:(id *)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  _QWORD v18[4];
  id v19;
  unint64_t v20;
  unint64_t v21;

  v10 = a3;
  if (a5)
  {
    if (-[CXCallDirectoryStore lastAddPhoneNumbersCount](self, "lastAddPhoneNumbersCount") != a5)
    {
      -[CXCallDirectoryStore _sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:](self, "_sqlValuesListPlaceholderStringWithNumberOfEntries:entryString:", a5, CFSTR("(?)"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("INSERT OR IGNORE INTO PhoneNumber (number) VALUES %@"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setAddPhoneNumbersSQL:](self, "setAddPhoneNumbersSQL:", v12);

      -[CXCallDirectoryStore setLastAddPhoneNumbersCount:](self, "setLastAddPhoneNumbersCount:", a5);
    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __77__CXCallDirectoryStore__addPhoneNumbersWithEntryData_startIndex_count_error___block_invoke;
    v18[3] = &unk_1E4B88FE0;
    v20 = a5;
    v21 = a4;
    v19 = v10;
    v13 = (void *)MEMORY[0x1A859A7A4](v18);
    -[CXCallDirectoryStore database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallDirectoryStore addPhoneNumbersSQL](self, "addPhoneNumbersSQL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "executeSQL:withStatementPreparationBlock:error:", v15, v13, a6);

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

BOOL __77__CXCallDirectoryStore__addPhoneNumbersWithEntryData_startIndex_count_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v5 = a2;
  v6 = 0;
  do
  {
    v7 = v6;
    v8 = *(_QWORD *)(a1 + 40);
    if (v8 <= v6)
      break;
    v9 = objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v6++ + *(_DWORD *)(a1 + 48));
  }
  while ((objc_msgSend(v5, "bindInt64:atIndex:error:", v9, v7 + 1, a3) & 1) != 0);

  return v8 <= v7;
}

- (BOOL)removeIdentificationEntriesWithData:(id)a3 extensionID:(int64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  CXCallDirectoryStore *v14;
  int64_t v15;

  v8 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __78__CXCallDirectoryStore_removeIdentificationEntriesWithData_extensionID_error___block_invoke;
  v12[3] = &unk_1E4B88F90;
  v13 = v8;
  v14 = self;
  v15 = a4;
  v10 = v8;
  LOBYTE(a5) = objc_msgSend(v9, "performTransactionWithBlock:error:", v12, a5);

  return (char)a5;
}

uint64_t __78__CXCallDirectoryStore_removeIdentificationEntriesWithData_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t (**v5)(id, id *);
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;

  v5 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    v6 = 0;
    while (1)
    {
      v7 = objc_msgSend(*(id *)(a1 + 32), "count");
      v8 = v7 - v6 >= 0x1F4 ? 500 : v7 - v6;
      if ((objc_msgSend(*(id *)(a1 + 40), "_removeIdentificationEntriesWithData:startIndex:count:extensionID:error:", *(_QWORD *)(a1 + 32), v6, v8, *(_QWORD *)(a1 + 48), a3) & 1) == 0)break;
      v6 += v8;
      if (v6 >= objc_msgSend(*(id *)(a1 + 32), "count"))
        goto LABEL_8;
    }
    v14 = 0;
    v10 = v5[2](v5, &v14);
    v11 = v14;
    if ((v10 & 1) == 0)
    {
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1();

    }
    v9 = 0;
  }
  else
  {
LABEL_8:
    v9 = 1;
  }

  return v9;
}

- (BOOL)_removeIdentificationEntriesWithData:(id)a3 startIndex:(unint64_t)a4 count:(unint64_t)a5 extensionID:(int64_t)a6 error:(id *)a7
{
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  _QWORD v20[4];
  id v21;
  int64_t v22;
  unint64_t v23;
  unint64_t v24;

  v12 = a3;
  if (a5)
  {
    if (-[CXCallDirectoryStore lastRemoveIdentificationEntriesCount](self, "lastRemoveIdentificationEntriesCount") != a5)
    {
      -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", a5);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DELETE FROM PhoneNumberIdentificationEntry WHERE extension_id = ? AND phone_number_id IN (SELECT id FROM PhoneNumber WHERE number IN %@)"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStore setRemoveIdentificationEntriesSQL:](self, "setRemoveIdentificationEntriesSQL:", v14);

      -[CXCallDirectoryStore setLastRemoveIdentificationEntriesCount:](self, "setLastRemoveIdentificationEntriesCount:", a5);
    }
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __96__CXCallDirectoryStore__removeIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke;
    v20[3] = &unk_1E4B88FB8;
    v22 = a6;
    v23 = a5;
    v24 = a4;
    v21 = v12;
    v15 = (void *)MEMORY[0x1A859A7A4](v20);
    -[CXCallDirectoryStore database](self, "database");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[CXCallDirectoryStore removeIdentificationEntriesSQL](self, "removeIdentificationEntriesSQL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "executeSQL:withStatementPreparationBlock:error:", v17, v15, a7);

  }
  else
  {
    v18 = 1;
  }

  return v18;
}

BOOL __96__CXCallDirectoryStore__removeIdentificationEntriesWithData_startIndex_count_extensionID_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  _BOOL8 v8;
  char v9;

  v5 = a2;
  if (objc_msgSend(v5, "bindInt64:atIndex:error:", *(_QWORD *)(a1 + 40), 1, a3))
  {
    v6 = 0;
    do
    {
      v7 = *(_QWORD *)(a1 + 48);
      v8 = v7 <= v6;
      if (v7 <= v6)
        break;
      v9 = objc_msgSend(v5, "bindInt64:atIndex:error:", objc_msgSend(*(id *)(a1 + 32), "phoneNumberAtIndex:", (int)v6 + *(_DWORD *)(a1 + 56)), (v6 + 2), a3);
      ++v6;
    }
    while ((v9 & 1) != 0);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)removeIdentificationEntriesForExtensionWithID:(int64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  -[CXCallDirectoryStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "executeSQL:withBindings:error:", CFSTR("DELETE FROM PhoneNumberIdentificationEntry WHERE extension_id = ?"), v8, a4);

  return (char)a4;
}

- (BOOL)performTransactionWithBlock:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  -[CXCallDirectoryStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v7, "performTransactionWithBlock:error:", v6, a4);

  return (char)a4;
}

- (BOOL)containsBlockingEntryWithPhoneNumber:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[CXCallDirectoryStore containsBlockingEntryWithPhoneNumberInArray:error:](self, "containsBlockingEntryWithPhoneNumberInArray:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)containsBlockingEntryWithPhoneNumberInArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT EXISTS(SELECT 1 FROM PhoneNumberBlockingEntry INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id) WHERE (PhoneNumber.number IN %@) LIMIT 1)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CXCallDirectoryStore _containsBlockingEntryWithSQL:bindings:error:](self, "_containsBlockingEntryWithSQL:bindings:error:", v8, v6, a4);

  return (char)a4;
}

- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(a4) = -[CXCallDirectoryStore containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:error:](self, "containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:error:", v8, a4, v10, v11);
  return (char)a4;
}

- (BOOL)containsBlockingEntryForEnabledExtensionWithPhoneNumberInArray:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT EXISTS(SELECT 1 FROM PhoneNumberBlockingEntry INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberBlockingEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number IN %@) LIMIT 1)"), 4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = -[CXCallDirectoryStore _containsBlockingEntryWithSQL:bindings:error:](self, "_containsBlockingEntryWithSQL:bindings:error:", v8, v6, a4);

  return (char)a4;
}

- (BOOL)_containsBlockingEntryWithSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v8 = a3;
  v9 = a4;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[CXCallDirectoryStore database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__CXCallDirectoryStore__containsBlockingEntryWithSQL_bindings_error___block_invoke;
  v12[3] = &unk_1E4B88F18;
  v12[4] = &v13;
  objc_msgSend(v10, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", v8, v9, 1, v12, a5);

  LOBYTE(a5) = *((_BYTE *)v14 + 24);
  _Block_object_dispose(&v13, 8);

  return (char)a5;
}

void __69__CXCallDirectoryStore__containsBlockingEntryWithSQL_bindings_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "firstObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_msgSend(v3, "BOOLValue");

}

- (id)firstEnabledBlockingExtensionIdentifierForPhoneNumber:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT extension.bundle_id FROM Extension INNER JOIN PhoneNumberBlockingEntry ON PhoneNumberBlockingEntry.extension_id = Extension.id INNER JOIN PhoneNumber ON PhoneNumber.id = PhoneNumberBlockingEntry.phone_number_id WHERE (Extension.state = %ld AND PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1"), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__1;
  v17 = __Block_byref_object_dispose__1;
  v18 = 0;
  -[CXCallDirectoryStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__CXCallDirectoryStore_firstEnabledBlockingExtensionIdentifierForPhoneNumber_error___block_invoke;
  v12[3] = &unk_1E4B88F18;
  v12[4] = &v13;
  objc_msgSend(v8, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", v7, v9, 1, v12, a4);

  v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

void __84__CXCallDirectoryStore_firstEnabledBlockingExtensionIdentifierForPhoneNumber_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "firstObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringValue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)firstIdentificationEntryForPhoneNumber:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectoryStore _firstIdentificationEntryForSQL:bindings:error:](self, "_firstIdentificationEntryForSQL:bindings:error:", CFSTR("SELECT Extension.bundle_id, Label.localized_label FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1"), v8, a4, v11, v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstIdentificationEntriesForPhoneNumbers:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[CXCallDirectoryStore _sqlStringListPlaceholderStringWithNumberOfEntries:](self, "_sqlStringListPlaceholderStringWithNumberOfEntries:", objc_msgSend(v6, "count"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT Extension.bundle_id, Label.localized_label, PhoneNumber.number FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (PhoneNumber.number IN %@) GROUP BY PhoneNumber.number HAVING MIN(Extension.priority)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStore _firstIdentificationEntriesForSQL:bindings:error:](self, "_firstIdentificationEntriesForSQL:bindings:error:", v8, v6, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstIdentificationEntryForEnabledExtensionWithPhoneNumber:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("SELECT Extension.bundle_id, Label.localized_label FROM Label INNER JOIN PhoneNumberIdentificationEntry ON (Label.id = PhoneNumberIdentificationEntry.label_id) INNER JOIN PhoneNumber ON (PhoneNumber.id = PhoneNumberIdentificationEntry.phone_number_id) INNER JOIN Extension ON (Extension.id = PhoneNumberIdentificationEntry.extension_id) WHERE (Extension.state = %ld AND PhoneNumber.number = ?) ORDER BY Extension.priority LIMIT 1"), 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[CXCallDirectoryStore _firstIdentificationEntryForSQL:bindings:error:](self, "_firstIdentificationEntryForSQL:bindings:error:", v8, v9, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_firstIdentificationEntryForSQL:(id)a3 bindings:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[5];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v8 = a3;
  v9 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  v18 = __Block_byref_object_dispose__1;
  v19 = 0;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CXCallDirectoryStore__firstIdentificationEntryForSQL_bindings_error___block_invoke;
  v13[3] = &unk_1E4B89008;
  v13[4] = &v14;
  v10 = (void *)MEMORY[0x1A859A7A4](v13);
  -[CXCallDirectoryStore _parseIdentificationEntriesForSQL:bindings:handler:error:](self, "_parseIdentificationEntriesForSQL:bindings:handler:error:", v8, v9, v10, a5);
  v11 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v11;
}

void __71__CXCallDirectoryStore__firstIdentificationEntryForSQL_bindings_error___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

uint64_t __73__CXCallDirectoryStore__firstIdentificationEntriesForSQL_bindings_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", a3, a2);
}

void __86__CXCallDirectoryStore__parseFirstIdentificationEntriesForSQL_bindings_handler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_storeIdentificationEntryWithExtensionBundleID:localizedLabel:", v8, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (BOOL)_parseIdentificationEntriesForSQL:(id)a3 bindings:(id)a4 handler:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  CXCallDirectoryStore *v21;
  id v22;

  v10 = a5;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __81__CXCallDirectoryStore__parseIdentificationEntriesForSQL_bindings_handler_error___block_invoke;
  v20 = &unk_1E4B89058;
  v21 = self;
  v22 = v10;
  v11 = v10;
  v12 = a4;
  v13 = a3;
  v14 = (void *)MEMORY[0x1A859A7A4](&v17);
  -[CXCallDirectoryStore database](self, "database", v17, v18, v19, v20, v21);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v15, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", v13, v12, 2, v14, a6);

  return (char)a6;
}

void __81__CXCallDirectoryStore__parseIdentificationEntriesForSQL_bindings_handler_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_storeIdentificationEntryWithExtensionBundleID:localizedLabel:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_storeIdentificationEntryWithExtensionBundleID:(id)a3 localizedLabel:(id)a4
{
  id v5;
  id v6;
  CXCallDirectoryStoreIdentificationEntry *v7;

  v5 = a4;
  v6 = a3;
  v7 = objc_alloc_init(CXCallDirectoryStoreIdentificationEntry);
  -[CXCallDirectoryStoreIdentificationEntry setExtensionBundleIdentifier:](v7, "setExtensionBundleIdentifier:", v6);

  -[CXCallDirectoryStoreIdentificationEntry setLocalizedLabel:](v7, "setLocalizedLabel:", v5);
  return v7;
}

- (id)_sqlValuesListPlaceholderStringWithNumberOfEntries:(int64_t)a3 entryString:(id)a4
{
  id v5;
  void *v6;
  unint64_t v7;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 2)
  {
    v7 = a3 + 1;
    do
    {
      objc_msgSend(v6, "appendString:", v5);
      objc_msgSend(v6, "appendString:", CFSTR(", "));
      --v7;
    }
    while (v7 > 2);
    goto LABEL_6;
  }
  if (a3 == 1)
LABEL_6:
    objc_msgSend(v6, "appendString:", v5);

  return v6;
}

- (BOOL)vacuumWithError:(id *)a3
{
  void *v4;

  -[CXCallDirectoryStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "vacuumWithError:", a3);

  return (char)a3;
}

- (void)setDatabase:(id)a3
{
  objc_storeStrong((id *)&self->_database, a3);
}

- (void)setTemporary:(BOOL)a3
{
  self->_temporary = a3;
}

- (int64_t)lastAddBlockingEntriesCount
{
  return self->_lastAddBlockingEntriesCount;
}

- (void)setLastAddBlockingEntriesCount:(int64_t)a3
{
  self->_lastAddBlockingEntriesCount = a3;
}

- (NSString)addBlockingEntriesInsertPhoneNumberBlockingEntrySQL
{
  return self->_addBlockingEntriesInsertPhoneNumberBlockingEntrySQL;
}

- (void)setAddBlockingEntriesInsertPhoneNumberBlockingEntrySQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (int64_t)lastRemoveBlockingEntriesCount
{
  return self->_lastRemoveBlockingEntriesCount;
}

- (void)setLastRemoveBlockingEntriesCount:(int64_t)a3
{
  self->_lastRemoveBlockingEntriesCount = a3;
}

- (NSString)removeBlockingEntriesSQL
{
  return self->_removeBlockingEntriesSQL;
}

- (void)setRemoveBlockingEntriesSQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)lastAddIdentificationEntriesCount
{
  return self->_lastAddIdentificationEntriesCount;
}

- (void)setLastAddIdentificationEntriesCount:(int64_t)a3
{
  self->_lastAddIdentificationEntriesCount = a3;
}

- (NSString)addIdentificationEntriesInsertLabelsSQL
{
  return self->_addIdentificationEntriesInsertLabelsSQL;
}

- (void)setAddIdentificationEntriesInsertLabelsSQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL
{
  return self->_addIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL;
}

- (void)setAddIdentificationEntriesInsertPhoneNumberIdentificationEntrySQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (int64_t)lastAddPhoneNumbersCount
{
  return self->_lastAddPhoneNumbersCount;
}

- (void)setLastAddPhoneNumbersCount:(int64_t)a3
{
  self->_lastAddPhoneNumbersCount = a3;
}

- (NSString)addPhoneNumbersSQL
{
  return self->_addPhoneNumbersSQL;
}

- (void)setAddPhoneNumbersSQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (int64_t)lastRemoveIdentificationEntriesCount
{
  return self->_lastRemoveIdentificationEntriesCount;
}

- (void)setLastRemoveIdentificationEntriesCount:(int64_t)a3
{
  self->_lastRemoveIdentificationEntriesCount = a3;
}

- (NSString)removeIdentificationEntriesSQL
{
  return self->_removeIdentificationEntriesSQL;
}

- (void)setRemoveIdentificationEntriesSQL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

+ (void)initializeDatabaseIfNecessaryAtURL:(uint64_t)a1 usingTemplateAtURL:(uint64_t)a2 error:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A402D000, log, OS_LOG_TYPE_ERROR, "Error copying database template from URL %@ to URL %@", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __65__CXCallDirectoryStore_setPrioritizedExtensionIdentifiers_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "Error performing rollback: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__CXCallDirectoryStore_addBlockingEntriesWithData_extensionID_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_0(&dword_1A402D000, v0, v1, "Error rolling back from previous error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
