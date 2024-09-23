@implementation PHImportRecord

- (PHImportRecord)initWithImportAsset:(id)a3
{
  id v5;
  PHImportRecord *v6;
  PHImportRecord *v7;
  PHImportTimerCollection *v8;
  unsigned __int8 v9;
  uint64_t v10;
  PHImportTimerCollection *timers;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PHImportRecord;
  v6 = -[PHImportExceptionRecorder init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_importAsset, a3);
    v8 = [PHImportTimerCollection alloc];
    if ((objc_msgSend(v5, "isImage") & 1) != 0)
    {
      v9 = 1;
    }
    else if (objc_msgSend(v5, "isMovie"))
    {
      v9 = 3;
    }
    else
    {
      v9 = 2;
    }
    v10 = -[PHImportTimerCollection initForMediaType:fileSize:](v8, "initForMediaType:fileSize:", v9, objc_msgSend(v5, "fileSize"));
    timers = v7->_timers;
    v7->_timers = (PHImportTimerCollection *)v10;

  }
  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PHImportRecord descriptionWithPrefix:](self, "descriptionWithPrefix:", &stru_1E35DFFF8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportExceptionRecorder exceptions](self, "exceptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("\nExceptions:"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingString:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    -[PHImportExceptionRecorder exceptions](self, "exceptions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        v13 = (void *)v7;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(v13, "stringByAppendingFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          v7 = objc_claimAutoreleasedReturnValue();

          ++v12;
          v13 = (void *)v7;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

    v3 = (void *)v7;
  }
  return v3;
}

- (id)descriptionWithPrefix:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[PHImportRecord importAsset](self, "importAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHImportRecord assetIdentifier](self, "assetIdentifier");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (const __CFString *)v8;
  else
    v10 = &stru_1E35DFFF8;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("\n%@Asset: %@ <%@>"), v4, v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportRecord importAsset](self, "importAsset");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "url");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "path");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  if (v14)
    v16 = (const __CFString *)v14;
  else
    v16 = &stru_1E35DFFF8;
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("\n%@Source Path: %@"), v4, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportRecord downloadedPath](self, "downloadedPath");
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = (void *)v18;
  if (v18)
    v20 = (const __CFString *)v18;
  else
    v20 = &stru_1E35DFFF8;
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR("\n%@Destination Path: %@"), v4, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportRecord importAsset](self, "importAsset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "metadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\n%@Metadata: <%p>"), v4, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHImportRecord relatedRecords](self, "relatedRecords");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    objc_msgSend(v24, "stringByAppendingFormat:", CFSTR("\n%@Additional Assets:\n"), v4);
    v27 = objc_claimAutoreleasedReturnValue();

    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    -[PHImportRecord relatedRecords](self, "relatedRecords");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v39;
      do
      {
        v32 = 0;
        v33 = (void *)v27;
        do
        {
          if (*(_QWORD *)v39 != v31)
            objc_enumerationMutation(v28);
          v34 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v32);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@\t"), v4);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "descriptionWithPrefix:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "stringByAppendingString:", v36);
          v27 = objc_claimAutoreleasedReturnValue();

          ++v32;
          v33 = (void *)v27;
        }
        while (v30 != v32);
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      }
      while (v30);
    }

    v24 = (void *)v27;
  }

  return v24;
}

- (void)cleanupAfterFailure
{
  void *v3;
  void *v4;
  id v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[PHImportRecord downloadedPath](self, "downloadedPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PHImportRecord downloadedPath](self, "downloadedPath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = +[PHImporter removeItemAtPath:type:recursive:](PHImporter, "removeItemAtPath:type:recursive:", v4, 0, 0);

  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = self->_relatedRecords;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "cleanupAfterFailure", (_QWORD)v11);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (id)allAssetIdentifiers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PHImportRecord assetIdentifier](self, "assetIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[PHImportRecord assetIdentifier](self, "assetIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v5);

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[PHImportRecord relatedRecords](self, "relatedRecords", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v11, "assetIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v11, "assetIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v13);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

- (NSString)rawAssetIdentifier
{
  NSString *rawAssetIdentifier;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  rawAssetIdentifier = self->_rawAssetIdentifier;
  if (!rawAssetIdentifier)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PHImportRecord relatedRecords](self, "relatedRecords", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (!v5)
      goto LABEL_13;
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v9, "importAsset");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "isRAW"))
        {
          objc_msgSend(v9, "assetIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v11)
            continue;
          objc_msgSend(v9, "assetIdentifier");
          v12 = (NSString *)objc_claimAutoreleasedReturnValue();
          v10 = self->_rawAssetIdentifier;
          self->_rawAssetIdentifier = v12;
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (!v6)
      {
LABEL_13:

        rawAssetIdentifier = self->_rawAssetIdentifier;
        return rawAssetIdentifier;
      }
    }
  }
  return rawAssetIdentifier;
}

- (void)addRelatedRecord:(id)a3
{
  id v4;
  NSMutableArray *relatedRecords;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  relatedRecords = self->_relatedRecords;
  v8 = v4;
  if (!relatedRecords)
  {
    v6 = (NSMutableArray *)objc_opt_new();
    v7 = self->_relatedRecords;
    self->_relatedRecords = v6;

    v4 = v8;
    relatedRecords = self->_relatedRecords;
  }
  -[NSMutableArray addObject:](relatedRecords, "addObject:", v4);
  objc_msgSend(v8, "setImportType:", -[PHImportRecord importType](self, "importType"));

}

- (id)recordForAsset:(id)a3
{
  id v4;
  PHImportRecord *v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  -[PHImportRecord importAsset](v5, "importAsset");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 != v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PHImportRecord relatedRecords](v5, "relatedRecords", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;

      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v15 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "recordForAsset:", v4);
          v12 = objc_claimAutoreleasedReturnValue();
          if (v12)
          {
            v5 = (PHImportRecord *)v12;
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v9)
          continue;
        break;
      }
      v5 = 0;
    }
LABEL_12:

  }
  return v5;
}

- (id)allImportAssets
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[PHImportRecord importAsset](self, "importAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PHImportRecord relatedRecords](self, "relatedRecords", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "allImportAssets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v3;
}

- (id)allImportRecords
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", self);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[PHImportRecord relatedRecords](self, "relatedRecords", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "allImportRecords");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)needsDownload
{
  return self->_downloadedPath == 0;
}

- (BOOL)canReference
{
  _BOOL4 v3;
  void *v4;
  char v5;

  v3 = -[PHImportAsset canReference](self->_importAsset, "canReference");
  if (v3)
  {
    -[PHImportAsset source](self->_importAsset, "source");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "canReference");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (NSString)assetIdentifier
{
  return self->_assetIdentifier;
}

- (void)setAssetIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetIdentifier, a3);
}

- (PHImportAsset)importAsset
{
  return self->_importAsset;
}

- (void)setImportAsset:(id)a3
{
  objc_storeStrong((id *)&self->_importAsset, a3);
}

- (NSMutableArray)relatedRecords
{
  return self->_relatedRecords;
}

- (void)setRelatedRecords:(id)a3
{
  objc_storeStrong((id *)&self->_relatedRecords, a3);
}

- (BOOL)referencedImport
{
  return self->_referencedImport;
}

- (void)setReferencedImport:(BOOL)a3
{
  self->_referencedImport = a3;
}

- (NSString)downloadedPath
{
  return self->_downloadedPath;
}

- (void)setDownloadedPath:(id)a3
{
  objc_storeStrong((id *)&self->_downloadedPath, a3);
}

- (PHImportTimerCollection)timers
{
  return self->_timers;
}

- (void)setTimers:(id)a3
{
  objc_storeStrong((id *)&self->_timers, a3);
}

- (unsigned)importType
{
  return self->_importType;
}

- (void)setImportType:(unsigned __int8)a3
{
  self->_importType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timers, 0);
  objc_storeStrong((id *)&self->_downloadedPath, 0);
  objc_storeStrong((id *)&self->_relatedRecords, 0);
  objc_storeStrong((id *)&self->_importAsset, 0);
  objc_storeStrong((id *)&self->_assetIdentifier, 0);
  objc_storeStrong((id *)&self->_rawAssetIdentifier, 0);
}

@end
