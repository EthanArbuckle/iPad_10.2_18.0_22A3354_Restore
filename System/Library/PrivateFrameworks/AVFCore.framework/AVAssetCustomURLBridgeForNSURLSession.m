@implementation AVAssetCustomURLBridgeForNSURLSession

- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4 canHandleRequestOut:(BOOL *)a5
{
  int v9;
  uint64_t v10;
  uint64_t v11;
  OpaqueFigCustomURLHandler *handler;
  CFTypeRef v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  NSURLSessionDataTask *v18;
  NSURLSessionDataTask *v19;
  int v20;
  BOOL v21;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[7];
  _QWORD v26[5];
  char v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  id v31;

  v30 = 0;
  v31 = 0;
  v28 = 0;
  v29 = 0;
  v27 = 0;
  if (!-[AVAssetCustomURLBridgeForNSURLSession session](self, "session"))
    goto LABEL_25;
  v9 = FigCustomURLRequestInfoCopyURL();
  if (v9)
  {
    v20 = v9;
    goto LABEL_23;
  }
  FigCustomURLRequestInfoGetIsPingRequest();
  v10 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke;
  v26[3] = &unk_1E3033F70;
  v26[4] = v31;
  if (objc_msgSend(&unk_1E3093BC8, "indexOfObjectPassingTest:", v26) == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_25:
    v21 = 0;
    v20 = 0;
    goto LABEL_24;
  }
  if (!v27)
  {
    v14 = objc_alloc(MEMORY[0x1E0C92C28]);
    v15 = (id)objc_msgSend(v14, "initWithURL:", v31);
    if (!v15)
      goto LABEL_27;
    v16 = v15;
    objc_msgSend(v15, "setValue:forHTTPHeaderField:", CFSTR("*/*"), CFSTR("Accept"));
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("identity"), CFSTR("Accept-Encoding"));
    objc_msgSend(v16, "setValue:forHTTPHeaderField:", CFSTR("Keep-Alive"), CFSTR("Connection"));
    if (!FigCustomURLRequestInfoCopyHTTPHeaders())
    {
      v24[0] = v10;
      v24[1] = 3221225472;
      v24[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_3;
      v24[3] = &unk_1E30320B0;
      v24[4] = v16;
      objc_msgSend(v28, "enumerateKeysAndObjectsUsingBlock:", v24);
    }
    if (!FigCustomURLRequestInfoGetByteRange())
    {
      if ((unint64_t)(v29 - 0x7FFFFFFFFFFFFFFFLL) > 0x8000000000000001)
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%llu-%llu"), v30, v29 + v30 - 1);
      else
        v17 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%llu-"), v30, v23);
      objc_msgSend(v16, "setValue:forHTTPHeaderField:", v17, CFSTR("Range"));
    }
    v18 = -[NSURLSession dataTaskWithRequest:](-[AVAssetCustomURLBridgeForNSURLSession session](self, "session"), "dataTaskWithRequest:", v16);
    if (!v18)
    {
LABEL_27:
      v20 = -12786;
      goto LABEL_23;
    }
    v19 = v18;
    -[AVAssetCustomURLBridgeForNSURLSession _registerRequest:id:forDataTask:](self, "_registerRequest:id:forDataTask:", a3, a4, v18);
    -[NSURLSessionDataTask resume](v19, "resume");
    goto LABEL_22;
  }
  -[AVAssetCustomURLBridgeForNSURLSession session](self, "session");
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = objc_msgSend(v31, "absoluteURL");
    handler = self->_handler;
    if (handler)
    {
      v13 = CFRetain(handler);
      if (!a3)
      {
LABEL_9:
        v25[0] = v10;
        v25[1] = 3221225472;
        v25[2] = __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_2;
        v25[3] = &__block_descriptor_56_e20_v24__0__NSError_8d16l;
        v25[4] = a3;
        v25[5] = v13;
        v25[6] = a4;
        -[NSURLSession sendH2Ping:pongHandler:](-[AVAssetCustomURLBridgeForNSURLSession session](self, "session"), "sendH2Ping:pongHandler:", v11, v25);
        goto LABEL_22;
      }
    }
    else
    {
      v13 = 0;
      if (!a3)
        goto LABEL_9;
    }
    CFRetain(a3);
    goto LABEL_9;
  }
LABEL_22:
  v20 = 0;
LABEL_23:
  v21 = 1;
LABEL_24:

  *a5 = v21;
  return v20;
}

- (NSURLSession)session
{
  return self->_session;
}

- (AVAssetCustomURLBridgeForNSURLSession)initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVAssetCustomURLBridgeForNSURLSession *v4;
  NSObject *v5;
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v8;
  uint64_t v9;
  CFTypeRef v10;
  OS_dispatch_queue *callbackQueue;
  uint64_t (*v12)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLSession *, OS_dispatch_queue *, void *, uint64_t, OpaqueFigCustomURLHandler **);
  int v13;
  objc_super v15;
  CFTypeRef cf;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v15.receiver = self;
  v15.super_class = (Class)AVAssetCustomURLBridgeForNSURLSession;
  cf = 0;
  v4 = -[AVAssetCustomURLBridgeForNSURLSession init](&v15, sel_init);
  if (v4)
  {
    if (a3)
    {
      v4->_taskToRequest = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.customurl.nsurlsession", v5);
      CMBaseObject = FigAssetGetCMBaseObject();
      v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v7)
      {
        v8 = v7(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &cf);
        if (v8)
        {
LABEL_7:
          v13 = v8;
          goto LABEL_10;
        }
        v17 = *MEMORY[0x1E0CA36E0];
        v18[0] = MEMORY[0x1E0C9AAB0];
        v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
        v10 = cf;
        callbackQueue = v4->_callbackQueue;
        v12 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLSession *, OS_dispatch_queue *, void *, uint64_t, OpaqueFigCustomURLHandler **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
        if (v12)
        {
          v8 = v12(v10, 1000, "com.apple.avfoundation.customurl.nsurlsession", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLCallbacksForNSURLSession, v9, &v4->_handler);
          goto LABEL_7;
        }
      }
    }
    v13 = -12780;
  }
  else
  {
    v13 = 0;
  }
LABEL_10:
  if (cf)
    CFRelease(cf);
  if (v13)
  {

    return 0;
  }
  return v4;
}

- (void)_registerRequest:(__CFDictionary *)a3 id:(unint64_t)a4 forDataTask:(id)a5
{
  -[NSMutableDictionary setObject:forKey:](self->_taskToRequest, "setObject:forKey:", +[AVAssetCustomURLRequest requestWithRequest:id:](AVAssetCustomURLRequest, "requestWithRequest:id:", a3, a4), a5);
}

- (void)_unregisterRequestForDataTask:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_taskToRequest, "removeObjectForKey:", a3);
}

- (id)_lookupRequestForDataTask:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_taskToRequest, "objectForKey:", a3);
}

BOOL __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "scheme"), "caseInsensitiveCompare:", a2) == 0;
}

void __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t, _QWORD);
  const void *v10;
  const void *v11;

  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetRoundTripTime())
  {
    v4 = a1[5];
    v5 = a1[6];
    v6 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
    {
      if (!v6(v4, v5, 0))
      {
        v7 = a1[5];
        v8 = a1[6];
        v9 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v9)
          v9(v7, v8, a2, 0);
      }
    }
  }
  v10 = (const void *)a1[4];
  if (v10)
    CFRelease(v10);
  v11 = (const void *)a1[5];
  if (v11)
    CFRelease(v11);
}

uint64_t __86__AVAssetCustomURLBridgeForNSURLSession__handleRequest_requestID_canHandleRequestOut___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setValue:forHTTPHeaderField:", a3, a2);
}

- (int)_cancelRequestID:(unint64_t)a3
{
  NSMutableDictionary *taskToRequest;
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
  v10 = __Block_byref_object_copy__23;
  v11 = __Block_byref_object_dispose__23;
  v12 = 0;
  taskToRequest = self->_taskToRequest;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__AVAssetCustomURLBridgeForNSURLSession__cancelRequestID___block_invoke;
  v6[3] = &unk_1E3033FB8;
  v6[4] = &v7;
  v6[5] = a3;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](taskToRequest, "enumerateKeysAndObjectsUsingBlock:", v6);
  if (v8[5])
    -[AVAssetCustomURLBridgeForNSURLSession _unregisterRequestForDataTask:](self, "_unregisterRequestForDataTask:");
  _Block_object_dispose(&v7, 8);
  return 0;
}

uint64_t __58__AVAssetCustomURLBridgeForNSURLSession__cancelRequestID___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a3, "requestID");
  if (result == *(_QWORD *)(a1 + 40))
  {
    result = objc_msgSend(a2, "cancel");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = a2;
    *a4 = 1;
  }
  return result;
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  NSObject *callbackQueue;
  _QWORD v7[8];

  callbackQueue = self->_callbackQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __98__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v7[3] = &unk_1E3033FE0;
  v7[4] = self;
  v7[5] = a4;
  v7[6] = a5;
  v7[7] = a6;
  dispatch_async(callbackQueue, v7);
}

void __98__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int Mutable;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, _QWORD);
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "_lookupRequestForDataTask:", *(_QWORD *)(a1 + 40));
  if (!v2)
    goto LABEL_20;
  v3 = v2;
  objc_msgSend(v2, "customURLRequest");
  Mutable = FigCustomURLResponseInfoCreateMutable();
  if (Mutable)
    goto LABEL_21;
  objc_msgSend(v3, "setCustomURLResponse:", 0);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 48), "statusCode");
    Mutable = FigCustomURLResponseInfoSetHTTPStatusCode();
    if (Mutable)
      goto LABEL_21;
    v5 = *(void **)(a1 + 48);
    v15 = 0;
    v13 = 0;
    v14 = 0;
    v6 = objc_msgSend((id)objc_msgSend(v5, "allHeaderFields"), "valueForKey:", CFSTR("Content-Range"));
    if (v6 && (avacu_getLengthsfromContentRange(v6, &v14, &v13, &v15) & 1) != 0)
    {
      v7 = v15;
    }
    else
    {
      if (objc_msgSend(v5, "expectedContentLength") < 0)
        goto LABEL_13;
      v7 = 1;
    }
    Mutable = FigCustomURLResponseInfoSetContentLength();
    if (Mutable)
      goto LABEL_21;
    if (v7)
    {
      Mutable = FigCustomURLResponseInfoSetResourceSize();
      if (Mutable)
        goto LABEL_21;
    }
LABEL_13:
    objc_msgSend(*(id *)(a1 + 48), "allHeaderFields");
    Mutable = FigCustomURLResponseInfoSetHTTPHeaders();
    if (Mutable)
      goto LABEL_21;
  }
  objc_msgSend(*(id *)(a1 + 48), "URL");
  Mutable = FigCustomURLResponseInfoSetFinalURL();
  if (Mutable)
    goto LABEL_21;
  Mutable = FigCustomURLResponseInfoSetIsCachingDisabled();
  if (Mutable)
    goto LABEL_21;
  v8 = (void *)objc_msgSend(*(id *)(a1 + 48), "MIMEType");
  if (objc_msgSend(v8, "length"))
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", v8), "identifier");
    Mutable = FigCustomURLResponseInfoSetUniversalTypeIdentifier();
    if (Mutable)
      goto LABEL_21;
  }
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
  v10 = objc_msgSend(v3, "requestID");
  v11 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v11)
  {
    Mutable = v11(v9, v10, 0);
    goto LABEL_21;
  }
LABEL_20:
  Mutable = -111;
LABEL_21:
  v12 = *(_QWORD *)(a1 + 56);
  if (v12)
    (*(void (**)(_QWORD, BOOL))(v12 + 16))(*(_QWORD *)(a1 + 56), Mutable == 0);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  NSObject *callbackQueue;
  _QWORD block[7];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveData___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

void __76__AVAssetCustomURLBridgeForNSURLSession_URLSession_dataTask_didReceiveData___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, _QWORD);

  v2 = objc_msgSend(*(id *)(a1 + 32), "_lookupRequestForDataTask:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (void *)v2;
    if (!FigCreateBlockBufferWithCFDataNoCopy())
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      v5 = objc_msgSend(v3, "requestID");
      v6 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v6)
        v6(v4, v5, 0);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  NSObject *callbackQueue;
  _QWORD block[7];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

uint64_t __84__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didFinishCollectingMetrics___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "_lookupRequestForDataTask:", *(_QWORD *)(a1 + 40)), "setMetrics:", *(_QWORD *)(a1 + 48));
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSObject *callbackQueue;
  _QWORD block[7];

  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didCompleteWithError___block_invoke;
  block[3] = &unk_1E302FD88;
  block[4] = self;
  block[5] = a4;
  block[6] = a5;
  dispatch_async(callbackQueue, block);
}

uint64_t __78__AVAssetCustomURLBridgeForNSURLSession_URLSession_task_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, void *);

  v2 = objc_msgSend(*(id *)(a1 + 32), "_lookupRequestForDataTask:", *(_QWORD *)(a1 + 40));
  if (v2)
  {
    v3 = (void *)v2;
    v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v3, "metrics"), "transactionMetrics"), "firstObject");
    v6 = objc_msgSend(v5, "networkProtocolName");
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0CA36E8]);
    v7 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v5, "_privacyStance"));
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CA36F0]);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v9 = objc_msgSend(v3, "requestID");
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(void (**)(uint64_t, uint64_t, uint64_t, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v11)
      v11(v8, v9, v10, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_unregisterRequestForDataTask:", *(_QWORD *)(a1 + 40));
}

- (void)URLSession:(id)a3 dataTask:(id)a4 willCacheResponse:(id)a5 completionHandler:(id)a6
{
  if (a6)
    (*((void (**)(id, _QWORD))a6 + 2))(a6, 0);
}

- (AVAssetCustomURLBridgeForNSURLSession)init
{

  return 0;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  OpaqueFigCustomURLHandler *handler;
  objc_super v5;

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  handler = self->_handler;
  if (handler)
    CFRelease(handler);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLBridgeForNSURLSession;
  -[AVAssetCustomURLBridgeForNSURLSession dealloc](&v5, sel_dealloc);
}

- (void)setSession:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
