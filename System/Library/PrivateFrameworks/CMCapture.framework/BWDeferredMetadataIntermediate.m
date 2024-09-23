@implementation BWDeferredMetadataIntermediate

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BWDeferredMetadataIntermediate)initWithMetadata:(id)a3 tag:(id)a4 bufferTag:(id)a5 URL:(id)a6
{
  BWDeferredMetadataIntermediate *v8;
  objc_super v10;

  if (a5)
  {
    v10.receiver = self;
    v10.super_class = (Class)BWDeferredMetadataIntermediate;
    v8 = -[BWDeferredDictionaryIntermediate initWithDictionary:tag:URL:](&v10, sel_initWithDictionary_tag_URL_, a3, a4, a6);
    if (v8)
      v8->_bufferTag = (NSString *)a5;
  }
  else
  {
    FigDebugAssert3();

    return 0;
  }
  return v8;
}

- (BWDeferredMetadataIntermediate)initWithCoder:(id)a3
{
  BWDeferredMetadataIntermediate *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWDeferredMetadataIntermediate;
  v4 = -[BWDeferredDictionaryIntermediate initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_bufferTag = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("bufferTag"));
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWDeferredMetadataIntermediate;
  -[BWDeferredDictionaryIntermediate encodeWithCoder:](&v5, sel_encodeWithCoder_);
  objc_msgSend(a3, "encodeObject:forKey:", self->_bufferTag, CFSTR("bufferTag"));
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWDeferredMetadataIntermediate;
  -[BWDeferredDictionaryIntermediate dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  void *v4;
  NSString *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = -[NSDictionary description](-[BWDeferredDictionaryIntermediate dictionary](self, "dictionary"), "description");
  if (-[NSString length](v5, "length") >= 0x201)
    v5 = (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@...}"), -[NSString substringToIndex:](v5, "substringToIndex:", 512));
  objc_msgSend(v3, "appendFormat:", CFSTR("<%@ %p>: tag:%@ bufferTag:%@ metadata:%@"), objc_opt_class(), self, -[BWDeferredIntermediate tag](self, "tag"), self->_bufferTag, v5);
  objc_autoreleasePoolPop(v4);
  return (id)objc_msgSend(v3, "copy");
}

- (NSString)bufferTag
{
  return self->_bufferTag;
}

@end
