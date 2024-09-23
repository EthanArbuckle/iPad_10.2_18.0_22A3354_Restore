@implementation FCAVPersistentAssetKeyCache

- (id)interestTokenForKeyURIs:(id)a3
{
  return +[FCInterestToken interestTokenWithRemoveInterestBlock:](FCInterestToken, "interestTokenWithRemoveInterestBlock:", &__block_literal_global_6);
}

- (_QWORD)initWithCacheDirectory:(_QWORD *)a1
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v3 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)FCAVPersistentAssetKeyCache;
    a1 = objc_msgSendSuper2(&v9, sel_init);
    if (a1)
    {
      v4 = objc_alloc_init(MEMORY[0x1E0D60B18]);
      v5 = (void *)a1[2];
      a1[2] = v4;

      v6 = objc_msgSend(v3, "copy");
      v7 = (void *)a1[1];
      a1[1] = v6;

    }
  }

  return a1;
}

- (id)assetKeyForURI:(id)a3
{
  id v4;
  FCKeyValueStore *keyStore;
  FCKeyValueStore *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self)
    keyStore = self->_keyStore;
  else
    keyStore = 0;
  v6 = keyStore;
  objc_msgSend(v4, "absoluteString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCKeyValueStore objectForKey:](v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (uint64_t)_prepareForUse
{
  void *v1;
  _QWORD v2[5];

  if (result)
  {
    v1 = *(void **)(result + 16);
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __45__FCAVPersistentAssetKeyCache__prepareForUse__block_invoke;
    v2[3] = &unk_1E463AB18;
    v2[4] = result;
    return objc_msgSend(v1, "performWithLockSync:", v2);
  }
  return result;
}

- (void)saveAssetKeyData:(id)a3 creationDate:(id)a4 expirationDate:(id)a5 forURI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  FCKeyValueStore *keyStore;
  FCKeyValueStore *v18;
  void *v19;
  id v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  v20 = objc_alloc_init(MEMORY[0x1E0D62610]);
  objc_msgSend(v10, "absoluteString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setIdentifier:", v14);

  objc_msgSend(v20, "setKeyData:", v13);
  objc_msgSend(v12, "pbDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setCreatedAt:", v15);
  objc_msgSend(v11, "pbDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v20, "setExpiresAt:", v16);
  if (self)
    keyStore = self->_keyStore;
  else
    keyStore = 0;
  v18 = keyStore;
  objc_msgSend(v10, "absoluteString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  -[FCKeyValueStore setObject:forKey:](v18, "setObject:forKey:", v20, v19);
}

- (void)removeAllAssetKeys
{
  FCKeyValueStore *keyStore;

  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self)
    keyStore = self->_keyStore;
  else
    keyStore = 0;
  -[FCKeyValueStore removeAllObjects](keyStore, "removeAllObjects");
}

- (NSData)keyServerCertificate
{
  NSURL *certificateFileURL;

  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self)
    certificateFileURL = self->_certificateFileURL;
  else
    certificateFileURL = 0;
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", certificateFileURL);
}

- (void)saveKeyServerCertificate:(id)a3
{
  id v4;
  NSURL *certificateFileURL;
  NSURL *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self)
    certificateFileURL = self->_certificateFileURL;
  else
    certificateFileURL = 0;
  v10 = 0;
  v6 = certificateFileURL;
  v7 = objc_msgSend(v4, "writeToURL:options:error:", v6, 0, &v10);

  v8 = v10;
  if ((v7 & 1) == 0)
  {
    v9 = FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v8;
      _os_log_error_impl(&dword_1A1B90000, v9, OS_LOG_TYPE_ERROR, "AV asset key cache failed to save certificate with error: %{public}@", buf, 0xCu);
    }
  }

}

- (void)clearKeyServerCertificate
{
  void *v3;
  NSURL *certificateFileURL;
  id v5;

  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    certificateFileURL = self->_certificateFileURL;
  else
    certificateFileURL = 0;
  v5 = v3;
  objc_msgSend(v3, "removeItemAtURL:error:", certificateFileURL, 0);

}

- (void)importAVAssetKey:(id)a3
{
  FCKeyValueStore *keyStore;
  FCKeyValueStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  FCKeyValueStore *v11;
  FCKeyValueStore *v12;
  void *v13;
  id v14;

  v14 = a3;
  -[FCAVPersistentAssetKeyCache _prepareForUse]((uint64_t)self);
  if (self)
    keyStore = self->_keyStore;
  else
    keyStore = 0;
  v5 = keyStore;
  objc_msgSend(v14, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FCKeyValueStore objectForKey:](v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7
    || (objc_msgSend(v7, "expirationDate"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v14, "expirationDate"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v8, "fc_isEarlierThan:", v9),
        v9,
        v8,
        v10))
  {
    if (self)
      v11 = self->_keyStore;
    else
      v11 = 0;
    v12 = v11;
    objc_msgSend(v14, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[FCKeyValueStore setObject:forKey:](v12, "setObject:forKey:", v14, v13);

  }
}

void __45__FCAVPersistentAssetKeyCache__prepareForUse__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  FCKeyValueStoreClassRegistry *v7;
  FCKeyValueStore *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v1 + 24))
  {
    v2 = (void *)MEMORY[0x1E0C99E98];
    v3 = *(id *)(v1 + 8);
    objc_msgSend(v2, "fileURLWithPath:isDirectory:", v3, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:", CFSTR("cert"));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(void **)(v1 + 32);
    *(_QWORD *)(v1 + 32) = v5;

    v7 = objc_alloc_init(FCKeyValueStoreClassRegistry);
    -[FCKeyValueStoreClassRegistry registerClass:](v7, "registerClass:", objc_opt_class());
    v8 = [FCKeyValueStore alloc];
    v9 = *(id *)(v1 + 8);
    v10 = -[FCKeyValueStore initWithName:directory:version:options:classRegistry:](v8, "initWithName:directory:version:options:classRegistry:", CFSTR("lru"), v9, 1, 8, v7);
    v11 = *(void **)(v1 + 24);
    *(_QWORD *)(v1 + 24) = v10;

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(*(id *)(v1 + 24), "allKeys", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v26 != v15)
            objc_enumerationMutation(v12);
          v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_opt_class();
          objc_msgSend(*(id *)(v1 + 24), "objectForKey:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
          {
            if ((objc_opt_isKindOfClass() & 1) != 0)
              v19 = v18;
            else
              v19 = 0;
          }
          else
          {
            v19 = 0;
          }
          v20 = v19;

          if (v20 && objc_msgSend(v20, "isExpired"))
            objc_msgSend(*(id *)(v1 + 24), "removeObjectForKey:", v17);

        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
      }
      while (v14);
    }

    v21 = (void *)FCAVAssetLog;
    if (os_log_type_enabled((os_log_t)FCAVAssetLog, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *(void **)(v1 + 24);
      v23 = v21;
      objc_msgSend(v22, "allKeys");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v24;
      _os_log_impl(&dword_1A1B90000, v23, OS_LOG_TYPE_DEFAULT, "AV asset key cache loaded with cached keys: %{public}@", buf, 0xCu);

    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_certificateFileURL, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_initializationLock, 0);
  objc_storeStrong((id *)&self->_cacheDirectory, 0);
}

@end
