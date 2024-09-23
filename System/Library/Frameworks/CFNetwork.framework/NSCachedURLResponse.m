@implementation NSCachedURLResponse

- (NSData)data
{
  NSCachedURLResponseInternal *internal;
  const __CFArray *v3;
  const __CFArray *v4;
  CFIndex Count;
  const void *ValueAtIndex;
  CFTypeRef v7;
  NSData *v8;
  CFIndex v9;
  CFIndex i;

  internal = self->_internal;
  if (!internal)
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v3 = (const __CFArray *)CFCachedURLResponseCopyReceiverDataArray((uint64_t)internal->_cachedURLResponse);
  if (!v3)
    return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
  v4 = v3;
  Count = CFArrayGetCount(v3);
  if (Count == 1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
    v7 = CFRetain(ValueAtIndex);
    v8 = (id)CFMakeCollectable(v7);
  }
  else
  {
    if (Count <= 1)
    {
      CFRelease(v4);
      return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
    }
    v9 = Count;
    v8 = (NSData *)objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    for (i = 0; i != v9; ++i)
      -[NSData appendData:](v8, "appendData:", CFArrayGetValueAtIndex(v4, i));
  }
  CFRelease(v4);
  if (v8)
    return v8;
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "data");
}

- (NSURLResponse)response
{
  NSCachedURLResponseInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->response;
  else
    return 0;
}

- (void)dealloc
{
  NSCachedURLResponseInternal *internal;
  const _CFCachedURLResponse *cachedURLResponse;
  objc_super v5;

  internal = self->_internal;
  if (internal)
  {
    cachedURLResponse = internal->_cachedURLResponse;
    if (cachedURLResponse)
    {
      CFCachedURLResponseSetNSCachedURLResponse(cachedURLResponse, 0);

      internal = self->_internal;
    }
  }

  v5.receiver = self;
  v5.super_class = (Class)NSCachedURLResponse;
  -[NSCachedURLResponse dealloc](&v5, sel_dealloc);
}

- (NSCachedURLResponse)initWithCoder:(id)a3
{
  NSCachedURLResponse *v4;
  void *v5;
  uint64_t v6;
  const void *v7;
  const __CFData *v8;
  NSURLResponse *response;
  uint64_t v10;
  CFPropertyListRef v11;
  __CFCachedURLResponse **v12;
  const _CFURLRequest *v13;
  CFErrorRef error;
  int v16;
  int v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)NSCachedURLResponse;
  v4 = -[NSCachedURLResponse init](&v18, sel_init);
  if (!v4)
    return v4;
  v17 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v17, 4);
  if (v17 != 12)
  {

    return 0;
  }
  v4->_internal = objc_alloc_init(NSCachedURLResponseInternal);
  v4->_internal->response = (NSURLResponse *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSURLResponseType"));
  v4->_internal->data = (NSData *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSDataType"));
  v4->_internal->userInfo = (NSDictionary *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_NSDictionaryType"));
  v16 = 0;
  objc_msgSend(a3, "decodeValueOfObjCType:at:size:", "i", &v16, 4);
  v4->_internal->storagePolicy = v16;
  v5 = (void *)MEMORY[0x1E0C99E60];
  v6 = objc_opt_class();
  v7 = (const void *)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("_CFCachedURLResponseReceiverDataArray"));
  v8 = (const __CFData *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CFCachedURLResponseUserInfo"));
  response = v4->_internal->response;
  error = 0;
  v10 = *MEMORY[0x1E0C9AE00];
  if (v8)
  {
    v11 = CFPropertyListCreateWithData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8, 0, 0, &error);
    if (v11 || !error)
      goto LABEL_9;
    NSLog(CFSTR("ERROR: decoding user-info failed.  Error:%@"), error);
    if (error)
      CFRelease(error);
  }
  v11 = 0;
LABEL_9:
  v12 = (__CFCachedURLResponse **)CFCachedURLResponseCreateWithDataArray(v10, response, v7, v11, v4->_internal->storagePolicy);
  -[NSCachedURLResponse _reestablishInternalCFCachedURLResponse:](v4, "_reestablishInternalCFCachedURLResponse:", v12);
  if (v11)
    CFRelease(v11);
  if (v12)
  {
    v13 = (const _CFURLRequest *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_CFURLRequestAsNSURLRequest"));
    if (v13)
      __CFCachedURLResponse::SetRequest(v12[2], v13);
    CFRelease(v12);
  }
  return v4;
}

- (void)_reestablishInternalCFCachedURLResponse:(_CFCachedURLResponse *)a3
{
  NSCachedURLResponseInternal *internal;

  internal = self->_internal;
  if (internal && !internal->_cachedURLResponse)
  {
    if (a3)
    {
      CFRetain(a3);
      internal = self->_internal;
    }
    internal->_cachedURLResponse = a3;
  }
}

- (_CFCachedURLResponse)_CFCachedURLResponse
{
  NSCachedURLResponseInternal *internal;

  internal = self->_internal;
  if (internal)
    return internal->_cachedURLResponse;
  else
    return 0;
}

- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data userInfo:(NSDictionary *)userInfo storagePolicy:(NSURLCacheStoragePolicy)storagePolicy
{
  NSCachedURLResponse *v10;
  uint64_t *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)NSCachedURLResponse;
  v10 = -[NSCachedURLResponse init](&v13, sel_init);
  if (v10)
  {
    v10->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v10->_internal->response = (NSURLResponse *)-[NSURLResponse copy](response, "copy");
    v10->_internal->data = (NSData *)-[NSData copy](data, "copy");
    v10->_internal->userInfo = (NSDictionary *)-[NSDictionary copy](userInfo, "copy");
    v11 = (uint64_t *)MEMORY[0x1E0C9AE00];
    v10->_internal->storagePolicy = storagePolicy;
    v10->_internal->_cachedURLResponse = (_CFCachedURLResponse *)CFCachedURLResponseCreateWithUserInfo(*v11, v10->_internal->response, v10->_internal->data, v10->_internal->userInfo, storagePolicy);
    CFMakeCollectable(v10->_internal->_cachedURLResponse);
  }
  return v10;
}

- (id)_initWithCFCachedURLResponse:(_CFCachedURLResponse *)a3
{
  NSCachedURLResponse *v4;
  uint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)NSCachedURLResponse;
  v4 = -[NSCachedURLResponse init](&v8, sel_init);
  if (v4)
  {
    if (a3)
      v5 = *((_QWORD *)a3->var1 + 4);
    else
      v5 = 0;
    v4->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v4->_internal->response = (NSURLResponse *)+[NSURLResponse _responseWithCFURLResponse:](NSURLResponse, "_responseWithCFURLResponse:", v5);
    v4->_internal->data = 0;
    v4->_internal->userInfo = 0;
    if (a3)
      v6 = *((int *)a3->var1 + 14);
    else
      v6 = 2;
    v4->_internal->storagePolicy = v6;
    v4->_internal->_cachedURLResponse = a3;
  }
  return v4;
}

- (NSDictionary)userInfo
{
  NSCachedURLResponseInternal *internal;
  _CFCachedURLResponse *cachedURLResponse;

  internal = self->_internal;
  if (internal && (cachedURLResponse = internal->_cachedURLResponse) != 0)
    return (NSDictionary *)*((_QWORD *)cachedURLResponse->var1 + 5);
  else
    return 0;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSURLCacheStoragePolicy)storagePolicy
{
  NSCachedURLResponseInternal *internal;
  _CFCachedURLResponse *cachedURLResponse;

  internal = self->_internal;
  if (internal && (cachedURLResponse = internal->_cachedURLResponse) != 0)
    return (uint64_t)*((int *)cachedURLResponse->var1 + 14);
  else
    return 2;
}

- (NSCachedURLResponse)initWithResponse:(NSURLResponse *)response data:(NSData *)data
{
  return -[NSCachedURLResponse initWithResponse:data:userInfo:storagePolicy:](self, "initWithResponse:data:userInfo:storagePolicy:", response, data, 0, 0);
}

- (NSCachedURLResponse)initWithResponse:(id)a3 dataArray:(id)a4 userInfo:(id)a5 storagePolicy:(unint64_t)a6
{
  NSCachedURLResponse *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)NSCachedURLResponse;
  v10 = -[NSCachedURLResponse init](&v12, sel_init);
  if (v10)
  {
    v10->_internal = objc_alloc_init(NSCachedURLResponseInternal);
    v10->_internal->response = (NSURLResponse *)objc_msgSend(a3, "copy");
    v10->_internal->data = 0;
    v10->_internal->userInfo = 0;
    v10->_internal->storagePolicy = a6;
    v10->_internal->_cachedURLResponse = (_CFCachedURLResponse *)CFCachedURLResponseCreateWithDataArray(*MEMORY[0x1E0C9AE00], v10->_internal->response, a4, a5, a6);
    CFMakeCollectable(v10->_internal->_cachedURLResponse);
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  _CFCachedURLResponse *cachedURLResponse;
  CFTypeRef v6;
  const void *v7;
  void *v8;
  _CFCachedURLResponse *v9;
  const void *v10;
  CFDataRef v11;
  _CFCachedURLResponse *v12;
  uint64_t v13;
  const void *v14;
  id v15;
  void *v16;
  CFErrorRef error;
  int storagePolicy;
  int v19;

  v19 = 12;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &v19);
  objc_msgSend(a3, "encodeObject:forKey:", self->_internal->response, CFSTR("_NSURLResponseType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_internal->data, CFSTR("_NSDataType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_internal->userInfo, CFSTR("_NSDictionaryType"));
  storagePolicy = self->_internal->storagePolicy;
  objc_msgSend(a3, "encodeValueOfObjCType:at:", "i", &storagePolicy);
  cachedURLResponse = self->_internal->_cachedURLResponse;
  if (cachedURLResponse)
  {
    error = 0;
    v6 = CFCachedURLResponseCopyReceiverDataArray((uint64_t)cachedURLResponse);
    if (v6)
    {
      v7 = v6;
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:", v6);
      CFRelease(v7);
    }
    else
    {
      v8 = 0;
    }
    v9 = self->_internal->_cachedURLResponse;
    if (v9 && (v10 = (const void *)*((_QWORD *)v9->var1 + 5)) != 0)
    {
      v11 = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v10, kCFPropertyListBinaryFormat_v1_0, 0, &error);
      if (!v11)
      {
        NSLog(CFSTR("ERROR: encoding user-info failed. Error:%@"), error);
        CFRelease(error);
      }
    }
    else
    {
      v11 = 0;
    }
    if (v8)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v8, CFSTR("_CFCachedURLResponseReceiverDataArray"));

    }
    if (v11)
    {
      objc_msgSend(a3, "encodeObject:forKey:", v11, CFSTR("_CFCachedURLResponseUserInfo"));
      CFRelease(v11);
    }
    v12 = self->_internal->_cachedURLResponse;
    if (v12)
    {
      v13 = CFCachedURLResponseCopyWrappedRequest(v12);
      if (v13)
      {
        v14 = (const void *)v13;
        v15 = -[NSURLRequest _initWithCFURLRequest:]([NSURLRequest alloc], "_initWithCFURLRequest:", v13);
        if (v15)
        {
          v16 = v15;
          objc_msgSend(a3, "encodeObject:forKey:", v15, CFSTR("_CFURLRequestAsNSURLRequest"));

        }
        CFRelease(v14);
      }
    }
  }
}

- (id)dataArray
{
  NSCachedURLResponseInternal *internal;
  CFTypeRef v3;

  internal = self->_internal;
  if (!internal)
    return 0;
  v3 = CFCachedURLResponseCopyReceiverDataArray((uint64_t)internal->_cachedURLResponse);
  return (id)(id)CFMakeCollectable(v3);
}

- (void)_deallocInternalCFCachedURLResponse
{
  NSCachedURLResponseInternal *internal;
  _CFCachedURLResponse *cachedURLResponse;

  internal = self->_internal;
  if (internal)
  {
    cachedURLResponse = internal->_cachedURLResponse;
    if (cachedURLResponse)
    {

      self->_internal->_cachedURLResponse = 0;
    }
  }
}

- (id)_wrappedRequest
{
  NSCachedURLResponseInternal *internal;

  internal = self->_internal;
  if (internal)
    return (id)CFCachedURLResponseCopyWrappedRequest(internal->_cachedURLResponse);
  else
    return 0;
}

@end
