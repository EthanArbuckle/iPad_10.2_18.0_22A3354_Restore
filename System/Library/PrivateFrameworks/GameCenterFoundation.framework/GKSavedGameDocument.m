@implementation GKSavedGameDocument

- (GKSavedGameDocument)initWithFileURL:(id)a3
{
  id v4;
  GKSavedGameDocument *v5;
  GKSavedGameDocument *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)GKSavedGameDocument;
  v5 = -[GKSavedGameDocument init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GKSavedGameDocument setFileURL:](v5, "setFileURL:", v4);
    objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", v6);
  }

  return v6;
}

- (void)dealloc
{
  objc_super v3;

  objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self);
  v3.receiver = self;
  v3.super_class = (Class)GKSavedGameDocument;
  -[GKSavedGameDocument dealloc](&v3, sel_dealloc);
}

- (void)setIsConflictVersion:(BOOL)a3
{
  if (self->_isConflictVersion != a3)
  {
    self->_isConflictVersion = a3;
    if (a3)
      objc_msgSend(MEMORY[0x1E0CB3600], "removeFilePresenter:", self);
    else
      objc_msgSend(MEMORY[0x1E0CB3600], "addFilePresenter:", self);
  }
}

- (NSOperationQueue)presentedItemOperationQueue
{
  if (presentedItemOperationQueue_sOnceToken != -1)
    dispatch_once(&presentedItemOperationQueue_sOnceToken, &__block_literal_global_21);
  return (NSOperationQueue *)(id)presentedItemOperationQueue_sQueue;
}

uint64_t __50__GKSavedGameDocument_presentedItemOperationQueue__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3828]);
  v1 = (void *)presentedItemOperationQueue_sQueue;
  presentedItemOperationQueue_sQueue = (uint64_t)v0;

  return objc_msgSend((id)presentedItemOperationQueue_sQueue, "setMaxConcurrentOperationCount:", 1);
}

- (NSURL)presentedItemURL
{
  return self->_fileURL;
}

- (void)presentedItemDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __45__GKSavedGameDocument_presentedItemDidChange__block_invoke;
  v2[3] = &unk_1E75B1968;
  v2[4] = self;
  -[GKSavedGameDocument loadMetadataWithCompletionHandler:](self, "loadMetadataWithCompletionHandler:", v2);
}

void __45__GKSavedGameDocument_presentedItemDidChange__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKSavedGameDocumentModifiedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)presentedItemDidGainVersion:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GKSavedGameDocument_presentedItemDidGainVersion___block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__GKSavedGameDocument_presentedItemDidGainVersion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKSavedGameDocumentConflictStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)presentedItemDidLoseVersion:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__GKSavedGameDocument_presentedItemDidLoseVersion___block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __51__GKSavedGameDocument_presentedItemDidLoseVersion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKSavedGameDocumentConflictStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)presentedItemDidResolveConflictVersion:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__GKSavedGameDocument_presentedItemDidResolveConflictVersion___block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __62__GKSavedGameDocument_presentedItemDidResolveConflictVersion___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("GKSavedGameDocumentConflictStateChangedNotification"), *(_QWORD *)(a1 + 32));

}

- (void)updateConflictStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD *v12;
  _QWORD block[5];
  NSObject *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v4 = a3;
  v5 = dispatch_group_create();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__4;
  v16[4] = __Block_byref_object_dispose__4;
  v17 = 0;
  dispatch_group_enter(v5);
  dispatch_get_global_queue(0, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke;
  block[3] = &unk_1E75B2F68;
  v14 = v5;
  v15 = v16;
  block[4] = self;
  v8 = v5;
  dispatch_async(v6, block);

  v10[0] = v7;
  v10[1] = 3221225472;
  v10[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_3;
  v10[3] = &unk_1E75B2F90;
  v11 = v4;
  v12 = v16;
  v10[4] = self;
  v9 = v4;
  dispatch_group_notify(v8, MEMORY[0x1E0C80D38], v10);

  _Block_object_dispose(v16, 8);
}

void __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD v4[5];

  v3 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_2;
  v4[3] = &unk_1E75B2F40;
  v4[4] = *(_QWORD *)(a1 + 48);
  objc_msgSend(v3, "coordinateReadingItemAtURL:options:error:byAccessor:", v2, 0, 0, v4);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3648], "otherVersionsOfItemAtURL:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __64__GKSavedGameDocument_updateConflictStateWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setHasConflict:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count") != 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  return result;
}

- (void)loadWrapperDataWithFilename:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD block[5];
  id v19;
  NSObject *v20;
  _QWORD *v21;
  _QWORD *v22;
  _QWORD v23[5];
  id v24;
  _QWORD v25[5];
  id v26;

  v6 = a3;
  v7 = a4;
  v8 = dispatch_group_create();
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy__4;
  v25[4] = __Block_byref_object_dispose__4;
  v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__4;
  v23[4] = __Block_byref_object_dispose__4;
  v24 = 0;
  dispatch_group_enter(v8);
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke;
  block[3] = &unk_1E75B2FE0;
  block[4] = self;
  v19 = v6;
  v21 = v23;
  v22 = v25;
  v20 = v8;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, block);

  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_3;
  v14[3] = &unk_1E75B3008;
  v15 = v7;
  v16 = v25;
  v17 = v23;
  v13 = v7;
  dispatch_group_notify(v11, MEMORY[0x1E0C80D38], v14);

  _Block_object_dispose(v23, 8);
  _Block_object_dispose(v25, 8);

}

void __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 56);
  v5 = *(_QWORD *)(v4 + 8);
  v12 = *(id *)(v5 + 40);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B2FB8;
  v10 = v4;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 64);
  v9 = v6;
  v11 = v7;
  objc_msgSend(v2, "coordinateReadingItemAtURL:options:error:byAccessor:", v3, 0, &v12, v8);
  objc_storeStrong((id *)(v5 + 40), v12);

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;
  id obj;

  v3 = a2;
  v4 = objc_alloc(MEMORY[0x1E0CB3650]);
  v5 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v5 + 40);
  v6 = (void *)objc_msgSend(v4, "initWithURL:options:error:", v3, 0, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  if (objc_msgSend(v6, "isDirectory"))
  {
    objc_msgSend(v6, "fileWrappers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", a1[4]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      v9 = *(_QWORD *)(a1[5] + 8);
      v23 = *(id *)(v9 + 40);
      objc_msgSend(v6, "readFromURL:options:error:", v3, 1, &v23);
      objc_storeStrong((id *)(v9 + 40), v23);
      objc_msgSend(v6, "fileWrappers");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", a1[4]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v8, "regularFileContents");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(a1[6] + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
    {
      objc_msgSend(v3, "URLByAppendingPathComponent:", a1[4]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(a1[5] + 8);
      v22 = *(id *)(v15 + 40);
      objc_msgSend(v8, "readFromURL:options:error:", v14, 0, &v22);
      objc_storeStrong((id *)(v15 + 40), v22);

      objc_msgSend(v8, "regularFileContents");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = *(_QWORD *)(a1[6] + 8);
      v18 = *(void **)(v17 + 40);
      *(_QWORD *)(v17 + 40) = v16;

      if (!*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) && !*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
        v19 = objc_claimAutoreleasedReturnValue();
        v20 = *(_QWORD *)(a1[5] + 8);
        v21 = *(void **)(v20 + 40);
        *(_QWORD *)(v20 + 40) = v19;

      }
    }

  }
}

uint64_t __69__GKSavedGameDocument_loadWrapperDataWithFilename_completionHandler___block_invoke_3(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  result = a1[4];
  if (result)
  {
    v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
    if (!v3)
    {
      if (*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40))
      {
        v3 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
        v4 = objc_claimAutoreleasedReturnValue();
        v5 = *(_QWORD *)(a1[6] + 8);
        v6 = *(void **)(v5 + 40);
        *(_QWORD *)(v5 + 40) = v4;

        result = a1[4];
        v3 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      }
    }
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 16))(result, v3, *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));
  }
  return result;
}

- (void)loadMetadataWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__GKSavedGameDocument_loadMetadataWithCompletionHandler___block_invoke;
  v6[3] = &unk_1E75B1760;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[GKSavedGameDocument loadWrapperDataWithFilename:completionHandler:](self, "loadWrapperDataWithFilename:completionHandler:", CFSTR("metadata"), v6);

}

void __57__GKSavedGameDocument_loadMetadataWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a2;
  v5 = a3;
  v6 = v5;
  if (v8)
  {
    objc_msgSend(*(id *)(a1 + 32), "setMetadata:");
  }
  else if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 256, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
    (*(void (**)(uint64_t, void *))(v7 + 16))(v7, v6);

}

- (void)updateMetadata
{
  void *v3;
  id v4;

  +[GKSavedGameDocument currentDeviceName](GKSavedGameDocument, "currentDeviceName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSavedGameDocument setDeviceName:](self, "setDeviceName:", v3);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[GKSavedGameDocument setModificationDate:](self, "setModificationDate:", v4);

}

- (void)setMetadata:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", a3, 0, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = v4;
    objc_msgSend(v4, "objectForKey:", CFSTR("deviceName"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      -[GKSavedGameDocument setDeviceName:](self, "setDeviceName:", v5);
    objc_msgSend(v7, "objectForKey:", CFSTR("modificationDate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
      -[GKSavedGameDocument setModificationDate:](self, "setModificationDate:", v6);

    v4 = v7;
  }

}

- (id)metadata
{
  NSString *deviceName;
  NSDate *modificationDate;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  deviceName = self->_deviceName;
  if (!deviceName || (modificationDate = self->_modificationDate) == 0)
  {
    -[GKSavedGameDocument updateMetadata](self, "updateMetadata");
    deviceName = self->_deviceName;
    modificationDate = self->_modificationDate;
  }
  v8[0] = CFSTR("deviceName");
  v8[1] = CFSTR("modificationDate");
  v9[0] = deviceName;
  v9[1] = modificationDate;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 200, 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)loadDataWithCompletionHandler:(id)a3
{
  -[GKSavedGameDocument loadWrapperDataWithFilename:completionHandler:](self, "loadWrapperDataWithFilename:completionHandler:", CFSTR("data"), a3);
}

- (void)saveData:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v7 = a4;
  -[GKSavedGameDocument updateMetadata](self, "updateMetadata");
  -[GKSavedGameDocument metadata](self, "metadata");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v9 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke;
  v13[3] = &unk_1E75B1850;
  v13[4] = self;
  v14 = v6;
  v15 = v8;
  v16 = v7;
  v10 = v7;
  v11 = v8;
  v12 = v6;
  dispatch_async(v9, v13);

}

void __50__GKSavedGameDocument_saveData_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  id obj;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  v19 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", a1[4]);
  objc_msgSend(a1[4], "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(v15 + 5);
  v5 = MEMORY[0x1E0C809B0];
  obj = (id)v15[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_2;
  v9[3] = &unk_1E75B3030;
  v10 = a1[5];
  v11 = a1[6];
  v12 = &v14;
  objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 8, &obj, v9);
  objc_storeStrong(v4, obj);

  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_3;
  v6[3] = &unk_1E75B3058;
  v7 = a1[7];
  v8 = &v14;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  _Block_object_dispose(&v14, 8);
}

void __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  id obj;

  v3 = (objc_class *)MEMORY[0x1E0CB3650];
  v4 = a2;
  v5 = [v3 alloc];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initDirectoryWithFileWrappers:", v6);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", a1[4]);
  objc_msgSend(v8, "setPreferredFilename:", CFSTR("data"));
  v9 = (id)objc_msgSend(v7, "addFileWrapper:", v8);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3650]), "initRegularFileWithContents:", a1[5]);
  objc_msgSend(v10, "setPreferredFilename:", CFSTR("metadata"));
  v11 = (id)objc_msgSend(v7, "addFileWrapper:", v10);
  v12 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v12 + 40);
  objc_msgSend(v7, "writeToURL:options:originalContentsURL:error:", v4, 1, v4, &obj);

  objc_storeStrong((id *)(v12 + 40), obj);
}

uint64_t __50__GKSavedGameDocument_saveData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)deleteAllVersionsIncludingCurrent:(BOOL)a3 withCompletionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  dispatch_get_global_queue(0, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke;
  block[3] = &unk_1E75B30A8;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t *v8;
  _QWORD v9[5];
  char v10;
  id obj;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(v13 + 5);
  obj = (id)v13[5];
  v5 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_1E75B3080;
  v9[4] = &v12;
  v10 = *(_BYTE *)(a1 + 48);
  objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 1, &obj, v9);
  objc_storeStrong(v4, obj);

  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_3;
  block[3] = &unk_1E75B3058;
  v7 = *(id *)(a1 + 40);
  v8 = &v12;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v12, 8);
}

void __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  id v15;
  id obj;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(MEMORY[0x1E0CB3648], "removeOtherVersionsOfItemAtURL:error:", v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  if (*(_BYTE *)(a1 + 40))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3620]);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v15 = *(id *)(v6 + 40);
    objc_msgSend(v5, "removeItemAtURL:error:", v3, &v15);
    objc_storeStrong((id *)(v6 + 40), v15);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3648], "unresolvedConflictVersionsOfItemAtURL:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "setResolved:", 1);
        }
        v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v17, 16);
      }
      while (v8);
    }
  }

}

uint64_t __79__GKSavedGameDocument_deleteAllVersionsIncludingCurrent_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (void)deleteConflictVersion:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke;
  block[3] = &unk_1E75B30F8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  id *v4;
  uint64_t v5;
  _QWORD block[4];
  id v7;
  uint64_t *v8;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  id obj;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__4;
  v17 = __Block_byref_object_dispose__4;
  v18 = 0;
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3600]), "initWithFilePresenter:", a1[4]);
  objc_msgSend(a1[4], "fileURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)(v14 + 5);
  v5 = MEMORY[0x1E0C809B0];
  obj = (id)v14[5];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_2;
  v9[3] = &unk_1E75B30D0;
  v10 = a1[5];
  v11 = &v13;
  objc_msgSend(v2, "coordinateWritingItemAtURL:options:error:byAccessor:", v3, 1, &obj, v9);
  objc_storeStrong(v4, obj);

  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_3;
  block[3] = &unk_1E75B3058;
  v7 = a1[6];
  v8 = &v13;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  _Block_object_dispose(&v13, 8);
}

void __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id obj;

  objc_msgSend(*(id *)(a1 + 32), "setResolved:", 1);
  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(v2, "removeAndReturnError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
}

uint64_t __63__GKSavedGameDocument_deleteConflictVersion_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  return result;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)GKSavedGameDocument;
  -[GKSavedGameDocument description](&v11, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[GKSavedGameDocument fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSavedGameDocument deviceName](self, "deviceName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKSavedGameDocument modificationDate](self, "modificationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR(", fileURL = %@, deviceName = %@, modificationDate = %@"), v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

+ (id)currentDeviceName
{
  return +[GKEntitledContextProvider getCurrentDeviceName](GKEntitledContextProvider, "getCurrentDeviceName");
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_storeStrong((id *)&self->_fileURL, a3);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSFileVersion)fileVersion
{
  return self->_fileVersion;
}

- (void)setFileVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fileVersion, a3);
}

- (BOOL)hasConflict
{
  return self->_hasConflict;
}

- (void)setHasConflict:(BOOL)a3
{
  self->_hasConflict = a3;
}

- (BOOL)isConflictVersion
{
  return self->_isConflictVersion;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
  objc_storeStrong((id *)&self->_deviceName, a3);
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (void)setModificationDate:(id)a3
{
  objc_storeStrong((id *)&self->_modificationDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_fileVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
