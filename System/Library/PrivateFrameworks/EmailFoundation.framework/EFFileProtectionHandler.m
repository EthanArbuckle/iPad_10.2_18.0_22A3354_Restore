@implementation EFFileProtectionHandler

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__EFFileProtectionHandler_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_3 != -1)
    dispatch_once(&log_onceToken_3, block);
  return (OS_os_log *)(id)log_log_3;
}

void __30__EFFileProtectionHandler_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_3;
  log_log_3 = (uint64_t)v1;

}

- (EFFileProtectionHandler)init
{
  EFFileProtectionHandler *v2;
  uint64_t v3;
  NSMutableArray *moveFileQueue;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *backgroundTaskQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EFFileProtectionHandler;
  v2 = -[EFFileProtectionHandler init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    moveFileQueue = v2->_moveFileQueue;
    v2->_moveFileQueue = (NSMutableArray *)v3;

    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.email.moveFileProtectionBackgroundTaskQueue", v5);
    backgroundTaskQueue = v2->_backgroundTaskQueue;
    v2->_backgroundTaskQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (BOOL)moveFile:(id)a3 toProtectionClass:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  int v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = *MEMORY[0x1E0C99938];
  v14 = 0;
  v8 = objc_msgSend(v5, "setResourceValue:forKey:error:", v6, v7, &v14);
  v9 = v14;
  if (v8)
  {
    +[EFFileProtectionHandler log](EFFileProtectionHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[EFFileProtectionHandler moveFile:toProtectionClass:].cold.1(v11, (uint64_t)v6, buf, v10);
    }
  }
  else
  {
    +[EFFileProtectionHandler log](EFFileProtectionHandler, "log");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v16 = v13;
      v17 = 2112;
      v18 = v6;
      v19 = 2114;
      v20 = v9;
      _os_log_error_impl(&dword_1B106E000, v10, OS_LOG_TYPE_ERROR, "Moving file %@ to protection type %@ failed with error %{public}@", buf, 0x20u);

    }
  }

  return v8;
}

- (void)enqueueMovingFile:(id)a3 toProtectionClass:(id)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", a4, a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_moveFileQueue, "addObject:", v5);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)enqueueMovingFiles:(id)a3 toProtectionClass:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(v8, "setObject:forKey:", v7, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12++), (_QWORD)v13);
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_moveFileQueue, "addObject:", v8);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)enqueueMovingFileProtections:(id)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableArray addObject:](self->_moveFileQueue, "addObject:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)_moveQueuedFiles
{
  char v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t k;
  id v29;
  os_unfair_lock_t lock;
  EFFileProtectionHandler *v32;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  id (*v41)(uint64_t);
  void *v42;
  uint64_t v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v34 = (void *)objc_opt_new();
  v33 = (void *)objc_opt_new();
  lock = &self->_lock;
  v32 = self;
  v3 = 1;
  while (1)
  {
    os_unfair_lock_lock(lock);
    -[NSMutableArray firstObject](v32->_moveFileQueue, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
      break;
    -[NSMutableArray removeObjectAtIndex:](v32->_moveFileQueue, "removeObjectAtIndex:", 0);
    os_unfair_lock_unlock(lock);
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v50;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v50 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * i);
          objc_msgSend(v5, "objectForKeyedSubscript:", v9, lock);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = -[EFFileProtectionHandler moveFile:toProtectionClass:](v32, "moveFile:toProtectionClass:", v9, v10);
          objc_msgSend(v34, "objectForKeyedSubscript:", v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (v11)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "unsignedIntegerValue") + 1);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "setObject:forKeyedSubscript:", v13, v10);

            }
          }
          else
          {
            if (v11)
              v14 = &unk_1E62BDB88;
            else
              v14 = &unk_1E62BDBA0;
            objc_msgSend(v34, "setObject:forKeyedSubscript:", v14, v10);
          }
          objc_msgSend(v33, "objectForKeyedSubscript:", v10);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
          {
            if (!v11)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v15, "unsignedIntegerValue") + 1);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "setObject:forKeyedSubscript:", v16, v10);

            }
          }
          else
          {
            if (v11)
              v17 = &unk_1E62BDBA0;
            else
              v17 = &unk_1E62BDB88;
            objc_msgSend(v33, "setObject:forKeyedSubscript:", v17, v10);
          }

          v3 &= v11;
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v49, v55, 16);
      }
      while (v6);
    }

  }
  os_unfair_lock_unlock(lock);
  if (objc_msgSend(v34, "count"))
  {
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    v18 = v34;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v46;
      v21 = MEMORY[0x1E0C809B0];
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v46 != v20)
            objc_enumerationMutation(v18);
          v23 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * j);
          v39 = v21;
          v40 = 3221225472;
          v41 = __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke;
          v42 = &unk_1E62A5D20;
          v43 = v23;
          v24 = v18;
          v44 = v24;
          AnalyticsSendEventLazy();

        }
        v19 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v19);
    }

  }
  if (objc_msgSend(v33, "count", lock))
  {
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v25 = v33;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
    if (v26)
    {
      v27 = *(_QWORD *)v36;
      do
      {
        for (k = 0; k != v26; ++k)
        {
          if (*(_QWORD *)v36 != v27)
            objc_enumerationMutation(v25);
          v29 = v25;
          AnalyticsSendEventLazy();

        }
        v26 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v35, v53, 16);
      }
      while (v26);
    }

  }
  return v3 & 1;
}

id __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("Target File Protection"));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Count"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Success"), CFSTR("Status"));
  return v2;
}

id __43__EFFileProtectionHandler__moveQueuedFiles__block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("Target File Protection"));
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("Count"));

  objc_msgSend(v2, "setObject:forKeyedSubscript:", CFSTR("Failure"), CFSTR("Status"));
  return v2;
}

- (void)unregisterMoveFileBackgroundTask
{
  OUTLINED_FUNCTION_0_0(&dword_1B106E000, a1, a3, "Stopping background task for moving file protection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)registerMoveFileBackgroundTask
{
  OUTLINED_FUNCTION_0_0(&dword_1B106E000, a1, a3, "Starting background task for moving file protection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_moveQueuedFiles");
  }
  else
  {
    +[EFFileProtectionHandler log](EFFileProtectionHandler, "log");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke_cold_1(v3);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundTaskQueue, 0);
  objc_storeStrong((id *)&self->_moveFileQueue, 0);
}

- (void)moveFile:(uint8_t *)buf toProtectionClass:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1B106E000, log, OS_LOG_TYPE_DEBUG, "Successfully moved file %@ to protection type %@", buf, 0x16u);

}

void __57__EFFileProtectionHandler_registerMoveFileBackgroundTask__block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B106E000, log, OS_LOG_TYPE_ERROR, "Not handling background task because FileProtectionHandler is nil.", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
