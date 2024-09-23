@implementation CSFileProviderContainerCache

- (BOOL)isFPBundleID:(id)a3
{
  CSFileProviderContainerCache *v3;
  _opaque_pthread_rwlock_t *p_appContainerOIDsByBundleIdLock;
  id v5;

  v3 = self;
  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  v5 = a3;
  pthread_rwlock_rdlock(p_appContainerOIDsByBundleIdLock);
  LOBYTE(v3) = -[CSFileProviderContainerCache isFPBundleIDLocked:](v3, "isFPBundleIDLocked:", v5);

  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
  return (char)v3;
}

- (BOOL)isFPBundleIDLocked:(id)a3
{
  NSMutableDictionary *appContainerOIDsByBundleId;
  id v4;
  void *v5;
  char v6;

  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  v4 = a3;
  -[NSMutableDictionary allKeys](appContainerOIDsByBundleId, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)addAppContainerOID:(id)a3 forBundle:(id)a4 fpBundle:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  pthread_rwlock_wrlock(&self->_appContainerOIDsByBundleIdLock);
  logForCSLogCategoryDefault();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 && v9 && v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v15 = 138412802;
      v16 = v10;
      v17 = 2112;
      v18 = v9;
      v19 = 2048;
      v20 = objc_msgSend(v8, "unsignedLongLongValue");
      _os_log_debug_impl(&dword_18C42F000, v12, OS_LOG_TYPE_DEBUG, "[ProtectedApps] (%@) %@ -> 0x%016llx", (uint8_t *)&v15, 0x20u);
    }

    -[NSMutableDictionary objectForKeyedSubscript:](self->_appContainerOIDsByBundleId, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](self->_appContainerOIDsByBundleId, "setObject:forKeyedSubscript:", v14, v10);

    }
    -[NSMutableDictionary objectForKeyedSubscript:](self->_appContainerOIDsByBundleId, "objectForKeyedSubscript:", v10);
    v12 = objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v8, v9);
  }
  else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v15 = 138412802;
    v16 = v10;
    v17 = 2112;
    v18 = v9;
    v19 = 2048;
    v20 = objc_msgSend(v8, "unsignedLongLongValue");
    _os_log_error_impl(&dword_18C42F000, v12, OS_LOG_TYPE_ERROR, "[ProtectedApps] Invalid: (%@) %@ -> 0x%016llx", (uint8_t *)&v15, 0x20u);
  }

  pthread_rwlock_unlock(&self->_appContainerOIDsByBundleIdLock);
}

- (void)refreshCacheWithCompletionHandler:(id)a3
{
  id v4;
  CSSearchQueryContext *v5;
  void *v6;
  CSSearchQuery *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  id v15;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(CSSearchQueryContext);
  v16[0] = CFSTR("kMDItemDisplayName");
  v16[1] = CFSTR("_kMDItemOID");
  v16[2] = CFSTR("FPAppContainerBundleID");
  v16[3] = CFSTR("_kMDItemBundleID");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSSearchQueryContext setFetchAttributes:](v5, "setFetchAttributes:", v6);

  v7 = -[CSSearchQuery initWithQueryString:queryContext:]([CSSearchQuery alloc], "initWithQueryString:queryContext:", CFSTR("(FPAppContainerBundleID = *)"), v5);
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x3032000000;
  v14[3] = __Block_byref_object_copy_;
  v14[4] = __Block_byref_object_dispose_;
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[CSSearchQuery setProtectionClasses:](v7, "setProtectionClasses:", &unk_1E242F268);
  v8 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E2400648;
  v13[4] = v14;
  -[CSSearchQuery setFoundItemsHandler:](v7, "setFoundItemsHandler:", v13);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke_21;
  v10[3] = &unk_1E2400670;
  v10[4] = self;
  v12 = v14;
  v9 = v4;
  v11 = v9;
  -[CSSearchQuery setCompletionHandler:](v7, "setCompletionHandler:", v10);
  -[CSSearchQuery start](v7, "start");

  _Block_object_dispose(v14, 8);
}

void __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  BOOL v14;
  uint64_t v16;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  id obj;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  uint64_t v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = a2;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
  if (v3)
  {
    v5 = v3;
    v23 = *(_QWORD *)v25;
    *(_QWORD *)&v4 = 138412802;
    v21 = v4;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v25 != v23)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v6), "attributeSet", v21);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "attributeDictionary");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_kMDItemOID"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("FPAppContainerBundleID"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("_kMDItemBundleID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        logForCSLogCategoryDefault();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v9)
          v14 = v10 == 0;
        else
          v14 = 1;
        if (v14 || v11 == 0)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = objc_msgSend(v9, "unsignedLongLongValue");
            *(_DWORD *)buf = v21;
            v29 = v11;
            v30 = 2112;
            v31 = v10;
            v32 = 2048;
            v33 = v16;
            _os_log_error_impl(&dword_18C42F000, v13, OS_LOG_TYPE_ERROR, "[ProtectedApps] Invalid: (%@) %@ -> 0x%016llx", buf, 0x20u);
          }
        }
        else
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            v20 = objc_msgSend(v9, "unsignedLongLongValue");
            *(_DWORD *)buf = v21;
            v29 = v11;
            v30 = 2112;
            v31 = v10;
            v32 = 2048;
            v33 = v20;
            _os_log_debug_impl(&dword_18C42F000, v13, OS_LOG_TYPE_DEBUG, "[ProtectedApps] (%@) %@ -> 0x%016llx", buf, 0x20u);
          }

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v11);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v18)
          {
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setObject:forKeyedSubscript:", v19, v11);

          }
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKeyedSubscript:", v11);
          v13 = objc_claimAutoreleasedReturnValue();
          -[NSObject setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v9, v10);
        }

        ++v6;
      }
      while (v5 != v6);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v34, 16);
    }
    while (v5);
  }

}

void __66__CSFileProviderContainerCache_refreshCacheWithCompletionHandler___block_invoke_21(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  pthread_rwlock_wrlock((pthread_rwlock_t *)(a1[4] + 16));
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  v6 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v4;

  pthread_rwlock_unlock((pthread_rwlock_t *)(a1[4] + 16));
  logForCSLogCategoryDefault();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18C42F000, v7, OS_LOG_TYPE_DEFAULT, "[ProtectedApps] Done refreshing FP app container oid cache", v9, 2u);
  }

  v8 = a1[5];
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (void)refreshCache
{
  -[CSFileProviderContainerCache refreshCacheWithCompletionHandler:](self, "refreshCacheWithCompletionHandler:", 0);
}

- (id)filterForDisabledBundles:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _opaque_pthread_rwlock_t *p_appContainerOIDsByBundleIdLock;
  NSMutableDictionary *appContainerOIDsByBundleId;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    objc_msgSend(v5, "removeObject:", CFSTR("com.apple.FileProvider.LocalStorage"));
    objc_msgSend(v5, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));
    objc_msgSend(v5, "removeObject:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));
    v6 = objc_msgSend(v4, "containsObject:", CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy_;
    v33 = __Block_byref_object_dispose_;
    v34 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v34 = (id)objc_claimAutoreleasedReturnValue();
    logForCSLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[CSFileProviderContainerCache filterForDisabledBundles:].cold.2(v6, v7, v8, v9, v10, v11, v12, v13);

    p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
    pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
    appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke;
    v25[3] = &unk_1E24006C0;
    v28 = v6;
    v26 = v4;
    v27 = &v29;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appContainerOIDsByBundleId, "enumerateKeysAndObjectsUsingBlock:", v25);
    pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
    if (objc_msgSend((id)v30[5], "count"))
    {
      objc_msgSend((id)v30[5], "componentsJoinedByString:", CFSTR(" || "));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    logForCSLogCategoryDefault();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      -[CSFileProviderContainerCache filterForDisabledBundles:].cold.1((uint64_t)v16, v17, v18, v19, v20, v21, v22, v23);

    _Block_object_dispose(&v29, 8);
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  void *v10;
  _QWORD v11[4];
  _QWORD v12[2];
  _QWORD v13[4];
  _QWORD v14[2];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 48))
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_2;
      v13[3] = &unk_1E2400698;
      v14[0] = *(id *)(a1 + 32);
      v14[1] = &v15;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v13);
      if (objc_msgSend((id)v16[5], "count"))
      {
        objc_msgSend((id)v16[5], "componentsJoinedByString:", CFSTR(" && "));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@ = %@) && (%@))"), CFSTR("_kMDItemBundleID"), v5, v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%@ = %@)"), CFSTR("_kMDItemBundleID"), v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);
      v9 = (id *)v14;
    }
    else
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_3;
      v11[3] = &unk_1E2400698;
      v12[0] = *(id *)(a1 + 32);
      v12[1] = &v15;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v11);
      v9 = (id *)v12;
      if (objc_msgSend((id)v16[5], "count"))
      {
        objc_msgSend((id)v16[5], "componentsJoinedByString:", CFSTR(" || "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("((%@ = %@) && (%@))"), CFSTR("_kMDItemBundleID"), v5, v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v8);

      }
      else
      {
        v8 = 0;
      }
    }

    _Block_object_dispose(&v15, 8);
  }

}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10) & 1) == 0)
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("(_kMDItemQueryPathOID != %@) || (FPAppContainerBundleID != %@)"), v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
}

void __57__CSFileProviderContainerCache_filterForDisabledBundles___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v10))
  {
    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    v7 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "stringValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("(_kMDItemQueryPathOID = %@) || (FPAppContainerBundleID = %@)"), v8, v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v9);

  }
}

- (id)appContainerOIDsForDisabledBundles:(id)a3
{
  id v4;
  void *v5;
  _opaque_pthread_rwlock_t *p_appContainerOIDsByBundleIdLock;
  NSMutableDictionary *appContainerOIDsByBundleId;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, void *);
  void *v16;
  id v17;
  id v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke;
  v16 = &unk_1E2400710;
  v17 = v4;
  v18 = v5;
  v8 = v5;
  v9 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](appContainerOIDsByBundleId, "enumerateKeysAndObjectsUsingBlock:", &v13);
  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
  if (objc_msgSend(v8, "count", v13, v14, v15, v16))
    v10 = v8;
  else
    v10 = 0;
  v11 = v10;

  return v11;
}

void __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v5[4];
  id v6;
  id v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke_2;
  v5[3] = &unk_1E24006E8;
  v6 = *(id *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v5);

}

void __67__CSFileProviderContainerCache_appContainerOIDsForDisabledBundles___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;

  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2))
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CSFileProviderContainerCache_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __46__CSFileProviderContainerCache_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v1;

}

- (CSFileProviderContainerCache)init
{
  CSFileProviderContainerCache *v2;
  CSFileProviderContainerCache *v3;
  uint64_t v4;
  NSMutableDictionary *appContainerOIDsByBundleId;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CSFileProviderContainerCache;
  v2 = -[CSFileProviderContainerCache init](&v11, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_rwlock_init(&v2->_appContainerOIDsByBundleIdLock, 0);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    appContainerOIDsByBundleId = v3->_appContainerOIDsByBundleId;
    v3->_appContainerOIDsByBundleId = (NSMutableDictionary *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_appContainerOIDsByBundleId, "setObject:forKeyedSubscript:", v6, CFSTR("com.apple.CloudDocs.MobileDocumentsFileProvider"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_appContainerOIDsByBundleId, "setObject:forKeyedSubscript:", v7, CFSTR("com.apple.FileProvider.LocalStorage"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_appContainerOIDsByBundleId, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider"));

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v3->_appContainerOIDsByBundleId, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged"));

  }
  return v3;
}

- (void)dealloc
{
  NSMutableDictionary *appContainerOIDsByBundleId;
  objc_super v4;

  appContainerOIDsByBundleId = self->_appContainerOIDsByBundleId;
  self->_appContainerOIDsByBundleId = 0;

  pthread_rwlock_destroy(&self->_appContainerOIDsByBundleIdLock);
  v4.receiver = self;
  v4.super_class = (Class)CSFileProviderContainerCache;
  -[CSFileProviderContainerCache dealloc](&v4, sel_dealloc);
}

- (id)dumpAppContainerCache
{
  _opaque_pthread_rwlock_t *p_appContainerOIDsByBundleIdLock;
  void *v4;

  p_appContainerOIDsByBundleIdLock = &self->_appContainerOIDsByBundleIdLock;
  pthread_rwlock_rdlock(&self->_appContainerOIDsByBundleIdLock);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", self->_appContainerOIDsByBundleId);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  pthread_rwlock_unlock(p_appContainerOIDsByBundleIdLock);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appContainerOIDsByBundleId, 0);
}

- (void)filterForDisabledBundles:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "[ProtectedApps] adding filter %@", a5, a6, a7, a8, 2u);
}

- (void)filterForDisabledBundles:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18C42F000, a2, a3, "[ProtectedApps] Files app is %@", a5, a6, a7, a8, 2u);
}

@end
