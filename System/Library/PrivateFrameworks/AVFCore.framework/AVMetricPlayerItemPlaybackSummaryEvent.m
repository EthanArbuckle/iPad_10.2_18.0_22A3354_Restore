@implementation AVMetricPlayerItemPlaybackSummaryEvent

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  -[AVMetricEvent dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<AVMetricPlayerItemPlaybackSummaryEvent:%p %@ recoverableErrorCount:%ld error:%@ stallCount:%ld variantSwitchCount:%ld playbackDuration:%ld mediaResourceRequestCount:%ld timeSpentRecoveringFromStall:%f timeSpentInInitialStartup:%f timeWeightedAverageBitrate:%ld timeWeightedPeakBitrate:%ld>"), self, -[AVMetricEvent debugDescriptionForAttr](self, "debugDescriptionForAttr"), self->_recoverableErrorCount, -[AVMetricErrorEvent debugDescription](self->_errorEvent, "debugDescription"), self->_stallCount, self->_variantSwitchCount, self->_playbackDuration, self->_mediaResourceRequestCount, *(_QWORD *)&self->_timeSpentRecoveringFromStall, *(_QWORD *)&self->_timeSpentInInitialStartup, self->_timeWeightedAverageBitrate, self->_timeWeightedPeakBitrate);
}

- (AVMetricPlayerItemPlaybackSummaryEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 errorEvent:(id)a6 recoverableErrorCount:(int64_t)a7 stallCount:(int64_t)a8 variantSwitchCount:(int64_t)a9 playbackDuration:(int64_t)a10 mediaResourceRequestCount:(int64_t)a11 timeSpentRecoveringFromStall:(double)a12 timeSpentInInitialStartup:(double)a13 timeWeightedAverageBitrate:(int64_t)a14 timeWeightedPeakBitrate:(int64_t)a15
{
  AVMetricPlayerItemPlaybackSummaryEvent *v20;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v22;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  v22 = *a4;
  v20 = -[AVMetricEvent initWithDate:mediaTime:sessionID:](&v23, sel_initWithDate_mediaTime_sessionID_, a3, &v22, a5);
  if (v20)
  {
    v20->_errorEvent = (AVMetricErrorEvent *)a6;
    v20->_recoverableErrorCount = a7;
    v20->_stallCount = a8;
    v20->_variantSwitchCount = a9;
    v20->_playbackDuration = a10;
    v20->_mediaResourceRequestCount = a11;
    v20->_timeSpentRecoveringFromStall = a12;
    v20->_timeSpentInInitialStartup = a13;
    v20->_timeWeightedAverageBitrate = a14;
    v20->_timeWeightedPeakBitrate = a15;
  }
  return v20;
}

- (AVMetricErrorEvent)errorEvent
{
  return self->_errorEvent;
}

- (int64_t)recoverableErrorCount
{
  return self->_recoverableErrorCount;
}

- (int64_t)stallCount
{
  return self->_stallCount;
}

- (int64_t)variantSwitchCount
{
  return self->_variantSwitchCount;
}

- (int64_t)playbackDuration
{
  return self->_playbackDuration;
}

- (int64_t)mediaResourceRequestCount
{
  return self->_mediaResourceRequestCount;
}

- (double)timeSpentRecoveringFromStall
{
  return self->_timeSpentRecoveringFromStall;
}

- (double)timeSpentInInitialStartup
{
  return self->_timeSpentInInitialStartup;
}

- (int64_t)timeWeightedAverageBitrate
{
  return self->_timeWeightedAverageBitrate;
}

- (int64_t)timeWeightedPeakBitrate
{
  return self->_timeWeightedPeakBitrate;
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
  v12.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  -[AVMetricEvent encodeWithCoder:](&v12, sel_encodeWithCoder_, a3);
  objc_msgSend(a3, "encodeObject:forKey:", self->_errorEvent, CFSTR("errorEvent"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_recoverableErrorCount, CFSTR("recoverableErrorCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_stallCount, CFSTR("stallCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_variantSwitchCount, CFSTR("variantSwitchCount"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_playbackDuration, CFSTR("playbackDuration"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_mediaResourceRequestCount, CFSTR("mediaResourceRequestCount"));
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeSpentRecoveringFromStall"), self->_timeSpentRecoveringFromStall);
  objc_msgSend(a3, "encodeDouble:forKey:", CFSTR("timeSpentInInitialStartup"), self->_timeSpentInInitialStartup);
  objc_msgSend(a3, "encodeInteger:forKey:", self->_timeWeightedAverageBitrate, CFSTR("timeWeightedAverageBitrate"));
  objc_msgSend(a3, "encodeInteger:forKey:", self->_timeWeightedPeakBitrate, CFSTR("timeWeightedPeakBitrate"));
}

- (AVMetricPlayerItemPlaybackSummaryEvent)initWithCoder:(id)a3
{
  AVMetricPlayerItemPlaybackSummaryEvent *v4;
  double v5;
  double v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVMetricPlayerItemPlaybackSummaryEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v8, sel_initWithCoder_);
  if (v4)
  {
    v4->_errorEvent = (AVMetricErrorEvent *)(id)objc_msgSend(a3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("errorEvent"));
    v4->_recoverableErrorCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("recoverableErrorCount"));
    v4->_stallCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("stallCount"));
    v4->_variantSwitchCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("variantSwitchCount"));
    v4->_playbackDuration = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("playbackDuration"));
    v4->_mediaResourceRequestCount = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("mediaResourceRequestCount"));
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeSpentRecoveringFromStall"));
    v4->_timeSpentRecoveringFromStall = v5;
    objc_msgSend(a3, "decodeDoubleForKey:", CFSTR("timeSpentInInitialStartup"));
    v4->_timeSpentInInitialStartup = v6;
    v4->_timeWeightedAverageBitrate = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("timeWeightedAverageBitrate"));
    v4->_timeWeightedPeakBitrate = objc_msgSend(a3, "decodeIntegerForKey:", CFSTR("timeWeightedPeakBitrate"));
  }
  return v4;
}

@end
