@implementation AVMetricContentKeyRequestEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricContentKeyRequestEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricContentKeyRequestEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricContentKeyRequestEvent:%p %@ contentKeySpecifier:%@ mediaType:%@ isClientInitiated:%d mediaResourceRequestEvent: %@>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_contentKeySpecifier, self->_mediaType, self->_isClientInitiated, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription"));
}

- (AVMetricContentKeyRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 contentKeySpecifier:(id)a6 mediaType:(id)a7 isClientInitiated:(BOOL)a8 mediaResourceRequestEvent:(id)a9
{
  AVMetricContentKeyRequestEvent *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMetricContentKeyRequestEvent;
  v14 = *a4;
  v12 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v15, sel_initWithDate_mediaTime_sessionID_, a3, &v14, a5);
  if (v12)
  {
    v12->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a9;
    v12->_contentKeySpecifier = (AVContentKeySpecifier *)a6;
    v12->_mediaType = (NSString *)a7;
    v12->_isClientInitiated = a8;
  }
  return v12;
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->_contentKeySpecifier;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (BOOL)isClientInitiated
{
  return self->_isClientInitiated;
}

- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent
{
  return self->_mediaResourceRequestEvent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  objc_super v12;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0);
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricContentKeyRequestEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_contentKeySpecifier, CFSTR("contentKeySpecifier"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mediaType, CFSTR("mediaType"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_isClientInitiated, CFSTR("isClientInitiated"));
}

- (AVMetricContentKeyRequestEvent)initWithCoder:(id)a3
{
  AVMetricContentKeyRequestEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricContentKeyRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_contentKeySpecifier = (AVContentKeySpecifier *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contentKeySpecifier"));
    v4->_mediaType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v4->_isClientInitiated = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isClientInitiated"));
  }
  return v4;
}

@end
