@implementation AVMetricErrorEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricErrorEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricErrorEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricErrorEvent:%p %@, didRecover:%d error:%@>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_didRecover, self->_error);
}

- (AVMetricErrorEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 didRecover:(BOOL)a6 error:(id)a7
{
  AVMetricErrorEvent *v9;
  AVMetricErrorEvent *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AVMetricErrorEvent;
  v12 = *a4;
  v9 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v13, sel_initWithDate_mediaTime_sessionID_, a3, &v12, a5);
  v10 = v9;
  if (v9)
  {
    v9->_didRecover = a6;
    v9->_error = (NSError *)a7;
  }
  return v10;
}

- (BOOL)didRecover
{
  return self->_didRecover;
}

- (NSError)error
{
  return self->_error;
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
  v12.super_class = (Class)AVMetricErrorEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeBool:forKey:", self->_didRecover, CFSTR("didRecover"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_error, CFSTR("error"));
}

- (AVMetricErrorEvent)initWithCoder:(id)a3
{
  AVMetricErrorEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricErrorEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_didRecover = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("didRecover"));
    v4->_error = (NSError *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("error"));
  }
  return v4;
}

@end
