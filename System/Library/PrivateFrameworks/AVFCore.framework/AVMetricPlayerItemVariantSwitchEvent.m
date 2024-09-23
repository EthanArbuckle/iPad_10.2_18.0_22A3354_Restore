@implementation AVMetricPlayerItemVariantSwitchEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemVariantSwitchEvent:%p %@ fromVariant:%@ toVariant:%@ loadedTimeRanges:%@ didSucceed:%d>"), self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_fromVariant, self->_toVariant, self->_loadedTimeRanges, self->_didSucceed);
}

- (AVMetricPlayerItemVariantSwitchEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 fromVariant:(id)a6 toVariant:(id)a7 loadedTimeRanges:(id)a8 didSucceed:(BOOL)a9
{
  AVMetricPlayerItemVariantSwitchEvent *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  v14 = *a4;
  v12 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v15, sel_initWithDate_mediaTime_sessionID_, a3, &v14, a5);
  if (v12)
  {
    v12->_fromVariant = (AVAssetVariant *)a6;
    v12->_toVariant = (AVAssetVariant *)a7;
    v12->_loadedTimeRanges = (NSArray *)a8;
    v12->_didSucceed = a9;
  }
  return v12;
}

- (AVAssetVariant)fromVariant
{
  return self->_fromVariant;
}

- (AVAssetVariant)toVariant
{
  return self->_toVariant;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)getLoadedTimeRangesFromTimeIntervals(self->_loadedTimeRanges);
}

- (BOOL)didSucceed
{
  return self->_didSucceed;
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
  v12.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_fromVariant, CFSTR("fromVariant"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_toVariant, CFSTR("toVariant"));
  objc_msgSend(a3, "encodeBool:forKey:", self->_didSucceed, CFSTR("didSucceed"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_loadedTimeRanges, CFSTR("loadedTimeRange"));
}

- (AVMetricPlayerItemVariantSwitchEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemVariantSwitchEvent *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)AVMetricPlayerItemVariantSwitchEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_fromVariant = (AVAssetVariant *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fromVariant"));
    v4->_toVariant = (AVAssetVariant *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("toVariant"));
    v4->_didSucceed = objc_msgSend(a3, "decodeBoolForKey:", CFSTR("didSucceed"));
    v4->_loadedTimeRanges = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("loadedTimeRange"));
  }
  return v4;
}

@end
