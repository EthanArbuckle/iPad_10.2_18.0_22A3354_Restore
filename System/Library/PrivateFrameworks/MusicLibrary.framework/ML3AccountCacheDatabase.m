@implementation ML3AccountCacheDatabase

- (ML3AccountCacheDatabase)initWithLibrary:(id)a3
{
  id v5;
  ML3AccountCacheDatabase *v6;
  uint64_t v7;
  NSMutableDictionary *propertiesCache;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *accessQueue;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ML3AccountCacheDatabase;
  v6 = -[ML3AccountCacheDatabase init](&v13, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    propertiesCache = v6->_propertiesCache;
    v6->_propertiesCache = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_library, a3);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = dispatch_queue_create("com.apple.medialibrary.ML3AccountCacheDatabase.operationQueue.accessQueue", v9);
    accessQueue = v6->accessQueue;
    v6->accessQueue = (OS_dispatch_queue *)v10;

  }
  return v6;
}

- (BOOL)setAppleID:(id)a3 forDSID:(unint64_t)a4
{
  return -[ML3AccountCacheDatabase setAppleID:altDSID:forDSID:](self, "setAppleID:altDSID:forDSID:", a3, 0, a4);
}

- (BOOL)setAppleID:(id)a3 altDSID:(id)a4 forDSID:(unint64_t)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  ML3MusicLibrary *library;
  BOOL v22;
  void *v24;
  _QWORD v25[4];
  id v26;
  ML3AccountCacheDatabase *v27;
  uint64_t *v28;
  uint64_t *v29;
  uint64_t *v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t (*v48)(uint64_t, uint64_t);
  void (*v49)(uint64_t);
  id v50;
  uint8_t buf[4];
  ML3AccountCacheDatabase *v52;
  __int16 v53;
  unint64_t v54;
  __int16 v55;
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ML3AccountCacheDatabase.m"), 65, CFSTR("appleID cannot be nil"));

  }
  v45 = 0;
  v46 = &v45;
  v47 = 0x3032000000;
  v48 = __Block_byref_object_copy__19913;
  v49 = __Block_byref_object_dispose__19914;
  v50 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__19913;
  v43 = __Block_byref_object_dispose__19914;
  v11 = v10;
  v44 = v11;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__19913;
  v37 = __Block_byref_object_dispose__19914;
  -[ML3AccountCacheDatabase _cacheEntryForDSID:](self, "_cacheEntryForDSID:", a5);
  v38 = (id)objc_claimAutoreleasedReturnValue();
  v12 = (void *)v34[5];
  if (!v12
    || (objc_msgSend(v12, "appleID"), (v13 = (void *)objc_claimAutoreleasedReturnValue()) == 0)
    || (objc_msgSend((id)v34[5], "appleID"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", v9),
        v14,
        v13,
        (v15 & 1) == 0))
  {
    if (!v40[5])
    {
      +[ML3AccountStore defaultStore](ML3AccountStore, "defaultStore");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v16, "altDSIDForAccountWithDSID:options:error:", a5, 1, &v32);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v32;
      v19 = (void *)v40[5];
      v40[5] = v17;

      if (v18)
      {
        v20 = os_log_create("com.apple.amp.medialibrary", "Default");
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543874;
          v52 = self;
          v53 = 2048;
          v54 = a5;
          v55 = 2114;
          v56 = v18;
          _os_log_impl(&dword_1AC149000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to resolve altDSID for DSID %lld. err=%{public}@", buf, 0x20u);
        }

      }
    }
    library = self->_library;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __54__ML3AccountCacheDatabase_setAppleID_altDSID_forDSID___block_invoke;
    v25[3] = &unk_1E5B655B0;
    v31 = a5;
    v26 = v9;
    v27 = self;
    v28 = &v39;
    v29 = &v45;
    v30 = &v33;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 1, v25);

  }
  v22 = v46[5] == 0;
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  _Block_object_dispose(&v45, 8);

  return v22;
}

- (id)appleIDForDSID:(unint64_t)a3
{
  id v4;

  v4 = 0;
  -[ML3AccountCacheDatabase getPropertiesForDSID:appleID:altDSID:](self, "getPropertiesForDSID:appleID:altDSID:", a3, &v4, 0);
  return v4;
}

- (BOOL)getPropertiesForDSID:(unint64_t)a3 appleID:(id *)a4 altDSID:(id *)a5
{
  void *v7;
  void *v8;

  -[ML3AccountCacheDatabase _cacheEntryForDSID:](self, "_cacheEntryForDSID:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a4)
    {
      objc_msgSend(v7, "appleID");
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    if (a5)
    {
      objc_msgSend(v8, "altDSID");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v8 != 0;
}

- (id)_cacheEntryForDSID:(unint64_t)a3
{
  NSObject *accessQueue;
  uint64_t v6;
  void *v7;
  ML3MusicLibrary *library;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  ML3MusicLibrary *v14;
  ML3AccountCacheEntry *v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD v20[7];
  id v21;
  _QWORD v22[9];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  _QWORD block[7];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  uint8_t buf[4];
  ML3AccountCacheDatabase *v49;
  __int16 v50;
  unint64_t v51;
  __int16 v52;
  id v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__19913;
  v46 = __Block_byref_object_dispose__19914;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__19913;
  v40 = __Block_byref_object_dispose__19914;
  v41 = 0;
  accessQueue = self->accessQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke;
  block[3] = &unk_1E5B655D8;
  block[4] = self;
  block[5] = &v42;
  block[6] = a3;
  dispatch_sync(accessQueue, block);
  v7 = (void *)v43[5];
  if (!v7)
  {
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__19913;
    v33 = __Block_byref_object_dispose__19914;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__19913;
    v27 = __Block_byref_object_dispose__19914;
    v28 = 0;
    library = self->_library;
    v22[0] = v6;
    v22[1] = 3221225472;
    v22[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_2;
    v22[3] = &unk_1E5B65628;
    v22[7] = &v23;
    v22[8] = a3;
    v22[4] = self;
    v22[5] = &v36;
    v22[6] = &v29;
    -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](library, "databaseConnectionAllowingWrites:withBlock:", 0, v22);
    if (!v37[5])
    {
      if (objc_msgSend((id)v30[5], "length") && !objc_msgSend((id)v24[5], "length"))
      {
        +[ML3AccountStore defaultStore](ML3AccountStore, "defaultStore");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 0;
        objc_msgSend(v9, "altDSIDForAccountWithDSID:options:error:", a3, 1, &v21);
        v10 = objc_claimAutoreleasedReturnValue();
        v11 = v21;
        v12 = (void *)v24[5];
        v24[5] = v10;

        if (v11)
        {
          v13 = os_log_create("com.apple.amp.medialibrary", "Default");
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543874;
            v49 = self;
            v50 = 2048;
            v51 = a3;
            v52 = 2114;
            v53 = v11;
            _os_log_impl(&dword_1AC149000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to resolve altDSID for DSID %lld. err=%{public}@", buf, 0x20u);
          }

        }
        v14 = self->_library;
        v20[0] = v6;
        v20[1] = 3221225472;
        v20[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_37;
        v20[3] = &unk_1E5B65650;
        v20[5] = &v23;
        v20[6] = a3;
        v20[4] = self;
        -[ML3MusicLibrary databaseConnectionAllowingWrites:withBlock:](v14, "databaseConnectionAllowingWrites:withBlock:", 1, v20);

      }
      v15 = [ML3AccountCacheEntry alloc];
      v16 = -[ML3AccountCacheEntry initWithAppleID:altDSID:](v15, "initWithAppleID:altDSID:", v30[5], v24[5]);
      v17 = (void *)v43[5];
      v43[5] = v16;

      -[ML3AccountCacheDatabase _setCacheEntry:forDSID:](self, "_setCacheEntry:forDSID:", v43[5], a3);
    }
    _Block_object_dispose(&v23, 8);

    _Block_object_dispose(&v29, 8);
    v7 = (void *)v43[5];
  }
  v18 = v7;
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v18;
}

- (void)_setCacheEntry:(id)a3 forDSID:(unint64_t)a4
{
  id v6;
  NSObject *accessQueue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  accessQueue = self->accessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ML3AccountCacheDatabase__setCacheEntry_forDSID___block_invoke;
  block[3] = &unk_1E5B65678;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_sync(accessQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->accessQueue, 0);
  objc_storeStrong((id *)&self->_propertiesCache, 0);
}

void __50__ML3AccountCacheDatabase__setCacheEntry_forDSID___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = a1[5];
  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, v3);

}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1[4] + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1[6]);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v6);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1[5] + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  __int128 v9;
  _QWORD v10[4];
  __int128 v11;
  __int128 v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 64);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeQuery:withParameters:", CFSTR("SELECT apple_id,alt_dsid FROM account where dsid=?"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_3;
  v10[3] = &unk_1E5B65600;
  v9 = *(_OWORD *)(a1 + 48);
  v11 = *(_OWORD *)(a1 + 32);
  v12 = v9;
  objc_msgSend(v8, "enumerateRowsWithBlock:", v10);

}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_37(_QWORD *a1, void *a2)
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  id v23;
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  v3 = a1[6];
  v4 = *(const __CFString **)(*(_QWORD *)(a1[5] + 8) + 40);
  if (!v4)
    v4 = &stru_1E5B66908;
  v24[0] = v4;
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a2;
  objc_msgSend(v5, "numberWithUnsignedLongLong:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v9 = objc_msgSend(v6, "executeUpdate:withParameters:error:", CFSTR("UPDATE account SET alt_dsid=? where dsid=?"), v8, &v15);

  v10 = v15;
  if ((v9 & 1) == 0)
  {
    v11 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = a1[6];
      v13 = a1[4];
      v14 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138544130;
      v17 = v13;
      v18 = 2048;
      v19 = v12;
      v20 = 2112;
      v21 = v14;
      v22 = 2114;
      v23 = v10;
      _os_log_impl(&dword_1AC149000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update the account database with DSID %lld, resolvedAltDSID %@. err=%{public}@", buf, 0x2Au);
    }

  }
}

void __46__ML3AccountCacheDatabase__cacheEntryForDSID___block_invoke_3(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (v8)
  {
    v9 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      v17 = 138543618;
      v18 = v10;
      v19 = 2114;
      v20 = v8;
      _os_log_impl(&dword_1AC149000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to query the account table. err=%{public}@", (uint8_t *)&v17, 0x16u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), a3);
    *a4 = 1;
  }
  else
  {
    objc_msgSend(v7, "stringForColumnIndex:", 0);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(v7, "stringForColumnIndex:", 1);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1[7] + 8);
    v16 = *(void **)(v15 + 40);
    *(_QWORD *)(v15 + 40) = v14;

  }
}

void __54__ML3AccountCacheDatabase_setAppleID_altDSID_forDSID___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  ML3AccountCacheEntry *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  id v25;
  _QWORD v26[4];

  v26[3] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(_QWORD *)(a1 + 72);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedLongLong:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 32);
  v26[0] = v6;
  v26[1] = v7;
  v8 = *(const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (!v8)
    v8 = &stru_1E5B66908;
  v26[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v10 = objc_msgSend(v5, "executeUpdate:withParameters:error:", CFSTR("REPLACE INTO account (dsid, apple_id, alt_dsid) VALUES (?, ?, ?)"), v9, &v19);

  v11 = v19;
  v12 = v19;

  if ((v10 & 1) != 0)
  {
    v13 = -[ML3AccountCacheEntry initWithAppleID:altDSID:]([ML3AccountCacheEntry alloc], "initWithAppleID:altDSID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(a1 + 40), "_setCacheEntry:forDSID:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(a1 + 72));
  }
  else
  {
    v16 = os_log_create("com.apple.amp.medialibrary", "Default");
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = *(_QWORD *)(a1 + 72);
      *(_DWORD *)buf = 138543874;
      v21 = v17;
      v22 = 2048;
      v23 = v18;
      v24 = 2114;
      v25 = v12;
      _os_log_impl(&dword_1AC149000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Failed to update the account database with DSID %lld. err=%{public}@", buf, 0x20u);
    }

    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), v11);
  }

}

@end
