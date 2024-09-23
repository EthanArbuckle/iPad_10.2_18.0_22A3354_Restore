@implementation ICAttachmentPreviewImage

void __37__ICAttachmentPreviewImage_fileQueue__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  const char *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  uint64_t v12;
  void *v13;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
  {
    v2 = (void *)ICAttachmentPreviewImageFileQueuesMap;
    if (!ICAttachmentPreviewImageFileQueuesMap)
    {
      objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = (void *)ICAttachmentPreviewImageFileQueuesMap;
      ICAttachmentPreviewImageFileQueuesMap = v3;

      v2 = (void *)ICAttachmentPreviewImageFileQueuesMap;
    }
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 208);
    *(_QWORD *)(v6 + 208) = v5;

    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 208))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-fileAccess"), *(_QWORD *)(a1 + 40));
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = (const char *)objc_msgSend(v8, "UTF8String");
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = dispatch_queue_create(v9, v10);
      v12 = *(_QWORD *)(a1 + 32);
      v13 = *(void **)(v12 + 208);
      *(_QWORD *)(v12 + 208) = v11;

      objc_msgSend((id)ICAttachmentPreviewImageFileQueuesMap, "setObject:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208), *(_QWORD *)(a1 + 40));
    }
  }
}

- (OS_dispatch_queue)fileQueue
{
  void *v3;
  NSObject *v4;
  id v5;
  OS_dispatch_queue *v6;
  _QWORD v8[5];
  id v9;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICAttachmentPreviewImage fileGlobalQueue](ICAttachmentPreviewImage, "fileGlobalQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __37__ICAttachmentPreviewImage_fileQueue__block_invoke;
  v8[3] = &unk_1E76C73B0;
  v8[4] = self;
  v9 = v3;
  v5 = v3;
  dispatch_sync(v4, v8);

  v6 = self->_fileQueue;
  return v6;
}

- (BOOL)imageIsWriting
{
  void *v2;
  BOOL v3;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[ICAttachmentPreviewImage updateFileWriteCounterBy:identifier:](ICAttachmentPreviewImage, "updateFileWriteCounterBy:identifier:", 0, v2) > 0;

  return v3;
}

- (BOOL)imageIsValid
{
  char v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (-[ICAttachmentPreviewImage hasCachedImage](self, "hasCachedImage") & 1) != 0)
  {
    return 1;
  }
  v4 = -[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected");
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 1) != 0)
    -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
  else
    -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "fileExistsAtPath:", v7);

  return v8;
}

- (id)previewImageURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  char v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;

  -[ICAttachmentPreviewImage previewImageFallbackURL](self, "previewImageFallbackURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewImage encryptedPreviewImageFallbackURL](self, "encryptedPreviewImageFallbackURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewImage generationManager](self, "generationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "generationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    if (!v3)
    {
      v10 = 0;
      if (v4)
      {
LABEL_9:
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v12 = objc_claimAutoreleasedReturnValue();
        v22 = v10;
        v13 = -[NSObject removeItemAtURL:error:](v12, "removeItemAtURL:error:", v4, &v22);
        v14 = v22;

        if ((v13 & 1) == 0)
        {
          v15 = objc_msgSend(v14, "code");

          if (v15 == 4)
          {
LABEL_17:
            -[ICAttachmentPreviewImage generationManager](self, "generationManager");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "generationURL");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "URLByAppendingPathComponent:isDirectory:", CFSTR("Preview"), 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            -[ICAttachmentPreviewImage previewImagePathExtension](self, "previewImagePathExtension");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "URLByAppendingPathExtension:", v20);
            v16 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_18;
          }
          v12 = os_log_create("com.apple.notes", "PreviewGeneration");
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            -[ICAttachmentPreviewImage previewImageURL].cold.1();
        }

        goto LABEL_17;
      }
LABEL_16:
      v14 = v10;
      goto LABEL_17;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v8 = -[NSObject removeItemAtURL:error:](v7, "removeItemAtURL:error:", v3, &v23);
    v9 = v23;
    v10 = v9;
    if ((v8 & 1) == 0)
    {
      v11 = objc_msgSend(v9, "code");

      if (v11 == 4)
        goto LABEL_8;
      v7 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[ICAttachmentPreviewImage previewImageURL].cold.2();
    }

LABEL_8:
    if (v4)
      goto LABEL_9;
    goto LABEL_16;
  }
  v16 = v3;
  v14 = 0;
LABEL_18:

  return v16;
}

- (ICAssetGenerationManager)generationManager
{
  void *v3;
  void *v4;
  void *v5;
  ICAssetGenerationManager *generationManager;
  void *v7;
  ICAssetGenerationManager *v8;
  void *v9;
  ICAssetGenerationManager *v10;
  ICAssetGenerationManager *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  -[ICAttachmentPreviewImage containerDirectoryURL](self, "containerDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
    return (ICAssetGenerationManager *)v3;
  v4 = v3;
  -[ICAttachmentPreviewImage containerAccount](self, "containerAccount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v3 = 0;
    return (ICAssetGenerationManager *)v3;
  }
  generationManager = self->_generationManager;
  if (!generationManager)
  {
    NSStringFromSelector(sel_generation);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = [ICAssetGenerationManager alloc];
    -[ICAttachmentPreviewImage containerDirectoryURL](self, "containerDirectoryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[ICAssetGenerationManager initWithObject:generationKeyPath:containerURL:](v8, "initWithObject:generationKeyPath:containerURL:", self, v7, v9);
    v11 = self->_generationManager;
    self->_generationManager = v10;

    -[ICAttachmentPreviewImage previewImageFallbackURL](self, "previewImageFallbackURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage encryptedPreviewImageFallbackURL](self, "encryptedPreviewImageFallbackURL", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = v13;
    -[ICAttachmentPreviewImage orientedPreviewImageFallbackURLWithoutCreating](self, "orientedPreviewImageFallbackURLWithoutCreating");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17[2] = v14;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAssetGenerationManager setFallbackURLs:](self->_generationManager, "setFallbackURLs:", v15);

    generationManager = self->_generationManager;
  }
  return generationManager;
}

- (id)containerDirectoryURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentPreviewImage previewImageDirectoryURL](self, "previewImageDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)orientedPreviewImageFallbackURLWithoutCreating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("-oriented"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentPreviewImage previewImagePathExtension](self, "previewImagePathExtension");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathExtension:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICAttachmentPreviewImage containerAccount](self, "containerAccount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewImageDirectoryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v6, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (int64_t)updateFileWriteCounterBy:(int64_t)a3 identifier:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  int64_t v8;
  _QWORD block[4];
  id v11;
  uint64_t *v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v5 = a4;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  +[ICAttachmentPreviewImage fileGlobalQueue](ICAttachmentPreviewImage, "fileGlobalQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ICAttachmentPreviewImage_updateFileWriteCounterBy_identifier___block_invoke;
  block[3] = &unk_1E76C9E70;
  v11 = v5;
  v12 = &v14;
  v13 = a3;
  v7 = v5;
  dispatch_sync(v6, block);

  v8 = v15[3];
  _Block_object_dispose(&v14, 8);
  return v8;
}

+ (id)fileGlobalQueue
{
  if (fileGlobalQueue_once != -1)
    dispatch_once(&fileGlobalQueue_once, &__block_literal_global_26);
  return (id)fileGlobalQueue_fileGlobalQueue;
}

- (void)willTurnIntoFault
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentPreviewImage;
  -[ICAttachmentPreviewImage willTurnIntoFault](&v3, sel_willTurnIntoFault);
  -[ICAttachmentPreviewImage invalidateCache](self, "invalidateCache");
}

- (void)invalidateCache
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentPreviewImage clearCachedImage](self, "clearCachedImage");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentPreviewImage clearCachedOrientedImage](self, "clearCachedOrientedImage");
}

- (id)encryptedPreviewImageFallbackURL
{
  void *v2;
  void *v3;

  -[ICAttachmentPreviewImage previewImageFallbackURL](self, "previewImageFallbackURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("encrypted"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)previewImageFallbackURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentPreviewImage previewImageDirectoryURL](self, "previewImageDirectoryURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICAttachmentPreviewImage previewImagePathExtension](self, "previewImagePathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "URLByAppendingPathExtension:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)previewImageDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[ICAttachmentPreviewImage containerAccount](self, "containerAccount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "previewImageDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64240], "defaultPreviewImageDirectoryURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (id)containerAccount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;

  -[ICAttachmentPreviewImage attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "note");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[ICAttachmentPreviewImage attachment](self, "attachment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "note");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "folder");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "account");
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (!v7)
  {
    -[ICAttachmentPreviewImage placeholderAccount](self, "placeholderAccount");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      -[ICAttachmentPreviewImage managedObjectContext](self, "managedObjectContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[ICAccount defaultAccountInContext:](ICAccount, "defaultAccountInContext:", v11);
      v7 = (id)objc_claimAutoreleasedReturnValue();

      v12 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[ICAttachmentPreviewImage containerAccount].cold.1(self, v7);

    }
  }
  -[ICAttachmentPreviewImage setPlaceholderAccount:](self, "setPlaceholderAccount:", v7);
  return v7;
}

- (void)setPlaceholderAccount:(id)a3
{
  objc_storeWeak((id *)&self->placeholderAccount, a3);
}

- (id)previewImagePathExtension
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[ICAttachmentPreviewImage attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attachmentModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previewImageTypeUTI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CEC530];
  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", v6))
    v7 = v5;
  else
    v7 = (void *)*MEMORY[0x1E0CEC580];
  objc_msgSend(v7, "preferredFilenameExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generationManager, 0);
  objc_storeStrong((id *)&self->_fileQueue, 0);
  objc_destroyWeak((id *)&self->placeholderAccount);
}

- (unint64_t)imageID
{
  return self->_imageID;
}

void __64__ICAttachmentPreviewImage_updateFileWriteCounterBy_identifier___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;

  v2 = (void *)ICAttachmentPreviewFileWriteCounterMap;
  if (!ICAttachmentPreviewFileWriteCounterMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)ICAttachmentPreviewFileWriteCounterMap;
    ICAttachmentPreviewFileWriteCounterMap = v3;

    v2 = (void *)ICAttachmentPreviewFileWriteCounterMap;
  }
  objc_msgSend(v2, "objectForKey:", a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v5;
  if (v5)
  {
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = objc_msgSend(v5, "integerValue");
    v5 = v9;
  }
  v6 = a1[6];
  if (v6)
  {
    v7 = (void *)ICAttachmentPreviewFileWriteCounterMap;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) + v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, a1[4]);

    v5 = v9;
  }

}

- (ICAttachmentPreviewImage)initWithEntity:(id)a3 insertIntoManagedObjectContext:(id)a4
{
  ICAttachmentPreviewImage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ICAttachmentPreviewImage;
  result = -[ICCloudSyncingObject initWithEntity:insertIntoManagedObjectContext:](&v5, sel_initWithEntity_insertIntoManagedObjectContext_, a3, a4);
  __dmb(0xBu);
  return result;
}

- (void)awakeFromFetch
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ICAttachmentPreviewImage;
  -[ICCloudSyncingObject awakeFromFetch](&v3, sel_awakeFromFetch);
  -[ICAssetGenerationManager updateCurrentGeneration](self->_generationManager, "updateCurrentGeneration");
}

void __43__ICAttachmentPreviewImage_fileGlobalQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("fileGlobalAccess", v2);
  v1 = (void *)fileGlobalQueue_fileGlobalQueue;
  fileGlobalQueue_fileGlobalQueue = (uint64_t)v0;

}

- (CGSize)size
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  -[ICAttachmentPreviewImage width](self, "width");
  v4 = v3;
  -[ICAttachmentPreviewImage height](self, "height");
  v6 = v5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

+ (void)purgePreviewImageFilesForIdentifiers:(id)a3 account:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  id obj;
  uint64_t v19;
  id v21;
  uint64_t v22;
  void *context;
  uint64_t v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  id v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v21 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
  v7 = 0;
  if (v22)
  {
    v19 = *(_QWORD *)v31;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(obj);
        v24 = v8;
        v9 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * v8);
        context = (void *)MEMORY[0x1C3B7AC74]();
        objc_msgSend(a1, "previewImageURLsForIdentifier:account:", v9, v21);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v27;
          do
          {
            v14 = 0;
            do
            {
              v15 = v7;
              if (*(_QWORD *)v27 != v13)
                objc_enumerationMutation(v10);
              v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v14);
              v25 = v7;
              objc_msgSend(v6, "removeItemAtURL:error:", v16, &v25);
              v7 = v25;

              if (v7 && objc_msgSend(v7, "code") != 4)
              {
                v17 = os_log_create("com.apple.notes", "PreviewGeneration");
                if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v35 = v16;
                  v36 = 2112;
                  v37 = v7;
                  _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "failed to remove media directory at URL: %@, error: %@", buf, 0x16u);
                }

              }
              ++v14;
            }
            while (v12 != v14);
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v38, 16);
          }
          while (v12);
        }

        objc_autoreleasePoolPop(context);
        v8 = v24 + 1;
      }
      while (v24 + 1 != v22);
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    }
    while (v22);
  }

}

+ (id)concurrentFileLoadLimitSemaphore
{
  if (concurrentFileLoadLimitSemaphore_once != -1)
    dispatch_once(&concurrentFileLoadLimitSemaphore_once, &__block_literal_global_64);
  return (id)concurrentFileLoadLimitSemaphore_sema;
}

void __60__ICAttachmentPreviewImage_concurrentFileLoadLimitSemaphore__block_invoke()
{
  dispatch_semaphore_t v0;
  void *v1;

  v0 = dispatch_semaphore_create(2);
  v1 = (void *)concurrentFileLoadLimitSemaphore_sema;
  concurrentFileLoadLimitSemaphore_sema = (uint64_t)v0;

}

+ (id)fileQueueGroup
{
  if (fileQueueGroup_once != -1)
    dispatch_once(&fileQueueGroup_once, &__block_literal_global_28);
  return (id)fileQueueGroup_fileGroup;
}

void __42__ICAttachmentPreviewImage_fileQueueGroup__block_invoke()
{
  dispatch_group_t v0;
  void *v1;

  v0 = dispatch_group_create();
  v1 = (void *)fileQueueGroup_fileGroup;
  fileQueueGroup_fileGroup = (uint64_t)v0;

}

+ (void)waitUntilAllFileWritesAreFinished
{
  NSObject *v2;

  +[ICAttachmentPreviewImage fileQueueGroup](ICAttachmentPreviewImage, "fileQueueGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);

}

- (void)suppressFileDeletion
{
  -[ICAttachmentPreviewImage setSuppressesFileDeletion:](self, "setSuppressesFileDeletion:", 1);
}

- (void)prepareForDeletion
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "objectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v4, v5, "Not deleting files for attachment preview image - identifier: %@, object ID: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)accountWillChangeToAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v14;
  unint64_t v15;
  void *v16;
  os_log_t v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  __int128 v30;
  ICAttachmentPreviewImage *v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewImage containerAccount](self, "containerAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_opt_class();
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previewImageURLsForIdentifier:account:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_class();
  v31 = self;
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "previewImageURLsForIdentifier:account:", v11, v4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v32 = v6;
  if (objc_msgSend(v6, "isEqual:", v4))
  {
    v13 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[ICAttachmentPreviewImage accountWillChangeToAccount:].cold.1();

  }
  if (objc_msgSend(v9, "count"))
  {
    v33 = 0;
    v15 = 0;
    *(_QWORD *)&v14 = 138412290;
    v30 = v14;
    while (1)
    {
      if (v15 >= objc_msgSend(v12, "count", v30))
        goto LABEL_24;
      if (v4)
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "path");
        v17 = (os_log_t)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v5, "fileExistsAtPath:", v17))
          goto LABEL_19;
        objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "isEqual:", v19);

        if ((v20 & 1) == 0)
          break;
      }
LABEL_20:
      if (++v15 >= objc_msgSend(v9, "count"))
        goto LABEL_24;
    }
    objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLByDeletingLastPathComponent");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v33;
    objc_msgSend(v5, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v22, 1, 0, &v35);
    v23 = v35;

    if (v23)
    {
      v24 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v30;
        v37 = v23;
        _os_log_error_impl(&dword_1BD918000, v24, OS_LOG_TYPE_ERROR, "Error creating preview image directory %@", buf, 0xCu);
      }

    }
    objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v15);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v23;
    objc_msgSend(v5, "moveItemAtURL:toURL:error:", v25, v26, &v34);
    v27 = v34;

    v33 = v27;
    if (!v27)
    {
      v33 = 0;
      goto LABEL_20;
    }
    v17 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v37 = v29;
      v38 = 2112;
      v39 = v33;
      _os_log_error_impl(&dword_1BD918000, v17, OS_LOG_TYPE_ERROR, "Error moving preview image file %@, error %@", buf, 0x16u);

    }
    v16 = v17;
LABEL_19:

    goto LABEL_20;
  }
  v33 = 0;
LABEL_24:
  if (v4)
    -[ICAttachmentPreviewImage setPlaceholderAccount:](v31, "setPlaceholderAccount:", v4);

}

- (void)removeItemAtURL:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  char v6;
  id v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3620];
    v4 = a3;
    objc_msgSend(v3, "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    v6 = objc_msgSend(v5, "removeItemAtURL:error:", v4, &v9);

    v7 = v9;
    if ((v6 & 1) == 0 && objc_msgSend(v7, "code") != 4)
    {
      v8 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v11 = v7;
        _os_log_impl(&dword_1BD918000, v8, OS_LOG_TYPE_DEFAULT, "Error removing preview image file: %@", buf, 0xCu);
      }

    }
  }
}

- (void)invalidateOrientedImage
{
  id v3;

  ++self->_imageID;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentPreviewImage clearCachedOrientedImage](self, "clearCachedOrientedImage");
  -[ICAttachmentPreviewImage orientedPreviewImageURLWithoutCreating](self, "orientedPreviewImageURLWithoutCreating");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewImage removeItemAtURL:](self, "removeItemAtURL:", v3);

}

- (void)invalidateImage
{
  -[ICAttachmentPreviewImage invalidateCache](self, "invalidateCache");
  -[ICAttachmentPreviewImage invalidateOrientedImage](self, "invalidateOrientedImage");
}

- (CGAffineTransform)orientedImageTransform
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  CGAffineTransform *result;
  id v10;

  -[ICAttachmentPreviewImage attachment](self, "attachment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v10 = v4;
    objc_msgSend(v4, "attachmentModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "previewImageOrientationTransform");
    }
    else
    {
      *(_OWORD *)&retstr->c = 0u;
      *(_OWORD *)&retstr->tx = 0u;
      *(_OWORD *)&retstr->a = 0u;
    }

    v4 = v10;
  }
  else
  {
    v7 = MEMORY[0x1E0C9BAA8];
    v8 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v8;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v7 + 32);
  }

  return result;
}

- (BOOL)setImageData:(id)a3 withSize:(CGSize)a4 scale:(double)a5 appearanceType:(unint64_t)a6
{
  __int16 v6;
  double height;
  double width;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  char v20;
  NSObject *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  char v28;
  BOOL v29;
  _QWORD block[4];
  id v32;
  ICAttachmentPreviewImage *v33;
  id v34;
  id v35;
  id v36;
  uint64_t *v37;
  char v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 1;
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.identifier != ((void *)0)", "-[ICAttachmentPreviewImage setImageData:withSize:scale:appearanceType:]", 1, 0, CFSTR("Why doesn't the preview image have an identifier?"));
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage setIdentifier:](self, "setIdentifier:", v15);

  }
  -[ICAttachmentPreviewImage invalidateImage](self, "invalidateImage");
  -[ICAttachmentPreviewImage generationManager](self, "generationManager");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "beginGeneration");

  if (v17)
  {
    -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = -[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected");
    -[ICAttachmentPreviewImage fileQueue](self, "fileQueue");
    v21 = objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage identifier](self, "identifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage setWidth:](self, "setWidth:", width);
    -[ICAttachmentPreviewImage setHeight:](self, "setHeight:", height);
    -[ICAttachmentPreviewImage setScale:](self, "setScale:", a5);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage setModifiedDate:](self, "setModifiedDate:", v23);

    -[ICAttachmentPreviewImage setAppearanceType:](self, "setAppearanceType:", v6);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke;
    block[3] = &unk_1E76CF988;
    v24 = v22;
    v32 = v24;
    v33 = self;
    v37 = &v39;
    v38 = v20;
    v34 = v11;
    v25 = v18;
    v35 = v25;
    v26 = v19;
    v36 = v26;
    dispatch_sync(v21, block);
    if (*((_BYTE *)v40 + 24))
    {
      -[ICAttachmentPreviewImage generationManager](self, "generationManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "commitGeneration");
      *((_BYTE *)v40 + 24) = v28;
    }
    else
    {
      -[ICAttachmentPreviewImage generationManager](self, "generationManager");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "rollbackGeneration");
    }

    v29 = *((_BYTE *)v40 + 24) != 0;
  }
  else
  {
    v29 = 0;
  }
  _Block_object_dispose(&v39, 8);

  return v29;
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  int v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  id v25;

  +[ICAttachmentPreviewImage fileQueueGroup](ICAttachmentPreviewImage, "fileQueueGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  +[ICAttachmentPreviewImage updateFileWriteCounterBy:identifier:](ICAttachmentPreviewImage, "updateFileWriteCounterBy:identifier:", 1, *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  v25 = 0;
  v4 = objc_msgSend(v3, "makeSurePreviewImageDirectoryExists:", &v25);
  v5 = v25;
  if ((v4 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 80))
    {
      objc_msgSend(*(id *)(a1 + 40), "cryptoStrategy");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v6, "writeEncryptedImageData:", *(_QWORD *)(a1 + 48));

    }
    else
    {
      v8 = *(void **)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      v24 = v5;
      v10 = objc_msgSend(v8, "writeToURL:options:error:", v9, 1, &v24);
      v11 = v24;

      if ((v10 & 1) == 0)
      {
        v12 = os_log_create("com.apple.notes", "PreviewGeneration");
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_2((uint64_t *)(a1 + 32), (uint64_t)v11, v12);

        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
      }
      v5 = v11;
    }
  }
  else
  {
    v7 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_3();

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 0;
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
  {
    v13 = 64;
    if (!*(_BYTE *)(a1 + 80))
      v13 = 56;
    v14 = *(id *)(a1 + v13);
    v23 = 0;
    v15 = *MEMORY[0x1E0C998D8];
    v22 = 0;
    v16 = objc_msgSend(v14, "getResourceValue:forKey:error:", &v23, v15, &v22);
    v17 = v23;
    v18 = v22;
    v19 = v18;
    if (v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "setModifiedDate:", v17);
    }
    else if (v18)
    {
      v20 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1((uint64_t)v19, v14, v20);

    }
    objc_msgSend(*(id *)(a1 + 40), "updateFlagToExcludeFromCloudBackup");

  }
  +[ICAttachmentPreviewImage updateFileWriteCounterBy:identifier:](ICAttachmentPreviewImage, "updateFileWriteCounterBy:identifier:", -1, *(_QWORD *)(a1 + 32));
  +[ICAttachmentPreviewImage fileQueueGroup](ICAttachmentPreviewImage, "fileQueueGroup");
  v21 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v21);

}

- (BOOL)setScaledImageFromImageSrc:(CGImageSource *)a3 typeUTI:(__CFString *)a4
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  double v17;
  double v18;
  double v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  BOOL v26;
  _QWORD block[4];
  id v29;
  ICAttachmentPreviewImage *v30;
  id v31;
  id v32;
  uint64_t *v33;
  __CFString *v34;
  CGImageSource *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 0;
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    objc_msgSend(MEMORY[0x1E0D641A0], "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "self.identifier != ((void *)0)", "-[ICAttachmentPreviewImage setScaledImageFromImageSrc:typeUTI:]", 1, 0, CFSTR("Why doesn't the preview image have an identifier?"));
  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "UUIDString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage setIdentifier:](self, "setIdentifier:", v10);

  }
  -[ICAttachmentPreviewImage invalidateImage](self, "invalidateImage");
  -[ICAttachmentPreviewImage generationManager](self, "generationManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "beginGeneration");

  if (v12)
  {
    -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICAttachmentPreviewImage identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected");
    -[ICAttachmentPreviewImage width](self, "width");
    v18 = v17;
    -[ICAttachmentPreviewImage height](self, "height");
    if (v18 < v19)
      v18 = v19;
    CFRetain(a3);
    -[ICAttachmentPreviewImage fileQueue](self, "fileQueue");
    v20 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke;
    block[3] = &unk_1E76CF9B0;
    v21 = v15;
    v29 = v21;
    v30 = self;
    v37 = v16;
    v34 = a4;
    v22 = v13;
    v35 = a3;
    v36 = (uint64_t)v18;
    v31 = v22;
    v33 = &v38;
    v23 = v14;
    v32 = v23;
    dispatch_sync(v20, block);

    if (*((_BYTE *)v39 + 24))
    {
      -[ICAttachmentPreviewImage generationManager](self, "generationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "commitGeneration");
      *((_BYTE *)v39 + 24) = v25;
    }
    else
    {
      -[ICAttachmentPreviewImage generationManager](self, "generationManager");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "rollbackGeneration");
    }

    v26 = *((_BYTE *)v39 + 24) != 0;
  }
  else
  {
    v26 = 0;
  }
  _Block_object_dispose(&v38, 8);
  return v26;
}

void __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  __CFData *v6;
  CGImageDestination *v7;
  CGImageSource *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  const __CFDictionary *v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  int v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[3];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  +[ICAttachmentPreviewImage fileQueueGroup](ICAttachmentPreviewImage, "fileQueueGroup");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_group_enter(v2);

  +[ICAttachmentPreviewImage updateFileWriteCounterBy:identifier:](ICAttachmentPreviewImage, "updateFileWriteCounterBy:identifier:", 1, *(_QWORD *)(a1 + 32));
  v3 = *(void **)(a1 + 40);
  v25 = 0;
  v4 = objc_msgSend(v3, "makeSurePreviewImageDirectoryExists:", &v25);
  v5 = v25;
  if ((v4 & 1) != 0)
  {
    if (*(_BYTE *)(a1 + 96))
    {
      objc_msgSend(MEMORY[0x1E0C99DF0], "data");
      v6 = (__CFData *)objc_claimAutoreleasedReturnValue();
      v7 = CGImageDestinationCreateWithData(v6, *(CFStringRef *)(a1 + 72), 1uLL, 0);
      if (!v7)
      {
LABEL_5:
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && *(_BYTE *)(a1 + 96))
        {
          objc_msgSend(*(id *)(a1 + 40), "cryptoStrategy");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v13, "writeEncryptedImageData:", v6);

        }
        goto LABEL_10;
      }
    }
    else
    {
      v7 = CGImageDestinationCreateWithURL(*(CFURLRef *)(a1 + 48), *(CFStringRef *)(a1 + 72), 1uLL, 0);
      v6 = 0;
      if (!v7)
        goto LABEL_5;
    }
    v26[0] = *MEMORY[0x1E0CBC778];
    v8 = *(CGImageSource **)(a1 + 80);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", *(_QWORD *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x1E0CBD178];
    v27[0] = v9;
    v27[1] = MEMORY[0x1E0C9AAB0];
    v11 = *MEMORY[0x1E0CBD190];
    v26[1] = v10;
    v26[2] = v11;
    v27[2] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 3);
    v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImageFromSource(v7, v8, 0, v12);

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = CGImageDestinationFinalize(v7);
    CFRelease(v7);
    goto LABEL_5;
  }
  v6 = (__CFData *)os_log_create("com.apple.notes", "PreviewGeneration");
  if (os_log_type_enabled((os_log_t)v6, OS_LOG_TYPE_ERROR))
    __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke_cold_2();
LABEL_10:

  CFRelease(*(CFTypeRef *)(a1 + 80));
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    v14 = 56;
    if (!*(_BYTE *)(a1 + 96))
      v14 = 48;
    v15 = *(id *)(a1 + v14);
    v24 = 0;
    v16 = *MEMORY[0x1E0C998D8];
    v23 = 0;
    v17 = objc_msgSend(v15, "getResourceValue:forKey:error:", &v24, v16, &v23);
    v18 = v24;
    v19 = v23;
    v20 = v19;
    if (v17)
    {
      objc_msgSend(*(id *)(a1 + 40), "setModifiedDate:", v18);
    }
    else if (v19)
    {
      v21 = os_log_create("com.apple.notes", "PreviewGeneration");
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1((uint64_t)v20, v15, v21);

    }
    objc_msgSend(*(id *)(a1 + 40), "updateFlagToExcludeFromCloudBackup");

  }
  +[ICAttachmentPreviewImage updateFileWriteCounterBy:identifier:](ICAttachmentPreviewImage, "updateFileWriteCounterBy:identifier:", -1, *(_QWORD *)(a1 + 32));
  +[ICAttachmentPreviewImage fileQueueGroup](ICAttachmentPreviewImage, "fileQueueGroup");
  v22 = objc_claimAutoreleasedReturnValue();
  dispatch_group_leave(v22);

}

- (BOOL)makeSurePreviewImageDirectoryExists:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  char v10;

  -[ICAttachmentPreviewImage containerAccount](self, "containerAccount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewImageDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D64240], "defaultPreviewImageDirectoryURL");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v8, 1, 0, a3);

  return v10;
}

+ (id)identifierForContentIdentifier:(id)a3 scale:(double)a4 width:(double)a5 height:(double)a6 appearanceType:(unint64_t)a7
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%d-%dx%d-%d"), a3, (int)a4, (int)a5, (int)a6, a7);
}

- (id)encryptedPreviewImageURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ICAttachmentPreviewImage generationManager](self, "generationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "generationURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathExtension:", CFSTR("encrypted"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachmentPreviewImage encryptedPreviewImageFallbackURL](self, "encryptedPreviewImageFallbackURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)orientedPreviewImageURLWithoutCreating
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[ICAttachmentPreviewImage identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[ICAttachmentPreviewImage generationManager](self, "generationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "generationURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[ICAttachmentPreviewImage generationManager](self, "generationManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "generationURL");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", CFSTR("OrientedPreview"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      -[ICAttachmentPreviewImage previewImagePathExtension](self, "previewImagePathExtension");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "URLByAppendingPathExtension:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      -[ICAttachmentPreviewImage orientedPreviewImageFallbackURLWithoutCreating](self, "orientedPreviewImageFallbackURLWithoutCreating");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)orientedPreviewImageURL
{
  -[ICAttachmentPreviewImage createOrientedPreviewIfNeeded](self, "createOrientedPreviewIfNeeded");
  return -[ICAttachmentPreviewImage orientedPreviewImageURLWithoutCreating](self, "orientedPreviewImageURLWithoutCreating");
}

- (id)urls
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v4);

  -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v5);

  -[ICAttachmentPreviewImage orientedPreviewImageURLWithoutCreating](self, "orientedPreviewImageURLWithoutCreating");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "ic_addNonNilObject:", v6);

  v7 = (void *)objc_msgSend(v3, "copy");
  return v7;
}

- (BOOL)hasAnyPNGPreviewImageFiles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;

  -[ICAttachmentPreviewImage orientedPreviewImageURLWithoutCreating](self, "orientedPreviewImageURLWithoutCreating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByDeletingPathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x1E0CEC580];
  objc_msgSend((id)*MEMORY[0x1E0CEC580], "preferredFilenameExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathExtension:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v7, "checkResourceIsReachableAndReturnError:", 0) & 1) != 0)
  {
    v8 = 1;
  }
  else
  {
    -[ICAttachmentPreviewImage previewImageURL](self, "previewImageURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByDeletingPathExtension");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "preferredFilenameExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathExtension:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected"))
    {
      objc_msgSend(v12, "URLByAppendingPathExtension:", CFSTR("encrypted"));
      v13 = objc_claimAutoreleasedReturnValue();

      v12 = (void *)v13;
    }
    v8 = objc_msgSend(v12, "checkResourceIsReachableAndReturnError:", 0);

  }
  return v8;
}

- (void)createOrientedPreviewIfNeeded
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(&dword_1BD918000, a2, OS_LOG_TYPE_ERROR, "Trying to write oriented image for %@ to disk in a non-UI process", v4, 0xCu);

}

- (void)setMetadata:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (-[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "writeEncryptedMetadata:", v4);

  }
  else
  {
    -[ICAttachmentPreviewImage willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("metadata"));
    -[ICAttachmentPreviewImage setPrimitiveValue:forKey:](self, "setPrimitiveValue:forKey:", v4, CFSTR("metadata"));

    -[ICAttachmentPreviewImage didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("metadata"));
  }
}

- (NSData)metadata
{
  void *v3;
  void *v4;

  -[ICAttachmentPreviewImage willAccessValueForKey:](self, "willAccessValueForKey:", CFSTR("metadata"));
  if (-[ICAttachmentPreviewImage isPasswordProtected](self, "isPasswordProtected"))
  {
    -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "decryptedMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[ICAttachmentPreviewImage primitiveValueForKey:](self, "primitiveValueForKey:", CFSTR("metadata"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[ICAttachmentPreviewImage didAccessValueForKey:](self, "didAccessValueForKey:", CFSTR("metadata"));
  return (NSData *)v4;
}

+ (id)previewImageURLsForIdentifier:(id)a3 account:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *context;
  id v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _QWORD v38[4];

  v38[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    context = (void *)MEMORY[0x1C3B7AC74]();
    objc_msgSend(v6, "previewImageDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v30 = v6;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D64240], "defaultPreviewImageDirectoryURL");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v10;

    objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v5, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObject:", v13);
    objc_msgSend((id)*MEMORY[0x1E0CEC580], "preferredFilenameExtension");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v14;
    objc_msgSend((id)*MEMORY[0x1E0CEC530], "preferredFilenameExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v16;
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v17)
    {
      v18 = v17;
      v32 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v34 != v32)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v5, "stringByAppendingPathExtension:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v21, 0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v22);
          objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v21, 0);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "URLByAppendingPathExtension:", CFSTR("encrypted"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v24);
          objc_msgSend(v5, "stringByAppendingString:", CFSTR("-oriented"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "stringByAppendingPathExtension:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v26, 0);
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v27);
          objc_msgSend(v12, "URLByAppendingPathComponent:isDirectory:", v5, 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v7, "addObject:", v13);
        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v18);
    }

    objc_autoreleasePoolPop(context);
    v6 = v30;
  }
  else
  {
    v11 = os_log_create("com.apple.notes", "PreviewGeneration");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      +[ICAttachmentPreviewImage previewImageURLsForIdentifier:account:].cold.1(v11);

    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (BOOL)shouldSyncToCloud
{
  ICAttachmentPreviewImage *v2;
  void *v3;
  void *v4;

  v2 = self;
  -[ICAttachmentPreviewImage attachment](self, "attachment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attachmentModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v4, "shouldSyncPreviewImageToCloud:", v2);

  return (char)v2;
}

- (id)ic_loggingValues
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  ICAttachmentPreviewImage *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)ICAttachmentPreviewImage;
  -[ICCloudSyncingObject ic_loggingValues](&v12, sel_ic_loggingValues);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[ICAttachmentPreviewImage managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __44__ICAttachmentPreviewImage_ic_loggingValues__block_invoke;
  v9[3] = &unk_1E76C73B0;
  v6 = v4;
  v10 = v6;
  v11 = self;
  objc_msgSend(v5, "performBlockAndWait:", v9);

  v7 = v6;
  return v7;
}

void __44__ICAttachmentPreviewImage_ic_loggingValues__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  const __CFString *v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  id v15;

  v2 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "scale");
  objc_msgSend(v2, "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v3, CFSTR("scale"));

  v4 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "width");
  objc_msgSend(v4, "numberWithDouble:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, CFSTR("width"));

  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "height");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, CFSTR("height"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", objc_msgSend(*(id *)(a1 + 40), "appearanceType"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, CFSTR("appearanceType"));

  objc_msgSend(*(id *)(a1 + 40), "modifiedDate");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v9)
    v11 = (const __CFString *)v9;
  else
    v11 = CFSTR("nil");
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v11, CFSTR("modifiedDate"));

  objc_msgSend(*(id *)(a1 + 40), "attachment");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = (const __CFString *)v12;
  else
    v14 = &stru_1E76DB108;
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, CFSTR("attachment"));

}

- (int64_t)minimumSupportedNotesVersion
{
  return 4 * (-[ICAttachmentPreviewImage appearanceType](self, "appearanceType") != 0);
}

- (void)updateFlagToExcludeFromCloudBackup
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[ICAttachmentPreviewImage urls](self, "urls", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "ic_updateFlagToExcludeFromBackup:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (BOOL)needsToBePushedToCloud
{
  return 0;
}

- (BOOL)needsToBeDeletedFromCloud
{
  return 0;
}

- (BOOL)needsToBeFetchedFromCloud
{
  return 0;
}

- (BOOL)needsInitialFetchFromCloud
{
  return 0;
}

- (void)deleteFromLocalDatabase
{
  id v3;

  -[ICAttachmentPreviewImage managedObjectContext](self, "managedObjectContext");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deleteObject:", self);

}

- (id)cloudAccount
{
  void *v2;
  void *v3;

  -[ICAttachmentPreviewImage attachment](self, "attachment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cloudAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)cryptoStrategyProtocol
{
  return &unk_1EF542708;
}

- (id)decryptedImageData
{
  void *v2;
  void *v3;

  -[ICCloudSyncingObject cryptoStrategy](self, "cryptoStrategy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "decryptedImageData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)primaryEncryptedData
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99D50];
  -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dataWithContentsOfURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setPrimaryEncryptedData:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  -[ICAttachmentPreviewImage generationManager](self, "generationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "beginGeneration");

  if (v5)
  {
    -[ICAttachmentPreviewImage encryptedPreviewImageURL](self, "encryptedPreviewImageURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v10, "writeToURL:atomically:", v6, 1);

    -[ICAttachmentPreviewImage generationManager](self, "generationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7)
      objc_msgSend(v8, "commitGeneration");
    else
      objc_msgSend(v8, "rollbackGeneration");

  }
}

- (id)primaryEncryptedDataFromRecord:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("PreviewImages"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  ICDynamicCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fileURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)clearDecryptedData
{
  void *v3;
  objc_super v4;

  -[ICAttachmentPreviewImage orientedPreviewImageURLWithoutCreating](self, "orientedPreviewImageURLWithoutCreating");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    -[ICAttachmentPreviewImage removeItemAtURL:](self, "removeItemAtURL:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentPreviewImage clearCachedImage](self, "clearCachedImage");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[ICAttachmentPreviewImage clearCachedOrientedImage](self, "clearCachedOrientedImage");
  v4.receiver = self;
  v4.super_class = (Class)ICAttachmentPreviewImage;
  -[ICCloudSyncingObject clearDecryptedData](&v4, sel_clearDecryptedData);

}

- (ICAccount)placeholderAccount
{
  return (ICAccount *)objc_loadWeakRetained((id *)&self->placeholderAccount);
}

- (void)setImageID:(unint64_t)a3
{
  self->_imageID = a3;
}

- (BOOL)suppressesFileDeletion
{
  return self->suppressesFileDeletion;
}

- (void)setSuppressesFileDeletion:(BOOL)a3
{
  self->suppressesFileDeletion = a3;
}

+ (id)newAttachmentPreviewImageWithIdentifier:(id)a3 attachment:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "managedObjectContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(a1, "newObjectWithIdentifier:context:", v7, v8);

  objc_msgSend(v9, "setAttachment:", v6);
  objc_msgSend(v6, "note");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "account");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentStore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "assignToPersistentStore:", v12);

  return v9;
}

+ (void)purgeAllAttachmentPreviewImagesInContext:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "allAttachmentPreviewImagesInContext:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "attachment");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removePreviewImagesObject:", v10);

        objc_msgSend(v10, "attachment");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setPreviewUpdateDate:", 0);

        objc_msgSend(v4, "deleteObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  +[ICAttachment enumerateAttachmentsInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:](ICAttachment, "enumerateAttachmentsInContext:batchSize:visibleOnly:saveAfterBatch:usingBlock:", v4, 5, 0, 1, &__block_literal_global_325);
}

void __81__ICAttachmentPreviewImage_Management__purgeAllAttachmentPreviewImagesInContext___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPreviewUpdateDate:", 0);
  objc_msgSend(v2, "ic_postNotificationOnMainThreadWithName:", CFSTR("ICAttachmentPreviewImagesDidUpdateNotification"));

}

+ (id)attachmentPreviewImageWithIdentifier:(id)a3 inContext:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a4;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("identifier"), a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "attachmentPreviewImagesMatchingPredicate:inContext:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "firstObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)attachmentPreviewImageIdentifiersForAccount:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v14;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = a3;
  objc_msgSend(v3, "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97B48]), "initWithEntityName:", CFSTR("ICAttachmentPreviewImage"));
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("attachment.note.account == %@"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "setPredicate:", v8);
  objc_msgSend(v7, "setResultType:", 2);
  objc_msgSend(v7, "setPropertiesToFetch:", &unk_1E771AC50);
  v14 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v7, &v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v14;
  if (v10)
  {
    v11 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[ICAttachmentPreviewImage(Management) attachmentPreviewImageIdentifiersForAccount:].cold.1();
  }
  else
  {
    objc_msgSend(v9, "valueForKey:", CFSTR("identifier"));
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
      v12 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v12;
    }
  }

  return v5;
}

+ (id)allAttachmentPreviewImagesInContext:(id)a3
{
  return (id)objc_msgSend(a1, "attachmentPreviewImagesMatchingPredicate:inContext:", 0, a3);
}

+ (void)enumerateAttachmentPreviewImagesInContext:(id)a3 batchSize:(unint64_t)a4 saveAfterBatch:(BOOL)a5 usingBlock:(id)a6
{
  objc_msgSend(a1, "ic_enumerateObjectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:", 0, 0, 0, a3, a4, a5, a6);
}

+ (void)deleteStrandedAttachmentPreviewImagesInContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("attachment == nil"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NO"), CFSTR("markedForDeletion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "attachmentPreviewImagesMatchingPredicate:inContext:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "markForDeletion");
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (void)accountWillChangeToAccount:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_1BD918000, v0, OS_LOG_TYPE_DEBUG, "Preview image source and destination account are the same %@", v1, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = a1;
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, v6, "Error:(%@) retriving attributes of file at path(%@)", (uint8_t *)&v7);

  OUTLINED_FUNCTION_2();
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_2(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_10(&dword_1BD918000, a3, (uint64_t)a3, "Error writing preview image to disk for %@: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

void __71__ICAttachmentPreviewImage_setImageData_withSize_scale_appearanceType___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ICAttachmentPreviewImage setImageData:withSize:scale:appearanceType:]_block_invoke";
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v1, "%s -- Failed to create directory with error %@.", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

void __63__ICAttachmentPreviewImage_setScaledImageFromImageSrc_typeUTI___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "-[ICAttachmentPreviewImage setScaledImageFromImageSrc:typeUTI:]_block_invoke";
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_10(&dword_1BD918000, v0, v1, "%s -- Failed to create directory with error %@.", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1_0();
}

- (void)containerAccount
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_1(&dword_1BD918000, v5, v6, "Couldn't find account for media %@, using default account %@ for container directory.", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)previewImageURL
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_1(&dword_1BD918000, v0, v1, "Cannot remove preview image fallback {url: %@}", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

+ (void)previewImageURLsForIdentifier:(os_log_t)log account:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BD918000, log, OS_LOG_TYPE_DEBUG, "Trying to get preview image URLs with a nil identifier", v1, 2u);
}

@end
