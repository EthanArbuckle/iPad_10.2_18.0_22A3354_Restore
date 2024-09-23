@implementation BWDeferredInferenceArrayIntermediate

- (BWDeferredInferenceArrayIntermediate)initWithArray:(id)a3 tag:(id)a4 inferenceAttachmentKey:(id)a5 portType:(id)a6 URL:(id)a7
{
  BWDeferredInferenceArrayIntermediate *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  v9 = -[BWDeferredArrayIntermediate initWithArray:tag:URL:](&v11, sel_initWithArray_tag_URL_, a3, a4, a7);
  if (v9)
  {
    v9->_inferenceAttachmentKey = (NSString *)a5;
    v9->_portType = (NSString *)a6;
  }
  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredInferenceArrayIntermediate)initWithCoder:(id)a3
{
  BWDeferredInferenceArrayIntermediate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  v4 = -[BWDeferredArrayIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_inferenceAttachmentKey = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("inferenceAttachmentKey"));
    v4->_portType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("portType"));
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  -[BWDeferredArrayIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_inferenceAttachmentKey, CFSTR("inferenceAttachmentKey"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_portType, CFSTR("portType"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredInferenceArrayIntermediate;
  -[BWDeferredArrayIntermediate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = -[NSArray description](self->super._array, "description");
  if (-[NSString length](v5, "length") >= 0x201)
    v5 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...)"), -[NSString substringToIndex:](v5, "substringToIndex:", 512));
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>: tag:%@ inferenceAttachmentKey:%@ portType:%@ array:%@"), objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_inferenceAttachmentKey, self->_portType, v5);
  objc_autoreleasePoolPop(v4);
  return (id)objc_msgSend(v3, "copy");
}

- (NSString)portType
{
  return self->_portType;
}

- (NSString)inferenceAttachmentKey
{
  return self->_inferenceAttachmentKey;
}

@end
