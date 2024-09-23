@implementation MNXPCTransactionManager

+ (id)sharedInstance
{
  if (qword_1ED0C4010 != -1)
    dispatch_once(&qword_1ED0C4010, &__block_literal_global_29);
  return (id)_MergedGlobals_34;
}

void __41__MNXPCTransactionManager_sharedInstance__block_invoke()
{
  MNXPCTransactionManager *v0;
  void *v1;

  v0 = objc_alloc_init(MNXPCTransactionManager);
  v1 = (void *)_MergedGlobals_34;
  _MergedGlobals_34 = (uint64_t)v0;

}

- (void)addHighMemoryThresholdRequest:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__MNXPCTransactionManager_addHighMemoryThresholdRequest___block_invoke;
  v6[3] = &unk_1E61D1D10;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  MNRunAsynchronouslyOnMainThread(v6);

}

void __57__MNXPCTransactionManager_addHighMemoryThresholdRequest___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "hashTableWithOptions:", 2);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1 + 32);
      v4 = *(void **)(v3 + 16);
      *(_QWORD *)(v3 + 16) = v2;

    }
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v12 = 136315138;
      v13 = objc_msgSend(v6, "UTF8String");
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_DEFAULT, "navd > XPC transaction | Enter request from %s", (uint8_t *)&v12, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count") == 1)
    {
      v7 = os_transaction_create();
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(void **)(v8 + 8);
      *(_QWORD *)(v8 + 8) = v7;

      MNGetMNXPCTransactionManagerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v10))
      {
        LOWORD(v12) = 0;
        _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "EnteredHighMemoryThreshold", ", (uint8_t *)&v12, 2u);
      }

      GEOFindOrCreateLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "navd entered high memory threshold", (uint8_t *)&v12, 2u);
      }

    }
  }
}

- (void)removeHighMemoryThresholdRequest:(id)a3 afterDelay:(double)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  double v10;

  v6 = a3;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke;
  v8[3] = &unk_1E61D2968;
  v8[4] = self;
  v9 = v6;
  v10 = a4;
  v7 = v6;
  MNRunAsynchronouslyOnMainThread(v8);

}

void __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  dispatch_time_t v4;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "containsObject:", *(_QWORD *)(a1 + 40)))
  {
    GEOFindOrCreateLog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "description");
      v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 136315138;
      v7 = objc_msgSend(v3, "UTF8String");
      _os_log_impl(&dword_1B0AD7000, v2, OS_LOG_TYPE_DEFAULT, "navd > XPC transaction |     Exit request from %s", buf, 0xCu);

    }
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
    v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 48) * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke_6;
    block[3] = &unk_1E61D23C8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_after(v4, MEMORY[0x1E0C80D38], block);
  }
}

void __71__MNXPCTransactionManager_removeHighMemoryThresholdRequest_afterDelay___block_invoke_6(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  uint8_t v12[16];
  uint8_t buf[16];

  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = (void *)MEMORY[0x1B5E0E19C]();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 16);
    *(_QWORD *)(v3 + 16) = 0;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "_navigation_isNavd");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0D275D0], "modernLoader");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "clearAllCaches");

    }
    objc_autoreleasePoolPop(v2);
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 8);
    *(_QWORD *)(v8 + 8) = 0;

    MNGetMNXPCTransactionManagerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1B0AD7000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ExitedHighMemoryThreshold", ", buf, 2u);
    }

    GEOFindOrCreateLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_1B0AD7000, v11, OS_LOG_TYPE_DEFAULT, "navd exited high memory threhold", v12, 2u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requesters, 0);
  objc_storeStrong((id *)&self->_xpcTransaction, 0);
}

@end
