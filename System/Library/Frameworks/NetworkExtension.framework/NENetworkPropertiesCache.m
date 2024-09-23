@implementation NENetworkPropertiesCache

- (NENetworkPropertiesCache)init
{
  NENetworkPropertiesCache *v2;
  NENetworkPropertiesCache *v3;
  uint32_t v4;
  uint32_t v5;
  NSObject *v6;
  NENetworkPropertiesCache *v7;
  uint64_t v8;
  NSURL *cacheFileURL;
  NSString *keychainIdentifier;
  int out_token;
  objc_super v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint32_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13.receiver = self;
  v13.super_class = (Class)NENetworkPropertiesCache;
  v2 = -[NENetworkPropertiesCache init](&v13, sel_init);
  v3 = v2;
  if (!v2)
    goto LABEL_7;
  v2->lock._os_unfair_lock_opaque = 0;
  out_token = -1;
  v4 = notify_register_check("com.apple.networkextension.net-properties-changed", &out_token);
  if (!v4)
  {
    v3->_notifyToken = out_token;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", "/Library/Preferences/com.apple.networkextension.netprops.plist", 0, 0);
    cacheFileURL = v3->_cacheFileURL;
    v3->_cacheFileURL = (NSURL *)v8;

    keychainIdentifier = v3->_keychainIdentifier;
    v3->_keychainIdentifier = (NSString *)CFSTR("com.apple.networkextension.netpropskey");

LABEL_7:
    v7 = v3;
    goto LABEL_8;
  }
  v5 = v4;
  ne_log_obj();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v15 = "com.apple.networkextension.net-properties-changed";
    v16 = 1024;
    v17 = v5;
    _os_log_fault_impl(&dword_19BD16000, v6, OS_LOG_TYPE_FAULT, "Failed to register for %s notifications: %u", buf, 0x12u);
  }

  v7 = 0;
LABEL_8:

  return v7;
}

- (id)copyPropertiesForNetworkPath:(id)a3
{
  void *v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  NSDictionary *v7;
  NSDictionary *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = (void *)-[NENetworkPropertiesCache copyNetworkSignatureForPath:]((uint64_t)self, a3);
  if (v4)
  {
    p_lock = &self->lock;
    os_unfair_lock_lock(&self->lock);
    v6 = 0;
    if (-[NENetworkPropertiesCache loadCache]((uint64_t)self) && self)
    {
      v7 = self->_cache;
      if (v7)
      {
        v8 = v7;
        -[NENetworkPropertiesCache createCacheKeyFromSignature:](self, v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[NSDictionary objectForKeyedSubscript:](v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v6 = (void *)objc_msgSend(v10, "copy");

        }
        else
        {
          ne_log_obj();
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)v14 = 0;
            _os_log_error_impl(&dword_19BD16000, v12, OS_LOG_TYPE_ERROR, "Failed to create a cacheKey for the network signature", v14, 2u);
          }

          v6 = 0;
        }

      }
      else
      {
        v6 = 0;
      }
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "No network signature is available", buf, 2u);
    }

    v6 = 0;
  }

  return v6;
}

- (void)setProperties:(id)a3 forNetworkPath:(id)a4
{
  id v6;
  void *v7;
  NSDictionary *v8;
  NSDictionary *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a3;
  v7 = (void *)-[NENetworkPropertiesCache copyNetworkSignatureForPath:]((uint64_t)self, a4);
  if (v7)
  {
    os_unfair_lock_lock(&self->lock);
    if (-[NENetworkPropertiesCache loadCache]((uint64_t)self))
    {
      if (self && (v8 = self->_cache) != 0)
      {
        v9 = v8;
        v10 = (id)-[NSDictionary mutableCopy](v8, "mutableCopy");

      }
      else
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      }
      -[NENetworkPropertiesCache createCacheKeyFromSignature:](self, v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (v12)
      {
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v6, v12);
        -[NENetworkPropertiesCache saveCacheToDisk:](self, (uint64_t)v10);
      }

    }
    os_unfair_lock_unlock(&self->lock);
  }
  else
  {
    ne_log_obj();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, "Network characteristics has no signature, cannot set characteristics", v13, 2u);
    }

  }
}

- (void)clear
{
  os_unfair_lock_s *p_lock;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const __CFDictionary *v8;
  OSStatus v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  _QWORD v24[3];
  _QWORD v25[4];

  v25[3] = *MEMORY[0x1E0C80C00];
  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  v4 = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD70C0];
  v24[0] = *MEMORY[0x1E0CD6C98];
  v24[1] = v5;
  v6 = *MEMORY[0x1E0C9AE50];
  v25[0] = v4;
  v25[1] = v6;
  v24[2] = *MEMORY[0x1E0CD6B58];
  -[NENetworkPropertiesCache keychainIdentifier](self, "keychainIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v8 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v9 = SecItemDelete(v8);
  if (v9 != -25300 && v9)
  {
    ne_log_obj();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      -[NENetworkPropertiesCache keychainIdentifier](self, "keychainIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v19;
      _os_log_error_impl(&dword_19BD16000, v10, OS_LOG_TYPE_ERROR, "Failed to remove the %@ keychain item", buf, 0xCu);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v11, "fileExistsAtPath:", v13);

  if (v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    objc_msgSend(v15, "removeItemAtURL:error:", v16, &v21);
    v17 = v21;

    if (v17)
    {
      ne_log_obj();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        -[NENetworkPropertiesCache cacheFileURL](self, "cacheFileURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v23 = v20;
        _os_log_error_impl(&dword_19BD16000, v18, OS_LOG_TYPE_ERROR, "Failed to remove %@", buf, 0xCu);

      }
    }
    else
    {
      notify_post("com.apple.networkextension.net-properties-changed");
    }

  }
  os_unfair_lock_unlock(p_lock);

}

- (void)rotateEncryptionKey
{
  os_unfair_lock_s *p_lock;
  NSDictionary *v4;
  NSDictionary *v5;
  int v6;
  id v7;
  void *v8;
  id v9;

  p_lock = &self->lock;
  os_unfair_lock_lock(&self->lock);
  if (-[NENetworkPropertiesCache loadCache]((uint64_t)self))
  {
    if (self)
    {
      v4 = self->_cache;
      if (v4)
      {
        v5 = v4;
        v9 = 0;
        v6 = -[NENetworkPropertiesCache fetchKey:](self, &v9);
        v7 = v9;
        v8 = v7;
        if (!v6 && v7)
          -[NENetworkPropertiesCache updateKeyWithCurrentKey:currentCache:](self, v7, v5);

      }
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (NSURL)cacheFileURL
{
  return self->_cacheFileURL;
}

- (void)setCacheFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_cacheFileURL, a3);
}

- (NSString)keychainIdentifier
{
  return self->_keychainIdentifier;
}

- (void)setKeychainIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_keychainIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_keychainIdentifier, 0);
  objc_storeStrong((id *)&self->_cacheFileURL, 0);
}

- (uint64_t)loadCache
{
  uint32_t v2;
  uint32_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  NSObject *v17;
  id v19;
  id v20;
  int check;
  uint8_t buf[4];
  NSObject *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  check = 0;
  v2 = notify_check(*(_DWORD *)(a1 + 12), &check);
  if (v2)
  {
    v3 = v2;
    ne_log_obj();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v23) = v3;
      _os_log_error_impl(&dword_19BD16000, v4, OS_LOG_TYPE_ERROR, "notify_check failed: %u", buf, 8u);
    }
    v5 = 1;
    goto LABEL_29;
  }
  if (check || !*(_QWORD *)(a1 + 32))
  {
    v6 = (void *)MEMORY[0x1E0C99D50];
    objc_msgSend((id)a1, "cacheFileURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v6, "dataWithContentsOfURL:options:error:", v7, 0, &v20);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v20;

    if (!v8)
    {
      ne_log_obj();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v4;
        _os_log_impl(&dword_19BD16000, v13, OS_LOG_TYPE_DEFAULT, "Got an error while reading the cache from disk: %@", buf, 0xCu);
      }

      if (v4)
      {
        -[NSObject domain](v4, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
          v15 = -[NSObject code](v4, "code") == 257;
        else
          v15 = 0;

      }
      else
      {
        v15 = 0;
      }
      v5 = !v15;
      v17 = *(NSObject **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = 0;
      goto LABEL_28;
    }
    v19 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v19);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = v19;
    if (v10)
    {
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v10;
        v12 = "Failed to de-serialize the network properties cache: %@";
LABEL_21:
        _os_log_error_impl(&dword_19BD16000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
      }
    }
    else
    {
      if ((isa_nsdictionary(v9) & 1) != 0)
      {
LABEL_23:
        v16 = *(void **)(a1 + 32);
        *(_QWORD *)(a1 + 32) = v9;
        v17 = v9;

        v5 = 1;
LABEL_28:

LABEL_29:
        return v5;
      }
      ne_log_obj();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v9;
        v12 = "De-serialized cache is not a dictionary: %@";
        goto LABEL_21;
      }
    }

    v9 = 0;
    goto LABEL_23;
  }
  return 1;
}

- (uint64_t)fetchKey:(void *)a1
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFDictionary *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v17;
  CFTypeRef result;
  uint8_t buf[4];
  CFTypeRef v20;
  _QWORD v21[4];
  _QWORD v22[5];

  v22[4] = *MEMORY[0x1E0C80C00];
  result = 0;
  v4 = *MEMORY[0x1E0CD6C98];
  v22[0] = *MEMORY[0x1E0CD6CA8];
  v5 = *MEMORY[0x1E0CD6B58];
  v21[0] = v4;
  v21[1] = v5;
  objc_msgSend(a1, "keychainIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0CD6F30];
  v8 = *MEMORY[0x1E0CD6F40];
  v22[1] = v6;
  v22[2] = v8;
  v9 = *MEMORY[0x1E0CD7018];
  v21[2] = v7;
  v21[3] = v9;
  v22[3] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 4);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  *a2 = 0;
  v11 = SecItemCopyMatching(v10, &result);
  v12 = v11;
  if ((_DWORD)v11 == -25300)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
LABEL_10:

      goto LABEL_11;
    }
    objc_msgSend(a1, "keychainIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_impl(&dword_19BD16000, v14, OS_LOG_TYPE_INFO, "No %@ item was found", buf, 0xCu);
LABEL_8:

    goto LABEL_10;
  }
  if ((_DWORD)v11)
  {
    ne_log_obj();
    v14 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v15 = (void *)SecCopyErrorMessageString(v12, 0);
    *(_DWORD *)buf = 138412290;
    v20 = v15;
    _os_log_error_impl(&dword_19BD16000, v14, OS_LOG_TYPE_ERROR, "SecItemCopyMatching failed: %@", buf, 0xCu);
    goto LABEL_8;
  }
  if (result && (v13 = CFDATA_TYPE, CFGetTypeID(result) == v13))
  {
    *a2 = (id)result;
  }
  else
  {
    ne_log_obj();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v20 = result;
      _os_log_error_impl(&dword_19BD16000, v17, OS_LOG_TYPE_ERROR, "Result from keychain is not a data blob: %@", buf, 0xCu);
    }

    if (result)
      CFRelease(result);
  }
LABEL_11:

  return v12;
}

- (void)updateKeyWithCurrentKey:(void *)a3 currentCache:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  OSStatus v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  id v31;
  const void *v32;
  size_t v33;
  id v34;
  CCCryptorStatus v35;
  CCCryptorStatus v36;
  NSObject *v37;
  NSObject *v38;
  const char *v39;
  uint32_t v40;
  void *v41;
  void *v42;
  void *v43;
  const __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE dataOutMoved[12];
  __int16 v57;
  __CFString *v58;
  _BYTE buf[24];
  uint64_t v60;
  uint64_t v61;
  _QWORD __buf[5];
  uint64_t v63;
  id v64;
  _QWORD v65[2];
  _QWORD v66[5];

  v66[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  arc4random_buf(__buf, 0x20uLL);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", __buf, 32);
  v8 = v7;
  if (!v7)
    goto LABEL_28;
  v9 = v7;
  v10 = *MEMORY[0x1E0CD6C98];
  v11 = *MEMORY[0x1E0CD6CA8];
  if (v5)
  {
    v66[0] = *MEMORY[0x1E0CD6CA8];
    v12 = *MEMORY[0x1E0CD6B58];
    v65[0] = v10;
    v65[1] = v12;
    objc_msgSend(a1, "keychainIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v66[1] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v66, v65, 2);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v63 = *MEMORY[0x1E0CD70D8];
    v64 = v9;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v64, &v63, 1);
    v15 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    v16 = SecItemUpdate(v14, v15);

  }
  else
  {
    v17 = *MEMORY[0x1E0CD70C0];
    *(_QWORD *)buf = *MEMORY[0x1E0CD6C98];
    *(_QWORD *)&buf[8] = v17;
    v18 = *MEMORY[0x1E0C9AE50];
    __buf[0] = v11;
    __buf[1] = v18;
    *(_QWORD *)&buf[16] = *MEMORY[0x1E0CD6B58];
    objc_msgSend(a1, "keychainIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *MEMORY[0x1E0CD70D8];
    __buf[2] = v19;
    __buf[3] = v9;
    v21 = *MEMORY[0x1E0CD68A0];
    v60 = v20;
    v61 = v21;
    __buf[4] = *MEMORY[0x1E0CD68A8];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", __buf, buf, 5);
    v14 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

    v16 = SecItemAdd(v14, 0);
  }

  if (!v16)
  {

    if (!v5 || !v6)
      goto LABEL_28;
    v46 = a1;
    v47 = v8;
    v50 = v9;
    v49 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v48 = v6;
    v23 = v6;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (!v24)
      goto LABEL_27;
    v25 = v24;
    v26 = *(_QWORD *)v52;
LABEL_12:
    v27 = 0;
    while (1)
    {
      if (*(_QWORD *)v52 != v26)
        objc_enumerationMutation(v23);
      v28 = *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v27);
      *(_QWORD *)dataOutMoved = 0;
      objc_msgSend(v23, "objectForKeyedSubscript:", v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v28, 0);
      v31 = objc_retainAutorelease(v5);
      v32 = (const void *)objc_msgSend(v31, "bytes");
      v33 = objc_msgSend(v31, "length");
      v34 = objc_retainAutorelease(v30);
      v35 = CCCrypt(1u, 0, 0, v32, v33, 0, (const void *)objc_msgSend(v34, "bytes"), objc_msgSend(v34, "length"), __buf, 0x20uLL, (size_t *)dataOutMoved);
      if (v35)
      {
        v36 = v35;
        ne_log_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v36;
          v38 = v37;
          v39 = "CCCrypt failed: %d";
          v40 = 8;
LABEL_24:
          _os_log_error_impl(&dword_19BD16000, v38, OS_LOG_TYPE_ERROR, v39, buf, v40);
        }
      }
      else
      {
        if (*(_QWORD *)dataOutMoved == 32)
        {
          v37 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", __buf, 32, 0);
          -[NENetworkPropertiesCache encryptData:withKey:](v37, v50);
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v41;
          if (v41)
          {
            objc_msgSend(v41, "base64EncodedStringWithOptions:", 0);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v49, "setObject:forKeyedSubscript:", v29, v43);

          }
          goto LABEL_25;
        }
        ne_log_obj();
        v37 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134218240;
          *(_QWORD *)&buf[4] = *(_QWORD *)dataOutMoved;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = 32;
          v38 = v37;
          v39 = "Decrypted data size (%lu) does not match expected size (%lu)";
          v40 = 22;
          goto LABEL_24;
        }
      }
LABEL_25:

      if (v25 == ++v27)
      {
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
        if (!v25)
        {
LABEL_27:

          -[NENetworkPropertiesCache saveCacheToDisk:](v46, (uint64_t)v49);
          v8 = v47;
          v6 = v48;
          goto LABEL_28;
        }
        goto LABEL_12;
      }
    }
  }
  ne_log_obj();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    if (v5)
      v44 = CFSTR("update");
    else
      v44 = CFSTR("add");
    v45 = (__CFString *)SecCopyErrorMessageString(v16, 0);
    *(_DWORD *)dataOutMoved = 138412546;
    *(_QWORD *)&dataOutMoved[4] = v44;
    v57 = 2112;
    v58 = v45;
    _os_log_error_impl(&dword_19BD16000, v22, OS_LOG_TYPE_ERROR, "Failed to %@ the signature key: %@", dataOutMoved, 0x16u);

  }
LABEL_28:

}

- (id)encryptData:(void *)a1 withKey:(void *)a2
{
  id v3;
  id v4;
  const void *v5;
  size_t v6;
  id v7;
  CCCryptorStatus v8;
  void *v9;
  void *dataOut;
  id v11;
  const void *v12;
  size_t v13;
  id v14;
  const void *v15;
  size_t v16;
  CCCryptorStatus v17;
  CCCryptorStatus v18;
  NSObject *v19;
  CCCryptorStatus v20;
  NSObject *v21;
  int v22;
  void *v23;
  id v25;
  size_t size;
  uint8_t v27[4];
  size_t v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint8_t *v32;
  uint8_t buf[4];
  CCCryptorStatus v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  size = 0;
  v4 = objc_retainAutorelease(a2);
  v5 = (const void *)objc_msgSend(v4, "bytes");
  v6 = objc_msgSend(v4, "length");
  v7 = objc_retainAutorelease(v3);
  v8 = CCCrypt(0, 0, 0, v5, v6, 0, (const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), 0, 0, &size);
  if (v8 != -4301)
  {
    v20 = v8;
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      v34 = v20;
      _os_log_error_impl(&dword_19BD16000, v21, OS_LOG_TYPE_ERROR, "CCCrypt failed without buffer: %d", buf, 8u);
    }
    goto LABEL_13;
  }
  v9 = malloc_type_malloc(size, 0x100004077774924uLL);
  if (!v9)
  {
    v22 = *__error();
    if (strerror_r(v22, (char *)buf, 0x80uLL))
      buf[0] = 0;
    ne_log_obj();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)v27 = 134218498;
      v28 = size;
      v29 = 1024;
      v30 = v22;
      v31 = 2080;
      v32 = buf;
      _os_log_fault_impl(&dword_19BD16000, v21, OS_LOG_TYPE_FAULT, "Failed to allocate %lu bytes of data: [%d] %s", v27, 0x1Cu);
    }
LABEL_13:

    goto LABEL_14;
  }
  dataOut = v9;
  v11 = objc_retainAutorelease(v4);
  v12 = (const void *)objc_msgSend(v11, "bytes");
  v13 = objc_msgSend(v11, "length");
  v14 = objc_retainAutorelease(v7);
  v15 = (const void *)objc_msgSend(v14, "bytes");
  v16 = objc_msgSend(v14, "length");
  v17 = CCCrypt(0, 0, 0, v12, v13, 0, v15, v16, dataOut, size, &size);
  if (!v17)
  {
    v25 = objc_alloc(MEMORY[0x1E0C99D50]);
    v23 = (void *)objc_msgSend(v25, "initWithBytesNoCopy:length:", dataOut, size);
    goto LABEL_15;
  }
  v18 = v17;
  ne_log_obj();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    v34 = v18;
    _os_log_error_impl(&dword_19BD16000, v19, OS_LOG_TYPE_ERROR, "CCCrypt failed with buffer: %d", buf, 8u);
  }

  free(dataOut);
LABEL_14:
  v23 = 0;
LABEL_15:

  return v23;
}

- (void)saveCacheToDisk:(void *)a1
{
  void *v3;
  id v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  NSObject *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", a2, 200, 0, &v11);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v11;
    if (v4)
    {
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v4;
        v6 = "Failed to serialize the network properties: %@";
LABEL_12:
        _os_log_error_impl(&dword_19BD16000, v5, OS_LOG_TYPE_ERROR, v6, buf, 0xCu);
      }
    }
    else
    {
      if ((isa_nsdata(v3) & 1) != 0)
      {
        objc_msgSend(a1, "cacheFileURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 0;
        objc_msgSend(v3, "writeToURL:options:error:", v7, 1073741825, &v10);
        v5 = v10;

        if (v5)
        {
          ne_log_obj();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(a1, "cacheFileURL");
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v13 = v9;
            v14 = 2112;
            v15 = v5;
            _os_log_error_impl(&dword_19BD16000, v8, OS_LOG_TYPE_ERROR, "Failed to write the serialized plist to %@: %@", buf, 0x16u);

          }
        }
        else
        {
          notify_post("com.apple.networkextension.net-properties-changed");
        }
        goto LABEL_14;
      }
      ne_log_obj();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v3;
        v6 = "Serialized plist is not a valid data object: %@";
        goto LABEL_12;
      }
    }
LABEL_14:

  }
}

- (uint64_t)copyNetworkSignatureForPath:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  nw_interface_type_t type;
  NSObject *v9;
  int ipv4_network_signature;
  char v11;
  uint8_t *v12;
  NSObject *v13;
  uint64_t v14;
  uint8_t buf[8];
  uint64_t v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1 && v3)
  {
    v6 = nw_path_copy_interface();
    v7 = v6;
    if (!v6)
    {
      ne_log_obj();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19BD16000, v9, OS_LOG_TYPE_ERROR, "Path does not have an interface, cannot get network signature", buf, 2u);
      }
      v5 = 0;
      goto LABEL_17;
    }
    type = nw_interface_get_type(v6);
    v9 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
    ipv4_network_signature = nw_path_get_ipv4_network_signature();
    v11 = ipv4_network_signature;
    if (ipv4_network_signature)
      -[NSObject appendBytes:length:](v9, "appendBytes:length:", buf, 20);
    *(_QWORD *)buf = 0;
    v17 = 0;
    v18 = 0;
    if (nw_path_get_ipv6_network_signature())
    {
      if (type == nw_interface_type_cellular)
      {
        v12 = (uint8_t *)&dummyIPv6NetworkSignature;
        v13 = v9;
        v14 = 20;
      }
      else
      {
        v14 = 20;
        v12 = buf;
        v13 = v9;
      }
    }
    else
    {
      if ((v11 & 1) != 0)
      {
LABEL_16:
        v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithData:", v9);
LABEL_17:

        goto LABEL_18;
      }
      v12 = (uint8_t *)"default_signature";
      v13 = v9;
      v14 = 18;
    }
    -[NSObject appendBytes:length:](v13, "appendBytes:length:", v12, v14);
    goto LABEL_16;
  }
LABEL_18:

  return v5;
}

- (id)createCacheKeyFromSignature:(void *)a1
{
  id v3;
  int v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v12;
  id v13;
  unsigned __int8 md[32];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v13 = 0;
    v4 = -[NENetworkPropertiesCache fetchKey:](a1, &v13);
    v5 = v13;
    if (v4 == -25300)
    {
      -[NENetworkPropertiesCache updateKeyWithCurrentKey:currentCache:](a1, 0, 0);
      v12 = v5;
      v4 = -[NENetworkPropertiesCache fetchKey:](a1, &v12);
      v6 = v12;

      v5 = v6;
    }
    if (v4)
    {
      a1 = 0;
    }
    else
    {
      v7 = objc_retainAutorelease(v3);
      CC_SHA256((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", md, 32, 0);
      -[NENetworkPropertiesCache encryptData:withKey:](v8, v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v9)
      {
        objc_msgSend(v9, "base64EncodedStringWithOptions:", 0);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        a1 = 0;
      }

    }
  }

  return a1;
}

+ (NENetworkPropertiesCache)sharedCache
{
  if (sharedCache_onceToken != -1)
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_21264);
  return (NENetworkPropertiesCache *)(id)sharedCache_g_cache;
}

void __39__NENetworkPropertiesCache_sharedCache__block_invoke()
{
  NENetworkPropertiesCache *v0;
  void *v1;

  if (NEInitCFTypes_onceToken != -1)
    dispatch_once(&NEInitCFTypes_onceToken, &__block_literal_global_22195);
  v0 = objc_alloc_init(NENetworkPropertiesCache);
  v1 = (void *)sharedCache_g_cache;
  sharedCache_g_cache = (uint64_t)v0;

}

@end
