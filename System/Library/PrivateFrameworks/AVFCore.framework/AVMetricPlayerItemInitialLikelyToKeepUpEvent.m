@implementation AVMetricPlayerItemInitialLikelyToKeepUpEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  -[AVMetricPlayerItemLikelyToKeepUpEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemInitialLikelyToKeepUpEvent:%p %@ playlistRequestEvents:%@ mediaSegmentRequestEvents:%@ contentKeyRequestEvents:%@>"), self, -[AVMetricPlayerItemLikelyToKeepUpEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_playlistRequestEvents, self->_mediaSegmentRequestEvents, self->_contentKeyRequestEvents);
}

- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 variant:(id)a6 timeTaken:(double)a7 loadedTimeRanges:(id)a8 playlistRequestEvents:(id)a9 mediaSegmentRequestEvents:(id)a10 contentKeyRequestEvents:(id)a11
{
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  v14 = *a4;
  v12 = -[AVMetricPlayerItemLikelyToKeepUpEvent initWithDate:mediaTime:sessionID:variant:timeTaken:loadedTimeRanges:](&v15, sel_initWithDate_mediaTime_sessionID_variant_timeTaken_loadedTimeRanges_, a3, &v14, a5, a6, a8, a7);
  if (v12)
  {
    v12->_playlistRequestEvents = (NSArray *)a9;
    v12->_mediaSegmentRequestEvents = (NSArray *)a10;
    v12->_contentKeyRequestEvents = (NSArray *)a11;
  }
  return v12;
}

- (NSArray)playlistRequestEvents
{
  return self->_playlistRequestEvents;
}

- (NSArray)mediaSegmentRequestEvents
{
  return self->_mediaSegmentRequestEvents;
}

- (NSArray)contentKeyRequestEvents
{
  return self->_contentKeyRequestEvents;
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
  v12.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  -[AVMetricPlayerItemLikelyToKeepUpEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_playlistRequestEvents, CFSTR("playlistRequestEvents"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_mediaSegmentRequestEvents, CFSTR("mediaSegmentRequestEvents"));
  objc_msgSend(a3, "encodeObject:forKey:", self->_contentKeyRequestEvents, CFSTR("contentKeyRequestEvents"));
}

- (AVMetricPlayerItemInitialLikelyToKeepUpEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemInitialLikelyToKeepUpEvent *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AVMetricPlayerItemInitialLikelyToKeepUpEvent;
  v4 = -[AVMetricPlayerItemLikelyToKeepUpEvent initWithCoder:](&v12, sel_initWithCoder_);
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E60];
    v6 = objc_opt_class();
    v4->_playlistRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v5, "setWithObjects:", v6, objc_opt_class(), 0), CFSTR("playlistRequestEvents"));
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    v4->_mediaSegmentRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0), CFSTR("mediaSegmentRequestEvents"));
    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    v4->_contentKeyRequestEvents = (NSArray *)(id)objc_msgSend(a3, "decodeObjectOfClasses:forKey:", objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0), CFSTR("contentKeyRequestEvents"));
  }
  return v4;
}

@end
