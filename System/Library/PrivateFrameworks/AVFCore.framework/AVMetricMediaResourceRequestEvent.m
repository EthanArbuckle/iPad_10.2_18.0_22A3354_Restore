@implementation AVMetricMediaResourceRequestEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricMediaResourceRequestEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricMediaResourceRequestEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricMediaResourceRequestEvent:%p %@ url:%@ serverAddress:%@ requestStartTime:%@ requestEndTime:%@ responseStartTime:%@ responseEndTime:%@ error:%@ byteRange:(%lu,%lu) readFromCache:%d networkTransactionMetrics:%@>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_url, self->_serverAddress, self->_requestStartTime, self->_requestEndTime, self->_responseStartTime, self->_responseEndTime, -[AVMetricErrorEvent debugDescription](self->_errorEvent, "debugDescription"), self->_byteRange.location, self->_byteRange.length, self->_readFromCache, -[NSURLSessionTaskMetrics debugDescription](self->_networkTransactionMetrics, "debugDescription"));
}

- (AVMetricMediaResourceRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 serverAddress:(id)a7 requestStartTime:(id)a8 requestEndTime:(id)a9 responseStartTime:(id)a10 responseEndTime:(id)a11 byteRange:(_NSRange)a12 readFromCache:(BOOL)a13 errorEvent:(id)a14 networkTransactionMetrics:(id)a15
{
  AVMetricMediaResourceRequestEvent *v18;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVMetricMediaResourceRequestEvent;
  v20 = *a4;
  v18 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v21, sel_initWithDate_mediaTime_sessionID_, a3, &v20, a5);
  if (v18)
  {
    v18->_url = (NSURL *)a6;
    v18->_serverAddress = (NSString *)a7;
    v18->_requestStartTime = (NSDate *)a8;
    v18->_requestEndTime = (NSDate *)a9;
    v18->_responseStartTime = (NSDate *)a10;
    v18->_responseEndTime = (NSDate *)a11;
    v18->_byteRange = a12;
    v18->_readFromCache = a13;
    v18->_errorEvent = (AVMetricErrorEvent *)a14;
    v18->_networkTransactionMetrics = (NSURLSessionTaskMetrics *)a15;
  }
  return v18;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)serverAddress
{
  return self->_serverAddress;
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (NSDate)requestEndTime
{
  return self->_requestEndTime;
}

- (NSDate)responseStartTime
{
  return self->_responseStartTime;
}

- (NSDate)responseEndTime
{
  return self->_responseEndTime;
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

- (BOOL)wasReadFromCache
{
  return self->_readFromCache;
}

- (AVMetricErrorEvent)errorEvent
{
  return self->_errorEvent;
}

- (NSURLSessionTaskMetrics)networkTransactionMetrics
{
  return self->_networkTransactionMetrics;
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
  v12.super_class = (Class)AVMetricMediaResourceRequestEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_url, CFSTR("url"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_serverAddress, CFSTR("serverAddress"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestStartTime, CFSTR("requestStartTime"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_requestEndTime, CFSTR("requestEndTime"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_responseStartTime, CFSTR("responseStartTime"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_responseEndTime, CFSTR("responseEndTime"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_byteRange.length, CFSTR("byteRangeLength"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_byteRange.location, CFSTR("byteRangeLocation"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_readFromCache, CFSTR("readFromCache"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_errorEvent, CFSTR("errorEvent"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_networkTransactionMetrics, CFSTR("networkTransactionMetrics"));
}

- (AVMetricMediaResourceRequestEvent)initWithCoder:(id)a3
{
  AVMetricMediaResourceRequestEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricMediaResourceRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_url = (NSURL *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
    v4->_serverAddress = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("serverAddress"));
    v4->_requestStartTime = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestStartTime"));
    v4->_requestEndTime = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("requestEndTime"));
    v4->_responseStartTime = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseStartTime"));
    v4->_responseEndTime = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("responseEndTime"));
    v4->_byteRange.length = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("byteRangeLength"));
    v4->_byteRange.location = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("byteRangeLocation"));
    v4->_readFromCache = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("readFromCache"));
    v4->_errorEvent = (AVMetricErrorEvent *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorEvent"));
    v4->_networkTransactionMetrics = (NSURLSessionTaskMetrics *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("networkTransactionMetrics"));
  }
  return v4;
}

@end
