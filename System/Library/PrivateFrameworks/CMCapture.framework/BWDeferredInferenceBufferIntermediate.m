@implementation BWDeferredInferenceBufferIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredInferenceBufferIntermediate)initWithBuffer:(__CVBuffer *)a3 tag:(id)a4 metadataTag:(id)a5 inferenceAttachedMediaKey:(id)a6 portType:(id)a7 compressionProfile:(int)a8 URL:(id)a9
{
  BWDeferredInferenceBufferIntermediate *v10;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  v10 = -[BWDeferredBufferIntermediate initWithBuffer:tag:bufferType:captureFrameFlags:metadataTag:portType:compressionProfile:URL:](&v13, sel_initWithBuffer_tag_bufferType_captureFrameFlags_metadataTag_portType_compressionProfile_URL_, a3, a4, 16, 0, a5, a7, a8, a9);
  if (v10)
    v10->_inferenceAttachedMediaKey = (NSString *)a6;
  return v10;
}

- (BWDeferredInferenceBufferIntermediate)initWithCoder:(id)a3
{
  BWDeferredInferenceBufferIntermediate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  v4 = -[BWDeferredBufferIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_inferenceAttachedMediaKey = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inferenceAttachedMediaKey"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  -[BWDeferredBufferIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_inferenceAttachedMediaKey, CFSTR("inferenceAttachedMediaKey"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredInferenceBufferIntermediate;
  -[BWDeferredBufferIntermediate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  uint64_t v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p>: tag:%@ inferenceAttachedMediaKey:%@ bufferType:%@ portType:%@ bufferAttributes:%@"), v4, self, -[BWDeferredIntermediate tag](self, "tag"), self->_inferenceAttachedMediaKey, BWStillImageProcessorTypeToShortString(-[BWDeferredBufferIntermediate bufferType](self, "bufferType")), -[BWDeferredBufferIntermediate portType](self, "portType"), -[BWDeferredBufferIntermediate attributes](self, "attributes"));
}

- (id)_shortString
{
  NSDictionary *v3;
  uint64_t v4;
  NSDictionary *v5;
  uint64_t v6;

  v3 = -[BWDeferredBufferIntermediate attributes](self, "attributes");
  v4 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CA90E0]), "unsignedIntValue");
  v5 = -[BWDeferredBufferIntermediate attributes](self, "attributes");
  v6 = objc_msgSend(-[NSDictionary objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CA8FD8]), "unsignedIntValue");
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("'%@' ('%@', %dx%d)"), self->_inferenceAttachedMediaKey, BWStringFromCVPixelFormatType(-[BWDeferredBufferIntermediate pixelFormat](self, "pixelFormat")), v4, v6);
}

- (NSString)inferenceAttachedMediaKey
{
  return self->_inferenceAttachedMediaKey;
}

@end
