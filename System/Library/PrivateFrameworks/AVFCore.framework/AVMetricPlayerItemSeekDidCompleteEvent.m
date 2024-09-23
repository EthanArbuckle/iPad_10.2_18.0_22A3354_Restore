@implementation AVMetricPlayerItemSeekDidCompleteEvent

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemSeekDidCompleteEvent:%p %@ didSeekInBuffer:%d>"), self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_didSeekInBuffer);
}

- (AVMetricPlayerItemSeekDidCompleteEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 didSeekInBuffer:(BOOL)a7 rate:(double)a8 previousRate:(double)a9
{
  AVMetricPlayerItemSeekDidCompleteEvent *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  v11 = *a4;
  result = -[AVMetricPlayerItemRateChangeEvent initWithDate:mediaTime:sessionID:variant:rate:previousRate:](&v12, sel_initWithDate_mediaTime_sessionID_variant_rate_previousRate_, a3, &v11, a5, a6, a8, a9);
  if (result)
    result->_didSeekInBuffer = a7;
  return result;
}

- (BOOL)didSeekInBuffer
{
  return self->_didSeekInBuffer;
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
  v12.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  -[AVMetricPlayerItemRateChangeEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_didSeekInBuffer, CFSTR("didSeekInBuffer"));
}

- (AVMetricPlayerItemSeekDidCompleteEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemSeekDidCompleteEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricPlayerItemSeekDidCompleteEvent;
  v4 = -[AVMetricPlayerItemRateChangeEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
    v4->_didSeekInBuffer = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("didSeekInBuffer"));
  return v4;
}

@end
