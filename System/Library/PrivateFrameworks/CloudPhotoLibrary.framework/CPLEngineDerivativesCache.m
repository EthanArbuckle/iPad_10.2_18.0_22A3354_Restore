@implementation CPLEngineDerivativesCache

- (CPLEngineDerivativesCache)initWithCacheURL:(id)a3
{
  id v4;
  CPLEngineDerivativesCache *v5;
  uint64_t v6;
  NSURL *cacheURL;
  uint64_t v8;
  NSURL *cacheMappingURL;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLEngineDerivativesCache;
  v5 = -[CPLEngineDerivativesCache init](&v13, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    cacheURL = v5->_cacheURL;
    v5->_cacheURL = (NSURL *)v6;

    -[NSURL URLByAppendingPathComponent:isDirectory:](v5->_cacheURL, "URLByAppendingPathComponent:isDirectory:", CFSTR("entries.plist"), 0);
    v8 = objc_claimAutoreleasedReturnValue();
    cacheMappingURL = v5->_cacheMappingURL;
    v5->_cacheMappingURL = (NSURL *)v8;

    v5->_tryCreatingCacheFolder = 1;
    v10 = dispatch_queue_create("com.apple.cpl.derivativescache", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v10;

  }
  return v5;
}

- (void)discardCache
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeItemAtURL:error:", self->_cacheURL, 0);

  self->_tryCreatingCacheFolder = 1;
}

- (id)_cacheKeyForReferenceResource:(id)a3 adjustments:(id)a4 includePosterFrame:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;

  v5 = a5;
  v7 = a4;
  v8 = a3;
  objc_msgSend(v8, "itemScopedIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_alloc(MEMORY[0x1E0CB3940]);
  objc_msgSend(v9, "scopeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "fingerPrint");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v7)
  {
    objc_msgSend(v7, "otherAdjustmentsFingerprint");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v18 = "no-poster";
      if (v5)
        v18 = "";
      v19 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@-%@-%@-%@%s"), v11, v12, v15, v16, v18);
    }
    else
    {
      objc_msgSend(v7, "similarToOriginalAdjustmentsFingerprint");
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = (void *)v21;
      v23 = "no-poster";
      if (v5)
        v23 = "";
      v19 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@-%@-%@-%@%s"), v11, v12, v15, v21, v23);

    }
  }
  else
  {
    v20 = "no-poster";
    if (v5)
      v20 = "";
    v19 = (void *)objc_msgSend(v10, "initWithFormat:", CFSTR("%@-%@-%@%s"), v11, v12, v14, v20);
  }

  return v19;
}

- (id)_folderNameForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  void *v5;
  void *v6;

  -[CPLEngineDerivativesCache _cacheKeyForReferenceResource:adjustments:includePosterFrame:](self, "_cacheKeyForReferenceResource:adjustments:includePosterFrame:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_createCacheFolderIfNecessary
{
  void *v3;

  if (self->_tryCreatingCacheFolder)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", self->_cacheURL, 0, 0, 0);

    self->_tryCreatingCacheFolder = 0;
  }
}

- (id)_tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;

  -[CPLEngineDerivativesCache _folderNameForReferenceResource:adjustment:includePosterFrame:](self, "_folderNameForReferenceResource:adjustment:includePosterFrame:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingString:", CFSTR("~~tmp"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_cacheURL, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_finalFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  void *v6;
  void *v7;

  -[CPLEngineDerivativesCache _folderNameForReferenceResource:adjustment:includePosterFrame:](self, "_folderNameForReferenceResource:adjustment:includePosterFrame:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_cacheURL, "URLByAppendingPathComponent:isDirectory:", v6, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tempFolderURLForGeneratedResourcesWithReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[CPLEngineDerivativesCache _tempFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:](self, "_tempFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeItemAtURL:error:", v6, 0);

  -[CPLEngineDerivativesCache _createCacheFolderIfNecessary](self, "_createCacheFolderIfNecessary");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v6, 0, 0, &v14);
  v10 = v14;

  if ((v9 & 1) == 0 && !_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v6, "path");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v12;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1B03C2000, v11, OS_LOG_TYPE_ERROR, "Can't create derivatives folder at %@: %@", buf, 0x16u);

    }
  }

  return v6;
}

- (void)noteGeneratedResouces:(id)a3 haveBeenGeneratedForReferenceResource:(id)a4 adjustment:(id)a5 includePosterFrame:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t buf[4];
  id v46;
  _BYTE v47[128];
  uint64_t v48;

  v6 = a6;
  v48 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  -[CPLEngineDerivativesCache _finalFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:](self, "_finalFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:", v11, v12, v6);
  v13 = objc_claimAutoreleasedReturnValue();
  -[CPLEngineDerivativesCache _tempFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:](self, "_tempFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:", v11, v12, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "removeItemAtURL:error:", v13, 0);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  v17 = (void *)v13;
  v18 = objc_msgSend(v16, "moveItemAtURL:toURL:error:", v14, v13, &v44);
  v19 = v44;

  if (v18)
  {
    v34 = v19;
    v35 = v14;
    v36 = v12;
    v37 = v11;
    v20 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v38 = v10;
    obj = v10;
    v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v25, "identity", v34, v35, v36, v37);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "fileURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v27, "lastPathComponent");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", v28, 0);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v25, "identity");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "setFileURL:", v29);

          v31 = (void *)objc_msgSend(v25, "copy");
          objc_msgSend(v31, "setItemScopedIdentifier:", 0);
          +[CPLArchiver archivedPropertyListWithRootObject:](CPLArchiver, "archivedPropertyListWithRootObject:", v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject addObject:](v20, "addObject:", v32);

        }
        v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
      }
      while (v22);
    }

    objc_msgSend(v17, "URLByAppendingPathComponent:isDirectory:", CFSTR("entries.plist"), 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject writeToURL:atomically:](v20, "writeToURL:atomically:", v33, 1);

    v11 = v37;
    v10 = v38;
    v14 = v35;
    v12 = v36;
    v19 = v34;
LABEL_13:

    goto LABEL_14;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v46 = v19;
      _os_log_impl(&dword_1B03C2000, v20, OS_LOG_TYPE_ERROR, "Unable to cache generated derivatives: %@", buf, 0xCu);
    }
    goto LABEL_13;
  }
LABEL_14:

}

- (id)cachedResourcesForReferenceResource:(id)a3 adjustment:(id)a4 includePosterFrame:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  __objc2_meth_list **p_class_meths;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  void *v29;
  void *v30;
  id v31;
  id obj;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  id v41;
  _BYTE v42[128];
  uint64_t v43;

  v5 = a5;
  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  -[CPLEngineDerivativesCache _finalFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:](self, "_finalFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:", v8, a4, v5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "URLByAppendingPathComponent:isDirectory:", CFSTR("entries.plist"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithContentsOfURL:", v9);
  if (v10)
  {
    objc_msgSend(v8, "itemScopedIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    obj = v10;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
    if (v13)
    {
      v15 = v13;
      v29 = v10;
      v30 = v9;
      v31 = v8;
      v16 = *(_QWORD *)v35;
      while (2)
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v35 != v16)
            objc_enumerationMutation(obj);
          v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          +[CPLArchiver unarchivedObjectWithPropertyList:ofClass:](CPLArchiver, "unarchivedObjectWithPropertyList:ofClass:", v18, objc_opt_class());
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
          {

            p_class_meths = &OBJC_PROTOCOL___CPLNetworkWatcherDelegate.class_meths;
            v8 = v31;
            if (_CPLSilentLogging)
            {
              v12 = 0;
              v10 = v29;
              v9 = v30;
            }
            else
            {
              __CPLDerivativesOSLogDomain();
              v26 = objc_claimAutoreleasedReturnValue();
              v10 = v29;
              v9 = v30;
              if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v39 = v11;
                v40 = 2112;
                v41 = v18;
                _os_log_impl(&dword_1B03C2000, v26, OS_LOG_TYPE_ERROR, "Found incorrect cached resource for %@ for %@", buf, 0x16u);
              }

              v12 = 0;
            }
            goto LABEL_15;
          }
          v20 = v19;
          objc_msgSend(v19, "setItemScopedIdentifier:", v11);
          objc_msgSend(v20, "identity");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "fileURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "URLByAppendingPathComponent:isDirectory:", v23, 0);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v20, "identity");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "setFileURL:", v24);

          objc_msgSend(v12, "addObject:", v20);
        }
        v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v15)
          continue;
        break;
      }
      v9 = v30;
      v8 = v31;
      v10 = v29;
      p_class_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___CPLNetworkWatcherDelegate + 32);
    }
LABEL_15:

    if (!*((_BYTE *)p_class_meths + 3376))
    {
      __CPLDerivativesOSLogDomain();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v39 = v11;
        v40 = 2112;
        v41 = v12;
        _os_log_impl(&dword_1B03C2000, v27, OS_LOG_TYPE_DEBUG, "Found cached resource for %@: %@", buf, 0x16u);
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isUnsupportedFormatError:(id)a3
{
  id v4;

  v4 = a3;
  LOBYTE(self) = -[objc_class isUnsupportedOriginalFormatError:](-[CPLEngineDerivativesCache derivativeGeneratorClass](self, "derivativeGeneratorClass"), "isUnsupportedOriginalFormatError:", v4);

  return (char)self;
}

- (void)_updateChange:(id *)a3 fromOldChange:(id)a4 withResources:(id)a5 excludeImages:(BOOL)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  _CPLResourcesMutableArray *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v6 = a6;
  v25 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  if (!*a3)
  {
    v11 = [_CPLResourcesMutableArray alloc];
    objc_msgSend(v9, "resources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *a3 = -[_CPLResourcesMutableArray initWithResources:](v11, "initWithResources:", v12);

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v17);
        if (!v6
          || (unint64_t)(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v17), "resourceType", (_QWORD)v20) - 6) <= 0xFFFFFFFFFFFFFFFCLL)
        {
          objc_msgSend(v18, "identity", (_QWORD)v20);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setAvailable:", 1);

          objc_msgSend(*a3, "addResource:", v18);
        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

}

- (BOOL)_checkResource:(id)a3 name:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "identity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fileURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "fileExistsAtPath:", v12);

  if ((v13 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      __CPLDerivativesOSLogDomain();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v24 = v15;
        v25 = 2112;
        v26 = v8;
        v27 = 2112;
        v28 = v7;
        _os_log_impl(&dword_1B03C2000, v14, OS_LOG_TYPE_ERROR, "Unable to find resoure at its expected place '%@' for %@ (%@)", buf, 0x20u);

      }
    }
    if (a5)
    {
      v16 = objc_alloc(MEMORY[0x1E0CB35C8]);
      v17 = *MEMORY[0x1E0CB28A8];
      objc_msgSend(v10, "path", *MEMORY[0x1E0CB2AA0]);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v18;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *a5 = (id)objc_msgSend(v16, "initWithDomain:code:userInfo:", v17, 4, v19);

    }
  }

  return v13;
}

- (BOOL)_checkGeneratedResources:(id)a3 error:(id *)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = a3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        +[CPLResource shortDescriptionForResourceType:](CPLResource, "shortDescriptionForResourceType:", objc_msgSend(v11, "resourceType", (_QWORD)v15));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v11) = -[CPLEngineDerivativesCache _checkResource:name:error:](self, "_checkResource:name:error:", v11, v12, a4);

        if (!(_DWORD)v11)
        {
          v13 = 0;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_11:

  return v13;
}

- (void)generateDerivativesForChange:(id)a3 derivativesFilter:(id)a4 fingerprintScheme:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  OS_dispatch_queue *queue;
  uint64_t v15;
  _QWORD *v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  dispatch_block_t v22;
  _QWORD v23[4];
  id v24;
  CPLEngineDerivativesCache *v25;
  id v26;
  id v27;
  id v28;
  _QWORD block[4];
  id v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  v15 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke;
  v23[3] = &unk_1E60D9828;
  v24 = v10;
  v25 = self;
  v27 = v11;
  v28 = v13;
  v26 = v12;
  v16 = v23;
  block[0] = v15;
  block[1] = 3221225472;
  block[2] = __cpl_dispatch_async_block_invoke_8407;
  block[3] = &unk_1E60D71F8;
  v30 = v16;
  v17 = queue;
  v18 = v11;
  v19 = v12;
  v20 = v13;
  v21 = v10;
  v22 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v17, v22);

}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (Class)derivativeGeneratorClass
{
  return self->_derivativeGeneratorClass;
}

- (void)setDerivativeGeneratorClass:(Class)a3
{
  objc_storeStrong((id *)&self->_derivativeGeneratorClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_derivativeGeneratorClass, 0);
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cacheMappingURL, 0);
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke(id *a1)
{
  int v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  id v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  NSObject *v37;
  id v38;
  const char *v39;
  NSObject *v40;
  uint32_t v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  uint64_t v49;
  void *v50;
  id v51;
  id *v52;
  int v53;
  NSObject *v54;
  CPLDerivativesGenerationStatistics *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  uint64_t v67;
  CPLDerivativesGenerationStatistics *v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  id v73;
  id v74;
  id v75;
  id v76;
  uint64_t v77;
  uint64_t (**v78)(_QWORD, _QWORD, _QWORD);
  unsigned int v79;
  id v80;
  _QWORD v81[4];
  id v82;
  id v83;
  CPLDerivativesGenerationStatistics *v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  uint64_t *v90;
  __int128 *v91;
  char v92;
  id obj;
  _QWORD v94[5];
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  uint64_t *v103;
  __int128 *v104;
  uint64_t v105;
  char v106;
  uint64_t v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t (*v110)(uint64_t, uint64_t);
  void (*v111)(uint64_t);
  id v112;
  _QWORD v113[4];
  id v114;
  id v115;
  id v116;
  id v117;
  _QWORD v118[5];
  id v119;
  id v120;
  _QWORD v121[5];
  id v122;
  id v123;
  __int128 *v124;
  uint8_t buf[4];
  void *v126;
  __int16 v127;
  uint64_t v128;
  __int16 v129;
  void *v130;
  __int128 v131;
  uint64_t v132;
  uint64_t (*v133)(uint64_t, uint64_t);
  void (*v134)(uint64_t);
  id v135;
  uint64_t v136;

  v136 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "isMasterChange");
  v3 = a1[4];
  if (!v2)
  {
    if (!objc_msgSend(v3, "isAssetChange"))
    {
      v80 = 0;
      v10 = 0;
      v15 = 0;
      v13 = 0;
      goto LABEL_76;
    }
    objc_msgSend(a1[4], "resourceForType:", 16);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[4], "adjustments");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v11 = v12;
      objc_msgSend(a1[4], "resourceForType:", 2);
      v10 = objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v79 = 1;
      v77 = 2;
      if (!v10)
      {
        v80 = (id)v11;
LABEL_37:
        objc_msgSend((id)v11, "identity");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "fileURL");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = v31 != 0;

        v15 = (void *)v11;
LABEL_38:
        *(_QWORD *)&v131 = 0;
        *((_QWORD *)&v131 + 1) = &v131;
        v132 = 0x3032000000;
        v133 = __Block_byref_object_copy__8410;
        v134 = __Block_byref_object_dispose__8411;
        v135 = 0;
        v121[0] = MEMORY[0x1E0C809B0];
        v121[1] = 3221225472;
        v121[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_37;
        v121[3] = &unk_1E60D9738;
        v121[4] = a1[5];
        v13 = v13;
        v122 = v13;
        v123 = a1[4];
        v124 = &v131;
        v78 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1B5E08DC4](v121);
        if (v14)
          v14 = v78[2](v78, v10, 1) ^ 1;
        if (v29)
          v29 = ((uint64_t (**)(_QWORD, void *, _QWORD))v78)[2](v78, v15, v79) ^ 1;
        if (((v14 | v29) & 1) == 0)
        {
          v42 = *(void **)(*((_QWORD *)&v131 + 1) + 40);
          if (v42)
          {
            objc_msgSend(v42, "allResources");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = (void *)objc_msgSend(a1[4], "copy");
            objc_msgSend(v44, "setResources:", v43);
            (*((void (**)(void))a1[8] + 2))();

          }
          else
          {
            (*((void (**)(void))a1[8] + 2))();
          }
LABEL_71:

          _Block_object_dispose(&v131, 8);
          goto LABEL_81;
        }
        v32 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v118[0] = MEMORY[0x1E0C809B0];
        v118[1] = 3221225472;
        v118[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_39;
        v118[3] = &unk_1E60D9760;
        v118[4] = a1[5];
        v74 = v13;
        v119 = v74;
        v33 = v32;
        v120 = v33;
        v72 = (void *)MEMORY[0x1B5E08DC4](v118);
        v34 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 2);
        v113[0] = MEMORY[0x1E0C809B0];
        v113[1] = 3221225472;
        v113[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2;
        v113[3] = &unk_1E60D9788;
        v114 = a1[4];
        v117 = a1[8];
        v35 = v34;
        v115 = v35;
        v76 = v33;
        v116 = v76;
        v36 = (void *)MEMORY[0x1B5E08DC4](v113);
        v107 = 0;
        v108 = &v107;
        v109 = 0x3032000000;
        v110 = __Block_byref_object_copy__8410;
        v111 = __Block_byref_object_dispose__8411;
        v112 = 0;
        if (v29)
        {
          if (v14)
          {
            if (!_CPLSilentLogging)
            {
              __CPLDerivativesOSLogDomain();
              v37 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                v38 = a1[4];
                *(_DWORD *)buf = 138412802;
                v126 = v38;
                v127 = 2112;
                v128 = v10;
                v129 = 2112;
                v130 = v15;
                v39 = "%@ has to generate image derivatives from %@ and video derivatives from %@";
                v40 = v37;
                v41 = 32;
LABEL_58:
                _os_log_impl(&dword_1B03C2000, v40, OS_LOG_TYPE_DEBUG, v39, buf, v41);
              }
LABEL_59:

            }
LABEL_60:
            v94[0] = MEMORY[0x1E0C809B0];
            v94[1] = 3221225472;
            v94[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_42;
            v94[3] = &unk_1E60D97D8;
            v106 = v14;
            v94[4] = a1[5];
            v95 = (id)v10;
            v103 = &v107;
            v47 = v72;
            v101 = v47;
            v48 = v74;
            v96 = v48;
            v97 = a1[6];
            v98 = a1[7];
            v105 = v77;
            v75 = v36;
            v102 = v75;
            v73 = v35;
            v99 = v73;
            v104 = &v131;
            v100 = a1[4];
            v49 = MEMORY[0x1B5E08DC4](v94);
            v50 = (void *)v49;
            if (v29)
            {
              v51 = a1[5];
              v52 = (id *)(v108 + 5);
              obj = (id)v108[5];
              v53 = objc_msgSend(v51, "_checkResource:name:error:", v15, CFSTR("baseVideoResource"), &obj);
              objc_storeStrong(v52, obj);
              if (v53)
              {
                if (!_CPLSilentLogging)
                {
                  __CPLDerivativesOSLogDomain();
                  v54 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412290;
                    v126 = v15;
                    _os_log_impl(&dword_1B03C2000, v54, OS_LOG_TYPE_DEBUG, "Generating video derivatives for %@", buf, 0xCu);
                  }

                }
                v55 = -[CPLDerivativesGenerationStatistics initWithSourceResource:]([CPLDerivativesGenerationStatistics alloc], "initWithSourceResource:", v15);
                (*((void (**)(id, void *, _QWORD))v47 + 2))(v47, v15, v79);
                v56 = (void *)objc_claimAutoreleasedReturnValue();
                v71 = (void *)objc_msgSend(a1[5], "derivativeGeneratorClass");
                v69 = a1[7];
                v70 = a1[6];
                v81[0] = MEMORY[0x1E0C809B0];
                v81[1] = 3221225472;
                v81[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_51;
                v81[3] = &unk_1E60D9800;
                v57 = v15;
                v58 = a1[5];
                v82 = v57;
                v83 = v58;
                v88 = v75;
                v68 = v55;
                v84 = v68;
                v85 = v73;
                v90 = &v107;
                v59 = v48;
                v92 = v79;
                v86 = v59;
                v91 = &v131;
                v87 = a1[4];
                v89 = v50;
                LOBYTE(v67) = v79;
                objc_msgSend(v71, "generateDerivativeResourcesFromInputResource:withAdjustments:destinationDirectory:fingerprintScheme:derivativesFilter:recordChangeType:includePosterFrameForVideo:completionHandler:", v57, v59, v56, v70, v69, v77, v67, v81);

              }
              else
              {
                (*((void (**)(id, _QWORD, uint64_t))v75 + 2))(v75, 0, v108[5]);
              }
            }
            else
            {
              (*(void (**)(uint64_t))(v49 + 16))(v49);
            }

            _Block_object_dispose(&v107, 8);
            goto LABEL_71;
          }
          if (_CPLSilentLogging)
            goto LABEL_60;
          __CPLDerivativesOSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            goto LABEL_59;
          v46 = a1[4];
          *(_DWORD *)buf = 138412546;
          v126 = v46;
          v127 = 2112;
          v128 = (uint64_t)v15;
          v39 = "%@ has to generate video derivatives from %@";
        }
        else
        {
          if (_CPLSilentLogging)
            goto LABEL_60;
          __CPLDerivativesOSLogDomain();
          v37 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
            goto LABEL_59;
          v45 = a1[4];
          *(_DWORD *)buf = 138412546;
          v126 = v45;
          v127 = 2112;
          v128 = v10;
          v39 = "%@ has to generate image derivatives from %@";
        }
        v40 = v37;
        v41 = 22;
        goto LABEL_58;
      }
      v80 = (id)v11;
      v15 = (void *)v11;
      v16 = 0;
LABEL_32:
      objc_msgSend((id)v10, "identity");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "fileURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v28 != 0;

      if ((v79 & 1) == 0)
      {
        v29 = 0;
        v79 = v16;
        goto LABEL_38;
      }
      v79 = v16;
      v11 = (unint64_t)v15;
      goto LABEL_37;
    }
    objc_msgSend(a1[4], "resourceForType:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v80 = v25;
      objc_msgSend(a1[4], "resourceForType:", 19);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 0;
      LOBYTE(v79) = v15 != 0;
      v77 = 2;
      v10 = (uint64_t)v80;
      goto LABEL_32;
    }
    if (!v13
      || objc_msgSend(v13, "adjustmentSourceType")
      || (objc_msgSend(a1[4], "resourceForType:", 1000),
          v62 = (void *)objc_claimAutoreleasedReturnValue(),
          (v80 = v62) == 0))
    {
      v80 = 0;
LABEL_75:
      v10 = 0;
      v15 = 0;
      goto LABEL_76;
    }
    objc_msgSend(v62, "identity");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "fileUTI");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (v64)
    {
      v79 = objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "isMovieUTI:", v64);
      if ((v79 & 1) != 0)
      {
        v10 = 0;
        v65 = v80;
        v11 = (unint64_t)v80;
      }
      else
      {
        v11 = 0;
        if (!objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "canGenerateImageDerivativesFromUTI:", v64))
        {
          v79 = 0;
          v10 = 0;
          goto LABEL_91;
        }
        v65 = v80;
        v10 = (uint64_t)v80;
      }
      v66 = v65;
    }
    else
    {
      v79 = 0;
      v11 = 0;
      v10 = 0;
    }
LABEL_91:

    v26 = 2;
LABEL_29:
    v77 = v26;
    if (v10 | v11)
    {
      if (!v10)
      {
        v14 = 0;
        v15 = 0;
        v29 = 0;
        if (!v11)
          goto LABEL_38;
        goto LABEL_37;
      }
      v15 = (void *)v11;
      v16 = v79;
      LOBYTE(v79) = v11 != 0;
      goto LABEL_32;
    }
    goto LABEL_75;
  }
  objc_msgSend(v3, "resourceForType:", 1);
  v80 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v80, "identity");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileUTI");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v79 = objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "isMovieUTI:", v5);
    if (v79)
    {
      objc_msgSend(a1[4], "resourceForType:", 16);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6
        && (objc_msgSend(v6, "identity"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "fileURL"),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v9,
            v8,
            v9))
      {
        v7 = v7;
        v10 = 0;
        v11 = (unint64_t)v7;
      }
      else
      {
        v11 = (unint64_t)v80;
        v10 = 0;
      }
LABEL_26:

      goto LABEL_27;
    }
    if (objc_msgSend((id)objc_msgSend(a1[5], "derivativeGeneratorClass"), "canGenerateImageDerivativesFromUTI:", v5))
    {
      objc_msgSend(a1[4], "resourceForType:", 2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v17;
      if (!v17
        || (objc_msgSend(v17, "identity"),
            v18 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "fileURL"),
            v19 = (void *)objc_claimAutoreleasedReturnValue(),
            v19,
            v18,
            v20 = v7,
            !v19))
      {
        v20 = v80;
      }
      v10 = v20;
      objc_msgSend(a1[4], "resourceForType:", 18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21
        && (objc_msgSend(v21, "identity"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v23, "fileURL"),
            v24 = (void *)objc_claimAutoreleasedReturnValue(),
            v24,
            v23,
            v24))
      {
        v11 = v22;
      }
      else
      {
        v11 = 0;
      }

      goto LABEL_26;
    }
  }
  v79 = 0;
  v11 = 0;
  v10 = 0;
LABEL_27:

  v13 = 0;
  if (v80)
  {
    v26 = 1;
    goto LABEL_29;
  }
  v80 = 0;
  v15 = (void *)v11;
LABEL_76:
  if (!_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v60 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(a1[4], "cplFullDescription");
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v131) = 138412290;
      *(_QWORD *)((char *)&v131 + 4) = v61;
      _os_log_impl(&dword_1B03C2000, v60, OS_LOG_TYPE_DEBUG, "%@ has no resource to generate", (uint8_t *)&v131, 0xCu);

    }
  }
  (*((void (**)(void))a1[8] + 2))();
LABEL_81:

}

BOOL __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_37(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  uint64_t v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedResourcesForReferenceResource:adjustment:includePosterFrame:", a2, *(_QWORD *)(a1 + 40), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (!_CPLSilentLogging)
    {
      __CPLDerivativesOSLogDomain();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        v7 = *(_QWORD *)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v14 = v7;
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1B03C2000, v6, OS_LOG_TYPE_DEBUG, "Found cached resources for %@: %@", buf, 0x16u);
      }

    }
    if (objc_msgSend(v5, "count"))
    {
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 48);
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      obj = *(id *)(v10 + 40);
      objc_msgSend(v8, "_updateChange:fromOldChange:withResources:excludeImages:", &obj, v9, v5, v3 ^ 1u);
      objc_storeStrong((id *)(v10 + 40), obj);
    }
  }

  return v5 != 0;
}

id __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_39(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "tempFolderURLForGeneratedResourcesWithReferenceResource:adjustment:includePosterFrame:", a2, *(_QWORD *)(a1 + 40), a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v4);
  return v4;
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5)
  {
    if (v6)
    {
      if (!_CPLSilentLogging)
      {
        __CPLDerivativesOSLogDomain();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          v26 = v11;
          v27 = 2112;
          v28 = v7;
          _os_log_impl(&dword_1B03C2000, v10, OS_LOG_TYPE_ERROR, "Failed to generate derivatives for %@: %@", buf, 0x16u);
        }

      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v12 = *(id *)(a1 + 48);
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v21;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v21 != v15)
              objc_enumerationMutation(v12);
            v17 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager", (_QWORD)v20);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "removeItemAtURL:error:", v17, 0);

          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        }
        while (v14);
      }
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_20:
        (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        goto LABEL_21;
      }
      __CPLDerivativesOSLogDomain();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v19 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        v26 = v19;
        _os_log_impl(&dword_1B03C2000, v12, OS_LOG_TYPE_DEBUG, "No derivatives are generated for %@", buf, 0xCu);
      }
    }

    goto LABEL_20;
  }
  objc_msgSend(v5, "allResources");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "copy");
  objc_msgSend(v9, "setResources:", v8);
  (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

LABEL_21:
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_42(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  CPLDerivativesGenerationStatistics *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  CPLDerivativesGenerationStatistics *v18;
  uint64_t v19;
  _QWORD v20[5];
  id v21;
  CPLDerivativesGenerationStatistics *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  id v29;

  if (*(_BYTE *)(a1 + 128))
  {
    v2 = *(void **)(a1 + 32);
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v29 = *(id *)(v4 + 40);
    v5 = objc_msgSend(v2, "_checkResource:name:error:", v3, CFSTR("baseImageResource"), &v29);
    objc_storeStrong((id *)(v4 + 40), v29);
    if (v5)
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = -[CPLDerivativesGenerationStatistics initWithSourceResource:]([CPLDerivativesGenerationStatistics alloc], "initWithSourceResource:", *(_QWORD *)(a1 + 40));
      v8 = (void *)objc_msgSend(*(id *)(a1 + 32), "derivativeGeneratorClass");
      v10 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v11 = *(_QWORD *)(a1 + 64);
      v12 = *(_QWORD *)(a1 + 120);
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2_46;
      v20[3] = &unk_1E60D97B0;
      v13 = *(void **)(a1 + 40);
      v20[4] = *(_QWORD *)(a1 + 32);
      v21 = v13;
      v26 = *(id *)(a1 + 96);
      v22 = v7;
      v14 = *(id *)(a1 + 72);
      v15 = *(_QWORD *)(a1 + 104);
      v23 = v14;
      v27 = v15;
      v16 = *(id *)(a1 + 48);
      v17 = *(_QWORD *)(a1 + 112);
      v24 = v16;
      v28 = v17;
      v25 = *(id *)(a1 + 80);
      v18 = v7;
      LOBYTE(v19) = 0;
      objc_msgSend(v8, "generateDerivativeResourcesFromInputResource:withAdjustments:destinationDirectory:fingerprintScheme:derivativesFilter:recordChangeType:includePosterFrameForVideo:completionHandler:", v21, v10, v6, v9, v11, v12, v19, v20);

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 96) + 16))();
  }
}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_51(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void (*v11)(void);
  void *v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  id v17;
  id obj;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!_CPLSilentLogging)
    {
      __CPLDerivativesOSLogDomain();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v20 = v8;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Error trying to generate derivatives from %@: %@", buf, 0x16u);
      }

    }
    if ((objc_msgSend(*(id *)(a1 + 40), "_isUnsupportedFormatError:", v6) & 1) == 0)
    {
      if (!_CPLSilentLogging)
      {
        __CPLDerivativesOSLogDomain();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v10 = *(_QWORD *)(a1 + 32);
          *(_DWORD *)buf = 138412290;
          v20 = v10;
          _os_log_impl(&dword_1B03C2000, v9, OS_LOG_TYPE_ERROR, "Error trying to generate unsupported video derivatives from %@", buf, 0xCu);
        }

      }
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
      goto LABEL_17;
    }
  }
  else if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(*(id *)(a1 + 48), "didEndGeneratingDerivatives");
    objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 48));
    v12 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
    obj = *(id *)(v13 + 40);
    v14 = objc_msgSend(v12, "_checkGeneratedResources:error:", v5, &obj);
    objc_storeStrong((id *)(v13 + 40), obj);
    if (!v14)
    {
      v11 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_17:
      v11();
      goto LABEL_18;
    }
    objc_msgSend(*(id *)(a1 + 40), "noteGeneratedResouces:haveBeenGeneratedForReferenceResource:adjustment:includePosterFrame:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 112));
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
    v16 = *(void **)(a1 + 40);
    v17 = *(id *)(v15 + 40);
    objc_msgSend(v16, "_updateChange:fromOldChange:withResources:excludeImages:", &v17, *(_QWORD *)(a1 + 72), v5, *(_BYTE *)(a1 + 112) == 0);
    objc_storeStrong((id *)(v15 + 40), v17);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 88) + 16))();
LABEL_18:

}

void __112__CPLEngineDerivativesCache_generateDerivativesForChange_derivativesFilter_fingerprintScheme_completionHandler___block_invoke_2_46(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  void (*v9)(void);
  void *v10;
  uint64_t v11;
  int v12;
  void *v13;
  uint64_t v14;
  id v15;
  id obj;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (!v6)
  {
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(*(id *)(a1 + 48), "didEndGeneratingDerivatives");
      objc_msgSend(*(id *)(a1 + 56), "addObject:", *(_QWORD *)(a1 + 48));
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
      obj = *(id *)(v11 + 40);
      v12 = objc_msgSend(v10, "_checkGeneratedResources:error:", v5, &obj);
      objc_storeStrong((id *)(v11 + 40), obj);
      if (!v12)
      {
        v9 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
        goto LABEL_12;
      }
      objc_msgSend(*(id *)(a1 + 32), "noteGeneratedResouces:haveBeenGeneratedForReferenceResource:adjustment:includePosterFrame:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64), 1);
      v13 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8);
      v15 = *(id *)(v14 + 40);
      objc_msgSend(v13, "_updateChange:fromOldChange:withResources:excludeImages:", &v15, *(_QWORD *)(a1 + 72), v5, 0);
      objc_storeStrong((id *)(v14 + 40), v15);
    }
    goto LABEL_11;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_isUnsupportedFormatError:", v6) & 1) != 0)
  {
LABEL_11:
    v9 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
    goto LABEL_12;
  }
  if (!_CPLSilentLogging)
  {
    __CPLDerivativesOSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v18 = v8;
      v19 = 2112;
      v20 = v6;
      _os_log_impl(&dword_1B03C2000, v7, OS_LOG_TYPE_ERROR, "Error trying to generate derivatives from %@: %@", buf, 0x16u);
    }

  }
  v9 = *(void (**)(void))(*(_QWORD *)(a1 + 80) + 16);
LABEL_12:
  v9();

}

@end
