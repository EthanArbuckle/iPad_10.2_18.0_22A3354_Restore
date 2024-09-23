@implementation NSURLConnection

+ (BOOL)_collectsTimingData
{
  return _timingDataCollection;
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 usesCache:(BOOL)a5 maxContentLength:(int64_t)a6 startImmediately:(BOOL)a7 connectionProperties:(id)a8
{
  _BOOL4 v9;
  NSURLConnection *v15;
  NSURLConnectionInternalConnection *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD v20[6];
  objc_super v21;

  v9 = a7;
  if (!a3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    LOWORD(v20[0]) = 0;
    _os_log_fault_impl(&dword_183ECA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "assertion failure", (uint8_t *)v20, 2u);
  }
  v21.receiver = self;
  v21.super_class = (Class)NSURLConnection;
  v15 = -[NSURLConnection init](&v21, sel_init);
  if (v15)
  {
    v16 = [NSURLConnectionInternalConnection alloc];
    v15->_internal = &v16->super;
    if (!v16)
      goto LABEL_9;
    v20[0] = v15;
    v20[1] = a3;
    v20[2] = a4;
    v20[3] = a8;
    v20[5] = a6;
    v20[4] = a5;
    v17 = -[NSURLConnectionInternalConnection initWithInfo:](v16, "initWithInfo:", v20);
    v15->_internal = (NSURLConnectionInternal *)v17;
    if (v17)
    {
      if (v9)
      {
        v18 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        -[NSURLConnection scheduleInRunLoop:forMode:](v15, "scheduleInRunLoop:forMode:", v18, *MEMORY[0x1E0C99748]);
        -[NSURLConnection start](v15, "start");
      }
    }
    else
    {
LABEL_9:

      return 0;
    }
  }
  return v15;
}

CFTypeRef __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke()
{
  CFTypeRef result;

  result = CoreSchedulingSet::createNewPrivateRunLoopThread((uint64_t)"com.apple.NSURLConnectionLoader", (uint64_t)&__block_literal_global_14_4174, &__block_literal_global_16_4175);
  +[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop = (uint64_t)result;
  return result;
}

+ (__CFRunLoop)resourceLoaderRunLoop
{
  if (+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce != -1)
    dispatch_once(&+[NSURLConnection(Loader) resourceLoaderRunLoop]::sOnce, &__block_literal_global_4172);
  return (__CFRunLoop *)+[NSURLConnection(Loader) resourceLoaderRunLoop]::sLoadRunLoop;
}

uint64_t __48__NSURLConnection_Loader__resourceLoaderRunLoop__block_invoke_3()
{
  _opaque_pthread_t *v0;
  uint64_t result;
  sched_param v2;

  *(_DWORD *)v2.__opaque = 0;
  v2.sched_priority = _loaderThreadPriority;
  v0 = pthread_self();
  result = pthread_setschedparam(v0, 1, &v2);
  if ((_DWORD)result == -1)
  {
    NSLog(CFSTR("FATAL: Failed to change priority."));
    abort();
  }
  return result;
}

- (void)start
{
  -[NSURLConnectionInternal start](self->_internal, "start");
}

- (void)scheduleInRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  -[NSURLConnectionInternal scheduleInRunLoop:forMode:](self->_internal, "scheduleInRunLoop:forMode:", aRunLoop, mode);
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  return (NSURLConnection *)-[NSURLConnection _initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:](self, "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", request, delegate, 1, 0, 1, 0);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLConnection;
  -[NSURLConnection dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  -[NSURLConnectionInternal cancel](self->_internal, "cancel");
}

+ (NSData)sendSynchronousRequest:(NSURLRequest *)request returningResponse:(NSURLResponse *)response error:(NSError *)error
{
  NSString *v8;
  NSString *v9;
  NSObject *v10;
  _CFURLRequest *v11;
  _CFURLRequest *v12;
  CFTypeRef *p_cf;
  CFTypeRef *v14;
  NSData *v15;
  NSError *v16;
  id v17;
  NSError *v18;
  NSData *v19;
  CFTypeRef v21;
  CFTypeRef cf;
  InternalInit buf;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (__CFNProcessIsApplication::onceToken != -1)
      dispatch_once(&__CFNProcessIsApplication::onceToken, &__block_literal_global_20);
    if (__CFNProcessIsApplication::result)
    {
      v8 = -[NSURL scheme](-[NSURLRequest URL](request, "URL"), "scheme");
      if (v8)
      {
        v9 = v8;
        if (-[NSString caseInsensitiveCompare:](v8, "caseInsensitiveCompare:", CFSTR("https")) == NSOrderedSame
          || -[NSString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", CFSTR("http")) == NSOrderedSame
          || -[NSString caseInsensitiveCompare:](v9, "caseInsensitiveCompare:", CFSTR("ftp")) == NSOrderedSame)
        {
          if (__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken != -1)
            dispatch_once(&__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::onceToken, &__block_literal_global_9_4769);
          v10 = __CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger;
          if (os_log_type_enabled((os_log_t)__CFNPerformanceDiagnosticRuntimeIssuesLogHandle::logger, OS_LOG_TYPE_FAULT))
          {
            LODWORD(buf.var0) = 136315394;
            *(id *)((char *)&buf.var0 + 4) = "__delegate_identifier__:Performance Diagnostics__:::____message__:";
            WORD2(buf.var1) = 2112;
            *(id *)((char *)&buf.var1 + 6) = -[NSURLRequest URL](request, "URL");
            _os_log_fault_impl(&dword_183ECA000, v10, OS_LOG_TYPE_FAULT, "%sSynchronous URL loading of %@ should not occur on this application's main thread as it may lead to UI unresponsiveness. Please switch to an asynchronous networking API such as URLSession.", (uint8_t *)&buf, 0x16u);
          }
        }
      }
    }
  }
  buf.var5 = 0;
  buf.var0 = 0;
  *(_OWORD *)&buf.var2 = 0u;
  buf.var1 = request;
  *(_QWORD *)&buf.var4 = 1;
  v11 = createCFRequest(&buf);
  if (!v11)
  {
    if (!error)
      return 0;
    v17 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v15 = 0;
    *error = (NSError *)(id)objc_msgSend(v17, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E0CB2FE0], 12, -[NSURLRequest URL](request, "URL"));
    return v15;
  }
  v12 = v11;
  v21 = 0;
  cf = 0;
  if (response)
    p_cf = &cf;
  else
    p_cf = 0;
  if (error)
    v14 = &v21;
  else
    v14 = 0;
  v15 = (NSData *)CFURLConnectionSendSynchronousRequest(v11, p_cf, v14, 86400.0);
  CFRelease(v12);
  if (!response)
  {
LABEL_23:
    if (error)
      goto LABEL_24;
    goto LABEL_33;
  }
  if (cf)
  {
    *response = (NSURLResponse *)+[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    CFRelease(cf);
    goto LABEL_23;
  }
  *response = 0;
  if (error)
  {
LABEL_24:
    if (v21)
    {
      v16 = (NSError *)cfnTranslateCFError((__CFError *)v21, -[NSURLRequest URL](request, "URL"));
      *error = v16;
      if (v16 == v21)
        v18 = v16;
      else
        CFRelease(v21);
    }
  }
LABEL_33:
  if (v15)
  {
    CFMakeCollectable(v15);
    v19 = v15;
  }
  return v15;
}

+ (NSURLConnection)connectionWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  return -[NSURLConnection initWithRequest:delegate:]([NSURLConnection alloc], "initWithRequest:delegate:", request, delegate);
}

+ (BOOL)canHandleRequest:(NSURLRequest *)request
{
  return +[NSURLProtocol _protocolClassForRequest:skipAppSSO:](NSURLProtocol, "_protocolClassForRequest:skipAppSSO:", request, 1) != 0;
}

- (NSURLConnection)initWithRequest:(NSURLRequest *)request delegate:(id)delegate startImmediately:(BOOL)startImmediately
{
  return (NSURLConnection *)-[NSURLConnection _initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:](self, "_initWithRequest:delegate:usesCache:maxContentLength:startImmediately:connectionProperties:", request, delegate, 1, 0, startImmediately, 0);
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLConnection;
  return -[NSString stringByAppendingFormat:](-[NSURLConnection description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" { request: %@ }"), -[NSURLConnection originalRequest](self, "originalRequest"));
}

- (void)setDelegateQueue:(NSOperationQueue *)queue
{
  -[NSURLConnectionInternal _setDelegateQueue:](self->_internal, "_setDelegateQueue:", queue);
}

- (void)unscheduleFromRunLoop:(NSRunLoop *)aRunLoop forMode:(NSRunLoopMode)mode
{
  -[NSURLConnectionInternal unscheduleFromRunLoop:forMode:](self->_internal, "unscheduleFromRunLoop:forMode:", aRunLoop, mode);
}

- (NSURLRequest)originalRequest
{
  NSURLConnectionInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_originalRequest;
  else
    return 0;
}

- (NSURLRequest)currentRequest
{
  NSURLConnectionInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_currentRequest;
  else
    return 0;
}

- (id)connectionProperties
{
  NSURLConnectionInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_connectionProperties;
  else
    return 0;
}

- (void)setDefersCallbacks:(BOOL)a3
{
  NSURLConnectionInternal *internal;

  internal = self->_internal;
  if (a3)
    -[NSURLConnectionInternal _suspendLoading](internal, "_suspendLoading");
  else
    -[NSURLConnectionInternal _resumeLoading](internal, "_resumeLoading");
}

- (BOOL)defersCallbacks
{
  return 0;
}

- (id)_cfInternal
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return self->_internal;
  else
    return 0;
}

- (void)_suspendLoading
{
  -[NSURLConnection setDefersCallbacks:](self, "setDefersCallbacks:", 1);
}

- (void)_resumeLoading
{
  -[NSURLConnection setDefersCallbacks:](self, "setDefersCallbacks:", 0);
}

+ (void)sendAsynchronousRequest:(NSURLRequest *)request queue:(NSOperationQueue *)queue completionHandler:(void *)handler
{
  _CFURLRequest *v8;
  NSObject *global_queue;
  const __CFAllocator *v10;
  _OWORD *v11;
  uint64_t v12;
  _QWORD v13[7];
  _QWORD v14[6];
  InternalInit v15;

  *(_QWORD *)&v15.var4 = 1;
  v15.var5 = 0;
  v15.var0 = 0;
  *(_OWORD *)&v15.var2 = 0u;
  v15.var1 = request;
  v8 = createCFRequest(&v15);
  if (v8)
  {
    global_queue = dispatch_get_global_queue(0, 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2;
    v13[3] = &unk_1E14F8238;
    v13[5] = request;
    v13[6] = handler;
    v13[4] = queue;
    v10 = CFGetAllocator(v8);
    v11 = CFAllocatorAllocate(v10, 72, 0);
    *v11 = 0u;
    v11[1] = 0u;
    v11[2] = 0u;
    v11[3] = 0u;
    *((_QWORD *)v11 + 8) = 0;
    v12 = SyncClient::SyncClient((uint64_t)v11, v10, v8, global_queue, v13);
    CFURLConnectionStart(*(_QWORD *)(v12 + 24));
    (*(void (**)(_OWORD *))(*(_QWORD *)v11 + 48))(v11);
  }
  else
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke;
    v14[3] = &unk_1E14FDF00;
    v14[4] = request;
    v14[5] = handler;
    -[NSOperationQueue addOperationWithBlock:](queue, "addOperationWithBlock:", v14);
  }
  CFRelease(v8);
}

+ (unint64_t)_sweeperInterval
{
  return 0;
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke(uint64_t result)
{
  uint64_t v1;
  id v2;
  id v3;

  if (*(_QWORD *)(result + 40))
  {
    v1 = result;
    v2 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v3 = (id)objc_msgSend(v2, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E0CB2FE0], 12, objc_msgSend(*(id *)(v1 + 32), "URL"));
    return (*(uint64_t (**)(void))(*(_QWORD *)(v1 + 40) + 16))();
  }
  return result;
}

uint64_t __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_2(uint64_t a1, CFTypeRef cf, CFTypeRef a3, CFTypeRef a4)
{
  void *v8;
  _QWORD v10[4];
  __int128 v11;
  CFTypeRef v12;
  CFTypeRef v13;
  CFTypeRef v14;

  if (cf)
    CFRetain(cf);
  if (a4)
    CFRetain(a4);
  if (a3)
    CFRetain(a3);
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3;
  v10[3] = &unk_1E14FCE10;
  v12 = a3;
  v13 = a4;
  v11 = *(_OWORD *)(a1 + 40);
  v14 = cf;
  return objc_msgSend(v8, "addOperationWithBlock:", v10);
}

void __67__NSURLConnection_sendAsynchronousRequest_queue_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  __CFError *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  if (*(_QWORD *)(a1 + 40))
  {
    v2 = (void *)MEMORY[0x186DB8C8C]();
    if (*(_QWORD *)(a1 + 48))
      +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
    v3 = *(__CFError **)(a1 + 56);
    if (v3)
      cfnTranslateCFError(v3, (void *)objc_msgSend(*(id *)(a1 + 32), "URL"));
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_autoreleasePoolPop(v2);
  }
  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRelease(v5);
  v6 = *(const void **)(a1 + 48);
  if (v6)
    CFRelease(v6);
}

- (id)_timingData
{
  return -[NSURLConnectionInternal _timingData](self->_internal, "_timingData");
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  -[NSURLConnectionInternal useCredential:forAuthenticationChallenge:](self->_internal, "useCredential:forAuthenticationChallenge:", a3, a4);
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  -[NSURLConnectionInternal continueWithoutCredentialForAuthenticationChallenge:](self->_internal, "continueWithoutCredentialForAuthenticationChallenge:", a3);
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  -[NSURLConnectionInternal cancelAuthenticationChallenge:](self->_internal, "cancelAuthenticationChallenge:", a3);
}

- (void)performDefaultHandlingForAuthenticationChallenge:(id)a3
{
  -[NSURLConnectionInternal performDefaultHandlingForAuthenticationChallenge:](self->_internal, "performDefaultHandlingForAuthenticationChallenge:", a3);
}

- (void)rejectProtectionSpaceAndContinueWithChallenge:(id)a3
{
  -[NSURLConnectionInternal rejectProtectionSpaceAndContinueWithChallenge:](self->_internal, "rejectProtectionSpaceAndContinueWithChallenge:", a3);
}

+ (void)_setCollectsTimingData:(BOOL)a3
{
  _timingDataCollection = a3;
}

+ (void)_collectTimingDataWithOptions:(unint64_t)a3
{
  _dataCollection = a3;
  objc_msgSend(a1, "_setCollectsTimingData:", 1);
}

+ (unint64_t)_timingDataOptions
{
  return _dataCollection;
}

+ (void)_setLoaderThreadPriority:(int)a3
{
  _loaderThreadPriority = a3;
}

+ (void)_setMIMETypesWithNoSizeLimit:(id)a3
{
  if ((+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn & 1) == 0)
  {
    +[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]::sDidWarn = 1;
    NSLog(CFSTR("%s deprecated"), a2, a3, "+[NSURLConnection(Deprecated) _setMIMETypesWithNoSizeLimit:]");
  }
}

@end
