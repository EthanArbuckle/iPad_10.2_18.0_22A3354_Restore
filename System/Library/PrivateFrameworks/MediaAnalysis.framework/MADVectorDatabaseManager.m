@implementation MADVectorDatabaseManager

- (MADVectorDatabaseManager)init
{
  MADVectorDatabaseManager *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSMutableDictionary *databases;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)MADVectorDatabaseManager;
  v2 = -[MADVectorDatabaseManager init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.mediaanalysis.databasemanager.vector", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    databases = v2->_databases;
    v2->_databases = (NSMutableDictionary *)v6;

  }
  return v2;
}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__MADVectorDatabaseManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[MADVectorDatabaseManager sharedManager]::once != -1)
    dispatch_once(&+[MADVectorDatabaseManager sharedManager]::once, block);
  return (id)+[MADVectorDatabaseManager sharedManager]::instance;
}

void __41__MADVectorDatabaseManager_sharedManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)+[MADVectorDatabaseManager sharedManager]::instance;
  +[MADVectorDatabaseManager sharedManager]::instance = (uint64_t)v0;

}

- (id)sharedDatabaseWithPhotoLibrary:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__7;
  v16 = __Block_byref_object_dispose__7;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__MADVectorDatabaseManager_sharedDatabaseWithPhotoLibrary___block_invoke;
  block[3] = &unk_1E6B16B08;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __59__MADVectorDatabaseManager_sharedDatabaseWithPhotoLibrary___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  objc_msgSend(*(id *)(a1 + 40), "photoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    v8 = (void *)MEMORY[0x1BCCA1B2C]();
    +[MADVectorDatabase databaseWithPhotoLibrary:](MADVectorDatabase, "databaseWithPhotoLibrary:", *(_QWORD *)(a1 + 40));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (v12)
    {
      v13 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
      objc_msgSend(*(id *)(a1 + 40), "photoLibraryURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v15);

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 40);
      v17 = 138412290;
      v18 = v16;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVectorDatabaseManager] Failed to open database for %@", (uint8_t *)&v17, 0xCu);
    }
    objc_autoreleasePoolPop(v8);
  }
}

+ (id)sharedDatabaseWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint8_t v7[16];

  v3 = a3;
  if (+[VCPVideoCNNAnalyzer isMUBackboneEnabled](VCPVideoCNNAnalyzer, "isMUBackboneEnabled"))
  {
    objc_msgSend((id)objc_opt_class(), "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sharedDatabaseWithPhotoLibrary:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "[MADVectorDatabaseManager] Embedding generation disabled, skip vector database creation", v7, 2u);
    }
    v5 = 0;
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databases, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
