@implementation AVMetricHLSMediaSegmentRequestEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricHLSMediaSegmentRequestEvent:%p %@ indexFileURL:%@ isMapSegment:%d mediaType:%@ mediaResourceRequestEvent:%@>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_indexFileURL, self->_isMapSegment, self->_mediaType, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription"));
}

- (AVMetricHLSMediaSegmentRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 indexFileURL:(id)a6 byteRange:(_NSRange)a7 isMapSegment:(BOOL)a8 mediaType:(id)a9 mediaResourceRequestEvent:(id)a10
{
  NSUInteger length;
  NSUInteger location;
  AVMetricHLSMediaSegmentRequestEvent *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  objc_super v16;

  length = a7.length;
  location = a7.location;
  v16.receiver = self;
  v16.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  v15 = *a4;
  v13 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v16, sel_initWithDate_mediaTime_sessionID_, a3, &v15, a5);
  if (v13)
  {
    v13->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a10;
    v13->_isMapSegment = a8;
    v13->_indexFileURL = (NSURL *)a6;
    v13->_byteRange.location = location;
    v13->_byteRange.length = length;
    v13->_mediaType = (NSString *)a9;
  }
  return v13;
}

- (BOOL)isMapSegment
{
  return self->_isMapSegment;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSURL)indexFileURL
{
  return self->_indexFileURL;
}

- (_NSRange)byteRange
{
  _NSRange *p_byteRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_byteRange = &self->_byteRange;
  location = self->_byteRange.location;
  length = p_byteRange->length;
  result.length = length;
  result.location = location;
  return result;
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
  v12.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_isMapSegment, CFSTR("isMapSegment"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mediaType, CFSTR("mediaType"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_indexFileURL, CFSTR("indexFileURL"));
}

- (AVMetricHLSMediaSegmentRequestEvent)initWithCoder:(id)a3
{
  AVMetricHLSMediaSegmentRequestEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_isMapSegment = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("isMapSegment"));
    v4->_mediaType = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaType"));
    v4->_indexFileURL = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("indexFileURL"));
  }
  return v4;
}

- (NSURL)url
{
  return self->_url;
}

@end
