@implementation GEOConfigStorageDirectReadOnly

- (id)getConfigValueForKey:(id)a3 countryCode:(id)a4 options:(unint64_t)a5 source:(int64_t *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  void *v12;

  v9 = a3;
  v10 = a4;
  os_unfair_lock_lock_with_options();
  if (v9)
  {
    GEOConfig_getCountryAwareValueForKeyFromDictionary(v10, v9, self->_valueStore);
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = -[NSMutableDictionary copy](self->_valueStore, "copy");
  }
  v12 = (void *)v11;
  os_unfair_lock_unlock(&self->_valueStoreLock);
  if (a6 && v12)
    *a6 = self->_source;

  return v12;
}

- (GEOConfigStorageDirectReadOnly)initWithPath:(id)a3 forSource:(int64_t)a4
{
  id v6;
  GEOConfigStorageDirectReadOnly *v7;
  GEOConfigStorageDirectReadOnly *v8;
  uint64_t v9;
  NSMutableDictionary *valueStore;
  uint64_t v11;
  NSURL *path;
  GEOConfigStorageDirectReadOnly *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOConfigStorageDirectReadOnly;
  v7 = -[GEOConfigStorageDirectReadOnly init](&v15, sel_init);
  v8 = v7;
  if (!v7)
    goto LABEL_3;
  v7->_valueStoreLock._os_unfair_lock_opaque = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = objc_claimAutoreleasedReturnValue();
  valueStore = v8->_valueStore;
  v8->_valueStore = (NSMutableDictionary *)v9;

  v11 = objc_msgSend(v6, "copy");
  path = v8->_path;
  v8->_path = (NSURL *)v11;

  v8->_source = a4;
  if (!-[GEOConfigStorageDirectReadOnly _readStore]((uint64_t)v8))
    v13 = 0;
  else
LABEL_3:
    v13 = v8;

  return v13;
}

- (uint64_t)_readStore
{
  uint64_t v1;
  unsigned __int8 *v2;
  unsigned __int8 v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  id v23;
  id v24;
  id v25;
  unsigned __int8 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = result;
    v2 = (unsigned __int8 *)(result + 40);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(1u, v2));
    if ((v3 & 1) != 0)
      return 0;
    v4 = *(_QWORD *)(result + 16);
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v4, 1, &v25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v25;
    if (objc_msgSend(v5, "length"))
    {
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v5, 1, 0, &v24);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v24;

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        os_unfair_lock_lock_with_options();
        objc_storeStrong((id *)(v1 + 32), v7);
        os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
      }
      else
      {
        j__GEOGetUserDefaultsLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = *(_QWORD *)(v1 + 16);
          *(_DWORD *)buf = 138412546;
          v28 = v13;
          v29 = 2112;
          v30 = v8;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Unable to parse direct store at %@: %@", buf, 0x16u);
        }

        if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
        {
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = *(_QWORD *)(v1 + 16);
          v23 = v8;
          v16 = objc_msgSend(v14, "removeItemAtURL:error:", v15, &v23);
          v6 = v23;

          if ((v16 & 1) == 0)
          {
            j__GEOGetUserDefaultsLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              v18 = *(_QWORD *)(v1 + 16);
              *(_DWORD *)buf = 138412546;
              v28 = v18;
              v29 = 2112;
              v30 = v6;
              _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Unable to remove corrupt store at %@: %@", buf, 0x16u);
            }

          }
          goto LABEL_28;
        }
      }
      v6 = v8;
LABEL_28:

      goto LABEL_29;
    }
    if (!v6)
    {
LABEL_29:
      atomic_store(0, v2);
      v22 = 1;
      goto LABEL_30;
    }
    objc_msgSend(v6, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CB28A8];
    if (objc_msgSend(v9, "isEqual:", *MEMORY[0x1E0CB28A8]))
    {
      v11 = objc_msgSend(v6, "code");

      if (v11 == 260)
      {
LABEL_25:
        objc_msgSend(v6, "domain");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v7, "isEqual:", v10))
          goto LABEL_28;
        v21 = objc_msgSend(v6, "code");

        if (v21 == 257)
        {
          v22 = 0;
LABEL_30:
          v26 = v22;

          return v26;
        }
        goto LABEL_29;
      }
    }
    else
    {

    }
    j__GEOGetUserDefaultsLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = *(_QWORD *)(v1 + 16);
      *(_DWORD *)buf = 138412546;
      v28 = v20;
      v29 = 2112;
      v30 = v6;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Unable to read direct store at %@: %@", buf, 0x16u);
    }

    goto LABEL_25;
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueStore, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

@end
