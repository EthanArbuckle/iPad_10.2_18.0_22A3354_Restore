@implementation __NSCFURLProxySessionConnection

- (__NSCFURLProxySessionConnection)initWithTask:(id)a3 delegate:(id)a4 delegateQueue:(id)a5
{
  __NSCFURLProxySessionConnection *v6;
  void *v7;
  void *v8;
  CFArrayRef v9;
  const __CFArray *v10;
  void *v11;
  uint64_t v12;
  void *ValueAtIndex;
  CFTypeID v14;
  CFTypeID v15;
  char v16;
  _QWORD v18[5];
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)__NSCFURLProxySessionConnection;
  v6 = -[__NSCFURLSessionConnection initWithTask:delegate:delegateQueue:](&v19, sel_initWithTask_delegate_delegateQueue_, a3, a4, a5);
  if (!v6)
    return v6;
  v7 = (void *)objc_msgSend(a3, "currentRequest");
  if (v7)
  {
    v8 = v7;
    v9 = CFURLRequestCopyHTTPRequestBodyParts(v7);
    if (v9)
    {
      v10 = v9;
      v11 = (void *)objc_msgSend(v8, "mutableCopy");
      v12 = objc_msgSend(v11, "valueForHTTPHeaderField:", 0x1EDCFCE80);
      URLRequest::_setHTTPBodyParts((URLRequest *)objc_msgSend(v11, "_inner"), 0, 0);
      if (v12)
        objc_msgSend(v11, "setValue:forHTTPHeaderField:", v12, 0x1EDCFCE80);
      ValueAtIndex = (void *)CFArrayGetValueAtIndex(v10, 0);
      v14 = CFGetTypeID(ValueAtIndex);
      if (v14 == CFStringGetTypeID())
      {
        v6->_originalUploadFilePath = (NSString *)ValueAtIndex;
        objc_msgSend(v11, "setHTTPBodyStream:", objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:", ValueAtIndex));
      }
      else
      {
        v15 = CFGetTypeID(ValueAtIndex);
        if (v15 == CFDataGetTypeID())
          objc_msgSend(v11, "setHTTPBody:", ValueAtIndex);
      }
      objc_msgSend(a3, "setCurrentRequest:", v11);

      CFRelease(v10);
      goto LABEL_16;
    }
  }
  if (objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPBody")
    || objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPBodyStream")
    || (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPMethod"), "isEqualToString:", CFSTR("HEAD")) & 1) == 0&& (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "HTTPMethod"), "isEqualToString:", CFSTR("GET")) & 1) == 0)
  {
LABEL_16:
    v6->_requestIsUncacheable = 1;
  }
  if (objc_msgSend(a3, "_cachePolicy") == 3)
    v16 = 1;
  else
    v16 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "currentRequest"), "valueForHTTPHeaderField:", CFSTR("Cache-Control")), "isEqualToString:", CFSTR("only-if-cached"));
  v6->_clientWantsCacheOnly = v16;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __71____NSCFURLProxySessionConnection_initWithTask_delegate_delegateQueue___block_invoke;
  v18[3] = &unk_1E14FE118;
  v18[4] = v6;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)v6, (const char *)v18);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)__NSCFURLProxySessionConnection;
  -[__NSCFURLSessionConnection dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLProxySessionConnection_cancel__block_invoke;
  v2[3] = &unk_1E14FE118;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)suspend
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __42____NSCFURLProxySessionConnection_suspend__block_invoke;
  v2[3] = &unk_1E14FE118;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)resume
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41____NSCFURLProxySessionConnection_resume__block_invoke;
  v2[3] = &unk_1E14FE118;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)setPoolPriority:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51____NSCFURLProxySessionConnection_setPoolPriority___block_invoke;
  v3[3] = &unk_1E14FE140;
  v3[4] = self;
  v3[5] = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)expectedProgressTargetChanged
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __64____NSCFURLProxySessionConnection_expectedProgressTargetChanged__block_invoke;
  v2[3] = &unk_1E14FE118;
  v2[4] = self;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v2);
}

- (void)setTLSMinimumSupportedProtocolVersion:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73____NSCFURLProxySessionConnection_setTLSMinimumSupportedProtocolVersion___block_invoke;
  v3[3] = &unk_1E14FE168;
  v3[4] = self;
  v4 = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)setTLSMaximumSupportedProtocolVersion:(unsigned __int16)a3
{
  _QWORD v3[5];
  unsigned __int16 v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __73____NSCFURLProxySessionConnection_setTLSMaximumSupportedProtocolVersion___block_invoke;
  v3[3] = &unk_1E14FE168;
  v3[4] = self;
  v4 = a3;
  -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)self, (const char *)v3);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  id v7;
  uint64_t v9;
  const __CFDictionary *v10;
  NSURLResponse *v11;
  uint64_t v12;
  _BYTE *v13;
  CFHTTPMessageRef Copy;
  HTTPMessage *v15;
  CFStringRef v16;
  HTTPMessage *v17;
  CFStringRef HeaderFieldValue;
  const void *v19;
  uint64_t v20;
  id v21;
  __CFString *MIMEType;
  uint64_t v23;
  int v24;
  uint64_t v25;
  __NSCFURLSessionConnectionDelegate *delegate;
  _QWORD v27[6];

  v7 = a5;
  if (self->_cachedResponseForConditionalRequest && objc_msgSend(a5, "statusCode", a3, a4) == 304)
  {
    v9 = objc_msgSend(v7, "allHeaderFields");
    if (v9)
    {
      v10 = (const __CFDictionary *)v9;
      v11 = -[NSCachedURLResponse response](self->_cachedResponseForConditionalRequest, "response");
      v12 = (uint64_t)-[NSURLResponse _inner](v11, "_inner")[88];
      if (v12)
        v13 = (_BYTE *)(v12 - 16);
      else
        v13 = 0;
      Copy = CFHTTPMessageCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFHTTPMessageRef)v13);
      _CFHTTPMessageSetMultipleHeaderFields(Copy, v10);
      if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
        dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
      if (v12)
        v15 = (HTTPMessage *)(v13 + 16);
      else
        v15 = 0;
      v16 = HTTPMessage::copyHeaderFieldValue(v15, 0x11F192E0u);
      if (v12)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        if (v13[40])
          v17 = (HTTPMessage *)(v13 + 16);
        else
          v17 = 0;
      }
      else
      {
        v17 = 0;
      }
      HeaderFieldValue = HTTPMessage::copyLastHeaderFieldValue(v17, 0x11D1D2CFu);
      if (v16)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        HTTPMessage::setHeaderFieldStringValue((CFHTTPMessageRef)((char *)Copy + 16), 0x11F192E0u, v16);
        CFRelease(v16);
      }
      if (HeaderFieldValue)
      {
        if (HTTPMessage::Class(void)::sOnce_HTTPMessage != -1)
          dispatch_once(&HTTPMessage::Class(void)::sOnce_HTTPMessage, &__block_literal_global_5133);
        HTTPMessage::setHeaderFieldStringValue((CFHTTPMessageRef)((char *)Copy + 16), 0x11D1D2CFu, HeaderFieldValue);
        CFRelease(HeaderFieldValue);
      }
      v19 = (const void *)-[NSURLResponse _inner](v11, "_inner")[8];
      v20 = -[NSURLResponse _inner](v11, "_inner");
      v21 = CFURLResponseCreateWithHTTPResponse(v20, v19, (uint64_t)Copy, *(_DWORD *)(v20 + 72));
      MIMEType = URLResponse::getMIMEType(-[NSURLResponse _inner](v11, "_inner"));
      CFURLResponseSetMIMEType(v21, MIMEType);
      v7 = +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:", v21);
      CFRelease(v21);
      CFRelease(Copy);
    }
    self->_cachedResponseDataArray = (NSArray *)-[NSCachedURLResponse dataArray](self->_cachedResponseForConditionalRequest, "dataArray");
  }

  self->_cachedResponseForConditionalRequest = 0;
  self->_conditionalRequest = 0;
  v23 = objc_msgSend(v7, "expectedContentLength");
  v24 = *(_DWORD *)(objc_msgSend(v7, "_inner") + 72);
  v25 = *(_QWORD *)(objc_msgSend(v7, "_inner") + 88);
  if ((!v25 || (*(_WORD *)(v25 + 297) & 0x8000) == 0) && v24 != 2)
    -[__NSCFURLSessionConnection _setupForCache:expectedLength:response:]((uint64_t)self, v23, v7);
  delegate = self->super._delegate;
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __92____NSCFURLProxySessionConnection_URLSession_dataTask_didReceiveResponse_completionHandler___block_invoke;
  v27[3] = &unk_1E14FE190;
  v27[4] = self;
  v27[5] = a6;
  -[__NSCFURLSessionConnectionDelegate connection:didReceiveResponse:completion:](delegate, "connection:didReceiveResponse:completion:", self, v7, v27);
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  -[__NSCFURLSessionConnectionDelegate connection:wasRedirected:newRequest:responseCallback:](self->super._delegate, "connection:wasRedirected:newRequest:responseCallback:");
}

- (void)URLSession:(id)a3 dataTask:(id)a4 _didReceiveData:(id)a5 completionHandler:(id)a6
{
  NSObject *v8;

  v8 = objc_msgSend(a5, "_createDispatchData", a3, a4);
  -[__NSCFURLSessionConnection _appendDataToCache:]((uint64_t)self, v8);
  -[__NSCFURLSessionConnectionDelegate connection:didReceiveData:completion:](self->super._delegate, "connection:didReceiveData:completion:", self, v8, a6);
  dispatch_release(v8);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveChallenge:(id)a5 completionHandler:(id)a6
{
  -[__NSCFURLSessionConnectionDelegate connection:challenged:authCallback:](self->super._delegate, "connection:challenged:authCallback:", self, a5, a6);
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  __NSCFURLSessionConnectionDelegate *delegate;
  uint64_t v11;
  uint64_t v12;

  delegate = self->super._delegate;
  v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a5, a4);
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a6);
  -[__NSCFURLSessionConnectionDelegate connection:sentBodyBytes:totalBytes:expectedBytes:](delegate, "connection:sentBodyBytes:totalBytes:expectedBytes:", self, v11, v12, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", a7));
}

- (void)URLSession:(id)a3 task:(id)a4 needNewBodyStream:(id)a5
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(id, uint64_t);
  id v12;

  self->_handledNeedNewBodyStream = 1;
  v8 = (void *)objc_msgSend((id)objc_msgSend(a4, "originalRequest", a3), "HTTPBodyStream");
  if (v8 && (v9 = (uint64_t)v8, !objc_msgSend(v8, "streamStatus")))
  {
    v11 = (void (*)(id, uint64_t))*((_QWORD *)a5 + 2);
    v12 = a5;
    v10 = v9;
  }
  else
  {
    if (!self->_originalUploadFilePath)
    {
      -[__NSCFURLSessionConnectionDelegate connection:request:needsNewBodyStreamCallback:](self->super._delegate, "connection:request:needsNewBodyStreamCallback:", self, objc_msgSend(a4, "currentRequest"), a5);
      return;
    }
    v10 = objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithFileAtPath:");
    v11 = (void (*)(id, uint64_t))*((_QWORD *)a5 + 2);
    v12 = a5;
  }
  v11(v12, v10);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  NSArray *cachedResponseDataArray;
  uint64_t v9;
  NSObject *DispatchDataFromDataArray;
  __NSCFURLSessionConnectionDelegate *delegate;
  NSCachedURLResponse *v12;
  NSCachedURLResponse *v13;
  __NSCFURLSessionConnectionDelegate *v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSURLRequest *v20;
  _QWORD v21[6];
  _QWORD v22[5];

  if (a5 && self->_cacheTask == a4 && !self->_shouldCancelOnCacheTaskCompletion && !self->_clientWantsCacheOnly)
  {
    self->_completedLocalCacheLookup = 1;

    self->_cacheTask = 0;
    v15 = (void *)objc_msgSend(a5, "domain");
    if (objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      if (objc_msgSend(a5, "code") == -2000)
      {
        v17 = objc_msgSend((id)objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", CFSTR("_kCFNetworkErrorCachedResponseKey"));
        v18 = objc_msgSend((id)objc_msgSend(a5, "userInfo"), "objectForKeyedSubscript:", CFSTR("_kCFNetworkErrorConditionalRequestKey"));
        if (v17)
        {
          v19 = v18;
          if (v18)
          {
            self->_cachedResponseForConditionalRequest = (NSCachedURLResponse *)-[NSCachedURLResponse _initWithCFCachedURLResponse:]([NSCachedURLResponse alloc], "_initWithCFCachedURLResponse:", v17);
            self->_conditionalRequest = (NSURLRequest *)-[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", v19);
            if (objc_msgSend((id)objc_msgSend(a4, "originalRequest"), "HTTPBodyStream"))
            {
              v20 = (NSURLRequest *)-[NSURLRequest mutableCopy](self->_conditionalRequest, "mutableCopy");
              -[NSURLRequest setHTTPBodyStream:](v20, "setHTTPBodyStream:", objc_msgSend((id)objc_msgSend(a4, "originalRequest"), "HTTPBodyStream"));

              self->_conditionalRequest = v20;
            }
          }
        }
      }
    }
    -[__NSCFURLProxySessionConnection _startLoad]((uint64_t)self, v16);
  }
  else
  {
    cachedResponseDataArray = self->_cachedResponseDataArray;
    v9 = MEMORY[0x1E0C809B0];
    if (cachedResponseDataArray)
    {
      DispatchDataFromDataArray = createDispatchDataFromDataArray(cachedResponseDataArray);
      -[__NSCFURLSessionConnection _appendDataToCache:]((uint64_t)self, DispatchDataFromDataArray);
      delegate = self->super._delegate;
      v22[0] = v9;
      v22[1] = 3221225472;
      v22[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke;
      v22[3] = &unk_1E14FE118;
      v22[4] = DispatchDataFromDataArray;
      -[__NSCFURLSessionConnectionDelegate connection:didReceiveData:completion:](delegate, "connection:didReceiveData:completion:", self, DispatchDataFromDataArray, v22);
    }
    if (a5)
      -[__NSCFURLSessionConnection _tossCache]((uint64_t)self);
    -[__NSCFURLSessionConnectionDelegate connectionWillFinishLoading:](self->super._delegate, "connectionWillFinishLoading:", self, a4);
    v12 = -[__NSCFURLSessionConnection _cachedResponse]((uint64_t)self);
    if (v12)
    {
      v13 = v12;
      v14 = self->super._delegate;
      v21[0] = v9;
      v21[1] = 3221225472;
      v21[2] = __72____NSCFURLProxySessionConnection_URLSession_task_didCompleteWithError___block_invoke_2;
      v21[3] = &unk_1E14FE208;
      v21[4] = self;
      v21[5] = a5;
      -[__NSCFURLSessionConnectionDelegate connection:willCacheResponse:responseCallback:](v14, "connection:willCacheResponse:responseCallback:", self, v13, v21);
    }
    else
    {
      -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:]((id *)&self->super.super.isa, a5);
    }
  }
}

- (void)URLSession:(id)a3 task:(id)a4 _isWaitingForConnectionWithReason:(int64_t)a5
{
  -[__NSCFURLSessionConnectionDelegate connection:waitingWithReason:](self->super._delegate, "connection:waitingWithReason:", self, a5);
}

- (void)URLSession:(id)a3 task:(id)a4 _willSendRequestForEstablishedConnection:(id)a5 completionHandler:(id)a6
{
  __NSCFURLSessionConnectionDelegate *delegate;
  _QWORD v11[7];

  objc_msgSend(a4, "updateCurrentRequest:", a5);
  delegate = self->super._delegate;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __110____NSCFURLProxySessionConnection_URLSession_task__willSendRequestForEstablishedConnection_completionHandler___block_invoke;
  v11[3] = &unk_1E14FE230;
  v11[4] = self;
  v11[5] = a4;
  v11[6] = a6;
  -[__NSCFURLSessionConnectionDelegate connection:_willSendRequestForEstablishedConnection:completion:](delegate, "connection:_willSendRequestForEstablishedConnection:completion:", self, a5, v11);
}

- (void)URLSession:(id)a3 task:(id)a4 _conditionalRequirementsChanged:(BOOL)a5
{
  -[__NSCFURLSessionConnectionDelegate connection:_conditionalRequirementsChanged:](self->super._delegate, "connection:_conditionalRequirementsChanged:", self, a5);
}

- (void)URLSession:(id)a3 task:(id)a4 didFinishCollectingMetrics:(id)a5
{
  const char *v6;
  uint64_t v7;
  id Property;

  v7 = objc_msgSend(a4, "_metrics", a3);
  if (self)
    Property = objc_getProperty(self, v6, 8, 1);
  else
    Property = 0;
  objc_msgSend(Property, "set_metrics:", v7);
}

- (void)URLSession:(id)a3 task:(id)a4 didReceiveInformationalResponse:(id)a5
{
  -[__NSCFURLSessionConnectionDelegate connection:didReceiveInformationalResponse:](self->super._delegate, "connection:didReceiveInformationalResponse:", self, a5);
}

- (void)_URLSession:(id)a3 task:(id)a4 getAuthHeadersForResponse:(id)a5 completionHandler:(id)a6
{
  void *v9;
  SEL v10;
  uint64_t v11;
  SEL v12;
  id Property;

  if (self)
  {
    v9 = (void *)objc_msgSend(objc_getProperty(self, a2, 8, 1), "authenticator");
    v11 = objc_msgSend(objc_getProperty(self, v10, 8, 1), "session");
    Property = objc_getProperty(self, v12, 8, 1);
  }
  else
  {
    v9 = (void *)objc_msgSend(0, "authenticator", a3, a4);
    v11 = objc_msgSend(0, "session");
    Property = 0;
  }
  objc_msgSend(v9, "getAuthenticationHeadersForTask:task:response:completionHandler:", v11, Property, a5, a6);
}

- (void)_startLoad
{
  uint64_t v3;
  const char *v4;
  uint64_t v6;
  id *v7;
  SEL v8;
  uint64_t v9;
  id *v10;
  void *v11;

  if (a1)
  {
    v3 = objc_msgSend(objc_getProperty((id)a1, a2, 8, 1), "_cachePolicy");
    if (v3 == 1 || v3 == 4)
      goto LABEL_7;
    v6 = objc_msgSend((id)objc_msgSend(objc_getProperty((id)a1, v4, 8, 1), "_effectiveConfiguration"), "URLCache");
    if (!v6 || *(_BYTE *)(a1 + 90) || *(_BYTE *)(a1 + 91))
      goto LABEL_7;
    v7 = (id *)objc_msgSend(objc_getProperty((id)a1, v4, 8, 1), "session");
    v9 = objc_msgSend(objc_getProperty((id)a1, v8, 8, 1), "currentRequest");
    if (v7)
    {
      v7 = (id *)objc_msgSend(v7[49], "dataTaskWithRequest:", v9);
      objc_msgSend(v7, "set_internalDelegate:", a1);
    }
    v10 = v7;
    *(_QWORD *)(a1 + 80) = v10;
    objc_msgSend(v10, "set_cacheOnly:", 1);
    v11 = *(void **)(a1 + 80);
    if (!v11)
LABEL_7:
      -[__NSCFURLProxySessionConnection _performOriginLoad]((_QWORD *)a1, v4);
    else
      objc_msgSend(v11, "resume");
  }
}

- (void)_deliverDidCompleteWithError:(id *)a1
{
  id *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  _QWORD v8[5];

  if (a1)
  {
    v4 = a1;
    v5 = (void *)objc_msgSend(a2, "domain");
    v6 = *MEMORY[0x1E0CB32E8];
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CB32E8]))
    {
      if (objc_msgSend(a2, "code") == -997)
        a2 = (void *)objc_msgSend(MEMORY[0x1E0CB39B8], "_web_errorWithDomain:code:URL:", v6, -1005, objc_msgSend((id)objc_msgSend(objc_getProperty(a1, v7, 8, 1), "currentRequest"), "URL"));
    }
    objc_msgSend(a1[3], "connection:didFinishLoadingWithError:", a1, a2);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __64____NSCFURLProxySessionConnection__deliverDidCompleteWithError___block_invoke;
    v8[3] = &unk_1E14FE118;
    v8[4] = a1;
    -[__NSCFURLSessionConnection withWorkQueueAsync:]((dispatch_queue_t *)a1, (const char *)v8);
  }
}

- (void)_performOriginLoad
{
  id v3;
  CFArrayRef v4;
  const char *v5;
  uint64_t v6;
  SEL v7;
  uint64_t v8;
  void *v9;
  SEL v10;
  id Property;
  void *v12;
  double v13;
  const char *v14;
  void *v15;
  void *v16;

  v3 = (id)self[13];
  if ((v3 || (v3 = (id)objc_msgSend(objc_getProperty(self, a2, 8, 1), "currentRequest")) != 0)
    && (v4 = CFURLRequestCopyHTTPRequestBodyParts(v3)) != 0)
  {
    CFRelease(v4);
  }
  else if (objc_msgSend(v3, "HTTPBodyStream"))
  {
    v3 = (id)objc_msgSend(v3, "mutableCopy");
    +[NSURLProtocol setProperty:forKey:inRequest:](NSURLProtocol, "setProperty:forKey:inRequest:", MEMORY[0x1E0C9AAB0], CFSTR("_kCFNetworkProxySessionNeedsNewBodyStreamSignal"), v3);
  }
  v6 = objc_msgSend(objc_getProperty(self, v5, 8, 1), "session");
  v8 = objc_msgSend(objc_getProperty(self, v7, 8, 1), "_uniqueIdentifier");
  if (v6)
  {
    v9 = (void *)objc_msgSend(*(id *)(v6 + 376), "dataTaskWithRequest:uniqueIdentifier:", v3, v8);
    objc_msgSend(v9, "set_internalDelegate:", self);
  }
  else
  {
    v9 = 0;
  }
  self[9] = v9;
  Property = objc_getProperty(self, v10, 8, 1);
  v12 = (void *)self[9];
  if (objc_msgSend(Property, "_authenticatorConfiguredViaTaskProperty"))
  {
    objc_msgSend(v12, "set_authenticatorConfiguredViaTaskProperty:", 1);
    objc_msgSend(v12, "setAuthenticator:", objc_msgSend(Property, "authenticator"));
  }
  if (objc_msgSend(Property, "countOfBytesClientExpectsToSend") != -1)
    objc_msgSend(v12, "setCountOfBytesClientExpectsToSend:", objc_msgSend(Property, "countOfBytesClientExpectsToSend"));
  if (objc_msgSend(Property, "countOfBytesClientExpectsToReceive") != -1)
    objc_msgSend(v12, "setCountOfBytesClientExpectsToReceive:", objc_msgSend(Property, "countOfBytesClientExpectsToReceive"));
  objc_msgSend(Property, "_timeoutIntervalForResource");
  if (v13 != 0.0)
  {
    objc_msgSend(Property, "_timeoutIntervalForResource");
    objc_msgSend(v12, "set_timeoutIntervalForResource:");
  }
  if (objc_msgSend(Property, "_preconnect"))
    objc_msgSend(v12, "set_preconnect:", 1);
  if (objc_msgSend(Property, "_effectiveConfiguration"))
    objc_msgSend(v12, "_adoptEffectiveConfiguration:", objc_msgSend(Property, "_effectiveConfiguration"));
  objc_msgSend(v12, "set_siteForCookies:", objc_msgSend(Property, "_siteForCookies"));
  objc_msgSend(v12, "set_isTopLevelNavigation:", objc_msgSend(Property, "_isTopLevelNavigation"));
  v15 = (void *)self[9];
  if (v15)
  {
    objc_msgSend(v15, "resume");
  }
  else
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0CB39B8], "_web_errorWithDomain:code:URL:", *MEMORY[0x1E0CB32E8], -1009, objc_msgSend((id)objc_msgSend(objc_getProperty(self, v14, 8, 1), "currentRequest"), "URL"));
    -[__NSCFURLProxySessionConnection _deliverDidCompleteWithError:]((id *)self, v16);
  }
}

@end
