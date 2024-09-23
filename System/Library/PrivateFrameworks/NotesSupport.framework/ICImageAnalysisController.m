@implementation ICImageAnalysisController

+ (ICImageAnalysisController)sharedController
{
  if (sharedController_onceToken != -1)
    dispatch_once(&sharedController_onceToken, &__block_literal_global_9);
  return (ICImageAnalysisController *)(id)sharedController_instance;
}

uint64_t __45__ICImageAnalysisController_sharedController__block_invoke()
{
  ICImageAnalysisController *v0;
  void *v1;

  v0 = objc_alloc_init(ICImageAnalysisController);
  v1 = (void *)sharedController_instance;
  sharedController_instance = (uint64_t)v0;

  return objc_msgSend(getPHPhotoLibraryClass(), "enableMultiLibraryMode");
}

- (ICImageAnalysisController)init
{
  ICImageAnalysisController *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *photoLibraryQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ICImageAnalysisController;
  v2 = -[ICImageAnalysisController init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.notes.search.photoLibraryQueue", v3);
    photoLibraryQueue = v2->_photoLibraryQueue;
    v2->_photoLibraryQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)analyzeSearchableItems:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[ICImageAnalysisController analyzeSearchableItems:completion:].cold.1(v6);

  -[ICImageAnalysisController photoLibraryQueue](self, "photoLibraryQueue");
  v9 = objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke;
  v12[3] = &unk_1EA824188;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(v9, v12);

}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "SearchIndexer");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_2(a1);

  v29 = 0;
  objc_msgSend(getPHPhotoLibraryClass(), "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v29);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v29;
  v5 = v4;
  if (!v3 || v4)
  {
    obj = os_log_create("com.apple.notes", "SearchIndexer");
    if (os_log_type_enabled(obj, OS_LOG_TYPE_ERROR))
      __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_1((uint64_t)v5, obj);
  }
  else
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    obj = *(id *)(a1 + 32);
    v6 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v6)
    {
      v7 = v6;
      v22 = a1;
      v5 = 0;
      v8 = *(_QWORD *)v26;
      while (1)
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v26 != v8)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v9);

          objc_msgSend(v10, "uniqueIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "bundleIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = 0;
          objc_msgSend(v3, "processUniversalSearchJITForCoreSpotlightUniqueIdentifier:bundleID:processingTypes:error:", v11, v13, 3, &v24);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v5 = v24;

          v15 = os_log_create("com.apple.notes", "SearchIndexer");
          v16 = v15;
          if (v14)
            v17 = v5 == 0;
          else
            v17 = 0;
          if (v17)
          {
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
              goto LABEL_17;
            objc_msgSend(v10, "uniqueIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v18;
            v32 = 2112;
            v33 = v14;
            _os_log_debug_impl(&dword_1DDAA5000, v16, OS_LOG_TYPE_DEBUG, "[JIT] Processed item (%@): %@", buf, 0x16u);
          }
          else
          {
            if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
              goto LABEL_17;
            objc_msgSend(v10, "uniqueIdentifier");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v31 = v18;
            v32 = 2112;
            v33 = v5;
            _os_log_error_impl(&dword_1DDAA5000, v16, OS_LOG_TYPE_ERROR, "[JIT] Failed processing item (%@): %@", buf, 0x16u);
          }

LABEL_17:
          ++v9;
        }
        while (v7 != v9);
        v19 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
        v7 = v19;
        if (!v19)
        {
          a1 = v22;
          goto LABEL_26;
        }
      }
    }
    v5 = 0;
  }
LABEL_26:

  v20 = *(void **)(a1 + 40);
  if (v20)
  {
    dispatch_get_global_queue(0, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v21, v20);

  }
}

- (OS_dispatch_queue)photoLibraryQueue
{
  return self->_photoLibraryQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibraryQueue, 0);
}

- (void)analyzeSearchableItems:(void *)a1 completion:.cold.1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v1, v2, "[JIT] Enqueuing %lu searchable items", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_13();
}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "[JIT] Skipping image analysis because the photo library cannot be opened: %@", (uint8_t *)&v2, 0xCu);
}

void __63__ICImageAnalysisController_analyzeSearchableItems_completion___block_invoke_cold_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "count");
  OUTLINED_FUNCTION_0_3(&dword_1DDAA5000, v1, v2, "[JIT] Processing %lu searchable items", v3, v4, v5, v6, 0);
  OUTLINED_FUNCTION_13();
}

@end
