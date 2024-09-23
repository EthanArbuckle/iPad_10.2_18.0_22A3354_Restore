@implementation BMDistributedContextStreamWriter

+ (id)sharedEventQueue
{
  if (sharedEventQueue_onceToken != -1)
    dispatch_once(&sharedEventQueue_onceToken, &__block_literal_global);
  return (id)sharedEventQueue_sharedEventQueue;
}

void __52__BMDistributedContextStreamWriter_sharedEventQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.contextsync.main", 0);
  v1 = (void *)sharedEventQueue_sharedEventQueue;
  sharedEventQueue_sharedEventQueue = (uint64_t)v0;

}

+ (id)sourceForStreamWithIdentifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void *v22;

  v3 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v4 = getBiomeLibrarySymbolLoc_ptr;
  v22 = getBiomeLibrarySymbolLoc_ptr;
  if (!getBiomeLibrarySymbolLoc_ptr)
  {
    v5 = (void *)BiomeLibraryLibrary();
    v4 = dlsym(v5, "BiomeLibrary");
    v20[3] = (uint64_t)v4;
    getBiomeLibrarySymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v19, 8);
  if (!v4)
    +[BMDistributedContextStreamWriter sourceForStreamWithIdentifier:].cold.1();
  ((void (*)(void))v4)();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v6, "streamWithIdentifier:error:", v3, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v8)
  {
    __biome_log_for_category();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      +[BMDistributedContextStreamWriter sourceForStreamWithIdentifier:].cold.2((uint64_t)v3, v9, v10, v11, v12, v13, v14, v15);

    v16 = 0;
  }
  else
  {
    objc_msgSend(v7, "source");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

+ (void)postEvent:(id)a3
{
  id v4;
  id v5;
  NSObject *queue;
  _QWORD block[4];
  id v8;
  id v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "sharedEventQueue");
  queue = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__BMDistributedContextStreamWriter_postEvent___block_invoke;
  block[3] = &unk_24D278748;
  v8 = v4;
  v9 = a1;
  v5 = v4;
  dispatch_sync(queue, block);

}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  NSObject *v7;
  void *v8;
  int v9;
  id BMContextSyncLOIClass;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  void *v17;
  int v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  void *v36;
  __int16 v37;
  NSObject *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "streamIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "eventDataVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedIntValue");

  if (v2)
    v6 = v3 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    getBMContextSyncLOIIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v2, "isEqualToString:", v8);

    if (v9)
    {
      BMContextSyncLOIClass = getBMContextSyncLOIClass();
    }
    else
    {
      getBMContextSyncDeviceActivityLevelIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v2, "isEqualToString:", v11);

      if (v12)
      {
        BMContextSyncLOIClass = getBMContextSyncDeviceActivityLevelClass();
      }
      else
      {
        getBMContextSyncCellularAvailabilityStatusIdentifier();
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v2, "isEqualToString:", v13);

        if (v14)
        {
          BMContextSyncLOIClass = getBMContextSyncCellularAvailabilityStatusClass();
        }
        else
        {
          getBMContextSyncWalletTransactionIdentifier();
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v2, "isEqualToString:", v15);

          if (v16)
          {
            BMContextSyncLOIClass = getBMContextSyncWalletTransactionClass();
          }
          else
          {
            getBMContextSyncAppInFocusIdentifier();
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v2, "isEqualToString:", v17);

            if (!v18)
            {
              __biome_log_for_category();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
                __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_2((uint64_t)v2, v22, v23, v24, v25, v26, v27, v28);

LABEL_25:
              __biome_log_for_category();
              v7 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
                __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_1((uint64_t)v2, v7, v29, v30, v31, v32, v33, v34);
              goto LABEL_27;
            }
            BMContextSyncLOIClass = getBMContextSyncAppInFocusClass();
          }
        }
      }
    }
    objc_msgSend(BMContextSyncLOIClass, "eventWithData:dataVersion:", v3, v5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v7 = v19;
      objc_msgSend(*(id *)(a1 + 40), "sourceForStreamWithIdentifier:", v2);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "sendEvent:", v7);
      __biome_log_for_category();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 138412546;
        v36 = v2;
        v37 = 2112;
        v38 = v7;
        _os_log_impl(&dword_214A1F000, v21, OS_LOG_TYPE_DEFAULT, "Posted event for identifier: %@, %@", (uint8_t *)&v35, 0x16u);
      }

      goto LABEL_27;
    }
    goto LABEL_25;
  }
  __biome_log_for_category();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_3(v7);
LABEL_27:

}

+ (void)sourceForStreamWithIdentifier:.cold.1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<BMRootLibrary> __softlink__BiomeLibrary(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("BMDistributedContextEventTranslation.m"), 18, CFSTR("%s"), OUTLINED_FUNCTION_1());

  __break(1u);
}

+ (void)sourceForStreamWithIdentifier:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "failed to get stream with identifier %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Failed to deserialize event with identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_214A1F000, a2, a3, "Could not post event with non-whitelisted identifier: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __46__BMDistributedContextStreamWriter_postEvent___block_invoke_cold_3(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_214A1F000, log, OS_LOG_TYPE_ERROR, "Could not post event with missing identifier or eventData", v1, 2u);
}

@end
