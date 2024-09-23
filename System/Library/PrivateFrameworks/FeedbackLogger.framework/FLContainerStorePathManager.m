@implementation FLContainerStorePathManager

- (FLContainerStorePathManager)init
{
  FLContainerStorePathManager *v2;
  uint64_t v3;
  NSMutableDictionary *storeIdToContainerPathMap;
  uint64_t v5;
  NSMutableArray *sandboxExtensionTokens;
  uint64_t v7;
  NSMutableDictionary *storeIdToLastSandboxExtensionRequestMap;
  uint64_t v9;
  OS_os_log *log;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)FLContainerStorePathManager;
  v2 = -[FLContainerStorePathManager init](&v12, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    storeIdToContainerPathMap = v2->_storeIdToContainerPathMap;
    v2->_storeIdToContainerPathMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    sandboxExtensionTokens = v2->_sandboxExtensionTokens;
    v2->_sandboxExtensionTokens = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    storeIdToLastSandboxExtensionRequestMap = v2->_storeIdToLastSandboxExtensionRequestMap;
    v2->_storeIdToLastSandboxExtensionRequestMap = (NSMutableDictionary *)v7;

    flLogForObject(v2);
    v9 = objc_claimAutoreleasedReturnValue();
    log = v2->_log;
    v2->_log = (OS_os_log *)v9;

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
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
  -[FLContainerStorePathManager sandboxExtensionTokens](self, "sandboxExtensionTokens");
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
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "intValue");
        sandbox_extension_release();
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FLContainerStorePathManager;
  -[FLContainerStorePathManager dealloc](&v8, sel_dealloc);
}

- (id)containerPathForStoreId:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  NSObject *v11;
  id v12;
  void *v13;
  FeedbackLoggerFBFClient *v14;
  _QWORD v16[5];
  id v17;
  uint64_t *v18;
  uint8_t buf[16];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v4 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__411;
  v24 = __Block_byref_object_dispose__412;
  -[FLContainerStorePathManager storeIdToContainerPathMap](self, "storeIdToContainerPathMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v25 = (id)objc_claimAutoreleasedReturnValue();

  v6 = (void *)v21[5];
  if (v6)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[FLContainerStorePathManager storeIdToLastSandboxExtensionRequestMap](self, "storeIdToLastSandboxExtensionRequestMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_msgSend(v7, "timeIntervalSinceDate:", v9), v10 >= 1.0))
  {
    -[FLContainerStorePathManager storeIdToLastSandboxExtensionRequestMap](self, "storeIdToLastSandboxExtensionRequestMap");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKeyedSubscript:", v7, v4);

    v14 = objc_alloc_init(FeedbackLoggerFBFClient);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__FLContainerStorePathManager_containerPathForStoreId___block_invoke;
    v16[3] = &unk_1E68A3038;
    v16[4] = self;
    v18 = &v20;
    v17 = v4;
    -[FeedbackLoggerFBFClient requestSandboxExtensionForBundleID:completion:](v14, "requestSandboxExtensionForBundleID:completion:", v17, v16);

    v6 = (void *)v21[5];
LABEL_8:
    v12 = v6;
    goto LABEL_9;
  }
  -[FLContainerStorePathManager log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1B512E000, v11, OS_LOG_TYPE_ERROR, "Throttling repeat request for group container sandbox extension.", buf, 2u);
  }

  v12 = 0;
LABEL_9:
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (NSMutableDictionary)storeIdToContainerPathMap
{
  return self->_storeIdToContainerPathMap;
}

- (void)setStoreIdToContainerPathMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)sandboxExtensionTokens
{
  return self->_sandboxExtensionTokens;
}

- (void)setSandboxExtensionTokens:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableDictionary)storeIdToLastSandboxExtensionRequestMap
{
  return self->_storeIdToLastSandboxExtensionRequestMap;
}

- (void)setStoreIdToLastSandboxExtensionRequestMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (FeedbackLoggerFBFClient)fbf
{
  return self->_fbf;
}

- (void)setFbf:(id)a3
{
  objc_storeStrong((id *)&self->_fbf, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fbf, 0);
  objc_storeStrong((id *)&self->_storeIdToLastSandboxExtensionRequestMap, 0);
  objc_storeStrong((id *)&self->_sandboxExtensionTokens, 0);
  objc_storeStrong((id *)&self->_storeIdToContainerPathMap, 0);
}

void __55__FLContainerStorePathManager_containerPathForStoreId___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  const char *v19;
  uint8_t v20[8];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || !v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)v20 = 0;
    v19 = "Unable to obtain group container sandbox extension.";
LABEL_10:
    _os_log_error_impl(&dword_1B512E000, v18, OS_LOG_TYPE_ERROR, v19, v20, 2u);
    goto LABEL_8;
  }
  objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
  v8 = sandbox_extension_consume();
  v9 = *(void **)(a1 + 32);
  if (v8 == -1)
  {
    objc_msgSend(v9, "log");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_WORD *)v20 = 0;
    v19 = "Unable to consume group container sandbox extension.";
    goto LABEL_10;
  }
  objc_msgSend(v9, "sandboxExtensionTokens");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  v12 = (void *)MEMORY[0x1E0CB3940];
  v21[0] = v7;
  v21[1] = CFSTR("data.sqlite");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pathWithComponents:", v13);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(void **)(v15 + 40);
  *(_QWORD *)(v15 + 40) = v14;

  v17 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(*(id *)(a1 + 32), "storeIdToContainerPathMap");
  v18 = objc_claimAutoreleasedReturnValue();
  -[NSObject setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, *(_QWORD *)(a1 + 40));
LABEL_8:

}

@end
