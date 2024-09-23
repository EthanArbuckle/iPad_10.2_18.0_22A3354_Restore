@implementation PHImportLibrarySource

- (PHImportLibrarySource)initWithUrls:(id)a3
{
  id v4;
  NSURL *v5;
  NSURL *libraryURL;
  PLPhotoLibraryPathManager *v7;
  PLPhotoLibraryPathManager *pathManager;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count") == 1
    && (v11.receiver = self,
        v11.super_class = (Class)PHImportLibrarySource,
        (self = -[PHImportUrlSource initWithUrls:](&v11, sel_initWithUrls_, v4)) != 0))
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", 0);
    v5 = (NSURL *)objc_claimAutoreleasedReturnValue();
    libraryURL = self->_libraryURL;
    self->_libraryURL = v5;

    v7 = (PLPhotoLibraryPathManager *)objc_msgSend(objc_alloc(MEMORY[0x1E0D73280]), "initWithLibraryURL:", self->_libraryURL);
    pathManager = self->_pathManager;
    self->_pathManager = v7;

    -[PHImportUrlSource setIsReadonlyVolume:](self, "setIsReadonlyVolume:", 1);
  }
  else
  {
    PLImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v4;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_DEBUG, "Unexpected: Attempting to create a library import source with more than on URL: %@", buf, 0xCu);
    }

    self = 0;
  }

  return self;
}

- (BOOL)containsSupportedMediaWithImportExceptions:(id *)a3
{
  return 1;
}

- (id)_resourcePathsByUuidForPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        v11 = (void *)MEMORY[0x1E0D73278];
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v10, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuidFromURL:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", (unint64_t)objc_msgSend(v5, "count") >> 1);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, v13);
        }
        objc_msgSend(v14, "addObject:", v10);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)beginProcessingWithCompletion:(id)a3
{
  PLPhotoLibraryPathManager *pathManager;
  void (**v5)(_QWORD);
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSDictionary *v15;
  NSDictionary *renderResourcePathsByIdentifier;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  pathManager = self->_pathManager;
  v5 = (void (**)(_QWORD))a3;
  -[PLPhotoLibraryPathManager photoDirectoryWithType:](pathManager, "photoDirectoryWithType:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource resourcePathsInUrls:](self, "resourcePathsInUrls:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportLibrarySource _resourcePathsByUuidForPaths:](self, "_resourcePathsByUuidForPaths:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource setResourcePathsByIdentifier:](self, "setResourcePathsByIdentifier:", v10);

  -[PLPhotoLibraryPathManager photoDirectoryWithType:](self->_pathManager, "photoDirectoryWithType:", 9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportUrlSource resourcePathsInUrls:](self, "resourcePathsInUrls:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportLibrarySource _resourcePathsByUuidForPaths:](self, "_resourcePathsByUuidForPaths:", v14);
  v15 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  renderResourcePathsByIdentifier = self->_renderResourcePathsByIdentifier;
  self->_renderResourcePathsByIdentifier = v15;

  -[PHImportUrlSource resourcePathsByIdentifier](self, "resourcePathsByIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");
  -[PHImportSource setItems:](self, "setItems:", v19);

  -[PHImportSource items](self, "items");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "count");
  -[PHImportSource progress](self, "progress");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTotalUnitCount:", v21);

  v5[2](v5);
}

- (id)assetsByProcessingItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v35;
  id obj;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PHImportUrlSource resourcePathsByIdentifier](self, "resourcePathsByIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = v4;
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "mutableCopy");

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v43 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImportAsset assetFileForURL:source:withUuid:](PHImportLibraryAsset, "assetFileForURL:source:withUuid:", v14, self, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          if (objc_msgSend(v15, "isSidecar"))
            objc_msgSend(v8, "insertObject:atIndex:", v15, 0);
          else
            objc_msgSend(v8, "addObject:", v15);
        }
        else
        {
          objc_msgSend(v13, "lastPathComponent");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 1, v16, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m", 132);

        }
      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v10);
  }

  -[NSDictionary objectForKeyedSubscript:](self->_renderResourcePathsByIdentifier, "objectForKeyedSubscript:", v37);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v18, "mutableCopy");

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v35 = v19;
  v20 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v39 != v22)
          objc_enumerationMutation(v35);
        v24 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        +[PHImportAsset assetFileForURL:source:withUuid:](PHImportLibraryAsset, "assetFileForURL:source:withUuid:", v25, self, v37);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v26)
        {
          objc_msgSend(v24, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](self, "addExceptionWithType:path:underlyingError:file:line:", 1, v27, 0, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m", 158);

          goto LABEL_31;
        }
        if (objc_msgSend(v26, "isSidecar"))
        {
          objc_msgSend(v8, "insertObject:atIndex:", v26, 0);
          goto LABEL_31;
        }
        if (objc_msgSend(v26, "isImage"))
        {
          v29 = objc_msgSend(v26, "isBase") == 0;
          v30 = 5;
          v31 = 8;
LABEL_26:
          if (v29)
            v32 = v30;
          else
            v32 = v31;
          objc_msgSend(v26, "setResourceType:", v32);
          goto LABEL_30;
        }
        if (objc_msgSend(v26, "isMovie"))
        {
          v29 = objc_msgSend(v26, "isBase") == 0;
          v30 = 6;
          v31 = 12;
          goto LABEL_26;
        }
LABEL_30:
        objc_msgSend(v8, "addObject:", v26);
LABEL_31:

      }
      v21 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v21);
  }

  if (objc_msgSend(v8, "count"))
  {
    -[PHImportSource processAssets:](self, "processAssets:", v8);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void)loadSidecarsFor:(id)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  PLImportGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = 136315138;
    v5 = "-[PHImportLibrarySource loadSidecarsFor:]";
    _os_log_impl(&dword_1991EC000, v3, OS_LOG_TYPE_DEBUG, "%s should never be called on an PHImportLibrarySource", (uint8_t *)&v4, 0xCu);
  }

}

- (id)productKind
{
  return CFSTR("Library");
}

- (BOOL)canReference
{
  return 0;
}

- (BOOL)isLibrary
{
  return 1;
}

- (id)name
{
  void *v2;
  void *v3;
  void *v4;

  -[PHImportUrlSource prefix](self, "prefix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_isValidPhotoLibraryWithError:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  NSObject *v10;
  id v11;
  id v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D719C0];
  -[PLPhotoLibraryPathManager libraryURL](self->_pathManager, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedAssetsdClientForPhotoLibraryURL:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "libraryClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v8 = objc_msgSend(v7, "isLibraryReadyForImportWithError:", &v13);
  v9 = v13;

  if (a3 && (v8 & 1) == 0)
  {
    PHErrorFromPLError(v9);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
    PLImportGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v11 = *a3;
      *(_DWORD *)buf = 136446466;
      v15 = "-[PHImportLibrarySource _isValidPhotoLibraryWithError:]";
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_DEBUG, "ERROR: %{public}s Library not valid for import. Error: %@", buf, 0x16u);
    }

  }
  return v8;
}

- (PLPhotoLibraryPathManager)pathManager
{
  return self->_pathManager;
}

- (void)setPathManager:(id)a3
{
  objc_storeStrong((id *)&self->_pathManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_renderResourcePathsByIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
}

+ (id)importLibrarySourceForURL:(id)a3 exceptions:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  PHImportLibrarySource *v11;
  void *v12;
  id *v13;
  void *v14;
  PHImportLibrarySource *v15;
  NSObject *v16;
  void *v17;
  PHImportException *v18;
  void *v19;
  void *v20;
  PHImportException *v21;
  id v23;
  uint8_t buf[4];
  void *v25;
  id v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v8 = objc_msgSend(a1, "_isValidPhotoLibrary:error:", v6, &v23);
  v9 = v23;
  v10 = v9;
  if (v8)
  {
    v11 = [PHImportLibrarySource alloc];
    v27[0] = v6;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = (id *)v27;
  }
  else
  {
    if (objc_msgSend(v9, "code") != 6209)
    {
      if (a4)
      {
        v18 = [PHImportException alloc];
        objc_msgSend(v6, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "lastPathComponent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = -[PHImportException initWithType:path:underlyingError:file:line:](v18, "initWithType:path:underlyingError:file:line:", 7, v20, v10, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportLibrarySource.m", 51);
        objc_msgSend(v7, "addObject:", v21);

        v15 = 0;
        *a4 = (id)objc_msgSend(v7, "copy");
      }
      else
      {
        v15 = 0;
      }
      goto LABEL_12;
    }
    v11 = [PHImportLegacyLibrarySource alloc];
    v26 = v6;
    v12 = (void *)MEMORY[0x1E0C99D20];
    v13 = &v26;
  }
  objc_msgSend(v12, "arrayWithObjects:count:", v13, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[PHImportLibrarySource initWithUrls:](v11, "initWithUrls:", v14);

  if (v15)
  {
    PLImportGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromClass((Class)a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v25 = v17;
      _os_log_impl(&dword_1991EC000, v16, OS_LOG_TYPE_DEBUG, "Attempting to import library with %@", buf, 0xCu);

    }
  }
LABEL_12:

  return v15;
}

+ (id)supportedImportLibraryTypes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[4];

  v7[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D752F0], "photosLibraryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D752F0], "apertureLibraryType", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0D752F0], "iPhotoLibraryType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)_isValidPhotoLibrary:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v10;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D719C0], "sharedAssetsdClientForPhotoLibraryURL:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "libraryClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v7 = objc_msgSend(v6, "isLibraryReadyForImportWithError:", &v12);
  v8 = v12;

  if (a4 && (v7 & 1) == 0)
  {
    PHErrorFromPLError(v8);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    PLImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = *a4;
      *(_DWORD *)buf = 136446466;
      v14 = "+[PHImportLibrarySource _isValidPhotoLibrary:error:]";
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "ERROR: %{public}s Library not valid for import. Error: %@", buf, 0x16u);
    }

  }
  return v7;
}

@end
