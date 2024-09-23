@implementation AVMetricEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescriptionForAttr
{
  NSDate *date;
  NSString *sessionID;
  CMTime time;

  date = self->_date;
  *(_OWORD *)&time.value = *(_OWORD *)&self->_mediaTime.value;
  sessionID = self->_sessionID;
  time.epoch = self->_mediaTime.epoch;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("sessionID:%@ date:%@ mediaTime:%f"), sessionID, date, CMTimeGetSeconds(&time));
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricEvent:%p %@>"), self, -[AVMetricEvent debugDescriptionForAttr](self, "debugDescriptionForAttr"));
}

- (AVMetricEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5
{
  AVMetricEvent *v8;
  int64_t var3;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)AVMetricEvent;
  v8 = -[AVMetricEvent init](&v11, sel_init);
  if (v8)
  {
    v8->_date = (NSDate *)a3;
    var3 = a4->var3;
    *(_OWORD *)&v8->_mediaTime.value = *(_OWORD *)&a4->var0;
    v8->_mediaTime.epoch = var3;
    v8->_sessionID = (NSString *)a5;
  }
  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (NSString)sessionID
{
  return self->_sessionID;
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
  const __CFAllocator *v11;
  CFDictionaryRef v12;
  void *v13;
  $95D729B680665BEAEFA1D6FCA8238556 mediaTime;

  if ((objc_msgSend(a3, "allowsKeyedCoding") & 1) == 0)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("supports only keyed archivers"), v6, v7, v8, v9, v10, mediaTime.value), 0);
    objc_exception_throw(v13);
  }
  objc_msgSend(a3, "encodeObject:forKey:", self->_date, CFSTR("date"));
  v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  mediaTime = self->_mediaTime;
  v12 = CMTimeCopyAsDictionary((CMTime *)&mediaTime, v11);
  objc_msgSend(a3, "encodeObject:forKey:", v12, CFSTR("mediaTime"));

  objc_msgSend(a3, "encodeObject:forKey:", self->_sessionID, CFSTR("sessionID"));
}

- (AVMetricEvent)initWithCoder:(id)a3
{
  AVMetricEvent *v4;
  const __CFDictionary *v5;
  CMTimeEpoch epoch;
  CMTime v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVMetricEvent;
  v4 = -[AVMetricEvent init](&v9, sel_init);
  if (v4)
  {
    v4->_date = (NSDate *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("date"));
    v5 = (const __CFDictionary *)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mediaTime"));
    CMTimeMakeFromDictionary(&v8, v5);
    epoch = v8.epoch;
    *(_OWORD *)&v4->_mediaTime.value = *(_OWORD *)&v8.value;
    v4->_mediaTime.epoch = epoch;
    v4->_sessionID = (NSString *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("sessionID"));
  }
  return v4;
}

@end
