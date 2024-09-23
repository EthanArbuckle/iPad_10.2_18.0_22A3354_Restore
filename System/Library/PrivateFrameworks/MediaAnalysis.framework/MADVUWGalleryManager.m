@implementation MADVUWGalleryManager

- (MADVUWGalleryManager)init
{
  MADVUWGalleryManager *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMutableDictionary *galleries;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MADVUWGalleryManager;
  v2 = -[MADVUWGalleryManager init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.mediaanalysisd.MADVUWGalleryManager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    galleries = v2->_galleries;
    v2->_galleries = (NSMutableDictionary *)v5;

  }
  return v2;
}

+ (id)sharedGalleryManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__MADVUWGalleryManager_sharedGalleryManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGalleryManager_once != -1)
    dispatch_once(&sharedGalleryManager_once, block);
  return (id)sharedGalleryManager_instance;
}

void __44__MADVUWGalleryManager_sharedGalleryManager__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedGalleryManager_instance;
  sharedGalleryManager_instance = (uint64_t)v0;

}

- (id)sharedGalleryForPhotoLibrary:(id)a3
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
  v18 = __Block_byref_object_copy__3;
  v19 = __Block_byref_object_dispose__3;
  v20 = 0;
  objc_msgSend(v4, "photoLibraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    queue = self->_queue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__MADVUWGalleryManager_sharedGalleryForPhotoLibrary___block_invoke;
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
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery: no Photo Library URL", buf, 2u);
    }
    v8 = 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __53__MADVUWGalleryManager_sharedGalleryForPhotoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 48), "vcp_visionCacheStorageDirectoryURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("VUIndex.sqlite"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      VCPSignPostLog();
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = os_signpost_id_generate(v7);

      VCPSignPostLog();
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = v9;
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "VUWGallery_initWithPath", ", buf, 2u);
      }

      v20 = 0;
      v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC73D8]), "initWithPath:error:", v6, &v20);
      v12 = v20;
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v14 = *(void **)(v13 + 40);
      *(_QWORD *)(v13 + 40) = v11;

      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40))
        v15 = v12 == 0;
      else
        v15 = 0;
      if (v15)
      {
        VCPSignPostLog();
        v18 = objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1B6C4A000, v19, OS_SIGNPOST_INTERVAL_END, v8, "VUWGallery_initWithPath", ", buf, 2u);
        }

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), *(_QWORD *)(a1 + 40));
      }
      else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        v16 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        v22 = v16;
        v23 = 2112;
        v24 = v12;
        _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery with library %@: %@", buf, 0x16u);
      }

    }
    else if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      v22 = v17;
      _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVUWGalleryManager] Failed to create VUWGallery: no VUIndex URL for library %@", buf, 0xCu);
    }

  }
}

+ (id)sharedGalleryForPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedGalleryManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedGalleryForPhotoLibrary:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_galleries, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
