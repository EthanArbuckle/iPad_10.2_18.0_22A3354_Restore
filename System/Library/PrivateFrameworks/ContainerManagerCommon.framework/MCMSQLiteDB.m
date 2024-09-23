@implementation MCMSQLiteDB

- (id)childIdentifiersForParentIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  const unsigned __int8 *v16;
  const unsigned __int8 *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id (*v25)(uint64_t);
  void *v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  MCMSQLiteDB *v32;
  sqlite3 *v33;
  _QWORD v34[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v37;
  __int16 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v7, "SELECT child_bundles.child_code_signing_id_text FROM child_bundles, code_signing_info WHERE code_signing_info.code_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0))
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke;
    v34[3] = &unk_1E8CB6180;
    v34[4] = self;
    v34[5] = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke((uint64_t)v34);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = ppStmt;
  v10 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190;
    v30[3] = &unk_1E8CB6158;
    v31 = v10;
    v32 = self;
    v33 = v7;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190((uint64_t)v30);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v11 = 0;
  while (1)
  {
    do
    {
      v15 = sqlite3_step(ppStmt);
      if ((v15 - 102) <= 0xFFFFFFFD)
      {
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192;
        v29[3] = &unk_1E8CB6180;
        v29[4] = self;
        v29[5] = v7;
        __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192((uint64_t)v29);
        v8 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      if (v15 != 100)
      {
        v8 = 0;
        goto LABEL_6;
      }
      v16 = sqlite3_column_text(ppStmt, 0);
    }
    while (!v16);
    v17 = v16;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v16);
    if (!v18)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194;
      v28[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v28[4] = v17;
      __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194((uint64_t)v28);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    if (!v11)
    {
      v11 = (void *)objc_opt_new();
      if (!v11)
        break;
    }
    objc_msgSend(v11, "addObject:", v18);

  }
  __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_198();
  v22 = objc_claimAutoreleasedReturnValue();
LABEL_31:
  v8 = (id)v22;

LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v37 = v20;
      v38 = 1024;
      v39 = v21;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (!v8)
  {
    if (v11)
    {
      v8 = 0;
      goto LABEL_17;
    }
    v23 = MEMORY[0x1E0C809B0];
    v24 = 3221225472;
    v25 = __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203;
    v26 = &unk_1E8CB67B8;
    v27 = v6;
    __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203((uint64_t)&v23);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v27;
  }

  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v11 = 0;
    *a4 = v8;
  }
  else
  {
    v11 = 0;
  }
LABEL_17:
  v13 = (void *)objc_msgSend(v11, "copy", v23, v24, v25, v26);

  return v13;
}

- (sqlite3)db
{
  return self->_db;
}

- (id)codeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  _QWORD v17[4];
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v19 = 0;
  -[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:](self, "_selectCodeSigningEntryWithIdentifier:error:", v6, &v19);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v19;
  v9 = v8;
  if (v7)
  {
    v16 = v8;
    -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:](self, "childIdentifiersForParentIdentifier:error:", v6, &v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v16;

    if (v10)
    {
LABEL_3:
      -[NSObject setChildBundleIdentifiers:](v7, "setChildBundleIdentifiers:", v10);
      goto LABEL_19;
    }
    objc_msgSend(v11, "domain");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "isEqualToString:", CFSTR("MCMErrorDomain")))
    {
      v13 = objc_msgSend(v11, "code");

      if (v13 == 67)
      {

        v11 = 0;
        goto LABEL_3;
      }
    }
    else
    {

    }
    container_log_handle_for_category();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v11;
      _os_log_error_impl(&dword_1CF807000, v14, OS_LOG_TYPE_ERROR, "Error retrieving childBundleIds: %@", buf, 0xCu);
    }

  }
  else if (v8)
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v9;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "Error retrieving code signing entry: %@", buf, 0xCu);
    }
    v11 = v9;
  }
  else
  {
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke;
    v17[3] = &unk_1E8CB67B8;
    v18 = v6;
    __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v17);
    v11 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v18;
  }

  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    v10 = 0;
    v7 = 0;
    *a4 = v11;
  }
  else
  {
    v10 = 0;
    v7 = 0;
  }
LABEL_19:

  return v7;
}

- (id)_selectCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  uint64_t v8;
  id v9;
  sqlite3_stmt *v10;
  id v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  _QWORD v20[6];
  _QWORD v21[4];
  id v22;
  MCMSQLiteDB *v23;
  sqlite3 *v24;
  _QWORD v25[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  ppStmt = 0;
  v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v7, "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.registered_by_caller, code_signing_info.data_container_class FROM code_signing_info, code_signing_data WHERE code_signing_info.id = code_signing_data.cs_info_id AND code_signing_info.code_signing_id_text = ?;",
         -1,
         &ppStmt,
         0))
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke;
    v25[3] = &unk_1E8CB6180;
    v25[4] = self;
    v25[5] = v7;
    __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v25);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_3:
    v9 = (id)v8;
    goto LABEL_6;
  }
  v10 = ppStmt;
  v11 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(v10, 1, (const char *)objc_msgSend(v11, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113;
    v21[3] = &unk_1E8CB6158;
    v22 = v11;
    v23 = self;
    v24 = v7;
    __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113((uint64_t)v21);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_6;
  }
  v15 = sqlite3_step(ppStmt);
  if ((v15 - 102) <= 0xFFFFFFFD)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115;
    v20[3] = &unk_1E8CB6180;
    v20[4] = self;
    v20[5] = v7;
    __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115((uint64_t)v20);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_3;
  }
  if (v15 == 100)
  {
    v19 = 0;
    -[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:](self, "_codeSigningEntryFromStatementRow:error:", ppStmt, &v19);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v19;
    goto LABEL_7;
  }
  v9 = 0;
LABEL_6:
  v12 = 0;
LABEL_7:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v28 = v17;
      v29 = 1024;
      v30 = v18;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a4 && !v12)
    *a4 = objc_retainAutorelease(v9);

  return v12;
}

- (id)_codeSigningEntryFromStatementRow:(sqlite3_stmt *)a3 error:(id *)a4
{
  const void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  MCMCodeSigningEntry *v12;
  MCMCodeSigningEntry *v13;
  unsigned int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _QWORD v23[4];
  void *v24;
  _QWORD v25[4];
  void *v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  _QWORD v30[3];
  _QWORD v31[4];

  v31[3] = *MEMORY[0x1E0C80C00];
  v6 = sqlite3_column_blob(a3, 0);
  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", v6, sqlite3_column_bytes(a3, 0), 0);
    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v7, 0, 0, &v27);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v27;
    objc_opt_class();
    v10 = v8;
    v11 = 0;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;

    if (v11)
    {
      v12 = -[MCMCodeSigningEntry initWithCodeSigningInfo:]([MCMCodeSigningEntry alloc], "initWithCodeSigningInfo:", v10);
      if (v12)
      {
        v13 = v12;
        -[MCMCodeSigningEntry setInvalid:](v12, "setInvalid:", sqlite3_column_int(a3, 1) != 0);
        v14 = sqlite3_column_int(a3, 2);
        -[MCMCodeSigningEntry setPlaceholder:](v13, "setPlaceholder:", v14 & 1);
        -[MCMCodeSigningEntry setAdvanceCopy:](v13, "setAdvanceCopy:", (v14 >> 1) & 1);
        -[MCMCodeSigningEntry setRegisteredByKernel:](v13, "setRegisteredByKernel:", (v14 >> 2) & 1);
        -[MCMCodeSigningEntry setRegisteredByCaller:](v13, "setRegisteredByCaller:", sqlite3_column_int(a3, 3) != 0);
        -[MCMCodeSigningEntry setDataContainerClass:](v13, "setDataContainerClass:", sqlite3_column_int(a3, 4));

        goto LABEL_16;
      }
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate codeSigningEntry"));
      v30[0] = CFSTR("FunctionName");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v18;
      v31[1] = &unk_1E8CD6510;
      v19 = *MEMORY[0x1E0CB2D50];
      v30[1] = CFSTR("SourceFileLine");
      v30[2] = v19;
      v31[2] = v17;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v29 = v17;
        _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v20);
      v16 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 2048, 0);
      v15 = objc_claimAutoreleasedReturnValue();

      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke;
      v25[3] = &unk_1E8CB67B8;
      v26 = (void *)v15;
      __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke((uint64_t)v25);
      v16 = objc_claimAutoreleasedReturnValue();
      v9 = v26;
    }

    v9 = (id)v16;
  }
  else
  {
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105;
    v23[3] = &unk_1E8CB67B8;
    v24 = 0;
    __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105((uint64_t)v23);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = v24;
  }

  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v13 = 0;
    *a4 = v9;
  }
  else
  {
    v13 = 0;
  }
LABEL_16:

  return v13;
}

- (MCMSQLiteDB)initWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v9;
  NSObject *v10;
  MCMSQLiteDB *v11;
  MCMSQLiteDB *v12;
  uint64_t v13;
  BOOL v14;
  MCMSQLiteDB *v15;
  objc_super v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2(v10);
  v17.receiver = self;
  v17.super_class = (Class)MCMSQLiteDB;
  v11 = -[MCMSQLiteDB init](&v17, sel_init);
  v12 = v11;
  if (v11
    && ((objc_storeStrong((id *)&v11->_queue, a4), objc_storeStrong((id *)&v12->_url, a3), !v12->_url)
     || ((v13 = objc_msgSend((id)objc_opt_class(), "openDBWithURL:queue:error:", v12->_url, v10, a5),
          v12->_db = (sqlite3 *)v13,
          v12->_url)
       ? (v14 = v13 == 0)
       : (v14 = 1),
         v14)))
  {
    v15 = 0;
  }
  else
  {
    v15 = v12;
  }

  return v15;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  -[MCMSQLiteDB closeDB](self, "closeDB");
  v3.receiver = self;
  v3.super_class = (Class)MCMSQLiteDB;
  -[MCMSQLiteDB dealloc](&v3, sel_dealloc);
}

- (BOOL)_sqliteExec:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;
  int v9;
  id v10;
  _QWORD v12[4];
  id v13;
  MCMSQLiteDB *v14;
  char *v15;
  char *errmsg[2];

  errmsg[1] = *(char **)MEMORY[0x1E0C80C00];
  v6 = a3;
  errmsg[0] = 0;
  v7 = -[MCMSQLiteDB db](self, "db");
  v8 = objc_retainAutorelease(v6);
  v9 = sqlite3_exec(v7, (const char *)objc_msgSend(v8, "UTF8String"), 0, 0, errmsg);
  if (v9)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __33__MCMSQLiteDB__sqliteExec_error___block_invoke;
    v12[3] = &unk_1E8CB6158;
    v13 = v8;
    v14 = self;
    v15 = errmsg[0];
    __33__MCMSQLiteDB__sqliteExec_error___block_invoke((uint64_t)v12);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    sqlite3_free(errmsg[0]);

    if (a4)
    {
      v10 = objc_retainAutorelease(v10);
      *a4 = v10;
    }
  }
  else
  {
    v10 = 0;
  }

  return v9 == 0;
}

- (void)closeDB
{
  NSObject *v3;
  int v4;
  int v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  container_log_handle_for_category();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    -[MCMSQLiteDB url](self, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v8;
    _os_log_debug_impl(&dword_1CF807000, v3, OS_LOG_TYPE_DEBUG, "closing %@", (uint8_t *)&v11, 0xCu);

  }
  v4 = sqlite3_close(-[MCMSQLiteDB db](self, "db"));
  if (v4)
  {
    v5 = v4;
    container_log_handle_for_category();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v10;
      v13 = 1024;
      v14 = v5;
      _os_log_error_impl(&dword_1CF807000, v6, OS_LOG_TYPE_ERROR, "sqlite3_close for %@ failed: %d", (uint8_t *)&v11, 0x12u);

    }
  }
  -[MCMSQLiteDB setDb:](self, "setDb:", 0);
}

- (BOOL)_performTwoParameterQuery:(const char *)a3 withTextInputOne:(id)a4 andTextInputTwo:(id)a5 expectedChanges:(int)a6 error:(id *)a7
{
  id v12;
  id v13;
  sqlite3 *v14;
  uint64_t v15;
  void *v16;
  sqlite3_stmt *v17;
  id v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  char v22;
  sqlite3_stmt *v24;
  id v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  _QWORD v30[6];
  int v31;
  int v32;
  _QWORD v33[6];
  _QWORD v34[4];
  id v35;
  MCMSQLiteDB *v36;
  sqlite3 *v37;
  _QWORD v38[4];
  id v39;
  MCMSQLiteDB *v40;
  sqlite3 *v41;
  _QWORD v42[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  ppStmt = 0;
  v14 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0))
  {
    v17 = ppStmt;
    v18 = objc_retainAutorelease(v12);
    if (sqlite3_bind_text(v17, 1, (const char *)objc_msgSend(v18, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21;
      v38[3] = &unk_1E8CB6158;
      v39 = v18;
      v40 = self;
      v41 = v14;
      __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21((uint64_t)v38);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v39;
    }
    else
    {
      if (!v13
        || (v24 = ppStmt,
            v25 = objc_retainAutorelease(v13),
            !sqlite3_bind_text(v24, 2, (const char *)objc_msgSend(v25, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL)))
      {
        if (sqlite3_step(ppStmt) == 101)
        {
          if (a6 == -1 || (v26 = sqlite3_changes(v14), v26 == a6))
          {
            v16 = 0;
            v20 = 1;
            goto LABEL_8;
          }
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31;
          v30[3] = &unk_1E8CB61A8;
          v30[4] = self;
          v30[5] = a3;
          v31 = v26;
          v32 = a6;
          __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31((uint64_t)v30);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27;
          v33[3] = &unk_1E8CB6180;
          v33[4] = self;
          v33[5] = v14;
          __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27((uint64_t)v33);
          v15 = objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_3;
      }
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25;
      v34[3] = &unk_1E8CB6158;
      v35 = v25;
      v36 = self;
      v37 = v14;
      __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25((uint64_t)v34);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = v35;
    }

    goto LABEL_7;
  }
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke;
  v42[3] = &unk_1E8CB6180;
  v42[4] = self;
  v42[5] = v14;
  __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke((uint64_t)v42);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v16 = (void *)v15;
LABEL_7:
  v20 = 0;
LABEL_8:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "path");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      v45 = v28;
      v46 = 1024;
      v47 = v29;
      _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a7)
    v22 = v20;
  else
    v22 = 1;
  if ((v22 & 1) == 0)
    *a7 = objc_retainAutorelease(v16);

  return v20;
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 expectedChanges:(int)a5 error:(id *)a6
{
  return -[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:](self, "_performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:", a3, a4, 0, *(_QWORD *)&a5, a6);
}

- (BOOL)_performSingleParameterQuery:(const char *)a3 withTextInput:(id)a4 error:(id *)a5
{
  return -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:expectedChanges:error:](self, "_performSingleParameterQuery:withTextInput:expectedChanges:error:", a3, a4, 0xFFFFFFFFLL, a5);
}

- (BOOL)_insertChildIdentifier:(id)a3 forParentIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17[2];

  v17[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v17[0] = 0;
  v10 = -[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:](self, "_performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:", "INSERT OR REPLACE INTO child_bundles (parent_id, child_code_signing_id_text) SELECT id, ? FROM code_signing_info WHERE code_signing_id_text = ?;",
          v8,
          v9,
          0xFFFFFFFFLL,
          v17);
  v11 = v17[0];
  if (v10)
  {
    -[MCMSQLiteDB peerageDelegate](self, "peerageDelegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "codeSigningDB:addChildIdentifier:forParentIdentifier:", self, v8, v9);

  }
  else
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke;
    v15[3] = &unk_1E8CB67B8;
    v16 = v8;
    __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke((uint64_t)v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v11 = objc_retainAutorelease(v13);
      *a5 = v11;
    }
    else
    {
      v11 = v13;
    }
  }

  return v10;
}

- (BOOL)_performInsertOrUpdateQuery:(const char *)a3 withCodeSigningEntry:(id)a4 forIdentifier:(id)a5 isUpdate:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v8;
  id v12;
  id v13;
  sqlite3 *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  sqlite3_stmt *v23;
  id v24;
  BOOL v25;
  NSObject *v26;
  char v27;
  void *v29;
  void *v30;
  int v31;
  int v32;
  _QWORD v33[6];
  int v34;
  _QWORD v35[6];
  _QWORD v36[4];
  id v37;
  MCMSQLiteDB *v38;
  sqlite3 *v39;
  _QWORD v40[4];
  id v41;
  MCMSQLiteDB *v42;
  sqlite3 *v43;
  _QWORD v44[4];
  id v45;
  MCMSQLiteDB *v46;
  sqlite3 *v47;
  _QWORD v48[4];
  id v49;
  MCMSQLiteDB *v50;
  sqlite3 *v51;
  int v52;
  _QWORD v53[4];
  id v54;
  MCMSQLiteDB *v55;
  sqlite3 *v56;
  _QWORD v57[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v8 = a6;
  v63 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  ppStmt = 0;
  v14 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v14, a3, -1, &ppStmt, 0))
  {
    if (sqlite3_bind_int(ppStmt, 1, objc_msgSend(v12, "isInvalid")))
    {
      v53[0] = MEMORY[0x1E0C809B0];
      v53[1] = 3221225472;
      v53[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40;
      v53[3] = &unk_1E8CB6158;
      v54 = v12;
      v55 = self;
      v56 = v14;
      __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40((uint64_t)v53);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v54;
    }
    else
    {
      v18 = objc_msgSend(v12, "isPlaceholder");
      if (objc_msgSend(v12, "isAdvanceCopy"))
        v19 = 2;
      else
        v19 = 0;
      v20 = v19 | v18;
      if (objc_msgSend(v12, "isRegisteredByKernel"))
        v21 = 4;
      else
        v21 = 0;
      v22 = v20 | v21;
      if (sqlite3_bind_int(ppStmt, 2, v22))
      {
        v48[0] = MEMORY[0x1E0C809B0];
        v48[1] = 3221225472;
        v48[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44;
        v48[3] = &unk_1E8CB61D0;
        v52 = v22;
        v49 = v12;
        v50 = self;
        v51 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44((uint64_t)v48);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v49;
      }
      else if (sqlite3_bind_int(ppStmt, 3, objc_msgSend(v12, "isRegisteredByCaller")))
      {
        v44[0] = MEMORY[0x1E0C809B0];
        v44[1] = 3221225472;
        v44[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48;
        v44[3] = &unk_1E8CB6158;
        v45 = v12;
        v46 = self;
        v47 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48((uint64_t)v44);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v45;
      }
      else if (sqlite3_bind_int(ppStmt, 4, objc_msgSend(v12, "dataContainerClass")))
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52;
        v40[3] = &unk_1E8CB6158;
        v41 = v12;
        v42 = self;
        v43 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52((uint64_t)v40);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v41;
      }
      else
      {
        v23 = ppStmt;
        v24 = objc_retainAutorelease(v13);
        if (!sqlite3_bind_text(v23, 5, (const char *)objc_msgSend(v24, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
        {
          if (sqlite3_step(ppStmt) == 101)
          {
            if (!v8 || (v32 = sqlite3_changes(v14), v32 == 1))
            {
              v16 = 0;
              v25 = 1;
              goto LABEL_22;
            }
            v33[0] = MEMORY[0x1E0C809B0];
            v33[1] = 3221225472;
            v33[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62;
            v33[3] = &unk_1E8CB6130;
            v33[4] = self;
            v33[5] = a3;
            v34 = v32;
            __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62((uint64_t)v33);
            v15 = objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v35[0] = MEMORY[0x1E0C809B0];
            v35[1] = 3221225472;
            v35[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60;
            v35[3] = &unk_1E8CB6180;
            v35[4] = self;
            v35[5] = v14;
            __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60((uint64_t)v35);
            v15 = objc_claimAutoreleasedReturnValue();
          }
          goto LABEL_3;
        }
        v36[0] = MEMORY[0x1E0C809B0];
        v36[1] = 3221225472;
        v36[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56;
        v36[3] = &unk_1E8CB6158;
        v37 = v24;
        v38 = self;
        v39 = v14;
        __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56((uint64_t)v36);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = v37;
      }
    }

    goto LABEL_21;
  }
  v57[0] = MEMORY[0x1E0C809B0];
  v57[1] = 3221225472;
  v57[2] = __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke;
  v57[3] = &unk_1E8CB6180;
  v57[4] = self;
  v57[5] = v14;
  __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke((uint64_t)v57);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v16 = (void *)v15;
LABEL_21:
  v25 = 0;
LABEL_22:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = sqlite3_extended_errcode(v14);
      *(_DWORD *)buf = 138412546;
      v60 = v30;
      v61 = 1024;
      v62 = v31;
      _os_log_error_impl(&dword_1CF807000, v26, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a7)
    v27 = v25;
  else
    v27 = 1;
  if ((v27 & 1) == 0)
    *a7 = objc_retainAutorelease(v16);

  return v25;
}

- (BOOL)_insertCodeSigningInfo:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  BOOL v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  BOOL v16;
  id *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26[2];

  v26[1] = *(id *)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v26[0] = 0;
  v10 = 1;
  v11 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:](self, "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:", "UPDATE code_signing_info SET invalid=?, placeholder=?, registered_by_caller=?, data_container_class=? WHERE code_signing_id_text=?;",
          v8,
          v9,
          1,
          v26);
  v12 = v26[0];
  v13 = v12;
  if (!v11)
  {
    objc_msgSend(v12, "domain");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "isEqualToString:", CFSTR("MCMErrorDomain")))
    {
      v15 = objc_msgSend(v13, "code");

      if (v15 == 68)
      {

        v23 = 0;
        v16 = -[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:](self, "_performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:", "INSERT INTO code_signing_info (invalid, placeholder, registered_by_caller, data_container_class, code_signing_id_text) VALUES (?, ?, ?, ?, ?);",
                v8,
                v9,
                0,
                &v23);
        v13 = v23;
        if (v16)
        {
          v10 = 1;
          goto LABEL_11;
        }
        v21[0] = MEMORY[0x1E0C809B0];
        v21[1] = 3221225472;
        v21[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71;
        v21[3] = &unk_1E8CB67B8;
        v17 = &v22;
        v22 = v9;
        __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71((uint64_t)v21);
        v18 = objc_claimAutoreleasedReturnValue();
        goto LABEL_8;
      }
    }
    else
    {

    }
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke;
    v24[3] = &unk_1E8CB67B8;
    v17 = &v25;
    v25 = v9;
    __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke((uint64_t)v24);
    v18 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v19 = (void *)v18;

    if (a5)
    {
      v13 = objc_retainAutorelease(v19);
      v10 = 0;
      *a5 = v13;
    }
    else
    {
      v10 = 0;
      v13 = v19;
    }
  }
LABEL_11:

  return v10;
}

- (BOOL)_insertCodeSigningData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  sqlite3 *v10;
  id v11;
  BOOL v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  sqlite3_stmt *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  sqlite3_stmt *v21;
  id v22;
  NSObject *v23;
  char v24;
  void *v26;
  void *v27;
  int v28;
  _QWORD v29[6];
  _QWORD v30[4];
  id v31;
  MCMSQLiteDB *v32;
  sqlite3 *v33;
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _QWORD v39[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v42;
  __int16 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  ppStmt = 0;
  v10 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v10, "INSERT OR REPLACE INTO code_signing_data (cs_info_id, data) SELECT id, ? FROM code_signing_info WHERE code_signing_id_text = ?;",
          -1,
          &ppStmt,
          0))
  {
    v14 = (void *)MEMORY[0x1E0CB38B0];
    objc_msgSend(v8, "codeSigningInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    objc_msgSend(v14, "dataWithPropertyList:format:options:error:", v15, 200, 0, &v38);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v38;

    if (!v16)
    {
      v35[0] = MEMORY[0x1E0C809B0];
      v35[1] = 3221225472;
      v35[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78;
      v35[3] = &unk_1E8CB61F8;
      v36 = v8;
      v37 = v11;
      v20 = v11;
      __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78((uint64_t)v35);
      v11 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_3;
    }
    v17 = ppStmt;
    v13 = objc_retainAutorelease(v16);
    if (sqlite3_bind_blob64(v17, 1, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
    {
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82;
      v34[3] = &unk_1E8CB6180;
      v34[4] = self;
      v34[5] = v10;
      __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82((uint64_t)v34);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v21 = ppStmt;
      v22 = objc_retainAutorelease(v9);
      if (sqlite3_bind_text(v21, 2, (const char *)objc_msgSend(v22, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
      {
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86;
        v30[3] = &unk_1E8CB6158;
        v31 = v22;
        v32 = self;
        v33 = v10;
        __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86((uint64_t)v30);
        v19 = objc_claimAutoreleasedReturnValue();

        goto LABEL_11;
      }
      if (sqlite3_step(ppStmt) == 101)
      {
        v12 = 1;
        goto LABEL_12;
      }
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90;
      v29[3] = &unk_1E8CB6180;
      v29[4] = self;
      v29[5] = v10;
      __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90((uint64_t)v29);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

LABEL_11:
    v12 = 0;
    v11 = (id)v19;
    goto LABEL_12;
  }
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke;
  v39[3] = &unk_1E8CB6180;
  v39[4] = self;
  v39[5] = v10;
  __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke((uint64_t)v39);
  v11 = (id)objc_claimAutoreleasedReturnValue();
LABEL_3:
  v12 = 0;
  v13 = 0;
LABEL_12:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "path");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = sqlite3_extended_errcode(v10);
      *(_DWORD *)buf = 138412546;
      v42 = v27;
      v43 = 1024;
      v44 = v28;
      _os_log_error_impl(&dword_1CF807000, v23, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a5)
    v24 = v12;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
    *a5 = objc_retainAutorelease(v11);

  return v12;
}

- (BOOL)_deleteCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  _BOOL4 v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15[2];

  v15[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  v15[0] = 0;
  v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:expectedChanges:error:](self, "_performSingleParameterQuery:withTextInput:expectedChanges:error:", "DELETE FROM code_signing_info WHERE code_signing_id_text=?;",
         v6,
         1,
         v15);
  v8 = v15[0];
  v9 = v8;
  if (v7)
  {
    -[MCMSQLiteDB peerageDelegate](self, "peerageDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "codeSigningDB:removeParentIdentifier:", self, v6);

  }
  else
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke;
    v13[3] = &unk_1E8CB67B8;
    v14 = v8;
    v11 = v8;
    __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke((uint64_t)v13);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v9 = objc_retainAutorelease(v9);
      *a4 = v9;
    }
  }

  return v7;
}

- (BOOL)addCodeSigningEntry:(id)a3 withIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  id v19;
  BOOL v20;
  id *v21;
  id v22;
  BOOL v23;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30[6];
  _QWORD v31[4];
  id v32;
  id v33;
  _QWORD v34[4];
  id v35;
  id v36;
  _BYTE v37[128];
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v8 || !v9)
  {
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke;
    v34[3] = &unk_1E8CB61F8;
    v35 = v8;
    v36 = v9;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke((uint64_t)v34);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = &v35;
    v22 = v36;
LABEL_22:

    goto LABEL_23;
  }
  v33 = 0;
  v10 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", CFSTR("BEGIN;"), &v33);
  v11 = v33;
  v12 = v11;
  if (!v10)
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122;
    v31[3] = &unk_1E8CB67B8;
    v22 = v11;
    v32 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122((uint64_t)v31);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = &v32;
    goto LABEL_22;
  }
  if (-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:](self, "_insertCodeSigningInfo:forIdentifier:error:", v8, v9, a5)&& -[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:](self, "_insertCodeSigningData:forIdentifier:error:", v8, v9, a5))
  {
    objc_msgSend(v8, "childBundleIdentifiers");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v8, "childBundleIdentifiers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v39;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v39 != v16)
              objc_enumerationMutation(v14);
            -[MCMSQLiteDB _insertChildIdentifier:forParentIdentifier:error:](self, "_insertChildIdentifier:forParentIdentifier:error:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), v9, 0);
          }
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v38, v37, 16);
        }
        while (v15);
      }

    }
    v30[0] = v12;
    v18 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", CFSTR("COMMIT;"), v30);
    v19 = v30[0];

    if (!v18)
    {
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132;
      v28[3] = &unk_1E8CB67B8;
      v29 = v19;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132((uint64_t)v28);
      v19 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 1;
    goto LABEL_26;
  }
  v27 = v12;
  v23 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", CFSTR("ROLLBACK;"), &v27);
  v19 = v27;

  if (!v23)
  {
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138;
    v25[3] = &unk_1E8CB67B8;
    v22 = v19;
    v26 = v22;
    __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138((uint64_t)v25);
    v19 = (id)objc_claimAutoreleasedReturnValue();
    v21 = &v26;
    goto LABEL_22;
  }
LABEL_23:
  if (a5)
  {
    v19 = objc_retainAutorelease(v19);
    *a5 = v19;
  }
  v20 = 0;
LABEL_26:

  return v20;
}

- (BOOL)deleteCodeSigningEntryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v6)
  {
    v7 = -[MCMSQLiteDB _deleteCodeSigningWithIdentifier:error:](self, "_deleteCodeSigningWithIdentifier:error:", v6, a4);
    v8 = 0;
    if (!a4)
      goto LABEL_7;
  }
  else
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke;
    v10[3] = &unk_1E8CB67B8;
    v11 = 0;
    __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke((uint64_t)v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (!a4)
      goto LABEL_7;
  }
  if (!v7)
    *a4 = objc_retainAutorelease(v8);
LABEL_7:

  return v7;
}

- (BOOL)invalidateCodeSigningWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14[2];

  v14[1] = *(id *)MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v14[0] = 0;
  v7 = -[MCMSQLiteDB _performSingleParameterQuery:withTextInput:error:](self, "_performSingleParameterQuery:withTextInput:error:", "UPDATE code_signing_info SET invalid=1 WHERE code_signing_id_text = ?;",
         v6,
         v14);
  v8 = v14[0];
  if (!v7)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke;
    v11[3] = &unk_1E8CB61F8;
    v12 = v6;
    v13 = v8;
    v9 = v8;
    __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke((uint64_t)v11);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v8 = objc_retainAutorelease(v8);
      *a4 = v8;
    }
  }

  return v7;
}

- (BOOL)invalidateCodeSigningForIdentifierAndAllChildren:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  BOOL v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  BOOL v20;
  NSObject *v21;
  BOOL v22;
  void *v23;
  BOOL v24;
  NSObject *v25;
  id *v26;
  NSObject *v27;
  void *v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  NSObject *v34;
  id v35[6];
  NSObject *v36;
  _QWORD v37[4];
  NSObject *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  NSObject *v42;
  id v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  uint64_t v47;
  __int16 v48;
  NSObject *v49;
  _BYTE v50[128];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v31 = (void *)objc_opt_new();
  v43 = 0;
  v32 = v5;
  -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:](self, "childIdentifiersForParentIdentifier:error:", v5, &v43);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v43;
  v8 = v7;
  v30 = (void *)v6;
  if (v6)
    goto LABEL_2;
  objc_msgSend(v7, "domain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v23, "isEqualToString:", CFSTR("MCMErrorDomain")))
  {

    goto LABEL_27;
  }
  v24 = objc_msgSend(v8, "code") == 67;

  if (!v24)
  {
LABEL_27:
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke;
    v40[3] = &unk_1E8CB61F8;
    v41 = v32;
    v27 = v8;
    v42 = v27;
    __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke((uint64_t)v40);
    v21 = objc_claimAutoreleasedReturnValue();

    v30 = 0;
    v26 = &v41;
    v25 = v42;
    goto LABEL_28;
  }

  v8 = 0;
  v6 = 0;
LABEL_2:
  objc_msgSend(v31, "addObject:", v32);
  if (v6)
    objc_msgSend(v31, "addObjectsFromArray:", v6);
  v39 = v8;
  v9 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", CFSTR("BEGIN;"), &v39);
  v10 = v39;

  if (v9)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v11 = v31;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i);
          v36 = v10;
          v16 = -[MCMSQLiteDB invalidateCodeSigningWithIdentifier:error:](self, "invalidateCodeSigningWithIdentifier:error:", v15, &v36);
          v17 = v36;

          if (v16)
          {
            container_log_handle_for_category();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              v45 = v32;
              v46 = 2112;
              v47 = v15;
              _os_log_debug_impl(&dword_1CF807000, v18, OS_LOG_TYPE_DEBUG, "Invalidating code signing info for %@ child: %@", buf, 0x16u);
            }
            v10 = v17;
          }
          else
          {
            container_log_handle_for_category();
            v19 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412802;
              v45 = v32;
              v46 = 2112;
              v47 = v15;
              v48 = 2112;
              v49 = v17;
              _os_log_error_impl(&dword_1CF807000, v19, OS_LOG_TYPE_ERROR, "Failed to invalidate code signing info for %@ child %@ : %@", buf, 0x20u);
            }

            v10 = 0;
            v18 = v17;
          }

        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v51, v50, 16);
      }
      while (v12);
    }

    v35[0] = v10;
    v20 = -[MCMSQLiteDB _sqliteExec:error:](self, "_sqliteExec:error:", CFSTR("COMMIT;"), v35);
    v21 = v35[0];

    if (!v20)
    {
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160;
      v33[3] = &unk_1E8CB67B8;
      v34 = v21;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160((uint64_t)v33);
      v21 = objc_claimAutoreleasedReturnValue();

    }
    v22 = 1;
    goto LABEL_31;
  }
  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156;
  v37[3] = &unk_1E8CB67B8;
  v25 = v10;
  v38 = v25;
  __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156((uint64_t)v37);
  v21 = objc_claimAutoreleasedReturnValue();
  v26 = (id *)&v38;
LABEL_28:

  if (a4)
  {
    v21 = objc_retainAutorelease(v21);
    *a4 = v21;
  }
  v22 = 0;
LABEL_31:

  return v22;
}

- (id)enumerateIdentifiersAndCodeSigningInfoUsingBlock:(id)a3
{
  sqlite3 *v4;
  __int128 v5;
  void *v6;
  NSObject *v7;
  void *v9;
  int v10;
  void *v11;
  id v12;
  const unsigned __int8 *v13;
  const unsigned __int8 *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  int v30;
  __int128 v31;
  sqlite3 *db;
  uint64_t v33;
  void (**v34)(id, void *, void *);
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[5];
  id v39;
  _QWORD v40[6];
  _QWORD v41[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v44;
  _QWORD v45[3];
  _BYTE v46[24];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v34 = (void (**)(id, void *, void *))a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v4 = -[MCMSQLiteDB db](self, "db");
  db = v4;
  if (!sqlite3_prepare_v2(v4, "SELECT code_signing_data.data, code_signing_info.invalid, code_signing_info.placeholder, code_signing_info.registered_by_caller, code_signing_info.data_container_class, code_signing_info.code_signing_id_text FROM code_signing_info, code_signing_data WHERE code_signing_info.id = code_signing_data.cs_info_id;",
          -1,
          &ppStmt,
          0))
  {
    v6 = 0;
    v33 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)&v5 = 138543362;
    v31 = v5;
    while (1)
    {
      v9 = (void *)MEMORY[0x1D17D7010]();
      v10 = sqlite3_step(ppStmt);
      if ((v10 - 102) <= 0xFFFFFFFD)
      {
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166;
        v40[3] = &unk_1E8CB6180;
        v40[4] = self;
        v40[5] = db;
        __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166((uint64_t)v40);
        v27 = objc_claimAutoreleasedReturnValue();

        objc_autoreleasePoolPop(v9);
        v6 = (void *)v27;
        goto LABEL_3;
      }
      if (v10 != 100)
      {
        objc_autoreleasePoolPop(v9);
        goto LABEL_3;
      }
      v39 = 0;
      -[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:](self, "_codeSigningEntryFromStatementRow:error:", ppStmt, &v39);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v39;
      if (v11)
        break;
      v20 = 4;
LABEL_29:

      objc_autoreleasePoolPop(v9);
      if (v20 == 3)
        goto LABEL_3;
    }
    v13 = sqlite3_column_text(ppStmt, 5);
    if (!v13)
    {
      v17 = v6;
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error retrieving code_signing_id_text from DB"));
      v45[0] = CFSTR("FunctionName");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)v46 = v22;
      *(_QWORD *)&v46[8] = &unk_1E8CD66F0;
      v45[1] = CFSTR("SourceFileLine");
      v45[2] = v33;
      *(_QWORD *)&v46[16] = v21;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, v45, 3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      container_log_handle_for_category();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v31;
        v44 = v21;
        _os_log_error_impl(&dword_1CF807000, v24, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v23);
      v19 = (id)objc_claimAutoreleasedReturnValue();

      v20 = 4;
      v16 = v12;
      goto LABEL_21;
    }
    v14 = v13;
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
    if (!v15)
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173;
      v38[3] = &__block_descriptor_40_e14___NSError_8__0l;
      v38[4] = v14;
      __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173((uint64_t)v38);
      v16 = v6;
      v20 = 3;
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_28;
    }
    v16 = (void *)v15;
    v17 = v6;
    v37 = v12;
    -[MCMSQLiteDB childIdentifiersForParentIdentifier:error:](self, "childIdentifiersForParentIdentifier:error:", v15, &v37);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = v37;

    if (v18)
    {
LABEL_16:
      objc_msgSend(v11, "setChildBundleIdentifiers:", v18, v31);
      v34[2](v34, v16, v11);

      v20 = 0;
      v16 = (void *)v18;
LABEL_21:
      v12 = v19;
      v6 = v17;
LABEL_28:

      goto LABEL_29;
    }
    objc_msgSend(v19, "domain");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", CFSTR("MCMErrorDomain")))
    {
      v26 = objc_msgSend(v19, "code");

      if (v26 == 67)
      {

        v19 = 0;
        goto LABEL_16;
      }
    }
    else
    {

    }
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177;
    v35[3] = &unk_1E8CB67B8;
    v12 = v19;
    v36 = v12;
    __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177((uint64_t)v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 4;
    goto LABEL_28;
  }
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke;
  v41[3] = &unk_1E8CB6180;
  v41[4] = self;
  v41[5] = v4;
  __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke((uint64_t)v41);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_3:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "path");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = sqlite3_extended_errcode(db);
      *(_DWORD *)v46 = 138412546;
      *(_QWORD *)&v46[4] = v29;
      *(_WORD *)&v46[12] = 1024;
      *(_DWORD *)&v46[14] = v30;
      _os_log_error_impl(&dword_1CF807000, v7, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", v46, 0x12u);

    }
  }

  return v6;
}

- (id)identifiersWithError:(id *)a3
{
  sqlite3 *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v13;
  const unsigned __int8 *v14;
  const unsigned __int8 *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  int v20;
  _QWORD v21[5];
  _QWORD v22[6];
  _QWORD v23[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v5 = -[MCMSQLiteDB db](self, "db");
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!sqlite3_prepare_v2(v5, "SELECT code_signing_info.code_signing_id_text FROM code_signing_info;",
          -1,
          &ppStmt,
          0))
  {
    while (1)
    {
      v13 = sqlite3_step(ppStmt);
      if ((v13 - 102) <= 0xFFFFFFFD)
      {
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_184;
        v22[3] = &unk_1E8CB6180;
        v22[4] = self;
        v22[5] = v5;
        __36__MCMSQLiteDB_identifiersWithError___block_invoke_184((uint64_t)v22);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (v13 != 100)
      {
        v8 = 0;
        goto LABEL_4;
      }
      v14 = sqlite3_column_text(ppStmt, 0);
      if (v14)
      {
        v15 = v14;
        v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v14);
        if (!v16)
        {
          v21[0] = MEMORY[0x1E0C809B0];
          v21[1] = 3221225472;
          v21[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke_186;
          v21[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v21[4] = v15;
          __36__MCMSQLiteDB_identifiersWithError___block_invoke_186((uint64_t)v21);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
        v17 = v16;
        objc_msgSend(v6, "addObject:", v16);
      }
      else
      {
        container_log_handle_for_category();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1CF807000, v17, OS_LOG_TYPE_ERROR, "Error retrieving code_signing_id_text from DB", buf, 2u);
        }
      }

    }
  }
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __36__MCMSQLiteDB_identifiersWithError___block_invoke;
  v23[3] = &unk_1E8CB6180;
  v23[4] = self;
  v23[5] = v5;
  __36__MCMSQLiteDB_identifiersWithError___block_invoke((uint64_t)v23);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      v26 = v19;
      v27 = 1024;
      v28 = v20;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  v10 = objc_msgSend(v6, "count");
  if (a3 && !v10)
  {

    v6 = 0;
    *a3 = objc_retainAutorelease(v8);
  }
  v11 = (void *)objc_msgSend(v6, "copy");

  return v11;
}

- (id)parentIdentifierForChildIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  sqlite3 *v7;
  id v8;
  sqlite3_stmt *v9;
  id v10;
  void *v11;
  NSObject *v12;
  int v14;
  const unsigned __int8 *v15;
  const unsigned __int8 *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[5];
  _QWORD v25[6];
  _QWORD v26[4];
  id v27;
  MCMSQLiteDB *v28;
  sqlite3 *v29;
  _QWORD v30[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v7, "SELECT code_signing_info.code_signing_id_text FROM child_bundles, code_signing_info WHERE child_bundles.child_code_signing_id_text = ? AND child_bundles.parent_id=code_signing_info.id;",
         -1,
         &ppStmt,
         0))
  {
    v30[0] = MEMORY[0x1E0C809B0];
    v30[1] = 3221225472;
    v30[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke;
    v30[3] = &unk_1E8CB6180;
    v30[4] = self;
    v30[5] = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke((uint64_t)v30);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_5:
    v11 = 0;
    goto LABEL_6;
  }
  v9 = ppStmt;
  v10 = objc_retainAutorelease(v6);
  if (sqlite3_bind_text(v9, 1, (const char *)objc_msgSend(v10, "UTF8String"), -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL))
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209;
    v26[3] = &unk_1E8CB6158;
    v27 = v10;
    v28 = self;
    v29 = v7;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209((uint64_t)v26);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_5;
  }
  v11 = 0;
  while (1)
  {
    v14 = sqlite3_step(ppStmt);
    if ((v14 - 102) <= 0xFFFFFFFD)
    {
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213;
      v25[3] = &unk_1E8CB6180;
      v25[4] = self;
      v25[5] = v7;
      __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213((uint64_t)v25);
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_26;
    }
    if (v14 != 100)
      break;
    v15 = sqlite3_column_text(ppStmt, 0);
    if (v15)
    {
      v16 = v15;
      v17 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v15);

      v11 = (void *)v17;
      if (!v17)
      {
        v24[0] = MEMORY[0x1E0C809B0];
        v24[1] = 3221225472;
        v24[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215;
        v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
        v24[4] = v16;
        __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215((uint64_t)v24);
        v18 = objc_claimAutoreleasedReturnValue();
LABEL_26:
        v8 = (id)v18;
        goto LABEL_6;
      }
    }
  }
  v8 = 0;
LABEL_6:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = sqlite3_extended_errcode(v7);
      *(_DWORD *)buf = 138412546;
      v33 = v20;
      v34 = 1024;
      v35 = v21;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (!v8)
  {
    if (v11)
    {
      v8 = 0;
      goto LABEL_17;
    }
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219;
    v22[3] = &unk_1E8CB67B8;
    v23 = v6;
    __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219((uint64_t)v22);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v23;
  }

  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v11 = 0;
    *a4 = v8;
  }
  else
  {
    v11 = 0;
  }
LABEL_17:

  return v11;
}

- (BOOL)deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:(id *)a3
{
  sqlite3 *v5;
  uint64_t v6;
  int v7;
  int v8;
  NSObject *v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  char v13;
  void *v15;
  void *v16;
  int v17;
  _QWORD v18[6];
  _QWORD v19[6];
  _QWORD v20[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  ppStmt = 0;
  v5 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v5, "DELETE FROM code_signing_info WHERE (placeholder & ?) > 0;", -1, &ppStmt, 0))
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke;
    v20[3] = &unk_1E8CB6180;
    v20[4] = self;
    v20[5] = v5;
    __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke((uint64_t)v20);
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v10 = (void *)v6;
    v11 = 0;
    goto LABEL_13;
  }
  if (sqlite3_bind_int(ppStmt, 1, 2))
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227;
    v19[3] = &unk_1E8CB6180;
    v19[4] = self;
    v19[5] = v5;
    __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227((uint64_t)v19);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231;
    v18[3] = &unk_1E8CB6180;
    v18[4] = self;
    v18[5] = v5;
    __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231((uint64_t)v18);
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v7 = sqlite3_changes(v5);
  if (v7 >= 1)
  {
    v8 = v7;
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v8;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "Deleted %d advance copies of code signing info.", buf, 8u);
    }

  }
  v10 = 0;
  v11 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = sqlite3_extended_errcode(v5);
      *(_DWORD *)buf = 138412546;
      v23 = v16;
      v24 = 1024;
      v25 = v17;
      _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a3)
    v13 = v11;
  else
    v13 = 1;
  if ((v13 & 1) == 0)
    *a3 = objc_retainAutorelease(v10);

  return v11;
}

- (id)childParentMapWithError:(id *)a3
{
  void *v5;
  sqlite3 *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  int v12;
  const unsigned __int8 *v13;
  const unsigned __int8 *v14;
  void *v15;
  const unsigned __int8 *v16;
  const unsigned __int8 *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[6];
  _QWORD v26[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5 = (void *)objc_opt_new();
  ppStmt = 0;
  v6 = -[MCMSQLiteDB db](self, "db");
  if (!sqlite3_prepare_v2(v6, "SELECT child_code_signing_id_text, code_signing_info.code_signing_id_text FROM child_bundles, code_signing_info WHERE child_bundles.parent_id=code_signing_info.id;",
          -1,
          &ppStmt,
          0))
  {
    while (1)
    {
      v12 = sqlite3_step(ppStmt);
      if ((v12 - 102) <= 0xFFFFFFFD)
      {
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236;
        v25[3] = &unk_1E8CB6180;
        v25[4] = self;
        v25[5] = v6;
        __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236((uint64_t)v25);
        v7 = objc_claimAutoreleasedReturnValue();
        goto LABEL_3;
      }
      if (v12 != 100)
      {
        v8 = 0;
        goto LABEL_4;
      }
      v13 = sqlite3_column_text(ppStmt, 0);
      if (v13)
      {
        v14 = v13;
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v13);
        if (!v15)
        {
          v24[0] = MEMORY[0x1E0C809B0];
          v24[1] = 3221225472;
          v24[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238;
          v24[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v24[4] = v14;
          __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238((uint64_t)v24);
          v7 = objc_claimAutoreleasedReturnValue();
          goto LABEL_3;
        }
      }
      else
      {
        v15 = 0;
      }
      v16 = sqlite3_column_text(ppStmt, 1);
      if (v16)
      {
        v17 = v16;
        v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v16);
        if (!v18)
        {
          v23[0] = MEMORY[0x1E0C809B0];
          v23[1] = 3221225472;
          v23[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242;
          v23[3] = &__block_descriptor_40_e14___NSError_8__0l;
          v23[4] = v17;
          __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242((uint64_t)v23);
          v8 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_4;
        }
        v19 = (void *)v18;
        if (v15)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v18, v15);
      }
      else
      {
        v19 = 0;
      }

    }
  }
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __39__MCMSQLiteDB_childParentMapWithError___block_invoke;
  v26[3] = &unk_1E8CB6180;
  v26[4] = self;
  v26[5] = v6;
  __39__MCMSQLiteDB_childParentMapWithError___block_invoke((uint64_t)v26);
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_3:
  v8 = (void *)v7;
LABEL_4:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = sqlite3_extended_errcode(v6);
      *(_DWORD *)buf = 138412546;
      v29 = v21;
      v30 = 1024;
      v31 = v22;
      _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %d", buf, 0x12u);

    }
  }
  if (a3 && !v5)
    *a3 = objc_retainAutorelease(v8);
  v10 = (void *)objc_msgSend(v5, "copy");

  return v10;
}

- (BOOL)deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:(int *)a3 error:(id *)a4
{
  sqlite3 *v7;
  uint64_t v8;
  int v9;
  NSObject *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  char v14;
  char v15;
  void *v17;
  void *v18;
  const char *v19;
  _QWORD v20[6];
  _QWORD v21[6];
  _QWORD v22[6];
  sqlite3_stmt *ppStmt;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  ppStmt = 0;
  v7 = -[MCMSQLiteDB db](self, "db");
  if (sqlite3_prepare_v2(v7, "DELETE FROM code_signing_info WHERE placeholder = 0 AND invalid = 1 AND data_container_class = ?;",
         -1,
         &ppStmt,
         0))
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke;
    v22[3] = &unk_1E8CB6180;
    v22[4] = self;
    v22[5] = v7;
    __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke((uint64_t)v22);
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_12:
    v11 = (void *)v8;
    v12 = 0;
    v9 = 0;
    goto LABEL_13;
  }
  if (sqlite3_bind_int(ppStmt, 1, 4))
  {
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248;
    v21[3] = &unk_1E8CB6180;
    v21[4] = self;
    v21[5] = v7;
    __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248((uint64_t)v21);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (sqlite3_step(ppStmt) != 101)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252;
    v20[3] = &unk_1E8CB6180;
    v20[4] = self;
    v20[5] = v7;
    __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252((uint64_t)v20);
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  v9 = sqlite3_changes(v7);
  if (v9 >= 1)
  {
    container_log_handle_for_category();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v25) = v9;
      _os_log_impl(&dword_1CF807000, v10, OS_LOG_TYPE_DEFAULT, "Deleted %d invalid plugin code signing entries.", buf, 8u);
    }

  }
  v11 = 0;
  v12 = 1;
LABEL_13:
  if (ppStmt && sqlite3_finalize(ppStmt))
  {
    container_log_handle_for_category();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[MCMSQLiteDB url](self, "url");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = sqlite3_errmsg(v7);
      *(_DWORD *)buf = 138412546;
      v25 = v18;
      v26 = 2080;
      v27 = v19;
      _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, "sqlite3_finalize for %@ failed: %s", buf, 0x16u);

    }
  }
  v14 = !v12;
  if (!a3)
    v14 = 1;
  if ((v14 & 1) == 0)
    *a3 = v9;
  if (a4)
    v15 = v12;
  else
    v15 = 1;
  if ((v15 & 1) == 0)
    *a4 = objc_retainAutorelease(v11);

  return v12;
}

- (MCMSQLiteDBCodeSigningPeerageDelegate)peerageDelegate
{
  return (MCMSQLiteDBCodeSigningPeerageDelegate *)objc_loadWeakRetained((id *)&self->_peerageDelegate);
}

- (void)setPeerageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_peerageDelegate, a3);
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (NSURL)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
  objc_storeStrong((id *)&self->_url, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_destroyWeak((id *)&self->_peerageDelegate);
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(delete) for %@ failed: %s"), v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6930;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_248(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for plugin data container class at %@ failed: %s"), v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6948;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __76__MCMSQLiteDB_deleteAllInvalidPluginCodeSigningEntriesWithNumChanges_error___block_invoke_252(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %s"), v4, sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllInvalidPluginCodeSigningEntriesWithNumChanges:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6960;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childParentMapWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD68D0;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_236(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childParentMapWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD68E8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_238(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate childIdentifier for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childParentMapWithError:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6900;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __39__MCMSQLiteDB_childParentMapWithError___block_invoke_242(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate parentIdentifier for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childParentMapWithError:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6918;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(delete) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6888;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_227(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for flags=%d at %@ failed: %d"), 2, v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD68A0;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __67__MCMSQLiteDB_deleteAllAdvanceCopiesOfCodeSigningEntriesWithError___block_invoke_231(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteAllAdvanceCopiesOfCodeSigningEntriesWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD68B8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6810;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_209(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for child_code_signing_id_text=%@ at %@ failed: %s"), v3, v5, sqlite3_errmsg(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6828;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_213(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6840;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_215(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate parentIdentifier for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6858;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_parentIdentifierForChildIdentifier_error___block_invoke_219(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Parent identifier for: \"%@\" Not Found in DB"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB parentIdentifierForChildIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD6870;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 67, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6780;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_190(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6798;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_192(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD67B0;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_194(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate thisChildBundleId for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD67C8;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_198()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate childBundleIds"));
  v9[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v1;
  v10[1] = &unk_1E8CD67E0;
  v2 = *MEMORY[0x1E0CB2D50];
  v9[1] = CFSTR("SourceFileLine");
  v9[2] = v2;
  v10[2] = v0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v7 = 138543362;
    v8 = v0;
    _os_log_error_impl(&dword_1CF807000, v4, OS_LOG_TYPE_ERROR, "%{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __57__MCMSQLiteDB_childIdentifiersForParentIdentifier_error___block_invoke_203(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Children for parent identifier: \"%@\" Not Found in DB"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB childIdentifiersForParentIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD67F8;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 67, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB identifiersWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6738;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_184(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB identifiersWithError:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6750;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __36__MCMSQLiteDB_identifiersWithError___block_invoke_186(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate identifier for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB identifiersWithError:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6768;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD66C0;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_166(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD66D8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_173(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to allocate identifier for text: %s"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6708;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 73, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __64__MCMSQLiteDB_enumerateIdentifiersAndCodeSigningInfoUsingBlock___block_invoke_177(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error retrieving childBundleIds: %@"), *(_QWORD *)(a1 + 32));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB enumerateIdentifiersAndCodeSigningInfoUsingBlock:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6720;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error retrieving child bundles ids from DB with identifier %@ : %@"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6648;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 40))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_156(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec begin"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6660;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_160(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec commit"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6690;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_158(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Got exception: %@ : %@"), v3, v4);

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6678;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 40, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_162(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec rollback"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningForIdentifierAndAllChildren:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD66A8;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __57__MCMSQLiteDB_invalidateCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to invalidate identifier %@"), *(_QWORD *)(a1 + 32));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB invalidateCodeSigningWithIdentifier:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6630;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 40))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, buf, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __52__MCMSQLiteDB_codeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  _QWORD v8[4];

  v8[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Identifier: \"%@\" Not Found in DB"), *(_QWORD *)(a1 + 32));
  v7[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB codeSigningEntryWithIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v2;
  v8[1] = &unk_1E8CD6618;
  v3 = *MEMORY[0x1E0CB2D50];
  v7[1] = CFSTR("SourceFileLine");
  v7[2] = v3;
  v8[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 67, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __58__MCMSQLiteDB_deleteCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("\bidentifier %@ cannot be nil"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB deleteCodeSigningEntryWithIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6600;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 38, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("codeSigningEntry %@ and identifier %@ cannot be nil"), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6588;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 38, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_122(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec begin"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD65A0;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_132(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec commit"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD65D0;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_126(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "callStackSymbols");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Got exception: %@ : %@"), v3, v4);

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD65B8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 40, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_138(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed _sqliteExec rollback"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB addCodeSigningEntry:withIdentifier:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD65E8;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(select) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6540;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_113(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6558;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __59__MCMSQLiteDB__selectCodeSigningEntryWithIdentifier_error___block_invoke_115(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _selectCodeSigningEntryWithIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6570;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error formatting info data from DB"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD64F8;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __55__MCMSQLiteDB__codeSigningEntryFromStatementRow_error___block_invoke_105(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to create code signing entry from statement row"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _codeSigningEntryFromStatementRow:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD6528;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __54__MCMSQLiteDB__deleteCodeSigningWithIdentifier_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  const char *v10;
  NSObject *v11;
  uint32_t v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  uint64_t v18;
  _QWORD v19[3];
  _QWORD v20[4];

  v20[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("failed to delete from code_signing_info"));
  v19[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _deleteCodeSigningWithIdentifier:error:]_block_invoke");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v3;
  v20[1] = &unk_1E8CD64E0;
  v4 = *MEMORY[0x1E0CB2D50];
  v19[1] = CFSTR("SourceFileLine");
  v19[2] = v4;
  v20[2] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), *MEMORY[0x1E0CB3388]);
    v7 = (void *)objc_msgSend(v6, "copy");

    if (*(_QWORD *)(a1 + 32))
    {
      container_log_handle_for_category();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543618;
        v16 = v2;
        v17 = 2114;
        v18 = v9;
        v10 = "%{public}@ (%{public}@)";
        v11 = v8;
        v12 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v11, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v15, v12);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v7 = v5;
  }
  container_log_handle_for_category();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v15 = 138543362;
    v16 = v2;
    v10 = "%{public}@";
    v11 = v8;
    v12 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(insert) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6468;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_78(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  void *v15;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  uint64_t v20;
  _QWORD v21[3];
  _QWORD v22[4];

  v22[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "codeSigningInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("Error creating NSData from code signing info: %@"), v3);

  v21[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v5;
  v22[1] = &unk_1E8CD6480;
  v6 = *MEMORY[0x1E0CB2D50];
  v21[1] = CFSTR("SourceFileLine");
  v21[2] = v6;
  v22[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 40))
  {
    v8 = (void *)objc_msgSend(v7, "mutableCopy");
    objc_msgSend(v8, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), *MEMORY[0x1E0CB3388]);
    v9 = (void *)objc_msgSend(v8, "copy");

    if (*(_QWORD *)(a1 + 40))
    {
      container_log_handle_for_category();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        v18 = v4;
        v19 = 2114;
        v20 = v11;
        v12 = "%{public}@ (%{public}@)";
        v13 = v10;
        v14 = 22;
LABEL_9:
        _os_log_error_impl(&dword_1CF807000, v13, OS_LOG_TYPE_ERROR, v12, buf, v14);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
  else
  {
    v9 = v7;
  }
  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v18 = v4;
    v12 = "%{public}@";
    v13 = v10;
    v14 = 12;
    goto LABEL_9;
  }
LABEL_7:

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_82(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_blob64 for codeSigningInfoData at %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6498;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_86(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for code_signing_id_text=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD64B0;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __58__MCMSQLiteDB__insertCodeSigningData_forIdentifier_error___block_invoke_90(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningData:forIdentifier:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD64C8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error performing UPDATE operation for %@"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6438;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __58__MCMSQLiteDB__insertCodeSigningInfo_forIdentifier_error___block_invoke_71(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error performing INSERT operation for %@"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertCodeSigningInfo:forIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6450;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(insert) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6378;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_40(uint64_t a1)
{
  id v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isInvalid");
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_int for invalid=%d at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6390;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_44(uint64_t a1)
{
  id v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t buf[4];
  void *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v18[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isPlaceholder");
  v4 = objc_msgSend(*(id *)(a1 + 32), "isAdvanceCopy");
  v5 = *(unsigned int *)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_int for placeholder=%d, advance_copy=%d (flags=%d) at %@ failed: %d"), v3, v4, v5, v7, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v17[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v9;
  v18[1] = &unk_1E8CD63A8;
  v10 = *MEMORY[0x1E0CB2D50];
  v17[1] = CFSTR("SourceFileLine");
  v17[2] = v10;
  v18[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v16 = v8;
    _os_log_error_impl(&dword_1CF807000, v12, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_48(uint64_t a1)
{
  id v2;
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "isRegisteredByCaller");
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_int for registered_by_caller=%d at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD63C0;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_52(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = objc_msgSend(*(id *)(a1 + 32), "dataContainerClass");
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_int for data_container_class=%llu at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD63D8;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_56(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for code_signing_id=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD63F0;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_60(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6408;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __93__MCMSQLiteDB__performInsertOrUpdateQuery_withCodeSigningEntry_forIdentifier_isUpdate_error___block_invoke_62(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_changes for %s in %@: %d, but expecting 1"), v3, v5, *(unsigned int *)(a1 + 48));

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performInsertOrUpdateQuery:withCodeSigningEntry:forIdentifier:isUpdate:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD6420;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 68, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __64__MCMSQLiteDB__insertChildIdentifier_forParentIdentifier_error___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t buf[4];
  void *v9;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Error performing INSERT operation for child %@"), *(_QWORD *)(a1 + 32));
  v10[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _insertChildIdentifier:forParentIdentifier:error:]_block_invoke");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v2;
  v11[1] = &unk_1E8CD6360;
  v3 = *MEMORY[0x1E0CB2D50];
  v10[1] = CFSTR("SourceFileLine");
  v10[2] = v3;
  v11[2] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v9 = v1;
    _os_log_error_impl(&dword_1CF807000, v5, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_prepare(insert) for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD62E8;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_21(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for identifier=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6300;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_25(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t buf[4];
  void *v14;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_bind_text for identifier=%@ at %@ failed: %d"), v3, v5, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 48)));

  v15[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v16[1] = &unk_1E8CD6318;
  v8 = *MEMORY[0x1E0CB2D50];
  v15[1] = CFSTR("SourceFileLine");
  v15[2] = v8;
  v16[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v14 = v6;
    _os_log_error_impl(&dword_1CF807000, v10, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_27(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_step for %@ failed: %d"), v4, sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD6330;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __96__MCMSQLiteDB__performTwoParameterQuery_withTextInputOne_andTextInputTwo_expectedChanges_error___block_invoke_31(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("sqlite3_changes for %s in %@: %d, but expecting %d"), v3, v5, *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52));

  v12[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _performTwoParameterQuery:withTextInputOne:andTextInputTwo:expectedChanges:error:]_block_invoke");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = &unk_1E8CD6348;
  v8 = *MEMORY[0x1E0CB2D50];
  v12[1] = CFSTR("SourceFileLine");
  v12[2] = v8;
  v13[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 68, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

id __33__MCMSQLiteDB__sqliteExec_error___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint8_t buf[4];
  void *v13;
  _QWORD v14[3];
  _QWORD v15[4];

  v15[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", CFSTR("%@ on %@ failed: %s"), v3, v4, *(_QWORD *)(a1 + 48));

  v14[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[MCMSQLiteDB _sqliteExec:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v6;
  v15[1] = &unk_1E8CD62D0;
  v7 = *MEMORY[0x1E0CB2D50];
  v14[1] = CFSTR("SourceFileLine");
  v14[2] = v7;
  v15[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v13 = v5;
    _os_log_error_impl(&dword_1CF807000, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MCMErrorDomain"), 66, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)moveDBWithURL:(id)a3 toURL:(id)a4 queue:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  int v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  BOOL v16;
  NSObject *v17;
  id v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  char v24;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[4];
  NSObject *v30;
  sqlite3 *v31;
  int v32;
  _QWORD v33[4];
  NSObject *v34;
  sqlite3 *v35;
  int v36;
  sqlite3 *ppDb;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  int v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)a5);
  ppDb = 0;
  v11 = objc_retainAutorelease(v9);
  if (sqlite3_open_v2((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &ppDb, 1, 0))
  {
    v12 = sqlite3_extended_errcode(ppDb);
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke;
    v33[3] = &unk_1E8CB6130;
    v35 = ppDb;
    v13 = v11;
    v34 = v13;
    v36 = v12;
    __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke((uint64_t)v33);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      -[NSObject path](v13, "path");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v39 = v26;
      v40 = 1024;
      LODWORD(v41) = v12;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);

    }
    v16 = 0;
    v17 = v34;
  }
  else
  {
    v18 = objc_retainAutorelease(v10);
    objc_msgSend(v18, "fileSystemRepresentation");
    if (_sqlite3_db_copy_compact())
    {
      v19 = sqlite3_extended_errcode(ppDb);
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7;
      v29[3] = &unk_1E8CB6130;
      v31 = ppDb;
      v20 = v11;
      v30 = v20;
      v32 = v19;
      __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7((uint64_t)v29);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      container_log_handle_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v20, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v27;
        v40 = 2112;
        v41 = v28;
        v42 = 1024;
        v43 = v19;
        _os_log_error_impl(&dword_1CF807000, v21, OS_LOG_TYPE_ERROR, "copying [%@] to [%@] failed: xerr = %d", buf, 0x1Cu);

      }
      v16 = 0;
      v17 = v30;
    }
    else
    {
      container_log_handle_for_category();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v11, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v22;
        v40 = 2112;
        v41 = v23;
        _os_log_impl(&dword_1CF807000, v17, OS_LOG_TYPE_DEFAULT, "Moved [%@] to [%@]", buf, 0x16u);

      }
      v14 = 0;
      v16 = 1;
    }
  }

  if (ppDb)
    sqlite3_close(ppDb);
  if (a6)
    v24 = v16;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
    *a6 = objc_retainAutorelease(v14);

  return v16;
}

+ (sqlite3)openDBWithURL:(id)a3 queue:(id)a4 error:(id *)a5
{
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  id v11;
  int v12;
  id v13;
  void *v14;
  NSObject *v15;
  int v16;
  sqlite3 *v17;
  sqlite3 *result;
  void *v19;
  int v20;
  int v21;
  NSObject *v22;
  void *v23;
  char *errmsg;
  _QWORD v25[4];
  id v26;
  sqlite3 *v27;
  int v28;
  sqlite3 *ppDb;
  uint8_t buf[32];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  int v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  dispatch_assert_queue_V2(v8);
  ppDb = 0;
  container_log_handle_for_category();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v10;
    _os_log_impl(&dword_1CF807000, v9, OS_LOG_TYPE_DEFAULT, "Opening [%@]", buf, 0xCu);

  }
  v11 = objc_retainAutorelease(v7);
  if (sqlite3_open_v2((const char *)objc_msgSend(v11, "fileSystemRepresentation"), &ppDb, 4194310, 0))
  {
    v12 = sqlite3_extended_errcode(ppDb);
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke;
    v25[3] = &unk_1E8CB6130;
    v27 = ppDb;
    v13 = v11;
    v26 = v13;
    v28 = v12;
    __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke((uint64_t)v25);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    container_log_handle_for_category();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v19;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v12;
      _os_log_error_impl(&dword_1CF807000, v15, OS_LOG_TYPE_ERROR, "opening %@ failed: xerr = %d", buf, 0x12u);

    }
    sqlite3_close(ppDb);

    goto LABEL_8;
  }
  errmsg = 0;
  v16 = sqlite3_exec(ppDb, "PRAGMA locking_mode = EXCLUSIVE;PRAGMA journal_mode = WAL;PRAGMA foreign_keys = ON;PRAGMA auto_vacuum = FULL;C"
          "REATE TABLE IF NOT EXISTS code_signing_info(id INTEGER PRIMARY KEY AUTOINCREMENT,code_signing_id_text TEXT NOT"
          " NULL UNIQUE,invalid INTEGER NOT NULL DEFAULT 0,placeholder INTEGER NOT NULL DEFAULT 0,registered_by_caller IN"
          "TEGER NOT NULL DEFAULT 0,data_container_class INTEGER NOT NULL DEFAULT 0);CREATE TABLE IF NOT EXISTS code_sign"
          "ing_data(id INTEGER PRIMARY KEY AUTOINCREMENT,cs_info_id INTEGER NOT NULL UNIQUE,data BLOB NOT NULL,FOREIGN KE"
          "Y(cs_info_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE TABLE IF NOT EXISTS child_bundles(id "
          "INTEGER PRIMARY KEY AUTOINCREMENT,child_code_signing_id_text TEXT NOT NULL UNIQUE,parent_id INTEGER NOT NULL,F"
          "OREIGN KEY(parent_id) REFERENCES code_signing_info(id) ON DELETE CASCADE);CREATE INDEX IF NOT EXISTS code_sign"
          "ing_id_text_idx ON code_signing_info(code_signing_id_text);CREATE INDEX IF NOT EXISTS cs_info_id_idx ON code_s"
          "igning_data(cs_info_id);CREATE INDEX IF NOT EXISTS parent_id_idx ON child_bundles(parent_id);",
          0,
          0,
          &errmsg);
  v14 = 0;
  if (!v16)
  {
LABEL_8:
    v17 = ppDb;
    if (a5)
    {
      if (!ppDb)
      {
        *a5 = objc_retainAutorelease(v14);
        v17 = ppDb;
      }
    }

    return v17;
  }
  v20 = v16;
  v21 = sqlite3_extended_errcode(ppDb);
  container_log_handle_for_category();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v11, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v23;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = errmsg;
    _os_log_error_impl(&dword_1CF807000, v22, OS_LOG_TYPE_ERROR, "table create for %@ failed: %s", buf, 0x16u);

  }
  sqlite3_free(errmsg);
  v35 = 0;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  memset(buf, 0, sizeof(buf));
  snprintf((char *)buf, 0x64uLL, "Failed to initialize database, err = %d, xerr = %d", v20, v21);
  sqlite3_close(ppDb);
  result = (sqlite3 *)_os_crash();
  __break(1u);
  return result;
}

id __41__MCMSQLiteDB_openDBWithURL_queue_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(CFSTR("opening %@ failed: xerr = %d"), "stringByAppendingFormat:", CFSTR(", errmsg: %s"), sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMSQLiteDB openDBWithURL:queue:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD62B8;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.containermanagerd.SQLite"), sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(CFSTR("opening %@ failed: xerr = %x"), "stringByAppendingFormat:", CFSTR(", errmsg: %s"), sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD6288;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.containermanagerd.SQLite"), sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id __47__MCMSQLiteDB_moveDBWithURL_toURL_queue_error___block_invoke_7(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(CFSTR("opening %@ failed: xerr = %x"), "stringByAppendingFormat:", CFSTR(", errmsg: %s"), sqlite3_errmsg(*(sqlite3 **)(a1 + 40)));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v2, "initWithFormat:", v3, v4, *(unsigned int *)(a1 + 48));

  v11[0] = CFSTR("FunctionName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[MCMSQLiteDB moveDBWithURL:toURL:queue:error:]_block_invoke");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  v12[1] = &unk_1E8CD62A0;
  v7 = *MEMORY[0x1E0CB2D50];
  v11[1] = CFSTR("SourceFileLine");
  v11[2] = v7;
  v12[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.containermanagerd.SQLite"), sqlite3_extended_errcode(*(sqlite3 **)(a1 + 40)), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

@end
