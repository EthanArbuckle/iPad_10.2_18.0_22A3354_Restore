@implementation AVMetricPlayerItemRateChangeEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescriptionForAttr
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ rate:%f previousRate:%f variant:%@"), -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), *(_QWORD *)&self->_rate, *(_QWORD *)&self->_previousRate, self->_variant);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemRateChangeEvent:%p %@>"), self, -[AVMetricPlayerItemRateChangeEvent debugDescriptionForAttr](self, "debugDescriptionForAttr"));
}

- (AVMetricPlayerItemRateChangeEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 rate:(double)a7 previousRate:(double)a8
{
  AVMetricPlayerItemRateChangeEvent *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  v13 = *a4;
  v11 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v14, sel_initWithDate_mediaTime_sessionID_, a3, &v13, a5);
  if (v11)
  {
    v11->_variant = (AVAssetVariant *)a6;
    v11->_rate = a7;
    v11->_previousRate = a8;
  }
  return v11;
}

- (double)rate
{
  return self->_rate;
}

- (double)previousRate
{
  return self->_previousRate;
}

- (AVAssetVariant)variant
{
  return self->_variant;
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
  v12.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("rate"), self->_rate);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("previousRate"), self->_previousRate);
  objc_msgSend(a3, "encodeObject:forKey:", self->_variant, CFSTR("variant"));
}

- (AVMetricPlayerItemRateChangeEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemRateChangeEvent *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMetricPlayerItemRateChangeEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("rate"));
    v4->_rate = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("previousRate"));
    v4->_previousRate = v6;
    v4->_variant = (AVAssetVariant *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variant"));
  }
  return v4;
}

@end
