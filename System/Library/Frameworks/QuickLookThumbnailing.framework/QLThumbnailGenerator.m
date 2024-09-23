@implementation QLThumbnailGenerator

- (id)_requestWithUUID:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__QLThumbnailGenerator__requestWithUUID___block_invoke;
  block[3] = &unk_1E5D7C2D0;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *serialResponseQueue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  serialResponseQueue = self->_serialResponseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__QLThumbnailGenerator__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded_thumbnail_type_error___block_invoke;
  block[3] = &unk_1E5D7C390;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(serialResponseQueue, block);

}

- (BOOL)_finishRequestIfNeeded:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);
  void *v11;
  QLThumbnailGenerator *v12;
  id v13;

  v4 = a3;
  queue = self->_queue;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __47__QLThumbnailGenerator__finishRequestIfNeeded___block_invoke;
  v11 = &unk_1E5D7C118;
  v12 = self;
  v13 = v4;
  v6 = v4;
  dispatch_sync(queue, &v8);
  LOBYTE(queue) = objc_msgSend(v6, "isFinished", v8, v9, v10, v11, v12);

  return (char)queue;
}

uint64_t __50__QLThumbnailGenerator___finishRequest_withError___block_invoke(uint64_t a1)
{
  uint64_t v2;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "_callUpdateBlockOfRequestIfRunning:andUpdateMostRepresentativeThumbnail:type:error:", *(_QWORD *)(a1 + 48), 0, objc_msgSend(*(id *)(a1 + 48), "requestedMostRepresentativeType"), *(_QWORD *)(a1 + 32));
    v2 = *(_QWORD *)(a1 + 32);
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "__callCompletionBlockOfRequest:withError:", *(_QWORD *)(a1 + 48), v2);
  return objc_msgSend(*(id *)(a1 + 40), "_logRequestDuration:", *(_QWORD *)(a1 + 48));
}

- (void)_logRequestDuration:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "beginDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceNow");
  v6 = v5;

  v7 = qltLogHandles;
  if (!qltLogHandles)
  {
    QLTInitLogging();
    v7 = qltLogHandles;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = v7;
    objc_msgSend(v3, "mostRepresentativeThumbnail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 134218498;
    v11 = -v6;
    v12 = 2112;
    v13 = v3;
    v14 = 2112;
    v15 = v9;
    _os_log_impl(&dword_1AE3F5000, v8, OS_LOG_TYPE_INFO, "Thumbnail generation duration of %.3f for %@. Most representative thumbnail generated: %@", (uint8_t *)&v10, 0x20u);

  }
}

- (void)__callCompletionBlockOfRequest:(id)a3 withError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  __CFString *v12;
  void (**v13)(_QWORD, _QWORD, _QWORD);
  void *v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "completionBlock");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = v6;
    objc_msgSend(v5, "mostRepresentativeThumbnail");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {

      v8 = 0;
    }
    v10 = (void *)qltLogHandles;
    if (!qltLogHandles)
    {
      QLTInitLogging();
      v10 = (void *)qltLogHandles;
    }
    v11 = v10;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("with error: %@"), v8);
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = CFSTR("without error.");
      }
      *(_DWORD *)buf = 138412546;
      v16 = v5;
      v17 = 2112;
      v18 = v12;
      _os_log_impl(&dword_1AE3F5000, v11, OS_LOG_TYPE_INFO, "Calling request completionBlock for %@ %@", buf, 0x16u);
      if (v8)

    }
    objc_msgSend(v5, "completionBlock");
    v13 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "mostRepresentativeThumbnail");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, id))v13)[2](v13, v14, v8);

    objc_msgSend(v5, "setUpdateBlock:", 0);
    objc_msgSend(v5, "setStatusBlock:", 0);
    objc_msgSend(v5, "setCompletionBlock:", 0);

  }
}

- (void)generateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6
{
  unint64_t v10;
  id v11;
  unint64_t v12;
  void *v13;
  QLThumbnailGenerator *v14;
  NSObject *queue;
  id v16;
  _QWORD block[5];
  id v18;

  v16 = a3;
  v10 = (unint64_t)a4;
  v11 = a5;
  v12 = (unint64_t)a6;
  if (!(v10 | v12))
    -[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:].cold.1();
  v13 = (void *)v12;
  objc_msgSend(v16, "setUpdateBlock:", v10);
  objc_msgSend(v16, "setStatusBlock:", v11);
  objc_msgSend(v16, "setCompletionBlock:", v13);
  v14 = self;
  objc_sync_enter(v14);
  if (-[QLThumbnailGenerator _isBuildingBatch](v14, "_isBuildingBatch"))
  {
    -[QLThumbnailGenerator _queueThumbnailRequest:](v14, "_queueThumbnailRequest:", v16);
  }
  else
  {
    queue = v14->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __98__QLThumbnailGenerator_generateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke;
    block[3] = &unk_1E5D7C118;
    block[4] = v14;
    v18 = v16;
    dispatch_sync(queue, block);

  }
  objc_sync_exit(v14);

}

- (BOOL)_isBuildingBatch
{
  return self->_batchingCount != 0;
}

void __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "isCancelled"))
  {
    objc_msgSend(*(id *)(a1 + 32), "_finishRequestIfNeeded:", v5);
  }
  else if ((objc_msgSend(v5, "prepareForSending") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
    objc_msgSend(*(id *)(a1 + 32), "_finishRequestIfInvalid:", v5);
  }

}

- (void)_queueThumbnailRequest:(id)a3
{
  id v4;

  v4 = a3;
  -[QLThumbnailGenerator _prepareThumbnailRequestForQueueOrSending:synchronous:](self, "_prepareThumbnailRequestForQueueOrSending:synchronous:", v4, 0);
  -[QLThumbnailGenerator _queueThumbnailGenerationForRequestIfNeeded:](self, "_queueThumbnailGenerationForRequestIfNeeded:", v4);

}

- (void)_prepareThumbnailRequestForQueueOrSending:(id)a3 synchronous:(BOOL)a4
{
  _BOOL4 v4;
  id v6;

  v4 = a4;
  v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
    -[QLThumbnailGenerator _createSyncThumbnailServiceProxy](self, "_createSyncThumbnailServiceProxy");
  else
    -[QLThumbnailGenerator _createThumbnailServiceProxy](self, "_createThumbnailServiceProxy");
  objc_msgSend(v6, "markDidBegin");
  if (!-[QLThumbnailGenerator __finishRequestIfInvalid:](self, "__finishRequestIfInvalid:", v6))
    -[QLThumbnailGenerator _queueIconGenerationForRequestIfNeeded:](self, "_queueIconGenerationForRequestIfNeeded:", v6);

}

- (void)_queueIconGenerationForRequestIfNeeded:(id)a3
{
  id v4;
  NSObject *serialResponseQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[QLThumbnailGenerator __finishRequestIfNeeded:](self, "__finishRequestIfNeeded:", v4)
    && objc_msgSend(v4, "provideGenericIcon"))
  {
    serialResponseQueue = self->_serialResponseQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __63__QLThumbnailGenerator__queueIconGenerationForRequestIfNeeded___block_invoke;
    v6[3] = &unk_1E5D7C118;
    v6[4] = self;
    v7 = v4;
    dispatch_async(serialResponseQueue, v6);

  }
}

- (void)_createThumbnailServiceProxy
{
  void *v3;
  QLThumbnailServiceProxy *v4;
  QLThumbnailServiceProxy *thumbnailServiceProxy;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke;
  v6[3] = &unk_1E5D7C3B8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "remoteObjectProxyWithErrorHandler:", v6);
  v4 = (QLThumbnailServiceProxy *)objc_claimAutoreleasedReturnValue();
  thumbnailServiceProxy = self->_thumbnailServiceProxy;
  self->_thumbnailServiceProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)__finishRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *serialResponseQueue;
  id v9;
  void *v10;
  _QWORD block[4];
  id v12;
  QLThumbnailGenerator *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isFinished") & 1) == 0)
  {
    objc_msgSend(v6, "finish");
    serialResponseQueue = self->_serialResponseQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__QLThumbnailGenerator___finishRequest_withError___block_invoke;
    block[3] = &unk_1E5D7C368;
    v12 = v7;
    v13 = self;
    v9 = v6;
    v14 = v9;
    dispatch_async(serialResponseQueue, block);
    objc_msgSend(v9, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerator __removeRequestWithUUID:](self, "__removeRequestWithUUID:", v10);

  }
}

- (BOOL)__finishRequestIfNeeded:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!-[QLThumbnailGenerator __finishRequestIfInvalid:](self, "__finishRequestIfInvalid:", v4)
    && objc_msgSend(v4, "isCancelled"))
  {
    +[QLThumbnailGenerator errorWithCode:request:additionalUserInfo:](QLThumbnailGenerator, "errorWithCode:request:additionalUserInfo:", 5, v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerator __finishRequest:withError:](self, "__finishRequest:withError:", v4, v5);

  }
  v6 = objc_msgSend(v4, "isFinished");

  return v6;
}

- (BOOL)__finishRequestIfInvalid:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "requestIsInvalidError");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v9 = 138412290;
      v10 = v4;
      _os_log_impl(&dword_1AE3F5000, v6, OS_LOG_TYPE_INFO, "Finishing request %@ because it is invalid.", (uint8_t *)&v9, 0xCu);
    }

    objc_msgSend(v4, "requestIsInvalidError");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailGenerator __finishRequest:withError:](self, "__finishRequest:withError:", v4, v7);

  }
  return v5 != 0;
}

- (BOOL)_queueThumbnailGenerationForRequestIfNeeded:(id)a3
{
  id v4;
  BOOL v5;
  NSMutableDictionary *pendingGenerationRequests;
  void *v7;

  v4 = a3;
  if (!-[QLThumbnailGenerator __finishRequestIfNeeded:](self, "__finishRequestIfNeeded:", v4))
  {
    if ((unint64_t)objc_msgSend(v4, "representationTypes") > 1)
    {
      pendingGenerationRequests = self->_pendingGenerationRequests;
      objc_msgSend(v4, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingGenerationRequests, "setObject:forKeyedSubscript:", v4, v7);

      v5 = 1;
      goto LABEL_6;
    }
    -[QLThumbnailGenerator __finishRequestWithoutError:](self, "__finishRequestWithoutError:", v4);
  }
  v5 = 0;
LABEL_6:

  return v5;
}

uint64_t __49__QLThumbnailGenerator__finishRequest_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequest:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __107__QLThumbnailGenerator__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded_thumbnail_type_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
}

id __34__QLThumbnailGenerator_initialize__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0CB2938]))
  {
    objc_msgSend(*(id *)(a1 + 32), "debugDescriptionForErrorCode:", objc_msgSend(v5, "code"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(v5, "userInfo");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB32F0]);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "absoluteString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9
        || (objc_msgSend(v5, "userInfo"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("QLErrorFailingFileNameKey")),
            v9 = (void *)objc_claimAutoreleasedReturnValue(),
            v10,
            v9))
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ for %@"), v6, v9);
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v11 = v6;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (id)errorWithCode:(int64_t)a3 request:(id)a4 additionalUserInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v17;
  void *v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a5;
  v8 = a4;
  objc_msgSend(v8, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "item");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 || (objc_msgSend(v10, "fileURL"), (v9 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    if (v7)
    {
      v11 = (void *)objc_msgSend(v7, "mutableCopy");
      objc_msgSend(v11, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0CB32F0]);
      v12 = (void *)objc_msgSend(v11, "copy");

    }
    else
    {
      v19 = *MEMORY[0x1E0CB32F0];
      v20[0] = v9;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    objc_msgSend(v10, "filename");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      if (v7)
      {
        v13 = (void *)objc_msgSend(v7, "mutableCopy");
        objc_msgSend(v10, "filename");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v14, CFSTR("QLErrorFailingFileNameKey"));

        v12 = (void *)objc_msgSend(v13, "copy");
      }
      else
      {
        v17 = CFSTR("QLErrorFailingFileNameKey");
        objc_msgSend(v10, "filename");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v13;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }

      v9 = 0;
    }
    else
    {
      v12 = v7;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("QLThumbnailErrorDomain"), a3, v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

void __41__QLThumbnailGenerator__requestWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "__requestWithUUID:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)__requestWithUUID:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  void *v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[QLThumbnailGenerator requests](self, "requests");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)__removeRequestWithUUID:(id)a3
{
  NSObject *queue;
  id v5;
  id v6;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[QLThumbnailGenerator requests](self, "requests");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v5);

}

- (NSMutableDictionary)requests
{
  return self->_requests;
}

uint64_t __47__QLThumbnailGenerator__finishRequestIfNeeded___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequestIfNeeded:", *(_QWORD *)(a1 + 40));
}

- (void)__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:(id)a3 thumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v10;
  NSObject *serialResponseQueue;
  id v12;
  void *v13;
  id v14;

  v14 = a3;
  v10 = a6;
  serialResponseQueue = self->_serialResponseQueue;
  v12 = a4;
  dispatch_assert_queue_V2(serialResponseQueue);
  objc_msgSend(v14, "updateBlock");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    -[QLThumbnailGenerator _callUpdateBlockOfRequestIfRunning:andUpdateMostRepresentativeThumbnail:type:error:](self, "_callUpdateBlockOfRequestIfRunning:andUpdateMostRepresentativeThumbnail:type:error:", v14, v12, a5, v10);
  else
    -[QLThumbnailGenerator _setMostRepresentativeThumbnail:forRequest:](self, "_setMostRepresentativeThumbnail:forRequest:", v12, v14);

  if (objc_msgSend(v14, "thumbnailRepresentationTypeMatchesRequestedMostRepresentativeType:", a5))
    -[QLThumbnailGenerator _finishAndCallCompletionBlockOfRequest:withError:](self, "_finishAndCallCompletionBlockOfRequest:withError:", v14, v10);

}

- (void)_setMostRepresentativeThumbnail:(id)a3 forRequest:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialResponseQueue);
  if (v7)
    objc_msgSend(v6, "setMostRepresentativeThumbnail:", v7);

}

- (void)_finishRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__QLThumbnailGenerator__finishRequest_withError___block_invoke;
  block[3] = &unk_1E5D7C368;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

uint64_t __39__QLThumbnailGenerator_performInBatch___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performInBatch:", *(_QWORD *)(a1 + 40));
}

+ (void)initialize
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __34__QLThumbnailGenerator_initialize__block_invoke;
  v2[3] = &__block_descriptor_40_e30__24__0__NSError_8__NSString_16l;
  v2[4] = a1;
  objc_msgSend(MEMORY[0x1E0CB35C8], "setUserInfoValueProviderForDomain:provider:", CFSTR("QLThumbnailErrorDomain"), v2);
}

- (void)_sendPendingCancelledRequests
{
  QLThumbnailServiceProxy *thumbnailServiceProxy;
  void *v4;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  thumbnailServiceProxy = self->_thumbnailServiceProxy;
  -[NSMutableDictionary allValues](self->_pendingCancelledRequests, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailServiceProxy cancelThumbnailRequests:](thumbnailServiceProxy, "cancelThumbnailRequests:", v4);

  -[NSMutableDictionary removeAllObjects](self->_pendingCancelledRequests, "removeAllObjects");
}

void __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v2 = (void *)objc_opt_new();
  v3 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_2;
  v13[3] = &unk_1E5D7C320;
  v4 = *(void **)(a1 + 32);
  v13[4] = *(_QWORD *)(a1 + 40);
  v5 = v2;
  v14 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v13);
  objc_msgSend(*(id *)(a1 + 32), "removeObjectsForKeys:", v5);
  v7 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(a1 + 40);
  v8 = *(NSObject **)(v6 + 80);
  block[0] = v3;
  block[1] = 3221225472;
  block[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_3;
  block[3] = &unk_1E5D7C368;
  block[4] = v6;
  v11 = v7;
  v12 = v5;
  v9 = v5;
  dispatch_async(v8, block);

}

uint64_t __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  objc_msgSend(*(id *)(a1 + 40), "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectsForKeys:", v3);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "removeObjectsForKeys:", *(_QWORD *)(a1 + 48));
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "generateSuccessiveThumbnailRepresentationsForRequests:generationHandler:completionHandler:", v5, *(_QWORD *)(a1 + 32), &__block_literal_global_34);

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)_sendPendingBatches
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[QLThumbnailGenerator _sendPendingGenerationRequests](self, "_sendPendingGenerationRequests");
  -[QLThumbnailGenerator _sendPendingCancelledRequests](self, "_sendPendingCancelledRequests");
}

- (void)_sendPendingGenerationRequests
{
  void *v3;
  NSObject *requestPreparationQueue;
  id v5;
  _QWORD v6[4];
  id v7;
  QLThumbnailGenerator *v8;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSMutableDictionary addEntriesFromDictionary:](self->_preparingGenerationRequests, "addEntriesFromDictionary:", self->_pendingGenerationRequests);
  v3 = (void *)-[NSMutableDictionary mutableCopy](self->_pendingGenerationRequests, "mutableCopy");
  -[NSMutableDictionary removeAllObjects](self->_pendingGenerationRequests, "removeAllObjects");
  requestPreparationQueue = self->_requestPreparationQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __54__QLThumbnailGenerator__sendPendingGenerationRequests__block_invoke;
  v6[3] = &unk_1E5D7C118;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(requestPreparationQueue, v6);

}

void __39__QLThumbnailGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator_sharedInstance;
  sharedGenerator_sharedInstance = (uint64_t)v1;

}

- (QLThumbnailGenerator)init
{
  QLThumbnailGenerator *v2;
  uint64_t v3;
  NSMutableDictionary *requests;
  uint64_t v5;
  NSMutableDictionary *pendingCancelledRequests;
  uint64_t v7;
  NSMutableDictionary *pendingGenerationRequests;
  uint64_t v9;
  NSMutableDictionary *preparingGenerationRequests;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *requestPreparationQueue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *serialResponseQueue;
  uint64_t v20;
  NSMutableDictionary *iconsByType;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)QLThumbnailGenerator;
  v2 = -[QLThumbnailGenerator init](&v23, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    requests = v2->_requests;
    v2->_requests = (NSMutableDictionary *)v3;

    v5 = objc_opt_new();
    pendingCancelledRequests = v2->_pendingCancelledRequests;
    v2->_pendingCancelledRequests = (NSMutableDictionary *)v5;

    v7 = objc_opt_new();
    pendingGenerationRequests = v2->_pendingGenerationRequests;
    v2->_pendingGenerationRequests = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    preparingGenerationRequests = v2->_preparingGenerationRequests;
    v2->_preparingGenerationRequests = (NSMutableDictionary *)v9;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator", v11);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator.preparation", v14);
    requestPreparationQueue = v2->_requestPreparationQueue;
    v2->_requestPreparationQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.quicklook.QLThumbnailGenerator.response", v17);
    serialResponseQueue = v2->_serialResponseQueue;
    v2->_serialResponseQueue = (OS_dispatch_queue *)v18;

    v2->_iconsLock._os_unfair_lock_opaque = 0;
    v20 = objc_opt_new();
    iconsByType = v2->_iconsByType;
    v2->_iconsByType = (NSMutableDictionary *)v20;

  }
  return v2;
}

- (void)_performInBatch:(id)a3
{
  NSObject *queue;
  void (**v5)(_QWORD);
  unint64_t v6;

  queue = self->_queue;
  v5 = (void (**)(_QWORD))a3;
  dispatch_assert_queue_V2(queue);
  ++self->_batchingCount;
  v5[2](v5);

  v6 = self->_batchingCount - 1;
  self->_batchingCount = v6;
  if (!v6)
    -[QLThumbnailGenerator _sendPendingBatches](self, "_sendPendingBatches");
}

+ (QLThumbnailGenerator)sharedGenerator
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__QLThumbnailGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken != -1)
    dispatch_once(&sharedGenerator_onceToken, block);
  return (QLThumbnailGenerator *)(id)sharedGenerator_sharedInstance;
}

- (void)performInBatch:(id)a3
{
  QLThumbnailGenerator *v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  if (-[QLThumbnailGenerator _isBuildingBatch](v4, "_isBuildingBatch"))
  {
    -[QLThumbnailGenerator _performInBatch:](v4, "_performInBatch:", v6);
  }
  else
  {
    queue = v4->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__QLThumbnailGenerator_performInBatch___block_invoke;
    block[3] = &unk_1E5D7C2A8;
    block[4] = v4;
    v8 = v6;
    dispatch_sync(queue, block);

  }
  objc_sync_exit(v4);

}

uint64_t __98__QLThumbnailGenerator_generateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queueThumbnailRequest:", *(_QWORD *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_sendPendingGenerationRequests");
}

void __107__QLThumbnailGenerator__callUpdateBlockOfRequestIfRunning_andUpdateMostRepresentativeThumbnail_type_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void (**v13)(_QWORD, _QWORD, _QWORD, _QWORD);
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "_requestRepresentationTypeIsMoreRepresentative:thanType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 64)) & 1) == 0)
  {
    v2 = objc_msgSend(*(id *)(a1 + 40), "mostRepresentativeTypeForWhichUpdateBlockHasBeenCalled");
    v3 = *(_QWORD *)(a1 + 64);
    objc_msgSend(*(id *)(a1 + 40), "updateBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      v5 = v2 < v3;
    else
      v5 = 0;
    if (v5)
    {
      v6 = qltLogHandles[0];
      if (!qltLogHandles[0])
      {
        QLTInitLogging();
        v6 = qltLogHandles[0];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = *(_QWORD *)(a1 + 48);
        v9 = *(_QWORD *)(a1 + 64);
        v10 = v6;
        QLThumbnailRepresentationTypeToString(v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(a1 + 56);
        v14 = 138413058;
        v15 = v7;
        v16 = 2112;
        v17 = v8;
        v18 = 2112;
        v19 = v11;
        v20 = 2112;
        v21 = v12;
        _os_log_impl(&dword_1AE3F5000, v10, OS_LOG_TYPE_INFO, "Calling request updateBlock for %@ with thumbnail: %@, type: %@, error: %@", (uint8_t *)&v14, 0x2Au);

      }
      objc_msgSend(*(id *)(a1 + 40), "updateBlock");
      v13 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v13[2](v13, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));

      objc_msgSend(*(id *)(a1 + 40), "noteUpdateBlockHasBeenCalledForType:", *(_QWORD *)(a1 + 64));
    }
    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(*(id *)(a1 + 40), "setMostRepresentativeThumbnail:");
  }
}

- (id)thumbnailIconForRequest:(id)a3
{
  id v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  NSObject *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  CGImage *v19;
  QLThumbnailRepresentation *v20;
  void *v21;
  double v22;
  QLThumbnailRepresentation *v23;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "scale");
  v6 = v5;
  objc_msgSend(v4, "contentType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (objc_msgSend(v7, "conformsToType:", *MEMORY[0x1E0CEC440]) & 1) == 0)
  {
    os_unfair_lock_lock(&self->_iconsLock);
    -[NSMutableDictionary objectForKey:](self->_iconsByType, "objectForKey:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v13 = objc_alloc(MEMORY[0x1E0D3A820]);
      objc_msgSend(v8, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v13, "initWithType:", v14);

      if (v12)
        -[NSMutableDictionary setObject:forKey:](self->_iconsByType, "setObject:forKey:", v12, v8);
    }
    os_unfair_lock_unlock(&self->_iconsLock);
    goto LABEL_9;
  }
  objc_msgSend(v4, "fileURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D3A820]);
    objc_msgSend(v4, "fileURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithURL:", v11);

LABEL_9:
    v15 = objc_alloc(MEMORY[0x1E0D3A830]);
    objc_msgSend(v4, "size");
    v16 = (void *)objc_msgSend(v15, "initWithSize:scale:");
    if (!objc_msgSend(v4, "iconVariant"))
      objc_msgSend(v16, "setVariantOptions:", 1);
    -[NSObject imageForDescriptor:](v12, "imageForDescriptor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "placeholder"))
    {
      -[NSObject prepareImageForDescriptor:](v12, "prepareImageForDescriptor:", v16);
      v18 = objc_claimAutoreleasedReturnValue();

      v17 = (void *)v18;
    }
    if (v17)
    {
      v19 = (CGImage *)objc_msgSend(v17, "CGImage");
      v20 = [QLThumbnailRepresentation alloc];
      v25[0] = v19;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = (double)CGImageGetWidth(v19) / v6;
      v23 = -[QLThumbnailRepresentation initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:](v20, "initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:", 0, 0, v21, 0, v6, 0.0, 0.0, v22, (double)CGImageGetHeight(v19) / v6);

    }
    else
    {
      v23 = 0;
    }

    goto LABEL_20;
  }
  _log();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[QLThumbnailGenerator thumbnailIconForRequest:].cold.1();
  v23 = 0;
LABEL_20:

  return v23;
}

- (void)failedToGenerateThumbnailOfType:(int64_t)a3 forRequestWithUUID:(id)a4 error:(id)a5
{
  -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:](self, "_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:", a4, 0, 0, 0, a3, 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), a5);
}

- (BOOL)_requestRepresentationTypeIsMoreRepresentative:(id)a3 thanType:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  BOOL v8;

  v5 = a3;
  objc_msgSend(v5, "mostRepresentativeThumbnail");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "mostRepresentativeThumbnail");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "type") > a4;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)_callUpdateBlockOfRequestIfRunning:(id)a3 andUpdateMostRepresentativeThumbnail:(id)a4 type:(int64_t)a5 error:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  int64_t v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_serialResponseQueue);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __107__QLThumbnailGenerator__callUpdateBlockOfRequestIfRunning_andUpdateMostRepresentativeThumbnail_type_error___block_invoke;
  block[3] = &unk_1E5D7C390;
  block[4] = self;
  v18 = v10;
  v20 = v12;
  v21 = a5;
  v19 = v11;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_sync(queue, block);

}

+ (id)debugDescriptionForErrorCode:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return 0;
  else
    return off_1E5D7C420[a3];
}

- (void)generateBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  QLThumbnailGenerationRequest *v8;

  v8 = request;
  v6 = completionHandler;
  if (!v6)
    -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:].cold.1();
  v7 = v6;
  -[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:](self, "generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:", v8, 0, 0, v6);

}

- (void)generateRepresentationsForRequest:(QLThumbnailGenerationRequest *)request updateHandler:(void *)updateHandler
{
  void *v6;
  void *v7;
  QLThumbnailGenerationRequest *v8;

  v8 = request;
  v6 = updateHandler;
  if (!v6)
    -[QLThumbnailGenerator generateRepresentationsForRequest:updateHandler:].cold.1();
  v7 = v6;
  -[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:](self, "generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:", v8, v6, 0, 0);

}

- (void)synchronousGenerateThumbnailForRequest:(id)a3 updateHandler:(id)a4 statusHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  NSObject *queue;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  QLThumbnailGenerator *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  dispatch_semaphore_t v33;

  v10 = a3;
  v11 = (unint64_t)a4;
  v12 = a5;
  v13 = (unint64_t)a6;
  if (!(v11 | v13))
    -[QLThumbnailGenerator synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:].cold.1();
  v14 = (void *)v13;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__0;
  v32 = __Block_byref_object_dispose__0;
  v33 = dispatch_semaphore_create(0);
  objc_msgSend(v10, "setUpdateBlock:", v11);
  objc_msgSend(v10, "setStatusBlock:", v12);
  v15 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke;
  v25[3] = &unk_1E5D7C258;
  v16 = v14;
  v26 = v16;
  v27 = &v28;
  objc_msgSend(v10, "setCompletionBlock:", v25);
  queue = self->_queue;
  v19 = v15;
  v20 = 3221225472;
  v21 = __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke_2;
  v22 = &unk_1E5D7C118;
  v23 = self;
  v18 = v10;
  v24 = v18;
  dispatch_sync(queue, &v19);
  -[QLThumbnailGenerator _sendSyncGenerationRequest:](self, "_sendSyncGenerationRequest:", v18, v19, v20, v21, v22, v23);
  dispatch_semaphore_wait((dispatch_semaphore_t)v29[5], 0xFFFFFFFFFFFFFFFFLL);

  _Block_object_dispose(&v28, 8);
}

intptr_t __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

uint64_t __109__QLThumbnailGenerator_synchronousGenerateThumbnailForRequest_updateHandler_statusHandler_completionHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_prepareSyncThumbnailRequest:", *(_QWORD *)(a1 + 40));
}

- (void)saveBestRepresentationForRequest:(QLThumbnailGenerationRequest *)request toFileAtURL:(NSURL *)fileURL withContentType:(NSString *)contentType completionHandler:(void *)completionHandler
{
  void *v10;
  void *v11;
  NSURL *v12;
  QLThumbnailGenerationRequest *v13;
  id v14;

  v10 = (void *)MEMORY[0x1E0CEC3F8];
  v11 = completionHandler;
  v12 = fileURL;
  v13 = request;
  objc_msgSend(v10, "typeWithIdentifier:", contentType);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerator saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:](self, "saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:", v13, v12, v14, 0, v11);

}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 completionHandler:(id)a6
{
  -[QLThumbnailGenerator saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:](self, "saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:", a3, a4, a5, 0, a6);
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v14, "setSaveURL:", a4);
  objc_msgSend(v14, "setSaveURLContentType:", v13);

  objc_msgSend(v14, "setDownloadingAllowed:", v7);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __128__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileAtURL_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke;
  v16[3] = &unk_1E5D7C280;
  v17 = v12;
  v15 = v12;
  -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:](self, "generateBestRepresentationForRequest:completionHandler:", v14, v16);

}

uint64_t __128__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileAtURL_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileAtURL:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = (void *)MEMORY[0x1E0CEC3F8];
  v13 = a7;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "typeWithIdentifier:", a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerator saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:](self, "saveBestRepresentationForRequest:toFileAtURL:asContentType:allowingThumbnailDownloads:completionHandler:", v15, v14, v16, v7, v13);

}

- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 asContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;

  v7 = a6;
  v12 = a7;
  v13 = a5;
  v14 = a3;
  objc_msgSend(v14, "setSaveFileHandle:", a4);
  objc_msgSend(v14, "setSaveURLContentType:", v13);

  objc_msgSend(v14, "setDownloadingAllowed:", v7);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __129__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileHandle_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke;
  v16[3] = &unk_1E5D7C280;
  v17 = v12;
  v15 = v12;
  -[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:](self, "generateBestRepresentationForRequest:completionHandler:", v14, v16);

}

uint64_t __129__QLThumbnailGenerator_saveBestRepresentationForRequest_toFileHandle_asContentType_allowingThumbnailDownloads_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)saveBestRepresentationForRequest:(id)a3 toFileHandle:(id)a4 withContentType:(id)a5 allowingThumbnailDownloads:(BOOL)a6 completionHandler:(id)a7
{
  _BOOL8 v7;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;

  v7 = a6;
  v12 = (void *)MEMORY[0x1E0CEC3F8];
  v13 = a7;
  v14 = a4;
  v15 = a3;
  objc_msgSend(v12, "typeWithIdentifier:", a5);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[QLThumbnailGenerator saveBestRepresentationForRequest:toFileHandle:asContentType:allowingThumbnailDownloads:completionHandler:](self, "saveBestRepresentationForRequest:toFileHandle:asContentType:allowingThumbnailDownloads:completionHandler:", v15, v14, v16, v7, v13);

}

- (void)cancelRequest:(QLThumbnailGenerationRequest *)request
{
  QLThumbnailGenerator *v4;
  BOOL v5;
  NSObject *queue;
  QLThumbnailGenerationRequest *v7;
  _QWORD block[5];
  QLThumbnailGenerationRequest *v9;

  v7 = request;
  v4 = self;
  objc_sync_enter(v4);
  v5 = -[QLThumbnailGenerator _isBuildingBatch](v4, "_isBuildingBatch");
  queue = v4->_queue;
  if (v5)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)v4->_queue);
    -[QLThumbnailGenerator _cancelRequestIfNeeded:](v4, "_cancelRequestIfNeeded:", v7);
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__QLThumbnailGenerator_cancelRequest___block_invoke;
    block[3] = &unk_1E5D7C118;
    block[4] = v4;
    v9 = v7;
    dispatch_sync(queue, block);

  }
  objc_sync_exit(v4);

}

uint64_t __38__QLThumbnailGenerator_cancelRequest___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_cancelRequestIfNeeded:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "_sendPendingCancelledRequests");
  return result;
}

- (BOOL)_cancelRequestIfNeeded:(id)a3
{
  id v4;
  NSMutableDictionary *preparingGenerationRequests;
  void *v6;
  void *v7;
  void *v8;
  _BOOL4 v9;
  NSMutableDictionary *pendingCancelledRequests;
  void *v11;
  BOOL v12;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  preparingGenerationRequests = self->_preparingGenerationRequests;
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](preparingGenerationRequests, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v4, "cancel");
  }
  else
  {
    objc_msgSend(v4, "uuid");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[QLThumbnailGenerator __requestWithUUIDIsStillRunning:](self, "__requestWithUUIDIsStillRunning:", v8);

    if (!v9)
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_msgSend(v4, "cancel");
    pendingCancelledRequests = self->_pendingCancelledRequests;
    objc_msgSend(v4, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](pendingCancelledRequests, "setObject:forKey:", v4, v11);

  }
  v12 = 1;
LABEL_7:

  return v12;
}

- (void)_addRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__QLThumbnailGenerator__addRequest___block_invoke;
  block[3] = &unk_1E5D7C118;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __36__QLThumbnailGenerator__addRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v2, v3);

}

- (void)_removeRequest:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__QLThumbnailGenerator__removeRequest___block_invoke;
  block[3] = &unk_1E5D7C118;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __39__QLThumbnailGenerator__removeRequest___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "requests");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", v2);

}

- (BOOL)__requestWithUUIDIsStillRunning:(id)a3
{
  NSObject *queue;
  id v5;
  void *v6;
  int v7;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[QLThumbnailGenerator __requestWithUUID:](self, "__requestWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "isCancelled") & 1) == 0)
    v7 = objc_msgSend(v6, "isFinished") ^ 1;
  else
    LOBYTE(v7) = 0;

  return v7;
}

- (void)_sendSyncGenerationRequest:(id)a3
{
  id v4;
  NSObject *queue;
  void *v6;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__QLThumbnailGenerator__sendSyncGenerationRequest___block_invoke;
  v8[3] = &unk_1E5D7C2F8;
  v8[4] = self;
  v8[5] = &v9;
  dispatch_sync(queue, v8);
  if (objc_msgSend(v4, "prepareForSending"))
  {
    v6 = (void *)v10[5];
    v15[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "generateSuccessiveThumbnailRepresentationsForRequests:generationHandler:completionHandler:", v7, self, &__block_literal_global_2);

  }
  else
  {
    -[QLThumbnailGenerator _finishRequestIfInvalid:](self, "_finishRequestIfInvalid:", v4);
  }
  _Block_object_dispose(&v9, 8);

}

void __51__QLThumbnailGenerator__sendSyncGenerationRequest___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 72));
}

- (void)_prepareSyncThumbnailRequest:(id)a3
{
  NSMutableDictionary *requests;
  void *v5;
  id v6;

  v6 = a3;
  -[QLThumbnailGenerator _prepareThumbnailRequestForQueueOrSending:synchronous:](self, "_prepareThumbnailRequestForQueueOrSending:synchronous:", v6, 1);
  if (!-[QLThumbnailGenerator __finishRequestIfNeeded:](self, "__finishRequestIfNeeded:", v6))
  {
    if ((unint64_t)objc_msgSend(v6, "representationTypes") > 1)
    {
      requests = self->_requests;
      objc_msgSend(v6, "uuid");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](requests, "setObject:forKeyedSubscript:", v6, v5);

    }
    else
    {
      -[QLThumbnailGenerator __finishRequestWithoutError:](self, "__finishRequestWithoutError:", v6);
    }
  }

}

void __63__QLThumbnailGenerator__queueIconGenerationForRequestIfNeeded___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "thumbnailIconForRequest:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "__notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", *(_QWORD *)(a1 + 40), v2, 0, 0);

}

- (void)_handleThumbnailGenerationCompletionWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9 error:(id)a10
{
  _BOOL4 v10;
  id v15;
  id v16;
  id v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  NSObject *v27;
  dispatch_data_t v28;
  uint64_t v29;
  size_t v30;
  void *v31;
  const void *v32;
  vm_map_t v33;
  kern_return_t v34;
  mach_error_t v35;
  NSObject *v36;
  char *v37;
  int v38;
  int *v39;
  char *v40;
  dispatch_data_t v41;
  CGImageRef v42;
  NSObject *v43;
  NSObject *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  QLThumbnailGenerator *v48;
  uint64_t v49;
  void *v50;
  NSObject *v51;
  QLThumbnailRepresentation *v52;
  void *v53;
  NSObject *v54;
  QLThumbnailRepresentation *v55;
  id v56;
  id v57;
  QLThumbnailGenerator *v58;
  id v59;
  int64_t v60;
  dispatch_block_t destructor;
  id obj;
  id obja;
  void *v65;
  id v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  uint64_t v71;
  void *v72;
  uint8_t buf[4];
  _BYTE v74[18];
  __int16 v75;
  void *v76;
  __int16 v77;
  uint64_t v78;
  __int16 v79;
  CGImageRef v80;
  _BYTE v81[128];
  uint64_t v82;

  v10 = a9;
  v82 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a10;
  _log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:].cold.3();

  -[QLThumbnailGenerator _requestWithUUID:](self, "_requestWithUUID:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16 || v18)
  {
    -[QLThumbnailGenerator _notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:](self, "_notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", v20, 0, a8, v18);
LABEL_43:

    goto LABEL_44;
  }
  if (!-[QLThumbnailGenerator _finishRequestIfNeeded:](self, "_finishRequestIfNeeded:", v20))
  {
    v58 = self;
    v59 = v17;
    v60 = a8;
    v57 = v15;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v16, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    v56 = v16;
    obj = v16;
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
    v65 = v21;
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v68;
      destructor = (dispatch_block_t)*MEMORY[0x1E0C80CE8];
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v68 != v24)
            objc_enumerationMutation(obj);
          v26 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v26, "data");
          v27 = objc_claimAutoreleasedReturnValue();
          v28 = v27;
          if (v10)
          {
            v29 = -[NSObject length](v27, "length");
            v30 = (v29 + *MEMORY[0x1E0C85AD8] - 1) & -*MEMORY[0x1E0C85AD8];
            v31 = mmap(0, v30, 3, 4097, 1627389952, 0);
            if (v31)
            {
              v32 = v31;
              v33 = *MEMORY[0x1E0C83DA0];
              v28 = objc_retainAutorelease(v28);
              v34 = vm_copy(v33, -[NSObject bytes](v28, "bytes"), v30, (vm_address_t)v32);
              if (v34)
              {
                v35 = v34;
                _log();
                v36 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                {
                  v37 = mach_error_string(v35);
                  *(_DWORD *)buf = 67109378;
                  *(_DWORD *)v74 = v35;
                  *(_WORD *)&v74[4] = 2080;
                  *(_QWORD *)&v74[6] = v37;
                  _os_log_error_impl(&dword_1AE3F5000, v36, OS_LOG_TYPE_ERROR, "Could not copy memory to make the thumbnail count against my jetsam limit: %d (%s)", buf, 0x12u);
                }
              }
              else
              {
                v41 = dispatch_data_create(v32, v30, 0, destructor);
                v36 = v28;
                v28 = v41;
              }
              v21 = v65;
            }
            else
            {
              _log();
              v36 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
              {
                v38 = *__error();
                v39 = __error();
                v40 = strerror(*v39);
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v74 = v38;
                *(_WORD *)&v74[4] = 2080;
                *(_QWORD *)&v74[6] = v40;
                _os_log_error_impl(&dword_1AE3F5000, v36, OS_LOG_TYPE_ERROR, "Could not allocate memory to make the thumbnail count against my jetsam limit: %d (%s)", buf, 0x12u);
              }
            }

          }
          v42 = QLImageCreateForDefaultThumbnailGenerationFromData(v26);
          v43 = qltLogHandles[0];
          if (!qltLogHandles[0])
          {
            QLTInitLogging();
            v43 = qltLogHandles[0];
          }
          if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
          {
            v44 = v43;
            v45 = -[NSObject length](v28, "length");
            objc_msgSend(v26, "format");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138413314;
            *(_QWORD *)v74 = v20;
            *(_WORD *)&v74[8] = 2048;
            *(_QWORD *)&v74[10] = v45;
            v21 = v65;
            v75 = 2112;
            v76 = v46;
            v77 = 2112;
            v78 = 0;
            v79 = 2112;
            v80 = v42;
            _os_log_impl(&dword_1AE3F5000, v44, OS_LOG_TYPE_INFO, "Received thumbnail for %@: data of length %lu, bitmap format %@, error %@, image %@", buf, 0x34u);

          }
          objc_msgSend(v21, "addObject:", v42);

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v81, 16);
      }
      while (v23);
    }

    if (v21)
    {
      v17 = v59;
      if (v59)
      {
        v66 = 0;
        objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v59, &v66);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        obja = v66;
        v48 = v58;
        v49 = a7;
        if (v47)
        {
          v16 = v56;
          v15 = v57;
        }
        else
        {
          v54 = qltLogHandles[0];
          v16 = v56;
          v15 = v57;
          if (!qltLogHandles[0])
          {
            QLTInitLogging();
            v54 = qltLogHandles[0];
          }
          if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:].cold.2();
          v47 = 0;
        }
      }
      else
      {
        obja = 0;
        v47 = 0;
        v16 = v56;
        v15 = v57;
        v48 = v58;
        v49 = a7;
      }
      v55 = [QLThumbnailRepresentation alloc];
      objc_msgSend(v20, "scale");
      v53 = v65;
      v52 = -[QLThumbnailRepresentation initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:](v55, "initWithThumbnailType:iconFlavor:images:scale:contentRect:generatedProperties:", v60, v49, v65, v47);
      v18 = 0;
      v50 = obja;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Could not decode image for thumbnail request %@ from received thumbnail data"), v20);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      _log();
      v51 = objc_claimAutoreleasedReturnValue();
      v17 = v59;
      if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
        -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:].cold.1();

      v71 = *MEMORY[0x1E0CB2938];
      v72 = v50;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      +[QLThumbnailGenerator errorWithCode:request:additionalUserInfo:](QLThumbnailGenerator, "errorWithCode:request:additionalUserInfo:", 0, v20, v47);
      v18 = (id)objc_claimAutoreleasedReturnValue();
      v52 = 0;
      v16 = v56;
      v15 = v57;
      v48 = v58;
      v53 = v65;
    }

    -[QLThumbnailGenerator _notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:](v48, "_notifyClientWithNewThumbnailRepresentationForRequestIfNeeded:thumbnail:type:error:", v20, v52, v60, v18);
    goto LABEL_43;
  }
LABEL_44:

}

- (void)_callCompletionBlockOfRequest:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  NSObject *serialResponseQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  serialResponseQueue = self->_serialResponseQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__QLThumbnailGenerator__callCompletionBlockOfRequest_withError___block_invoke;
  block[3] = &unk_1E5D7C368;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(serialResponseQueue, block);

}

uint64_t __64__QLThumbnailGenerator__callCompletionBlockOfRequest_withError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__callCompletionBlockOfRequest:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_finishRequestWithoutError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__QLThumbnailGenerator__finishRequestWithoutError___block_invoke;
  block[3] = &unk_1E5D7C118;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __51__QLThumbnailGenerator__finishRequestWithoutError___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "__finishRequestWithoutError:", *(_QWORD *)(a1 + 40));
}

- (void)__finishRequestWithoutError:(id)a3
{
  NSObject *queue;
  id v5;

  queue = self->_queue;
  v5 = a3;
  dispatch_assert_queue_V2(queue);
  -[QLThumbnailGenerator __finishRequest:withError:](self, "__finishRequest:withError:", v5, 0);

}

- (BOOL)_finishRequestIfInvalid:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__QLThumbnailGenerator__finishRequestIfInvalid___block_invoke;
  block[3] = &unk_1E5D7C2D0;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)queue;
}

uint64_t __48__QLThumbnailGenerator__finishRequestIfInvalid___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "__finishRequestIfInvalid:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (void)_finishAllRequestsWithError:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;
  _QWORD *v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__0;
  v10[4] = __Block_byref_object_dispose__0;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__QLThumbnailGenerator__finishAllRequestsWithError___block_invoke;
  block[3] = &unk_1E5D7C2D0;
  v8 = v4;
  v9 = v10;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);

  _Block_object_dispose(v10, 8);
}

void __52__QLThumbnailGenerator__finishAllRequestsWithError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requests");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "copy");
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
        objc_msgSend(*(id *)(a1 + 32), "requests", (_QWORD)v15);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "__finishRequest:withError:", v14, *(_QWORD *)(a1 + 40));
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

}

- (void)didUpdateStatus:(int64_t)a3 ofThumbnailGenerationWithUUID:(id)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  id v7;

  -[QLThumbnailGenerator _requestWithUUID:](self, "_requestWithUUID:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBlock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v7, "statusBlock");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v6[2](v6, a3);

  }
}

- (void)didGenerateThumbnailForRequestWithUUID:(id)a3 images:(id)a4 metadata:(id)a5 contentRect:(CGRect)a6 iconFlavor:(int)a7 thumbnailType:(int64_t)a8 clientShouldTakeOwnership:(BOOL)a9
{
  -[QLThumbnailGenerator _handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:](self, "_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:", a3, a4, a5, *(_QWORD *)&a7, a8, a9, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height, 0);
}

void __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishAllRequestsWithError:", v3);

}

- (void)_createSyncThumbnailServiceProxy
{
  void *v3;
  QLThumbnailServiceProxy *v4;
  QLThumbnailServiceProxy *syncThumbnailServiceProxy;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__QLThumbnailGenerator__createSyncThumbnailServiceProxy__block_invoke;
  v6[3] = &unk_1E5D7C3B8;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v3, "synchronousRemoteObjectProxyWithErrorHandler:", v6);
  v4 = (QLThumbnailServiceProxy *)objc_claimAutoreleasedReturnValue();
  syncThumbnailServiceProxy = self->_syncThumbnailServiceProxy;
  self->_syncThumbnailServiceProxy = v4;

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __56__QLThumbnailGenerator__createSyncThumbnailServiceProxy__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;

  v3 = a2;
  _log();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_finishAllRequestsWithError:", v3);

}

- (BOOL)canGenerateThumbnailsForContentType:(id)a3 atSize:(CGSize)a4
{
  double height;
  double width;
  id v6;
  void *v7;
  void *v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  height = a4.height;
  width = a4.width;
  v6 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  +[QLThumbnailServiceProxy sharedInstance](QLThumbnailServiceProxy, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_50);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke_51;
  v10[3] = &unk_1E5D7C400;
  v10[4] = &v11;
  objc_msgSend(v8, "canGenerateThumbnailsForContentType:atSize:completionHandler:", v6, v10, width, height);

  LOBYTE(v7) = *((_BYTE *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v7;
}

void __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _log();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1();

}

uint64_t __67__QLThumbnailGenerator_canGenerateThumbnailsForContentType_atSize___block_invoke_51(uint64_t result, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)setRequests:(id)a3
{
  objc_storeStrong((id *)&self->_requests, a3);
}

- (NSMutableDictionary)iconsByType
{
  return self->_iconsByType;
}

- (void)setIconsByType:(id)a3
{
  objc_storeStrong((id *)&self->_iconsByType, a3);
}

- (unint64_t)batchingCount
{
  return self->_batchingCount;
}

- (void)setBatchingCount:(unint64_t)a3
{
  self->_batchingCount = a3;
}

- (NSMutableDictionary)pendingCancelledRequests
{
  return self->_pendingCancelledRequests;
}

- (void)setPendingCancelledRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingCancelledRequests, a3);
}

- (NSMutableDictionary)pendingGenerationRequests
{
  return self->_pendingGenerationRequests;
}

- (void)setPendingGenerationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_pendingGenerationRequests, a3);
}

- (NSMutableDictionary)preparingGenerationRequests
{
  return self->_preparingGenerationRequests;
}

- (void)setPreparingGenerationRequests:(id)a3
{
  objc_storeStrong((id *)&self->_preparingGenerationRequests, a3);
}

- (QLThumbnailServiceProxy)thumbnailServiceProxy
{
  return self->_thumbnailServiceProxy;
}

- (void)setThumbnailServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailServiceProxy, a3);
}

- (QLThumbnailServiceProxy)syncThumbnailServiceProxy
{
  return self->_syncThumbnailServiceProxy;
}

- (void)setSyncThumbnailServiceProxy:(id)a3
{
  objc_storeStrong((id *)&self->_syncThumbnailServiceProxy, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_dispatch_queue)requestPreparationQueue
{
  return self->_requestPreparationQueue;
}

- (OS_dispatch_queue)serialResponseQueue
{
  return self->_serialResponseQueue;
}

- (os_unfair_lock_s)iconsLock
{
  return self->_iconsLock;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialResponseQueue, 0);
  objc_storeStrong((id *)&self->_requestPreparationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_syncThumbnailServiceProxy, 0);
  objc_storeStrong((id *)&self->_thumbnailServiceProxy, 0);
  objc_storeStrong((id *)&self->_preparingGenerationRequests, 0);
  objc_storeStrong((id *)&self->_pendingGenerationRequests, 0);
  objc_storeStrong((id *)&self->_pendingCancelledRequests, 0);
  objc_storeStrong((id *)&self->_iconsByType, 0);
  objc_storeStrong((id *)&self->_requests, 0);
}

- (void)generateBestRepresentationForRequest:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateBestRepresentationForRequest:completionHandler:]", "QLThumbnailGenerator.m", 152, "completionHandler != nil");
}

- (void)generateRepresentationsForRequest:updateHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateRepresentationsForRequest:updateHandler:]", "QLThumbnailGenerator.m", 158, "updateHandler != nil");
}

- (void)generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]", "QLThumbnailGenerator.m", 168, "completionHandler != nil || updateHandler != nil");
}

- (void)synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:.cold.1()
{
  __assert_rtn("-[QLThumbnailGenerator synchronousGenerateThumbnailForRequest:updateHandler:statusHandler:completionHandler:]", "QLThumbnailGenerator.m", 192, "completionHandler != nil || updateHandler != nil");
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Could not decode image for thumbnail request %@ from received thumbnail data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "Failed to unarchive thumbnail's generated properties: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)_handleThumbnailGenerationCompletionWithUUID:images:metadata:contentRect:iconFlavor:thumbnailType:clientShouldTakeOwnership:error:.cold.3()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_1AE3F5000, v0, OS_LOG_TYPE_DEBUG, "Processing thumbnail request completion for request uuid:%@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)thumbnailIconForRequest:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "No fileURL or contentType for %@, not returning any icon", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __52__QLThumbnailGenerator__createThumbnailServiceProxy__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1AE3F5000, v0, v1, "An error occurred with ThumbnailsAgent: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

@end
