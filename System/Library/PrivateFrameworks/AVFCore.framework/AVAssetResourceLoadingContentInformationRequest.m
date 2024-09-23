@implementation AVAssetResourceLoadingContentInformationRequest

- (NSArray)allowedContentTypes
{
  NSObject *ivarAccessQueue;
  NSArray *v3;
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
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __70__AVAssetResourceLoadingContentInformationRequest_allowedContentTypes__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (NSDate)renewalDate
{
  NSObject *ivarAccessQueue;
  NSDate *v3;
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
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVAssetResourceLoadingContentInformationRequest_renewalDate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSDate *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isEntireLengthAvailableOnDemand
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __82__AVAssetResourceLoadingContentInformationRequest_isEntireLengthAvailableOnDemand__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)isDiskCachingPermitted
{
  return self->_contentInformationRequest->diskCachingPermitted;
}

- (BOOL)isByteRangeAccessSupported
{
  NSObject *ivarAccessQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__AVAssetResourceLoadingContentInformationRequest_isByteRangeAccessSupported__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (AVAssetResourceLoadingContentInformationRequest)initWithLoadingRequest:(id)a3 allowedContentTypes:(id)a4
{
  AVAssetResourceLoadingContentInformationRequest *v6;
  AVAssetResourceLoadingContentInformationRequestInternal *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVAssetResourceLoadingContentInformationRequest;
  v6 = -[AVAssetResourceLoadingContentInformationRequest init](&v9, sel_init);
  if (v6)
  {
    if (a3
      && (v7 = objc_alloc_init(AVAssetResourceLoadingContentInformationRequestInternal),
          (v6->_contentInformationRequest = v7) != 0))
    {
      v6->_contentInformationRequest->ivarAccessQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingcontentinformationrequest.ivars");
      v6->_contentInformationRequest->diskCachingPermitted = 1;
      v6->_contentInformationRequest->allowedContentTypes = (NSArray *)objc_msgSend(a4, "copy");
      CFRetain(v6->_contentInformationRequest);
    }
    else
    {

      return 0;
    }
  }
  return v6;
}

- (NSString)contentType
{
  NSObject *ivarAccessQueue;
  NSString *v3;
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
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__AVAssetResourceLoadingContentInformationRequest_contentType__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(ivarAccessQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)contentLength
{
  return self->_contentInformationRequest->contentLength;
}

- (id)propertyList
{
  AVAssetResourceLoadingContentInformationRequestInternal *contentInformationRequest;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  contentInformationRequest = self->_contentInformationRequest;
  if (!contentInformationRequest->contentType)
    return 0;
  v4 = (void *)MEMORY[0x1E0C99D80];
  v5 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", contentInformationRequest->contentLength);
  v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentInformationRequest->byteRangeAccessSupported);
  return (id)objc_msgSend(v4, "dictionaryWithObjectsAndKeys:", v5, CFSTR("Content-Length"), v6, CFSTR("Accept-Ranges"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", !self->_contentInformationRequest->diskCachingPermitted), CFSTR("no-cache"), self->_contentInformationRequest->contentType, CFSTR("Content-Type"), 0);
}

- (void)dealloc
{
  AVAssetResourceLoadingContentInformationRequestInternal *contentInformationRequest;
  AVAssetResourceLoadingContentInformationRequestInternal *v4;
  NSObject *ivarAccessQueue;
  objc_super v6;

  contentInformationRequest = self->_contentInformationRequest;
  if (contentInformationRequest)
  {

    v4 = self->_contentInformationRequest;
    ivarAccessQueue = v4->ivarAccessQueue;
    if (ivarAccessQueue)
    {
      dispatch_release(ivarAccessQueue);
      v4 = self->_contentInformationRequest;
    }

    CFRelease(self->_contentInformationRequest);
  }
  v6.receiver = self;
  v6.super_class = (Class)AVAssetResourceLoadingContentInformationRequest;
  -[AVAssetResourceLoadingContentInformationRequest dealloc](&v6, sel_dealloc);
}

- (AVAssetResourceLoadingContentInformationRequest)init
{
  return -[AVAssetResourceLoadingContentInformationRequest initWithLoadingRequest:allowedContentTypes:](self, "initWithLoadingRequest:allowedContentTypes:", 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  NSString *v6;
  uint64_t v7;
  const __CFString *v8;
  const __CFString *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVAssetResourceLoadingContentInformationRequest contentType](self, "contentType");
  v7 = -[AVAssetResourceLoadingContentInformationRequest contentLength](self, "contentLength");
  v8 = CFSTR("NO");
  if (-[AVAssetResourceLoadingContentInformationRequest isByteRangeAccessSupported](self, "isByteRangeAccessSupported"))
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[AVAssetResourceLoadingContentInformationRequest isDiskCachingPermitted](self, "isDiskCachingPermitted"))
    v8 = CFSTR("YES");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, content type = \"%@\", content length = %lld, byte range access supported = %@, disk caching permitted = %@, renewal date = %@>"), v5, self, v6, v7, v9, v8, -[AVAssetResourceLoadingContentInformationRequest renewalDate](self, "renewalDate"));
}

- (void)setContentType:(NSString *)contentType
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v4 = -[NSString copy](contentType, "copy");
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__AVAssetResourceLoadingContentInformationRequest_setContentType___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __66__AVAssetResourceLoadingContentInformationRequest_setContentType___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16) = *(_QWORD *)(a1 + 40);
}

uint64_t __62__AVAssetResourceLoadingContentInformationRequest_contentType__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setContentLength:(uint64_t)contentLength
{
  NSObject *ivarAccessQueue;
  _QWORD v4[6];

  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __68__AVAssetResourceLoadingContentInformationRequest_setContentLength___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = contentLength;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __68__AVAssetResourceLoadingContentInformationRequest_setContentLength___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 32) = *(_QWORD *)(result + 40);
  return result;
}

uint64_t __70__AVAssetResourceLoadingContentInformationRequest_allowedContentTypes__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setByteRangeAccessSupported:(BOOL)byteRangeAccessSupported
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __79__AVAssetResourceLoadingContentInformationRequest_setByteRangeAccessSupported___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = byteRangeAccessSupported;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __79__AVAssetResourceLoadingContentInformationRequest_setByteRangeAccessSupported___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 41) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __77__AVAssetResourceLoadingContentInformationRequest_isByteRangeAccessSupported__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 41);
  return result;
}

- (void)setRenewalDate:(NSDate *)renewalDate
{
  uint64_t v4;
  NSObject *ivarAccessQueue;
  _QWORD v6[6];

  v4 = -[NSDate copy](renewalDate, "copy");
  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __66__AVAssetResourceLoadingContentInformationRequest_setRenewalDate___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = self;
  v6[5] = v4;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v6);
}

void __66__AVAssetResourceLoadingContentInformationRequest_setRenewalDate___block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48) = *(_QWORD *)(a1 + 40);
}

uint64_t __62__AVAssetResourceLoadingContentInformationRequest_renewalDate__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (void)setDiskCachingPermitted:(BOOL)a3
{
  self->_contentInformationRequest->diskCachingPermitted = a3;
}

- (void)setEntireLengthAvailableOnDemand:(BOOL)entireLengthAvailableOnDemand
{
  NSObject *ivarAccessQueue;
  _QWORD v4[5];
  BOOL v5;

  ivarAccessQueue = self->_contentInformationRequest->ivarAccessQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __84__AVAssetResourceLoadingContentInformationRequest_setEntireLengthAvailableOnDemand___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = entireLengthAvailableOnDemand;
  av_readwrite_dispatch_queue_write(ivarAccessQueue, v4);
}

uint64_t __84__AVAssetResourceLoadingContentInformationRequest_setEntireLengthAvailableOnDemand___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 40) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __82__AVAssetResourceLoadingContentInformationRequest_isEntireLengthAvailableOnDemand__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8)
                                                                            + 40);
  return result;
}

@end
