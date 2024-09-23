@implementation AVTImageStore

- (id)resourceURLForItem:(id)a3 scope:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_class();
  -[AVTImageStore location](self, "location");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageStore imageEncoder](self, "imageEncoder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "resourceURLForItem:scope:baseURL:encoder:", v7, v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (OS_dispatch_queue)stateLock
{
  return self->_stateLock;
}

- (BOOL)saveImage:(id)a3 forItem:(id)a4 scope:(id)a5 error:(id *)a6
{
  return -[AVTImageStore saveImage:withImageData:forItem:scope:error:](self, "saveImage:withImageData:forItem:scope:error:", a3, 0, a4, a5, a6);
}

- (BOOL)saveImage:(id)a3 withImageData:(id)a4 forItem:(id)a5 scope:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  id v23;
  char v24;
  char v25;
  void *v26;
  void *v27;
  void *v28;
  char v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  void *v35;
  id v36;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (-[AVTImageStore createDirectoryIfNeeded:](self, "createDirectoryIfNeeded:", a7))
  {
    -[AVTImageStore resourceURLForItem:scope:](self, "resourceURLForItem:scope:", v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTImageStore logger](self, "logger");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "path");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "logImageStoreBeginSavingImageForPath:", v18);

    if (-[AVTImageStore validateImages](self, "validateImages"))
    {
      +[AVTImageValidator sharedValidator](AVTImageValidator, "sharedValidator");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v36 = 0;
        v21 = objc_msgSend(v19, "validateImageIsNotTransparent:error:", v12, &v36);
        v22 = v36;
        v23 = v22;
        if ((v21 & 1) == 0)
        {
          if (a7)
          {
            v23 = objc_retainAutorelease(v22);
            v25 = 0;
            *a7 = v23;
          }
          else
          {
            v25 = 0;
          }
          goto LABEL_22;
        }
        v34 = v22;
        v24 = 0;
        if (v13)
        {
LABEL_12:
          v35 = v20;
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v14, "persistentDataHashForScope:", v15);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v24 & 1) != 0)
              goto LABEL_17;
          }
          else
          {
            v27 = 0;
            if ((v24 & 1) != 0)
              goto LABEL_17;
          }
          objc_msgSend(v16, "absoluteString");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v35, "validateImageDataIsNotDuplicate:forFileName:avatarDataHash:", v13, v28, v27);

          if ((v29 & 1) == 0)
          {
            if (a7)
            {
              objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 607, 0);
              v25 = 0;
              *a7 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v25 = 0;
            }
LABEL_21:
            v23 = v34;

            v20 = v35;
LABEL_22:

            goto LABEL_23;
          }
LABEL_17:
          if (objc_msgSend(v14, "requiresEncryption"))
            v30 = AVTDefaultFileProtectionDataWritingOptions() | 1;
          else
            v30 = 1;
          v25 = objc_msgSend(v13, "writeToURL:options:error:", v16, v30, a7);
          -[AVTImageStore logger](self, "logger");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "path");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "logImageStoreDoneSavingImageForPath:", v32);

          goto LABEL_21;
        }
LABEL_11:
        -[AVTImageStore imageEncoder](self, "imageEncoder");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "dataFromImage:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (!v13)
        {
          if (a7)
          {
            objc_msgSend(MEMORY[0x1E0D00868], "errorWithCode:userInfo:", 604, 0);
            v13 = 0;
            v25 = 0;
            *a7 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
            v25 = 0;
          }
          v23 = v34;
          goto LABEL_22;
        }
        goto LABEL_12;
      }
      v34 = 0;
    }
    else
    {
      v34 = 0;
      v20 = 0;
    }
    v24 = 1;
    if (v13)
      goto LABEL_12;
    goto LABEL_11;
  }
  v25 = 0;
LABEL_23:

  return v25;
}

- (void)performStateWork:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[AVTImageStore stateLock](self, "stateLock");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_sync(v5, v4);

}

- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  AVTATXImageIOImageEncoder *v10;
  AVTImageStore *v11;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  v10 = objc_alloc_init(AVTATXImageIOImageEncoder);
  v11 = -[AVTImageStore initWithEnvironment:validateImages:location:encoder:](self, "initWithEnvironment:validateImages:location:encoder:", v9, v5, v8, v10);

  return v11;
}

+ (id)resourceURLForItem:(id)a3 scope:(id)a4 baseURL:(id)a5 encoder:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  objc_msgSend(a3, "persistentIdentifierForScope:", a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "fileExtension");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "URLByAppendingPathExtension:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSURL)location
{
  return self->_location;
}

void __41__AVTImageStore_createDirectoryIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  id v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "fileManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v2, "fileExistsAtPath:", v4);

  if ((v5 & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "fileManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    v9 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v12);
    v10 = v12;
    v11 = v12;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;

    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v10);

  }
}

void __54__AVTImageStore__imageForItem_scope_cacheMissHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  int v19;
  uint64_t v20;
  id v21;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v21 = 0;
  objc_msgSend(v2, "imageForItem:scope:error:", v3, v4, &v21);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v21;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 40), "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logImageStoreCacheHitForItemDescription:sizeCost:", v11, objc_msgSend(*(id *)(a1 + 48), "cacheableResourceAssociatedCost"));

  }
  else
  {
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "persistentIdentifierForScope:", *(_QWORD *)(a1 + 48));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("source %@ error %@"), v13, v6);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "logImageStoreCacheMiss:", v14);

    v15 = *(_QWORD *)(a1 + 56);
    if (v15)
    {
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v15 + 16))(v15, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      v19 = objc_msgSend(*(id *)(a1 + 32), "resourceExistsInCacheForItem:scope:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
      if (v19)
        *(_BYTE *)(v20 + 24) = 0;
      else
        *(_BYTE *)(v20 + 24) = 1;
    }
  }

}

+ (void)clearContentAtLocation:(id)a3 logger:(id)a4
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a4;
  v6 = (objc_class *)MEMORY[0x1E0CB3620];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  v13 = 0;
  v9 = objc_msgSend(v8, "removeItemAtURL:error:", v7, &v13);

  v10 = v13;
  v11 = v10;
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v10, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logFileSystemError:", v12);

  }
}

- (AVTImageStore)initWithEnvironment:(id)a3 validateImages:(BOOL)a4 location:(id)a5 encoder:(id)a6
{
  id v10;
  id v11;
  id v12;
  AVTImageStore *v13;
  NSFileManager *v14;
  NSFileManager *fileManager;
  uint64_t v16;
  NSURL *location;
  void (**v18)(_QWORD, _QWORD);
  uint64_t v19;
  OS_dispatch_queue *stateLock;
  uint64_t v21;
  AVTUILogger *logger;
  AVTUILogger *v23;
  void *v24;
  objc_super v26;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v26.receiver = self;
  v26.super_class = (Class)AVTImageStore;
  v13 = -[AVTImageStore init](&v26, sel_init);
  if (v13)
  {
    v14 = (NSFileManager *)objc_alloc_init(MEMORY[0x1E0CB3620]);
    fileManager = v13->_fileManager;
    v13->_fileManager = v14;

    v16 = objc_msgSend(v11, "copy");
    location = v13->_location;
    v13->_location = (NSURL *)v16;

    objc_storeStrong((id *)&v13->_imageEncoder, a6);
    objc_msgSend(v10, "lockProvider");
    v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, const char *))v18)[2](v18, "com.apple.AvatarUI.AVTImageStore.stateLock");
    v19 = objc_claimAutoreleasedReturnValue();
    stateLock = v13->_stateLock;
    v13->_stateLock = (OS_dispatch_queue *)v19;

    objc_msgSend(v10, "logger");
    v21 = objc_claimAutoreleasedReturnValue();
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v21;

    v23 = v13->_logger;
    -[NSURL path](v13->_location, "path");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTUILogger logCreatingImageStoreForPath:](v23, "logCreatingImageStoreForPath:", v24);

    v13->_validateImages = a4;
  }

  return v13;
}

- (BOOL)createDirectoryIfNeeded:(id *)a3
{
  int v4;
  BOOL v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 1;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__22;
  v12 = __Block_byref_object_dispose__22;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41__AVTImageStore_createDirectoryIfNeeded___block_invoke;
  v7[3] = &unk_1EA5202D0;
  v7[4] = self;
  v7[5] = &v14;
  v7[6] = &v8;
  -[AVTImageStore performStateWork:](self, "performStateWork:", v7);
  v4 = *((unsigned __int8 *)v15 + 24);
  if (a3 && !*((_BYTE *)v15 + 24))
  {
    *a3 = objc_retainAutorelease((id)v9[5]);
    v4 = *((unsigned __int8 *)v15 + 24);
  }
  v5 = v4 != 0;
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

- (BOOL)deleteImagesForItemsWithPersistentIdentifierPrefix:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  BOOL v25;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[AVTImageStore fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageStore location](self, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "fileExistsAtPath:", v9);

  if (v10)
  {
    -[AVTImageStore logger](self, "logger");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "logDeletingImagesWithIdentifierPrefix:", v6);

    -[AVTImageStore fileManager](self, "fileManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTImageStore location](self, "location");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v13, MEMORY[0x1E0C9AA60], 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      v15 = v14;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v16)
      {
        v17 = v16;
        v27 = v14;
        v18 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v29 != v18)
              objc_enumerationMutation(v15);
            v20 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            objc_msgSend(v20, "lastPathComponent");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "hasPrefix:", v6);

            if (v22)
            {
              -[AVTImageStore fileManager](self, "fileManager");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v24 = objc_msgSend(v23, "removeItemAtURL:error:", v20, a4);

              if (!v24)
              {
                v25 = 0;
                goto LABEL_16;
              }
            }
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v17)
            continue;
          break;
        }
        v25 = 1;
LABEL_16:
        v14 = v27;
      }
      else
      {
        v25 = 1;
      }

    }
    else
    {
      v25 = 0;
    }

  }
  else
  {
    v25 = 1;
  }

  return v25;
}

- (BOOL)copyImagesForPersistentIdentifierPrefix:(id)a3 toPersistentIdentifierPrefix:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  BOOL v31;
  void *v33;
  id *v34;
  id v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  -[AVTImageStore fileManager](self, "fileManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageStore location](self, "location");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v9, "fileExistsAtPath:", v11);

  if ((v12 & 1) != 0)
  {
    -[AVTImageStore fileManager](self, "fileManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTImageStore location](self, "location");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v14, MEMORY[0x1E0C9AA60], 0, a5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v15)
      goto LABEL_22;
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v16 = v15;
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    if (v17)
    {
      v18 = v17;
      v33 = v15;
      v34 = a5;
      v19 = 0;
      v20 = *(_QWORD *)v37;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v37 != v20)
            objc_enumerationMutation(v16);
          v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "hasPrefix:", v8);

          if (v24)
          {
            objc_msgSend(v22, "lastPathComponent");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "stringByReplacingOccurrencesOfString:withString:", v8, v35);
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v22, "URLByDeletingLastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "URLByAppendingPathComponent:", v26);
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            -[AVTImageStore fileManager](self, "fileManager");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = objc_msgSend(v29, "copyItemAtURL:toURL:error:", v22, v28, v34);

            if ((v30 & 1) == 0)
            {

              v31 = 0;
              v15 = v33;
              goto LABEL_23;
            }
            v19 = 1;
          }
        }
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v18)
          continue;
        break;
      }

      v15 = v33;
      a5 = v34;
      if ((v19 & 1) != 0)
      {
        v31 = 1;
        goto LABEL_23;
      }
    }
    else
    {

    }
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_22:
      v31 = 0;
    }
LABEL_23:

  }
  else if (a5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
    v31 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)imageForItem:(id)a3 scope:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;

  v8 = a3;
  -[AVTImageStore resourceURLForItem:scope:](self, "resourceURLForItem:scope:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "requiresEncryption");

  if (v10
    && !-[AVTImageStore applyFileProtectionForResourceAtURL:error:](self, "applyFileProtectionForResourceAtURL:error:", v9, a5))
  {
    v12 = 0;
  }
  else
  {
    -[AVTImageStore imageEncoder](self, "imageEncoder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "imageFromURL:error:", v9, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (BOOL)applyFileProtectionForResourceAtURL:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;

  v6 = a3;
  -[AVTImageStore fileManager](self, "fileManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "attributesOfItemAtPath:error:", v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = *MEMORY[0x1E0CB2AD8];
    objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2AD8]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    AVTDefaultFileProtectionType();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isEqual:", v12);

    if ((v13 & 1) != 0)
      goto LABEL_4;
    v14 = (void *)objc_msgSend(v9, "mutableCopy");
    AVTDefaultFileProtectionType();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v15, v10);

    -[AVTImageStore fileManager](self, "fileManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "setAttributes:ofItemAtPath:error:", v14, v17, a4);

    if (v18)
LABEL_4:
      LOBYTE(v18) = 1;
  }
  else
  {
    LOBYTE(v18) = 0;
  }

  return v18;
}

- (id)imageForItem:(id)a3 scope:(id)a4
{
  return -[AVTImageStore _imageForItem:scope:cacheMissHandler:](self, "_imageForItem:scope:cacheMissHandler:", a3, a4, 0);
}

- (id)_imageForItem:(id)a3 scope:(id)a4 cacheMissHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v31 = 0;
    v32 = &v31;
    v33 = 0x3032000000;
    v34 = __Block_byref_object_copy__22;
    v35 = __Block_byref_object_dispose__22;
    v36 = 0;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __54__AVTImageStore__imageForItem_scope_cacheMissHandler___block_invoke;
    v21[3] = &unk_1EA5202F8;
    v25 = &v31;
    v21[4] = self;
    v11 = v8;
    v22 = v11;
    v12 = v9;
    v23 = v12;
    v24 = v10;
    v26 = &v27;
    -[AVTImageStore performStateWork:](self, "performStateWork:", v21);
    if (*((_BYTE *)v28 + 24))
    {
      v13 = v32[5];
      v20 = 0;
      v14 = -[AVTImageStore saveImage:forItem:scope:error:](self, "saveImage:forItem:scope:error:", v13, v11, v12, &v20);
      v15 = v20;
      if (!v14)
      {
        -[AVTImageStore logger](self, "logger");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "description");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "logImageStoreSavingError:code:", v17, objc_msgSend(v15, "code"));

      }
    }
    v18 = (id)v32[5];

    _Block_object_dispose(&v27, 8);
    _Block_object_dispose(&v31, 8);

  }
  else if (v10)
  {
    (*((void (**)(id, id, id))v10 + 2))(v10, v8, v9);
    v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)resourceExistsInCacheForItem:(id)a3 scope:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[AVTImageStore resourceURLForItem:scope:](self, "resourceURLForItem:scope:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTImageStore fileManager](self, "fileManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  return v8;
}

- (NSFileManager)fileManager
{
  return self->_fileManager;
}

- (AVTImageEncoder)imageEncoder
{
  return self->_imageEncoder;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (BOOL)validateImages
{
  return self->_validateImages;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_stateLock, 0);
  objc_storeStrong((id *)&self->_imageEncoder, 0);
  objc_storeStrong((id *)&self->_fileManager, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
