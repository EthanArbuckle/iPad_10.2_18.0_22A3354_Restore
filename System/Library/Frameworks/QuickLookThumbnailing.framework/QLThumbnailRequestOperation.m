@implementation QLThumbnailRequestOperation

- (QLThumbnailRequestOperation)initWithFPItem:(id)a3 size:(CGSize)a4 minimumDimension:(double)a5 scale:(double)a6 iconMode:(BOOL)a7
{
  _BOOL8 v7;
  double height;
  double width;
  id v13;
  QLTUbiquitousFileThumbnailRequest *v14;
  QLThumbnailRequestOperation *v15;

  v7 = a7;
  height = a4.height;
  width = a4.width;
  v13 = a3;
  v14 = -[QLTUbiquitousFileThumbnailRequest initWithFPItem:size:minimumDimension:scale:iconMode:]([QLTUbiquitousFileThumbnailRequest alloc], "initWithFPItem:size:minimumDimension:scale:iconMode:", v13, v7, width, height, a5, a6);

  v15 = -[QLThumbnailRequestOperation initWithThumbnailRequest:](self, "initWithThumbnailRequest:", v14);
  return v15;
}

- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5
{
  return -[QLThumbnailRequestOperation initWithFileAtURL:size:scale:iconMode:](self, "initWithFileAtURL:size:scale:iconMode:", a3, 0, a4.width, a4.height, a5);
}

- (QLThumbnailRequestOperation)initWithFileAtURL:(id)a3 size:(CGSize)a4 scale:(double)a5 iconMode:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  id v11;
  QLTFileThumbnailRequest *v12;
  id v13;
  id v14;
  QLThumbnailRequestOperation *v15;
  QLThumbnailRequestOperation *v16;
  id v18;

  v6 = a6;
  height = a4.height;
  width = a4.width;
  v11 = a3;
  v18 = 0;
  v12 = -[QLTFileThumbnailRequest initWithFileAtURL:size:minimumDimension:scale:iconMode:error:]([QLTFileThumbnailRequest alloc], "initWithFileAtURL:size:minimumDimension:scale:iconMode:error:", v11, v6, &v18, width, height, 0.0, a5);

  v13 = v18;
  v14 = v18;
  v15 = -[QLThumbnailRequestOperation initWithThumbnailRequest:](self, "initWithThumbnailRequest:", v12);
  v16 = v15;
  if (v15)
    objc_storeStrong((id *)&v15->_thumbnailRequestInvalidError, v13);

  return v16;
}

- (QLThumbnailRequestOperation)initWithThumbnailRequest:(id)a3
{
  id v4;
  QLThumbnailRequestOperation *v5;
  uint64_t v6;
  QLThumbnailGenerationRequest *request;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialResponseQueue;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)QLThumbnailRequestOperation;
  v5 = -[QLThumbnailRequestOperation init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "setRequestedTypes:", -1);
    +[QLThumbnailGenerationRequest requestWithThumbnailRequest:](QLThumbnailGenerationRequest, "requestWithThumbnailRequest:", v4);
    v6 = objc_claimAutoreleasedReturnValue();
    request = v5->_request;
    v5->_request = (QLThumbnailGenerationRequest *)v6;

    -[QLThumbnailRequestOperation sharedSerialResponseQueue](v5, "sharedSerialResponseQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = dispatch_queue_create_with_target_V2("com.apple.quicklook.thumbnailRequestOperation", 0, v8);
    serialResponseQueue = v5->_serialResponseQueue;
    v5->_serialResponseQueue = (OS_dispatch_queue *)v9;

  }
  return v5;
}

- (id)sharedSerialResponseQueue
{
  if (sharedSerialResponseQueue_onceToken != -1)
    dispatch_once(&sharedSerialResponseQueue_onceToken, &__block_literal_global);
  return (id)sharedSerialResponseQueue__sharedSerialResponseQueue;
}

void __56__QLThumbnailRequestOperation_sharedSerialResponseQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("com.apple.quicklook.thumbnailRequestOperation.sharedResponseQueue", 0);
  v1 = (void *)sharedSerialResponseQueue__sharedSerialResponseQueue;
  sharedSerialResponseQueue__sharedSerialResponseQueue = (uint64_t)v0;

}

+ (id)operationWithThumbnailRequest:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithThumbnailRequest:", v4);

  return v5;
}

- (void)setMinimumDimension:(double)a3
{
  -[QLThumbnailGenerationRequest setMinimumDimension:](self->_request, "setMinimumDimension:", a3);
}

- (double)minimumDimension
{
  double result;

  -[QLThumbnailGenerationRequest minimumDimension](self->_request, "minimumDimension");
  return result;
}

- (void)setRequestedTypes:(unint64_t)a3
{
  -[QLThumbnailGenerationRequest setRepresentationTypes:](self->_request, "setRepresentationTypes:", a3);
}

- (unint64_t)requestedTypes
{
  return -[QLThumbnailGenerationRequest representationTypes](self->_request, "representationTypes");
}

- (void)setWantsBaseline:(BOOL)a3
{
  -[QLThumbnailGenerationRequest setWantsBaseline:](self->_request, "setWantsBaseline:", a3);
}

- (BOOL)wantsBaseline
{
  return -[QLThumbnailGenerationRequest wantsBaseline](self->_request, "wantsBaseline");
}

- (void)setGenerationBehavior:(int64_t)a3
{
  -[QLThumbnailGenerationRequest setGenerationBehavior:](self->_request, "setGenerationBehavior:", a3);
}

- (int64_t)generationBehavior
{
  return -[QLThumbnailGenerationRequest generationBehavior](self->_request, "generationBehavior");
}

- (unint64_t)badgeType
{
  return -[QLThumbnailGenerationRequest badgeType](self->_request, "badgeType");
}

- (void)setBadgeType:(unint64_t)a3
{
  -[QLThumbnailGenerationRequest setBadgeType:](self->_request, "setBadgeType:", a3);
}

- (void)setFinished:(BOOL)a3
{
  if (self->_finished != a3)
  {
    -[QLThumbnailRequestOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isFinished"));
    self->_finished = a3;
    -[QLThumbnailRequestOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isFinished"));
  }
}

- (void)setExecuting:(BOOL)a3
{
  if (self->_executing != a3)
  {
    -[QLThumbnailRequestOperation willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("isExecuting"));
    self->_executing = a3;
    -[QLThumbnailRequestOperation didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("isExecuting"));
  }
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)start
{
  QLThumbnailRequestOperation *v2;

  v2 = self;
  objc_sync_enter(v2);
  -[QLThumbnailRequestOperation setExecuting:](v2, "setExecuting:", 1);
  objc_sync_exit(v2);

  -[QLThumbnailRequestOperation main](v2, "main");
}

- (void)cancel
{
  QLThumbnailRequestOperation *v2;
  void *v3;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  v4.receiver = v2;
  v4.super_class = (Class)QLThumbnailRequestOperation;
  -[QLThumbnailRequestOperation cancel](&v4, sel_cancel);
  +[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cancelRequest:", v2->_request);

  objc_sync_exit(v2);
}

- (void)_finish
{
  -[QLThumbnailRequestOperation _finishWithError:](self, "_finishWithError:", 0);
}

- (void)_finishWithError:(id)a3
{
  QLThumbnailRequestOperation *v4;
  id v5;

  v5 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[QLThumbnailRequestOperation __finishWithError:](v4, "__finishWithError:", v5);
  objc_sync_exit(v4);

}

- (void)__finishWithError:(id)a3
{
  id v4;
  NSObject *serialResponseQueue;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (!-[QLThumbnailRequestOperation isFinished](self, "isFinished"))
  {
    -[QLThumbnailRequestOperation setExecuting:](self, "setExecuting:", 0);
    -[QLThumbnailRequestOperation setFinished:](self, "setFinished:", 1);
    serialResponseQueue = self->_serialResponseQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __49__QLThumbnailRequestOperation___finishWithError___block_invoke;
    v6[3] = &unk_1E5D7C118;
    v6[4] = self;
    v7 = v4;
    dispatch_async(serialResponseQueue, v6);

  }
}

void __49__QLThumbnailRequestOperation___finishWithError___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  void (**v9)(_QWORD, _QWORD, _QWORD);
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "requestCompletionBlock");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 40);

    if (v3)
    {
      v4 = qltLogHandles[0];
      if (!qltLogHandles[0])
      {
        QLTInitLogging();
        v4 = qltLogHandles[0];
      }
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v5 = *(void **)(a1 + 32);
        v6 = v4;
        objc_msgSend(v5, "request");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = *(_QWORD *)(a1 + 40);
        v10 = 138412546;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        _os_log_impl(&dword_1AE3F5000, v6, OS_LOG_TYPE_INFO, "Calling requestCompletionBlock for %@ with error: %@", (uint8_t *)&v10, 0x16u);

      }
      objc_msgSend(*(id *)(a1 + 32), "requestCompletionBlock");
      v9 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v9[2](v9, 0, *(_QWORD *)(a1 + 40));

      objc_msgSend(*(id *)(a1 + 32), "setRequestUpdateBlock:", 0);
      objc_msgSend(*(id *)(a1 + 32), "setRequestCompletionBlock:", 0);
    }
  }
}

- (void)_finishIfRequestIsInvalid
{
  QLThumbnailRequestOperation *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!obj->_request)
    -[QLThumbnailRequestOperation __finishWithError:](obj, "__finishWithError:", obj->_thumbnailRequestInvalidError);
  objc_sync_exit(obj);

}

- (BOOL)_finishIfNeeded
{
  QLThumbnailRequestOperation *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  if (-[QLThumbnailRequestOperation isCancelled](v2, "isCancelled")
    && -[QLThumbnailRequestOperation isExecuting](v2, "isExecuting"))
  {
    +[QLThumbnailGenerator errorWithCode:request:additionalUserInfo:](QLThumbnailGenerator, "errorWithCode:request:additionalUserInfo:", 5, v2->_request, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[QLThumbnailRequestOperation __finishWithError:](v2, "__finishWithError:", v3);

  }
  else if (!v2->_request && -[QLThumbnailRequestOperation isExecuting](v2, "isExecuting"))
  {
    -[QLThumbnailRequestOperation __finishWithError:](v2, "__finishWithError:", v2->_thumbnailRequestInvalidError);
  }
  objc_sync_exit(v2);

  return -[QLThumbnailRequestOperation isFinished](v2, "isFinished");
}

- (void)main
{
  void *v3;
  QLThumbnailGenerationRequest *request;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  if (!-[QLThumbnailRequestOperation _finishIfNeeded](self, "_finishIfNeeded"))
  {
    objc_initWeak(&location, self);
    +[QLThumbnailGenerator sharedGenerator](QLThumbnailGenerator, "sharedGenerator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    request = self->_request;
    v5 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __35__QLThumbnailRequestOperation_main__block_invoke;
    v10[3] = &unk_1E5D7C140;
    objc_copyWeak(&v11, &location);
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __35__QLThumbnailRequestOperation_main__block_invoke_2;
    v8[3] = &unk_1E5D7C168;
    objc_copyWeak(&v9, &location);
    v6[0] = v5;
    v6[1] = 3221225472;
    v6[2] = __35__QLThumbnailRequestOperation_main__block_invoke_3;
    v6[3] = &unk_1E5D7C190;
    objc_copyWeak(&v7, &location);
    objc_msgSend(v3, "generateThumbnailForRequest:updateHandler:statusHandler:completionHandler:", request, v10, v8, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __35__QLThumbnailRequestOperation_main__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id *v7;
  id WeakRetained;
  void *v9;
  id v10;
  void (**v11)(_QWORD, _QWORD);
  id v12;

  v12 = a2;
  v6 = a4;
  if (v12)
  {
    v7 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained(v7);
    objc_msgSend(WeakRetained, "requestUpdateBlock");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = objc_loadWeakRetained(v7);
      objc_msgSend(v10, "requestUpdateBlock");
      v11 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id))v11)[2](v11, v12);

    }
  }

}

void __35__QLThumbnailRequestOperation_main__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id *v2;
  id WeakRetained;
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (!a2)
  {
    v2 = (id *)(a1 + 32);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "thumbnailRequestGenerationWillStartBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      v9 = objc_loadWeakRetained(v2);
      objc_msgSend(v9, "thumbnailRequestGenerationWillStartBlock");
      v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v6 = objc_loadWeakRetained(v2);
      objc_msgSend(v6, "request");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "contentTypeUTI");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v5)[2](v5, v8);

    }
  }
}

void __35__QLThumbnailRequestOperation_main__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id *v6;
  id WeakRetained;
  void *v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  id v11;
  id v12;

  v12 = a2;
  v5 = a3;
  v6 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "requestCompletionBlock");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_loadWeakRetained(v6);
    objc_msgSend(v9, "requestCompletionBlock");
    v10 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, id))v10)[2](v10, v12, v5);

  }
  v11 = objc_loadWeakRetained(v6);
  objc_msgSend(v11, "_finish");

}

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (id)requestUpdateBlock
{
  return self->_requestUpdateBlock;
}

- (void)setRequestUpdateBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 264);
}

- (id)requestCompletionBlock
{
  return self->_requestCompletionBlock;
}

- (void)setRequestCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 272);
}

- (OS_dispatch_queue)serialResponseQueue
{
  return self->_serialResponseQueue;
}

- (void)setSerialResponseQueue:(id)a3
{
  objc_storeStrong((id *)&self->_serialResponseQueue, a3);
}

- (QLThumbnailGenerationRequest)request
{
  return (QLThumbnailGenerationRequest *)objc_getProperty(self, a2, 288, 1);
}

- (void)setRequest:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 288);
}

- (id)thumbnailRequestGenerationWillStartBlock
{
  return self->_thumbnailRequestGenerationWillStartBlock;
}

- (void)setThumbnailRequestGenerationWillStartBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 296);
}

- (QLThumbnailRepresentation)mostRepresentativeThumbnail
{
  return self->_mostRepresentativeThumbnail;
}

- (void)setMostRepresentativeThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, a3);
}

- (NSError)thumbnailRequestInvalidError
{
  return self->_thumbnailRequestInvalidError;
}

- (void)setThumbnailRequestInvalidError:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailRequestInvalidError, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailRequestInvalidError, 0);
  objc_storeStrong((id *)&self->_mostRepresentativeThumbnail, 0);
  objc_storeStrong(&self->_thumbnailRequestGenerationWillStartBlock, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_serialResponseQueue, 0);
  objc_storeStrong(&self->_requestCompletionBlock, 0);
  objc_storeStrong(&self->_requestUpdateBlock, 0);
  objc_storeStrong((id *)&self->_beginDate, 0);
}

@end
