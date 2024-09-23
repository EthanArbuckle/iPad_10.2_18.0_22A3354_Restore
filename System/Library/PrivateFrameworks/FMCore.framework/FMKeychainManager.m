@implementation FMKeychainManager

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__FMKeychainManager_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_pred != -1)
    dispatch_once(&sharedInstance_pred, block);
  return (id)sharedInstance__sharedInstance;
}

void __35__FMKeychainManager_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (BOOL)deleteDataForAccount:(id)a3 service:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CD6B58]);

  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD68F8]);
  LOBYTE(v8) = -[FMKeychainManager _delete:](self, "_delete:", v9) == 0;

  return (char)v8;
}

- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8
{
  id v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v28;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CD6B58];
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CD6B58]);
  v18 = *MEMORY[0x1E0CD68F8];
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CD68F8]);
  v19 = *MEMORY[0x1E0CD70D8];
  v28 = v13;
  objc_msgSend(v16, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CD70D8]);
  if (a6 != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a6 == 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0CD6B80]);

  }
  if (a8 != 2)
  {
    -[FMKeychainManager _accessibilityForDataProtectionClass:migratable:](self, "_accessibilityForDataProtectionClass:migratable:", a7, a8 == 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
      objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, *MEMORY[0x1E0CD68A0]);

  }
  v22 = -[FMKeychainManager _add:](self, "_add:", v16, a7);
  if (v22 == -25299)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v16, "mutableCopy");
    objc_msgSend(v24, "removeObjectForKey:", *MEMORY[0x1E0CD6C98]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v15, v17);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, v18);
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v28, v19);
    v25 = (void *)objc_opt_new();
    objc_msgSend(v24, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CD69B0]);

    v22 = -[FMKeychainManager _updateWithQuery:attributes:](self, "_updateWithQuery:attributes:", v23, v24);
  }

  return v22 == 0;
}

- (BOOL)setData:(id)a3 forAccount:(id)a4 service:(id)a5
{
  return -[FMKeychainManager setData:forAccount:service:synchronizable:dataProtectionClass:migratable:](self, "setData:forAccount:service:synchronizable:dataProtectionClass:migratable:", a3, a4, a5, 2, 0, 2);
}

- (id)dataForAccount:(id)a3 service:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v16 = 0;
  -[FMKeychainManager itemForAccount:service:error:](self, "itemForAccount:service:error:", v6, v7, &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v16;
  objc_msgSend(v8, "rawData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    LogCategory_Unspecified();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v18 = v6;
      v19 = 2112;
      v20 = v7;
      v21 = 2112;
      v22 = v9;
      _os_log_error_impl(&dword_1C9967000, v11, OS_LOG_TYPE_ERROR, "dataForAccount a: %@, s: %@ error: %@", buf, 0x20u);
    }
LABEL_11:

    v14 = 0;
    goto LABEL_12;
  }
  v12 = (void *)objc_opt_new();

  LogCategory_Unspecified();
  v13 = objc_claimAutoreleasedReturnValue();
  v11 = v13;
  if (!v10 || v10 == v12)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[FMKeychainManager dataForAccount:service:].cold.1((uint64_t)v6, (uint64_t)v7, v11);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v18 = v6;
    v19 = 2112;
    v20 = v7;
    _os_log_impl(&dword_1C9967000, v11, OS_LOG_TYPE_DEFAULT, "dataForAccount a: %@, s: %@.", buf, 0x16u);
  }

  v14 = v10;
LABEL_12:

  return v14;
}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a5;
  v9 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[FMKeychainManager setData:forAccount:service:](self, "setData:forAccount:service:", v10, v9, v8);

  return (char)self;
}

- (BOOL)setPassword:(id)a3 forAccount:(id)a4 service:(id)a5 synchronizable:(int64_t)a6 dataProtectionClass:(int64_t)a7 migratable:(int64_t)a8
{
  id v14;
  id v15;
  void *v16;

  v14 = a5;
  v15 = a4;
  objc_msgSend(a3, "dataUsingEncoding:", 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a8) = -[FMKeychainManager setData:forAccount:service:synchronizable:dataProtectionClass:migratable:](self, "setData:forAccount:service:synchronizable:dataProtectionClass:migratable:", v16, v15, v14, a6, a7, a8);

  return a8;
}

- (id)passwordForAccount:(id)a3 service:(id)a4
{
  void *v4;
  void *v5;

  -[FMKeychainManager itemForAccount:service:error:](self, "itemForAccount:service:error:", a3, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)itemForAccount:(id)a3 service:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  FMInternalKeychainItem *v12;

  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CD6B58]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CD68F8]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F40], *MEMORY[0x1E0CD6F30]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CD7018]);
  -[FMKeychainManager _query:error:](self, "_query:error:", v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v12 = -[FMInternalKeychainItem initWithResults:]([FMInternalKeychainItem alloc], "initWithResults:", v11);
    -[FMKeychainManager _migrateToValueDataIfNeeded:account:service:](self, "_migrateToValueDataIfNeeded:account:service:", v11, v8, v9);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)allServices
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMKeychainManager _query:error:](self, "_query:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    v9 = *MEMORY[0x1E0CD6B58];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10), "objectForKeyedSubscript:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v11);

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  objc_msgSend(v3, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)allAccountsForService:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0CD6B58]);
  -[FMKeychainManager _query:error:](self, "_query:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    v11 = *MEMORY[0x1E0CD68F8];
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v9 != v12);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }
  objc_msgSend(v5, "allObjects");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)allRecords
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FMKeychainManager _query:error:](self, "_query:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int)_add:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  OSStatus v6;
  int v7;
  NSObject *v8;

  v3 = a3;
  v4 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], v4);
  v6 = SecItemAdd((CFDictionaryRef)v3, 0);
  v7 = v6;
  if (v6 != -25299 && v6)
  {
    LogCategory_Unspecified();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[FMKeychainManager _add:].cold.1();

  }
  return v7;
}

- (int)_updateWithQuery:(id)a3 attributes:(id)a4
{
  id v5;
  const __CFDictionary *v6;
  uint64_t v7;
  void *v8;
  OSStatus v9;
  NSObject *v10;

  v5 = a3;
  v6 = (const __CFDictionary *)a4;
  v7 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], v7);
  v9 = SecItemUpdate((CFDictionaryRef)v5, v6);
  if (v9)
  {
    LogCategory_Unspecified();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[FMKeychainManager _updateWithQuery:attributes:].cold.1();

  }
  return v9;
}

- (int)_delete:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  OSStatus v6;
  int v7;
  NSObject *v8;

  v3 = a3;
  v4 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], v4);
  v6 = SecItemDelete((CFDictionaryRef)v3);
  v7 = v6;
  if (v6)
  {
    if (v6 == -25300)
    {
      LogCategory_Unspecified();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FMKeychainManager _delete:].cold.2(v8);
    }
    else
    {
      LogCategory_Unspecified();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[FMKeychainManager _delete:].cold.1();
    }

  }
  return v7;
}

- (id)_query:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  OSStatus v12;
  void *v13;
  uint64_t v14;
  _BOOL8 v15;
  void *v16;
  void *v17;
  id *v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v19 = 0;
  v6 = *MEMORY[0x1E0CD6C98];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6C98]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6CA8], v6);
  v8 = *MEMORY[0x1E0CD6F30];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD6F30]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CD6F38], v8);
  v10 = *MEMORY[0x1E0CD7010];
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CD7010]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    objc_msgSend(v5, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], v10);
  v12 = SecItemCopyMatching((CFDictionaryRef)v5, (CFTypeRef *)&v19);
  if (v12)
  {
    if (a4)
    {
      v13 = (void *)MEMORY[0x1E0CB35C8];
      v14 = *MEMORY[0x1E0D201F0];
      v15 = v12 != -25300;
      v20 = *MEMORY[0x1E0CB3388];
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], v12, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v21[0] = v16;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v15, v17);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

      a4 = 0;
    }
  }
  else
  {
    a4 = v19;
  }

  return a4;
}

- (id)_accessibilityForDataProtectionClass:(int64_t)a3 migratable:(BOOL)a4
{
  id **v4;

  if ((unint64_t)(a3 - 1) > 5)
    return 0;
  v4 = (id **)&unk_1E82AAC58;
  if (!a4)
    v4 = (id **)&unk_1E82AAC88;
  return *v4[a3 - 1];
}

- (void)_migrateToValueDataIfNeeded:(id)a3 account:(id)a4 service:(id)a5
{
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  const char *v28;
  void *v29;
  int v30;
  _BOOL4 v31;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  _BYTE v40[10];
  __int16 v41;
  int v42;
  __int16 v43;
  _BOOL4 v44;
  __int16 v45;
  _BOOL4 v46;
  __int16 v47;
  int v48;
  __int16 v49;
  _BOOL4 v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  v33 = a5;
  v7 = *MEMORY[0x1E0CD69B0];
  v8 = a3;
  objc_msgSend(v8, "objectForKeyedSubscript:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0CD70D8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0CD70D8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_new();
  v13 = objc_msgSend(v9, "isEqualToData:", v12);

  v14 = objc_msgSend(v9, "length");
  v15 = v14;
  v16 = v13 ^ 1;
  if (v9)
    v17 = v13 ^ 1;
  else
    v17 = 0;
  if (v14)
    v18 = v17;
  else
    v18 = 0;
  v19 = (void *)objc_opt_new();
  v20 = objc_msgSend(v11, "isEqualToData:", v19);

  if (!v11)
  {
    if (!v18)
      goto LABEL_17;
LABEL_13:
    v21 = objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v9, v10);
    v29 = (void *)objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v29, v7);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CD6B58]);
    v25 = v34;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CD68F8]);
    v30 = -[FMKeychainManager _updateWithQuery:attributes:](self, "_updateWithQuery:attributes:", v23, v21);
    LogCategory_Unspecified();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v36 = (id)v30;
      v37 = 2112;
      v38 = v34;
      v39 = 2112;
      *(_QWORD *)v40 = v33;
      v28 = "Migration of keychain item result: %ld, a: %@, s: %@";
      goto LABEL_15;
    }
LABEL_16:

    goto LABEL_20;
  }
  if ((v20 & v18 & 1) != 0)
    goto LABEL_13;
  if (v18)
  {
    v21 = objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v11, v10);
    v22 = (void *)objc_opt_new();
    -[NSObject setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v22, v7);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v33;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, *MEMORY[0x1E0CD6B58]);
    v25 = v34;
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *MEMORY[0x1E0CD68F8]);
    v26 = -[FMKeychainManager _updateWithQuery:attributes:](self, "_updateWithQuery:attributes:", v23, v21);
    LogCategory_Unspecified();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v36 = (id)v26;
      v37 = 2112;
      v38 = v34;
      v39 = 2112;
      *(_QWORD *)v40 = v33;
      v28 = "Removing any remaining generic attribute of keychain item result: %ld, a: %@, s: %@";
LABEL_15:
      _os_log_impl(&dword_1C9967000, v27, OS_LOG_TYPE_DEFAULT, v28, buf, 0x20u);
      goto LABEL_16;
    }
    goto LABEL_16;
  }
LABEL_17:
  LogCategory_Unspecified();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138414338;
    v31 = v15 != 0;
    v24 = v33;
    v25 = v34;
    v36 = v34;
    v37 = 2112;
    v38 = v33;
    v39 = 1024;
    *(_DWORD *)v40 = v9 != 0;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v16;
    v41 = 1024;
    v42 = *(_DWORD *)v40;
    v43 = 1024;
    v44 = v31;
    v45 = 1024;
    v46 = v11 == 0;
    v47 = 1024;
    v48 = v20;
    v49 = 1024;
    v50 = v46;
    _os_log_impl(&dword_1C9967000, v21, OS_LOG_TYPE_INFO, "No migration of keychain item required. a: %@, s: %@. notNil: %i, notNewData: %i, notNull: %i, greaterThanZero: %i, dataIsNil: %i, dataIsNewData: %i, dataIsNull: %i.", buf, 0x40u);
  }
  else
  {
    v24 = v33;
    v25 = v34;
  }
LABEL_20:

}

- (void)dataForAccount:(os_log_t)log service:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
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
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "dataForAccount is empty a: %@, s: %@!", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1_1();
}

- (void)_add:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, v0, v1, "SecItemAdd error: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_updateWithQuery:attributes:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, v0, v1, "SecItemUpdate error: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_delete:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1C9967000, v0, v1, "SecItemDelete error: %ld", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_delete:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9967000, log, OS_LOG_TYPE_ERROR, "SecItemDelete error: The specified item could not be found in the keychain", v1, 2u);
}

@end
