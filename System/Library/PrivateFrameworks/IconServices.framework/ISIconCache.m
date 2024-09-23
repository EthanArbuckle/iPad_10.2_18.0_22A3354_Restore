@implementation ISIconCache

- (id)storeUnitForUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ISIconCache store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unitForUUID:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (ISStore)store
{
  return self->_store;
}

- (BOOL)findStoreUnitForIcon:(id)a3 descriptor:(id)a4 UUID:(id *)a5 validationToken:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSObject *v26;
  const char *v27;
  NSObject *v28;
  _BOOL4 v29;
  void *v30;
  const char *v31;
  void *v32;
  _QWORD v34[9];
  unsigned int v35;
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
  uint64_t v48;
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  id v52;
  _QWORD v53[2];
  _QWORD v54[3];

  v54[2] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v48 = 0;
  v54[0] = 0;
  v54[1] = 0;
  objc_msgSend(v10, "digest");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_IF_getUUIDBytes:hash64:", v54, &v48);

  objc_msgSend(v11, "scale");
  v14 = v13;
  objc_msgSend(v11, "size");
  v16 = v15;
  objc_msgSend(v11, "digest");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = 0;
  v53[1] = 0;
  objc_msgSend(v17, "getUUIDBytes:", v53);
  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__2;
  v46 = __Block_byref_object_dispose__2;
  v47 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  _ISDefaultLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v50 = (const char *)v10;
    v51 = 2112;
    v52 = v11;
    _os_log_impl(&dword_1AA928000, v18, OS_LOG_TYPE_INFO, "STORE_LOOKUP: %@ - %@", buf, 0x16u);
  }

  if (v11)
  {
    _ISPrepareISIconSignpostLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_signpost_enabled(v19);

    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "STORE_LOOKUP: %@ - %@");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v21, v10, v11);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_eventPrepareISIconSignpost:message:", v11, v22);

    }
  }
  -[ISIconCache storeIndex](self, "storeIndex");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke;
  v34[3] = &unk_1E58010E8;
  v35 = v14;
  v34[6] = v16;
  v34[7] = v53;
  v34[8] = v54;
  v34[4] = &v42;
  v34[5] = &v36;
  objc_msgSend(v23, "enumerateValuesForUUID:bock:", v54, v34);

  v24 = (void *)v43[5];
  if (v24 && v37[5])
  {
    *a5 = (id)objc_msgSend(v24, "copy");
    *a6 = (id)objc_msgSend((id)v37[5], "copy");
    v25 = 1;
  }
  else
  {
    v25 = 0;
  }
  _ISDefaultLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = "not-found";
    if (v25)
      v27 = "found";
    *(_DWORD *)buf = 136315138;
    v50 = v27;
    _os_log_impl(&dword_1AA928000, v26, OS_LOG_TYPE_INFO, "STORE_LOOKUP_RESULT: %s", buf, 0xCu);
  }

  if (v11)
  {
    _ISPrepareISIconSignpostLog();
    v28 = objc_claimAutoreleasedReturnValue();
    v29 = os_signpost_enabled(v28);

    if (v29)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "STORE_LOOKUP_RESULT: %s");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = "not-found";
      if (v25)
        v31 = "found";
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v30, v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "_eventPrepareISIconSignpost:message:", v11, v32);

    }
  }
  _Block_object_dispose(&v36, 8);

  _Block_object_dispose(&v42, 8);
  return v25;
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  double v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;

  if (*(_DWORD *)(a1 + 72) != *(_DWORD *)(a2 + 40)
    || (v5 = *(double *)(a1 + 48), v5 < *(double *)(a2 + 16))
    || v5 > *(double *)(a2 + 24))
  {
    _ISDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
LABEL_6:

    return;
  }
  if (uuid_compare((const unsigned __int8 *)(a2 + 44), *(const unsigned __int8 **)(a1 + 56)))
  {
    _ISDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_3(v6, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_6;
  }
  if (uuid_compare((const unsigned __int8 *)a2, *(const unsigned __int8 **)(a1 + 64)))
  {
    _ISDefaultLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_2(v6, v22, v23, v24, v25, v26, v27, v28);
    goto LABEL_6;
  }
  v29 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", a2 + 60);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v31 = *(void **)(v30 + 40);
  *(_QWORD *)(v30 + 40) = v29;

  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", a2 + 76, 40);
  v32 = objc_claimAutoreleasedReturnValue();
  v33 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v34 = *(void **)(v33 + 40);
  *(_QWORD *)(v33 + 40) = v32;

  *a3 = 1;
}

- (ISStoreIndex)storeIndex
{
  return self->_storeIndex;
}

- (NSURL)cacheURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (ISIconCache)initWithConfiguration:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  ISStoreIndex *v10;
  ISIconCache *v11;

  v4 = a3;
  objc_msgSend(v4, "sandboxExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
  {
    objc_msgSend(v4, "sandboxExtension");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v7, "UTF8String");
    v6 = sandbox_extension_consume();

  }
  objc_msgSend(v4, "url");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("store.index"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[ISStoreIndex initWithStoreFileURL:]([ISStoreIndex alloc], "initWithStoreFileURL:", v9);
  v11 = -[ISIconCache initWithURL:storeIndex:sandboxExtensionToken:](self, "initWithURL:storeIndex:sandboxExtensionToken:", v8, v10, v6);

  return v11;
}

- (ISIconCache)initWithURL:(id)a3 storeIndex:(id)a4 sandboxExtensionToken:(unint64_t)a5
{
  id v9;
  id v10;
  ISIconCache *v11;
  ISIconCache *v12;
  ISStore *v13;
  ISStore *store;
  objc_super v16;

  v9 = a3;
  v10 = a4;
  v16.receiver = self;
  v16.super_class = (Class)ISIconCache;
  v11 = -[ISIconCache init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_sandboxToken = a5;
    objc_storeStrong((id *)&v11->_cacheURL, a3);
    objc_storeStrong((id *)&v12->_storeIndex, a4);
    v13 = -[ISStore initWithURL:]([ISStore alloc], "initWithURL:", v9);
    store = v12->_store;
    v12->_store = v13;

  }
  return v12;
}

+ (id)defaultIconCache
{
  if (+[ISIconCache defaultIconCache]::onceToken != -1)
    dispatch_once(&+[ISIconCache defaultIconCache]::onceToken, &__block_literal_global_33);
  return (id)+[ISIconCache defaultIconCache]::defaultIconCache;
}

void __31__ISIconCache_defaultIconCache__block_invoke()
{
  void *v0;
  void *v1;
  ISIconCache *v2;
  void *v3;
  ISIconCacheConfiguration *v4;

  v4 = objc_alloc_init(ISIconCacheConfiguration);
  +[ISDefaults sharedInstance](ISDefaults, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "cacheURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIconCacheConfiguration setUrl:](v4, "setUrl:", v1);

  v2 = -[ISIconCache initWithConfiguration:]([ISIconCache alloc], "initWithConfiguration:", v4);
  v3 = (void *)+[ISIconCache defaultIconCache]::defaultIconCache;
  +[ISIconCache defaultIconCache]::defaultIconCache = (uint64_t)v2;

}

- (void)dealloc
{
  objc_super v3;

  sandbox_extension_release();
  v3.receiver = self;
  v3.super_class = (Class)ISIconCache;
  -[ISIconCache dealloc](&v3, sel_dealloc);
}

- (NSString)cachePath
{
  return -[NSURL path](self->_cacheURL, "path");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ISIconCache cachePath](self, "cachePath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Cache path: %@\n"), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), self->_storeIndex);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (unint64_t)sandboxToken
{
  return self->_sandboxToken;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_storeIndex, 0);
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, a1, a3, "No match: size & scalse", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, a1, a3, "No match: icon digest", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

void __76__ISIconCache_lookup__findStoreUnitForIcon_descriptor_UUID_validationToken___block_invoke_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AA928000, a1, a3, "No match: image descriptor", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_1();
}

@end
