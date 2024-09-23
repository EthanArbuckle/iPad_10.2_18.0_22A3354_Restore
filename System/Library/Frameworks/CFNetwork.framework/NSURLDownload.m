@implementation NSURLDownload

- (NSURLDownload)init
{
  NSURLDownload *v2;
  NSURLDownloadInternal *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NSURLDownload;
  v2 = -[NSURLDownload init](&v5, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(NSURLDownloadInternal);
    v2->_internal = v3;
    v3->downloadActive = 1;
  }
  return v2;
}

- (NSURLDownload)initWithRequest:(NSURLRequest *)request delegate:(id)delegate
{
  NSURLDownload *v6;
  NSURLDownload *v7;
  _CFURLDownload *cfDownload;
  uint64_t v9;
  CFRunLoopRef Current;
  _QWORD v12[16];

  if (!request)
    __assert_rtn("-[NSURLDownload initWithRequest:delegate:]", "NSURLDownload.mm", 128, "request");
  v6 = -[NSURLDownload init](self, "init");
  v7 = v6;
  if (v6)
  {
    v12[4] = 0;
    v12[0] = 0;
    v12[1] = CFRetain(v6);
    v12[2] = 0;
    v12[3] = _NSURLDownloadReleaseClient;
    v12[5] = _NSURLDownloadDidStart;
    v12[6] = _NSURLDownloadWillSendRequest;
    v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
    v12[8] = _NSURLDownloadDidReceiveResponse;
    v12[9] = _NSURLDownloadWillResumeWithResponse;
    v12[10] = _NSURLDownloadDidReceiveData;
    v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
    v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
    v12[13] = _NSURLDownloadDidCreateDestination;
    v12[14] = _NSURLDownloadDidFinish;
    v12[15] = _NSURLDownloadDidFail;
    v7->_internal->cfDownload = (_CFURLDownload *)CFURLDownloadCreate(0, request, v12);
    cfDownload = v7->_internal->cfDownload;
    if (cfDownload)
    {
      CFMakeCollectable(cfDownload);
      -[NSURLDownload _setDelegate:](v7, "_setDelegate:", delegate, v12[0]);
      v9 = (uint64_t)v7->_internal->cfDownload;
      Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(v9, (uint64_t)Current, *MEMORY[0x1E0C9B280]);
      CFURLDownloadStart((uint64_t)v7->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v7;
}

- (id)_initWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7
{
  uint64_t v13;
  uint64_t v14;

  if (a3 && a4)
  {
    objc_msgSend((id)objc_msgSend(a3, "_cfInternal"), "_setShouldSkipCancelOnRelease:", 1);
    v13 = objc_msgSend(a3, "_cfInternal");
    if (v13)
      v14 = *(_QWORD *)(v13 + 72);
    else
      v14 = 0;
    return -[NSURLDownload _initWithLoadingCFURLConnection:request:response:delegate:proxy:](self, "_initWithLoadingCFURLConnection:request:response:delegate:proxy:", v14, a4, a5, a6, a7);
  }
  else
  {

    return 0;
  }
}

- (id)_initWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7
{
  NSURLDownload *v11;
  NSURLDownload *v12;
  _QWORD v14[16];

  v11 = -[NSURLDownload init](self, "init", a3, a4, a5, a6, a7);
  v12 = v11;
  if (v11)
  {
    if (!a3)
      goto LABEL_6;
    if (!a4)
      goto LABEL_6;
    v14[4] = 0;
    v14[0] = 0;
    v14[1] = CFRetain(v11);
    v14[2] = 0;
    v14[3] = _NSURLDownloadReleaseClient;
    v14[5] = _NSURLDownloadDidStart;
    v14[6] = _NSURLDownloadWillSendRequest;
    v14[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
    v14[8] = _NSURLDownloadDidReceiveResponse;
    v14[9] = _NSURLDownloadWillResumeWithResponse;
    v14[10] = _NSURLDownloadDidReceiveData;
    v14[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
    v14[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
    v14[13] = _NSURLDownloadDidCreateDestination;
    v14[14] = _NSURLDownloadDidFinish;
    v14[15] = _NSURLDownloadDidFail;
    v12->_internal->cfDownload = (_CFURLDownload *)CFURLDownloadCreateAndStartWithLoadingConnection(0, (char *)a3, a4, a5, v14);
    if (v12->_internal->cfDownload)
    {
      -[NSURLDownload _setDelegate:](v12, "_setDelegate:", a6, v14[0]);
      CFMakeCollectable(v12->_internal->cfDownload);
    }
    else
    {
LABEL_6:

      return 0;
    }
  }
  return v12;
}

- (id)_initWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5
{
  NSURLDownload *v6;
  CFURLRef v7;
  CFURLRef v8;
  _CFURLDownload *cfDownload;
  URLDownload *v10;

  v6 = -[NSURLDownload initWithRequest:delegate:](self, "initWithRequest:delegate:", a3, a4);
  if (v6)
  {
    v7 = CFURLCreateWithString(0, (CFStringRef)a5, 0);
    if (v7)
    {
      v8 = v7;
      cfDownload = v6->_internal->cfDownload;
      if (URLDownload::Class(void)::sOnce_URLDownload != -1)
        dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
      if (cfDownload)
        v10 = (URLDownload *)((char *)cfDownload + 16);
      else
        v10 = 0;
      URLDownload::setDirectoryURL(v10, v8);
      CFRelease(v8);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (id)_initWithResumeInformation:(id)a3 delegate:(id)a4 path:(id)a5
{
  NSURLDownload *v8;
  uint64_t cfDownload;
  CFRunLoopRef Current;
  _QWORD v12[16];

  v8 = -[NSURLDownload init](self, "init");
  if (v8)
  {
    if ((objc_msgSend(a5, "isAbsolutePath") & 1) != 0)
    {
      if (a5)
        a5 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a5, kCFURLPOSIXPathStyle, 0);
      v12[4] = 0;
      v12[0] = 0;
      v12[1] = CFRetain(v8);
      v12[2] = 0;
      v12[3] = _NSURLDownloadReleaseClient;
      v12[5] = _NSURLDownloadDidStart;
      v12[6] = _NSURLDownloadWillSendRequest;
      v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
      v12[8] = _NSURLDownloadDidReceiveResponse;
      v12[9] = _NSURLDownloadWillResumeWithResponse;
      v12[10] = _NSURLDownloadDidReceiveData;
      v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
      v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
      v12[13] = _NSURLDownloadDidCreateDestination;
      v12[14] = _NSURLDownloadDidFinish;
      v12[15] = _NSURLDownloadDidFail;
      v8->_internal->cfDownload = (_CFURLDownload *)CFURLDownloadCreateWithResumeInformation(0, (const __CFDictionary *)a3, a5, v12);
      CFMakeCollectable(v8->_internal->cfDownload);
      if (a5)
        CFRelease(a5);
      -[NSURLDownload _setDelegate:](v8, "_setDelegate:", a4, v12[0]);
      cfDownload = (uint64_t)v8->_internal->cfDownload;
      Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(cfDownload, (uint64_t)Current, *MEMORY[0x1E0C9B280]);
      CFURLDownloadStart((uint64_t)v8->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (NSURLDownload)initWithResumeData:(NSData *)resumeData delegate:(id)delegate path:(NSString *)path
{
  NSURLDownload *v8;
  uint64_t cfDownload;
  CFRunLoopRef Current;
  _QWORD v12[16];

  v8 = -[NSURLDownload init](self, "init");
  if (v8)
  {
    if (-[NSString isAbsolutePath](path, "isAbsolutePath"))
    {
      if (path)
        path = (NSString *)CFURLCreateWithFileSystemPath(0, (CFStringRef)path, kCFURLPOSIXPathStyle, 0);
      v12[4] = 0;
      v12[0] = 0;
      v12[1] = CFRetain(v8);
      v12[2] = 0;
      v12[3] = _NSURLDownloadReleaseClient;
      v12[5] = _NSURLDownloadDidStart;
      v12[6] = _NSURLDownloadWillSendRequest;
      v12[7] = _NSURLDownloadDidReceiveAuthenticationChallenge;
      v12[8] = _NSURLDownloadDidReceiveResponse;
      v12[9] = _NSURLDownloadWillResumeWithResponse;
      v12[10] = _NSURLDownloadDidReceiveData;
      v12[11] = _NSURLDownloadShouldDecodeDataOfMIMEType;
      v12[12] = _NSURLDownloadDecideDestinationWithSuggestedObjectName;
      v12[13] = _NSURLDownloadDidCreateDestination;
      v12[14] = _NSURLDownloadDidFinish;
      v12[15] = _NSURLDownloadDidFail;
      v8->_internal->cfDownload = (_CFURLDownload *)CFURLDownloadCreateWithResumeData(0, (CFDataRef)resumeData, path, v12);
      CFMakeCollectable(v8->_internal->cfDownload);
      if (path)
        CFRelease(path);
      -[NSURLDownload _setDelegate:](v8, "_setDelegate:", delegate, v12[0]);
      cfDownload = (uint64_t)v8->_internal->cfDownload;
      Current = CFRunLoopGetCurrent();
      CFURLDownloadScheduleWithRunLoop(cfDownload, (uint64_t)Current, *MEMORY[0x1E0C9B280]);
      CFURLDownloadStart((uint64_t)v8->_internal->cfDownload);
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (NSString)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLDownload;
  return -[NSString stringByAppendingFormat:](-[NSURLDownload description](&v3, sel_description), "stringByAppendingFormat:", CFSTR(" { request: %@ }"), -[NSURLDownload request](self, "request"));
}

- (id)_resumeInformation
{
  _CFURLDownload *cfDownload;
  URLDownload *v3;
  const __CFAllocator *v4;
  CFDictionaryRef ResumeInformation;
  CFDictionaryRef v6;
  const __CFDictionary *v7;

  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1)
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
  if (cfDownload)
    v3 = (URLDownload *)((char *)cfDownload + 16);
  else
    v3 = 0;
  v4 = CFGetAllocator(cfDownload);
  ResumeInformation = URLDownload::createResumeInformation(v3, v4);
  v6 = ResumeInformation;
  if (ResumeInformation)
  {
    CFMakeCollectable(ResumeInformation);
    v7 = v6;
  }
  return v6;
}

- (NSData)resumeData
{
  CFDictionaryRef v2;
  NSData *v3;
  NSData *v4;

  v2 = CFURLDownloadCopyResumeData((char *)self->_internal->cfDownload);
  v3 = (NSData *)v2;
  if (v2)
  {
    CFMakeCollectable(v2);
    v4 = v3;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)NSURLDownload;
  -[NSURLDownload dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  self->_internal->downloadActive = 0;
  CFURLDownloadCancel((uint64_t)self->_internal->cfDownload);
}

- (NSURLRequest)request
{
  NSURLRequest *result;
  NSURLRequest *v3;
  NSURLRequest *v4;

  result = (NSURLRequest *)CFURLDownloadCopyRequest((char *)self->_internal->cfDownload);
  if (result)
  {
    v3 = result;
    v4 = (NSURLRequest *)-[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", result);
    CFRelease(v3);
    return v4;
  }
  return result;
}

- (void)setDestination:(NSString *)path allowOverwrite:(BOOL)allowOverwrite
{
  _BOOL4 v4;
  const __CFURL *v7;
  const __CFURL *v8;

  if (!path)
    __assert_rtn("-[NSURLDownload setDestination:allowOverwrite:]", "NSURLDownload.mm", 357, "path");
  v4 = allowOverwrite;
  if (!-[NSString isAbsolutePath](path, "isAbsolutePath"))
    __assert_rtn("-[NSURLDownload setDestination:allowOverwrite:]", "NSURLDownload.mm", 358, "[path isAbsolutePath]");
  v7 = CFURLCreateWithFileSystemPath(0, (CFStringRef)path, kCFURLPOSIXPathStyle, 0);
  if (v7)
  {
    v8 = v7;
    CFURLDownloadSetDestination((uint64_t)self->_internal->cfDownload, v7, v4);
    CFRelease(v8);
  }
  else
  {
    NSLog(CFSTR("setDestination:allowOverwrite: failed to create url for path."));
    -[NSURLDownload cancel](self, "cancel");
  }
}

- (void)setDeletesFileUponFailure:(BOOL)deletesFileUponFailure
{
  _CFURLDownload *cfDownload;
  char *v5;

  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1)
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
  v5 = (char *)cfDownload + 16;
  if (!cfDownload)
    v5 = 0;
  v5[281] = deletesFileUponFailure;
}

- (BOOL)deletesFileUponFailure
{
  _CFURLDownload *cfDownload;
  char *v3;

  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1)
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
  v3 = (char *)cfDownload + 16;
  if (!cfDownload)
    v3 = 0;
  return v3[281] != 0;
}

- (void)_setDelegateQueue:(id)a3
{
  NSOperationQueue *targetQueue;

  targetQueue = self->_internal->_targetQueue;
  if (targetQueue != a3)
  {

    self->_internal->_targetQueue = (NSOperationQueue *)a3;
  }
}

- (id)url
{
  void *v2;
  const void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)CFURLDownloadCopyRequest((char *)self->_internal->cfDownload);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = objc_msgSend(v2, "_inner");
  v5 = *(void **)(v4 + 8);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(v4 + 8));
    CFMakeCollectable(v5);
    v6 = v5;
  }
  CFRelease(v3);
  return v5;
}

- (id)_directoryPath
{
  _CFURLDownload *cfDownload;
  char *v3;
  const void *v4;
  const __CFURL *v5;
  const __CFURL *v6;
  CFStringRef v7;
  void *v8;
  id v9;

  cfDownload = self->_internal->cfDownload;
  if (URLDownload::Class(void)::sOnce_URLDownload != -1)
    dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
  v3 = (char *)cfDownload + 16;
  if (!cfDownload)
    v3 = 0;
  v4 = (const void *)*((_QWORD *)v3 + 27);
  if (!v4)
    return 0;
  v5 = (const __CFURL *)CFRetain(v4);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = CFURLCopyFileSystemPath(v5, kCFURLPOSIXPathStyle);
  if (v7)
  {
    v8 = (void *)CFMakeCollectable(v7);
    v9 = v8;
  }
  else
  {
    v8 = 0;
  }
  CFRelease(v6);
  return v8;
}

- (void)_setDelegate:(id)a3
{
  id v5;

  v5 = a3;

  self->_internal->delegate = a3;
}

- (void)_setDirectoryPath:(id)a3
{
  CFURLRef v4;
  _CFURLDownload *cfDownload;
  URLDownload *v6;

  if (a3)
    v4 = CFURLCreateWithFileSystemPath(0, (CFStringRef)a3, kCFURLPOSIXPathStyle, 1u);
  else
    v4 = 0;
  cfDownload = self->_internal->cfDownload;
  if (cfDownload)
  {
    if (URLDownload::Class(void)::sOnce_URLDownload != -1)
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
    v6 = (URLDownload *)((char *)cfDownload + 16);
  }
  else
  {
    v6 = 0;
  }
  URLDownload::setDirectoryURL(v6, v4);
  if (v4)
    CFRelease(v4);
}

- (void)withDelegate:(id)a3
{
  void *v4;

  if (self->_internal->_targetQueue)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", a3);
    -[NSOperationQueue addOperation:](self->_internal->_targetQueue, "addOperation:", v4);
    objc_msgSend(v4, "waitUntilFinished");
  }
  else
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

uint64_t __29__NSURLDownload_sendDidFail___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didFailWithError:");
}

uint64_t __30__NSURLDownload_sendDidFinish__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "downloadDidFinish:");
}

uint64_t __42__NSURLDownload_sendDidCreateDestination___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didCreateDestination:");
}

uint64_t __62__NSURLDownload_sendDecideDestinationWithSuggestedObjectName___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:decideDestinationWithSuggestedFilename:");
}

uint64_t __48__NSURLDownload_sendShouldDecodeDataOfMIMEType___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:shouldDecodeSourceDataOfMIMEType:");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __36__NSURLDownload_sendDidReceiveData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didReceiveDataOfLength:");
}

uint64_t __57__NSURLDownload_sendWillResumeWithResponse_startingByte___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:willResumeWithResponse:fromByte:");
}

uint64_t __40__NSURLDownload_sendDidReceiveResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didReceiveResponse:");
}

uint64_t __41__NSURLDownload_sendDidReceiveChallenge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didReceiveAuthenticationChallenge:");
}

void __54__NSURLDownload_sendWillSendRequest_redirectResponse___block_invoke(_QWORD *a1)
{
  id v2;
  id v3;

  v2 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", a1[6]);
  if (a1[7])
    +[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:");
  v3 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1[4] + 8) + 32), "download:willSendRequest:redirectResponse:");

  if (v3 != v2)
  {
    if (v3)
      CFRetain(v3);
    *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v3;
  }
}

uint64_t __30__NSURLDownload_sendDidStart___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "downloadDidBegin:");
}

void __30__NSURLDownload_sendDidStart___block_invoke_2(uint64_t a1)
{
  uint64_t v2;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "downloadShouldUseCredentialStorage:") & 1) == 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 8);
    if (URLDownload::Class(void)::sOnce_URLDownload != -1)
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
    *(_BYTE *)(v2 + 336) = 0;
  }
}

+ (id)_downloadWithLoadingConnection:(id)a3 request:(id)a4 response:(id)a5 delegate:(id)a6 proxy:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithLoadingConnection:request:response:delegate:proxy:", a3, a4, a5, a6, a7);
}

+ (id)_downloadWithLoadingCFURLConnection:(_CFURLConnection *)a3 request:(_CFURLRequest *)a4 response:(_CFURLResponse *)a5 delegate:(id)a6 proxy:(id)a7
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithLoadingCFURLConnection:request:response:delegate:proxy:", a3, a4, a5, a6, a7);
}

+ (id)_downloadWithRequest:(id)a3 delegate:(id)a4 directory:(id)a5
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "_initWithRequest:delegate:directory:", a3, a4, a5);
}

+ (BOOL)canResumeDownloadDecodedWithEncodingMIMEType:(NSString *)MIMEType
{
  BOOL v4;

  v4 = 1;
  if (CFStringCompare((CFStringRef)MIMEType, CFSTR("application/mac-binhex40"), 1uLL))
    return CFStringCompare((CFStringRef)MIMEType, CFSTR("application/macbinary"), 1uLL) == kCFCompareEqualTo;
  return v4;
}

- (void)useCredential:(id)a3 forAuthenticationChallenge:(id)a4
{
  NSURLDownloadInternal *internal;
  _CFURLDownload *cfDownload;
  const _CFURLCredential *v7;
  _CFURLAuthChallenge *currCFChallenge;
  URLDownload *v9;

  internal = self->_internal;
  if (internal->currNSChallenge == a4)
  {
    cfDownload = internal->cfDownload;
    v7 = (const _CFURLCredential *)objc_msgSend(a3, "_cfurlcredential");
    currCFChallenge = self->_internal->currCFChallenge;
    if (URLDownload::Class(void)::sOnce_URLDownload != -1)
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
    if (cfDownload)
      v9 = (URLDownload *)((char *)cfDownload + 16);
    else
      v9 = 0;
    URLDownload::useCredential(v9, v7, currCFChallenge);
    -[NSURLDownload cleanupChallenges]((uint64_t)self);
  }
}

- (void)continueWithoutCredentialForAuthenticationChallenge:(id)a3
{
  NSURLDownloadInternal *internal;
  _CFURLAuthChallenge *currCFChallenge;
  _CFURLDownload *cfDownload;
  URLDownload *v7;

  internal = self->_internal;
  if (internal->currNSChallenge == a3)
  {
    cfDownload = internal->cfDownload;
    currCFChallenge = internal->currCFChallenge;
    if (URLDownload::Class(void)::sOnce_URLDownload != -1)
      dispatch_once(&URLDownload::Class(void)::sOnce_URLDownload, &__block_literal_global_4678);
    if (cfDownload)
      v7 = (URLDownload *)((char *)cfDownload + 16);
    else
      v7 = 0;
    URLDownload::useCredential(v7, 0, currCFChallenge);
    -[NSURLDownload cleanupChallenges]((uint64_t)self);
  }
}

- (void)cancelAuthenticationChallenge:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
    v5 = (void *)objc_msgSend(v4, "_web_initWithDomain_nowarn:code:URL:", *MEMORY[0x1E0CB32E8], -1012, -[NSURLDownload url](self, "url"));
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __83__NSURLDownload_NSURLAuthenticationChallengeSender__cancelAuthenticationChallenge___block_invoke;
    v6[3] = &unk_1E14FDE88;
    v6[4] = self;
    v6[5] = v5;
    -[NSURLDownload withDelegate:](self, "withDelegate:", v6);

  }
  -[NSURLDownload cleanupChallenges]((uint64_t)self);
  self->_internal->downloadActive = 0;
  CFURLDownloadCancel((uint64_t)self->_internal->cfDownload);
}

uint64_t __83__NSURLDownload_NSURLAuthenticationChallengeSender__cancelAuthenticationChallenge___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32), "download:didFailWithError:");
}

- (void)cleanupChallenges
{
  if (a1)
  {

    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 24) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 8) + 16) = 0;
  }
}

@end
