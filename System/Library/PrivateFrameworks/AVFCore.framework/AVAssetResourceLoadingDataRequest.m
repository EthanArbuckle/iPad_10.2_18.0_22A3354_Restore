@implementation AVAssetResourceLoadingDataRequest

uint64_t __50__AVAssetResourceLoadingDataRequest_currentOffset__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32)
                                                                                          + 8)
                                                                              + 24);
  return result;
}

- (void)respondWithData:(NSData *)data
{
  NSUInteger v5;
  NSUInteger v6;
  _BOOL4 canSupplyIncrementalDataImmediately;
  id v8;
  NSObject *dataResponseQueue;
  _QWORD v10[6];

  v5 = -[NSData length](data, "length");
  if (v5)
  {
    v6 = v5;
    canSupplyIncrementalDataImmediately = self->_dataRequest->canSupplyIncrementalDataImmediately;
    v8 = -[AVAssetResourceLoadingDataRequest _loadingRequest](self, "_loadingRequest");
    if (canSupplyIncrementalDataImmediately)
      objc_msgSend(v8, "_sendDataToCustomURLHandler:", data);
    else
      objc_msgSend(v8, "_appendToCachedData:", data);
    dataResponseQueue = self->_dataRequest->dataResponseQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__AVAssetResourceLoadingDataRequest_respondWithData___block_invoke;
    v10[3] = &unk_1E302FE78;
    v10[4] = self;
    v10[5] = v6;
    av_readwrite_dispatch_queue_write(dataResponseQueue, v10);
  }
}

- (id)_loadingRequest
{
  return -[AVWeakReference referencedObject](self->_dataRequest->weakReferenceToLoadingRequest, "referencedObject");
}

- (NSInteger)requestedLength
{
  return self->_dataRequest->requestedLength;
}

- (BOOL)requestsAllDataToEndOfResource
{
  return self->_dataRequest->requestsAllDataToEndOfResource;
}

- (AVAssetResourceLoadingDataRequest)initWithLoadingRequest:(id)a3 requestedOffset:(int64_t)a4 requestedLength:(int64_t)a5 requestsAllDataToEndOfResource:(BOOL)a6 canSupplyIncrementalDataImmediately:(BOOL)a7
{
  AVAssetResourceLoadingDataRequest *v12;
  AVAssetResourceLoadingDataRequestInternal *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetResourceLoadingDataRequest;
  v12 = -[AVAssetResourceLoadingDataRequest init](&v15, sel_init);
  if (v12)
  {
    if (a3
      && (v13 = objc_alloc_init(AVAssetResourceLoadingDataRequestInternal),
          (v12->_dataRequest = v13) != 0))
    {
      v12->_dataRequest->weakReferenceToLoadingRequest = (AVWeakReference *)(id)objc_msgSend(a3, "_weakReference");
      v12->_dataRequest->requestedOffset = a4;
      v12->_dataRequest->requestedLength = a5;
      v12->_dataRequest->currentOffset = a4;
      v12->_dataRequest->dataResponseQueue = (OS_dispatch_queue *)av_readwrite_dispatch_queue_create("com.apple.avfoundation.avassetresourceloadingdatarequest");
      v12->_dataRequest->requestsAllDataToEndOfResource = a6;
      v12->_dataRequest->canSupplyIncrementalDataImmediately = a7;
      CFRetain(v12->_dataRequest);
    }
    else
    {

      return 0;
    }
  }
  return v12;
}

uint64_t __53__AVAssetResourceLoadingDataRequest_respondWithData___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) += *(_QWORD *)(result + 40);
  return result;
}

- (uint64_t)currentOffset
{
  NSObject *dataResponseQueue;
  uint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dataResponseQueue = self->_dataRequest->dataResponseQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__AVAssetResourceLoadingDataRequest_currentOffset__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  av_readwrite_dispatch_queue_read(dataResponseQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (uint64_t)requestedOffset
{
  return self->_dataRequest->requestedOffset;
}

- (void)dealloc
{
  AVAssetResourceLoadingDataRequestInternal *dataRequest;
  dispatch_object_t *v4;
  objc_super v5;

  dataRequest = self->_dataRequest;
  if (dataRequest)
  {

    v4 = (dispatch_object_t *)self->_dataRequest;
    if (v4[4])
    {
      dispatch_release(v4[4]);
      v4 = (dispatch_object_t *)self->_dataRequest;
    }
    CFRelease(v4);
  }
  v5.receiver = self;
  v5.super_class = (Class)AVAssetResourceLoadingDataRequest;
  -[AVAssetResourceLoadingDataRequest dealloc](&v5, sel_dealloc);
}

- (AVAssetResourceLoadingDataRequest)init
{
  return -[AVAssetResourceLoadingDataRequest initWithLoadingRequest:requestedOffset:requestedLength:requestsAllDataToEndOfResource:canSupplyIncrementalDataImmediately:](self, "initWithLoadingRequest:requestedOffset:requestedLength:requestsAllDataToEndOfResource:canSupplyIncrementalDataImmediately:", 0, 0, 0, 0, 0);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  uint64_t v6;
  NSInteger v7;
  const __CFString *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = -[AVAssetResourceLoadingDataRequest requestedOffset](self, "requestedOffset");
  v7 = -[AVAssetResourceLoadingDataRequest requestedLength](self, "requestedLength");
  if (-[AVAssetResourceLoadingDataRequest requestsAllDataToEndOfResource](self, "requestsAllDataToEndOfResource"))
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, requested offset = %lld, requested length = %lld, requests all data to end of resource = %@, current offset = %lld>"), v5, self, v6, v7, v8, -[AVAssetResourceLoadingDataRequest currentOffset](self, "currentOffset"));
}

- (__CFDictionary)_requestInfo
{
  return (__CFDictionary *)objc_msgSend(-[AVAssetResourceLoadingDataRequest _loadingRequest](self, "_loadingRequest"), "_requestInfo");
}

@end
