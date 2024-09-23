@implementation QLThumbnailGenerationQueue

- (QLThumbnailGenerationQueue)init
{
  QLThumbnailGenerationQueue *v2;
  NSOperationQueue *v3;
  NSOperationQueue *queue;
  NSMutableDictionary *v5;
  NSMutableDictionary *queuedURLs;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)QLThumbnailGenerationQueue;
  v2 = -[QLThumbnailGenerationQueue init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    queue = v2->_queue;
    v2->_queue = v3;

    -[NSOperationQueue setName:](v2->_queue, "setName:", CFSTR("com.apple.quicklook.thumbnailgeneration"));
    -[NSOperationQueue setQualityOfService:](v2->_queue, "setQualityOfService:", 9);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v2->_queue, "setMaxConcurrentOperationCount:", 1);
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    queuedURLs = v2->_queuedURLs;
    v2->_queuedURLs = v5;

  }
  return v2;
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__QLThumbnailGenerationQueue_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_once_0 != -1)
    dispatch_once(&sharedInstance_once_0, block);
  return (id)sSharedInstance;
}

void __44__QLThumbnailGenerationQueue_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sSharedInstance;
  sSharedInstance = (uint64_t)v1;

}

- (void)enqueueThumbnailGenerationIfNeededForDocumentAtURL:(id)a3 atBackgroundPriority:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(id *);
  void *v20;
  QLThumbnailGenerationQueue *v21;
  id v22;
  id v23;
  BOOL v24;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = qltLogHandles[0];
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v10 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailGenerationQueue enqueueThumbnailGenerationIfNeededForDocumentAtURL:atBackgroundPriority:completionHandler:].cold.1((uint64_t)v8, v10, v9);
  v11 = (void *)MEMORY[0x1E0CB34C8];
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke;
  v20 = &unk_1E5D7CF68;
  v21 = self;
  v22 = v8;
  v24 = v6;
  v23 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v11, "blockOperationWithBlock:", &v17);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v6)
    v16 = 9;
  else
    v16 = 25;
  objc_msgSend(v14, "setQualityOfService:", v16, v17, v18, v19, v20, v21);
  -[NSOperationQueue addOperation:](self->_queue, "addOperation:", v15);

}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke(id *a1)
{
  char *v1;
  void *v2;
  _QWORD *v3;
  void *v4;
  NSObject *v5;
  const void *v6;
  QLThumbnailStoreRetrievalOperation *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t);
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  id location;
  _QWORD v22[2];

  v1 = (char *)a1;
  v22[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "queuedURLs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v1 + 40;
  objc_msgSend(v2, "objectForKeyedSubscript:", *((_QWORD *)v1 + 5));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = qltLogHandles[0];
  if (!v4)
  {
    if (!qltLogHandles[0])
    {
      QLTInitLogging();
      v5 = qltLogHandles[0];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_1(v5);
    v7 = -[QLThumbnailStoreRetrievalOperation initWithDocumentAtURL:]([QLThumbnailStoreRetrievalOperation alloc], "initWithDocumentAtURL:", *((_QWORD *)v1 + 5));
    -[QLThumbnailStoreRetrievalOperation setGenerateThumbnailsAtBackgroundPriority:](v7, "setGenerateThumbnailsAtBackgroundPriority:", v1[56]);
    objc_initWeak(&location, v7);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5;
    v17 = &unk_1E5D7CF40;
    objc_copyWeak(&v20, &location);
    v18 = *((_QWORD *)v1 + 4);
    v19 = *((id *)v1 + 5);
    -[QLThumbnailStoreRetrievalOperation setCompletionBlock:](v7, "setCompletionBlock:", &v14);
    if (v1[56])
      v9 = 9;
    else
      v9 = 25;
    -[QLThumbnailStoreRetrievalOperation setQualityOfService:](v7, "setQualityOfService:", v9, v14, v15, v16, v17, v18);
    objc_msgSend(*((id *)v1 + 4), "queue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addOperation:", v7);

    objc_msgSend(*((id *)v1 + 4), "queuedURLs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *((_QWORD *)v1 + 6);
    if (v12)
    {
      v1 = (char *)_Block_copy(*((const void **)v1 + 6));
      v22[0] = v1;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0C9AA60];
    }
    objc_msgSend(v11, "setObject:forKey:", v13, *v3);
    if (v12)
    {

    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    goto LABEL_21;
  }
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v5 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_2((uint64_t *)v1 + 5, v5);
  v6 = (const void *)*((_QWORD *)v1 + 6);
  if (v6)
  {
    v7 = (QLThumbnailStoreRetrievalOperation *)_Block_copy(v6);
    objc_msgSend(v4, "arrayByAddingObject:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*((_QWORD *)v1 + 4) + 16), "setObject:forKeyedSubscript:", v8, *((_QWORD *)v1 + 5));

LABEL_21:
  }

}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  char v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  uint64_t v17;
  char v18;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_loadWeakRetained(v2);
  objc_msgSend(v5, "addition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "additionSize");

  v8 = objc_loadWeakRetained(v2);
  v9 = objc_msgSend(v8, "thumbnailWasJustAutomaticallyGenerated");

  v10 = qltLogHandles[0];
  if (!qltLogHandles[0])
  {
    QLTInitLogging();
    v10 = qltLogHandles[0];
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5_cold_1(v10, v2);
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_6;
  v14[3] = &unk_1E5D7CF18;
  v12 = *(void **)(a1 + 40);
  v14[4] = *(_QWORD *)(a1 + 32);
  v18 = v9;
  v16 = v4;
  v17 = v7;
  v15 = v12;
  v13 = v4;
  objc_msgSend(v11, "addOperationWithBlock:", v14);

}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_6(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "queuedURLs", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++) + 16))();
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "queuedURLs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

- (void)noteThumbnailGenerationQueuedExternallyForDocumentAtURL:(id)a3
{
  id v4;
  NSOperationQueue *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __86__QLThumbnailGenerationQueue_noteThumbnailGenerationQueuedExternallyForDocumentAtURL___block_invoke;
  v7[3] = &unk_1E5D7C118;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v7);

}

void __86__QLThumbnailGenerationQueue_noteThumbnailGenerationQueuedExternallyForDocumentAtURL___block_invoke(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AA60], *(_QWORD *)(a1 + 40));
}

- (NSMutableDictionary)queuedURLs
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setQueuedURLs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSOperationQueue)queue
{
  return (NSOperationQueue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuedURLs, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)enqueueThumbnailGenerationIfNeededForDocumentAtURL:(uint64_t)a1 atBackgroundPriority:(void *)a2 completionHandler:(const void *)a3 .cold.1(uint64_t a1, void *a2, const void *a3)
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a2;
  v11 = _Block_copy(a3);
  OUTLINED_FUNCTION_0_4(&dword_1AE3F5000, v5, v6, "Will queue for %@ and completion block %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AE3F5000, log, OS_LOG_TYPE_DEBUG, "Scheduling retrieval operation", v1, 2u);
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_cold_2(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1AE3F5000, a2, OS_LOG_TYPE_DEBUG, "%@ already queued, adding completion block", (uint8_t *)&v3, 0xCu);
}

void __120__QLThumbnailGenerationQueue_enqueueThumbnailGenerationIfNeededForDocumentAtURL_atBackgroundPriority_completionHandler___block_invoke_5_cold_1(void *a1, id *a2)
{
  id v3;
  id WeakRetained;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  WeakRetained = objc_loadWeakRetained(a2);
  OUTLINED_FUNCTION_0_4(&dword_1AE3F5000, v5, v6, "Retrieval operation %@ finished with error %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_9();
}

@end
