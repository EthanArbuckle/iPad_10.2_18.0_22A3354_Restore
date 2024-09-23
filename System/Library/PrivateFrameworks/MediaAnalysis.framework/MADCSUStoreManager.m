@implementation MADCSUStoreManager

- (MADCSUStoreManager)init
{
  MADCSUStoreManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *stores;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MADCSUStoreManager;
  v2 = -[MADCSUStoreManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysisd.MADCSUStoreManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    stores = v2->_stores;
    v2->_stores = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)sharedCSUStoreManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MADCSUStoreManager_sharedCSUStoreManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedCSUStoreManager_once != -1)
    dispatch_once(&sharedCSUStoreManager_once, block);
  return (id)sharedCSUStoreManager_instance;
}

void __43__MADCSUStoreManager_sharedCSUStoreManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedCSUStoreManager_instance;
  sharedCSUStoreManager_instance = (uint64_t)v0;

}

- (id)sharedCSUStoreForPhotoLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint8_t buf[16];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__33;
  v19 = __Block_byref_object_dispose__33;
  v20 = 0;
  objc_msgSend(v4, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __52__MADCSUStoreManager_sharedCSUStoreForPhotoLibrary___block_invoke;
    v10[3] = &unk_1E6B15C10;
    v13 = &v15;
    v10[4] = self;
    v11 = v5;
    v12 = v4;
    dispatch_sync(queue, v10);
    v8 = (id)v16[5];

  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADCSUStoreManager] Failed to create CSUSearchableKnowledgeObjectStore: no Photo Library URL", buf, 2u);
    }
    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __52__MADCSUStoreManager_sharedCSUStoreForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "urlForApplicationDataFolderIdentifier:", 13);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x1E0D188F8]);
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v8 = objc_msgSend(v6, "initDB:error:", v7, &v13);
    v9 = v13;
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v8;

    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    if (v12)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", v12, *(_QWORD *)(a1 + 40));
    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v9;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to initialize entity store (%@)", buf, 0xCu);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stores, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
