@implementation NSCFLocalDownloadTask

void __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_2(uint64_t a1)
{
  -[__NSCFLocalDownloadTask _private_completionAfterMetrics](*(_QWORD **)(a1 + 32));
}

void __37____NSCFLocalDownloadTask_checkWrite__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = (void *)MEMORY[0x186DB8C8C]();
  if (!objc_msgSend(*(id *)(a1 + 32), "error"))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "downloadFile");
    if (v3)
    {
      if (*(_DWORD *)(v3 + 188))
      {
        v4 = *(void **)(a1 + 32);
        v5 = objc_msgSend(v4, "downloadFile");
        if (v5)
        {
          v6 = *(int *)(v5 + 188);
          if (v4)
          {
LABEL_6:
            v7 = objc_msgSend(v4, "error:code:", *MEMORY[0x1E0CB2FE0], v6);
LABEL_7:
            objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
            goto LABEL_8;
          }
        }
        else
        {
          v6 = 0;
          if (v4)
            goto LABEL_6;
        }
        v7 = 0;
        goto LABEL_7;
      }
    }
  }
LABEL_8:
  -[__NSCFLocalDownloadTask _private_fileCompletion](*(_BYTE **)(a1 + 32));
  objc_autoreleasePoolPop(v2);
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_6(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setDownloadFile:", 0);
  return -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(*(id *)(a1 + 32), "session"), *(_QWORD **)(a1 + 32), (void *)objc_msgSend(*(id *)(a1 + 32), "error"));
}

void __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_48(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = v2[88];
    if (!v3)
      v3 = v2[87];
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50____NSCFLocalDownloadTask__private_fileCompletion__block_invoke_2;
  v5[3] = &unk_1E14FE118;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper task:didFinishCollectingMetrics:completionHandler:](v3, v2, v4, v5);
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_release(*(const void **)(a1 + 40));
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_2(uint64_t a1)
{
  const char *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 32), "response"), objc_msgSend(*(id *)(a1 + 32), "error"));
  _Block_release(*(const void **)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  -[NSURLSessionTask _resetTaskDelegate](*(_QWORD *)(a1 + 32), v2);
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_3(uint64_t a1)
{
  const char *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "response"), objc_msgSend(*(id *)(a1 + 32), "error"));
  _Block_release(*(const void **)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "setState:", 3);
  -[NSURLSessionTask _resetTaskDelegate](*(_QWORD *)(a1 + 32), v2);
}

uint64_t __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_4(uint64_t a1)
{
  return -[NSURLSession _onqueue_didCompleteTask:withError:](objc_msgSend(*(id *)(a1 + 32), "session"), *(_QWORD **)(a1 + 32), (void *)objc_msgSend(*(id *)(a1 + 32), "error"));
}

void __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_5(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];

  v2 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    v3 = v2[88];
    if (!v3)
      v3 = v2[87];
  }
  else
  {
    v3 = 0;
  }
  v4 = *(void **)(a1 + 40);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58____NSCFLocalDownloadTask__private_completionAfterMetrics__block_invoke_6;
  v5[3] = &unk_1E14FE118;
  v5[4] = v2;
  -[__NSCFURLSessionDelegateWrapper downloadTask:didFinishDownloadingToURL:completionHandler:](v3, v2, v4, v5);
}

void __42____NSCFLocalDownloadTask_reportProgress___block_invoke(uint64_t a1, const char *a2)
{
  void *v3;
  const char *v4;
  _QWORD *v5;
  const char *v6;
  void (**Property)(id);
  void *v8;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1029) = 0;
  v3 = *(void **)(a1 + 32);
  if (v3 && objc_getProperty(v3, a2, 1008, 1))
  {
    v5 = *(_QWORD **)(a1 + 32);
    if (v5[125])
    {
      -[__NSCFLocalDownloadTask reportProgress:](v5);
    }
    else
    {
      Property = (void (**)(id))objc_getProperty(v5, v4, 1008, 1);
      v8 = *(void **)(a1 + 32);
      if (v8)
        objc_setProperty_atomic_copy(v8, v6, 0, 1008);
      if (Property)
        Property[2](Property);
    }
  }
}

void __63____NSCFLocalDownloadTask__private_errorCompletionAfterMetrics__block_invoke(uint64_t a1)
{
  const char *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0, objc_msgSend(*(id *)(a1 + 32), "response"), objc_msgSend(*(id *)(a1 + 32), "error"));
  _Block_release(*(const void **)(a1 + 40));
  -[NSURLSessionTask _resetTaskDelegate](*(_QWORD *)(a1 + 32), v2);
}

intptr_t __43____NSCFLocalDownloadTask_suspendExtractor__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v5 = CFNLog::logger;
  if (a3)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = v7;
      v11 = 2112;
      v12 = a3;
      v13 = 2048;
      v14 = objc_msgSend(a3, "code");
      _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "StreamingZip Error: suspending extractor for task: %@, error: %@ [%ld]", (uint8_t *)&v9, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a3);
  }
  else if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = 138412290;
    v10 = v8;
    _os_log_debug_impl(&dword_183ECA000, v5, OS_LOG_TYPE_DEBUG, "StreamingZip Suspending extractor for task: %@", (uint8_t *)&v9, 0xCu);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __41____NSCFLocalDownloadTask_writeAndResume__block_invoke(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSObject *global_queue;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  int v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x186DB8C8C]();
  if (a2)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(*(id *)(a1 + 32), "_loggableDescription");
      v11 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "downloadFile"), "path");
      *(_DWORD *)buf = 138543874;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      v18 = 1024;
      v19 = a2;
      _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "%{public}@ : file write to %@ failed with posix error %d", buf, 0x1Cu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1028) = 1;
    v6 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v6 + 1030))
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __41____NSCFLocalDownloadTask_writeAndResume__block_invoke_37;
      v12[3] = &unk_1E14FDF30;
      v12[4] = v6;
      v13 = a2;
      dispatch_async(global_queue, v12);
      goto LABEL_14;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "error"))
    {
      v7 = *(void **)(a1 + 32);
      if (v7)
      {
        v8 = objc_msgSend(v7, "error:code:", *MEMORY[0x1E0CB2FE0], a2);
        v7 = *(void **)(a1 + 32);
      }
      else
      {
        v8 = 0;
      }
      objc_msgSend(v7, "setError:", v8);
    }
  }
  else
  {
    -[__NSCFLocalDownloadTask reportProgress:](*(_QWORD **)(a1 + 32), *(const char **)(a1 + 40));
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1028) = 1;
  }
  -[__NSCFLocalDownloadTask checkWrite](*(id *)(a1 + 32));
LABEL_14:
  objc_autoreleasePoolPop(v4);
}

uint64_t __41____NSCFLocalDownloadTask_writeAndResume__block_invoke_37(uint64_t a1)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(a1 + 32);
  if (v1)
    v2 = objc_msgSend(*(id *)(a1 + 32), "error:code:", *MEMORY[0x1E0CB2FE0], *(int *)(a1 + 40));
  else
    v2 = 0;
  return objc_msgSend(v1, "cancel_with_error:", v2);
}

void *__82____NSCFLocalDownloadTask__task_onqueue_didReceiveDispatchData_completionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = a3;
      v15 = 2048;
      v16 = objc_msgSend(a3, "code");
      _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "StreamingZip Error - failed in call to prepareForExtractionToPath for task %@.  Error=%@ [%ld]", (uint8_t *)&v11, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a3);
    return (void *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "set_extractorPreparedForExtraction:", 1);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v7 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      v9 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      v10 = *(void **)(a1 + 32);
      v11 = 138412546;
      v12 = v9;
      v13 = 2112;
      v14 = v10;
      _os_log_debug_impl(&dword_183ECA000, v7, OS_LOG_TYPE_DEBUG, "StreamingZip Debug - prepared to extract to %@ for task %@", (uint8_t *)&v11, 0x16u);
    }
    return -[__NSCFLocalDownloadTask _supplyExtractorWithData:completion:](*(void **)(a1 + 32), *(NSObject **)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
}

uint64_t __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke(uint64_t a1, void *a2, int a3)
{
  NSObject *v5;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  __int128 v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v10 = objc_msgSend(a2, "code");
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v16 = a2;
      v17 = 2048;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "StreamingZip Error supplying bytes to extractor: %@ [%ld] for task %@", buf, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a2);
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  -[__NSCFLocalDownloadTask reportProgress:](*(_QWORD **)(a1 + 32), *(const char **)(a1 + 48));
  if (!a3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v8 = CFNLog::logger;
  if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    v12 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v12;
    _os_log_debug_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEBUG, "StreamingZip - decode completed OK for task %@.", buf, 0xCu);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "_extractorFinishedDecoding") & 1) != 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v9 = (void *)objc_msgSend(*(id *)(a1 + 32), "_extractor");
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke_55;
  v13[3] = &unk_1E14FBDD0;
  v14 = *(_OWORD *)(a1 + 32);
  return objc_msgSend(v9, "finishStreamWithCompletionBlock:", v13);
}

uint64_t __63____NSCFLocalDownloadTask__supplyExtractorWithData_completion___block_invoke_55(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(a2, "code");
      v7 = *(_QWORD *)(a1 + 32);
      v9 = 138412802;
      v10 = a2;
      v11 = 2048;
      v12 = v6;
      v13 = 2112;
      v14 = v7;
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "StreamingZip Error finishing extractor stream decoding: %@ [%ld] for task %@", (uint8_t *)&v9, 0x20u);
    }
    objc_msgSend(*(id *)(a1 + 32), "cancel_with_error:", a2);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      v8 = *(void **)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_debug_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEBUG, "StreamingZip finishing extractor stream OK for task %@.", (uint8_t *)&v9, 0xCu);
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1032) = 1;
  }
  objc_msgSend(*(id *)(a1 + 32), "set_extractorFinishedDecoding:", 1);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __66____NSCFLocalDownloadTask_terminateExtractorWithError_completion___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (CFNLog::onceToken != -1)
    dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
  v4 = CFNLog::logger;
  if (a2)
  {
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 138412802;
      v8 = v5;
      v9 = 2112;
      v10 = a2;
      v11 = 2048;
      v12 = objc_msgSend(a2, "code");
      _os_log_error_impl(&dword_183ECA000, v4, OS_LOG_TYPE_ERROR, "StreamingZip Error: terminating extractor for task: %@, error: %@ [%ld]", (uint8_t *)&v7, 0x20u);
    }
  }
  else if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412290;
    v8 = v6;
    _os_log_debug_impl(&dword_183ECA000, v4, OS_LOG_TYPE_DEBUG, "StreamingZip Terminated extractor for task: %@", (uint8_t *)&v7, 0xCu);
  }
}

uint64_t __55____NSCFLocalDownloadTask_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onqueue_cancelByProducingResumeData:", *(_QWORD *)(a1 + 40));
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __64____NSCFLocalDownloadTask__onqueue_cancelByProducingResumeData___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

intptr_t __48____NSCFLocalDownloadTask_openItemForPath_mode___block_invoke(uint64_t a1, int a2)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __62____NSCFLocalDownloadTask_initWithTaskGroup_resumeData_ident___block_invoke(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  uint64_t v6;
  NSObject *v8;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v5 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_ERROR))
    {
      v6 = objc_msgSend(*(id *)(a1 + 40), "_loggableDescription");
      *(_DWORD *)buf = 138543874;
      v12 = v6;
      v13 = 2112;
      v14 = a3;
      v15 = 2048;
      v16 = objc_msgSend(a3, "code");
      _os_log_error_impl(&dword_183ECA000, v5, OS_LOG_TYPE_ERROR, "%{public}@ StreamingZip Error - init with resumeData failed calling prepareForExtraction. error=%@ [%ld]", buf, 0x20u);
    }
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-"), a2), 0x1EDCFD4A0);
    if (CFNLog::onceToken != -1)
      dispatch_once(&CFNLog::onceToken, &__block_literal_global_1_4755);
    v8 = CFNLog::logger;
    if (os_log_type_enabled((os_log_t)CFNLog::logger, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(*(id *)(a1 + 40), "_loggableDescription");
      *(_DWORD *)buf = 138543618;
      v12 = v10;
      v13 = 2048;
      v14 = a2;
      _os_log_debug_impl(&dword_183ECA000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ StreamingZip Debug - init with resumeData OK.  Resume offset is %lld.", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "set_extractorPreparedForExtraction:", 1);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
}

@end
