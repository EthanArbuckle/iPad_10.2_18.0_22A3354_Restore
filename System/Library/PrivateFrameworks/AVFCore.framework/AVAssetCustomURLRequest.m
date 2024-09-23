@implementation AVAssetCustomURLRequest

+ (id)requestWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4
{
  return -[AVAssetCustomURLRequest initWithRequest:id:]([AVAssetCustomURLRequest alloc], "initWithRequest:id:", a3, a4);
}

- (AVAssetCustomURLRequest)initWithRequest:(__CFDictionary *)a3 id:(unint64_t)a4
{
  AVAssetCustomURLRequest *v7;
  AVAssetCustomURLRequest *v8;
  __CFDictionary *v9;
  AVAssetCustomURLRequest *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)AVAssetCustomURLRequest;
  v7 = -[AVAssetCustomURLRequest init](&v18, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!a3)
    {
      v11 = v7;
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v12, v13, v14, v15, v16, (uint64_t)"request"), 0);
      objc_exception_throw(v17);
    }
    v9 = (__CFDictionary *)CFRetain(a3);
    v8->_requestID = a4;
    v8->_customURLRequest = v9;
  }
  return v8;
}

- (AVAssetCustomURLRequest)init
{

  return 0;
}

- (void)dealloc
{
  __CFDictionary *customURLRequest;
  __CFDictionary *customURLResponse;
  objc_super v5;

  customURLRequest = self->_customURLRequest;
  if (customURLRequest)
    CFRelease(customURLRequest);
  customURLResponse = self->_customURLResponse;
  if (customURLResponse)
    CFRelease(customURLResponse);

  v5.receiver = self;
  v5.super_class = (Class)AVAssetCustomURLRequest;
  -[AVAssetCustomURLRequest dealloc](&v5, sel_dealloc);
}

- (__CFDictionary)customURLRequest
{
  return self->_customURLRequest;
}

- (void)setCustomURLRequest:(__CFDictionary *)a3
{
  __CFDictionary *customURLRequest;

  customURLRequest = self->_customURLRequest;
  self->_customURLRequest = a3;
  if (a3)
    CFRetain(a3);
  if (customURLRequest)
    CFRelease(customURLRequest);
}

- (__CFDictionary)customURLResponse
{
  return self->_customURLResponse;
}

- (void)setCustomURLResponse:(__CFDictionary *)a3
{
  __CFDictionary *customURLResponse;

  customURLResponse = self->_customURLResponse;
  self->_customURLResponse = a3;
  if (a3)
    CFRetain(a3);
  if (customURLResponse)
    CFRelease(customURLResponse);
}

- (unint64_t)requestID
{
  return self->_requestID;
}

- (NSURLSessionTaskMetrics)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

@end
