@implementation AVAssetResourceLoadingRequest

uint64_t __74__AVAssetResourceLoadingRequest__ensureResponseInfoSentToCustomURLHandler__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendResponseInfoToCustomURLHandler");
}

- (BOOL)_canSetOrUseCachedContentInformation
{
  return -[NSArray count](-[AVAssetResourceLoadingContentInformationRequest allowedContentTypes](self->_loadingRequest->contentInformationRequest, "allowedContentTypes"), "count") <= 1&& !-[AVAssetResourceLoadingRequest _isRequestForContentKey](self, "_isRequestForContentKey")&& -[AVAssetResourceLoadingContentInformationRequest renewalDate](self->_loadingRequest->contentInformationRequest, "renewalDate") == 0;
}

- (BOOL)_isRequestForContentKey
{
  -[AVAssetResourceLoadingRequest _requestInfo](self, "_requestInfo");
  return FigCustomURLRequestInfoCopyCryptor() == 0;
}

- (__CFDictionary)_requestInfo
{
  return self->_loadingRequest->requestInfo;
}

- (void)finishLoading
{
  int *p_finished;
  NSString *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;

  p_finished = &self->_loadingRequest->finished;
  do
  {
    if (__ldaxr((unsigned int *)p_finished))
    {
      __clrex();
      NSLog(&CFSTR("*** -[AVAssetResourceLoadingRequest finishLoading] was sent to an instance of AVAssetResourceLoadingRequest"
                   " that was already finished. Ignoring.").isa);
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_finished));
  v6 = -[AVAssetResourceLoadingContentInformationRequest contentType](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "contentType");
  v7 = -[AVAssetResourceLoadingContentInformationRequest allowedContentTypes](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "allowedContentTypes");
  if (dyld_program_sdk_at_least() && v7 && v6 && !-[NSArray containsObject:](v7, "containsObject:", v6))
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Must respond with a contentType contained in AVAssetResourceLoadingContentInformationRequest.allowedContentTypes."), v8, v9, v10, v11, v12, v15), 0);
    objc_exception_throw(v14);
  }
  if (-[AVAssetResourceLoadingRequest _contentKeySessionIsAttached](self, "_contentKeySessionIsAttached")
    && (-[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.streamingkeydelivery.contentkey"))
     || -[NSString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.streamingkeydelivery.persistentcontentkey"))))
  {
    -[AVAssetResourceLoadingRequest forwardRequestToContentKeySession](self, "forwardRequestToContentKeySession");
  }
  else
  {
    v13 = -[AVAssetResourceLoadingRequest _getAndClearCachedData](self, "_getAndClearCachedData");
    if (v13)
      -[AVAssetResourceLoadingRequest _sendDataToCustomURLHandler:](self, "_sendDataToCustomURLHandler:", v13);
    -[AVAssetResourceLoadingRequest _sendFinishLoadingToCustomURLHandler](self, "_sendFinishLoadingToCustomURLHandler");
  }
}

- (void)_sendResponseInfoToCustomURLHandler
{
  NSURLResponse *v3;
  uint64_t v4;
  NSDictionary *cachedContentInformation;
  int v6;
  OpaqueFigCustomURLHandler *v7;
  unint64_t requestID;
  void (*v9)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);

  if (!-[AVAssetResourceLoadingRequest isCancelled](self, "isCancelled")
    && !FigCustomURLResponseInfoCreateMutable())
  {
    -[AVAssetResourceLoadingRequest response](self, "response");
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v3 = -[AVAssetResourceLoadingRequest response](self, "response"),
          -[NSURLResponse statusCode](v3, "statusCode"),
          !FigCustomURLResponseInfoSetHTTPStatusCode())
      && (-[NSURLResponse allHeaderFields](v3, "allHeaderFields"),
          !FigCustomURLResponseInfoSetHTTPHeaders()))
    {
      if (!-[AVAssetResourceLoadingRequest redirect](self, "redirect")
        || (-[NSURLRequest URL](-[AVAssetResourceLoadingRequest redirect](self, "redirect"), "URL"),
            !FigCustomURLResponseInfoSetRedirectLocation())
        && (-[NSURLRequest allHTTPHeaderFields](-[AVAssetResourceLoadingRequest redirect](self, "redirect"), "allHTTPHeaderFields"), !FigCustomURLResponseInfoSetRedirectRequestHeaders()))
      {
        if (-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"))
        {
          -[AVAssetResourceLoadingContentInformationRequest contentType](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "contentType");
          v4 = -[AVAssetResourceLoadingContentInformationRequest contentLength](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "contentLength");
          -[AVAssetResourceLoadingContentInformationRequest renewalDate](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "renewalDate");
          -[AVAssetResourceLoadingContentInformationRequest isDiskCachingPermitted](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "isDiskCachingPermitted");
          -[AVAssetResourceLoadingContentInformationRequest isByteRangeAccessSupported](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "isByteRangeAccessSupported");
          -[AVAssetResourceLoadingContentInformationRequest isEntireLengthAvailableOnDemand](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "isEntireLengthAvailableOnDemand");
        }
        else
        {
          cachedContentInformation = self->_loadingRequest->cachedContentInformation;
          if (!cachedContentInformation)
          {
            v4 = 0;
            v6 = 0;
            goto LABEL_14;
          }
          -[NSDictionary objectForKey:](cachedContentInformation, "objectForKey:", CFSTR("Content-Type"));
          v4 = objc_msgSend(-[NSDictionary objectForKey:](self->_loadingRequest->cachedContentInformation, "objectForKey:", CFSTR("Content-Length")), "longLongValue");
          objc_msgSend(-[NSDictionary objectForKey:](self->_loadingRequest->cachedContentInformation, "objectForKey:", CFSTR("Accept-Ranges")), "BOOLValue");
        }
        v6 = 1;
LABEL_14:
        if (-[AVAssetResourceLoadingDataRequest requestedLength](self->_loadingRequest->dataRequest, "requestedLength") < 1
          || -[AVAssetResourceLoadingDataRequest requestsAllDataToEndOfResource](self->_loadingRequest->dataRequest, "requestsAllDataToEndOfResource"))
        {
          if (!v4)
          {
LABEL_20:
            if (!v6
              || !FigCustomURLResponseInfoSetUniversalTypeIdentifier()
              && !FigCustomURLResponseInfoSetResourceSize()
              && !FigCustomURLResponseInfoSetContentRenewalDate()
              && !FigCustomURLResponseInfoSetIsCachingDisabled()
              && !FigCustomURLResponseInfoSetIsByteRangeAccessSupported()
              && !FigCustomURLResponseInfoSetIsEntireLengthAvailableOnDemand())
            {
              v7 = -[AVAssetResourceLoadingRequest _customURLHandler](self, "_customURLHandler");
              requestID = self->_loadingRequest->requestID;
              v9 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                                + 8);
              if (v9)
                v9(v7, requestID, 0);
            }
            return;
          }
        }
        else
        {
          -[AVAssetResourceLoadingDataRequest requestedLength](self->_loadingRequest->dataRequest, "requestedLength");
        }
        if (FigCustomURLResponseInfoSetContentLength())
          return;
        goto LABEL_20;
      }
    }
  }
}

- (AVAssetResourceLoadingContentInformationRequest)contentInformationRequest
{
  return self->_loadingRequest->contentInformationRequest;
}

- (NSURLResponse)response
{
  NSObject *ivarAccessQueue;
  NSURLResponse *v3;
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
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVAssetResourceLoadingRequest_response__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSURLResponse *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSURLRequest)redirect
{
  NSObject *ivarAccessQueue;
  NSURLRequest *v3;
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
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __41__AVAssetResourceLoadingRequest_redirect__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSURLRequest *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_sendDataToCustomURLHandler:(id)a3
{
  OpaqueFigCustomURLHandler *v4;
  unint64_t requestID;
  void (*v6)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD);

  if (!-[AVAssetResourceLoadingRequest isCancelled](self, "isCancelled"))
  {
    -[AVAssetResourceLoadingRequest _ensureResponseInfoSentToCustomURLHandler](self, "_ensureResponseInfoSentToCustomURLHandler");
    if (!FigCreateBlockBufferWithCFDataNoCopy())
    {
      v4 = -[AVAssetResourceLoadingRequest _customURLHandler](self, "_customURLHandler");
      requestID = self->_loadingRequest->requestID;
      v6 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 16);
      if (v6)
        v6(v4, requestID, 0);
    }
  }
}

- (BOOL)isCancelled
{
  return self->_loadingRequest->cancelled != 0;
}

- (OpaqueFigCustomURLHandler)_customURLHandler
{
  return self->_loadingRequest->customURLHandler;
}

- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 URL:(id)a4 httpRequestHeaders:(id)a5 requestOffset:(id)a6 requestLength:(id)a7 allowedContentTypes:(id)a8 figCryptor:(OpaqueFigCPECryptor *)a9 cryptorKeyRequestID:(unint64_t)a10
{
  AVAssetResourceLoadingRequest *v16;
  AVAssetResourceLoadingRequestInternal *v17;
  AVAssetResourceLoadingRequestInternal *loadingRequest;
  uint64_t v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  OpaqueFigCPECryptor *v27;
  OpaqueFigCustomURLHandler *v29;
  OpaqueFigCustomURLLoader *v30;
  AVAssetResourceLoadingDataRequest *v31;
  objc_super v32;

  v32.receiver = self;
  v32.super_class = (Class)AVAssetResourceLoadingRequest;
  v16 = -[AVAssetResourceLoadingRequest init](&v32, sel_init);
  if (v16)
  {
    v17 = objc_alloc_init(AVAssetResourceLoadingRequestInternal);
    v16->_loadingRequest = v17;
    if (v17
      && (CFRetain(v17),
          v16->_loadingRequest->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v16), v16->_loadingRequest->weakReferenceToResourceLoader = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3), v16->_loadingRequest->URLRequest = (NSMutableURLRequest *)objc_msgSend(objc_alloc(MEMORY[0x1E0C92C28]), "initWithURL:", a4), v16->_loadingRequest->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingrequest.ivars"), v16->_loadingRequest->dataCachingQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingrequest.dataCaching"), loadingRequest = v16->_loadingRequest, loadingRequest->weakReference)&& a4
      && loadingRequest->weakReferenceToResourceLoader
      && loadingRequest->URLRequest
      && loadingRequest->ivarAccessQueue
      && loadingRequest->dataCachingQueue)
    {
      v16->_loadingRequest->cachedContentInformation = (NSDictionary *)(id)objc_msgSend(a3, "cachedContentInformationForURL:", a4);
      if (a5)
        -[NSMutableURLRequest setAllHTTPHeaderFields:](v16->_loadingRequest->URLRequest, "setAllHTTPHeaderFields:", a5);
      if (!v16->_loadingRequest->cachedContentInformation)
        -[AVAssetResourceLoadingRequest _setContentInformationRequest:](v16, "_setContentInformationRequest:", -[AVAssetResourceLoadingContentInformationRequest initWithLoadingRequest:allowedContentTypes:]([AVAssetResourceLoadingContentInformationRequest alloc], "initWithLoadingRequest:allowedContentTypes:", v16, a8));
      v19 = 0;
      v20 = 1;
      v21 = 0x7FFFFFFFFFFFFFFFLL;
      v22 = 0;
      if (a6 && a7)
      {
        v23 = objc_msgSend(-[NSDictionary objectForKey:](v16->_loadingRequest->cachedContentInformation, "objectForKey:", CFSTR("Content-Length")), "longLongValue");
        v19 = objc_msgSend(a6, "longLongValue");
        v24 = objc_msgSend(a7, "longLongValue");
        v21 = v24;
        v22 = 0;
        v25 = v24 + v19;
        v26 = v23 <= 0 || v25 < v23;
        v20 = !v26;
        if (v24 >= 1 && (v19 & 0x8000000000000000) == 0)
          v22 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("bytes=%lld-%lld"), v19, v25 - 1);
      }
      -[NSMutableURLRequest setValue:forHTTPHeaderField:](v16->_loadingRequest->URLRequest, "setValue:forHTTPHeaderField:", v22, CFSTR("Range"));
      if (a9)
        v27 = (OpaqueFigCPECryptor *)CFRetain(a9);
      else
        v27 = 0;
      v16->_loadingRequest->figCryptor = v27;
      v16->_loadingRequest->cryptorKeyRequestID = a10;
      v29 = (OpaqueFigCustomURLHandler *)objc_msgSend(a3, "_customURLHandler");
      if (v29)
        v29 = (OpaqueFigCustomURLHandler *)CFRetain(v29);
      v16->_loadingRequest->customURLHandler = v29;
      v30 = (OpaqueFigCustomURLLoader *)objc_msgSend(a3, "_customURLLoader");
      if (v30)
        v30 = (OpaqueFigCustomURLLoader *)CFRetain(v30);
      v16->_loadingRequest->customURLLoader = v30;
      v31 = -[AVAssetResourceLoadingDataRequest initWithLoadingRequest:requestedOffset:requestedLength:requestsAllDataToEndOfResource:canSupplyIncrementalDataImmediately:]([AVAssetResourceLoadingDataRequest alloc], "initWithLoadingRequest:requestedOffset:requestedLength:requestsAllDataToEndOfResource:canSupplyIncrementalDataImmediately:", v16, v19, v21, v20, v16->_loadingRequest->figCryptor == 0);
      -[AVAssetResourceLoadingRequest _setDataRequest:](v16, "_setDataRequest:", v31);

      v16->_loadingRequest->responseInfoSentOnceToken = objc_alloc_init(AVDispatchOnce);
    }
    else
    {

      return 0;
    }
  }
  return v16;
}

- (void)_setDataRequest:(id)a3
{
  id v5;

  v5 = a3;

  self->_loadingRequest->dataRequest = (AVAssetResourceLoadingDataRequest *)a3;
}

- (void)_setContentInformationRequest:(id)a3
{
  id v5;

  v5 = a3;

  self->_loadingRequest->contentInformationRequest = (AVAssetResourceLoadingContentInformationRequest *)a3;
}

- (void)_ensureResponseInfoSentToCustomURLHandler
{
  AVDispatchOnce *responseInfoSentOnceToken;
  _QWORD v3[5];

  responseInfoSentOnceToken = self->_loadingRequest->responseInfoSentOnceToken;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __74__AVAssetResourceLoadingRequest__ensureResponseInfoSentToCustomURLHandler__block_invoke;
  v3[3] = &unk_1E302FA10;
  v3[4] = self;
  -[AVDispatchOnce runBlockOnce:](responseInfoSentOnceToken, "runBlockOnce:", v3);
}

- (id)_weakReference
{
  return self->_loadingRequest->weakReference;
}

- (AVAssetResourceLoadingRequest)initWithResourceLoader:(id)a3 requestInfo:(__CFDictionary *)a4 requestID:(unint64_t)a5
{
  int v9;
  int ByteRange;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  __CFDictionary *v15;

  if (!FigCustomURLRequestInfoCopyURL())
  {
    v9 = FigCustomURLRequestInfoCopyHTTPHeaders();
    if (!v9 || v9 == -17360)
    {
      ByteRange = FigCustomURLRequestInfoGetByteRange();
      if (ByteRange == -17360)
      {
        v11 = 0;
        v12 = 0;
      }
      else
      {
        if (ByteRange)
          goto LABEL_17;
        v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
        v11 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", 0);
      }
      v13 = FigCustomURLRequestInfoCopyCryptor();
      if (!v13 || v13 == -17360)
      {
        v14 = FigCustomURLRequestInfoCopyAllowedUniversalTypeIdentifiers();
        if (!v14 || v14 == -17360)
        {
          self = -[AVAssetResourceLoadingRequest initWithResourceLoader:URL:httpRequestHeaders:requestOffset:requestLength:allowedContentTypes:figCryptor:cryptorKeyRequestID:](self, "initWithResourceLoader:URL:httpRequestHeaders:requestOffset:requestLength:allowedContentTypes:figCryptor:cryptorKeyRequestID:", a3, 0, 0, v12, v11, 0, 0, 0);
          if (self)
          {
            if (a4)
              v15 = (__CFDictionary *)CFRetain(a4);
            else
              v15 = 0;
            self->_loadingRequest->requestInfo = v15;
            self->_loadingRequest->requestID = a5;
          }
        }
      }
    }
  }
LABEL_17:

  return self;
}

- (NSURLRequest)request
{
  return &self->_loadingRequest->URLRequest->super;
}

- (AVAssetResourceLoadingDataRequest)dataRequest
{
  return self->_loadingRequest->dataRequest;
}

id __55__AVAssetResourceLoadingRequest__getAndClearCachedData__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104) = 0;
  return result;
}

- (void)dealloc
{
  AVAssetResourceLoadingRequestInternal *loadingRequest;
  AVAssetResourceLoadingRequestInternal *v4;
  NSObject *dataCachingQueue;
  AVAssetResourceLoadingRequestInternal *v6;
  OpaqueFigCPECryptor *figCryptor;
  OpaqueFigCustomURLHandler *customURLHandler;
  OpaqueFigCustomURLLoader *customURLLoader;
  __CFDictionary *requestInfo;
  AVAssetResourceLoadingRequestInternal *v11;
  NSObject *ivarAccessQueue;
  objc_super v13;

  loadingRequest = self->_loadingRequest;
  if (loadingRequest)
  {

    v4 = self->_loadingRequest;
    dataCachingQueue = v4->dataCachingQueue;
    if (dataCachingQueue)
    {
      dispatch_release(dataCachingQueue);
      v4 = self->_loadingRequest;
    }

    v6 = self->_loadingRequest;
    figCryptor = v6->figCryptor;
    if (figCryptor)
    {
      CFRelease(figCryptor);
      v6 = self->_loadingRequest;
    }
    customURLHandler = v6->customURLHandler;
    if (customURLHandler)
    {
      CFRelease(customURLHandler);
      v6 = self->_loadingRequest;
    }
    customURLLoader = v6->customURLLoader;
    if (customURLLoader)
    {
      CFRelease(customURLLoader);
      v6 = self->_loadingRequest;
    }
    requestInfo = v6->requestInfo;
    if (requestInfo)
    {
      CFRelease(requestInfo);
      v6 = self->_loadingRequest;
    }

    v11 = self->_loadingRequest;
    if (v11->streamingKeyRequestCompletionHandler)
    {
      NSLog(&CFSTR("AVAssetResourceLoadingRequest %p deallocated while a streaming content key request is still being generated; le"
               "aking completion handler. Either keep a retain of the AVAssetResourceLoadingRequest in -generateStreaming"
               "ContentKeyRequestDataAsynchronouslyForApp's completionHandler or wait until completionHandler is called b"
               "efore calling -finishLoading/-finishLoadingWithError:.").isa,
        self);
      v11 = self->_loadingRequest;
    }
    ivarAccessQueue = v11->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      v11 = self->_loadingRequest;
    }

    CFRelease(self->_loadingRequest);
  }
  v13.receiver = self;
  v13.super_class = (Class)AVAssetResourceLoadingRequest;
  -[AVAssetResourceLoadingRequest dealloc](&v13, sel_dealloc);
}

- (void)_sendFinishLoadingToCustomURLHandler
{
  -[AVAssetResourceLoadingRequest _sendFinishLoadingToCustomURLHandlerWithError:](self, "_sendFinishLoadingToCustomURLHandlerWithError:", 0);
}

- (void)_sendFinishLoadingToCustomURLHandlerWithError:(id)a3
{
  OpaqueFigCustomURLHandler *v5;
  unint64_t requestID;
  void (*v7)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD);

  if (!-[AVAssetResourceLoadingRequest isCancelled](self, "isCancelled"))
  {
    -[AVAssetResourceLoadingRequest _ensureResponseInfoSentToCustomURLHandler](self, "_ensureResponseInfoSentToCustomURLHandler");
    if (!self->_loadingRequest->cachedContentInformation
      && -[AVAssetResourceLoadingRequest _canSetOrUseCachedContentInformation](self, "_canSetOrUseCachedContentInformation"))
    {
      -[AVAssetResourceLoadingRequest _cacheContentInformation:](self, "_cacheContentInformation:", -[AVAssetResourceLoadingContentInformationRequest propertyList](-[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), "propertyList"));
    }
    v5 = -[AVAssetResourceLoadingRequest _customURLHandler](self, "_customURLHandler");
    requestID = self->_loadingRequest->requestID;
    v7 = *(void (**)(OpaqueFigCustomURLHandler *, unint64_t, id, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                          + 24);
    if (v7)
      v7(v5, requestID, a3, 0);
    objc_msgSend(-[AVAssetResourceLoadingRequest _resourceLoader](self, "_resourceLoader"), "_noteFinishingOfRequest:", self);
  }
}

- (id)_resourceLoader
{
  return -[AVWeakReference referencedObject](self->_loadingRequest->weakReferenceToResourceLoader, "referencedObject");
}

- (unint64_t)_requestID
{
  return self->_loadingRequest->requestID;
}

- (id)_getAndClearCachedData
{
  NSObject *dataCachingQueue;
  void *v3;
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
  dataCachingQueue = self->_loadingRequest->dataCachingQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVAssetResourceLoadingRequest__getAndClearCachedData__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_write(dataCachingQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)_contentKeySessionIsAttached
{
  void *v2;

  v2 = (void *)objc_msgSend(-[AVAssetResourceLoadingRequest _resourceLoader](self, "_resourceLoader"), "asset");
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v2, "contentKeySession") != 0;
}

- (void)_cacheContentInformation:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v10;
  uint64_t v11;

  if (self->_loadingRequest->cachedContentInformation)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Already have a cachedContentInformation"), v3, v4, v5, v6, v7, v11), 0);
    objc_exception_throw(v10);
  }
  if (-[AVAssetResourceLoadingRequest _canSetOrUseCachedContentInformation](self, "_canSetOrUseCachedContentInformation"))
  {
    objc_msgSend(-[AVAssetResourceLoadingRequest _resourceLoader](self, "_resourceLoader"), "cacheContentInformation:forURL:", a3, -[NSMutableURLRequest URL](self->_loadingRequest->URLRequest, "URL"));
  }
}

- (AVAssetResourceLoadingRequest)init
{
  return -[AVAssetResourceLoadingRequest initWithResourceLoader:URL:httpRequestHeaders:requestOffset:requestLength:allowedContentTypes:figCryptor:cryptorKeyRequestID:](self, "initWithResourceLoader:URL:httpRequestHeaders:requestOffset:requestLength:allowedContentTypes:figCryptor:cryptorKeyRequestID:", 0, 0, 0, 0, 0, 0, 0, 0);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, URL request = %@, request ID = %llu, content information request = %@, data request = %@>"), NSStringFromClass(v4), self, -[AVAssetResourceLoadingRequest request](self, "request"), -[AVAssetResourceLoadingRequest _requestID](self, "_requestID"), -[AVAssetResourceLoadingRequest contentInformationRequest](self, "contentInformationRequest"), -[AVAssetResourceLoadingRequest dataRequest](self, "dataRequest"));
}

- (OpaqueFigCustomURLLoader)_customURLLoader
{
  return self->_loadingRequest->customURLLoader;
}

- (BOOL)isFinished
{
  return self->_loadingRequest->finished != 0;
}

- (BOOL)_tryToMarkAsCancelled
{
  int *p_cancelled;
  BOOL result;

  p_cancelled = &self->_loadingRequest->cancelled;
  while (!__ldaxr((unsigned int *)p_cancelled))
  {
    result = 1;
    if (!__stlxr(1u, (unsigned int *)p_cancelled))
      return result;
  }
  result = 0;
  __clrex();
  return result;
}

+ (SEL)_selectorForInformingDelegateOfCancellationByFig
{
  return sel_resourceLoader_didCancelLoadingRequest_;
}

- (void)_performCancellationByClient
{
  -[AVAssetResourceLoadingRequest finishLoadingWithError:](self, "finishLoadingWithError:", objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 3072, 0));
}

- (void)setResponse:(NSURLResponse *)response
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v4 = -[NSURLResponse copy](response, "copy");
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AVAssetResourceLoadingRequest_setResponse___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __45__AVAssetResourceLoadingRequest_setResponse___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80) = *(_QWORD *)(a1 + 40);
}

uint64_t __41__AVAssetResourceLoadingRequest_response__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 80), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setRedirect:(NSURLRequest *)redirect
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v4 = -[NSURLRequest copy](redirect, "copy");
  ivarAccessQueue = self->_loadingRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__AVAssetResourceLoadingRequest_setRedirect___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __45__AVAssetResourceLoadingRequest_setRedirect___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88) = *(_QWORD *)(a1 + 40);
}

- (void)_appendToCachedData:(id)a3
{
  NSObject *dataCachingQueue;
  _QWORD v4[6];

  dataCachingQueue = self->_loadingRequest->dataCachingQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__AVAssetResourceLoadingRequest__appendToCachedData___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  av_readwrite_dispatch_queue_write(dataCachingQueue, v4);
}

uint64_t __53__AVAssetResourceLoadingRequest__appendToCachedData___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104);
  if (!v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104) = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 40), "length"));
    v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 104);
  }
  return objc_msgSend(v2, "appendData:", *(_QWORD *)(a1 + 40));
}

uint64_t __41__AVAssetResourceLoadingRequest_redirect__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 88), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)serializableRepresentation
{
  __CFDictionary *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  _BOOL4 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = -[AVAssetResourceLoadingRequest _requestInfo](self, "_requestInfo");
  v11 = -[AVAssetResourceLoadingRequest _isRequestForContentKey](self, "_isRequestForContentKey");
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[AVAssetResourceLoadingRequest _requestID](self, "_requestID")), CFSTR("FCUP_Response_RequestID"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSURL absoluteString](-[NSURLRequest URL](-[AVAssetResourceLoadingRequest request](self, "request"), "URL"), "absoluteString"), CFSTR("FCUP_Response_URL"));
  objc_msgSend(v4, "setObject:forKeyedSubscript:", -[NSURLRequest allHTTPHeaderFields](-[AVAssetResourceLoadingRequest request](self, "request"), "allHTTPHeaderFields"), CFSTR("FCUP_Response_Headers"));
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0)
                {
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) == 0)
                    objc_msgSend(v4, "removeObjectForKey:", v9);
                }
              }
            }
          }
        }
      }
      v6 = -[__CFDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
  objc_msgSend(v4, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11), CFSTR("FCUP_Response_IsContentKeyRequest"));
  return v4;
}

- (void)forwardRequestToContentKeySession
{
  OpaqueFigCustomURLLoader *v4;
  OpaqueFigCustomURLHandler *v5;
  OpaqueFigCustomURLHandler *v6;
  unint64_t requestID;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(OpaqueFigCustomURLLoader *, OpaqueFigCustomURLHandler *, OpaqueFigCustomURLHandler *, unint64_t);
  signed int v14;
  void *v15;
  uint64_t v16;

  v4 = -[AVAssetResourceLoadingRequest _customURLLoader](self, "_customURLLoader");
  v5 = -[AVAssetResourceLoadingRequest _customURLHandler](self, "_customURLHandler");
  v6 = -[AVAssetResourceLoadingRequest _copyContentKeySessionCustomURLHandler](self, "_copyContentKeySessionCustomURLHandler");
  requestID = self->_loadingRequest->requestID;
  if (!-[AVAssetResourceLoadingRequest _contentKeySessionIsAttached](self, "_contentKeySessionIsAttached"))
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("no contentKeySession"), v8, v9, v10, v11, v12, v16), 0);
    objc_exception_throw(v15);
  }
  v13 = *(uint64_t (**)(OpaqueFigCustomURLLoader *, OpaqueFigCustomURLHandler *, OpaqueFigCustomURLHandler *, unint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (!v13)
  {
    v14 = -12782;
LABEL_7:
    -[AVAssetResourceLoadingRequest _sendFinishLoadingToCustomURLHandlerWithError:](self, "_sendFinishLoadingToCustomURLHandlerWithError:", AVLocalizedErrorWithUnderlyingOSStatus(v14, 0));
    if (v6)
      goto LABEL_5;
    return;
  }
  v14 = v13(v4, v5, v6, requestID);
  if (v14)
    goto LABEL_7;
  if (v6)
LABEL_5:
    CFRelease(v6);
}

- (void)finishLoadingWithError:(NSError *)error
{
  uint64_t v3;
  int *p_finished;
  NSDictionary *v7;
  uint64_t v8;
  id v9;

  v3 = (uint64_t)error;
  p_finished = &self->_loadingRequest->finished;
  do
  {
    if (__ldaxr((unsigned int *)p_finished))
    {
      __clrex();
      NSLog(CFSTR("*** -[AVAssetResourceLoadingRequest finishLoadingWithError:] was sent to an instance of AVAssetResourceLoadingRequest that was already finished. Ignoring."), a2);
      return;
    }
  }
  while (__stlxr(1u, (unsigned int *)p_finished));
  v7 = -[NSError userInfo](error, "userInfo");
  v8 = *MEMORY[0x1E0CB3388];
  v9 = -[NSDictionary objectForKey:](v7, "objectForKey:", *MEMORY[0x1E0CB3388]);
  if (v9)
  {
    do
    {
      v3 = (uint64_t)v9;
      v9 = (id)objc_msgSend((id)objc_msgSend(v9, "userInfo"), "objectForKey:", v8);
    }
    while (v9);
  }
  else if (!v3)
  {
    v3 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11800, 0);
  }
  -[AVAssetResourceLoadingRequest _sendFinishLoadingToCustomURLHandlerWithError:](self, "_sendFinishLoadingToCustomURLHandlerWithError:", v3);
}

- (void)finishLoadingWithResponse:(NSURLResponse *)response data:(NSData *)data redirect:(NSURLRequest *)redirect
{
  -[AVAssetResourceLoadingRequest setResponse:](self, "setResponse:", response);
  -[AVAssetResourceLoadingRequest _appendToCachedData:](self, "_appendToCachedData:", data);
  -[AVAssetResourceLoadingRequest setRedirect:](self, "setRedirect:", redirect);
  -[AVAssetResourceLoadingRequest finishLoading](self, "finishLoading");
}

- (id)keyRequestDataUsingCryptorForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 performAsync:(BOOL)a6 error:(id *)a7
{
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  OpaqueFigCPECryptor *figCryptor;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t (*v24)(OpaqueFigCPECryptor *, _QWORD, _QWORD);
  signed int v25;
  AVAssetResourceLoadingRequest *v26;
  id v27;
  NSObject *global_queue;
  id v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t (*v32)(OpaqueFigCPECryptor *, void *, _QWORD, id *);
  signed int v33;
  id *v35;
  _BOOL4 v36;
  _QWORD block[7];
  id v38;
  _QWORD v39[4];
  _QWORD v40[6];

  v36 = a6;
  v40[4] = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v12 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("StreamingContentKeyIsForAirPlayKey")), "BOOLValue");
  v13 = objc_msgSend(a5, "objectForKey:", CFSTR("CSKRO_RemoteContext"));
  v14 = *MEMORY[0x1E0CA4D00];
  v15 = objc_msgSend(a5, "objectForKey:", *MEMORY[0x1E0CA4D00]);
  figCryptor = self->_loadingRequest->figCryptor;
  if (!figCryptor)
  {
    v33 = FigSignalErrorAt();
    goto LABEL_28;
  }
  v17 = v15;
  v35 = a7;
  v18 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("StreamingContentKeyRequestRequiresPersistentKey")), "BOOLValue");
  v19 = objc_msgSend((id)objc_msgSend(a5, "objectForKey:", CFSTR("StreamingContentKeyRequiresiTunesProvisioningKey")), "BOOLValue");
  v20 = *MEMORY[0x1E0CA4D18];
  v39[0] = *MEMORY[0x1E0CA4D10];
  v39[1] = v20;
  v40[0] = a3;
  v40[1] = a4;
  v39[2] = *MEMORY[0x1E0CA4D20];
  v40[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_loadingRequest->requestID);
  v39[3] = *MEMORY[0x1E0CA4D30];
  v40[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self->_loadingRequest->cryptorKeyRequestID);
  v21 = (id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 4), "mutableCopy");
  v22 = v21;
  if (v13)
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v13, *MEMORY[0x1E0CA4D58]);
  if (v19)
  {
    v23 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v23, *MEMORY[0x1E0CA4D60]);
    if (!v12)
      goto LABEL_6;
  }
  else if (!v12)
  {
LABEL_6:
    if (!v17)
      goto LABEL_8;
    goto LABEL_7;
  }
  v30 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
  objc_msgSend(v22, "setObject:forKeyedSubscript:", v30, *MEMORY[0x1E0CA4D28]);
  if (v17)
LABEL_7:
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v17, v14);
LABEL_8:
  if (v18)
  {
    v24 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                          + 56);
    if (!v24)
    {
LABEL_20:
      v29 = 0;
      v33 = -12782;
LABEL_21:
      a7 = v35;
      goto LABEL_22;
    }
    v25 = v24(figCryptor, *MEMORY[0x1E0CA3238], *MEMORY[0x1E0C9AE50]);
    if (v25)
    {
      v33 = v25;
      v29 = 0;
      goto LABEL_21;
    }
  }
  if (v36)
  {
    v26 = self;
    v27 = v22;
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __111__AVAssetResourceLoadingRequest_keyRequestDataUsingCryptorForApp_contentIdentifier_options_performAsync_error___block_invoke;
    block[3] = &unk_1E302FEE0;
    block[5] = self;
    block[6] = figCryptor;
    block[4] = v22;
    dispatch_async(global_queue, block);
    return 0;
  }
  v31 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v31 < 4uLL)
    goto LABEL_20;
  v32 = (uint64_t (*)(OpaqueFigCPECryptor *, void *, _QWORD, id *))v31[11];
  a7 = v35;
  if (!v32)
  {
    v29 = 0;
    v33 = -12782;
    goto LABEL_22;
  }
  v33 = v32(figCryptor, v22, *MEMORY[0x1E0C9AE00], &v38);
  if (!v38)
  {
LABEL_28:
    v29 = 0;
    goto LABEL_22;
  }
  v29 = v38;
LABEL_22:
  if (a7 && v33)
    *a7 = (id)AVLocalizedErrorWithUnderlyingOSStatus(v33, 0);
  return v29;
}

void __111__AVAssetResourceLoadingRequest_keyRequestDataUsingCryptorForApp_contentIdentifier_options_performAsync_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v5)(uint64_t, uint64_t, _QWORD, id *);
  signed int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = 0;
  v2 = *(_QWORD *)(a1 + 48);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
  if (*v4 >= 4uLL && (v5 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, id *))v4[11]) != 0)
    v6 = v5(v2, v3, *MEMORY[0x1E0C9AE00], &v9);
  else
    v6 = -12782;
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152);
  if (v7)
  {
    if (v6)
    {
      v8 = AVLocalizedErrorWithUnderlyingOSStatus(v6, 0);
      v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152);
    }
    else
    {
      v8 = 0;
    }
    (*(void (**)(uint64_t, id, uint64_t))(v7 + 16))(v7, v9, v8);

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 152) = 0;
  }

}

- (OpaqueFigCustomURLHandler)_copyContentKeySessionCustomURLHandler
{
  return (OpaqueFigCustomURLHandler *)objc_msgSend(-[AVAssetResourceLoadingRequest _resourceLoader](self, "_resourceLoader"), "_copyContentKeySessionCustomURLHandler");
}

- (NSData)streamingContentKeyRequestDataForApp:(NSData *)appIdentifier contentIdentifier:(NSData *)contentIdentifier options:(NSDictionary *)options error:(NSError *)outError
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSData *result;
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  NSError *v24;

  if (-[AVAssetResourceLoadingRequest _contentKeySessionIsAttached](self, "_contentKeySessionIsAttached"))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Cannot generate content key request when AVAsset is attached to AVContentKeySession");
    goto LABEL_11;
  }
  v24 = 0;
  if (!appIdentifier)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "appIdentifier != nil";
LABEL_10:
    v20 = (const __CFString *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)v23);
    v18 = v21;
    v19 = v22;
LABEL_11:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  if (!contentIdentifier)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "contentIdentifier != nil";
    goto LABEL_10;
  }
  result = -[AVAssetResourceLoadingRequest keyRequestDataUsingCryptorForApp:contentIdentifier:options:performAsync:error:](self, "keyRequestDataUsingCryptorForApp:contentIdentifier:options:performAsync:error:", appIdentifier, contentIdentifier, options, 0, &v24);
  if (outError)
    *outError = v24;
  return result;
}

- (void)generateStreamingContentKeyRequestDataAsynchronouslyForApp:(id)a3 contentIdentifier:(id)a4 options:(id)a5 completionHandler:(id)a6
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (**streamingKeyRequestCompletionHandler)(id, _QWORD);
  void *v18;
  uint64_t v19;
  const __CFString *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;

  if (-[AVAssetResourceLoadingRequest _contentKeySessionIsAttached](self, "_contentKeySessionIsAttached"))
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("Cannot generate content key request when AVAsset is attached to AVContentKeySession");
    goto LABEL_16;
  }
  v24 = 0;
  if (!a3)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "appIdentifier != nil";
LABEL_14:
    v20 = (const __CFString *)AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)v23);
    v18 = v21;
    v19 = v22;
    goto LABEL_16;
  }
  if (!a4)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "contentIdentifier != nil";
    goto LABEL_14;
  }
  if (!a6)
  {
    v21 = (void *)MEMORY[0x1E0C99DA0];
    v22 = *MEMORY[0x1E0C99778];
    v23 = "handler != nil";
    goto LABEL_14;
  }
  if (self->_loadingRequest->streamingKeyRequestCompletionHandler)
  {
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99768];
    v20 = CFSTR("A streaming content key request is already being generated on this AVAssetResourceLoadingRequest.");
LABEL_16:
    objc_exception_throw((id)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, v20, 0));
  }
  self->_loadingRequest->streamingKeyRequestCompletionHandler = (id)objc_msgSend(a6, "copy");
  -[AVAssetResourceLoadingRequest keyRequestDataUsingCryptorForApp:contentIdentifier:options:performAsync:error:](self, "keyRequestDataUsingCryptorForApp:contentIdentifier:options:performAsync:error:", a3, a4, a5, 1, &v24);
  if (v24)
  {
    streamingKeyRequestCompletionHandler = (void (**)(id, _QWORD))self->_loadingRequest->streamingKeyRequestCompletionHandler;
    if (streamingKeyRequestCompletionHandler)
    {
      streamingKeyRequestCompletionHandler[2](streamingKeyRequestCompletionHandler, 0);

      self->_loadingRequest->streamingKeyRequestCompletionHandler = 0;
    }
  }
}

- (NSData)persistentContentKeyFromKeyVendorResponse:(NSData *)keyVendorResponse options:(NSDictionary *)options error:(NSError *)outError
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  OpaqueFigCPECryptor *figCryptor;
  _QWORD *v11;
  uint64_t (*v12)(OpaqueFigCPECryptor *, NSData *, _QWORD);
  signed int v13;
  uint64_t (*v14)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *);
  NSData *result;
  NSError *v16;
  void *v17;
  id v18;

  v18 = 0;
  if (!keyVendorResponse)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)options, (uint64_t)outError, v5, v6, v7, (uint64_t)"keyVendorResponse != NULL"), 0);
    objc_exception_throw(v17);
  }
  figCryptor = self->_loadingRequest->figCryptor;
  if (figCryptor)
  {
    v11 = *(_QWORD **)(CMBaseObjectGetVTable() + 16);
    if (*v11 < 4uLL)
      goto LABEL_9;
    v12 = (uint64_t (*)(OpaqueFigCPECryptor *, NSData *, _QWORD))v11[12];
    if (!v12)
      goto LABEL_9;
    v13 = v12(figCryptor, keyVendorResponse, 0);
    if (v13)
      goto LABEL_10;
    v14 = *(uint64_t (**)(OpaqueFigCPECryptor *, _QWORD, _QWORD, id *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                + 48);
    if (v14)
    {
      v13 = v14(figCryptor, *MEMORY[0x1E0CA31F0], *MEMORY[0x1E0C9AE00], &v18);
      if (!v13)
        return (NSData *)v18;
    }
    else
    {
LABEL_9:
      v13 = -12782;
    }
  }
  else
  {
    v13 = FigSignalErrorAt();
    if (!v13)
      return (NSData *)v18;
  }
LABEL_10:
  if (!outError)
    return 0;
  v16 = (NSError *)AVLocalizedErrorWithUnderlyingOSStatus(v13, 0);
  result = 0;
  *outError = v16;
  return result;
}

- (AVAssetResourceLoadingRequestor)requestor
{
  AVAssetResourceLoadingRequestor *result;

  result = self->_loadingRequest->requestor;
  if (!result)
  {
    self->_loadingRequest->requestor = -[AVAssetResourceLoadingRequestor initWithRequestInfo:]([AVAssetResourceLoadingRequestor alloc], "initWithRequestInfo:", self->_loadingRequest->requestInfo);
    return self->_loadingRequest->requestor;
  }
  return result;
}

@end
