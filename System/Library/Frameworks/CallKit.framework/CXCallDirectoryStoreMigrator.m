@implementation CXCallDirectoryStoreMigrator

- (CXCallDirectoryStoreMigrator)init
{
  CXCallDirectoryStoreMigrator *v2;
  CXCallDirectoryStoreMigrator *v3;
  id storeCreationBlock;
  id retrieveExtensionBlock;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CXCallDirectoryStoreMigrator;
  v2 = -[CXCallDirectoryStoreMigrator init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    storeCreationBlock = v2->_storeCreationBlock;
    v2->_storeCreationBlock = &__block_literal_global_7;

    retrieveExtensionBlock = v3->_retrieveExtensionBlock;
    v3->_retrieveExtensionBlock = &__block_literal_global_2;

  }
  return v3;
}

id __36__CXCallDirectoryStoreMigrator_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return -[CXCallDirectoryStore initForReadingAndWritingWithError:]([CXCallDirectoryStore alloc], "initForReadingAndWritingWithError:", a2);
}

uint64_t __36__CXCallDirectoryStoreMigrator_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", a2, a3);
}

- (id)performMigrationsWithError:(id *)a3
{
  void (**v5)(_QWORD, _QWORD);
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  -[CXCallDirectoryStoreMigrator storeCreationBlock](self, "storeCreationBlock");
  v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, id *))v5)[2](v5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CXCallDirectoryStoreMigrator setStore:](self, "setStore:", v6);

  -[CXCallDirectoryStoreMigrator store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (-[CXCallDirectoryStoreMigrator store](self, "store"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "schemaVersion"),
        v8,
        v9 == -1))
  {
    v10 = 0;
  }
  else
  {
    -[CXCallDirectoryStoreMigrator _performMigrationsStartingAtSchemaVersion:error:](self, "_performMigrationsStartingAtSchemaVersion:error:", v9, a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v10;
}

- (id)_performMigrationsStartingAtSchemaVersion:(int64_t)a3 error:(id *)a4
{
  CXCallDirectoryStoreMigrationResult *v7;
  void *v8;
  NSObject *p_super;
  void *v10;
  int v11;
  NSObject *v12;
  void (**v13)(_QWORD, _QWORD);
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  void *v27;
  char v28;
  int v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  int v43;
  void *v44;
  void *v45;
  int v46;
  uint64_t v47;
  _QWORD v49[5];
  uint8_t buf[4];
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v7 = objc_alloc_init(CXCallDirectoryStoreMigrationResult);
  -[CXCallDirectoryStoreMigrationResult setStartingSchemaVersion:](v7, "setStartingSchemaVersion:", a3);
  -[CXCallDirectoryStoreMigrationResult setEndingSchemaVersion:](v7, "setEndingSchemaVersion:", 5);
  -[CXCallDirectoryStoreMigrationResult setRequiresExtensionDisablement:](v7, "setRequiresExtensionDisablement:", 0);
  -[CXCallDirectoryStoreMigrationResult setRequiresExtensionSynchronization:](v7, "setRequiresExtensionSynchronization:", 0);
  switch(a3)
  {
    case -1:
    case 0:
    case 1:
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "url");
      p_super = objc_claimAutoreleasedReturnValue();

      -[CXCallDirectoryStoreMigrator setStore:](self, "setStore:", 0);
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "removeItemAtURL:error:", p_super, a4);

      if (!v11)
        goto LABEL_29;
      CXDefaultLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v51 = (uint64_t)p_super;
        _os_log_impl(&dword_1A402D000, v12, OS_LOG_TYPE_DEFAULT, "Successfully removed DB at URL %@", buf, 0xCu);
      }

      -[CXCallDirectoryStoreMigrator storeCreationBlock](self, "storeCreationBlock");
      v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id *))v13)[2](v13, a4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[CXCallDirectoryStoreMigrator setStore:](self, "setStore:", v14);

      -[CXCallDirectoryStoreMigrator store](self, "store");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v15)
        goto LABEL_29;
      -[CXCallDirectoryStoreMigrationResult setRequiresExtensionDisablement:](v7, "setRequiresExtensionDisablement:", 1);
      -[CXCallDirectoryStoreMigrationResult setRequiresExtensionSynchronization:](v7, "setRequiresExtensionSynchronization:", 1);

      goto LABEL_7;
    case 2:
LABEL_7:
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "database");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "namesOfColumnsInTableWithName:error:", CFSTR("Extension"), a4);
      p_super = objc_claimAutoreleasedReturnValue();

      if (!p_super)
      {
        v18 = v7;
        goto LABEL_32;
      }
      if ((-[NSObject containsObject:](p_super, "containsObject:", CFSTR("state")) & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ALTER TABLE Extension ADD COLUMN state INTEGER NOT NULL DEFAULT %ld"), 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[CXCallDirectoryStoreMigrator store](self, "store");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "database");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "executeSQL:error:", v18, a4);

        if (v21)
        {

          goto LABEL_11;
        }

LABEL_32:
        goto LABEL_33;
      }
LABEL_11:
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke;
      v49[3] = &unk_1E4B88F40;
      v49[4] = self;
      v22 = (void *)MEMORY[0x1A859A7A4](v49);
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "database");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "selectSQL:withBindings:expectedColumnCount:resultRowHandler:error:", CFSTR("SELECT id, bundle_id FROM Extension"), MEMORY[0x1E0C9AA60], 2, v22, a4);

      if (v25
        && (-[CXCallDirectoryStoreMigrator store](self, "store"),
            v26 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v26, "database"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_msgSend(v27, "executeSQL:withBindings:error:", CFSTR("UPDATE SchemaVersion SET version = ?"), &unk_1E4BA0B98, a4), v27, v26, (v28 & 1) != 0))
      {
        v29 = 1;
      }
      else
      {

        v29 = 0;
        v7 = 0;
      }

      if (!v29)
        goto LABEL_25;
LABEL_17:
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "database");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "namesOfColumnsInTableWithName:error:", CFSTR("Extension"), a4);
      p_super = objc_claimAutoreleasedReturnValue();

      if (!p_super)
        goto LABEL_29;
      if ((-[NSObject containsObject:](p_super, "containsObject:", CFSTR("state_last_modified")) & 1) == 0)
      {
        -[CXCallDirectoryStoreMigrator store](self, "store");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "database");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "executeSQL:error:", CFSTR("ALTER TABLE Extension ADD COLUMN state_last_modified REAL NOT NULL DEFAULT 0.0"), a4);

        if (!v34)
          goto LABEL_29;
      }
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "database");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "executeSQL:error:", CFSTR("UPDATE Extension SET state_last_modified = ((julianday('now') - 2440587.5)*86400.0)"), a4);

      if (!v37
        || (-[CXCallDirectoryStoreMigrator store](self, "store"),
            v38 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v38, "database"),
            v39 = (void *)objc_claimAutoreleasedReturnValue(),
            v40 = objc_msgSend(v39, "executeSQL:withBindings:error:", CFSTR("UPDATE SchemaVersion SET version = ?"), &unk_1E4BA0BB0, a4), v39, v38, (v40 & 1) == 0))
      {
LABEL_29:

LABEL_33:
        v7 = 0;
LABEL_34:

        return v7;
      }

LABEL_23:
      -[CXCallDirectoryStoreMigrator store](self, "store");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "database");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(v42, "executeSQL:error:", CFSTR("CREATE INDEX idx_PhoneNumberIdentificationEntry_FK_Label ON PhoneNumberIdentificationEntry(label_id)"), a4);

      if (!v43
        || (-[CXCallDirectoryStoreMigrator store](self, "store"),
            v44 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v44, "database"),
            v45 = (void *)objc_claimAutoreleasedReturnValue(),
            v46 = objc_msgSend(v45, "executeSQL:withBindings:error:", CFSTR("UPDATE SchemaVersion SET version = ?"), &unk_1E4BA0BC8, a4), v45, v44, !v46))
      {
        p_super = &v7->super;
        goto LABEL_33;
      }
LABEL_25:
      if (v7)
      {
        v47 = -[CXCallDirectoryStoreMigrationResult startingSchemaVersion](v7, "startingSchemaVersion");
        if (v47 < -[CXCallDirectoryStoreMigrationResult endingSchemaVersion](v7, "endingSchemaVersion"))
        {
          CXDefaultLog();
          p_super = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v51 = 5;
            _os_log_impl(&dword_1A402D000, p_super, OS_LOG_TYPE_DEFAULT, "Successfully migrated to schema version %ld", buf, 0xCu);
          }
          goto LABEL_34;
        }
      }
      return v7;
    case 3:
      goto LABEL_17;
    case 4:
      goto LABEL_23;
    default:
      goto LABEL_25;
  }
}

void __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  NSObject *v16;
  id v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  id v24;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "longLongValue");

  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "retrieveExtensionBlock");
  v7 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v18 = 0;
  ((void (**)(_QWORD, void *, id *))v7)[2](v7, v6, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;

  if (!v8)
  {
    CXDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke_cold_1((uint64_t)v6, (uint64_t)v9, v16);
    v15 = v9;
    goto LABEL_9;
  }
  if (objc_msgSend(v8, "isEnabledViaPlugInKit"))
  {
    objc_msgSend(*(id *)(a1 + 32), "store");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "database");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = &unk_1E4BA0B20;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v9;
    v14 = objc_msgSend(v11, "executeSQL:withBindings:error:", CFSTR("UPDATE Extension SET state = ? WHERE (id = ?)"), v13, &v17);
    v15 = v17;

    if ((v14 & 1) != 0)
    {
LABEL_10:
      v9 = v15;
      goto LABEL_11;
    }
    CXDefaultLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v20 = v6;
      v21 = 2048;
      v22 = v5;
      v23 = 2112;
      v24 = v15;
      _os_log_error_impl(&dword_1A402D000, v16, OS_LOG_TYPE_ERROR, "Error setting state to Enabled for extension with identifier '%@' (ID %lld): %@", buf, 0x20u);
    }
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

}

- (CXCallDirectoryStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (id)storeCreationBlock
{
  return self->_storeCreationBlock;
}

- (void)setStoreCreationBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)retrieveExtensionBlock
{
  return self->_retrieveExtensionBlock;
}

- (void)setRetrieveExtensionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retrieveExtensionBlock, 0);
  objc_storeStrong(&self->_storeCreationBlock, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

void __80__CXCallDirectoryStoreMigrator__performMigrationsStartingAtSchemaVersion_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1A402D000, log, OS_LOG_TYPE_ERROR, "Error retrieving NSExtension with identifier '%@': %@. Not migrating enabled status", (uint8_t *)&v3, 0x16u);
}

@end
