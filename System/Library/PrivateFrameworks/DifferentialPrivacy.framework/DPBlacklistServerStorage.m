@implementation DPBlacklistServerStorage

void __93___DPBlacklistServerStorage_requestLatestBlacklistsSynchronously_error_lastRecordModifiedAt___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  objc_class *v20;
  void *v21;
  int v22;
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[_DPLog framework](_DPLog, "framework");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 138412802;
    v23 = v21;
    v24 = 2112;
    v25 = v7;
    v26 = 2112;
    v27 = v8;
    _os_log_debug_impl(&dword_1D3FAA000, v10, OS_LOG_TYPE_DEBUG, "%@: blacklist server responds with (error: %@, data: %@)", (uint8_t *)&v22, 0x20u);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v7;
  v13 = v7;

  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v15 = *(void **)(v14 + 40);
  *(_QWORD *)(v14 + 40) = v8;
  v16 = v8;

  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v9;
  v19 = v9;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __66___DPBlacklistServerStorage_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  v3 = (void *)MEMORY[0x1D8256B78]();
  objc_msgSend(*(id *)(a1 + 32), "setActivity:", v4);
  objc_msgSend(*(id *)(a1 + 32), "updateRuntimeBlacklistsFromServer");
  objc_autoreleasePoolPop(v3);

}

void __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  objc_class *v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  uint64_t v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  +[_DPLog daemon](_DPLog, "daemon");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v7)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_cold_1(a1, (uint64_t)v7, v11);

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = 0;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412802;
      v27 = v15;
      v28 = 2048;
      v29 = objc_msgSend(v8, "count");
      v30 = 1024;
      v31 = v9 != 0;
      _os_log_impl(&dword_1D3FAA000, v11, OS_LOG_TYPE_INFO, "%@: query operation is completed (records: %lu, cursor: %d)", (uint8_t *)&v26, 0x1Cu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObjectsFromArray:", v8);
    if (v9)
    {
      +[_DPLog daemon](_DPLog, "daemon");
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = 138412290;
        v27 = v18;
        _os_log_impl(&dword_1D3FAA000, v16, OS_LOG_TYPE_DEFAULT, "%@: query operation indicates that it has more records, fetching again using cursor", (uint8_t *)&v26, 0xCu);

      }
      v19 = *(void **)(a1 + 32);
      objc_msgSend(v19, "_queryOperationFromCursor:", v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_executeQueryOperation:onOperationQueue:onCompletion:", v13, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    }
    else
    {
      objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "lastObject");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "modificationDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v22 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 32), "_blacklistURLByKeyFrom:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, _QWORD, void *, void *))(v22 + 16))(v22, 0, v23, v13);

      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = 0;

    }
  }

}

uint64_t __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_27(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "modificationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "modificationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

void __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  if (a3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", a3);
  }
  else
  {
    +[_DPLog daemon](_DPLog, "daemon");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412802;
      v13 = v11;
      v14 = 2112;
      v15 = v7;
      v16 = 2112;
      v17 = v8;
      _os_log_error_impl(&dword_1D3FAA000, v9, OS_LOG_TYPE_ERROR, "%@: unable to obtain record(ID: %@), error: %@", (uint8_t *)&v12, 0x20u);

    }
  }

}

uint64_t __82___DPBlacklistServerStorage__executeQueryOperation_onOperationQueue_onCompletion___block_invoke_31(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a3, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
}

void __54___DPBlacklistServerStorage__requestLatestBlacklists___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412546;
  v9 = v6;
  v10 = 2112;
  v11 = a2;
  OUTLINED_FUNCTION_0(&dword_1D3FAA000, a3, v7, "%@: query operation returned error: %@", (uint8_t *)&v8);

}

@end
