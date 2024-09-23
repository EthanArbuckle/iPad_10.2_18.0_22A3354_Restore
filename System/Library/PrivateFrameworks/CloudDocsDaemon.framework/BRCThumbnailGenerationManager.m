@implementation BRCThumbnailGenerationManager

- (BRCThumbnailGenerationManager)init
{
  BRCThumbnailGenerationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *thumbnailsOperations;
  NSObject *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *thumbnailQueue;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *thumbnailPrivateQueue;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)BRCThumbnailGenerationManager;
  v2 = -[BRCThumbnailGenerationManager init](&v14, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    thumbnailsOperations = v2->_thumbnailsOperations;
    v2->_thumbnailsOperations = v3;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.bird.thumbnails", v6);

    thumbnailQueue = v2->_thumbnailQueue;
    v2->_thumbnailQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_autorelease_frequency(v9, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create("com.apple.bird.thumbnails.private", v10);

    thumbnailPrivateQueue = v2->_thumbnailPrivateQueue;
    v2->_thumbnailPrivateQueue = (OS_dispatch_queue *)v11;

  }
  return v2;
}

+ (id)defaultManager
{
  if (defaultManager_onceToken != -1)
    dispatch_once(&defaultManager_onceToken, &__block_literal_global_0);
  return (id)defaultManager_defaultManager;
}

void __47__BRCThumbnailGenerationManager_defaultManager__block_invoke()
{
  BRCThumbnailGenerationManager *v0;
  void *v1;

  v0 = objc_alloc_init(BRCThumbnailGenerationManager);
  v1 = (void *)defaultManager_defaultManager;
  defaultManager_defaultManager = (uint64_t)v0;

}

- (unint64_t)_thumbnailOperationsMax
{
  void *v2;
  unint64_t v3;

  +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "thumbnailTransferQueueWidth");

  return v3;
}

- (BOOL)canScheduleMoreJobs
{
  return !self->_prepareReachedMax;
}

- (void)_addThumbnailOperation:(id)a3 thumbnailID:(id)a4
{
  id v6;
  void *v7;
  NSObject *thumbnailPrivateQueue;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v9 = a3;
  v6 = a4;
  v7 = v6;
  if (v6)
  {
    thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke;
    block[3] = &unk_1E875D448;
    block[4] = self;
    v11 = v6;
    v12 = v9;
    dispatch_sync(thumbnailPrivateQueue, block);

  }
}

unint64_t __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke(_QWORD *a1)
{
  id *v1;
  unint64_t v2;
  unint64_t result;
  void *v4;
  NSObject *v5;

  v1 = (id *)(a1 + 4);
  objc_msgSend(*(id *)(a1[4] + 32), "setObject:forKeyedSubscript:", a1[6], a1[5]);
  v2 = objc_msgSend(*((id *)*v1 + 4), "count");
  result = objc_msgSend(*v1, "_thumbnailOperationsMax");
  if (v2 >= result)
  {
    brc_bread_crumbs();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke_cold_1((uint64_t)v1);

    *((_BYTE *)*v1 + 24) = 1;
    result = *((_QWORD *)*v1 + 5);
    if (result)
      return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_removeThumbnailOperationForThumbnailID:(id)a3
{
  id v4;
  NSObject *thumbnailPrivateQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
    block[1] = 3221225472;
    block[2] = __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke;
    block[3] = &unk_1E875D470;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(thumbnailPrivateQueue, block);

    v4 = v6;
  }

}

unint64_t __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke(uint64_t a1)
{
  id *v1;
  unint64_t result;
  unint64_t v3;
  void *v4;
  NSObject *v5;

  v1 = (id *)(a1 + 32);
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  if (*((_BYTE *)*v1 + 24))
  {
    v3 = objc_msgSend(*((id *)*v1 + 4), "count");
    result = objc_msgSend(*v1, "_thumbnailOperationsMax");
    if (v3 < result)
    {
      brc_bread_crumbs();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      brc_default_log();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke_cold_1((uint64_t)v1);

      *((_BYTE *)*v1 + 24) = 0;
      result = *((_QWORD *)*v1 + 6);
      if (result)
        return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (id)_generateThumbnailOperationAtURL:(id)a3 targetURL:(id)a4 timeout:(id)a5 sessionContext:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  BRCThumbnailGenerateOperation *v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[BRCThumbnailGenerateOperation initWithDocumentAtURL:targetURL:timeout:sessionContext:]([BRCThumbnailGenerateOperation alloc], "initWithDocumentAtURL:targetURL:timeout:sessionContext:", v12, v11, v10, v9);

  return v13;
}

- (void)_addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 timeout:(id)a6 syncContext:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v23;
  id v24;
  OS_dispatch_queue *thumbnailQueue;
  id v26;
  id v27;
  NSObject *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  NSObject *v33;
  _QWORD *v34;
  const char *label;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  BRCThumbnailGenerationManager *v46;
  id v47;
  id v48;
  id v49;
  id location;
  __int128 v51;
  uint64_t v52;
  _BYTE block[24];
  void *v54;
  NSObject *v55;
  id v56;
  __int128 v57;
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v39 = a6;
  v17 = a7;
  v18 = a8;
  objc_msgSend(v17, "sessionContext");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRCThumbnailGenerationManager _generateThumbnailOperationAtURL:targetURL:timeout:sessionContext:](self, "_generateThumbnailOperationAtURL:targetURL:timeout:sessionContext:", v14, v15, v39, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  -[BRCThumbnailGenerationManager _addThumbnailOperation:thumbnailID:](self, "_addThumbnailOperation:thumbnailID:", v20, v16);
  brc_bread_crumbs();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)block = 138412802;
    *(_QWORD *)&block[4] = v16;
    *(_WORD *)&block[12] = 2112;
    *(_QWORD *)&block[14] = v20;
    *(_WORD *)&block[22] = 2112;
    v54 = v21;
    _os_log_debug_impl(&dword_1CBD43000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Generating thumbnail for ID %@ (shouldTransferThumbnail:yes) %@%@", block, 0x20u);
  }

  objc_initWeak(&location, v20);
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke;
  v43[3] = &unk_1E875D498;
  v38 = v15;
  v44 = v38;
  v37 = v14;
  v45 = v37;
  objc_copyWeak(&v49, &location);
  v23 = v18;
  v48 = v23;
  v46 = self;
  v24 = v16;
  v47 = v24;
  objc_msgSend(v20, "setSaveThumbnailCompletionBlock:", v43);
  thumbnailQueue = self->_thumbnailQueue;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke_7;
  v40[3] = &unk_1E875D470;
  v26 = v17;
  v41 = v26;
  v27 = v20;
  v42 = v27;
  v28 = thumbnailQueue;
  v29 = v40;
  v30 = (void *)MEMORY[0x1D17A6BE8]();
  v51 = 0uLL;
  v52 = 0;
  __brc_create_section(0, (uint64_t)"dispatch_async_with_logs", 262, &v51);
  brc_bread_crumbs();
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  brc_default_log();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
  {
    v36 = v51;
    label = dispatch_queue_get_label(v28);
    *(_DWORD *)block = 134218498;
    *(_QWORD *)&block[4] = v36;
    *(_WORD *)&block[12] = 2080;
    *(_QWORD *)&block[14] = label;
    *(_WORD *)&block[22] = 2112;
    v54 = v31;
    _os_log_debug_impl(&dword_1CBD43000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx dispatching to %s%@", block, 0x20u);
  }

  v57 = v51;
  v58 = v52;
  *(_QWORD *)block = MEMORY[0x1E0C809B0];
  *(_QWORD *)&block[8] = 3221225472;
  *(_QWORD *)&block[16] = __dispatch_async_with_logs_block_invoke;
  v54 = &unk_1E875D578;
  v33 = v28;
  v55 = v33;
  v34 = v29;
  v56 = v34;
  dispatch_async(v33, block);

  objc_autoreleasePoolPop(v30);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&location);
}

void __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  id WeakRetained;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(id *)(a1 + 32);
  if (v3)
  {
    brc_bread_crumbs();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    brc_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u))
    {
      v8 = *(_QWORD *)(a1 + 40);
      v9 = 138412802;
      v10 = v8;
      v11 = 2112;
      v12 = v3;
      v13 = 2112;
      v14 = v5;
      _os_log_error_impl(&dword_1CBD43000, v6, (os_log_type_t)0x90u, "[ERROR] Thumbnail creation of %@ failed with error: %@%@", (uint8_t *)&v9, 0x20u);
    }

    v4 = 0;
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  objc_msgSend(*(id *)(a1 + 48), "_removeThumbnailOperationForThumbnailID:", *(_QWORD *)(a1 + 56));
  objc_msgSend(WeakRetained, "hash");
  kdebug_trace();

}

uint64_t __125__BRCThumbnailGenerationManager__addThumbnailGenerationJobAtURL_targetURL_thumbnailID_timeout_syncContext_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addOperation:", *(_QWORD *)(a1 + 40));
}

- (void)addThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 thumbnailID:(id)a5 syncContext:(id)a6 completionHandler:(id)a7
{
  void *v13;
  id v14;
  id v15;

  if (a5)
  {
    v15 = a7;
    -[BRCThumbnailGenerationManager _addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:](self, "_addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:", a3, a4, a5, 0, a6);
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v14 = a7;
    objc_msgSend(v13, "brc_errorInvalidParameter:value:", CFSTR("thumbnailID"), 0);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD))a7 + 2))(v14, 0);

  }
}

- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 syncContext:(id)a5 completionHandler:(id)a6
{
  -[BRCThumbnailGenerationManager _addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:](self, "_addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:", a3, a4, 0, 0, a5, a6);
}

- (void)addOutOfBandThumbnailGenerationJobAtURL:(id)a3 targetURL:(id)a4 timeout:(double)a5 syncContext:(id)a6 completionHandler:(id)a7
{
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  v12 = (void *)MEMORY[0x1E0CB37E8];
  v13 = a7;
  v14 = a6;
  v15 = a4;
  v16 = a3;
  objc_msgSend(v12, "numberWithDouble:", a5);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  -[BRCThumbnailGenerationManager _addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:](self, "_addThumbnailGenerationJobAtURL:targetURL:thumbnailID:timeout:syncContext:completionHandler:", v16, v15, 0, v17, v14, v13);

}

- (void)cancel
{
  NSObject *thumbnailPrivateQueue;
  _QWORD block[5];

  thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__BRCThumbnailGenerationManager_cancel__block_invoke;
  block[3] = &unk_1E875D500;
  block[4] = self;
  dispatch_sync(thumbnailPrivateQueue, block);
}

uint64_t __39__BRCThumbnailGenerationManager_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_12);
}

uint64_t __39__BRCThumbnailGenerationManager_cancel__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "cancel");
}

- (id)operationForThumbnailID:(id)a3
{
  id v4;
  NSObject *thumbnailPrivateQueue;
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
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  thumbnailPrivateQueue = self->_thumbnailPrivateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__BRCThumbnailGenerationManager_operationForThumbnailID___block_invoke;
  block[3] = &unk_1E875D528;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(thumbnailPrivateQueue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __57__BRCThumbnailGenerationManager_operationForThumbnailID___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 32), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)description
{
  NSMutableDictionary *thumbnailsOperations;
  _QWORD v4[4];
  id v5;

  thumbnailsOperations = self->_thumbnailsOperations;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __44__BRCThumbnailGenerationManager_description__block_invoke;
  v4[3] = &unk_1E875D550;
  v5 = 0;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](thumbnailsOperations, "enumerateKeysAndObjectsUsingBlock:", v4);

  return 0;
}

uint64_t __44__BRCThumbnailGenerationManager_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("[r:%@]: %@"), a2, a3);
}

- (id)reachedThumbnailMaximumCapacity
{
  return self->_reachedThumbnailMaximumCapacity;
}

- (void)setReachedThumbnailMaximumCapacity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (id)hasThumbnailAvailableSlot
{
  return self->_hasThumbnailAvailableSlot;
}

- (void)setHasThumbnailAvailableSlot:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_hasThumbnailAvailableSlot, 0);
  objc_storeStrong(&self->_reachedThumbnailMaximumCapacity, 0);
  objc_storeStrong((id *)&self->_thumbnailsOperations, 0);
  objc_storeStrong((id *)&self->_thumbnailPrivateQueue, 0);
  objc_storeStrong((id *)&self->_thumbnailQueue, 0);
}

void __68__BRCThumbnailGenerationManager__addThumbnailOperation_thumbnailID___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v1, v2, "[DEBUG] Thumbnail manager: reached maximum allowed number of thumbnails retrieval (%ld)%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

void __73__BRCThumbnailGenerationManager__removeThumbnailOperationForThumbnailID___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_1_0(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1CBD43000, v1, v2, "[DEBUG] Thumbnail manager: below maximum allowed number of thumbnails retrieval (%ld)%@", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_3_0();
}

@end
