@implementation ACDKeychain

+ (id)passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  void *v8;
  id v9;
  void *v10;
  id v12;

  if (a7)
    *a7 = 0;
  v12 = 0;
  objc_msgSend(a1, "_passwordForServiceName:username:accessGroup:checkInKeybag:options:error:", a3, a4, a5, 1, a6, &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v12;
  v10 = v9;
  if (a7)
    *a7 = objc_retainAutorelease(v9);

  return v8;
}

+ (id)_passwordForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 checkInKeybag:(BOOL)a6 options:(id)a7 error:(id *)a8
{
  id v14;
  id v15;
  id v16;
  __CFDictionary *Mutable;
  id v18;
  const void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  const void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  id v33;
  OSStatus v34;
  OSStatus v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  const char *v42;
  void *v43;
  ACDKeychainItem *v44;
  void *v46;
  _BOOL4 v47;
  id *v48;
  void *v49;
  id value;
  CFTypeRef result;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  id v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  _BOOL4 v63;
  _BYTE v64[128];
  uint64_t v65;

  v47 = a6;
  v65 = *MEMORY[0x24BDAC8D0];
  v14 = a3;
  v15 = a4;
  value = a5;
  v16 = a7;
  if (a8)
    *a8 = 0;
  v48 = a8;
  if (!v14 || !v15)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 125, CFSTR("Must pass service and username"));

  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  v18 = v15;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v15);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v14);
  v19 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C0], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C8], v19);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94D0], v19);
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v20 = v16;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v53;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v53 != v23)
          objc_enumerationMutation(v20);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v52 + 1) + 8 * i), (const void *)objc_msgSend(v20, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i)));
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v52, v64, 16);
    }
    while (v22);
  }

  if (v47)
    v25 = v19;
  else
    v25 = (const void *)*MEMORY[0x24BDBD268];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9528], v25);
  if (value)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], value);
  v26 = v14;
  v27 = objc_msgSend(a1, "_syncStateForKeychainDictionary:", v20);
  objc_msgSend(a1, "cache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v18;
  objc_msgSend(v28, "dataForService:username:syncState:", v26, v18, v27);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (v32)
    {
      if (v48)
      {
        objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], -25300, 0);
        v33 = 0;
        *v48 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v33 = 0;
      }
    }
    else
    {
      v33 = v30;
    }
    _ACDKeychainLogSystem();
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      goto LABEL_39;
    *(_DWORD *)buf = 134218754;
    v57 = v27;
    v58 = 2112;
    v59 = v26;
    v60 = 2112;
    v61 = v18;
    v62 = 1024;
    v63 = v33 != 0;
    v42 = "ACDKeychainCache(syncState:%ld) hit for %@.%@: itemExist:%d";
    goto LABEL_43;
  }
  result = 0;
  v34 = SecItemCopyMatching(Mutable, &result);
  v35 = v34;
  if (v34 || (v36 = (void *)result) == 0)
  {
    if (v34 == -25300)
    {
      objc_msgSend(a1, "cache");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "cacheData:forService:username:syncState:", v40, v26, v18, v27);

    }
    if (v48)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v35, 0);
      v33 = 0;
      *v48 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v33 = 0;
    }
  }
  else
  {
    objc_msgSend((id)result, "objectForKeyedSubscript:", *MEMORY[0x24BDE9550]);
    v37 = objc_claimAutoreleasedReturnValue();
    v49 = (void *)v37;
    if (v37)
    {
      v33 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDB4420]), "initWithData:encoding:", v37, 4);
      objc_msgSend(a1, "cache");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "cacheData:forService:username:syncState:", v33, v26, v29, v27);

    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v36, "objectForKeyedSubscript:", *MEMORY[0x24BDE9558]);
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    if (v43)
    {
      v44 = -[ACDKeychainItem initWithPersistentRef:properties:]([ACDKeychainItem alloc], "initWithPersistentRef:properties:", v43, v36);
      objc_msgSend(a1, "_migrateKeychainItemIfNecessary:", v44);

    }
  }
  _ACDKeychainLogSystem();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    v57 = v27;
    v58 = 2112;
    v59 = v26;
    v60 = 2112;
    v61 = v29;
    v62 = 1024;
    v63 = v33 != 0;
    v42 = "ACDKeychainCache(syncState:%ld) miss for %@.%@: itemExist:%d";
LABEL_43:
    _os_log_debug_impl(&dword_20D8CB000, v41, OS_LOG_TYPE_DEBUG, v42, buf, 0x26u);
  }
LABEL_39:

  if (Mutable)
    CFRelease(Mutable);

  return v33;
}

+ (id)cache
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __20__ACDKeychain_cache__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (cache_onceToken != -1)
    dispatch_once(&cache_onceToken, block);
  return (id)cache__keychainCache;
}

+ (unint64_t)_syncStateForKeychainDictionary:(id)a3
{
  void *v3;
  unint64_t v4;

  objc_msgSend(a3, "objectForKey:", *MEMORY[0x24BDE9140]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    goto LABEL_8;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE9148]) & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v3, "BOOLValue") & 1) != 0)
    {
      v4 = 1;
      goto LABEL_9;
    }
LABEL_8:
    v4 = 0;
    goto LABEL_9;
  }
  v4 = 2;
LABEL_9:

  return v4;
}

+ (BOOL)canAccessPasswordsWithPolicy:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE8F68]))
  {
    v4 = MKBDeviceUnlockedSinceBoot() != 0;
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BDE8F98]))
  {
    v4 = MKBGetDeviceLockState() == 0;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

+ (void)_migrateKeychainItemIfNecessary:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "hasCustomAccessControl"))
  {
    _ACDKeychainLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ACDKeychain _migrateKeychainItemIfNecessary:].cold.1();
LABEL_11:

    goto LABEL_12;
  }
  if (objc_msgSend(a1, "_isKnownMigratedKeychainItem:", v4))
  {
    _ACDKeychainLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ACDKeychain _migrateKeychainItemIfNecessary:].cold.2();
    goto LABEL_11;
  }
  +[ACDKeychainMigrator sharedInstance](ACDKeychainMigrator, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "migrateKeychainItem:toKeybag:", v4, 0);

  if ((v7 & 1) == 0)
  {
    _ACDKeychainLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[ACDKeychain _migrateKeychainItemIfNecessary:].cold.3();
    goto LABEL_11;
  }
  objc_msgSend(a1, "_addKnownMigratedKeychainItem:", v4);
LABEL_12:

}

+ (BOOL)_isKnownMigratedKeychainItem:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_msgSend(v4, "persistentRef");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = a1;
    objc_sync_enter(v6);
    objc_msgSend(v6, "_knownMigratedKeychainItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v5);

    objc_sync_exit(v6);
  }
  else
  {
    v8 = 1;
  }

  return v8;
}

+ (id)_knownMigratedKeychainItems
{
  if (_knownMigratedKeychainItems_onceToken != -1)
    dispatch_once(&_knownMigratedKeychainItems_onceToken, &__block_literal_global_9);
  return (id)_knownMigratedKeychainItems_migratedKeychainItems;
}

void __20__ACDKeychain_cache__block_invoke(uint64_t a1)
{
  ACDKeychainCache *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  int out_token;

  v2 = -[ACDKeychainCache initWithValidityDuration:]([ACDKeychainCache alloc], "initWithValidityDuration:", 30);
  v3 = (void *)cache__keychainCache;
  cache__keychainCache = (uint64_t)v2;

  out_token = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __20__ACDKeychain_cache__block_invoke_2;
  v12[3] = &__block_descriptor_40_e8_v12__0i8l;
  v12[4] = *(_QWORD *)(a1 + 32);
  notify_register_dispatch("com.apple.security.keychainchanged", &out_token, MEMORY[0x24BDAC9B8], v12);
  _ACDKeychainLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __20__ACDKeychain_cache__block_invoke_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);

}

void __20__ACDKeychain_cache__block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  _ACDKeychainLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __20__ACDKeychain_cache__block_invoke_2_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);

  objc_msgSend(*(id *)(a1 + 32), "cache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "clearCacheForSyncState:", 1);

}

+ (void)updateItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 options:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  const __CFDictionary *v18;
  id v19;
  __CFDictionary *Mutable;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  OSStatus v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  const __CFDictionary *attributesToUpdate;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  id v45;
  __int16 v46;
  id v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (const __CFDictionary *)a6;
  v19 = a7;
  if (v15 && v16)
  {
    if (!a8)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 206, CFSTR("Must pass service and username"));

  if (a8)
LABEL_4:
    *a8 = 0;
LABEL_5:
  attributesToUpdate = v18;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v15);
  if (v17)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v17);
  v37 = v17;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v39 != v24)
          objc_enumerationMutation(v21);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v38 + 1) + 8 * i), (const void *)objc_msgSend(v21, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i), attributesToUpdate));
      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
    }
    while (v23);
  }

  objc_msgSend(a1, "cache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clearDataForService:username:syncState:", v15, v16, 2);

  v27 = SecItemUpdate(Mutable, attributesToUpdate);
  objc_msgSend(a1, "cache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "clearDataForService:username:syncState:", v15, v16, 2);

  if (v27)
  {
    v29 = v37;
    if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v27, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    -[__CFDictionary objectForKeyedSubscript:](attributesToUpdate, "objectForKeyedSubscript:", *MEMORY[0x24BDE9550]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(a1, "_syncStateForKeychainDictionary:", v21);
    v29 = v37;
    if (v30)
    {
      v32 = objc_msgSend(objc_alloc(MEMORY[0x24BDB4420]), "initWithData:encoding:", v30, 4);
      objc_msgSend(a1, "cache");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "cacheData:forService:username:syncState:", v32, v15, v16, v31);

      _ACDKeychainLogSystem();
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v43 = v31;
        v44 = 2112;
        v45 = v15;
        v46 = 2112;
        v47 = v16;
        _os_log_debug_impl(&dword_20D8CB000, v34, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) update for %@.%@", buf, 0x20u);
      }

    }
    else
    {
      _ACDKeychainLogSystem();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218498;
        v43 = v31;
        v44 = 2112;
        v45 = v15;
        v46 = 2112;
        v47 = v16;
        _os_log_debug_impl(&dword_20D8CB000, v32, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) update for %@.%@ has no data, ignoring", buf, 0x20u);
      }
    }

  }
  CFRelease(Mutable);

}

+ (void)addItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 passwordData:(id)a6 options:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  __CFDictionary *Mutable;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  OSStatus v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  id v36;
  id v37;
  CFTypeRef result;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  id v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  if (v15 && v16)
  {
    if (!a8)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 255, CFSTR("Must pass service and username"));

  if (a8)
LABEL_4:
    *a8 = 0;
LABEL_5:
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v15);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9528], (const void *)*MEMORY[0x24BDBD270]);
  if (v17)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v17);
  v37 = v17;
  v36 = v18;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9550], v18);
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = v19;
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v40;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v40 != v24)
          objc_enumerationMutation(v21);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v39 + 1) + 8 * v25), (const void *)objc_msgSend(v21, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v25)));
        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
    }
    while (v23);
  }

  objc_msgSend(a1, "cache");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "clearDataForService:username:syncState:", v15, v16, 2);

  result = 0;
  v27 = SecItemAdd(Mutable, &result);
  objc_msgSend(a1, "cache");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "clearDataForService:username:syncState:", v15, v16, 2);

  if (v27)
  {
    v30 = v36;
    v29 = v37;
    if (a8)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v27, 0);
      *a8 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v31 = objc_msgSend(a1, "_syncStateForKeychainDictionary:", v21);
    v30 = v36;
    v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDB4420]), "initWithData:encoding:", v36, 4);
    objc_msgSend(a1, "cache");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cacheData:forService:username:syncState:", v32, v15, v16, v31);

    _ACDKeychainLogSystem();
    v34 = objc_claimAutoreleasedReturnValue();
    v29 = v37;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v44 = v31;
      v45 = 2112;
      v46 = v15;
      v47 = 2112;
      v48 = v16;
      _os_log_debug_impl(&dword_20D8CB000, v34, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) add for %@.%@", buf, 0x20u);
    }

  }
  CFRelease(Mutable);

}

+ (BOOL)addSyncItemWithServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 extension:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  __CFDictionary *Mutable;
  const void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  OSStatus v29;
  OSStatus v30;
  void *v32;
  void *v33;
  void *v34;
  CFTypeRef result;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = v19;
  if (v15 && v16 && v19)
  {
    if (!a8)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 301, CFSTR("Must pass service and username"));

  if (a8)
LABEL_5:
    *a8 = 0;
LABEL_6:
  v34 = v15;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  v33 = v16;
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v21);
  v23 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9008], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9528], v23);
  if (v17)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v17);
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v24 = v18;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v37;
    do
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v37 != v27)
          objc_enumerationMutation(v24);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v36 + 1) + 8 * i), (const void *)objc_msgSend(v24, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i)));
      }
      v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v26);
  }

  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9140], v23);
  result = 0;
  v29 = SecItemAdd(Mutable, &result);
  v30 = v29;
  if (a8 && v29)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v29, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(Mutable);

  return v30 == 0;
}

+ (BOOL)updateSyncItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 newValues:(id)a6 extension:(id)a7 error:(id *)a8
{
  id v15;
  id v16;
  id v17;
  const __CFDictionary *v18;
  id v19;
  void *v20;
  void *v21;
  const __CFAllocator *v22;
  __CFDictionary *Mutable;
  const void *v24;
  __CFDictionary *MutableCopy;
  OSStatus v26;
  OSStatus v27;
  void *v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = (const __CFDictionary *)a6;
  v19 = a7;
  v20 = v19;
  if (v15 && v16 && v19)
  {
    if (!a8)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 338, CFSTR("Must pass service and username"));

  if (a8)
LABEL_5:
    *a8 = 0;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v15, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v16);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v21);
  v24 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9140], (const void *)*MEMORY[0x24BDBD270]);
  if (v17)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v17);
  MutableCopy = CFDictionaryCreateMutableCopy(v22, 0, v18);
  CFDictionaryAddValue(MutableCopy, (const void *)*MEMORY[0x24BDE9008], v24);
  v26 = SecItemUpdate(Mutable, MutableCopy);
  v27 = v26;
  if (a8 && v26)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v26, 0);
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(MutableCopy);
  CFRelease(Mutable);

  return v27 == 0;
}

+ (BOOL)removeItemForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 options:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  __CFDictionary *Mutable;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  BOOL v32;
  BOOL v33;
  void *v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  uint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  if (v13 && v14)
  {
    if (!a7)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 372, CFSTR("Must pass service and username"));

  if (a7)
LABEL_4:
    *a7 = 0;
LABEL_5:
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  if (objc_msgSend(v14, "length"))
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v14);
  if (objc_msgSend(v13, "length"))
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v13);
  if (v15)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v15);
  v36 = v15;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v38 != v21)
          objc_enumerationMutation(v18);
        CFDictionaryAddValue(Mutable, *(const void **)(*((_QWORD *)&v37 + 1) + 8 * i), (const void *)objc_msgSend(v18, "valueForKey:", *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i)));
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v37, v47, 16);
    }
    while (v20);
  }

  objc_msgSend(a1, "cache");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "clearDataForService:username:syncState:", v13, v14, 2);

  v24 = SecItemDelete(Mutable);
  objc_msgSend(a1, "cache");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clearDataForService:username:syncState:", v13, v14, 2);

  _ACDKeychainLogSystem();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    +[ACDKeychain removeItemForServiceName:username:accessGroup:options:error:].cold.1((uint64_t)Mutable, v24, v26);

  if ((_DWORD)v24 != -25300 && (_DWORD)v24)
  {
    v31 = v36;
    if (a7)
    {
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], (int)v24, 0);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v27 = objc_msgSend(a1, "_syncStateForKeychainDictionary:", v18);
    objc_msgSend(a1, "cache");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "cacheData:forService:username:syncState:", v29, v13, v14, v27);

    _ACDKeychainLogSystem();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      v42 = v27;
      v43 = 2112;
      v44 = v13;
      v45 = 2112;
      v46 = v14;
      _os_log_debug_impl(&dword_20D8CB000, v30, OS_LOG_TYPE_DEBUG, "ACDKeychainCache(syncState:%ld) delete for %@.%@", buf, 0x20u);
    }

    v31 = v36;
  }
  if ((_DWORD)v24)
    v32 = (_DWORD)v24 == -25300;
  else
    v32 = 1;
  v33 = v32;
  CFRelease(Mutable);

  return v33;
}

+ (BOOL)removeTombstoneForServiceName:(id)a3 username:(id)a4 accessGroup:(id)a5 extension:(id)a6 error:(id *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  __CFDictionary *Mutable;
  OSStatus v20;
  OSStatus v21;
  void *v23;
  CFTypeRef result;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = v16;
  if (v13 && v14 && v16)
  {
    if (!a7)
      goto LABEL_6;
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("ACDKeychain.m"), 420, CFSTR("Must pass service and username"));

  if (a7)
LABEL_5:
    *a7 = 0;
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@"), v13, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8FA8], v14);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9128], v18);
  if (v15)
    CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE8F50], v15);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9140], (const void *)*MEMORY[0x24BDBD270]);
  result = 0;
  v20 = SecItemAdd(Mutable, &result);
  v21 = v20;
  if (a7 && v20)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDB4208], v20, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }
  CFRelease(Mutable);

  return v21 == 0;
}

+ (id)keychainDeletedAccounts
{
  __CFDictionary *Mutable;
  const void *v3;
  void *v4;
  NSObject *v5;
  CFTypeRef result;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD2A8], MEMORY[0x24BDBD6B0]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9220], (const void *)*MEMORY[0x24BDE9230]);
  v3 = (const void *)*MEMORY[0x24BDBD270];
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94C0], (const void *)*MEMORY[0x24BDBD270]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE94D8], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE93B0], (const void *)*MEMORY[0x24BDE93B8]);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9140], v3);
  CFDictionaryAddValue(Mutable, (const void *)*MEMORY[0x24BDE9180], v3);
  result = 0;
  if (SecItemCopyMatching(Mutable, &result) || !result)
  {
    CFRelease(Mutable);
    v4 = 0;
  }
  else
  {
    v4 = (id)result;
    CFRelease(result);
    CFRelease(Mutable);
    _ACDKeychainLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      +[ACDKeychain keychainDeletedAccounts].cold.1();

  }
  return v4;
}

void __42__ACDKeychain__knownMigratedKeychainItems__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v1 = (void *)_knownMigratedKeychainItems_migratedKeychainItems;
  _knownMigratedKeychainItems_migratedKeychainItems = (uint64_t)v0;

}

+ (void)_addKnownMigratedKeychainItem:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "persistentRef");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = a1;
    objc_sync_enter(v5);
    objc_msgSend(v5, "_knownMigratedKeychainItems");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v4);

    objc_sync_exit(v5);
  }

}

void __20__ACDKeychain_cache__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "ACDKeychain created cache", a5, a6, a7, a8, 0);
}

void __20__ACDKeychain_cache__block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10(&dword_20D8CB000, a1, a3, "ACDKeychain received com.apple.security.keychainchanged notification, clearing synced item cache", a5, a6, a7, a8, 0);
}

+ (void)removeItemForServiceName:(NSObject *)a3 username:accessGroup:options:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = a1;
  v8 = 2112;
  v9 = v5;
  _os_log_debug_impl(&dword_20D8CB000, a3, OS_LOG_TYPE_DEBUG, "Keychain query - %@ with result - %@", (uint8_t *)&v6, 0x16u);

}

+ (void)keychainDeletedAccounts
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Account Sync - Found Tombstones %@ ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_migrateKeychainItemIfNecessary:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Keychain item (%@) has custom access control, skipping...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_migrateKeychainItemIfNecessary:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2_0(&dword_20D8CB000, v0, v1, "Keychain item (%@) known to be migrated, skipping...", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)_migrateKeychainItemIfNecessary:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_8();
  _os_log_error_impl(&dword_20D8CB000, v0, OS_LOG_TYPE_ERROR, "Failed to migrate keychain item %@.", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
