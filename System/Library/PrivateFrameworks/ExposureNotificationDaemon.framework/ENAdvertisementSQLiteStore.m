@implementation ENAdvertisementSQLiteStore

+ (id)centralStoreInFolderPath:(id)a3 error:(id *)a4
{
  void *v5;
  ENAdvertisementSQLiteStore *v6;

  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("en_advertisements.db"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ENAdvertisementSQLiteStore initWithPath:error:]([ENAdvertisementSQLiteStore alloc], "initWithPath:error:", v5, a4);

  return v6;
}

+ (id)temporaryStoreInFolderPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  ENAdvertisementSQLiteStore *v14;

  v6 = a3;
  objc_msgSend(a1, "temporaryStorePathsInFolderPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8 < 0xA)
  {
    v9 = (void *)MEMORY[0x1E0CB3938];
    objc_msgSend(MEMORY[0x1E0CB3A30], "UUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%s%@.db"), "tmp_en_advertisements_", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "stringByAppendingPathComponent:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[ENAdvertisementSQLiteStore initWithPath:]([ENAdvertisementSQLiteStore alloc], "initWithPath:", v13);

  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (a4)
    {
      objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", CFSTR("ENAdvertisementStoreErrorDomain"), 7, 0);
      v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }
  }

  return v14;
}

+ (BOOL)isTemporaryStore:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("tmp_en_advertisements_")))
    v4 = objc_msgSend(v3, "hasSuffix:", CFSTR(".db"));
  else
    v4 = 0;

  return v4;
}

+ (BOOL)isCentralStore:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("en_advertisements.db"));
}

+ (BOOL)isStore:(id)a3
{
  id v4;
  char v5;

  v4 = a3;
  if ((objc_msgSend(a1, "isCentralStore:", v4) & 1) != 0)
    v5 = 1;
  else
    v5 = objc_msgSend(a1, "isTemporaryStore:", v4);

  return v5;
}

+ (id)temporaryStorePathsInFolderPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(a1, "isTemporaryStore:", v15))
          {
            objc_msgSend(v4, "stringByAppendingPathComponent:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v7, "localizedDescription");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    LogPrintF_safe();
LABEL_17:

  }
  return v8;
}

+ (BOOL)temporaryStoresPresentInFolderPath:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "temporaryStorePathsInFolderPath:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

+ (id)temporaryStoresInFolderPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  ENAdvertisementSQLiteStore *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "temporaryStorePathsInFolderPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(objc_retainAutorelease(v11), "UTF8String");
          LogPrintF_safe();
        }
        v12 = -[ENAdvertisementSQLiteStore initWithPath:]([ENAdvertisementSQLiteStore alloc], "initWithPath:", v11);
        if (v12)
          objc_msgSend(v5, "addObject:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  return v5;
}

+ (void)enumerateTemporaryStoresInFolderPath:(id)a3 handler:(id)a4
{
  void (**v6)(id, ENAdvertisementSQLiteStore *, _BYTE *);
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  ENAdvertisementSQLiteStore *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, ENAdvertisementSQLiteStore *, _BYTE *))a4;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(a1, "temporaryStorePathsInFolderPath:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          LogPrintF_safe();
        }
        v13 = -[ENAdvertisementSQLiteStore initWithPath:]([ENAdvertisementSQLiteStore alloc], "initWithPath:", v12);
        if (v13)
        {
          v14 = 0;
          v6[2](v6, v13, &v14);
          if (v14)
          {

            goto LABEL_19;
          }
        }
        else if (gLogCategory_ENAdvertisementSQLiteStore <= 90
               && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(objc_retainAutorelease(v12), "UTF8String");
          LogPrintF_safe();
        }

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }
LABEL_19:

}

+ (id)storePathsInFolderPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  BOOL v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v4, &v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v22;

  v8 = objc_alloc_init(MEMORY[0x1E0C99DE0]);
  if (v6)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v19 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          if (objc_msgSend(a1, "isStore:", v15))
          {
            objc_msgSend(v4, "stringByAppendingPathComponent:", v15);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "addObject:", v16);

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v12);
    }
    goto LABEL_17;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v7, "localizedDescription");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v10, "UTF8String");
    LogPrintF_safe();
LABEL_17:

  }
  return v8;
}

+ (BOOL)storesPresentInFolderPath:(id)a3
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if (v6)
  {
    objc_msgSend(a1, "storePathsInFolderPath:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (ENAdvertisementSQLiteStore)initWithPath:(id)a3 error:(id *)a4
{
  id v7;
  ENAdvertisementSQLiteStore *v8;
  ENAdvertisementSQLiteStore *v9;
  ENAdvertisementSQLiteStore *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ENAdvertisementSQLiteStore;
  v8 = -[ENAdvertisementSQLiteStore init](&v12, sel_init);
  v9 = v8;
  if (v8
    && (objc_storeStrong((id *)&v8->_databasePath, a3),
        !-[ENAdvertisementSQLiteStore connectToDatabaseAndReturnError:](v9, "connectToDatabaseAndReturnError:", a4)))
  {
    v10 = 0;
  }
  else
  {
    v10 = v9;
  }

  return v10;
}

- (ENAdvertisementSQLiteStore)initWithPath:(id)a3
{
  return -[ENAdvertisementSQLiteStore initWithPath:error:](self, "initWithPath:error:", a3, 0);
}

- (void)dealloc
{
  objc_super v3;

  if (self->_database)
    -[ENAdvertisementSQLiteStore disconnectFromDatabase](self, "disconnectFromDatabase");
  v3.receiver = self;
  v3.super_class = (Class)ENAdvertisementSQLiteStore;
  -[ENAdvertisementSQLiteStore dealloc](&v3, sel_dealloc);
}

- (BOOL)importContentsOfStore:(id)a3 error:(id *)a4
{
  id v6;
  const char *v7;
  id v8;
  void *v9;
  void *v10;
  size_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  char v16;
  size_t v17;
  BOOL v18;
  char v19;
  const char *v21;
  uint64_t v22;
  _QWORD v23[10];
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;

  v6 = a3;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    v7 = -[NSString UTF8String](self->_databasePath, "UTF8String");
    objc_msgSend(v6, "databasePath");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = v7;
    v22 = objc_msgSend(v8, "UTF8String");
    LogPrintF_safe();

  }
  objc_msgSend(v6, "storedAdvertisementCount", v21, v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "unsignedIntValue") <= 0x4CB)
    v11 = objc_msgSend(v10, "unsignedIntValue");
  else
    v11 = 1228;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 1;
  v12 = malloc_type_calloc(v11, 0x28uLL, 0x10000400A747E1EuLL);
  v13 = v12;
  if (v12)
  {
    if (*((_BYTE *)v25 + 24))
    {
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __58__ENAdvertisementSQLiteStore_importContentsOfStore_error___block_invoke;
      v23[3] = &unk_1E87DB9B8;
      v23[4] = self;
      v23[5] = &v28;
      v23[8] = v12;
      v23[9] = a4;
      v23[6] = &v24;
      v23[7] = v11;
      v14 = objc_msgSend(v6, "enumerateAdvertisments:", v23);
      if (*((_BYTE *)v25 + 24))
        v15 = v14 == 0;
      else
        v15 = 0;
      v16 = v15;
      *((_BYTE *)v25 + 24) = v16;
      if (v15)
      {
        v17 = v29[3] % v11;
        if (v17)
        {
          v18 = -[ENAdvertisementSQLiteStore saveContactTracingAdvertisementBuffer:count:error:](self, "saveContactTracingAdvertisementBuffer:count:error:", v13, v17, a4);
          *((_BYTE *)v25 + 24) = v18;
        }
      }
    }
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    *((_BYTE *)v25 + 24) = 0;
  }
  free(v13);
  v19 = *((_BYTE *)v25 + 24);
  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(&v28, 8);

  return v19;
}

uint64_t __58__ENAdvertisementSQLiteStore_importContentsOfStore_error___block_invoke(uint64_t a1, __int128 *a2)
{
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) % *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 64) + 40 * v2;
  v4 = *a2;
  v5 = a2[1];
  *(_QWORD *)(v3 + 32) = *((_QWORD *)a2 + 4);
  *(_OWORD *)v3 = v4;
  *(_OWORD *)(v3 + 16) = v5;
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2 != *(_QWORD *)(a1 + 56) - 1
    || (objc_msgSend(*(id *)(a1 + 32), "saveContactTracingAdvertisementBuffer:count:error:", *(_QWORD *)(a1 + 64)) & 1) != 0)
  {
    return 1;
  }
  result = 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  return result;
}

+ (id)statementStringForStatementType:(unint64_t)a3
{
  if (a3 > 4)
    return 0;
  else
    return off_1E87DBA40[a3];
}

- (BOOL)connectToDatabaseAndReturnError:(id *)a3
{
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  BOOL result;
  const char *v16;
  uint64_t v17;
  uint64_t v18;

  v5 = -[NSString UTF8String](self->_databasePath, "UTF8String");
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50)
  {
    v6 = v5;
    if (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
    {
      v16 = v6;
      LogPrintF_safe();
    }
  }
  v7 = -[ENAdvertisementSQLiteStore openDatabase](self, "openDatabase", v16);
  if ((_DWORD)v7)
  {
    v8 = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
    {
      if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
LABEL_34:
        LogPrintF_safe();
LABEL_35:
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        v17 = v8;
        LogPrintF_safe();
      }
    }
  }
  else
  {
    v9 = -[ENAdvertisementSQLiteStore configureDatabase](self, "configureDatabase");
    if ((_DWORD)v9)
    {
      v8 = v9;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
      {
        if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
          goto LABEL_34;
        goto LABEL_35;
      }
    }
    else
    {
      v10 = -[ENAdvertisementSQLiteStore migrateDatabase](self, "migrateDatabase");
      if ((_DWORD)v10)
      {
        v8 = v10;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
        {
          if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
            goto LABEL_34;
          goto LABEL_35;
        }
      }
      else
      {
        v11 = -[ENAdvertisementSQLiteStore initializeAdvertisementTable](self, "initializeAdvertisementTable");
        if ((_DWORD)v11)
        {
          v8 = v11;
          if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
          {
            if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
              goto LABEL_34;
            goto LABEL_35;
          }
        }
        else
        {
          v12 = -[ENAdvertisementSQLiteStore initializeRPIBufferModule](self, "initializeRPIBufferModule");
          if ((_DWORD)v12)
          {
            v8 = v12;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
            {
              if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
                goto LABEL_34;
              goto LABEL_35;
            }
          }
          else
          {
            v13 = -[ENAdvertisementSQLiteStore initializePreparedStatements](self, "initializePreparedStatements");
            if (!(_DWORD)v13)
            {
              v18 = 0;
              if (-[ENAdvertisementSQLiteStore refreshStoredAdvertismentCountWithError:](self, "refreshStoredAdvertismentCountWithError:", &v18))
              {
                return 1;
              }
              if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
              {
                LogPrintF_safe();
              }
              v8 = 1;
              goto LABEL_35;
            }
            v8 = v13;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
            {
              if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
                goto LABEL_34;
              goto LABEL_35;
            }
          }
        }
      }
    }
  }
  if ((_DWORD)v8 == 26 || (_DWORD)v8 == 11)
  {
    if (gLogCategory_ENAdvertisementSQLiteStore <= 50
      && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    if (!-[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self, "purgeAndRemoveFromDisk:", 0, v17)
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
  }
  else
  {
    -[ENAdvertisementSQLiteStore closeDatabase](self, "closeDatabase");
  }
  if (!a3)
    return 0;
  objc_msgSend((id)objc_opt_class(), "errorForSQLiteResult:", v8);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  result = 0;
  *a3 = v14;
  return result;
}

- (void)disconnectFromDatabase
{
  -[ENAdvertisementSQLiteStore enumeratePreparedStatements:](self, "enumeratePreparedStatements:", &__block_literal_global_8);
  free(self->_preparedStatements);
  self->_preparedStatements = 0;
  -[ENAdvertisementSQLiteStore closeDatabase](self, "closeDatabase");
}

uint64_t __52__ENAdvertisementSQLiteStore_disconnectFromDatabase__block_invoke(int a1, sqlite3_stmt *pStmt)
{
  return sqlite3_finalize(pStmt);
}

- (int)openDatabase
{
  return sqlite3_open_v2(-[NSString UTF8String](self->_databasePath, "UTF8String"), &self->_database, 2097158, 0);
}

- (int)closeDatabase
{
  sqlite3 *database;
  int v4;

  database = self->_database;
  if (database)
  {
    v4 = sqlite3_close(database);
    if (v4)
    {
      if (gLogCategory_ENAdvertisementSQLiteStore <= 90
        && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        -[NSString UTF8String](self->_databasePath, "UTF8String");
        LogPrintF_safe();
      }
    }
    else
    {
      self->_database = 0;
    }
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return 1;
  }
  return v4;
}

- (int)configureDatabase
{
  int v3;
  int v4;

  -[NSString UTF8String](self->_databasePath, "UTF8String");
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  if (sqlite3_busy_timeout(self->_database, 600000)
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  v3 = sqlite3_exec(self->_database, "pragma auto_vacuum = 1;", 0, 0, 0);
  if (v3)
  {
    v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_17:
      LogPrintF_safe();
    }
  }
  else
  {
    v4 = sqlite3_exec(self->_database, "pragma journal_mode=WAL;", 0, 0, 0);
    if (v4
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_17;
    }
  }
  return v4;
}

- (int)migrateDatabase
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  sqlite3_stmt *ppStmt;

  ppStmt = 0;
  v3 = sqlite3_prepare(self->_database, "pragma user_version;", -1, &ppStmt, 0);
  if ((_DWORD)v3)
  {
    v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      v9 = (uint64_t)sqlite3_errmsg(self->_database);
      v10 = sqlite3_extended_errcode(self->_database);
      v8 = v4;
      LogPrintF_safe();
    }
    if ((_DWORD)v4 == 100)
      goto LABEL_11;
LABEL_19:
    sqlite3_finalize(ppStmt);
    return v4;
  }
  v5 = sqlite3_step(ppStmt);
  if (v5 != 100)
  {
    LODWORD(v4) = v5;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
    goto LABEL_19;
  }
LABEL_11:
  v6 = sqlite3_column_int(ppStmt, 0);
  sqlite3_finalize(ppStmt);
  LODWORD(v4) = 0;
  if ((_DWORD)v6 != 2)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      v8 = v6;
      v9 = 2;
      LogPrintF_safe();
    }
    LODWORD(v4) = -[ENAdvertisementSQLiteStore migrateFromVersion:](self, "migrateFromVersion:", v6, v8, v9, v10);
  }
  return v4;
}

- (BOOL)transactionNeededForMigrationFromVersion:(int)a3
{
  return a3 == 1;
}

- (int)migrateFromVersion:(int)a3
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v3 = *(_QWORD *)&a3;
  if (-[ENAdvertisementSQLiteStore transactionNeededForMigrationFromVersion:](self, "transactionNeededForMigrationFromVersion:"))
  {
    LODWORD(v5) = -[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction");
    if ((_DWORD)v5)
      goto LABEL_29;
  }
  if ((_DWORD)v3 && (int)v3 <= 2)
  {
    if ((_DWORD)v3 == 1)
    {
      v6 = sqlite3_exec(self->_database, "ALTER TABLE en_advertisements ADD COLUMN max_rssi INTEGER;", 0, 0, 0);
      if ((_DWORD)v6)
      {
        v5 = v6;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
LABEL_22:
          v11 = sqlite3_errmsg(self->_database);
          v12 = sqlite3_extended_errcode(self->_database);
          v10 = v5;
LABEL_23:
          LogPrintF_safe();
        }
LABEL_29:
        if (-[ENAdvertisementSQLiteStore transactionNeededForMigrationFromVersion:](self, "transactionNeededForMigrationFromVersion:", v3, v10, v11, v12)&& -[ENAdvertisementSQLiteStore rollbackDatabaseTransaction](self, "rollbackDatabaseTransaction")&& gLogCategory__ENAdvertisementSQLiteStore <= 90&& (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          sqlite3_errmsg(self->_database);
          sqlite3_extended_errcode(self->_database);
          LogPrintF_safe();
        }
        return v5;
      }
      v9 = sqlite3_exec(self->_database, "UPDATE en_advertisements SET max_rssi = rssi;", 0, 0, 0);
      if ((_DWORD)v9)
      {
        v5 = v9;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_22;
        }
        goto LABEL_29;
      }
    }
  }
  else if (!-[ENAdvertisementSQLiteStore purgeAndRemoveFromDisk:](self, "purgeAndRemoveFromDisk:", 0))
  {
    LODWORD(v5) = 1;
    goto LABEL_29;
  }
  v7 = -[ENAdvertisementSQLiteStore setVersionCurrent](self, "setVersionCurrent");
  if (v7)
  {
    LODWORD(v5) = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_23;
    }
    goto LABEL_29;
  }
  if (-[ENAdvertisementSQLiteStore transactionNeededForMigrationFromVersion:](self, "transactionNeededForMigrationFromVersion:", v3))
  {
    return -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction");
  }
  LODWORD(v5) = 0;
  return v5;
}

- (int)setVersionCurrent
{
  id v3;
  const char *v4;

  objc_msgSend(MEMORY[0x1E0CB3938], "stringWithFormat:", CFSTR("pragma user_version=%d;"), 2);
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v4 = (const char *)objc_msgSend(v3, "UTF8String");

  return sqlite3_exec(self->_database, v4, 0, 0, 0);
}

- (int)initializeAdvertisementTable
{
  int v3;
  int v4;

  v3 = sqlite3_exec(self->_database, (const char *)objc_msgSend(CFSTR("CREATE TABLE IF NOT EXISTS en_advertisements(rpi BLOB, encrypted_aem BLOB, timestamp INTEGER, scan_interval INTEGER, rssi INTEGER, max_rssi INTEGER, saturated BOOLEAN, counter INTEGER, PRIMARY KEY(rpi, timestamp)) WITHOUT ROWID;"),
                         "UTF8String"),
         0,
         0,
         0);
  if (v3)
  {
    v4 = v3;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_8:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    v4 = sqlite3_exec(self->_database, (const char *)objc_msgSend(CFSTR("CREATE INDEX IF NOT EXISTS timestamp ON en_advertisements(timestamp);"),
                           "UTF8String"),
           0,
           0,
           0);
    if (v4
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      goto LABEL_8;
    }
  }
  return v4;
}

- (int)initializeRPIBufferModule
{
  int v3;

  v3 = ct_sqlite_rpi_buffer_init(self->_database);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)initializePreparedStatements
{
  sqlite3_stmt **v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  const char *v7;
  int v8;
  int v9;

  v3 = (sqlite3_stmt **)malloc_type_malloc(0x28uLL, 0x2004093837F09uLL);
  self->_preparedStatements = v3;
  if (v3)
  {
    v4 = 0;
    v5 = 0;
    while (1)
    {
      objc_msgSend((id)objc_opt_class(), "statementStringForStatementType:", v5);
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v7 = (const char *)objc_msgSend(v6, "UTF8String");

      v8 = sqlite3_prepare(self->_database, v7, -1, &self->_preparedStatements[v4], 0);
      if (v8)
        break;
      ++v5;
      ++v4;
      if (v5 == 5)
        return 0;
    }
    v9 = v8;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
    free(self->_preparedStatements);
    self->_preparedStatements = 0;
  }
  else
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
    }
    return 7;
  }
  return v9;
}

- (void)enumeratePreparedStatements:(id)a3
{
  uint64_t i;

  if (self->_preparedStatements)
  {
    for (i = 0; i != 5; ++i)
      (*((void (**)(id, sqlite3_stmt *, uint64_t))a3 + 2))(a3, self->_preparedStatements[i], i);
  }
}

+ (id)errorForSQLiteResult:(int)a3
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  v5 = 0;
  if (a3 <= 22)
  {
    switch(a3)
    {
      case 5:
        v6 = 5;
        goto LABEL_12;
      case 6:
      case 7:
      case 8:
      case 9:
      case 12:
        return v5;
      case 10:
        v6 = 4;
        goto LABEL_12;
      case 11:
        goto LABEL_6;
      case 13:
        v6 = 2;
        goto LABEL_12;
      default:
        if (a3 != 1)
          return v5;
        v6 = 1;
        break;
    }
    goto LABEL_12;
  }
  if (a3 == 23)
  {
    v6 = 6;
    goto LABEL_12;
  }
  if (a3 == 26)
  {
LABEL_6:
    v6 = 3;
LABEL_12:
    objc_msgSend(MEMORY[0x1E0CB35C0], "errorWithDomain:code:userInfo:", CFSTR("ENAdvertisementStoreErrorDomain"), v6, 0, v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (int)beginDatabaseTransaction
{
  int v3;

  v3 = sqlite3_exec(self->_database, "BEGIN EXCLUSIVE TRANSACTION;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)endDatabaseTransaction
{
  int v3;

  v3 = sqlite3_exec(self->_database, "COMMIT;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)rollbackDatabaseTransaction
{
  int v3;

  v3 = sqlite3_exec(self->_database, "ROLLBACK;", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (int)checkpointWAL
{
  int v3;

  v3 = sqlite3_exec(self->_database, "pragma wal_checkpoint(TRUNCATE);", 0, 0, 0);
  if (v3
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
  return v3;
}

- (sqlite3_stmt)preparedStatementOfType:(unint64_t)a3
{
  sqlite3_stmt *v3;

  v3 = self->_preparedStatements[a3];
  sqlite3_reset(v3);
  return v3;
}

+ ($8B507D830E6EE36862B76123793C2CB9)advertisementForSQLiteStatement:(SEL)a3
{
  int v6;
  $8B507D830E6EE36862B76123793C2CB9 *result;

  *(_QWORD *)&retstr->var3 = 0;
  retstr->var0 = 0u;
  *(_OWORD *)retstr->var1.var0 = 0u;
  *(double *)(&retstr->var1 + 1) = (double)sqlite3_column_int64(a4, 2);
  HIDWORD(retstr->var2) = sqlite3_column_int64(a4, 8);
  LOWORD(retstr->var3) = sqlite3_column_int64(a4, 9);
  HIWORD(retstr->var3) = sqlite3_column_int(a4, 3);
  LOBYTE(retstr->var4) = sqlite3_column_int(a4, 4);
  HIBYTE(retstr->var4) = sqlite3_column_int(a4, 5);
  LOBYTE(retstr->var5) = sqlite3_column_int(a4, 6) != 0;
  HIBYTE(retstr->var5) = sqlite3_column_int(a4, 7);
  retstr->var0 = *($0DD201535F598B6025D84F9AACEC468E *)sqlite3_column_blob(a4, 0);
  v6 = sqlite3_column_bytes(a4, 1);
  result = ($8B507D830E6EE36862B76123793C2CB9 *)sqlite3_column_blob(a4, 1);
  if (v6 == 4)
  {
    retstr->var1 = *($A0BF7C2F34202597F9F30F6CD4123348 *)result->var0.var0;
  }
  else if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore != -1)
      return ($8B507D830E6EE36862B76123793C2CB9 *)LogPrintF_safe();
    result = ($8B507D830E6EE36862B76123793C2CB9 *)_LogCategory_Initialize();
    if ((_DWORD)result)
      return ($8B507D830E6EE36862B76123793C2CB9 *)LogPrintF_safe();
  }
  return result;
}

- (int)bindAdvertisement:(id *)a3 toSQLiteStatement:(sqlite3_stmt *)a4
{
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;

  v7 = sqlite3_bind_blob(a4, 1, a3, 16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  if (v7)
  {
    v8 = v7;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_42:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    v9 = sqlite3_bind_blob(a4, 2, &a3->var1, 4, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    if (v9)
    {
      v8 = v9;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_42;
      }
    }
    else
    {
      v10 = sqlite3_bind_int64(a4, 3, (uint64_t)*(double *)(&a3->var1 + 1));
      if (v10)
      {
        v8 = v10;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_42;
        }
      }
      else
      {
        v11 = sqlite3_bind_int(a4, 4, HIWORD(a3->var3));
        if (v11)
        {
          v8 = v11;
          if (gLogCategory__ENAdvertisementSQLiteStore <= 90
            && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
          {
            goto LABEL_42;
          }
        }
        else
        {
          v12 = sqlite3_bind_int(a4, 5, SLOBYTE(a3->var4));
          if (v12)
          {
            v8 = v12;
            if (gLogCategory__ENAdvertisementSQLiteStore <= 90
              && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              goto LABEL_42;
            }
          }
          else
          {
            v13 = sqlite3_bind_int(a4, 6, SHIBYTE(a3->var4));
            if (v13)
            {
              v8 = v13;
              if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
              {
                goto LABEL_42;
              }
            }
            else
            {
              v14 = sqlite3_bind_int(a4, 7, LOBYTE(a3->var5));
              if (v14)
              {
                v8 = v14;
                if (gLogCategory__ENAdvertisementSQLiteStore <= 90
                  && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
                {
                  goto LABEL_42;
                }
              }
              else
              {
                v8 = sqlite3_bind_int(a4, 8, HIBYTE(a3->var5));
                if (v8
                  && gLogCategory__ENAdvertisementSQLiteStore <= 90
                  && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
                {
                  goto LABEL_42;
                }
              }
            }
          }
        }
      }
    }
  }
  return v8;
}

- (BOOL)refreshStoredAdvertismentCountWithError:(id *)a3
{
  sqlite3_stmt *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSNumber *v9;
  NSNumber *storedAdvertisementCount;
  BOOL v11;
  NSNumber *v12;
  uint64_t v14;
  const char *v15;
  uint64_t v16;

  v5 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 1);
  v6 = -[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction");
  if ((_DWORD)v6 == 100)
    goto LABEL_4;
  v7 = v6;
  if (!(_DWORD)v6)
  {
    v8 = sqlite3_step(v5);
    if ((_DWORD)v8 == 100)
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithInt:", sqlite3_column_int(v5, 0));
      v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      storedAdvertisementCount = self->_storedAdvertisementCount;
      self->_storedAdvertisementCount = v9;

      v11 = 1;
      goto LABEL_12;
    }
    v7 = v8;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      v15 = sqlite3_errmsg(self->_database);
      v16 = sqlite3_extended_errcode(self->_database);
      v14 = v7;
      LogPrintF_safe();
    }
  }
  v12 = self->_storedAdvertisementCount;
  self->_storedAdvertisementCount = 0;

  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "errorForSQLiteResult:", v7);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_12:
  -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction", v14, v15, v16);
  sqlite3_reset(v5);
  return v11;
}

- (BOOL)saveContactTracingAdvertisementBuffer:(id *)a3 count:(unint64_t)a4 error:(id *)a5
{
  sqlite3_stmt *v9;
  uint64_t v10;
  NSNumber *storedAdvertisementCount;
  NSNumber *v12;
  NSNumber *v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  _OWORD v22[2];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v9 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 0);
  v10 = -[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction");
  if (!(_DWORD)v10)
  {
    if (!a4)
    {
      v10 = 0;
      goto LABEL_12;
    }
    v14 = a4;
    while (1)
    {
      v15 = *(_OWORD *)a3->var1.var0;
      v22[0] = a3->var0;
      v22[1] = v15;
      v23 = *(_QWORD *)&a3->var3;
      v16 = -[ENAdvertisementSQLiteStore bindAdvertisement:toSQLiteStatement:](self, "bindAdvertisement:toSQLiteStatement:", v22, v9);
      if ((_DWORD)v16)
      {
        v10 = v16;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_21;
        }
        goto LABEL_2;
      }
      v17 = sqlite3_step(v9);
      if ((_DWORD)v17 != 101)
        break;
      sqlite3_clear_bindings(v9);
      sqlite3_reset(v9);
      a3 = ($8B507D830E6EE36862B76123793C2CB9 *)((char *)a3 + 40);
      if (!--v14)
        goto LABEL_3;
    }
    v10 = v17;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_21:
      v20 = sqlite3_errmsg(self->_database);
      v21 = sqlite3_extended_errcode(self->_database);
      v19 = v10;
      LogPrintF_safe();
    }
  }
LABEL_2:
  if ((_DWORD)v10 == 101)
  {
LABEL_3:
    v10 = -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction", v19, v20, v21);
    storedAdvertisementCount = self->_storedAdvertisementCount;
    if (storedAdvertisementCount)
    {
      objc_msgSend(MEMORY[0x1E0CB37E0], "numberWithUnsignedInteger:", a4 + -[NSNumber unsignedIntValue](storedAdvertisementCount, "unsignedIntValue"));
      v12 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      v13 = self->_storedAdvertisementCount;
      self->_storedAdvertisementCount = v12;

    }
    goto LABEL_23;
  }
LABEL_12:
  if (-[ENAdvertisementSQLiteStore rollbackDatabaseTransaction](self, "rollbackDatabaseTransaction", v19, v20, v21)
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }
LABEL_23:
  if (a5 && (_DWORD)v10)
  {
    objc_msgSend((id)objc_opt_class(), "errorForSQLiteResult:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  sqlite3_reset(v9);
  return (_DWORD)v10 == 0;
}

- (int)enumerateAdvertisments:(id)a3
{
  _QWORD *v4;
  sqlite3_stmt *v5;
  int v6;
  void *v8;
  uint64_t (*v9)(_QWORD *, _OWORD *);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 2);
  if (!-[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction"))
  {
    while (1)
    {
      v10 = sqlite3_step(v5);
      if ((_DWORD)v10 != 100)
        break;
      v19 = 0;
      v17 = 0u;
      v18 = 0u;
      v8 = (void *)objc_opt_class();
      if (v8)
      {
        objc_msgSend(v8, "advertisementForSQLiteStatement:", v5);
      }
      else
      {
        v19 = 0;
        v17 = 0u;
        v18 = 0u;
      }
      v9 = (uint64_t (*)(_QWORD *, _OWORD *))v4[2];
      v15[0] = v17;
      v15[1] = v18;
      v16 = v19;
      if ((v9(v4, v15) & 1) == 0)
        goto LABEL_2;
    }
    v11 = v10;
    if ((_DWORD)v10 != 101
      && gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      v13 = sqlite3_errmsg(self->_database);
      v14 = sqlite3_extended_errcode(self->_database);
      v12 = v11;
      LogPrintF_safe();
    }
  }
LABEL_2:
  v6 = -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction", v12, v13, v14);
  sqlite3_reset(v5);

  return v6;
}

- (id)queryFilterWithBufferSize:(unint64_t)a3 hashCount:(unint64_t)a4 attenuationThreshold:(unsigned __int8)a5
{
  ENQueryFilter *v6;
  ENQueryFilter *v7;
  _QWORD v9[4];
  ENQueryFilter *v10;

  v6 = -[ENQueryFilter initWithBufferSize:hashCount:]([ENQueryFilter alloc], "initWithBufferSize:hashCount:", a3, a4);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __87__ENAdvertisementSQLiteStore_queryFilterWithBufferSize_hashCount_attenuationThreshold___block_invoke;
  v9[3] = &unk_1E87DBA20;
  v7 = v6;
  v10 = v7;
  if (-[ENAdvertisementSQLiteStore enumerateAdvertisments:](self, "enumerateAdvertisments:", v9))
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }

    v7 = 0;
  }

  return v7;
}

uint64_t __87__ENAdvertisementSQLiteStore_queryFilterWithBufferSize_hashCount_attenuationThreshold___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addPossibleRPI:", a2);
  return 1;
}

- (id)beaconCountMetricsWithStartDate:(id)a3 endDate:(id)a4 windowDuration:(double)a5
{
  id v8;
  id v9;
  ENBeaconCountMetrics *v10;
  ENBeaconCountMetrics *v11;
  _QWORD v13[4];
  ENBeaconCountMetrics *v14;

  v8 = a4;
  v9 = a3;
  v10 = -[ENBeaconCountMetrics initWithStartDate:endDate:windowDuration:]([ENBeaconCountMetrics alloc], "initWithStartDate:endDate:windowDuration:", v9, v8, a5);

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __85__ENAdvertisementSQLiteStore_beaconCountMetricsWithStartDate_endDate_windowDuration___block_invoke;
  v13[3] = &unk_1E87DBA20;
  v11 = v10;
  v14 = v11;
  if (-[ENAdvertisementSQLiteStore enumerateAdvertisments:](self, "enumerateAdvertisments:", v13))
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }

    v11 = 0;
  }

  return v11;
}

uint64_t __85__ENAdvertisementSQLiteStore_beaconCountMetricsWithStartDate_endDate_windowDuration___block_invoke(uint64_t a1, uint64_t a2)
{
  ENAdvertisement *v4;
  __int128 v5;
  ENAdvertisement *v6;
  _OWORD v8[2];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = [ENAdvertisement alloc];
  v5 = *(_OWORD *)(a2 + 16);
  v8[0] = *(_OWORD *)a2;
  v8[1] = v5;
  v9 = *(_QWORD *)(a2 + 32);
  v6 = -[ENAdvertisement initWithStructRepresentation:](v4, "initWithStructRepresentation:", v8);
  objc_msgSend(*(id *)(a1 + 32), "addAdvertisement:", v6);

  return 1;
}

- (int)bindRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 toSQLiteStatement:(sqlite3_stmt *)a7
{
  int v8;
  int v10;
  int v12;
  int v13;
  int v14;
  int v15;

  v8 = a6;
  v10 = a4;
  v12 = sqlite3_bind_pointer(a7, 1, (void *)a3, "ct_sqlite_rpi_buffer", 0);
  if (v12)
  {
    v13 = v12;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
LABEL_18:
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
    }
  }
  else
  {
    v14 = sqlite3_bind_pointer(a7, 2, (void *)a5, "ct_sqlite_rpi_validity_buffer", 0);
    if (v14)
    {
      v13 = v14;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        goto LABEL_18;
      }
    }
    else
    {
      v15 = sqlite3_bind_int(a7, 3, v10);
      if (v15)
      {
        v13 = v15;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_18;
        }
      }
      else
      {
        v13 = sqlite3_bind_int(a7, 4, v8);
        if (v13
          && gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          goto LABEL_18;
        }
      }
    }
  }
  return v13;
}

- (unint64_t)getAdvertisementsMatchingRPIBuffer:(const void *)a3 count:(unint64_t)a4 validityBuffer:(const void *)a5 validRPICount:(unint64_t)a6 matchingAdvertisementBuffer:(id *)a7 error:(id *)a8
{
  void *v15;
  void *v16;
  size_t v17;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v18;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *v19;
  sqlite3_stmt *v20;
  const char *v21;
  const char *v22;
  unint64_t v23;
  const char *v24;
  void *v25;
  int v26;
  NSNumber *storedAdvertisementCount;
  void *v28;
  char *v29;
  const char *v31;
  const char *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;

  -[ENAdvertisementSQLiteStore storedAdvertisementCount](self, "storedAdvertisementCount");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {

  }
  else if (!-[ENAdvertisementSQLiteStore refreshStoredAdvertismentCountWithError:](self, "refreshStoredAdvertismentCountWithError:", a8))
  {
    if (gLogCategory__ENAdvertisementSQLiteStore > 90
      || gLogCategory__ENAdvertisementSQLiteStore == -1 && !_LogCategory_Initialize())
    {
      return 0;
    }
    goto LABEL_28;
  }
  -[ENAdvertisementSQLiteStore storedAdvertisementCount](self, "storedAdvertisementCount");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "unsignedIntValue");

  v18 = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)malloc_type_calloc(v17, 0x28uLL, 0x10000400A747E1EuLL);
  if (v18)
  {
    v19 = v18;
    v20 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 3);
    v21 = (const char *)-[ENAdvertisementSQLiteStore bindRPIBuffer:count:validityBuffer:validRPICount:toSQLiteStatement:](self, "bindRPIBuffer:count:validityBuffer:validRPICount:toSQLiteStatement:", a3, a4, a5, a6, v20);
    if ((_DWORD)v21)
    {
      v22 = v21;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        v31 = sqlite3_errmsg(self->_database);
        v32 = (const char *)sqlite3_extended_errcode(self->_database);
        LogPrintF_safe();
      }
    }
    else
    {
      v22 = (const char *)-[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction");
      if (!(_DWORD)v22)
      {
        v23 = 0;
        while (1)
        {
          v24 = (const char *)sqlite3_step(v20);
          if ((_DWORD)v24 != 100)
            break;
          if (v23 < v17)
          {
            v28 = (void *)objc_opt_class();
            if (v28)
            {
              objc_msgSend(v28, "advertisementForSQLiteStatement:", v20);
            }
            else
            {
              v36 = 0;
              v34 = 0u;
              v35 = 0u;
            }
            v29 = (char *)v19 + 40 * v23++;
            *((_QWORD *)v29 + 4) = v36;
            *(_OWORD *)v29 = v34;
            *((_OWORD *)v29 + 1) = v35;
          }
          else
          {
            +[ENLoggingPrefs sharedENLoggingPrefs](ENLoggingPrefs, "sharedENLoggingPrefs");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "isSensitiveLoggingAllowed");

            if (v26
              && gLogCategory_ENAdvertisementSQLiteStore <= 90
              && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              v31 = (const char *)v17;
              LogPrintF_safe();
            }
            storedAdvertisementCount = self->_storedAdvertisementCount;
            self->_storedAdvertisementCount = 0;

          }
        }
        v22 = v24;
        if ((_DWORD)v24 == 101)
          goto LABEL_36;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          v32 = sqlite3_errmsg(self->_database);
          v33 = sqlite3_extended_errcode(self->_database);
          v31 = v22;
          LogPrintF_safe();
        }
        goto LABEL_42;
      }
    }
    if ((_DWORD)v22 == 101)
    {
      v23 = 0;
LABEL_36:
      *a7 = v19;
LABEL_45:
      -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction", v31, v32, v33);
      sqlite3_clear_bindings(v20);
      sqlite3_reset(v20);
      return v23;
    }
LABEL_42:
    free(v19);
    *a7 = 0;
    if (a8)
    {
      objc_msgSend((id)objc_opt_class(), "errorForSQLiteResult:", v22);
      v23 = 0;
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    goto LABEL_45;
  }
  if (gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
LABEL_28:
    LogPrintF_safe();
  }
  return 0;
}

- (BOOL)purgeAdvertismentsRecordedPriorToDate:(id)a3 error:(id *)a4
{
  double v6;
  double v7;
  sqlite3_stmt *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;

  objc_msgSend(a3, "timeIntervalSince1970");
  v7 = v6;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    v18 = -[NSString UTF8String](self->_databasePath, "UTF8String");
    v15 = v7;
    LogPrintF_safe();
  }
  v8 = -[ENAdvertisementSQLiteStore preparedStatementOfType:](self, "preparedStatementOfType:", 4, *(_QWORD *)&v15, v18);
  v9 = -[ENAdvertisementSQLiteStore beginDatabaseTransaction](self, "beginDatabaseTransaction");
  if (!(_DWORD)v9)
  {
    v10 = sqlite3_bind_double(v8, 1, v7);
    if (!(_DWORD)v10)
    {
      v11 = sqlite3_step(v8);
      if ((_DWORD)v11 == 101)
        goto LABEL_7;
      v9 = v11;
      if (gLogCategory__ENAdvertisementSQLiteStore <= 90
        && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
      {
        v19 = sqlite3_errmsg(self->_database);
        v21 = sqlite3_extended_errcode(self->_database);
        v16 = v9;
        LogPrintF_safe();
      }
      goto LABEL_19;
    }
    v9 = v10;
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90
      && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
    {
      v19 = sqlite3_errmsg(self->_database);
      v21 = sqlite3_extended_errcode(self->_database);
      v16 = v9;
      LogPrintF_safe();
    }
  }
  if ((_DWORD)v9 == 101)
  {
LABEL_7:
    v9 = -[ENAdvertisementSQLiteStore endDatabaseTransaction](self, "endDatabaseTransaction", v16, v19, v21);
    goto LABEL_24;
  }
LABEL_19:
  v12 = -[ENAdvertisementSQLiteStore rollbackDatabaseTransaction](self, "rollbackDatabaseTransaction", v16, v19, v21);
  if ((_DWORD)v12)
  {
    if (gLogCategory__ENAdvertisementSQLiteStore <= 90)
    {
      v13 = v12;
      if (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize())
      {
        v20 = sqlite3_errmsg(self->_database);
        v22 = sqlite3_extended_errcode(self->_database);
        v17 = v13;
        LogPrintF_safe();
      }
    }
  }
LABEL_24:
  if ((_DWORD)v9)
  {
    if (a4)
    {
      objc_msgSend((id)objc_opt_class(), "errorForSQLiteResult:", v9);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[ENAdvertisementSQLiteStore checkpointWAL](self, "checkpointWAL");
  }
  if (!-[ENAdvertisementSQLiteStore refreshStoredAdvertismentCountWithError:](self, "refreshStoredAdvertismentCountWithError:", a4, v17, v20, v22)&& gLogCategory__ENAdvertisementSQLiteStore <= 90&& (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    LogPrintF_safe();
  }
  sqlite3_reset(v8);
  return (_DWORD)v9 == 0;
}

+ (BOOL)removeAllDatabaseFilesWithDatabasePath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  char v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  int v19;
  id v20;
  BOOL v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0;
  v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v39);
  v6 = v39;
  if (v6)
    v7 = 0;
  else
    v7 = v5;
  v31 = v7;
  if ((v7 & 1) == 0
    && gLogCategory_ENAdvertisementSQLiteStore <= 90
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    v8 = objc_msgSend(objc_retainAutorelease(v3), "UTF8String");
    objc_msgSend(v6, "localizedDescription");
    v9 = v4;
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v26 = v8;
    v28 = objc_msgSend(v10, "UTF8String");
    LogPrintF_safe();

    v4 = v9;
  }
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(&unk_1E87EE200, "allKeys", v26, v28);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v13)
          objc_enumerationMutation(obj);
        v15 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v3, "stringByAppendingString:", v15, v27, v29, v30);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "fileExistsAtPath:", v16))
        {
          v17 = v3;
          v34 = v6;
          v18 = v4;
          v19 = objc_msgSend(v4, "removeItemAtPath:error:", v16, &v34);
          v20 = v34;

          if (v19)
            v21 = v20 == 0;
          else
            v21 = 0;
          if (v21)
          {
            v6 = 0;
          }
          else
          {
            if (gLogCategory_ENAdvertisementSQLiteStore <= 90
              && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
            {
              objc_msgSend(&unk_1E87EE200, "objectForKey:", v15);
              v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v32 = objc_msgSend(v22, "UTF8String");
              v23 = objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
              objc_msgSend(v20, "localizedDescription");
              v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v29 = v23;
              v30 = objc_msgSend(v24, "UTF8String");
              v27 = v32;
              LogPrintF_safe();

            }
            v31 = 0;
            v6 = v20;
          }
          v3 = v17;
          v4 = v18;
        }

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v12);
  }

  return v31 & 1;
}

- (BOOL)purgeAndRemoveFromDisk:(BOOL)a3
{
  _BOOL4 v3;
  int v5;

  v3 = a3;
  if (gLogCategory_ENAdvertisementSQLiteStore <= 50
    && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    -[NSString UTF8String](self->_databasePath, "UTF8String");
    LogPrintF_safe();
  }
  if (self->_database && _sqlite3_db_truncate())
  {
    if (gLogCategory__ENAdvertisementSQLiteStore > 90)
    {
LABEL_10:
      LOBYTE(v5) = 0;
      goto LABEL_12;
    }
    if (gLogCategory__ENAdvertisementSQLiteStore != -1 || (v5 = _LogCategory_Initialize()) != 0)
    {
      sqlite3_errmsg(self->_database);
      sqlite3_extended_errcode(self->_database);
      LogPrintF_safe();
      goto LABEL_10;
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }
LABEL_12:
  if (v3)
  {
    -[ENAdvertisementSQLiteStore disconnectFromDatabase](self, "disconnectFromDatabase");
    LOBYTE(v5) = objc_msgSend((id)objc_opt_class(), "removeAllDatabaseFilesWithDatabasePath:", self->_databasePath);
  }
  return v5;
}

- (BOOL)cloneStoreTo:(id)a3
{
  id v4;
  int v5;

  objc_msgSend(a3, "stringByAppendingPathComponent:", CFSTR("en_advertisements.db"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v4, "UTF8String");
  v5 = _sqlite3_db_copy();
  if (v5
    && gLogCategory__ENAdvertisementSQLiteStore <= 90
    && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
  {
    sqlite3_errmsg(self->_database);
    sqlite3_extended_errcode(self->_database);
    LogPrintF_safe();
  }

  return v5 == 0;
}

+ (BOOL)removeAllStoresFromDiskWithFolderPath:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t i;
  void *v10;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "storePathsInFolderPath:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    v8 = 1;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(a1, "removeAllDatabaseFilesWithDatabasePath:", v10, v12) & 1) == 0)
        {
          if (gLogCategory_ENAdvertisementSQLiteStore <= 90
            && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
          {
            v12 = objc_msgSend(objc_retainAutorelease(v10), "UTF8String");
            LogPrintF_safe();
          }
          v8 = 0;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  else
  {
    v8 = 1;
  }

  return v8 & 1;
}

+ (BOOL)removeAllTemporaryStoresFromDiskWithFolderPath:(id)a3 lastModifiedBeforeDate:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  char v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  BOOL v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id obj;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  objc_msgSend(a1, "temporaryStorePathsInFolderPath:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (!v8)
  {
    v12 = 1;
    goto LABEL_33;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v32;
  v12 = 1;
  v26 = *MEMORY[0x1E0CB2A80];
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v32 != v11)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      v30 = v10;
      objc_msgSend(v7, "attributesOfItemAtPath:error:", v14, &v30, v24, v25);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v30;

      if (v15)
        v17 = v16 == 0;
      else
        v17 = 0;
      if (!v17)
      {
        if (gLogCategory_ENAdvertisementSQLiteStore > 90
          || gLogCategory_ENAdvertisementSQLiteStore == -1 && !_LogCategory_Initialize())
        {
          v12 = 0;
          goto LABEL_29;
        }
        v18 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
        objc_msgSend(v16, "localizedDescription");
        v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v24 = v18;
        v25 = objc_msgSend(v19, "UTF8String");
        LogPrintF_safe();
LABEL_27:
        v12 = 0;
        goto LABEL_28;
      }
      objc_msgSend(v15, "objectForKey:", v26);
      v19 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "compare:", v27) == -1)
      {
        if (gLogCategory_ENAdvertisementSQLiteStore <= 40
          && (gLogCategory_ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          v24 = objc_msgSend(objc_retainAutorelease(v14), "UTF8String");
          LogPrintF_safe();
        }
        objc_msgSend(MEMORY[0x1E0CB3618], "defaultManager", v24);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = 0;
        v21 = objc_msgSend(v20, "removeItemAtPath:error:", v14, &v29);
        v16 = v29;

        if (v21 && !v16)
          goto LABEL_28;
        if (gLogCategory__ENAdvertisementSQLiteStore <= 90
          && (gLogCategory__ENAdvertisementSQLiteStore != -1 || _LogCategory_Initialize()))
        {
          objc_msgSend(v16, "localizedDescription");
          v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v24 = objc_msgSend(v22, "UTF8String");
          LogPrintF_safe();

        }
        goto LABEL_27;
      }
      v16 = 0;
LABEL_28:

LABEL_29:
      v10 = v16;

    }
    v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  }
  while (v9);

LABEL_33:
  return v12 & 1;
}

- (NSNumber)storedAdvertisementCount
{
  return self->_storedAdvertisementCount;
}

- (NSString)databasePath
{
  return self->_databasePath;
}

- (void)setDatabasePath:(id)a3
{
  objc_storeStrong((id *)&self->_databasePath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databasePath, 0);
  objc_storeStrong((id *)&self->_storedAdvertisementCount, 0);
}

@end
