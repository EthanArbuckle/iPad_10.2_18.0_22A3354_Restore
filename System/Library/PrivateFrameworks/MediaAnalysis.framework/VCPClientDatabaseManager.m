@implementation VCPClientDatabaseManager

- (VCPClientDatabaseManager)init
{
  VCPClientDatabaseManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *databases;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VCPClientDatabaseManager;
  v2 = -[VCPClientDatabaseManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysis.VCPClientDatabaseManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)sharedDatabaseManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__VCPClientDatabaseManager_sharedDatabaseManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedDatabaseManager_once != -1)
    dispatch_once(&sharedDatabaseManager_once, block);
  return (id)sharedDatabaseManager_instance;
}

void __49__VCPClientDatabaseManager_sharedDatabaseManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedDatabaseManager_instance;
  sharedDatabaseManager_instance = (uint64_t)v0;

}

- (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *queue;
  id v9;
  _QWORD v11[5];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__9;
  v19 = __Block_byref_object_dispose__9;
  v20 = 0;
  if (v4)
    objc_msgSend(v4, "photoLibraryURL");
  else
    objc_msgSend(MEMORY[0x1E0CD16F0], "vcp_defaultURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    queue = self->_queue;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __58__VCPClientDatabaseManager_sharedDatabaseForPhotoLibrary___block_invoke;
    v11[3] = &unk_1E6B15C10;
    v14 = &v15;
    v11[4] = self;
    v12 = v6;
    v13 = v5;
    dispatch_sync(queue, v11);

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v5;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Specified Photo Library has no URL (<%@>); cannot find analysis database",
      buf,
      0xCu);
  }
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

void __58__VCPClientDatabaseManager_sharedDatabaseForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    v5 = (void *)MEMORY[0x1BCCA1B2C]();
    +[VCPDatabaseReader databaseForPhotoLibrary:](VCPDatabaseReader, "databaseForPhotoLibrary:", *(_QWORD *)(a1 + 48));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to open analysis database for Photo Library (%@)", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

- (id)sharedDatabaseForPhotoLibraryURL:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  uint8_t v9[8];
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__9;
  v17 = __Block_byref_object_dispose__9;
  v18 = 0;
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __61__VCPClientDatabaseManager_sharedDatabaseForPhotoLibraryURL___block_invoke;
    block[3] = &unk_1E6B16BF8;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(queue, block);

  }
  else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "No PhotoLibrary URL received", v9, 2u);
  }
  v7 = (id)v14[5];

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __61__VCPClientDatabaseManager_sharedDatabaseForPhotoLibraryURL___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v5 = (void *)MEMORY[0x1BCCA1B2C]();
    +[VCPDatabaseReader databaseForPhotoLibraryURL:](VCPDatabaseReader, "databaseForPhotoLibraryURL:", *(_QWORD *)(a1 + 40));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

    v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v9)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v9, *(_QWORD *)(a1 + 40));
    }
    else if ((int)MediaAnalysisLogLevel() >= 4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412290;
      v12 = v10;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Failed to open analysis database for Photo Library (%@)", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
  }
}

+ (id)sharedDatabaseForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedDatabaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedDatabaseForPhotoLibrary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)sharedDatabaseForPhotoLibraryURL:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedDatabaseManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedDatabaseForPhotoLibraryURL:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
