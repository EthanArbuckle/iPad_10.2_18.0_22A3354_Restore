@implementation VCPDefaultPhotoLibraryManager

- (VCPDefaultPhotoLibraryManager)init
{
  VCPDefaultPhotoLibraryManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VCPDefaultPhotoLibraryManager;
  v2 = -[VCPDefaultPhotoLibraryManager init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPDefaultPhotoLibraryManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__VCPDefaultPhotoLibraryManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_instance_1;
}

void __46__VCPDefaultPhotoLibraryManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedManager_instance_1;
  sharedManager_instance_1 = (uint64_t)v0;

}

- (id)defaultPhotoLibrary
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  if ((objc_msgSend(MEMORY[0x1E0CD16F0], "isMultiLibraryModeEnabled") & 1) != 0)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy__47;
    v11 = __Block_byref_object_dispose__47;
    v12 = 0;
    queue = self->_queue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __52__VCPDefaultPhotoLibraryManager_defaultPhotoLibrary__block_invoke;
    v6[3] = &unk_1E6B15418;
    v6[4] = self;
    v6[5] = &v7;
    dispatch_sync(queue, v6);
    v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    return v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CD16F0], "sharedPhotoLibrary");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

void __52__VCPDefaultPhotoLibraryManager_defaultPhotoLibrary__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  id v10;
  int v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Connecting to system photo library...", buf, 2u);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)
      || (objc_msgSend(MEMORY[0x1E0CD16F0], "systemPhotoLibraryURL"),
          v2 = objc_claimAutoreleasedReturnValue(),
          v3 = *(_QWORD *)(a1 + 32),
          v4 = *(void **)(v3 + 16),
          *(_QWORD *)(v3 + 16) = v2,
          v4,
          *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16)))
    {
      if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Opening system photo library...", buf, 2u);
      }
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD16F0]), "initWithPhotoLibraryURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 24);
      *(_QWORD *)(v6 + 24) = v5;

      v8 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
      v15 = 0;
      v9 = objc_msgSend(v8, "openAndWaitWithUpgrade:error:", 0, &v15);
      v10 = v15;
      v11 = MediaAnalysisLogLevel();
      if (v9)
      {
        if (v11 >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Opened system photo library", buf, 2u);
        }
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "registerAvailabilityObserver:");
      }
      else
      {
        if (v11 >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v10, "description");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v17 = v12;
          _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to open system photo library (%@)", buf, 0xCu);

        }
        v13 = *(_QWORD *)(a1 + 32);
        v14 = *(void **)(v13 + 24);
        *(_QWORD *)(v13 + 24) = 0;

      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to obtain system photo library URL", buf, 2u);
    }
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void)closedefaultPhotoLibrary
{
  PHPhotoLibrary *defaultPhotoLibrary;
  PHPhotoLibrary *v4;
  uint8_t v5[16];

  defaultPhotoLibrary = self->_defaultPhotoLibrary;
  if (defaultPhotoLibrary)
  {
    -[PHPhotoLibrary unregisterAvailabilityObserver:](defaultPhotoLibrary, "unregisterAvailabilityObserver:", self);
    -[PHPhotoLibrary close](self->_defaultPhotoLibrary, "close");
    v4 = self->_defaultPhotoLibrary;
    self->_defaultPhotoLibrary = 0;

    if ((int)MediaAnalysisLogLevel() >= 7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Closed Photo Library", v5, 2u);
    }
  }
}

- (void)photoLibraryDidBecomeUnavailable:(id)a3
{
  id v4;
  NSObject *queue;
  _QWORD block[4];
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Photo Library unavailable (%@); closing Photo Library...",
      buf,
      0xCu);
  }
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__VCPDefaultPhotoLibraryManager_photoLibraryDidBecomeUnavailable___block_invoke;
  block[3] = &unk_1E6B1A6D8;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(queue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);

}

void __66__VCPDefaultPhotoLibraryManager_photoLibraryDidBecomeUnavailable___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "closedefaultPhotoLibrary");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultPhotoLibrary, 0);
  objc_storeStrong((id *)&self->_defaultPhotoLibraryURL, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
