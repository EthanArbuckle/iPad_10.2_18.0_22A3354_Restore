@implementation PHImportUrlSource

- (PHImportUrlSource)initWithUrls:(id)a3
{
  id v4;
  PHImportUrlSource *v5;
  uint64_t v6;
  NSArray *urls;
  uint64_t v8;
  NSMutableSet *accessedURLs;
  void *v10;
  uint64_t v11;
  NSString *prefix;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *pendingAssetDataRequestQueue;
  NSObject *v23;
  NSObject *v24;
  dispatch_queue_t v25;
  OS_dispatch_queue *activeAssetDataRequestQueue;
  dispatch_semaphore_t v27;
  OS_dispatch_semaphore *concurrentAssetDataRequestSemaphore;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = -[PHImportSource init](self, "init");
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      -[PHImportSource setItems:](v5, "setItems:", v6);
      urls = v5->_urls;
      v5->_urls = (NSArray *)v6;

      v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v4, "count"));
      accessedURLs = v5->_accessedURLs;
      v5->_accessedURLs = (NSMutableSet *)v8;

      -[PHImportUrlSource rootUrlOfUrls:](v5, "rootUrlOfUrls:", v5->_urls);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "path");
      v11 = objc_claimAutoreleasedReturnValue();
      prefix = v5->_prefix;
      v5->_prefix = (NSString *)v11;

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = v4;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if ((-[NSMutableSet containsObject:](v5->_accessedURLs, "containsObject:", v18, (_QWORD)v30) & 1) == 0
              && objc_msgSend(v18, "startAccessingSecurityScopedResource"))
            {
              -[NSMutableSet addObject:](v5->_accessedURLs, "addObject:", v18);
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
        }
        while (v15);
      }

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v19 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v19, QOS_CLASS_USER_INITIATED, -1);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_queue_create("com.apple.photos.import.urlsource.pendingassetrequests", v20);
      pendingAssetDataRequestQueue = v5->_pendingAssetDataRequestQueue;
      v5->_pendingAssetDataRequestQueue = (OS_dispatch_queue *)v21;

      dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v23 = objc_claimAutoreleasedReturnValue();
      dispatch_queue_attr_make_with_qos_class(v23, QOS_CLASS_USER_INITIATED, 0);
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = dispatch_queue_create("com.apple.photos.import.urlsource.activeassetrequests", v24);
      activeAssetDataRequestQueue = v5->_activeAssetDataRequestQueue;
      v5->_activeAssetDataRequestQueue = (OS_dispatch_queue *)v25;

      if (PHImportConcurrencyLimit_onceToken != -1)
        dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4570);
      v27 = dispatch_semaphore_create(PHImportConcurrencyLimit_concurrencyLimit);
      concurrentAssetDataRequestSemaphore = v5->_concurrentAssetDataRequestSemaphore;
      v5->_concurrentAssetDataRequestSemaphore = (OS_dispatch_semaphore *)v27;

    }
  }
  else
  {

    v5 = 0;
  }

  return v5;
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  PHImportException *v19;
  uint64_t v20;
  BOOL v21;
  id *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v24 = (id)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource resourcePathsInUrls:](self, "resourcePathsInUrls:", self->_urls);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v26;
    v23 = a3;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v26 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10, v23);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[PHValidator mediaTypeForURL:](PHValidator, "mediaTypeForURL:", v11);

        if (v12 <= 0x20 && ((1 << v12) & 0x100010004) != 0)
          goto LABEL_21;
        v14 = (void *)MEMORY[0x1E0D752F0];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "typeForURL:error:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if ((PFIsLivePhotoBundleType() & 1) != 0
          || (objc_msgSend(MEMORY[0x1E0D750B8], "contentType"),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              v18 = objc_msgSend(v16, "conformsToType:", v17),
              v17,
              (v18 & 1) != 0))
        {

LABEL_21:
          v21 = 1;
          goto LABEL_22;
        }
        if (v12 <= 1)
        {
          v19 = -[PHImportException initWithType:path:underlyingError:file:line:]([PHImportException alloc], "initWithType:path:underlyingError:file:line:", 1, v10, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportUrlSource.m", 92);
          objc_msgSend(v24, "addObject:", v19);

        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      a3 = v23;
      if (v7)
        continue;
      break;
    }
  }

  v20 = objc_msgSend(v24, "count");
  v21 = 0;
  if (a3 && v20)
  {
    v21 = 0;
    *a3 = objc_retainAutorelease(v24);
  }
LABEL_22:

  return v21;
}

- (void)dealloc
{
  NSMutableSet *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_accessedURLs;
  v4 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "stopAccessingSecurityScopedResource");
      }
      while (v5 != v7);
      v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)PHImportUrlSource;
  -[PHImportUrlSource dealloc](&v8, sel_dealloc);
}

- (BOOL)isEqualToImportUrlSource:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  BOOL v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  objc_msgSend(v4, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  if (v6 == -[NSArray count](self->_urls, "count"))
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __46__PHImportUrlSource_isEqualToImportUrlSource___block_invoke;
    v9[3] = &unk_1E35D8CA8;
    v9[4] = self;
    v9[5] = &v10;
    objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);
    v7 = *((_BYTE *)v11 + 24) != 0;
  }
  else
  {
    v7 = 0;
    *((_BYTE *)v11 + 24) = 0;
  }

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PHImportUrlSource *v4;
  BOOL v5;

  v4 = (PHImportUrlSource *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[PHImportUrlSource isEqualToImportUrlSource:](self, "isEqualToImportUrlSource:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_urls, "hash");
}

- (id)resourcePathsInUrls:(id)a3
{
  id v3;
  char **v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v12;
  void *v13;
  FTS *v14;
  FTSENT *v15;
  FTSENT *v16;
  void *v17;
  void *v18;
  int fts_info;
  void *v20;
  char v21;
  void *v22;
  int v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  int v32;
  uint64_t v33;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  void *v44;
  __int16 v45;
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (char **)malloc_type_malloc(8 * objc_msgSend(v3, "count") + 8, 0x10040436913F5uLL);
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "path");
        v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        (&v4[v8])[i] = (char *)objc_msgSend(v11, "fileSystemRepresentation");

      }
      v8 += i;
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v4[v8] = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 100000);
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", 100000);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportSource setFolders:](self, "setFolders:", v12);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = fts_open(v4, 92, 0);
  v34 = *MEMORY[0x1E0C99A00];
  v33 = *MEMORY[0x1E0CEC540];
  while (1)
  {
    v15 = fts_read(v14);
    if (!v15)
      break;
    v16 = v15;
    if (v15->fts_info != 10)
    {
      objc_msgSend(v13, "stringWithFileSystemRepresentation:length:", v15->fts_path, strlen(v15->fts_path));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      fts_info = v16->fts_info;
      if (fts_info == 1)
      {
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v17);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 0;
        v38 = 0;
        v23 = objc_msgSend(v22, "getResourceValue:forKey:error:", &v38, v34, &v37);
        v24 = v38;
        v25 = v37;
        if (v23)
        {
          if (objc_msgSend(v24, "BOOLValue"))
          {
            fts_set(v14, v16, 4);
            objc_msgSend(MEMORY[0x1E0D752F0], "typeForURL:error:", v22, 0);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v26, "conformsToType:", v33) & 1) != 0
              || (objc_msgSend(MEMORY[0x1E0D750B8], "contentType"),
                  v27 = (void *)objc_claimAutoreleasedReturnValue(),
                  v32 = objc_msgSend(v26, "conformsToType:", v27),
                  v27,
                  v32))
            {
              v28 = v36;
              goto LABEL_27;
            }
            -[PHImportSource folders](self, "folders");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "addObject:", v18);

LABEL_28:
            goto LABEL_29;
          }
        }
        else
        {
          PLImportGetLog();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v44 = v22;
            v45 = 2112;
            v46 = v25;
            _os_log_impl(&dword_1991EC000, v29, OS_LOG_TYPE_DEBUG, "Could not determine if url: %@ is a package. Continuing as folder. Error: %@", buf, 0x16u);
          }

        }
        -[PHImportSource folders](self, "folders");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v28;
LABEL_27:
        objc_msgSend(v28, "addObject:", v18);
        goto LABEL_28;
      }
      if (fts_info == 11 || fts_info == 8)
      {
        objc_msgSend(v17, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v20, "hasPrefix:", CFSTR("."));

        if ((v21 & 1) == 0)
          objc_msgSend(v36, "addObject:", v18);
      }
LABEL_29:

    }
  }
  fts_close(v14);
  free(v4);

  return v36;
}

- (void)beginProcessingWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSDictionary *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *resourcePathsByIdentifier;
  NSDictionary *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[PHImportUrlSource urls](self, "urls");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    _PFAssertFailHandler();
  v25 = (void *)v6;
  -[PHImportUrlSource setIsReadonlyVolume:](self, "setIsReadonlyVolume:", +[PHImportUrlSource treatAsReadonlyVolume:](PHImportUrlSource, "treatAsReadonlyVolume:", v6));
  -[PHImportUrlSource urls](self, "urls");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource resourcePathsInUrls:](self, "resourcePathsInUrls:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v8, "count"));
  v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v15, "stringByDeletingPathExtension");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](v9, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (unint64_t)objc_msgSend(v10, "count") >> 1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v17, v16);
        }
        objc_msgSend(v17, "addObject:", v15);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v12);
  }

  resourcePathsByIdentifier = self->_resourcePathsByIdentifier;
  self->_resourcePathsByIdentifier = v9;
  v19 = v9;

  -[NSDictionary allKeys](self->_resourcePathsByIdentifier, "allKeys");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = (void *)objc_msgSend(v20, "mutableCopy");
  -[PHImportSource setItems:](self, "setItems:", v21);

  -[PHImportSource items](self, "items");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "count");
  -[PHImportSource progress](self, "progress");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTotalUnitCount:", v23);

  v4[2](v4);
}

- (id)assetsByProcessingItem:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_resourcePathsByIdentifier, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImportAsset assetFileForURL:source:](PHImportAsset, "assetFileForURL:source:", v12, self);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          if (objc_msgSend(v13, "isSidecar"))
          {
            if (objc_msgSend(v13, "resourceSubType") != 512)
              objc_msgSend(v18, "insertObject:atIndex:", v13, 0);
          }
          else
          {
            objc_msgSend(v18, "addObject:", v13);
          }
        }
        else
        {
          objc_msgSend(v11, "lastPathComponent");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 1, v14, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportUrlSource.m", 250);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  if (objc_msgSend(v18, "count"))
  {
    -[PHImportSource processAssets:](self, "processAssets:", v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)endWork
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  dispatch_time_t v7;
  NSObject *v8;
  id v9;
  objc_super v10;
  _QWORD block[5];
  id v12;
  _QWORD v13[4];
  id v14;

  v3 = (void *)objc_opt_new();
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __28__PHImportUrlSource_endWork__block_invoke;
  v13[3] = &unk_1E35DF110;
  v5 = v3;
  v14 = v5;
  -[PHImportSource progress](self, "progress");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCancellationHandler:", v13);

  v7 = dispatch_time(0, 2000000000);
  dispatch_get_global_queue(17, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = v4;
  block[1] = 3221225472;
  block[2] = __28__PHImportUrlSource_endWork__block_invoke_2;
  block[3] = &unk_1E35DF9E8;
  block[4] = self;
  v12 = v5;
  v9 = v5;
  dispatch_after(v7, v8, block);

  v10.receiver = self;
  v10.super_class = (Class)PHImportUrlSource;
  -[PHImportSource endWork](&v10, sel_endWork);

}

- (id)name
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource prefix](self, "prefix");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayNameAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)productKind
{
  return CFSTR("Folder");
}

- (id)path
{
  return self->_prefix;
}

- (BOOL)isAvailable
{
  void *v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  NSObject *v8;
  NSString *prefix;
  id v11;
  id v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", self->_prefix);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v4 = *MEMORY[0x1E0C99C40];
  v11 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v12, v4, &v11);
  v6 = v12;
  v7 = v11;

  if ((v5 & 1) == 0)
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      prefix = self->_prefix;
      *(_DWORD *)buf = 138412290;
      v14 = prefix;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEBUG, "Volume for path '%@' does not exist", buf, 0xCu);
    }

  }
  return v6 != 0;
}

- (id)volumePath
{
  return self->_prefix;
}

- (BOOL)canReference
{
  return 1;
}

- (void)dispatchAssetDataRequestAsyncUsingBlock:(id)a3
{
  id v4;
  NSObject *pendingAssetDataRequestQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  pendingAssetDataRequestQueue = self->_pendingAssetDataRequestQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke;
  v7[3] = &unk_1E35DF368;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(pendingAssetDataRequestQueue, v7);

}

- (id)rootUrlOfUrls:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(v3, "subarrayWithRange:", 1, objc_msgSend(v3, "count", 0) - 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v12 = v5;
        while (1)
        {
          objc_msgSend(v11, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "hasPrefix:", v12);

          if ((v14 & 1) != 0)
            break;
          objc_msgSend(v12, "stringByDeletingLastPathComponent");
          v5 = (void *)objc_claimAutoreleasedReturnValue();

          v12 = v5;
          if (objc_msgSend(v5, "isEqualToString:", CFSTR("/")))
            goto LABEL_11;
        }
        v5 = v12;
LABEL_11:
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)prefix
{
  return self->_prefix;
}

- (void)setPrefix:(id)a3
{
  objc_storeStrong((id *)&self->_prefix, a3);
}

- (NSArray)urls
{
  return self->_urls;
}

- (void)setUrls:(id)a3
{
  objc_storeStrong((id *)&self->_urls, a3);
}

- (BOOL)isReadonlyVolume
{
  return self->_isReadonlyVolume;
}

- (void)setIsReadonlyVolume:(BOOL)a3
{
  self->_isReadonlyVolume = a3;
}

- (NSDictionary)resourcePathsByIdentifier
{
  return self->_resourcePathsByIdentifier;
}

- (void)setResourcePathsByIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_resourcePathsByIdentifier, a3);
}

- (NSArray)baseNames
{
  return self->_baseNames;
}

- (void)setBaseNames:(id)a3
{
  objc_storeStrong((id *)&self->_baseNames, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseNames, 0);
  objc_storeStrong((id *)&self->_resourcePathsByIdentifier, 0);
  objc_storeStrong((id *)&self->_urls, 0);
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_accessedURLs, 0);
  objc_storeStrong((id *)&self->_concurrentAssetDataRequestSemaphore, 0);
  objc_storeStrong((id *)&self->_activeAssetDataRequestQueue, 0);
  objc_storeStrong((id *)&self->_pendingAssetDataRequestQueue, 0);
}

void __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  id v4;
  _QWORD v5[5];
  id v6;

  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 344), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 336);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke_2;
  v5[3] = &unk_1E35DF368;
  v4 = v2;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v4;
  dispatch_async(v3, v5);

}

intptr_t __61__PHImportUrlSource_dispatchAssetDataRequestAsyncUsingBlock___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(a1 + 32) + 344));
}

uint64_t __28__PHImportUrlSource_endWork__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (v1)
    *(_BYTE *)(v1 + 8) = 1;
  return result;
}

void __28__PHImportUrlSource_endWork__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v5[5];

  objc_msgSend(*(id *)(a1 + 32), "assets");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");
  if (PHImportConcurrencyLimit_onceToken != -1)
    dispatch_once(&PHImportConcurrencyLimit_onceToken, &__block_literal_global_4570);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __28__PHImportUrlSource_endWork__block_invoke_3;
  v5[3] = &unk_1E35D8CD0;
  v4 = *(_QWORD *)(a1 + 40);
  v5[4] = *(_QWORD *)(a1 + 32);
  +[PHImportController dispatchApply:withConcurrencyLimit:canceler:ofBlock:](PHImportController, "dispatchApply:withConcurrencyLimit:canceler:ofBlock:", v3, PHImportConcurrencyLimit_concurrencyLimit, v4, v5);

}

void __28__PHImportUrlSource_endWork__block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "assets");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "loadMetadataSync");

}

void __46__PHImportUrlSource_isEqualToImportUrlSource___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 376);
  v8 = a2;
  objc_msgSend(v7, "objectAtIndexedSubscript:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  resourceIdentifierForURL(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  resourceIdentifierForURL(v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isEqual:", v10) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }

}

+ (BOOL)treatAsReadonlyVolume:(id)a3
{
  uint64_t v3;
  int v4;
  id v5;
  id v6;
  char v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v3 = *MEMORY[0x1E0C99C08];
  v10 = 0;
  v4 = objc_msgSend(a3, "getResourceValue:forKey:error:", &v11, v3, &v10);
  v5 = v11;
  v6 = v10;
  if (v4)
  {
    v7 = objc_msgSend(v5, "BOOLValue");
  }
  else
  {
    PLImportGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v6;
      _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Unable to value for key 'NSURLVolumeIsReadOnlyKey': %@", buf, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

@end
