@implementation AVAssetResourceLoader

uint64_t __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cachedContentInformationForURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "objectForKey:", objc_msgSend(*(id *)(a1 + 40), "absoluteString"));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
  return result;
}

void __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_getDelegateOnStateQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_getDelegateQueueOnStateQueue");
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
    dispatch_retain(v2);
}

- (dispatch_queue_t)delegateQueue
{
  NSObject *stateQueue;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AVAssetResourceLoader_delegateQueue__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)_getDelegateOnStateQueue
{
  return -[AVWeakReference referencedObject](self->_resourceLoader->weakReferenceToDelegate, "referencedObject");
}

- (OpaqueFigCustomURLHandler)_customURLHandler
{
  return self->_resourceLoader->customURLHandler;
}

uint64_t __101__AVAssetResourceLoader__issueLoadingRequestWithKey_loadingRequest_isRenewalRequest_fallbackHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "_weakReference"), *(_QWORD *)(a1 + 48));
}

- (id)cachedContentInformationForURL:(id)a3
{
  NSObject *contentInformationCachingQueue;
  void *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  v12 = 0;
  contentInformationCachingQueue = self->_resourceLoader->contentInformationCachingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cachedContentInformationForURL___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  av_readwrite_dispatch_queue_read(contentInformationCachingQueue, block);
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (void)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 willHandleRequest:(BOOL *)a5
{
  NSObject *v9;
  AVAssetResourceLoadingRequest *v10;
  uint64_t v11;
  char v12;
  _QWORD v13[6];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14 = 0;
  v9 = dispatch_semaphore_create(0);
  FigCustomURLRequestInfoGetIsRenewalRequest();
  v10 = -[AVAssetResourceLoadingRequest initWithResourceLoader:requestInfo:requestID:]([AVAssetResourceLoadingRequest alloc], "initWithResourceLoader:requestInfo:requestID:", self, a3, a4);
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__AVAssetResourceLoader__handleRequest_requestID_willHandleRequest___block_invoke;
  v13[3] = &unk_1E3035368;
  v13[4] = v9;
  v13[5] = &v15;
  -[AVAssetResourceLoader _issueLoadingRequestWithKey:loadingRequest:isRenewalRequest:fallbackHandler:](self, "_issueLoadingRequestWithKey:loadingRequest:isRenewalRequest:fallbackHandler:", v11, v10, 0, v13);
  if (dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL))
    v12 = 0;
  else
    v12 = *((_BYTE *)v16 + 24);
  *a5 = v12;
  dispatch_release(v9);
  _Block_object_dispose(&v15, 8);
}

- (void)_issueLoadingRequestWithKey:(id)a3 loadingRequest:(id)a4 isRenewalRequest:(BOOL)a5 fallbackHandler:(id)a6
{
  char **v10;
  char *v11;
  NSObject *v12;
  _QWORD block[7];

  if (a4)
  {
    v10 = &selRef_resourceLoader_shouldWaitForRenewalOfRequestedResource_;
    if (!a5)
      v10 = &selRef_resourceLoader_shouldWaitForLoadingOfRequestedResource_;
    v11 = *v10;
    v12 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __101__AVAssetResourceLoader__issueLoadingRequestWithKey_loadingRequest_isRenewalRequest_fallbackHandler___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync(v12, block);
    -[AVAssetResourceLoader _performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:](self, "_performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:", v11, a4, 1, a3, a6);
  }
}

- (void)_performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:(id)a3 delegateCallbackBlock:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[7];
  _QWORD block[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3052000000;
  v22 = __Block_byref_object_copy__38;
  v23 = __Block_byref_object_dispose__38;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__38;
  v17 = __Block_byref_object_dispose__38;
  v18 = 0;
  v7 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v19;
  block[6] = &v13;
  dispatch_sync(v7, block);
  v9 = v14[5];
  if (!v9 || v9 == a3)
  {
    (*((void (**)(id, uint64_t))a4 + 2))(a4, v20[5]);
  }
  else
  {
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke_2;
    v11[3] = &unk_1E30352F0;
    v11[5] = a4;
    v11[6] = &v13;
    v11[4] = self;
    dispatch_async(v9, v11);
  }
  v10 = v14[5];
  if (v10)
    dispatch_release(v10);
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
}

- (id)stateQueue
{
  return self->_resourceLoader->stateQueue;
}

uint64_t __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  BOOL v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t result;
  _QWORD block[6];
  unsigned __int8 v12;

  v12 = 0;
  if (a2 && !*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = (void *)objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", *(_QWORD *)(a1 + 64));
    v5 = (void *)objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v4);
    objc_msgSend(v5, "setSelector:", *(_QWORD *)(a1 + 64));
    objc_msgSend(v5, "setTarget:", a2);
    objc_msgSend(v5, "setArgument:atIndex:", a1 + 32, 2);
    objc_msgSend(v5, "setArgument:atIndex:", a1 + 40, 3);
    objc_msgSend(v5, "invoke");
    if (objc_msgSend(v4, "methodReturnLength") != 1)
    {
      v12 = 1;
      goto LABEL_12;
    }
    objc_msgSend(v5, "getReturnValue:", &v12);
    v6 = v12 == 0;
  }
  else
  {
    v6 = 1;
  }
  if (*(_BYTE *)(a1 + 72))
    v7 = !v6;
  else
    v7 = 1;
  if (!v7)
  {
    v8 = objc_msgSend(*(id *)(a1 + 32), "stateQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke_2;
    block[3] = &unk_1E302FCE8;
    v9 = *(_QWORD *)(a1 + 48);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v9;
    dispatch_sync(v8, block);
  }
LABEL_12:
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, v12);
  return result;
}

intptr_t __68__AVAssetResourceLoader__handleRequest_requestID_willHandleRequest___block_invoke(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_performDelegateSelector:(SEL)a3 withObject:(id)a4 representingNewRequest:(BOOL)a5 key:(id)a6 fallbackHandler:(id)a7
{
  uint64_t v13;
  _QWORD v14[9];
  BOOL v15;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v13 = MEMORY[0x1E0C80D38];
  else
    v13 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke;
  v14[3] = &unk_1E3035318;
  v14[7] = a7;
  v14[8] = a3;
  v14[4] = self;
  v14[5] = a4;
  v15 = a5;
  v14[6] = a6;
  -[AVAssetResourceLoader _performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:delegateCallbackBlock:](self, "_performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:delegateCallbackBlock:", v13, v14);
}

- (OpaqueFigCustomURLLoader)_customURLLoader
{
  return self->_resourceLoader->customURLLoader;
}

uint64_t __114__AVAssetResourceLoader__performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue_delegateCallbackBlock___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_performDelegateCallbackSynchronouslyIfCurrentDelegateQueueIsQueue:delegateCallbackBlock:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 40));
}

- (OpaqueFigCustomURLHandler)_authHandler
{
  return self->_resourceLoader->authHandler;
}

uint64_t __49__AVAssetResourceLoader__noteFinishingOfRequest___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

void __43__AVAssetResourceLoader_setDelegate_queue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 32), "_setDelegateOnStateQueue:", *(_QWORD *)(a1 + 40));
  v2 = *(NSObject **)(a1 + 48);
  if (v2)
    dispatch_retain(v2);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(NSObject **)(v3 + 40);
  if (v4)
  {
    dispatch_release(v4);
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  }
  *(_QWORD *)(v3 + 40) = *(_QWORD *)(a1 + 48);
}

uint64_t __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cacheContentInformation_forURL___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112) = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112);
  }
  return objc_msgSend(v2, "setValue:forKey:", *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "absoluteString"));
}

- (void)cacheContentInformation:(id)a3 forURL:(id)a4
{
  NSObject *contentInformationCachingQueue;
  _QWORD block[7];

  contentInformationCachingQueue = self->_resourceLoader->contentInformationCachingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__AVAssetResourceLoader_AVAssetResourceLoaderContentInformationCache__cacheContentInformation_forURL___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  av_readwrite_dispatch_queue_write(contentInformationCachingQueue, block);
}

- (void)setDelegate:(id)delegate queue:(dispatch_queue_t)delegateQueue
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *stateQueue;
  void *v12;
  uint64_t v13;
  _QWORD block[7];

  if (delegate && !delegateQueue)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("NULL delegateQueue passed"), 0, v4, v5, v6, v7, v13), 0);
    objc_exception_throw(v12);
  }
  -[AVAssetResourceLoader willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegate"));
  -[AVAssetResourceLoader willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("delegateQueue"));
  stateQueue = self->_resourceLoader->stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AVAssetResourceLoader_setDelegate_queue___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = delegate;
  block[6] = delegateQueue;
  dispatch_sync(stateQueue, block);
  -[AVAssetResourceLoader didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegate"));
  -[AVAssetResourceLoader didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("delegateQueue"));
}

- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4 remoteCustomURLHandlerContext:(id)a5
{
  AVAssetResourceLoader *v8;
  AVAssetResourceLoaderInternal *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  AVAssetResourceLoaderInternal *resourceLoader;
  uint64_t CMBaseObject;
  unsigned int (*v15)(uint64_t, _QWORD, _QWORD, OpaqueFigCustomURLLoader **);
  NSObject *v17;
  NSObject *v18;
  uint64_t v19;
  AVAssetResourceLoaderInternal *v20;
  OpaqueFigCustomURLLoader *customURLLoader;
  uint64_t (*v22)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, uint64_t, OpaqueFigCustomURLHandler **);
  int v23;
  NSObject *v24;
  NSObject *v25;
  AVAssetResourceLoaderInternal *v26;
  OpaqueFigCustomURLLoader *v27;
  uint64_t (*v28)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, _QWORD, OpaqueFigCustomURLHandler **);
  int v29;
  objc_super v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v30.receiver = self;
  v30.super_class = (Class)AVAssetResourceLoader;
  v8 = -[AVAssetResourceLoader init](&v30, sel_init);
  if (v8)
  {
    if (!a3)
      goto LABEL_15;
    v9 = objc_alloc_init(AVAssetResourceLoaderInternal);
    v8->_resourceLoader = v9;
    if (!v9)
      goto LABEL_15;
    CFRetain(v9);
    v8->_resourceLoader->URLRequestHelper = (AVAssetClientURLRequestHelper *)a3;
    v8->_resourceLoader->weakReferenceToAsset = (AVWeakReference *)(id)objc_msgSend(a4, "_weakReference");
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v8->_resourceLoader->stateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.state", v10);
    v8->_resourceLoader->pendingRequests = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v8->_resourceLoader->contentInformationCachingQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.contentInformationCaching");
    -[AVAssetClientURLRequestHelper setResourceLoader:](v8->_resourceLoader->URLRequestHelper, "setResourceLoader:", v8);
    v11 = -[AVAssetClientURLRequestHelper figAsset](v8->_resourceLoader->URLRequestHelper, "figAsset");
    if (!v11)
      goto LABEL_15;
    v12 = v11;
    resourceLoader = v8->_resourceLoader;
    CMBaseObject = FigAssetGetCMBaseObject();
    v15 = *(unsigned int (**)(uint64_t, _QWORD, _QWORD, OpaqueFigCustomURLLoader **))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                              + 48);
    if (!v15
      || v15(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &resourceLoader->customURLLoader)
      || !v8->_resourceLoader->customURLLoader)
    {
      goto LABEL_15;
    }
    if (a5)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(a5, "endpoint"))
      {
        if (!FigSignalErrorAt())
          return v8;
        goto LABEL_15;
      }
      if (FigCustomURLHandlerRemoteClientCreateWithXPCEndpoint()
        || avarl_createAndInstallRemoteHandler(objc_msgSend(a5, "customURLHandlerObjectID"), (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 600, &v8->_resourceLoader->customURLHandler)|| avarl_createAndInstallRemoteHandler(objc_msgSend(a5, "authHandlerObjectID"), (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 900, &v8->_resourceLoader->authHandler)|| avarl_createAndInstallRemoteHandler(objc_msgSend(a5, "contentKeySessionHandlerObjectID"), (uint64_t)v8->_resourceLoader->remoteHandlerXPCRemoteClient, (uint64_t)v8->_resourceLoader->customURLLoader, 400, &v8->_resourceLoader->contentKeySessionCustomURLHandler))
      {
LABEL_15:

        return 0;
      }
    }
    else
    {
      v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v18 = dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.handler", v17);
      if (objc_msgSend(a4, "_clientURLLoadingRepresentsAccurateNetworkStatistics"))
      {
        v31 = *MEMORY[0x1E0CA36E0];
        v32[0] = MEMORY[0x1E0C9AAB0];
        v19 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      }
      else
      {
        v19 = MEMORY[0x1E0C9AA70];
      }
      v20 = v8->_resourceLoader;
      customURLLoader = v20->customURLLoader;
      v22 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, uint64_t, OpaqueFigCustomURLHandler **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v22)
        v23 = v22(customURLLoader, 600, "AVAssetResourceLoader", v8, v18, &initWithURLRequestHelper_asset_remoteCustomURLHandlerContext__sHandlerCallbacks, v19, &v20->customURLHandler);
      else
        v23 = -12782;
      if (v18)
        dispatch_release(v18);
      if (v23)
        goto LABEL_15;
      v24 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v25 = dispatch_queue_create("com.apple.avfoundation.avassetresourceloader.authhandler", v24);
      v26 = v8->_resourceLoader;
      v27 = v26->customURLLoader;
      v28 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, uint64_t, const char *, AVAssetResourceLoader *, NSObject *, void *, _QWORD, OpaqueFigCustomURLHandler **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      v29 = v28
          ? v28(v27, 900, "AVAssetResourceLoader-authentication", v8, v25, &initWithURLRequestHelper_asset_remoteCustomURLHandlerContext__sAuthHandlerCallbacks, 0, &v26->authHandler): -12782;
      if (v25)
        dispatch_release(v25);
      if (v29)
        goto LABEL_15;
    }
    v8->_resourceLoader->bridgeBetweenHandlerAndSession = -[AVAssetCustomURLBridgeForNSURLSession initWithFigAsset:]([AVAssetCustomURLBridgeForNSURLSession alloc], "initWithFigAsset:", v12);
    v8->_resourceLoader->URLSessionOperationQueue = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    -[NSOperationQueue setMaxConcurrentOperationCount:](v8->_resourceLoader->URLSessionOperationQueue, "setMaxConcurrentOperationCount:", 1);
  }
  return v8;
}

- (id)asset
{
  return -[AVWeakReference referencedObject](self->_resourceLoader->weakReferenceToAsset, "referencedObject");
}

- (void)_setDelegateOnStateQueue:(id)a3
{
  AVWeakReference *v3;

  v3 = (AVWeakReference *)a3;
  if (a3)
    v3 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);

  self->_resourceLoader->weakReferenceToDelegate = v3;
}

- (void)_setContentKeySessionCustomURLHandler:(OpaqueFigCustomURLHandler *)a3
{
  NSObject *stateQueue;
  _QWORD v4[6];

  stateQueue = self->_resourceLoader->stateQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __63__AVAssetResourceLoader__setContentKeySessionCustomURLHandler___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(stateQueue, v4);
}

- (void)_noteFinishingOfRequest:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD v7[6];

  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(a3, "_requestID"));
  if (v4)
  {
    v5 = v4;
    v6 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__AVAssetResourceLoader__noteFinishingOfRequest___block_invoke;
    v7[3] = &unk_1E302FCE8;
    v7[4] = self;
    v7[5] = v5;
    dispatch_sync(v6, v7);
  }
}

- (AVAssetResourceLoader)init
{
  return -[AVAssetResourceLoader initWithURLRequestHelper:asset:](self, "initWithURLRequestHelper:asset:", 0, 0);
}

- (AVAssetResourceLoader)initWithURLRequestHelper:(id)a3 asset:(id)a4
{
  return -[AVAssetResourceLoader initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:](self, "initWithURLRequestHelper:asset:remoteCustomURLHandlerContext:", a3, a4, 0);
}

- (void)dealloc
{
  AVAssetResourceLoaderInternal *resourceLoader;
  AVAssetResourceLoaderInternal *v4;
  NSObject *stateQueue;
  AVAssetResourceLoaderInternal *v6;
  NSObject *delegateQueue;
  AVAssetResourceLoaderInternal *v8;
  NSObject *contentInformationCachingQueue;
  AVAssetResourceLoaderInternal *v10;
  OpaqueFigCustomURLHandler *authHandler;
  OpaqueFigCustomURLHandler *customURLHandler;
  OpaqueFigCustomURLLoader *customURLLoader;
  OpaqueFigCustomURLHandler *contentKeySessionCustomURLHandler;
  objc_super v15;

  resourceLoader = self->_resourceLoader;
  if (resourceLoader)
  {

    v4 = self->_resourceLoader;
    stateQueue = v4->stateQueue;
    if (stateQueue)
    {
      dispatch_release(stateQueue);
      v4 = self->_resourceLoader;
    }

    v6 = self->_resourceLoader;
    delegateQueue = v6->delegateQueue;
    if (delegateQueue)
    {
      dispatch_release(delegateQueue);
      v6 = self->_resourceLoader;
    }

    v8 = self->_resourceLoader;
    contentInformationCachingQueue = v8->contentInformationCachingQueue;
    if (contentInformationCachingQueue)
    {
      dispatch_release(contentInformationCachingQueue);
      v8 = self->_resourceLoader;
    }

    v10 = self->_resourceLoader;
    authHandler = v10->authHandler;
    if (authHandler)
    {
      CFRelease(authHandler);
      v10 = self->_resourceLoader;
    }
    customURLHandler = v10->customURLHandler;
    if (customURLHandler)
    {
      CFRelease(customURLHandler);
      v10 = self->_resourceLoader;
    }
    customURLLoader = v10->customURLLoader;
    if (customURLLoader)
    {
      CFRelease(customURLLoader);
      v10 = self->_resourceLoader;
    }
    contentKeySessionCustomURLHandler = v10->contentKeySessionCustomURLHandler;
    if (contentKeySessionCustomURLHandler)
      CFRelease(contentKeySessionCustomURLHandler);
    FigXPCRemoteClientDispose();

    CFRelease(self->_resourceLoader);
  }
  v15.receiver = self;
  v15.super_class = (Class)AVAssetResourceLoader;
  -[AVAssetResourceLoader dealloc](&v15, sel_dealloc);
}

- (id)delegate
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__38;
  v11 = __Block_byref_object_dispose__38;
  v12 = 0;
  v3 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __33__AVAssetResourceLoader_delegate__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __33__AVAssetResourceLoader_delegate__block_invoke(uint64_t a1)
{
  id result;

  result = (id)objc_msgSend(*(id *)(a1 + 32), "_getDelegateOnStateQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_getDelegateQueueOnStateQueue
{
  return self->_resourceLoader->delegateQueue;
}

uint64_t __38__AVAssetResourceLoader_delegateQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_getDelegateQueueOnStateQueue");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)URLRequestHelper
{
  return self->_resourceLoader->URLRequestHelper;
}

- (void)cancelLoading
{
  int *p_loadingCancelled;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__38;
  v19 = __Block_byref_object_dispose__38;
  v20 = 0;
  p_loadingCancelled = &self->_resourceLoader->loadingCancelled;
  while (!__ldaxr((unsigned int *)p_loadingCancelled))
  {
    if (!__stlxr(1u, (unsigned int *)p_loadingCancelled))
      goto LABEL_6;
  }
  __clrex();
LABEL_6:
  v5 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__AVAssetResourceLoader_cancelLoading__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(v5, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = (void *)v16[5];
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)v16[5], "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)), "referencedObject"), "_performCancellationByClient");
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v10, v21, 16);
    }
    while (v7);
  }

  _Block_object_dispose(&v15, 8);
}

uint64_t __38__AVAssetResourceLoader_cancelLoading__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "copy");
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "removeAllObjects");
}

uint64_t __104__AVAssetResourceLoader__performDelegateSelector_withObject_representingNewRequest_key_fallbackHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelRequestWithKey:(id)a3 fallbackHandler:(id)a4
{
  NSObject *v7;
  uint64_t v8;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__38;
  v14 = __Block_byref_object_dispose__38;
  v15 = 0;
  v7 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVAssetResourceLoader__cancelRequestWithKey_fallbackHandler___block_invoke;
  block[3] = &unk_1E3030FB8;
  block[5] = a3;
  block[6] = &v10;
  block[4] = self;
  dispatch_sync(v7, block);
  if (objc_msgSend((id)v11[5], "_shouldInformDelegateOfFigCancellation"))
  {
    v8 = objc_msgSend((id)objc_opt_class(), "_selectorForInformingDelegateOfCancellationByFig");
    -[AVAssetResourceLoader _performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:](self, "_performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:", v8, v11[5], 0, a3, a4);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __63__AVAssetResourceLoader__cancelRequestWithKey_fallbackHandler___block_invoke(_QWORD *a1)
{
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = (id)objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8)+ 96), "objectForKey:", a1[5]), "referencedObject");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 96), "removeObjectForKey:", a1[5]);
}

- (void)_cancelRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4
{
  -[AVAssetResourceLoader _cancelRequestWithKey:fallbackHandler:](self, "_cancelRequestWithKey:fallbackHandler:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4), 0);
}

- (void)_poseAuthenticationChallengeWithKey:(id)a3 challenge:(id)a4 fallbackHandler:(id)a5
{
  NSObject *v9;
  _QWORD block[7];

  if (a4)
  {
    v9 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __87__AVAssetResourceLoader__poseAuthenticationChallengeWithKey_challenge_fallbackHandler___block_invoke;
    block[3] = &unk_1E302FD88;
    block[4] = self;
    block[5] = a4;
    block[6] = a3;
    dispatch_sync(v9, block);
    -[AVAssetResourceLoader _performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:](self, "_performDelegateSelector:withObject:representingNewRequest:key:fallbackHandler:", sel_resourceLoader_shouldWaitForResponseToAuthenticationChallenge_, a4, 1, a3, a5);
  }
}

uint64_t __87__AVAssetResourceLoader__poseAuthenticationChallengeWithKey_challenge_fallbackHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96), "setObject:forKey:", objc_msgSend(*(id *)(a1 + 40), "_weakReference"), *(_QWORD *)(a1 + 48));
}

- (void)_poseAuthenticationChallengeWithRequestInfo:(__CFDictionary *)a3 requestID:(unint64_t)a4 challenge:(id)a5
{
  uint64_t v9;
  AVURLAuthenticationChallenge *v10;

  v9 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  if (a5)
    v10 = -[AVURLAuthenticationChallenge initWithAuthenticationChallenge:sender:requestInfo:requestID:]([AVURLAuthenticationChallenge alloc], "initWithAuthenticationChallenge:sender:requestInfo:requestID:", a5, self, a3, a4);
  else
    v10 = 0;
  -[AVAssetResourceLoader _poseAuthenticationChallengeWithKey:challenge:fallbackHandler:](self, "_poseAuthenticationChallengeWithKey:challenge:fallbackHandler:", v9, MEMORY[0x1E0C809B0], 3221225472, __89__AVAssetResourceLoader__poseAuthenticationChallengeWithRequestInfo_requestID_challenge___block_invoke, &unk_1E3035340, self, v10);
}

uint64_t __89__AVAssetResourceLoader__poseAuthenticationChallengeWithRequestInfo_requestID_challenge___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0)
    return objc_msgSend(*(id *)(result + 32), "performDefaultHandlingForAuthenticationChallenge:", *(_QWORD *)(result + 40));
  return result;
}

void __63__AVAssetResourceLoader__setContentKeySessionCustomURLHandler___block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  uint64_t v3;
  const void *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(_QWORD *)(v2 + 8);
  v4 = *(const void **)(v3 + 72);
  *(_QWORD *)(v3 + 72) = v1;
  if (v1)
    CFRetain(v1);
  if (v4)
    CFRelease(v4);
}

- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler
{
  NSObject *stateQueue;
  OpaqueFigCustomURLHandler *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __63__AVAssetResourceLoader__copyContentKeySessionCustomURLHandler__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (OpaqueFigCustomURLHandler *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __63__AVAssetResourceLoader__copyContentKeySessionCustomURLHandler__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)preloadsEligibleContentKeys
{
  AVAssetResourceLoader *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __92__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__preloadsEligibleContentKeys__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __92__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__preloadsEligibleContentKeys__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 120);
  return result;
}

- (void)setPreloadsEligibleContentKeys:(BOOL)preloadsEligibleContentKeys
{
  NSObject *v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __96__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__setPreloadsEligibleContentKeys___block_invoke;
  v6[3] = &unk_1E302FD38;
  v7 = preloadsEligibleContentKeys;
  v6[4] = self;
  dispatch_sync(v5, v6);
}

_QWORD *__96__AVAssetResourceLoader_AVAssetResourceLoaderContentKeySupport__setPreloadsEligibleContentKeys___block_invoke(uint64_t a1)
{
  int v2;
  _QWORD *result;
  int v4;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;

  v2 = *(unsigned __int8 *)(a1 + 40);
  result = *(_QWORD **)(a1 + 32);
  if (v2 != *(unsigned __int8 *)(result[1] + 120))
  {
    objc_msgSend((id)objc_msgSend(result, "URLRequestHelper"), "figAsset");
    v4 = *(unsigned __int8 *)(a1 + 40);
    CMBaseObject = FigAssetGetCMBaseObject();
    result = (_QWORD *)CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result[1] + 56);
    if (v6)
    {
      if (v4)
        v7 = *MEMORY[0x1E0C9AE50];
      else
        v7 = *MEMORY[0x1E0C9AE40];
      result = (_QWORD *)v6(CMBaseObject, *MEMORY[0x1E0CC3A98], v7);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 120) = *(_BYTE *)(a1 + 40);
  }
  return result;
}

- (void)_sendAuthResponseForChallenge:(id)a3 disposition:(int64_t)a4 credential:(id)a5 error:(id)a6
{
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const __CFString *v19;
  void *v20;
  uint64_t v21;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = (void *)MEMORY[0x1E0C99DA0];
    v12 = *MEMORY[0x1E0C99778];
    v13 = (objc_class *)objc_opt_class();
    v19 = CFSTR("The specified challenge must be an instance of NSURLAuthenticationChallenge previously provided by AVAssetResourceLoader");
    goto LABEL_7;
  }
  if (a5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v11 = (void *)MEMORY[0x1E0C99DA0];
      v12 = *MEMORY[0x1E0C99778];
      v13 = (objc_class *)objc_opt_class();
      v19 = CFSTR("The specified credential must be an instance of NSURLCredential");
LABEL_7:
      v20 = (void *)objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, AVMethodExceptionReasonWithClassAndSelector(v13, a2, (uint64_t)v19, v14, v15, v16, v17, v18, v21), 0);
      objc_exception_throw(v20);
    }
  }
  +[AVAssetCustomURLAuthentication sendAuthResponse:requestID:disposition:credential:authHandler:](AVAssetCustomURLAuthentication, "sendAuthResponse:requestID:disposition:credential:authHandler:", objc_msgSend(a3, "_requestInfo"), objc_msgSend(a3, "_requestID"), a4, a5, -[AVAssetResourceLoader _authHandler](self, "_authHandler"));
  -[AVAssetResourceLoader _noteFinishingOfRequest:](self, "_noteFinishingOfRequest:", a3);
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a4, 0, a3, 0);
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a3, 2, 0, objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -1012, 0));
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a3, 0, 0, 0);
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a3, 3, 0, 0);
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  id v5;
  void *v6;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend(a3, "_requestInfo"), !FigCustomURLRequestInfoCopyURL())
    && (v5 = +[AVAssetCustomURLAuthentication copyKeychainCredentialForUrl:](AVAssetCustomURLAuthentication, "copyKeychainCredentialForUrl:", 0)) != 0)
  {
    v6 = v5;
    -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a3, 0, v5, 0);
  }
  else
  {
    -[AVAssetResourceLoader _sendAuthResponseForChallenge:disposition:credential:error:](self, "_sendAuthResponseForChallenge:disposition:credential:error:", a3, 3, 0, 0);
    v6 = 0;
  }

}

- (NSURLSessionDataDelegate)URLSessionDataDelegate
{
  return (NSURLSessionDataDelegate *)self->_resourceLoader->bridgeBetweenHandlerAndSession;
}

- (NSOperationQueue)URLSessionDataDelegateQueue
{
  return self->_resourceLoader->URLSessionOperationQueue;
}

- (NSURLSession)URLSession
{
  NSObject *stateQueue;
  NSURLSession *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  stateQueue = self->_resourceLoader->stateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __75__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__URLSession__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  v3 = (NSURLSession *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __75__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__URLSession__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 144);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setURLSession:(id)a3
{
  NSObject *stateQueue;
  _QWORD v6[6];

  stateQueue = self->_resourceLoader->stateQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __79__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__setURLSession___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = a3;
  v6[5] = self;
  dispatch_sync(stateQueue, v6);
  if (objc_msgSend(-[AVAssetResourceLoader asset](self, "asset"), "_figAsset"))
    -[AVAssetCustomURLBridgeForNSURLSession setSession:](self->_resourceLoader->bridgeBetweenHandlerAndSession, "setSession:", a3);
}

void __79__AVAssetResourceLoader_AVAssetResourceLoaderURLSessionSupport__setURLSession___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 144) = *(_QWORD *)(a1 + 32);
}

- (id)remoteCustomURLHandlerContextForPID:(int)a3
{
  int v4;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  AVAssetResourceLoaderInternal *resourceLoader;
  AVAssetResourceLoaderRemoteHandlerContext *v8;
  AVAssetResourceLoaderRemoteHandlerContext *v9;
  int v10;
  CFTypeRef cf;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = 0;
  v16 = 0;
  v13 = 0;
  v14 = 0;
  cf = 0;
  v4 = FigCustomURLHandlerServerEnsure();
  if (!v4)
  {
    v4 = FigCustomURLHandlerServerCopyXPCEndpoint();
    if (!v4)
    {
      objc_msgSend(-[AVAssetResourceLoader URLRequestHelper](self, "URLRequestHelper"), "figAsset");
      CMBaseObject = FigAssetGetCMBaseObject();
      v6 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (!v6)
      {
        v9 = 0;
        v10 = -12782;
        goto LABEL_15;
      }
      v4 = v6(CMBaseObject, *MEMORY[0x1E0CC39A8], *MEMORY[0x1E0C9AE00], &cf);
      if (!v4)
      {
        resourceLoader = self->_resourceLoader;
        if (resourceLoader->customURLHandler)
        {
          v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID();
          if (v4)
            goto LABEL_21;
          resourceLoader = self->_resourceLoader;
        }
        if (!resourceLoader->authHandler)
        {
LABEL_11:
          if (!resourceLoader->contentKeySessionCustomURLHandler
            || (v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID()) == 0)
          {
            v8 = [AVAssetResourceLoaderRemoteHandlerContext alloc];
            v9 = -[AVAssetResourceLoaderRemoteHandlerContext initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:](v8, "initWithEndpoint:customURLHandlerObjectID:authHandlerObjectID:contentKeySessionHandlerObjectID:", v16, v15, v14, v13);
            v10 = 0;
            goto LABEL_15;
          }
          goto LABEL_21;
        }
        v4 = FigCustomURLHandlerServerAssociateObjectAndContentKeySessionByPID();
        if (!v4)
        {
          resourceLoader = self->_resourceLoader;
          goto LABEL_11;
        }
      }
    }
  }
LABEL_21:
  v10 = v4;
  v9 = 0;
LABEL_15:
  FigXPCRelease();
  if (cf)
    CFRelease(cf);
  if (v10)
    return 0;
  else
    return v9;
}

- (BOOL)sendsCommonMediaClientDataAsHTTPHeaders
{
  AVAssetResourceLoader *v2;
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v3 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __115__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__sendsCommonMediaClientDataAsHTTPHeaders__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(v3, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __115__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__sendsCommonMediaClientDataAsHTTPHeaders__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 136);
  return result;
}

- (void)setSendsCommonMediaClientDataAsHTTPHeaders:(BOOL)a3
{
  uint64_t v3;
  NSObject *v5;
  _QWORD v6[5];
  char v7;

  v3 = a3;
  v5 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __119__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__setSendsCommonMediaClientDataAsHTTPHeaders___block_invoke;
  v6[3] = &unk_1E302FD38;
  v6[4] = self;
  v7 = v3;
  dispatch_sync(v5, v6);
  -[AVAssetResourceLoader setAllowedCommonMediaClientDataKeys:](self, "setAllowedCommonMediaClientDataKeys:", v3 << 63 >> 63);
}

uint64_t __119__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport__setSendsCommonMediaClientDataAsHTTPHeaders___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 136) = *(_BYTE *)(result + 40);
  return result;
}

- (unint64_t)allowedCommonMediaClientDataKeys
{
  NSObject *v3;
  unint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __116__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__allowedCommonMediaClientDataKeys__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __116__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__allowedCommonMediaClientDataKeys__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 128);
  return result;
}

- (void)setAllowedCommonMediaClientDataKeys:(unint64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  v5 = -[AVAssetResourceLoader stateQueue](self, "stateQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __120__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__setAllowedCommonMediaClientDataKeys___block_invoke;
  v6[3] = &unk_1E302FE78;
  v6[4] = self;
  v6[5] = a3;
  dispatch_sync(v5, v6);
}

_QWORD *__120__AVAssetResourceLoader_AVAssetResourceLoaderCommonMediaClientDataSupport_Private__setAllowedCommonMediaClientDataKeys___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t);

  v3 = a1 + 32;
  result = *(_QWORD **)(a1 + 32);
  if (*(_QWORD *)(v3 + 8) != *(_QWORD *)(result[1] + 128))
  {
    v4 = objc_msgSend(result, "_customURLLoader");
    v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 40));
    result = (_QWORD *)CMBaseObjectGetVTable();
    v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result[1] + 56);
    if (v6)
      result = (_QWORD *)v6(v4, *MEMORY[0x1E0CA36F8], v5);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128) = *(_QWORD *)(a1 + 40);
  }
  return result;
}

@end
