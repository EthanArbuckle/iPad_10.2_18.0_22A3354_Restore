@implementation PHImportController

void __36__PHImportController_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_controller;
  sharedInstance_controller = v0;

}

- (PHImportController)init
{
  PHImportController *v2;
  PHImportController *v3;
  uint64_t v4;
  NSHashTable *observers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHImportController;
  v2 = -[PHImportController init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->_sourceListLock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v4 = objc_claimAutoreleasedReturnValue();
    observers = v3->_observers;
    v3->_observers = (NSHashTable *)v4;

  }
  return v3;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_3283);
  return (id)sharedInstance_controller;
}

void __40__PHImportController_enableDeviceImport__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke_2;
  block[3] = &unk_1E35DF110;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

- (void)enableDeviceImport
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke;
  block[3] = &unk_1E35DF110;
  block[4] = self;
  if (enableDeviceImport_onceToken != -1)
    dispatch_once(&enableDeviceImport_onceToken, block);
}

- (void)addImportControllerObserver:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__PHImportController_addImportControllerObserver___block_invoke;
  v6[3] = &unk_1E35DF9E8;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[PHImportController accessSourceList:](self, "accessSourceList:", v6);

}

- (void)accessSourceList:(id)a3
{
  os_unfair_lock_s *p_sourceListLock;
  void (**v4)(_QWORD);

  p_sourceListLock = &self->_sourceListLock;
  v4 = (void (**)(_QWORD))a3;
  os_unfair_lock_lock(p_sourceListLock);
  v4[2](v4);

  os_unfair_lock_unlock(p_sourceListLock);
}

void __50__PHImportController_addImportControllerObserver___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = *(id *)(*(_QWORD *)(a1 + 32) + 32);
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = *(_QWORD *)(a1 + 32);
          v7 = *(void **)(a1 + 40);
          objc_msgSend(*(id *)(v8 + 32), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v6), (_QWORD)v10);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "importController:addedImportSource:", v8, v9);

          ++v6;
        }
        while (v4 != v6);
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }

  }
}

void __40__PHImportController_enableDeviceImport__block_invoke_2(uint64_t a1)
{
  dispatch_time_t v2;
  NSObject *v3;
  _QWORD block[5];

  v2 = dispatch_time(0, 1000000000);
  dispatch_get_global_queue(17, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__PHImportController_enableDeviceImport__block_invoke_3;
  block[3] = &unk_1E35DF110;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v2, v3, block);

}

uint64_t __40__PHImportController_enableDeviceImport__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_opt_new();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "setDelegate:");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "start");
}

- (id)supportedTypes
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D752F0], "typesSupportedForImport");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[PHImportLibrarySource supportedImportLibraryTypes](PHImportLibrarySource, "supportedImportLibraryTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayByAddingObjectsFromArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)sourceIsConnected:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __40__PHImportController_sourceIsConnected___block_invoke;
  v7[3] = &unk_1E35DEE50;
  v9 = &v10;
  v7[4] = self;
  v5 = v4;
  v8 = v5;
  -[PHImportController accessSourceList:](self, "accessSourceList:", v7);
  LOBYTE(self) = *((_BYTE *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

- (void)addImportSourceForUrls:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0;
  -[PHImportController importSourceForURLs:exceptions:](self, "importSourceForURLs:exceptions:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (objc_msgSend(v6, "count"))
  {
    -[PHImportController _notifyOfFailureToAddImportSource:exceptions:](self, "_notifyOfFailureToAddImportSource:exceptions:", v5, v6);
  }
  else
  {
    -[PHImportController _addImportSource:](self, "_addImportSource:", v5);
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "count");
      *(_DWORD *)buf = 138543618;
      v12 = v8;
      v13 = 2048;
      v14 = v9;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_INFO, "Created source for '%{public}@' containing %lu URL(s)", buf, 0x16u);

    }
  }

}

- (id)importSourceForURLs:(id)a3 exceptions:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  PHImportUrlSource *v9;
  NSObject *v10;
  int v12;
  PHImportUrlSource *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 1
      || (v7 = (void *)MEMORY[0x1E0D752F0],
          objc_msgSend(MEMORY[0x1E0D752F0], "photosLibraryType"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          LODWORD(v7) = objc_msgSend(v7, "url:conformsToType:", v6, v8),
          v8,
          !(_DWORD)v7)
      || (+[PHImportLibrarySource importLibrarySourceForURL:exceptions:](PHImportLibrarySource, "importLibrarySourceForURL:exceptions:", v6, a4), (v9 = (PHImportUrlSource *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v9 = -[PHImportUrlSource initWithUrls:]([PHImportUrlSource alloc], "initWithUrls:", v5);
    }
    if (!-[PHImportUrlSource containsSupportedMediaWithImportExceptions:](v9, "containsSupportedMediaWithImportExceptions:", a4))
    {
      PLImportGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v12 = 138412290;
        v13 = v9;
        _os_log_impl(&dword_1991EC000, v10, OS_LOG_TYPE_INFO, "%@ does not contain any importable content", (uint8_t *)&v12, 0xCu);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_notifyOfFailureToAddImportSource:(id)a3 exceptions:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__PHImportController__notifyOfFailureToAddImportSource_exceptions___block_invoke;
  v10[3] = &unk_1E35DFAF8;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[PHImportController accessSourceList:](self, "accessSourceList:", v10);

}

- (void)removeImportSource:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "uuid");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportController _removeImportSourceWithUUID:](self, "_removeImportSourceWithUUID:", v5);

  }
  else
  {
    PLImportGetLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 138412290;
      v8 = v4;
      _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "ERROR: attempting to remove a non URL import source (%@)", (uint8_t *)&v7, 0xCu);
    }

  }
}

- (id)importUrls:(id)a3 withOptions:(id)a4 delegate:(id)a5 atEnd:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  PHPhotoLibrary *v14;
  void *v15;
  PHPhotoLibrary *v16;
  BOOL v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v25;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = [PHPhotoLibrary alloc];
  +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PHPhotoLibrary initWithPhotoLibraryURL:](v14, "initWithPhotoLibraryURL:", v15);

  v25 = 0;
  v17 = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v16, "openAndWaitWithUpgrade:error:", 0, &v25);
  v18 = v25;
  if (v17)
  {
    -[PHImportController importUrls:intoLibrary:withOptions:delegate:performanceDelegate:atEnd:](self, "importUrls:intoLibrary:withOptions:delegate:performanceDelegate:atEnd:", v10, v16, v11, v12, 0, v13);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = (void *)objc_opt_new();
    +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = (id)objc_msgSend(v20, "addExceptionWithType:path:underlyingError:file:line:", 0, v22, v18, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m", 179);
    v13[2](v13, v20);

    v19 = 0;
  }

  return v19;
}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibraryAtURL:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *, _QWORD);
  id v20;
  PHPhotoLibrary *v21;
  id v22;
  void *v23;
  id v24;
  PHImportController *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void (**v33)(id, void *, _QWORD);
  id v34;
  id v36;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a8;
  v34 = a9;
  v19 = (void (**)(id, void *, _QWORD))a10;
  v20 = a5;
  v21 = -[PHPhotoLibrary initWithPhotoLibraryURL:]([PHPhotoLibrary alloc], "initWithPhotoLibraryURL:", v20);

  v36 = 0;
  LOBYTE(v20) = -[PHPhotoLibrary openAndWaitWithUpgrade:error:](v21, "openAndWaitWithUpgrade:error:", 0, &v36);
  v22 = v36;
  if ((v20 & 1) == 0)
  {
    v23 = (void *)objc_opt_new();
    +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
    v33 = v19;
    v24 = v22;
    v25 = self;
    v26 = v18;
    v27 = v17;
    v28 = v16;
    v29 = v15;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "path");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v29;
    v16 = v28;
    v17 = v27;
    v18 = v26;
    self = v25;
    v22 = v24;
    v19 = v33;
    v32 = (id)objc_msgSend(v23, "addExceptionWithType:path:underlyingError:file:line:", 0, v31, v22, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m", 192);
    v19[2](v19, v23, 0);

  }
  -[PHImportController importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:performanceDelegate:atEnd:](self, "importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:performanceDelegate:atEnd:", v15, v16, v21, v17, a7, v18, v34, v19);

}

- (id)filterDuplicates:(id)a3 onSource:(id)a4 library:(id)a5 options:(id)a6 delegate:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v29;
  id v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (objc_msgSend(v11, "count") && !objc_msgSend(v14, "allowDuplicates"))
  {
    if (v11)
    {
      if (v13)
      {
        v16 = (id)objc_msgSend(v11, "mutableCopy");
        v37 = 0;
        v17 = (void *)objc_opt_new();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v18 = v11;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v19)
        {
          v20 = v19;
          v29 = v16;
          v30 = v14;
          v31 = v12;
          v32 = v11;
          v21 = 0;
          v22 = *(_QWORD *)v34;
          while (2)
          {
            for (i = 0; i != v20; ++i)
            {
              if (*(_QWORD *)v34 != v22)
                objc_enumerationMutation(v18);
              v24 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
              if (objc_msgSend(v24, "isDuplicate"))
              {
                if (v37)
                {
                  if (v21 == 1)
                    objc_msgSend(v17, "addObject:", v24);
                }
                else
                {
                  objc_msgSend(v24, "duplicateAssetsForLibrary:", v13);
                  v25 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v25, "firstObject");
                  v26 = (void *)objc_claimAutoreleasedReturnValue();

                  v27 = objc_msgSend(v15, "importAsset:asDuplicateOfLibraryAsset:applyToAll:", v24, v26, &v37);
                  v21 = v27;
                  if (v27)
                  {
                    if (v27 == 1)
                    {
                      objc_msgSend(v17, "addObject:", v24);
                    }
                    else if (v27 == 2)
                    {
                      goto LABEL_26;
                    }
                  }
                  else if (v37)
                  {
LABEL_26:

                    goto LABEL_27;
                  }

                }
              }
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
            if (v20)
              continue;
            break;
          }
LABEL_27:

          v12 = v31;
          v11 = v32;
          v16 = v29;
          v14 = v30;
          if (v21 == 2)
          {
            objc_msgSend(v29, "removeAllObjects");
LABEL_32:

            goto LABEL_33;
          }
        }
        else
        {

        }
        if (objc_msgSend(v17, "count"))
          objc_msgSend(v16, "removeObjectsInArray:", v17);
        goto LABEL_32;
      }
    }
    else
    {
      _PFAssertFailHandler();
    }
    _PFAssertFailHandler();
  }
  v16 = v11;
LABEL_33:

  return v16;
}

- (BOOL)importInProgress
{
  PHImportController *v2;
  os_unfair_lock_s *p_importInProgressLock;

  v2 = self;
  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  LOBYTE(v2) = v2->_importInProgress;
  os_unfair_lock_unlock(p_importInProgressLock);
  return (char)v2;
}

- (void)importStarting
{
  os_unfair_lock_s *p_importInProgressLock;
  void *v4;
  void *v5;
  id processInfoActivityToken;

  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  if (!self->_importInProgress)
  {
    self->_importInProgress = 1;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "beginActivityWithOptions:reason:", 0xFFFFFFLL, CFSTR("Photos Import"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    processInfoActivityToken = self->_processInfoActivityToken;
    self->_processInfoActivityToken = v5;

  }
  os_unfair_lock_unlock(p_importInProgressLock);
}

- (void)importEnding
{
  os_unfair_lock_s *p_importInProgressLock;
  void *v4;
  id processInfoActivityToken;

  p_importInProgressLock = &self->_importInProgressLock;
  os_unfair_lock_lock(&self->_importInProgressLock);
  if (self->_importInProgress)
  {
    self->_importInProgress = 0;
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endActivity:", self->_processInfoActivityToken);

    processInfoActivityToken = self->_processInfoActivityToken;
    self->_processInfoActivityToken = 0;

  }
  os_unfair_lock_unlock(p_importInProgressLock);
}

- (id)importUrls:(id)a3 intoLibrary:(id)a4 withOptions:(id)a5 delegate:(id)a6 performanceDelegate:(id)a7 atEnd:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void (**v19)(id, void *);
  uint64_t v20;
  PHImportResults *v21;
  void *v22;
  PHImportResults *v23;
  void *v24;
  uint64_t v25;
  _BOOL4 v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v35[4];
  id v36;
  PHImportController *v37;
  id v38;
  id v39;
  id v40;
  void (**v41)(id, void *);
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  id v49;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = (void (**)(id, void *))a8;
  v20 = objc_msgSend(v14, "count");
  if (!v19 || v20)
  {
    v26 = -[PHImportController importInProgress](self, "importInProgress");
    if (v19 && v26)
    {
      v21 = objc_alloc_init(PHImportResults);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Import in progress. Cannot start another import session."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v21;
      v24 = v22;
      v25 = 346;
      goto LABEL_7;
    }
    v49 = 0;
    -[PHImportController importSourceForURLs:exceptions:](self, "importSourceForURLs:exceptions:", v14, &v49);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v49;
    if (objc_msgSend(v30, "count"))
    {
      +[PHImportResults resultsWithExceptions:](PHImportResults, "resultsWithExceptions:", v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v31;
      if (v19)
      {
        v19[2](v19, v31);

        v28 = 0;
LABEL_13:

        goto LABEL_14;
      }

    }
    v43 = 0;
    v44 = &v43;
    v45 = 0x3032000000;
    v46 = __Block_byref_object_copy__3223;
    v47 = __Block_byref_object_dispose__3224;
    v48 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke;
    v35[3] = &unk_1E35D6770;
    v36 = v16;
    v37 = self;
    v38 = v29;
    v39 = v15;
    v40 = v17;
    v42 = &v43;
    v41 = v19;
    v33 = (id)objc_msgSend(v38, "loadAssetsForLibrary:allowDuplicates:order:atEnd:", v39, 0, 0, v35);
    v28 = (id)v44[5];

    _Block_object_dispose(&v43, 8);
    goto LABEL_13;
  }
  v21 = objc_alloc_init(PHImportResults);
  objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Requested to import an empty asset list"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v21;
  v24 = v22;
  v25 = 337;
LABEL_7:
  v27 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](v23, "addExceptionWithType:path:underlyingError:file:line:", 0, 0, v24, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m", v25);
  v19[2](v19, v21);

  v28 = 0;
LABEL_14:

  return v28;
}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 withOptions:(id)a5 progress:(id *)a6 delegate:(id)a7 atEnd:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;

  v14 = a8;
  v15 = a7;
  v16 = a5;
  v17 = a4;
  v18 = a3;
  +[PHPhotoLibrary systemPhotoLibraryURL](PHPhotoLibrary, "systemPhotoLibraryURL");
  v19 = (id)objc_claimAutoreleasedReturnValue();
  -[PHImportController importAssets:fromImportSource:intoLibraryAtURL:withOptions:progress:delegate:performanceDelegate:atEnd:](self, "importAssets:fromImportSource:intoLibraryAtURL:withOptions:progress:delegate:performanceDelegate:atEnd:", v18, v17, v19, v16, a6, v15, 0, v14);

}

- (void)importAssets:(id)a3 fromImportSource:(id)a4 intoLibrary:(id)a5 withOptions:(id)a6 progress:(id *)a7 delegate:(id)a8 performanceDelegate:(id)a9 atEnd:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void (**v22)(id, PHImportResults *, _QWORD);
  PHImportResults *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id *v29;
  id v30;
  id *v31;
  _QWORD v32[5];
  id v33;
  id v34;
  id v35;
  void (**v36)(id, PHImportResults *, _QWORD);

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a8;
  v21 = a9;
  v22 = (void (**)(id, PHImportResults *, _QWORD))a10;
  if (-[PHImportController importInProgress](self, "importInProgress"))
  {
    if (v22)
    {
      v23 = objc_alloc_init(PHImportResults);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_genericErrorWithLocalizedDescription:", CFSTR("Import in progress. Cannot start another import session."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = -[PHImportExceptionRecorder addExceptionWithType:path:underlyingError:file:line:](v23, "addExceptionWithType:path:underlyingError:file:line:", 0, 0, v24, "/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoKit/Sources/Import/PHImportController.m", 399);
      v22[2](v22, v23, 0);

    }
  }
  else
  {
    -[PHImportController importStarting](self, "importStarting");
    objc_msgSend(v21, "startImporting");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke;
    v32[3] = &unk_1E35D6798;
    v32[4] = self;
    v33 = v21;
    v34 = v19;
    v26 = v17;
    v27 = v19;
    v28 = v17;
    v29 = a7;
    v30 = v26;
    v35 = v26;
    v36 = v22;
    v31 = v29;
    v17 = v28;
    v19 = v27;
    +[PHImporter importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:atEnd:](PHImporter, "importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:atEnd:", v16, v30, v18, v34, v31, v20, v32);

  }
}

- (void)_addImportSource:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__PHImportController__addImportSource___block_invoke;
    v6[3] = &unk_1E35DF9E8;
    v6[4] = self;
    v7 = v4;
    -[PHImportController accessSourceList:](self, "accessSourceList:", v6);

  }
}

- (void)_removeImportSourceWithUUID:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__PHImportController__removeImportSourceWithUUID___block_invoke;
    v6[3] = &unk_1E35DF9E8;
    v6[4] = self;
    v7 = v4;
    -[PHImportController accessSourceList:](self, "accessSourceList:", v6);

  }
}

- (void)deviceBrowser:(id)a3 didAddDevice:(id)a4 moreComing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  PHImportDeviceSource *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[PHImportController deviceBrowser:didAddDevice:moreComing:]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "%s - %@", (uint8_t *)&v10, 0x16u);

    }
    v9 = -[PHImportDeviceSource initWithDevice:]([PHImportDeviceSource alloc], "initWithDevice:", v6);
    -[PHImportController _addImportSource:](self, "_addImportSource:", v9);

  }
}

- (void)deviceBrowser:(id)a3 didRemoveDevice:(id)a4 moreGoing:(BOOL)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "setDelegate:", 0);
    PLImportGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 136315394;
      v11 = "-[PHImportController deviceBrowser:didRemoveDevice:moreGoing:]";
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_DEBUG, "%s - %@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v6, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHImportController _removeImportSourceWithUUID:](self, "_removeImportSourceWithUUID:", v9);

  }
}

- (void)setImportInProgress:(BOOL)a3
{
  self->_importInProgress = a3;
}

- (ICDeviceBrowser)deviceBrowser
{
  return self->_deviceBrowser;
}

- (void)setDeviceBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_deviceBrowser, a3);
}

- (NSMutableDictionary)importSources
{
  return self->_importSources;
}

- (void)setImportSources:(id)a3
{
  objc_storeStrong((id *)&self->_importSources, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (id)processInfoActivityToken
{
  return self->_processInfoActivityToken;
}

- (void)setProcessInfoActivityToken:(id)a3
{
  objc_storeStrong(&self->_processInfoActivityToken, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_processInfoActivityToken, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_importSources, 0);
  objc_storeStrong((id *)&self->_deviceBrowser, 0);
}

void __50__PHImportController__removeImportSourceWithUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "importSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "progress");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancel");

    objc_msgSend(*(id *)(a1 + 32), "importSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObjectForKey:", v6);

    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v13 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v11++), "importController:removedImportSource:", *(_QWORD *)(a1 + 32), v3, (_QWORD)v12);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v9);
    }

  }
}

void __39__PHImportController__addImportSource___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "importSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "importSources");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v6 = (void *)objc_opt_new();
      objc_msgSend(*(id *)(a1 + 32), "setImportSources:", v6);

    }
    v7 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "importSources");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v9);

    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "importController:addedImportSource:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), (_QWORD)v15);
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v12);
    }

  }
}

void __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  _QWORD v18[4];
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "importEnding");
  objc_msgSend(*(id *)(a1 + 40), "endImporting");
  objc_msgSend(v3, "logPMR");
  if (objc_msgSend(*(id *)(a1 + 48), "deleteAfterImport")
    && objc_msgSend(*(id *)(a1 + 56), "canDeleteContent"))
  {
    v4 = (void *)objc_opt_new();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v17 = v3;
    objc_msgSend(v3, "importRecords");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (!v6)
      goto LABEL_14;
    v7 = v6;
    v8 = *(_QWORD *)v21;
    while (1)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v10, "importAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "canDelete"))
        {
          objc_msgSend(v10, "exceptions");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "count");

          if (v13)
            continue;
          objc_msgSend(v10, "importAsset");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (!v7)
      {
LABEL_14:

        if (objc_msgSend(v4, "count"))
        {
          v14 = *(void **)(a1 + 56);
          v18[0] = MEMORY[0x1E0C809B0];
          v18[1] = 3221225472;
          v18[2] = __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke_2;
          v18[3] = &unk_1E35D6A28;
          v19 = v4;
          objc_msgSend(v14, "deleteImportAssets:isConfirmed:atEnd:", v19, 1, v18);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v15 = 0;
        }

        v3 = v17;
        goto LABEL_19;
      }
    }
  }
  v15 = 0;
LABEL_19:
  v16 = *(_QWORD *)(a1 + 64);
  if (v16)
    (*(void (**)(uint64_t, id, void *))(v16 + 16))(v16, v3, v15);

}

void __120__PHImportController_importAssets_fromImportSource_intoLibrary_withOptions_progress_delegate_performanceDelegate_atEnd___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  __CFString *v6;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  PLImportGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = objc_msgSend(*(id *)(a1 + 32), "count");
    if (v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v3);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = &stru_1E35DFFF8;
    }
    *(_DWORD *)buf = 134218242;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_INFO, "Deleted %lu assets%@", buf, 0x16u);
    if (v3)

  }
}

void __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PHImportResults *v15;
  PHImportResults *v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  PHImportResults *v20;
  id v21;
  id obj;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v5;
  v8 = v7;
  if ((objc_msgSend(*(id *)(a1 + 32), "allowDuplicates") & 1) == 0)
  {
    v8 = v7;
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(*(id *)(a1 + 40), "filterDuplicates:onSource:library:options:delegate:", v7, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  if (objc_msgSend(v8, "count"))
  {
    v9 = *(_QWORD *)(a1 + 48);
    v10 = *(_QWORD *)(a1 + 56);
    v12 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(a1 + 40);
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    obj = *(id *)(v13 + 40);
    v14 = *(_QWORD *)(a1 + 64);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke_2;
    v19[3] = &unk_1E35D6748;
    v20 = (PHImportResults *)v6;
    v21 = *(id *)(a1 + 72);
    objc_msgSend(v11, "importAssets:fromImportSource:intoLibrary:withOptions:progress:delegate:performanceDelegate:atEnd:", v8, v9, v10, v12, &obj, v14, 0, v19);
    objc_storeStrong((id *)(v13 + 40), obj);

    v15 = v20;
LABEL_13:

    goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 72))
  {
    if (objc_msgSend(v6, "count"))
    {
      +[PHImportResults resultsWithExceptions:](PHImportResults, "resultsWithExceptions:", v6);
      v16 = (PHImportResults *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      PLImportGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(a1 + 48), "name");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_impl(&dword_1991EC000, v17, OS_LOG_TYPE_INFO, "Nothing to import from '%@'", buf, 0xCu);

      }
      v16 = objc_alloc_init(PHImportResults);
    }
    v15 = v16;
    (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
    goto LABEL_13;
  }
LABEL_14:

}

void __92__PHImportController_importUrls_intoLibrary_withOptions_delegate_performanceDelegate_atEnd___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "addExceptions:", *(_QWORD *)(a1 + 32));
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

void __67__PHImportController__notifyOfFailureToAddImportSource_exceptions___block_invoke(_QWORD *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v2 = *(id *)(a1[4] + 40);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * v6);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v7, "importController:failedToAddImportSource:exceptions:", a1[4], a1[5], a1[6], (_QWORD)v8);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

void __40__PHImportController_sourceIsConnected___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "importSources");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3 != 0;

}

+ (BOOL)isValidFolderAtURL:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  void *v12;
  void *v14;
  id v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v16 = 0;
  v4 = *MEMORY[0x1E0C99A00];
  v15 = 0;
  v5 = objc_msgSend(v3, "getResourceValue:forKey:error:", &v16, v4, &v15);
  v6 = v16;
  v7 = v15;
  if (v5)
  {
    if (objc_msgSend(v6, "BOOLValue"))
    {
      v8 = (void *)MEMORY[0x1E0D752F0];
      +[PHImportLibrarySource supportedImportLibraryTypes](PHImportLibrarySource, "supportedImportLibraryTypes");
      v9 = objc_claimAutoreleasedReturnValue();
      LOBYTE(v10) = objc_msgSend(v8, "url:conformsToOneOfTypes:", v3, v9);
    }
    else
    {
      objc_msgSend(v3, "path");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject pathComponents](v9, "pathComponents");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("/")) & 1) != 0
        || (-[NSObject isEqualToString:](v9, "isEqualToString:", CFSTR("/Volumes")) & 1) != 0)
      {
        LOBYTE(v10) = 0;
      }
      else if (objc_msgSend(v12, "count") == 2
             || objc_msgSend(v12, "count") == 4
             && -[NSObject hasPrefix:](v9, "hasPrefix:", CFSTR("/Volumes")))
      {
        -[NSObject lastPathComponent](v9, "lastPathComponent");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v14, "isEqualToString:", CFSTR("dev")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("var")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("bin")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("sbin")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("cores")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("opt")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("home")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("private")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("usr")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("tmp")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("automount")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("net")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("Volumes")) & 1) != 0
          || (objc_msgSend(v14, "isEqualToString:", CFSTR("Library")) & 1) != 0)
        {
          LOBYTE(v10) = 0;
        }
        else
        {
          v10 = objc_msgSend(v14, "isEqualToString:", CFSTR("System")) ^ 1;
        }

      }
      else
      {
        LOBYTE(v10) = 1;
      }

    }
  }
  else
  {
    PLImportGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v3, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v18 = v11;
      v19 = 2112;
      v20 = v7;
      _os_log_impl(&dword_1991EC000, v9, OS_LOG_TYPE_ERROR, "%@ is not a valid folder for import: %@", buf, 0x16u);

    }
    LOBYTE(v10) = 0;
  }

  return v10;
}

+ (BOOL)isDeviceVolumeAtURL:(id)a3
{
  return 0;
}

+ (void)dispatchApply:(unint64_t)a3 withConcurrencyLimit:(unint64_t)a4 canceler:(id)a5 ofBlock:(id)a6
{
  _BYTE *v9;
  void (**v10)(id, _QWORD);
  unint64_t v11;
  NSObject *v12;
  qos_class_t v13;
  NSObject *v14;
  _BYTE *v15;
  void (**v16)(_QWORD);
  uint64_t v17;
  _QWORD aBlock[4];
  id v19;
  void (**v20)(id, _QWORD);
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;

  v9 = a5;
  v10 = (void (**)(id, _QWORD))a6;
  if (a3 < 2 || (v11 = a4 - 1, a4 <= 1))
  {
    if (a3)
    {
      v17 = 0;
      do
      {
        if (v9 && v9[8])
          break;
        v10[2](v10, v17++);
      }
      while (a3 != v17);
    }
  }
  else
  {
    v12 = dispatch_group_create();
    v23 = 0;
    v13 = qos_class_self();
    dispatch_get_global_queue(v13, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __74__PHImportController_dispatchApply_withConcurrencyLimit_canceler_ofBlock___block_invoke;
    aBlock[3] = &unk_1E35D67C0;
    v21 = &v23;
    v22 = a3;
    v20 = v10;
    v15 = v9;
    v19 = v15;
    v16 = (void (**)(_QWORD))_Block_copy(aBlock);
    do
    {
      if (v15 && v15[8])
        break;
      dispatch_group_async(v12, v14, v16);
      --v11;
    }
    while (v11);
    v16[2](v16);
    dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

  }
}

uint64_t __74__PHImportController_dispatchApply_withConcurrencyLimit_canceler_ofBlock___block_invoke(uint64_t result)
{
  _QWORD *v1;
  unint64_t *v2;
  unint64_t v3;
  uint64_t v4;

  v1 = (_QWORD *)result;
  do
  {
    v2 = (unint64_t *)v1[6];
    do
      v3 = __ldxr(v2);
    while (__stxr(v3 + 1, v2));
    if (v3 < v1[7])
      result = (*(uint64_t (**)(void))(v1[5] + 16))();
    v4 = v1[4];
  }
  while ((!v4 || !*(_BYTE *)(v4 + 8)) && v3 < v1[7]);
  return result;
}

@end
