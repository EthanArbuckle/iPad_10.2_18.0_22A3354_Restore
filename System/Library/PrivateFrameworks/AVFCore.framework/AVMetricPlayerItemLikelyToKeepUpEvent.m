@implementation AVMetricPlayerItemLikelyToKeepUpEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescriptionForAttr
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ variant:%@ timeTaken:%f loadedTimeRanges:%@>"), -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_variant, *(_QWORD *)&self->_timeTaken, self->_loadedTimeRanges);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemLikelyToKeepUpEvent:%p %@>"), self, -[AVMetricPlayerItemLikelyToKeepUpEvent debugDescriptionForAttr](self, "debugDescriptionForAttr"));
}

- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8
{
  AVMetricPlayerItemLikelyToKeepUpEvent *v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  v13 = *a4;
  v11 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v14, sel_initWithDate_mediaTime_sessionID_, a3, &v13, a5);
  if (v11)
  {
    v11->_variant = (AVAssetVariant *)a6;
    v11->_timeTaken = a7;
    v11->_loadedTimeRanges = (NSArray *)a8;
  }
  return v11;
}

- (AVAssetVariant)variant
{
  return self->_variant;
}

- (double)timeTaken
{
  return self->_timeTaken;
}

- (NSArray)loadedTimeRanges
{
  return (NSArray *)getLoadedTimeRangesFromTimeIntervals(self->_loadedTimeRanges);
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
  v12.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_variant, CFSTR("variant"));
  objc_msgSend(a3, "encodeInteger:forKey:", (uint64_t)self->_timeTaken, CFSTR("timeTaken"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_loadedTimeRanges, CFSTR("loadedTimeRanges"));
}

- (AVMetricPlayerItemLikelyToKeepUpEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemLikelyToKeepUpEvent *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemLikelyToKeepUpEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    v4->_variant = (AVAssetVariant *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("variant"));
    v4->_timeTaken = (double)objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("timeTaken"));
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    v9 = objc_opt_class();
    v10 = objc_opt_class();
    v4->_loadedTimeRanges = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, v7, v8, v9, v10, objc_opt_class(), 0), CFSTR("loadedTimeRanges"));
  }
  return v4;
}

@end
