@implementation AVAssetWriterInputPixelBufferAdaptor

+ (AVAssetWriterInputPixelBufferAdaptor)assetWriterInputPixelBufferAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  return (AVAssetWriterInputPixelBufferAdaptor *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetWriterInput:sourcePixelBufferAttributes:", input, sourcePixelBufferAttributes);
}

- (AVAssetWriterInputPixelBufferAdaptor)init
{
  return -[AVAssetWriterInputPixelBufferAdaptor initWithAssetWriterInput:sourcePixelBufferAttributes:](self, "initWithAssetWriterInput:sourcePixelBufferAttributes:", 0, 0);
}

- (AVAssetWriterInputPixelBufferAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  AVAssetWriterInputPixelBufferAdaptor *v7;
  AVAssetWriterInputPixelBufferAdaptor *v8;
  AVAssetWriterInputPixelBufferAdaptorInternal *v9;
  AVAssetWriterInputPixelBufferAdaptor *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  AVAssetWriterInputPixelBufferAdaptor *v20;
  const __CFString *v21;
  AVAssetWriterInputPixelBufferAdaptor *v22;
  AVAssetWriterInputPixelBufferAdaptor *v23;
  void *v24;
  uint64_t v25;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AVAssetWriterInputPixelBufferAdaptor;
  v7 = -[AVAssetWriterInputPixelBufferAdaptor init](&v26, sel_init);
  v8 = v7;
  if (!input)
  {
    v11 = v7;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "input != nil";
LABEL_15:
    v25 = (uint64_t)v19;
    v21 = CFSTR("invalid parameter not satisfying: %s");
LABEL_16:
    v24 = (void *)objc_msgSend(v17, "exceptionWithName:reason:userInfo:", v18, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)v21, v12, v13, v14, v15, v16, v25), 0);
    objc_exception_throw(v24);
  }
  if (!-[NSString isEqualToString:](-[AVAssetWriterInput mediaType](input, "mediaType"), "isEqualToString:", CFSTR("vide"))&& !-[NSString isEqualToString:](-[AVAssetWriterInput mediaType](input, "mediaType"), "isEqualToString:", CFSTR("auxv")))
  {
    v23 = v8;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v19 = "[[input mediaType] isEqualToString:AVMediaTypeVideo] || [[input mediaType] isEqualToString:AVMediaTypeAuxiliaryPicture]";
    goto LABEL_15;
  }
  if (-[AVAssetWriterInput _isAttachedToAdaptor](input, "_isAttachedToAdaptor"))
  {
    v20 = v8;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Cannot create a new pixel buffer adaptor with an asset writer input that is already attached to a pixel buffer adaptor");
    goto LABEL_16;
  }
  if (-[AVAssetWriterInput _status](input, "_status"))
  {
    v22 = v8;
    v17 = (void *)MEMORY[0x1E0C99DA0];
    v18 = *MEMORY[0x1E0C99778];
    v21 = CFSTR("Cannot create a new pixel buffer adaptor with an asset writer input that has already started writing");
    goto LABEL_16;
  }
  if (v8)
  {
    v9 = objc_alloc_init(AVAssetWriterInputPixelBufferAdaptorInternal);
    v8->_internal = v9;
    if (v9)
    {
      CFRetain(v9);
      v8->_internal->input = input;
      -[AVAssetWriterInput _setSourcePixelBufferAttributes:](v8->_internal->input, "_setSourcePixelBufferAttributes:", sourcePixelBufferAttributes);
      -[AVAssetWriterInput _setAttachedAdaptor:](v8->_internal->input, "_setAttachedAdaptor:", v8);
      v8->_internal->keyPathDependencyManager = -[AVKeyPathDependencyManager initWithDependencyHost:]([AVKeyPathDependencyManager alloc], "initWithDependencyHost:", v8);
      -[AVKeyPathDependencyManager dependencyHostIsFullyInitialized](v8->_internal->keyPathDependencyManager, "dependencyHostIsFullyInitialized");
    }
    else
    {

      return 0;
    }
  }
  return v8;
}

- (void)addCallbackToCancelDuringDeallocation:(id)a3
{
  -[AVKeyPathDependencyManager addCallbackToCancel:](self->_internal->keyPathDependencyManager, "addCallbackToCancel:", a3);
}

- (void)dealloc
{
  AVAssetWriterInputPixelBufferAdaptorInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {
    -[AVKeyPathDependencyManager cancelAllCallbacks](internal->keyPathDependencyManager, "cancelAllCallbacks");

    CFRelease(self->_internal);
  }
  v4.receiver = self;
  v4.super_class = (Class)AVAssetWriterInputPixelBufferAdaptor;
  -[AVAssetWriterInputPixelBufferAdaptor dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, assetWriterInput = %@, sourcePixelBufferAttributes = %@>"), NSStringFromClass(v4), self, -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self, "assetWriterInput"), -[AVAssetWriterInputPixelBufferAdaptor sourcePixelBufferAttributes](self, "sourcePixelBufferAttributes"));
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_internal->input;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return -[AVAssetWriterInput _sourcePixelBufferAttributes](-[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self, "assetWriterInput"), "_sourcePixelBufferAttributes");
}

- (void)declareKeyPathDependenciesWithRegistry:(id)a3
{
  objc_msgSend(a3, "valueForKey:dependsOnValueAtKeyPath:", CFSTR("pixelBufferPool"), AVTwoPartKeyPathMake((uint64_t)CFSTR("assetWriterInput"), (uint64_t)CFSTR("pixelBufferPool")));
}

- (CVPixelBufferPoolRef)pixelBufferPool
{
  return -[AVAssetWriterInput _pixelBufferPool](-[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self, "assetWriterInput"), "_pixelBufferPool");
}

- (BOOL)appendPixelBuffer:(CVPixelBufferRef)pixelBuffer withPresentationTime:(CMTime *)presentationTime
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVAssetWriterInput *v10;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  __int128 v16;
  CMTimeEpoch epoch;

  if (!pixelBuffer)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "pixelBuffer != NULL";
    goto LABEL_6;
  }
  if ((presentationTime->flags & 0x1D) != 1)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "CMTIME_IS_NUMERIC(presentationTime)";
LABEL_6:
    v15 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)presentationTime, v4, v5, v6, v7, (uint64_t)v14), 0);
    objc_exception_throw(v15);
  }
  v10 = -[AVAssetWriterInputPixelBufferAdaptor assetWriterInput](self, "assetWriterInput");
  v16 = *(_OWORD *)&presentationTime->value;
  epoch = presentationTime->epoch;
  return -[AVAssetWriterInput _appendPixelBuffer:withPresentationTime:](v10, "_appendPixelBuffer:withPresentationTime:", pixelBuffer, &v16);
}

@end
