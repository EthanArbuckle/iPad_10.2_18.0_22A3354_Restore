@implementation QLExternalThumbnailCache

- (QLExternalThumbnailCache)initWithDirectoryURL:(id)a3 maximumCacheSize:(unint64_t)a4 error:(id *)a5
{
  id v9;
  QLExternalThumbnailCache *v10;
  QLExternalThumbnailCache *v11;
  uint64_t v12;
  NSURL *thumbnailsDirectoryURL;
  uint64_t v14;
  NSURL *databaseURL;
  QLExternalThumbnailCache *v16;
  objc_super v18;

  v9 = a3;
  v18.receiver = self;
  v18.super_class = (Class)QLExternalThumbnailCache;
  v10 = -[QLExternalThumbnailCache init](&v18, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  v10->_maximumCacheSize = a4;
  objc_storeStrong((id *)&v10->_directoryURL, a3);
  objc_msgSend(v9, "URLByAppendingPathComponent:isDirectory:", CFSTR("thumbnails"), 1);
  v12 = objc_claimAutoreleasedReturnValue();
  thumbnailsDirectoryURL = v11->_thumbnailsDirectoryURL;
  v11->_thumbnailsDirectoryURL = (NSURL *)v12;

  objc_msgSend(v9, "URLByAppendingPathComponent:", CFSTR("thumbnails.db"));
  v14 = objc_claimAutoreleasedReturnValue();
  databaseURL = v11->_databaseURL;
  v11->_databaseURL = (NSURL *)v14;

  if (!-[QLExternalThumbnailCache _createDirectoryWithURL:error:](v11, "_createDirectoryWithURL:error:", v11->_thumbnailsDirectoryURL, a5))goto LABEL_5;
  if (-[QLExternalThumbnailCache _createDirectoryWithURL:error:](v11, "_createDirectoryWithURL:error:", v11->_directoryURL, a5))
  {
LABEL_4:
    v16 = v11;
  }
  else
  {
LABEL_5:
    v16 = 0;
  }

  return v16;
}

- (void)dealloc
{
  objc_super v3;

  -[QLExternalThumbnailCache close](self, "close");
  v3.receiver = self;
  v3.super_class = (Class)QLExternalThumbnailCache;
  -[QLExternalThumbnailCache dealloc](&v3, sel_dealloc);
}

- (id)thumbnailURLForItem:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[QLExternalThumbnailCache db](self, "db");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "open") & 1) != 0)
  {
    v14 = 0;
    objc_msgSend(v7, "pathExtensionForItem:error:", v6, &v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v14;
    v10 = v9;
    if (v8)
    {
      objc_msgSend(v6, "itemIdentifier");
      v11 = objc_claimAutoreleasedReturnValue();
      -[QLExternalThumbnailCache _urlForThumbnailWithFPItemIdentifier:fileExtension:](self, "_urlForThumbnailWithFPItemIdentifier:fileExtension:", v11, v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (v9)
      {
        if (a4)
        {
          errorWithCodeAndUnderlyingError(1, v9);
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        _log_1();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          -[QLExternalThumbnailCache thumbnailURLForItem:error:].cold.1();
      }
      else
      {
        _log_1();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v16 = v6;
          _os_log_impl(&dword_1AE3F5000, v11, OS_LOG_TYPE_INFO, "No path extension found from DB for item: %@.", buf, 0xCu);
        }
      }
      v12 = 0;
    }

  }
  else
  {
    if (a4)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache thumbnailURLForItem:error:].cold.2();
    v12 = 0;
  }

  return v12;
}

- (BOOL)storeThumbnailAtURL:(id)a3 forItem:(id)a4 error:(id *)a5
{
  return -[QLExternalThumbnailCache _saveOrUpdateCachedThumbnailRepresentingFPItem:withFileAtURL:error:](self, "_saveOrUpdateCachedThumbnailRepresentingFPItem:withFileAtURL:error:", a4, a3, a5);
}

- (void)storeThumbnailAtURL:(id)a3 forItem:(id)a4 completion:(id)a5
{
  void (**v8)(id, id);
  id v9;
  id v10;

  v10 = 0;
  v8 = (void (**)(id, id))a5;
  -[QLExternalThumbnailCache storeThumbnailAtURL:forItem:error:](self, "storeThumbnailAtURL:forItem:error:", a3, a4, &v10);
  v9 = v10;
  v8[2](v8, v9);

}

- (void)getThumbnailURLForItem:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[QLExternalThumbnailCache thumbnailURLForItem:error:](self, "thumbnailURLForItem:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (BOOL)removeAllThumbnails:(id *)a3
{
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  NSURL *thumbnailsDirectoryURL;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  char v19;
  BOOL v20;
  NSObject *v21;
  NSObject *v22;
  id *v24;
  void *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  NSObject *v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  -[QLExternalThumbnailCache db](self, "db");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "open") & 1) == 0)
  {
    if (a3)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache removeAllThumbnails:].cold.3(v7);
LABEL_17:
    v20 = 0;
    goto LABEL_33;
  }
  v32 = 0;
  v6 = objc_msgSend(v5, "removeAllThumbnails:", &v32);
  v7 = v32;
  if ((v6 & 1) == 0)
  {
    if (a3)
    {
      errorWithCodeAndUnderlyingError(1, v7);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  thumbnailsDirectoryURL = self->_thumbnailsDirectoryURL;
  v31 = v7;
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", thumbnailsDirectoryURL, 0, 0, &v31);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v31;

  if (v10)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v12 = v10;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v13)
    {
      v14 = v13;
      v24 = a3;
      v25 = v10;
      v15 = *(_QWORD *)v28;
      while (2)
      {
        v16 = 0;
        v17 = v11;
        do
        {
          if (*(_QWORD *)v28 != v15)
            objc_enumerationMutation(v12);
          v18 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v16);
          v26 = v17;
          v19 = objc_msgSend(v8, "removeItemAtURL:error:", v18, &v26);
          v11 = v26;

          if ((v19 & 1) == 0)
          {
            _log_1();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              -[QLExternalThumbnailCache removeAllThumbnails:].cold.2();

            if (v24)
            {
              errorWithCodeAndUnderlyingError(3, v11);
              v20 = 0;
              *v24 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v20 = 0;
            }
            goto LABEL_30;
          }
          ++v16;
          v17 = v11;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
        if (v14)
          continue;
        break;
      }
      v20 = 1;
LABEL_30:
      v10 = v25;
    }
    else
    {
      v20 = 1;
    }

  }
  else
  {
    _log_1();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache removeAllThumbnails:].cold.1();

    if (a3)
    {
      errorWithCodeAndUnderlyingError(3, v11);
      v20 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v20 = 0;
    }
  }

  v7 = v11;
LABEL_33:

  return v20;
}

- (void)close
{
  -[QLExternalThumbnailCacheDatabase close](self->_db, "close");
}

- (BOOL)_saveOrUpdateCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  BOOL v10;

  v8 = a3;
  v9 = a4;
  v10 = -[QLExternalThumbnailCache _freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:](self, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:", v8, v9, a5)&& -[QLExternalThumbnailCache _updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:](self, "_updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:", v8, v9, a5)&& -[QLExternalThumbnailCache _saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:](self, "_saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:", v8, v9, a5);

  return v10;
}

- (BOOL)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  char v16;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  void *v33;
  id *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  NSObject *obj;
  NSObject *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  NSObject *v49;
  __int16 v50;
  NSObject *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[QLExternalThumbnailCache db](self, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "open") & 1) == 0)
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache _freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:].cold.2();
    goto LABEL_11;
  }
  v11 = -[QLExternalThumbnailCache maximumCacheSize](self, "maximumCacheSize");
  v12 = objc_msgSend(v10, "totalThumbnailsSize");
  -[NSObject _QLFileSize](v9, "_QLFileSize");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "longLongValue");

  if (v14 > v11)
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(4, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache _freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:].cold.1();
LABEL_11:
    v16 = 0;
    goto LABEL_12;
  }
  v18 = v14 + v12 - v11;
  if (v18 < 1)
  {
    v16 = 1;
    goto LABEL_13;
  }
  v44 = 0;
  objc_msgSend(v10, "deleteOldestThumbnailsToFreeAtLeastSpace:error:", v18 & ~(v18 >> 63), &v44);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v44;
  if (v19)
  {
    v20 = v8;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v19;
    v21 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v21)
    {
      v22 = v21;
      v33 = v19;
      v34 = a5;
      v35 = v10;
      v36 = v9;
      v37 = v20;
      v23 = *(_QWORD *)v41;
      v16 = 1;
      do
      {
        v24 = 0;
        v25 = v15;
        do
        {
          if (*(_QWORD *)v41 != v23)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v24);
          objc_msgSend(v26, "itemIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "fileExtension");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[QLExternalThumbnailCache _urlForThumbnailWithFPItemIdentifier:fileExtension:](self, "_urlForThumbnailWithFPItemIdentifier:fileExtension:", v27, v28);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = v25;
          v31 = objc_msgSend(v30, "removeItemAtURL:error:", v29, &v39);
          v15 = v39;

          if ((v31 & 1) == 0)
          {
            _log_1();
            v32 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v47 = v29;
              v48 = 2112;
              v49 = v15;
              _os_log_error_impl(&dword_1AE3F5000, v32, OS_LOG_TYPE_ERROR, "Could not delete cached thumbnail at URL: %@. Error: %@.", buf, 0x16u);
            }

            v16 = 0;
          }

          ++v24;
          v25 = v15;
        }
        while (v22 != v24);
        v22 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
      }
      while (v22);
      v9 = v36;
      v8 = v37;
      a5 = v34;
      v10 = v35;
      v19 = v33;
    }
    else
    {
      v16 = 1;
    }
  }
  else
  {
    _log_1();
    obj = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v47 = v8;
      v48 = 2112;
      v49 = v9;
      v50 = 2112;
      v51 = v15;
      _os_log_error_impl(&dword_1AE3F5000, obj, OS_LOG_TYPE_ERROR, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem (item: %@, url: %@) failed. Error: %@", buf, 0x20u);
    }
    v16 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v15);

LABEL_12:
LABEL_13:

  return v16 & 1;
}

- (BOOL)_updateDatabaseWithCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  -[QLExternalThumbnailCache db](self, "db");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "open") & 1) != 0)
  {
    objc_msgSend(v9, "_QLFileSize");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "longLongValue");

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pathExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    v15 = objc_msgSend(v10, "insertOrReplaceThumbnailRepresentingFPItem:size:modificationDate:fileExtension:error:", v8, v12, v13, v14, &v19);
    v16 = v19;

    if ((v15 & 1) == 0)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v16);
      _log_1();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412802;
        v21 = v8;
        v22 = 2112;
        v23 = v9;
        v24 = 2112;
        v25 = v16;
        _os_log_error_impl(&dword_1AE3F5000, v17, OS_LOG_TYPE_ERROR, "_updateDatabaseWithCachedThumbnailRepresentingFPItem (item: %@, url: %@) failed. Error: %@", buf, 0x20u);
      }

    }
  }
  else
  {
    if (a5)
    {
      errorWithCodeAndUnderlyingError(0, 0);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache _updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:].cold.1();
    v15 = 0;
  }

  return v15;
}

- (BOOL)_saveToDiskCachedThumbnailRepresentingFPItem:(id)a3 withFileAtURL:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  char v19;
  BOOL v20;
  id v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  -[QLExternalThumbnailCache _urlForThumbnailWithFPItem:originalThumbnailURL:](self, "_urlForThumbnailWithFPItem:originalThumbnailURL:", a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "fileExistsAtPath:", v11);

  if (v12)
  {
    v23 = 0;
    v13 = objc_msgSend(v10, "removeItemAtURL:error:", v9, &v23);
    v14 = v23;
    v15 = v14;
    if ((v13 & 1) == 0)
    {
      if (a5)
        *a5 = objc_retainAutorelease(v14);
      _log_1();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[QLExternalThumbnailCache _saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:].cold.1();
LABEL_14:

      v20 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    v15 = 0;
  }
  v17 = v15;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v15;
  v19 = objc_msgSend(v18, "moveItemAtURL:toURL:error:", v8, v9, &v22);
  v15 = v22;

  if ((v19 & 1) == 0)
  {
    if (a5)
      *a5 = objc_retainAutorelease(v15);
    _log_1();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v25 = v8;
      v26 = 2112;
      v27 = v9;
      v28 = 2112;
      v29 = v15;
      _os_log_error_impl(&dword_1AE3F5000, v16, OS_LOG_TYPE_ERROR, "Could not save thumbnail at url: %@ to external cache url: %@. Error: %@", buf, 0x20u);
    }
    goto LABEL_14;
  }
  v20 = 1;
LABEL_15:

  return v20;
}

- (BOOL)_createDirectoryWithURL:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  char v7;
  id v8;
  NSObject *v9;
  id v11;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v7 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v11);
  v8 = v11;

  if ((v7 & 1) == 0)
  {
    _log_1();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[QLExternalThumbnailCache _createDirectoryWithURL:error:].cold.1();

    if (a4)
    {
      errorWithCodeAndUnderlyingError(2, v8);
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7;
}

- (id)_urlForThumbnailWithFPItem:(id)a3 originalThumbnailURL:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(a3, "itemIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[QLExternalThumbnailCache _urlForThumbnailWithFPItemIdentifier:fileExtension:](self, "_urlForThumbnailWithFPItemIdentifier:fileExtension:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_urlForThumbnailWithFPItemIdentifier:(id)a3 fileExtension:(id)a4
{
  NSURL *thumbnailsDirectoryURL;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  thumbnailsDirectoryURL = self->_thumbnailsDirectoryURL;
  v6 = a4;
  objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), CFSTR("-"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL URLByAppendingPathComponent:](thumbnailsDirectoryURL, "URLByAppendingPathComponent:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathExtension:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (QLExternalThumbnailCacheDatabase)db
{
  QLExternalThumbnailCacheDatabase *db;
  QLExternalThumbnailCacheDatabase *v4;
  QLExternalThumbnailCacheDatabase *v5;

  db = self->_db;
  if (!db)
  {
    v4 = -[QLExternalThumbnailCacheDatabase initWithURL:]([QLExternalThumbnailCacheDatabase alloc], "initWithURL:", self->_databaseURL);
    v5 = self->_db;
    self->_db = v4;

    db = self->_db;
  }
  return db;
}

- (id)inboxDirectoryURL
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  id v8;

  -[NSURL URLByAppendingPathComponent:](self->_directoryURL, "URLByAppendingPathComponent:", CFSTR("inbox"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "checkResourceIsReachableAndReturnError:", 0) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v4 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v8);
    v5 = v8;

    if ((v4 & 1) == 0)
    {
      _log_1();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[QLExternalThumbnailCache inboxDirectoryURL].cold.1();

    }
  }
  return v2;
}

- (void)getThumbnailCacheURLWrappersWithCompletion:(id)a3
{
  id v5;
  id FPSandboxingURLWrapperClass;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  FPSandboxingURLWrapperClass = getFPSandboxingURLWrapperClass();
  -[QLExternalThumbnailCache inboxDirectoryURL](self, "inboxDirectoryURL");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(FPSandboxingURLWrapperClass, "wrapperWithURL:readonly:error:", v11, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = getFPSandboxingURLWrapperClass();
  -[QLExternalThumbnailCache thumbnailsDirectoryURL](self, "thumbnailsDirectoryURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "wrapperWithURL:readonly:error:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, void *))a3 + 2))(v5, v7, v10);

}

+ (id)writeThumbnailImage:(CGImage *)a3 inInboxAtURL:(id)a4
{
  id v5;
  int v6;
  const __CFURL *v7;
  CGImageDestination *v8;
  CGImageDestination *v9;
  NSObject *v10;
  void *v11;
  void *v13;

  v5 = a4;
  if (writeThumbnailImage_inInboxAtURL__once != -1)
    dispatch_once(&writeThumbnailImage_inInboxAtURL__once, &__block_literal_global_9);
  v6 = objc_msgSend(v5, "startAccessingSecurityScopedResource");
  objc_msgSend(MEMORY[0x1E0C99E98], "_QLTemporaryURLWithExtension:openingFileHandle:inDirectoryAtURL:", writeThumbnailImage_inInboxAtURL__fileExtension, 0, v5);
  v7 = (const __CFURL *)objc_claimAutoreleasedReturnValue();
  v8 = CGImageDestinationCreateWithURL(v7, (CFStringRef)writeThumbnailImage_inInboxAtURL__encodingUTI, 1uLL, 0);
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "removeItemAtURL:error:", v7, 0);

    v7 = 0;
    if (!v6)
      goto LABEL_10;
    goto LABEL_9;
  }
  v9 = v8;
  CGImageDestinationAddImage(v8, a3, 0);
  if (!CGImageDestinationFinalize(v9))
  {
    _log_1();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      +[QLExternalThumbnailCache writeThumbnailImage:inInboxAtURL:].cold.1();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeItemAtURL:error:", v7, 0);

    v7 = 0;
  }
  CFRelease(v9);
  if (v6)
LABEL_9:
    objc_msgSend(v5, "stopAccessingSecurityScopedResource");
LABEL_10:

  return v7;
}

void __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke()
{
  CFArrayRef v0;
  void *v1;
  id *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE v24[128];
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v0 = CGImageDestinationCopyTypeIdentifiers();
  objc_msgSend((id)*MEMORY[0x1E0CEC508], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v1;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v2 = (id *)getAVFileTypeAVCISymbolLoc_ptr;
  v23 = getAVFileTypeAVCISymbolLoc_ptr;
  if (!getAVFileTypeAVCISymbolLoc_ptr)
  {
    v3 = (void *)AVFoundationLibrary();
    v2 = (id *)dlsym(v3, "AVFileTypeAVCI");
    v21[3] = (uint64_t)v2;
    getAVFileTypeAVCISymbolLoc_ptr = (uint64_t)v2;
  }
  _Block_object_dispose(&v20, 8);
  if (!v2)
  {
    +[QLThumbnailAddition preFPFSDownloadThumbnailAtTaggedURL:completionHandler:].cold.1();
    __break(1u);
  }
  v26 = *v2;
  v4 = (void *)*MEMORY[0x1E0CEC530];
  v5 = v26;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v25, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v8);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (-[__CFArray containsObject:](v0, "containsObject:", v12, (_QWORD)v16))
        {
          objc_storeStrong((id *)&writeThumbnailImage_inInboxAtURL__encodingUTI, v12);
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", writeThumbnailImage_inInboxAtURL__encodingUTI);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "preferredFilenameExtension");
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = (void *)writeThumbnailImage_inInboxAtURL__fileExtension;
          writeThumbnailImage_inInboxAtURL__fileExtension = v14;

          goto LABEL_14;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_14:

  if (!writeThumbnailImage_inInboxAtURL__fileExtension)
    __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke_cold_2();

}

- (id)writeThumbnailImageInInbox:(CGImage *)a3
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_opt_class();
  -[QLExternalThumbnailCache inboxDirectoryURL](self, "inboxDirectoryURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "writeThumbnailImage:inInboxAtURL:", a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setDb:(id)a3
{
  objc_storeStrong((id *)&self->_db, a3);
}

- (NSURL)directoryURL
{
  return self->_directoryURL;
}

- (NSURL)thumbnailsDirectoryURL
{
  return self->_thumbnailsDirectoryURL;
}

- (NSURL)databaseURL
{
  return self->_databaseURL;
}

- (unint64_t)maximumCacheSize
{
  return self->_maximumCacheSize;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseURL, 0);
  objc_storeStrong((id *)&self->_thumbnailsDirectoryURL, 0);
  objc_storeStrong((id *)&self->_directoryURL, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

- (void)thumbnailURLForItem:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not obtain path extension from DB for item: %@. Error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailURLForItem:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not obtain path extension from DB for item: %@ because could not open DB.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllThumbnails:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not delete thumbnails from cache because did not obtain the URLs of the thumbnails returned nil. Error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)removeAllThumbnails:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not delete cached thumbnail at URL: %@. Error: %@.");
  OUTLINED_FUNCTION_2();
}

- (void)removeAllThumbnails:(os_log_t)log .cold.3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_ERROR, "removeAllThumbnails failed because could not open DB.", v1, 2u);
}

- (void)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem for item: %@ failed because the thumbnails is too large to fit the maximum cache size.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_freeDiskSpaceToSaveThumbnailRepresentingFPItem:withFileAtURL:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "_freeDiskSpaceToSaveThumbnailRepresentingFPItem for item: %@ failed because could not open DB.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_updateDatabaseWithCachedThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Can't save thumbnail at url: %@ for FPItem: %@ because could not open database.");
  OUTLINED_FUNCTION_2();
}

- (void)_saveToDiskCachedThumbnailRepresentingFPItem:withFileAtURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not remove existing thumbnail from external cache at url: %@. Error: %@");
  OUTLINED_FUNCTION_2();
}

- (void)_createDirectoryWithURL:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_1AE3F5000, v0, v1, "Could not create directory at url %@ to store thumbnails on the device (error %@).");
  OUTLINED_FUNCTION_2();
}

- (void)inboxDirectoryURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "could not create inbox directory: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

+ (void)writeThumbnailImage:inInboxAtURL:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Failed storing thumbnail as %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__QLExternalThumbnailCache_writeThumbnailImage_inInboxAtURL___block_invoke_cold_2()
{
  __assert_rtn("+[QLExternalThumbnailCache writeThumbnailImage:inInboxAtURL:]_block_invoke", "QLExternalThumbnailCache.m", 363, "fileExtension != nil");
}

@end
