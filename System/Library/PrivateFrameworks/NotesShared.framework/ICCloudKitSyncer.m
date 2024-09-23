@implementation ICCloudKitSyncer

- (void)saveUnsyncedObjectsWithRetryCount:(unint64_t)a3 completionBlock:(id)a4
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18[2];
  id location;

  v6 = a4;
  v7 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    -[ICCloudKitSyncer saveUnsyncedObjectsWithRetryCount:completionBlock:].cold.1(a3, v7, v8, v9, v10, v11, v12, v13);

  objc_initWeak(&location, self);
  +[ICCloudContext sharedContext](ICCloudContext, "sharedContext");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke;
  v16[3] = &unk_1E76CBCE0;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v15 = v6;
  v17 = v15;
  objc_msgSend(v14, "processAllCloudObjectsWithCompletionHandler:", v16);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  uint64_t v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (objc_msgSend(v3, "count"))
  {
    v23 = a1;
    v24 = WeakRetained;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v25 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v9);
          v11 = os_log_create("com.apple.notes", "Cloud");
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v31 = v10;
            _os_log_error_impl(&dword_1BD918000, v11, OS_LOG_TYPE_ERROR, "Error pushing cloud objects: %@", buf, 0xCu);
          }

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      }
      while (v7);
    }

    v12 = *(_QWORD *)(v23 + 48);
    if (v12)
    {
      WeakRetained = v24;
      objc_msgSend(v24, "saveUnsyncedObjectsWithRetryCount:completionBlock:", v12 - 1, *(_QWORD *)(v23 + 32));
      v3 = v25;
    }
    else
    {
      v14 = os_log_create("com.apple.notes", "Cloud");
      WeakRetained = v24;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_2();

      v3 = v25;
      if (*(_QWORD *)(v23 + 32))
      {
        +[ICCloudContext errorFromErrors:](ICCloudContext, "errorFromErrors:", v5);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = os_log_create("com.apple.notes", "Cloud");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_1((uint64_t)v15, v16, v17, v18, v19, v20, v21, v22);

        (*(void (**)(void))(*(_QWORD *)(v23 + 32) + 16))();
      }
    }
  }
  else
  {
    v13 = *(_QWORD *)(a1 + 32);
    if (v13)
      (*(void (**)(uint64_t, _QWORD))(v13 + 16))(v13, 0);
  }

}

- (void)saveUnsyncedObjects
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Saving un-synced notes to CloudKit", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "setQualityOfService:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setDiscretionaryNetworkBehavior:", *(_QWORD *)(a1 + 56));
  objc_msgSend(*(id *)(a1 + 40), "setEnableLongLivedOperations:", *(unsigned __int8 *)(a1 + 64));
  objc_msgSend(*(id *)(a1 + 40), "setDisableAutomaticallyRetryNetworkFailures:", *(unsigned __int8 *)(a1 + 65));
  v5 = os_log_create("com.apple.notes", "Cloud");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke_cold_1();

  objc_msgSend(v4, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "cloudKitSyncer:didUpdateProgress:", v4, 1.0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "cloudKitSyncer:didFinishWithError:", v4, v3);

}

- (ICCloudKitSyncerDelegate)delegate
{
  return (ICCloudKitSyncerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)saveUnsyncedObjectsWithRetryCount:(uint64_t)a3 completionBlock:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Saving un-synced notes to CloudKit with a max retry count of %zu", a5, a6, a7, a8, 0);
}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1BD918000, a2, a3, "Calling completion block with error: %@", a5, a6, a7, a8, 2u);
}

void __70__ICCloudKitSyncer_saveUnsyncedObjectsWithRetryCount_completionBlock___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "No more retries left saving unsynced notes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

void __39__ICCloudKitSyncer_saveUnsyncedObjects__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2_1(&dword_1BD918000, v0, v1, "Restored previous cloud context options", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2_0();
}

@end
