@implementation AVAssetCustomURLBridgeForNSURLProtocol

- (AVAssetCustomURLBridgeForNSURLProtocol)initWithFigAsset:(OpaqueFigAsset *)a3
{
  AVAssetCustomURLBridgeForNSURLProtocol *v4;
  NSObject *v5;
  uint64_t CMBaseObject;
  uint64_t (*v7)(uint64_t, _QWORD, _QWORD, CFTypeRef *);
  int v8;
  CFTypeRef v9;
  OS_dispatch_queue *callbackQueue;
  uint64_t (*v11)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLProtocol *, OS_dispatch_queue *, void *, _QWORD, OpaqueFigCustomURLHandler **);
  int v12;
  objc_super v14;
  CFTypeRef cf;

  v14.receiver = self;
  v14.super_class = (Class)AVAssetCustomURLBridgeForNSURLProtocol;
  cf = 0;
  v4 = -[AVAssetCustomURLBridgeForNSURLProtocol init](&v14, sel_init);
  if (v4)
  {
    if (a3)
    {
      v4->_requestIDToDownload = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.customurl.cfurlconnection", v5);
      CMBaseObject = FigAssetGetCMBaseObject();
      v7 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 48);
      if (v7)
      {
        v8 = v7(CMBaseObject, *MEMORY[0x1E0CC39A0], *MEMORY[0x1E0C9AE00], &cf);
        if (v8)
        {
LABEL_7:
          v12 = v8;
          goto LABEL_10;
        }
        v9 = cf;
        callbackQueue = v4->_callbackQueue;
        v11 = *(uint64_t (**)(CFTypeRef, uint64_t, const char *, AVAssetCustomURLBridgeForNSURLProtocol *, OS_dispatch_queue *, void *, _QWORD, OpaqueFigCustomURLHandler **))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
        if (v11)
        {
          v8 = v11(v9, 100, "com.apple.avfoundation.customurl.cfurlconnection", v4, callbackQueue, &initWithFigAsset__sAVAssetCustomURLCallbacksForNSURLSession_206, 0, &v4->_handler);
          goto LABEL_7;
        }
      }
    }
    v12 = -12780;
  }
  else
  {
    v12 = 0;
  }
LABEL_10:
  if (cf)
    CFRelease(cf);
  if (v12)
  {

    return 0;
  }
  return v4;
}

- (void)dealloc
{
  NSObject *callbackQueue;
  OpaqueFigCustomURLHandler *handler;
  objc_super v5;

  -[AVAssetCustomURLBridgeForNSURLProtocol _cancelPendingRequests](self, "_cancelPendingRequests");

  callbackQueue = self->_callbackQueue;
  if (callbackQueue)
    dispatch_release(callbackQueue);
  handler = self->_handler;
  if (handler)
    CFRelease(handler);
  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLBridgeForNSURLProtocol;
  -[AVAssetCustomURLBridgeForNSURLProtocol dealloc](&v5, sel_dealloc);
}

- (void)_cancelPendingRequests
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB32E8], -999, 0);
  v4 = (void *)-[NSMutableDictionary allValues](self->_requestIDToDownload, "allValues");
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[AVAssetCustomURLBridgeForNSURLProtocol _cancelAndFinishRequest:error:](self, "_cancelAndFinishRequest:error:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), v3);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }
}

- (void)reportSuccessfulURLLoad
{
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"), "bundleIdentifier");
  FigCAStatsReportingSubmitData();
}

- (int)_handleRequest:(__CFDictionary *)a3 requestID:(unint64_t)a4
{
  int v7;
  AVNSURLProtocolRequest *v8;
  const __CFAllocator *v9;
  CFHTTPMessageRef Request;
  const __CFString *v11;
  uint64_t HTTPRequest;
  const void *v13;
  uint64_t v14;
  const void *v15;
  int v16;

  v7 = FigCustomURLRequestInfoCopyURL();
  if (v7)
  {
    v16 = v7;
    v8 = 0;
    Request = 0;
    v11 = 0;
LABEL_25:

    goto LABEL_16;
  }
  v8 = -[AVAssetCustomURLRequest initWithRequest:id:]([AVNSURLProtocolRequest alloc], "initWithRequest:id:", a3, a4);
  if (!v8)
  {
    Request = 0;
    goto LABEL_23;
  }
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Request = CFHTTPMessageCreateRequest((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("GET"), 0, (CFStringRef)*MEMORY[0x1E0C930E8]);
  if (!Request)
  {
LABEL_23:
    v11 = 0;
    goto LABEL_24;
  }
  if (!FigCustomURLRequestInfoCopyHTTPHeaders())
    CFDictionaryApplyFunction(0, (CFDictionaryApplierFunction)SetHeaderFieldToCFHTTPMessageApplierFunc, Request);
  if (!FigCustomURLRequestInfoCopyUserAgent())
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("User-Agent"), 0);
  if (FigCustomURLRequestInfoGetByteRange())
  {
    v11 = 0;
  }
  else
  {
    v11 = CFStringCreateWithFormat(v9, 0, CFSTR("bytes=%llu-%llu"), 0, -1);
    if (!v11)
    {
LABEL_24:
      v16 = -12786;
      goto LABEL_25;
    }
    CFHTTPMessageSetHeaderFieldValue(Request, CFSTR("Range"), v11);
  }
  CFURLGetBaseURL(0);
  HTTPRequest = CFURLRequestCreateHTTPRequest();
  if (!HTTPRequest)
    goto LABEL_24;
  v13 = (const void *)HTTPRequest;
  v14 = CFURLConnectionCreate();
  if (v14)
  {
    v15 = (const void *)v14;
    -[AVNSURLProtocolRequest setConnection:](v8, "setConnection:", v14);
    -[AVNSURLProtocolRequest setBridge:](v8, "setBridge:", self);
    -[NSMutableDictionary setObject:forKey:](self->_requestIDToDownload, "setObject:forKey:", v8, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4));
    FigThreadGetGlobalNetworkBufferingRunloop();
    CFURLConnectionScheduleWithRunLoop();
    CFURLConnectionStart();

    CFRelease(v15);
    v16 = 0;
  }
  else
  {

    v16 = -12786;
  }
  CFRelease(v13);
LABEL_16:
  if (v11)
    CFRelease(v11);
  if (Request)
    CFRelease(Request);
  return v16;
}

- (void)_cancelRequestID:(unint64_t)a3
{
  void *v5;

  v5 = (void *)-[NSMutableDictionary objectForKey:](self->_requestIDToDownload, "objectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:"));
  if (v5)
  {
    objc_msgSend(v5, "connection");
    CFURLConnectionCancel();
    -[NSMutableDictionary removeObjectForKey:](self->_requestIDToDownload, "removeObjectForKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3));
  }
}

- (void)_cancelAndFinishRequest:(id)a3 error:(__CFError *)a4
{
  OpaqueFigCustomURLHandler *handler;
  uint64_t v8;
  void (*v9)(OpaqueFigCustomURLHandler *, uint64_t, __CFError *, _QWORD);

  -[AVAssetCustomURLBridgeForNSURLProtocol _cancelRequestID:](self, "_cancelRequestID:", objc_msgSend(a3, "requestID"));
  handler = self->_handler;
  v8 = objc_msgSend(a3, "requestID");
  v9 = *(void (**)(OpaqueFigCustomURLHandler *, uint64_t, __CFError *, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 24);
  if (v9)
    v9(handler, v8, a4, 0);
}

- (void)_didFinish:(id)a3 error:(__CFError *)a4
{
  NSObject *callbackQueue;
  _QWORD block[7];

  if (a4)
    CFRetain(a4);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVAssetCustomURLBridgeForNSURLProtocol__didFinish_error___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(callbackQueue, block);
}

void __59__AVAssetCustomURLBridgeForNSURLProtocol__didFinish_error___block_invoke(uint64_t a1)
{
  const void *v2;

  objc_msgSend(*(id *)(a1 + 32), "_cancelAndFinishRequest:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
}

- (BOOL)_willSendRequest:(id)a3 request:(_CFURLRequest *)a4 redirectionResponse:(_CFURLResponse *)a5
{
  uint64_t URL;
  BOOL v10;
  BOOL v11;
  const void *v12;
  NSObject *callbackQueue;
  _QWORD v15[8];

  URL = CFURLRequestGetURL();
  if (a5)
    v10 = URL == 0;
  else
    v10 = 1;
  v11 = !v10;
  if (!v10)
  {
    v12 = (const void *)URL;
    if (a4)
      CFRetain(a4);
    CFRetain(v12);
    callbackQueue = self->_callbackQueue;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __87__AVAssetCustomURLBridgeForNSURLProtocol__willSendRequest_request_redirectionResponse___block_invoke;
    v15[3] = &unk_1E3031B58;
    v15[6] = v12;
    v15[7] = a4;
    v15[4] = self;
    v15[5] = a3;
    dispatch_async(callbackQueue, v15);
  }
  return v11;
}

void __87__AVAssetCustomURLBridgeForNSURLProtocol__willSendRequest_request_redirectionResponse___block_invoke(uint64_t a1)
{
  CFURLRef v2;
  const void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int (*v6)(uint64_t, uint64_t, _QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, _QWORD, _QWORD);
  const void *v10;
  const void *v11;

  v2 = CFURLCopyAbsoluteURL(*(CFURLRef *)(a1 + 48));
  v3 = (const void *)CFURLRequestCopyAllHTTPHeaderFields();
  objc_msgSend(*(id *)(a1 + 32), "_cancelRequestID:", objc_msgSend(*(id *)(a1 + 40), "requestID"));
  objc_msgSend(*(id *)(a1 + 40), "customURLRequest");
  if (!FigCustomURLResponseInfoCreateMutable()
    && !FigCustomURLResponseInfoSetHTTPStatusCode()
    && !FigCustomURLResponseInfoSetHTTPHeaders()
    && !FigCustomURLResponseInfoSetRedirectLocation()
    && !FigCustomURLResponseInfoSetRedirectRequestHeaders())
  {
    objc_msgSend(*(id *)(a1 + 40), "setCustomURLResponse:", 0);
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = objc_msgSend(*(id *)(a1 + 40), "requestID");
    v6 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
    if (v6)
    {
      if (!v6(v4, v5, 0))
      {
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
        v8 = objc_msgSend(*(id *)(a1 + 40), "requestID");
        v9 = *(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
        if (v9)
          v9(v7, v8, 0, 0);
      }
    }
  }
  if (v2)
    CFRelease(v2);
  if (v3)
    CFRelease(v3);
  v10 = *(const void **)(a1 + 56);
  if (v10)
    CFRelease(v10);
  v11 = *(const void **)(a1 + 48);
  if (v11)
    CFRelease(v11);
}

- (void)_didReceiveResponse:(id)a3 response:(_CFURLResponse *)a4
{
  NSObject *callbackQueue;
  _QWORD block[7];

  if (a4)
    CFRetain(a4);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveResponse_response___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[5] = self;
  block[6] = a4;
  block[4] = a3;
  dispatch_async(callbackQueue, block);
}

void __71__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveResponse_response___block_invoke(uint64_t a1)
{
  __CFHTTPMessage *HTTPResponse;
  __CFHTTPMessage *v3;
  CFStringRef v4;
  CFStringRef v5;
  char v6;
  __CFString *v7;
  int v8;
  CFDictionaryRef v9;
  int v10;
  void *MIMEType;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, _QWORD);
  const void *v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 v18;

  objc_msgSend(*(id *)(a1 + 32), "customURLRequest");
  if (FigCustomURLResponseInfoCreateMutable())
    goto LABEL_26;
  HTTPResponse = (__CFHTTPMessage *)CFURLResponseGetHTTPResponse();
  if (!HTTPResponse)
    goto LABEL_20;
  v3 = HTTPResponse;
  v18 = 0;
  v16 = 0;
  v17 = 0;
  v4 = CFHTTPMessageCopyHeaderFieldValue(HTTPResponse, CFSTR("Content-Range"));
  v5 = v4;
  if (v4)
  {
    if ((avacu_getLengthsfromContentRange((uint64_t)v4, &v17, &v16, &v18) & 1) != 0)
    {
      v6 = 1;
      goto LABEL_12;
    }
    v7 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(v3, CFSTR("Content-Length"));
    if (!v7)
    {
      v6 = 0;
LABEL_12:
      CFRelease(v5);
      if ((v6 & 1) == 0)
        goto LABEL_16;
      goto LABEL_13;
    }
  }
  else
  {
    v7 = (__CFString *)CFHTTPMessageCopyHeaderFieldValue(v3, CFSTR("Content-Length"));
    if (!v7)
      goto LABEL_16;
  }
  v16 = -[__CFString longLongValue](v7, "longLongValue");
  v17 = v16;
  v6 = 1;
  v18 = 1;
  CFRelease(v7);
  if (v5)
    goto LABEL_12;
LABEL_13:
  v8 = v18;
  if (FigCustomURLResponseInfoSetContentLength()
    || v8 && FigCustomURLResponseInfoSetResourceSize())
  {
    goto LABEL_26;
  }
LABEL_16:
  CFHTTPMessageGetResponseStatusCode(v3);
  if (!FigCustomURLResponseInfoSetHTTPStatusCode())
  {
    v9 = CFHTTPMessageCopyAllHeaderFields(v3);
    v10 = FigCustomURLResponseInfoSetHTTPHeaders();
    if (v9)
      CFRelease(v9);
    if (!v10)
    {
LABEL_20:
      if (!FigCustomURLResponseInfoSetIsCachingDisabled())
      {
        MIMEType = (void *)CFURLResponseGetMIMEType();
        if (!objc_msgSend(MIMEType, "length")
          || (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithMIMEType:", MIMEType), "identifier"),
              !FigCustomURLResponseInfoSetUniversalTypeIdentifier()))
        {
          v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 16);
          v13 = objc_msgSend(*(id *)(a1 + 32), "requestID");
          v14 = *(unsigned int (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
          if (v14)
          {
            if (!v14(v12, v13, 0))
              objc_msgSend(*(id *)(a1 + 32), "setCustomURLResponse:", 0);
          }
        }
      }
    }
  }
LABEL_26:
  v15 = *(const void **)(a1 + 48);
  if (v15)
    CFRelease(v15);
}

- (void)_didReceiveData:(id)a3 data:(__CFData *)a4
{
  NSObject *callbackQueue;
  _QWORD block[7];

  if (a4)
    CFRetain(a4);
  callbackQueue = self->_callbackQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveData_data___block_invoke;
  block[3] = &unk_1E302FEE0;
  block[5] = a3;
  block[6] = a4;
  block[4] = self;
  dispatch_async(callbackQueue, block);
}

void __63__AVAssetCustomURLBridgeForNSURLProtocol__didReceiveData_data___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t, _QWORD);
  const void *v5;

  if (!FigCreateBlockBufferWithCFDataNoCopy())
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    v3 = objc_msgSend(*(id *)(a1 + 40), "requestID");
    v4 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v4)
      v4(v2, v3, 0);
  }
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

@end
