@implementation C2RequestManager

+ (id)sharedManager
{
  return (id)sharedManager;
}

- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5 sessionHandle:(id *)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  double Current;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSObject *v20;
  os_log_type_t v21;
  int v23;
  double v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  objc_msgSend(v11, "metricOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "rollReportFrequencyRandomValue");

  v14 = (void *)MEMORY[0x1D8269840]();
  Current = CFAbsoluteTimeGetCurrent();
  -[C2RequestManager sessionPool](self, "sessionPool");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "createDataTaskWithRequestIdentifer:request:options:delegate:sessionHandle:", v17, v10, v11, v12, a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = CFAbsoluteTimeGetCurrent() - Current;
  if (C2_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_12_1);
  v20 = C2_DEFAULT_LOG_INTERNAL_6;
  if (v19 <= 1.0)
    v21 = OS_LOG_TYPE_INFO;
  else
    v21 = OS_LOG_TYPE_ERROR;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, v21))
  {
    v23 = 134218498;
    v24 = v19;
    v25 = 2112;
    v26 = v10;
    v27 = 2112;
    v28 = v18;
    _os_log_impl(&dword_1D4DC3000, v20, v21, "Creation of data task took %.3f seconds for request %@ resulting in task %@.", (uint8_t *)&v23, 0x20u);
  }
  objc_autoreleasePoolPop(v14);

  return v18;
}

- (C2SessionPool)sessionPool
{
  return self->_sessionPool;
}

+ (void)initialize
{
  C2RequestManager *v4;
  void *v5;
  id v6;

  if (!sharedManager)
  {
    v4 = objc_alloc_init(C2RequestManager);
    v5 = (void *)sharedManager;
    sharedManager = (uint64_t)v4;

    if (!sharedManager)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("C2RequestManager.m"), 16, CFSTR("Failed to alloc/init C2RequestManager, crash."));

    }
  }
}

- (C2RequestManager)init
{
  C2RequestManager *v2;
  C2SessionPool *v3;
  C2SessionPool *sessionPool;
  NSObject *v5;
  NSObject *v6;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)C2RequestManager;
  v2 = -[C2RequestManager init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(C2SessionPool);
    sessionPool = v2->_sessionPool;
    v2->_sessionPool = v3;

    if (v2->_sessionPool)
      return v2;
    if (C2_DEFAULT_LOG_BLOCK_6 != -1)
      dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_12);
    v5 = C2_DEFAULT_LOG_INTERNAL_6;
    if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1D4DC3000, v5, OS_LOG_TYPE_ERROR, "failed to create C2SessionPool for C2RequestManager", v8, 2u);
    }
  }
  if (C2_DEFAULT_LOG_BLOCK_6 != -1)
    dispatch_once(&C2_DEFAULT_LOG_BLOCK_6, &__block_literal_global_11);
  v6 = C2_DEFAULT_LOG_INTERNAL_6;
  if (os_log_type_enabled((os_log_t)C2_DEFAULT_LOG_INTERNAL_6, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1D4DC3000, v6, OS_LOG_TYPE_ERROR, "failed to create C2RequestManager", v8, 2u);
  }

  return 0;
}

void __24__C2RequestManager_init__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_6;
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

void __24__C2RequestManager_init__block_invoke_10()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_6;
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

- (id)createDataTaskWithRequest:(id)a3 options:(id)a4 delegate:(id)a5
{
  return -[C2RequestManager createDataTaskWithRequest:options:delegate:sessionHandle:](self, "createDataTaskWithRequest:options:delegate:sessionHandle:", a3, a4, a5, 0);
}

void __77__C2RequestManager_createDataTaskWithRequest_options_delegate_sessionHandle___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.c2", "default");
  v1 = (void *)C2_DEFAULT_LOG_INTERNAL_6;
  C2_DEFAULT_LOG_INTERNAL_6 = (uint64_t)v0;

}

- (id)testUtility_sessionForTask:(id)a3
{
  id v4;

  v4 = 0;
  -[C2RequestManager _testUtility_forTask:sessionHandle:taskHandle:](self, "_testUtility_forTask:sessionHandle:taskHandle:", a3, &v4, 0);
  return v4;
}

- (id)testUtility_sessionTaskForTask:(id)a3
{
  id v4;

  v4 = 0;
  -[C2RequestManager _testUtility_forTask:sessionHandle:taskHandle:](self, "_testUtility_forTask:sessionHandle:taskHandle:", a3, 0, &v4);
  return v4;
}

- (void)_testUtility_forTask:(id)a3 sessionHandle:(id *)a4 taskHandle:(id *)a5
{
  void *v7;
  C2RequestManager *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  C2RequestManager *v25;
  C2SessionPool *v26;
  id obj;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v33 = a3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v33, "taskIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("C2RequestManager.m"), 84, CFSTR("Task identifier should always be set."));

  }
  v8 = self;
  objc_sync_enter(v8);
  v26 = v8->_sessionPool;
  objc_sync_enter(v26);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v25 = v8;
  -[C2SessionPool sessionGroupForSessionConfigurationName](v8->_sessionPool, "sessionGroupForSessionConfigurationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  obj = v10;
  if (v11)
  {
    v12 = 0;
    v30 = *(_QWORD *)v39;
    v31 = v11;
    do
    {
      for (i = 0; i != v31; ++i)
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        objc_msgSend(v13, "sessions");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v35;
LABEL_10:
          v17 = 0;
          v18 = v12;
          while (1)
          {
            if (*(_QWORD *)v35 != v16)
              objc_enumerationMutation(v14);
            v19 = *(id *)(*((_QWORD *)&v34 + 1) + 8 * v17);
            objc_sync_enter(v19);
            objc_msgSend(v19, "wrappedTaskByTaskIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKeyedSubscript:", v7);
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12)
            {
              objc_msgSend(v12, "taskDescription");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v33, "taskDescription");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = objc_msgSend(v21, "isEqual:", v22);

              if ((v23 & 1) != 0)
                break;
            }
            objc_sync_exit(v19);

            ++v17;
            v18 = v12;
            if (v15 == v17)
            {
              v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
              if (v15)
                goto LABEL_10;
              goto LABEL_17;
            }
          }
          objc_sync_exit(v19);

          if (v19)
            goto LABEL_23;
        }
        else
        {
LABEL_17:

        }
      }
      v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v31);
    v19 = 0;
  }
  else
  {
    v19 = 0;
    v12 = 0;
  }
LABEL_23:

  objc_sync_exit(v26);
  objc_sync_exit(v25);

  if (a4)
    *a4 = objc_retainAutorelease(v19);
  if (a5)
    *a5 = objc_retainAutorelease(v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionPool, 0);
}

@end
