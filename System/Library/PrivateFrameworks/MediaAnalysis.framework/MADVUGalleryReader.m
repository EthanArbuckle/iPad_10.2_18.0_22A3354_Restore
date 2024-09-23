@implementation MADVUGalleryReader

- (MADVUGalleryReader)initWithPhotoLibrary:(id)a3
{
  id v4;
  MADVUGalleryReader *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *operationQueue;
  uint64_t v9;
  NSURL *storageURL;
  GDVUVisualUnderstandingService *vuService;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MADVUGalleryReader;
  v5 = -[MADVUGalleryReader init](&v13, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("MADVUGalleryReader", v6);
    operationQueue = v5->_operationQueue;
    v5->_operationQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(v4, "vcp_visionCacheStorageDirectoryURL");
    v9 = objc_claimAutoreleasedReturnValue();
    storageURL = v5->_storageURL;
    v5->_storageURL = (NSURL *)v9;

    vuService = v5->_vuService;
    v5->_vuService = 0;

  }
  return v5;
}

+ (id)sharedGalleryWithPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = a3;
  if (v3)
  {
    +[VCPSharedInstanceManager sharedManager](VCPSharedInstanceManager, "sharedManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__MADVUGalleryReader_sharedGalleryWithPhotoLibrary___block_invoke;
    v9[3] = &unk_1E6B1B0D8;
    v10 = v3;
    objc_msgSend(v4, "sharedInstanceWithIdentifier:andCreationBlock:", v6, v9);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

MADVUGalleryReader *__52__MADVUGalleryReader_sharedGalleryWithPhotoLibrary___block_invoke(uint64_t a1)
{
  return -[MADVUGalleryReader initWithPhotoLibrary:]([MADVUGalleryReader alloc], "initWithPhotoLibrary:", *(_QWORD *)(a1 + 32));
}

- (id)queryKeyObservationsFor:(int64_t)a3 limit:(int64_t)a4 offset:(int64_t)a5
{
  void *v9;
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  NSURL *storageURL;
  GDVUVisualUnderstandingService *v16;
  id v17;
  GDVUVisualUnderstandingService *vuService;
  NSObject *operationQueue;
  id v20;
  _QWORD v22[9];
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 buf;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (self->_vuService)
    goto LABEL_11;
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADVUGalleryReader] Lazy allocation of vuService", (uint8_t *)&buf, 2u);
  }
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v9 = (void *)getGDVUVisualUnderstandingServiceClass_softClass_0;
  v27 = getGDVUVisualUnderstandingServiceClass_softClass_0;
  if (!getGDVUVisualUnderstandingServiceClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = (uint64_t)__getGDVUVisualUnderstandingServiceClass_block_invoke_0;
    v30 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B19610;
    v31 = (void (*)(uint64_t))&v24;
    __getGDVUVisualUnderstandingServiceClass_block_invoke_0((uint64_t)&buf);
    v9 = (void *)v25[3];
  }
  v10 = objc_retainAutorelease(v9);
  _Block_object_dispose(&v24, 8);
  v11 = [v10 alloc];
  v24 = 0;
  v25 = &v24;
  v26 = 0x2050000000;
  v12 = (void *)getGDVUEntityRecognitionClientClass_softClass_0;
  v27 = getGDVUEntityRecognitionClientClass_softClass_0;
  if (!getGDVUEntityRecognitionClientClass_softClass_0)
  {
    *(_QWORD *)&buf = MEMORY[0x1E0C809B0];
    *((_QWORD *)&buf + 1) = 3221225472;
    v29 = (uint64_t)__getGDVUEntityRecognitionClientClass_block_invoke_0;
    v30 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6B19610;
    v31 = (void (*)(uint64_t))&v24;
    __getGDVUEntityRecognitionClientClass_block_invoke_0((uint64_t)&buf);
    v12 = (void *)v25[3];
  }
  v13 = objc_retainAutorelease(v12);
  _Block_object_dispose(&v24, 8);
  objc_msgSend(v13, "photos");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  storageURL = self->_storageURL;
  v23 = 0;
  v16 = (GDVUVisualUnderstandingService *)objc_msgSend(v11, "initWithClient:version:url:error:", v14, 1, storageURL, &v23);
  v17 = v23;
  vuService = self->_vuService;
  self->_vuService = v16;

  if (self->_vuService)
  {

LABEL_11:
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v29 = 0x3032000000;
    v30 = __Block_byref_object_copy__55;
    v31 = __Block_byref_object_dispose__55;
    v32 = 0;
    operationQueue = self->_operationQueue;
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __59__MADVUGalleryReader_queryKeyObservationsFor_limit_offset___block_invoke;
    v22[3] = &unk_1E6B1B100;
    v22[6] = a3;
    v22[7] = a4;
    v22[8] = a5;
    v22[4] = self;
    v22[5] = &buf;
    dispatch_sync(operationQueue, v22);
    v20 = *(id *)(*((_QWORD *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    return v20;
  }
  if ((int)MediaAnalysisLogLevel() >= 3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v17;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[MADVUGalleryReader] Failed to load Gallery - %@", (uint8_t *)&buf, 0xCu);
  }

  v20 = 0;
  return v20;
}

void __59__MADVUGalleryReader_queryKeyObservationsFor_limit_offset___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = a1[6];
    v3 = a1[7];
    v4 = a1[8];
    v10 = 134218496;
    v11 = v2;
    v12 = 2048;
    v13 = v3;
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADVUGalleryHeader] Querying key observations for mdID: %ld, limit: %ld, offset: %ld", (uint8_t *)&v10, 0x20u);
  }
  objc_msgSend(*(id *)(a1[4] + 24), "gallery");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "keyObservationsFor:limit:offset:", a1[6], a1[7], a1[8]);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1[5] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v9 = a1[6];
    v10 = 134217984;
    v11 = v9;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADVUGalleryHeader] Finished querying key observations for mdID: %ld", (uint8_t *)&v10, 0xCu);
  }
}

- (void)flush
{
  dispatch_sync((dispatch_queue_t)self->_operationQueue, &__block_literal_global_88);
}

void __27__MADVUGalleryReader_flush__block_invoke()
{
  uint8_t v0[16];

  if ((int)MediaAnalysisLogLevel() >= 6 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_1B6C4A000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[MADVUGalleryReader] Flushing operation queue ", v0, 2u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vuService, 0);
  objc_storeStrong((id *)&self->_storageURL, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
}

@end
