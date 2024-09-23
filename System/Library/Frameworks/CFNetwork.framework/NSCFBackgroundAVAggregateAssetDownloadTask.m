@implementation NSCFBackgroundAVAggregateAssetDownloadTask

__n128 __140____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_didLoadTimeRange_totalTimeRangesLoaded_timeRangeExpectedToLoad___block_invoke(uint64_t a1)
{
  void *v1;
  id Property;
  uint64_t v3;
  __n128 result;
  const char *v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __n128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19[3];
  __int128 v20[3];

  v1 = *(void **)(a1 + 32);
  Property = *(id *)(a1 + 40);
  v13 = *(_OWORD *)(a1 + 56);
  v15 = *(_OWORD *)(a1 + 72);
  v17 = *(_OWORD *)(a1 + 88);
  v3 = *(_QWORD *)(a1 + 48);
  v7 = *(_OWORD *)(a1 + 104);
  v9 = *(_OWORD *)(a1 + 120);
  result = *(__n128 *)(a1 + 136);
  v11 = result;
  if (v1 && objc_msgSend(v1, "state") <= 1 && objc_msgSend(v1, "session") && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (Property)
      Property = objc_getProperty(Property, v5, 880, 1);
    v6 = objc_msgSend(v1, "session", v7, v9, *(_OWORD *)&v11, v13, v15, v17);
    v20[0] = v14;
    v20[1] = v16;
    v20[2] = v18;
    v19[0] = v8;
    v19[1] = v10;
    v19[2] = v12;
    -[NSURLSession delegate_AVAggregateAssetDownloadTask:didLoadTimeRange:totalTimeRangesLoaded:timeRangeExpectedToLoad:forMediaSelection:](v6, (uint64_t)v1, v20, v3, v19, (uint64_t)Property);
  }
  return result;
}

void __95____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_assetDownloadTask_willDownloadToURL___block_invoke(uint64_t a1)
{
  _BYTE *v1;
  uint64_t v2;

  v1 = *(_BYTE **)(a1 + 32);
  if (v1)
  {
    v2 = *(_QWORD *)(a1 + 48);
    if (objc_msgSend(*(id *)(a1 + 32), "state") <= 1 && !v1[790])
    {
      v1[790] = 1;
      if (objc_msgSend(v1, "session"))
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          -[NSURLSession delegate_AVAggregateAssetDownloadTask:willDownloadToURL:](objc_msgSend(v1, "session"), (uint64_t)v1, v2);
      }
    }
  }
}

void __106____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_willBeginDelayedRequest_completionHandler___block_invoke(_QWORD *a1, const char *a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[6];

  v2 = a1[4];
  if (v2)
  {
    v3 = (void *)a1[6];
    v4 = a1[7];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __109____NSCFBackgroundAVAggregateAssetDownloadTask__onqueue_childTask_willBeginDelayedRequest_completionHandler___block_invoke;
    v7[3] = &unk_1E14F9AA0;
    v7[4] = v2;
    v7[5] = v4;
    if (*(_BYTE *)(v2 + 791))
      goto LABEL_10;
    *(_BYTE *)(v2 + 791) = 1;
    v5 = *(_QWORD *)(v2 + 704);
    if (!v5)
      v5 = *(_QWORD *)(v2 + 696);
    if (!-[__NSCFURLSessionDelegateWrapper willBeginDelayedRequest](v5, a2))
    {
LABEL_10:
      (*(void (**)(uint64_t, _QWORD, _QWORD))(v4 + 16))(v4, 0, 0);
    }
    else
    {
      v6 = *(_QWORD *)(v2 + 704);
      if (!v6)
        v6 = *(_QWORD *)(v2 + 696);
      -[__NSCFURLSessionDelegateWrapper task:willBeginDelayedRequest:completionHandler:](v6, (void *)v2, v3, v7);
    }
  }
}

uint64_t __109____NSCFBackgroundAVAggregateAssetDownloadTask__onqueue_childTask_willBeginDelayedRequest_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t (*v3)(void);

  v3 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  if (!a2)
    return v3();
  v3();
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

uint64_t __85____NSCFBackgroundAVAggregateAssetDownloadTask_URLSession_task_didCompleteWithError___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  id Property;
  const char *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 32);
  if (v1)
  {
    Property = *(id *)(result + 40);
    v2 = *(_QWORD *)(result + 48);
    result = objc_msgSend(*(id *)(result + 32), "state");
    if (result <= 1)
    {
      if (objc_msgSend((id)v1, "session") && (objc_opt_respondsToSelector() & 1) != 0)
      {
        if (Property)
          Property = objc_getProperty(Property, v4, 880, 1);
        -[NSURLSession delegate_AVAggregateAssetDownloadTask:didCompleteForMediaSelection:](objc_msgSend((id)v1, "session"), v1, (uint64_t)Property);
      }
      if (v2)
      {
        objc_msgSend(*(id *)(v1 + 848), "invalidateAndCancel");
LABEL_10:
        objc_msgSend(*(id *)(v1 + 848), "finishTasksAndInvalidate");
        v10.receiver = (id)v1;
        v10.super_class = (Class)__NSCFBackgroundAVAggregateAssetDownloadTask;
        objc_msgSendSuper2(&v10, sel__onqueue_didFinishWithError_, v2);
        return objc_msgSend((id)-[__NSURLBackgroundSession ensureRemoteSession](objc_msgSend((id)v1, "session")), "cancelTaskWithIdentifier:", objc_msgSend((id)v1, "taskIdentifier"));
      }
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v5 = *(void **)(v1 + 856);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (!v6)
        goto LABEL_10;
      v7 = v6;
      v8 = *(_QWORD *)v12;
LABEL_14:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        result = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v9), "state");
        if (result < 3)
          break;
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
          if (v7)
            goto LABEL_14;
          goto LABEL_10;
        }
      }
    }
  }
  return result;
}

void __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    v3 = *(_QWORD *)(v2 + 840);
  else
    v3 = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 848) = +[AVAssetDownloadURLSession sessionWithConfiguration:assetDownloadDelegate:delegateQueue:](AVAssetDownloadURLSession, "sessionWithConfiguration:assetDownloadDelegate:delegateQueue:", +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:](NSURLSessionConfiguration, "backgroundSessionConfigurationWithIdentifier:", v3), *(_QWORD *)(a1 + 32), 0);
  v4 = dispatch_semaphore_create(0);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__6654;
  v11 = __Block_byref_object_dispose__6655;
  v12 = 0;
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 848);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke_2;
  v6[3] = &unk_1E14FB1A8;
  v6[4] = v4;
  v6[5] = &v7;
  objc_msgSend(v5, "getAllTasksWithCompletionHandler:", v6);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_release(v4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 856) = v8[5];
  _Block_object_dispose(&v7, 8);
}

intptr_t __81____NSCFBackgroundAVAggregateAssetDownloadTask_initWithTaskInfo_taskGroup_ident___block_invoke_2(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(a2, "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
