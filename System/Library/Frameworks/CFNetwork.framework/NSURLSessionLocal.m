@implementation NSURLSessionLocal

uint64_t __66____NSURLSessionLocal__getCookieHeadersForTask_completionHandler___block_invoke(uint64_t a1, const __CFDictionary *a2)
{
  if (nw_settings_get_signposts_enabled())
  {
    if (a2)
      CFDictionaryGetCount(a2);
    kdebug_trace();
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __40____NSURLSessionLocal_taskForClassInfo___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  if (a5)
  {
    v8 = 16 * (objc_msgSend(a5, "code") != -999);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(void **)(v9 + 112);
    else
      v10 = 0;
    v11 = objc_msgSend(v10, "_loggingPrivacyLevel");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v12 = CFNLog::logger;
    v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        v22 = objc_msgSend(a2, "_loggableDescription");
        v23 = 2048;
        v24 = objc_msgSend(a5, "code");
        v25 = 2117;
        v26 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_17;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      v22 = objc_msgSend(a2, "_loggableDescription");
      v23 = 2048;
      v24 = objc_msgSend(a5, "code");
      v25 = 2112;
      v26 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_17:
      v16 = v12;
      v17 = v8;
      v18 = 32;
      goto LABEL_18;
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = objc_msgSend(a2, "_loggableDescription");
      v14 = "%{public}@ finished successfully";
      v16 = v15;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 12;
LABEL_18:
      _os_log_impl(&dword_183ECA000, v16, v17, v14, buf, v18);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  v19 = objc_msgSend(a2, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40____NSURLSessionLocal_taskForClassInfo___block_invoke_110;
  block[3] = &unk_1E14FE118;
  block[4] = a2;
  dispatch_async(v19, block);
}

void __40____NSURLSessionLocal_taskForClassInfo___block_invoke_3(uint64_t a1, _QWORD *a2, int a3)
{
  void *v5;
  void *v6;

  if (a3)
  {
    v5 = (void *)objc_msgSend(a2, "_onqueue_strippedMutableRequest");
    v6 = v5;
    if (*(_QWORD *)(a1 + 32))
    {
      if (!objc_msgSend(v5, "valueForHTTPHeaderField:", 0x1EDCFCEF0))
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", 0x1EDCFF8F0, 0x1EDCFCEF0);
    }
    -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](*(_QWORD *)(a1 + 40), a2, v6, *(_QWORD *)(a1 + 48), *(const __CFArray **)(a1 + 56));
  }
}

void __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_2(uint64_t a1, _QWORD *a2, int a3)
{
  if (a3)
    -[__NSURLSessionLocal _onqueue_canonicalizeTaskAndCreateConnection:](*(_QWORD *)(a1 + 32), a2);
}

void __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_3(uint64_t a1, _QWORD *a2, int a3)
{
  void *v5;
  void *v6;

  if (a3)
  {
    v5 = (void *)objc_msgSend(a2, "_onqueue_strippedMutableRequest");
    v6 = v5;
    if (*(_QWORD *)(a1 + 32))
    {
      if (!objc_msgSend(v5, "valueForHTTPHeaderField:", 0x1EDCFCEF0))
        objc_msgSend(v6, "setValue:forHTTPHeaderField:", 0x1EDCFF8F0, 0x1EDCFCEF0);
    }
    -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](*(_QWORD *)(a1 + 40), a2, v6, *(_QWORD *)(a1 + 48), *(const __CFArray **)(a1 + 56));
  }
}

void __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  _BOOL4 v13;
  const char *v14;
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint32_t v18;
  NSObject *v19;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  if (a5)
  {
    v8 = 16 * (objc_msgSend(a5, "code") != -999);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(void **)(v9 + 112);
    else
      v10 = 0;
    v11 = objc_msgSend(v10, "_loggingPrivacyLevel");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v12 = CFNLog::logger;
    v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        v22 = objc_msgSend(a2, "_loggableDescription");
        v23 = 2048;
        v24 = objc_msgSend(a5, "code");
        v25 = 2117;
        v26 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_17;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      v22 = objc_msgSend(a2, "_loggableDescription");
      v23 = 2048;
      v24 = objc_msgSend(a5, "code");
      v25 = 2112;
      v26 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_17:
      v16 = v12;
      v17 = v8;
      v18 = 32;
      goto LABEL_18;
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = objc_msgSend(a2, "_loggableDescription");
      v14 = "%{public}@ finished successfully";
      v16 = v15;
      v17 = OS_LOG_TYPE_DEFAULT;
      v18 = 12;
LABEL_18:
      _os_log_impl(&dword_183ECA000, v16, v17, v14, buf, v18);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  v19 = objc_msgSend(a2, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_139;
  block[3] = &unk_1E14FE118;
  block[4] = a2;
  dispatch_async(v19, block);
}

void __56____NSURLSessionLocal__onqueue_invokeInvalidateCallback__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
}

void __53____NSURLSessionLocal__onqueue_completeInvalidation___block_invoke(uint64_t a1, int a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (a2)
    -[NSURLSession finalizeDelegateWithError:](v2);
  else
    NSLog(CFSTR("Already had something invalidating %@"), v2);
}

void __66____NSURLSessionLocal__onqueue_configureAndCreateConnection_task___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "addObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 400));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 184), "removeObject:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 400));
  if (objc_msgSend(*(id *)(a1 + 40), "state") <= 1)
  {
    v2 = objc_alloc(*(Class *)(a1 + 48));
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
      v4 = *(_QWORD *)(v3 + 120);
    else
      v4 = 0;
    v5 = objc_msgSend(v2, "initWithTask:delegate:delegateQueue:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 40), v4);
    if (v5)
    {
      v6 = (id)v5;
      -[__NSCFLocalSessionTask setConnection:](*(_QWORD **)(a1 + 40), v5);

    }
  }
}

void __43____NSURLSessionLocal_removeUnresumedTask___block_invoke(uint64_t a1)
{
  -[__NSURLSessionLocal _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

void __49____NSURLSessionLocal_task_terminatedConnection___block_invoke(uint64_t a1)
{
  -[__NSURLSessionLocal _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

uint64_t __68____NSURLSessionLocal__onqueue_canonicalizeTaskAndCreateConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return -[__NSURLSessionLocal _onqueue_configureAndCreateConnection:task:](*(_QWORD *)(a1 + 32), a2, *(void **)(a1 + 40));
  else
    return objc_msgSend(*(id *)(a1 + 40), "_onqueue_cancel");
}

void __62____NSURLSessionLocal__onqueue_getTasksWithCompletionHandler___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40));
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 40) + 48))(*(_QWORD *)(a1 + 40));
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _QWORD v6[5];

  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v4 = *(unsigned __int8 *)(a1 + 40);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_4;
  v6[3] = &unk_1E14FE118;
  v6[4] = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD *))(*(_QWORD *)a2 + 48))(a2, v4, v6);
}

uint64_t __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __50____NSURLSessionLocal__flushOrResetStorage_reset___block_invoke_4(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  os_log_type_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dyld_program_sdk_at_least())
    a5 = (void *)+[NSURLSession _errorFromError:forTask:]((uint64_t)NSURLSession, a5, a2);
  if (a5)
  {
    v8 = 16 * (objc_msgSend(a5, "code") != -999);
    v9 = *(_QWORD *)(a1 + 32);
    if (v9)
      v10 = *(void **)(v9 + 112);
    else
      v10 = 0;
    v11 = objc_msgSend(v10, "_loggingPrivacyLevel");
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v12 = CFNLog::logger;
    v13 = os_log_type_enabled((os_log_t)CFNLog::logger, v8);
    if (v11 > 2)
    {
      if (v13)
      {
        *(_DWORD *)buf = 138543875;
        v19 = objc_msgSend(a2, "_loggableDescription");
        v20 = 2048;
        v21 = objc_msgSend(a5, "code");
        v22 = 2117;
        v23 = a5;
        v14 = "%{public}@ finished with error [%ld] %{sensitive}@";
        goto LABEL_18;
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138543874;
      v19 = objc_msgSend(a2, "_loggableDescription");
      v20 = 2048;
      v21 = objc_msgSend(a5, "code");
      v22 = 2112;
      v23 = a5;
      v14 = "%{public}@ finished with error [%ld] %@";
LABEL_18:
      _os_log_impl(&dword_183ECA000, v12, v8, v14, buf, 0x20u);
    }
  }
  else
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v15 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v19 = objc_msgSend(a2, "_loggableDescription");
      _os_log_impl(&dword_183ECA000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ finished successfully", buf, 0xCu);
    }
    +[__NSURLSessionStatistics reportMetricsToSymptoms:](__NSURLSessionStatistics, "reportMetricsToSymptoms:", a2);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
  v16 = objc_msgSend(a2, "workQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_146;
  block[3] = &unk_1E14FE118;
  block[4] = a2;
  dispatch_async(v16, block);
}

id __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_3(uint64_t a1, const char *a2)
{
  id result;

  result = *(id *)(a1 + 32);
  if (result)
  {
    result = objc_getProperty(result, a2, 808, 1);
    if (result)
      return (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInitialization");
  }
  return result;
}

uint64_t __53____NSURLSessionLocal__downloadTaskWithTaskForClass___block_invoke_146(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

uint64_t __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

id __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_4(uint64_t a1, const char *a2)
{
  id result;

  result = *(id *)(a1 + 32);
  if (result)
  {
    result = objc_getProperty(result, a2, 808, 1);
    if (result)
      return (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInitialization");
  }
  return result;
}

uint64_t __87____NSURLSessionLocal__onqueue_connectUploadTask_strippedRequest_bodyStream_bodyParts___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
    return -[__NSURLSessionLocal _onqueue_connectUploadTask:strippedRequest:bodyStream:bodyParts:](*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), a2, 0);
  else
    return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __51____NSURLSessionLocal__uploadTaskWithTaskForClass___block_invoke_139(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

uint64_t __40____NSURLSessionLocal_taskForClassInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

id __40____NSURLSessionLocal_taskForClassInfo___block_invoke_4(uint64_t a1, const char *a2)
{
  id result;

  result = *(id *)(a1 + 32);
  if (result)
  {
    result = objc_getProperty(result, a2, 808, 1);
    if (result)
      return (id)objc_msgSend(*(id *)(a1 + 32), "_onqueue_completeInitialization");
  }
  return result;
}

uint64_t __40____NSURLSessionLocal_taskForClassInfo___block_invoke_110(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onSessionQueue_disavow");
}

void __48____NSURLSessionLocal_removeConnectionlessTask___block_invoke(uint64_t a1)
{
  -[__NSURLSessionLocal _onqueue_checkForCompletion](*(_QWORD *)(a1 + 32));
}

@end
