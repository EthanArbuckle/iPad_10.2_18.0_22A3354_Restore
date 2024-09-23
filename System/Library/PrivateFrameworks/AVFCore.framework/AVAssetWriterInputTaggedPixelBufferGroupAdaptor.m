@implementation AVAssetWriterInputTaggedPixelBufferGroupAdaptor

+ (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)assetWriterInputTaggedPixelBufferGroupAdaptorWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  return (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithAssetWriterInput:sourcePixelBufferAttributes:", input, sourcePixelBufferAttributes);
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)init
{
  return -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor initWithAssetWriterInput:sourcePixelBufferAttributes:](self, "initWithAssetWriterInput:sourcePixelBufferAttributes:", 0, 0);
}

- (AVAssetWriterInputTaggedPixelBufferGroupAdaptor)initWithAssetWriterInput:(AVAssetWriterInput *)input sourcePixelBufferAttributes:(NSDictionary *)sourcePixelBufferAttributes
{
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *v7;
  id *p_isa;
  id v9;
  AVAssetWriterInput *v10;
  AVAssetWriterInputTaggedPixelBufferGroupAdaptor *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id *v21;
  const __CFString *v22;
  id *v23;
  id *v24;
  id *v25;
  void *v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)AVAssetWriterInputTaggedPixelBufferGroupAdaptor;
  v7 = -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor init](&v28, sel_init);
  p_isa = (id *)&v7->super.isa;
  if (!input)
  {
    v12 = v7;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "input != nil";
LABEL_15:
    v27 = (uint64_t)v20;
    v22 = CFSTR("invalid parameter not satisfying: %s");
LABEL_16:
    v26 = (void *)objc_msgSend(v18, "exceptionWithName:reason:userInfo:", v19, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)p_isa, a2, (uint64_t)v22, v13, v14, v15, v16, v17, v27), 0);
    objc_exception_throw(v26);
  }
  if ((-[NSString isEqual:](-[AVAssetWriterInput mediaType](input, "mediaType"), "isEqual:", CFSTR("vide")) & 1) == 0
    && (-[NSString isEqual:](-[AVAssetWriterInput mediaType](input, "mediaType"), "isEqual:", CFSTR("auxv")) & 1) == 0)
  {
    v25 = p_isa;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v20 = "[[input mediaType] isEqual:AVMediaTypeVideo] || [[input mediaType] isEqual:AVMediaTypeAuxiliaryPicture]";
    goto LABEL_15;
  }
  if (-[AVAssetWriterInput _isAttachedToAdaptor](input, "_isAttachedToAdaptor"))
  {
    v21 = p_isa;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("Cannot create a new tagged buffer group adaptor with an asset writer input that is already attached to a tagged buffer group adaptor");
    goto LABEL_16;
  }
  if (-[AVAssetWriterInput _status](input, "_status"))
  {
    v23 = p_isa;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("Cannot create a new tagged buffer group adaptor with an asset writer input that has already started writing");
    goto LABEL_16;
  }
  v9 = -[NSDictionary objectForKey:](-[AVAssetWriterInput outputSettings](input, "outputSettings"), "objectForKey:", CFSTR("AVVideoCompressionPropertiesKey"));
  if (!objc_msgSend(v9, "objectForKey:", *MEMORY[0x1E0CED080]))
  {
    v24 = p_isa;
    v18 = (void *)MEMORY[0x1E0C99DA0];
    v19 = *MEMORY[0x1E0C99778];
    v22 = CFSTR("Cannot create a new tagged buffer group adaptor with missing value for kVTCompressionPropertyKey_MVHEVCVideoLayerIDs key in the writer input's outputSettings");
    goto LABEL_16;
  }
  if (p_isa)
  {
    v10 = input;
    p_isa[1] = v10;
    -[AVAssetWriterInput _setSourcePixelBufferAttributes:](v10, "_setSourcePixelBufferAttributes:", sourcePixelBufferAttributes);
    objc_msgSend(p_isa[1], "_setAttachedAdaptor:", p_isa);
  }
  return (AVAssetWriterInputTaggedPixelBufferGroupAdaptor *)p_isa;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVAssetWriterInputTaggedPixelBufferGroupAdaptor;
  -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, assetWriterInput = %@ sourcePixelBufferAttributes = %@>"), NSStringFromClass(v4), self, -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor assetWriterInput](self, "assetWriterInput"), -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor sourcePixelBufferAttributes](self, "sourcePixelBufferAttributes"));
}

- (AVAssetWriterInput)assetWriterInput
{
  return self->_input;
}

- (NSDictionary)sourcePixelBufferAttributes
{
  return -[AVAssetWriterInput _sourcePixelBufferAttributes](-[AVAssetWriterInputTaggedPixelBufferGroupAdaptor assetWriterInput](self, "assetWriterInput"), "_sourcePixelBufferAttributes");
}

- (CVPixelBufferPoolRef)pixelBufferPool
{
  return -[AVAssetWriterInput _pixelBufferPool](-[AVAssetWriterInputTaggedPixelBufferGroupAdaptor assetWriterInput](self, "assetWriterInput"), "_pixelBufferPool");
}

- (BOOL)appendTaggedPixelBufferGroup:(CMTaggedBufferGroupRef)taggedPixelBufferGroup withPresentationTime:(CMTime *)presentationTime
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

  if (!taggedPixelBufferGroup)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "taggedPixelBufferGroup != NULL";
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
  v10 = -[AVAssetWriterInputTaggedPixelBufferGroupAdaptor assetWriterInput](self, "assetWriterInput");
  v16 = *(_OWORD *)&presentationTime->value;
  epoch = presentationTime->epoch;
  return -[AVAssetWriterInput _appendTaggedPixelBufferGroup:withPresentationTime:](v10, "_appendTaggedPixelBufferGroup:withPresentationTime:", taggedPixelBufferGroup, &v16);
}

@end
