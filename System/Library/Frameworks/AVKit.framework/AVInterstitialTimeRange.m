@implementation AVInterstitialTimeRange

+ (AVInterstitialTimeRange)interstitialTimeRangeWithPlayerInterstitialEvent:(id)a3
{
  id v3;
  void *v4;
  AVInterstitialDateRange *v5;
  void *v6;
  AVInterstitialDateRange *v7;
  AVInterstitialTimeRange *p_super;
  AVInterstitialTimeRange *v9;
  char v10;
  double v11;
  NSObject *v12;
  _OWORD v14[3];
  uint8_t buf[16];
  _OWORD v16[2];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = [AVInterstitialDateRange alloc];
    objc_msgSend(v3, "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[AVInterstitialDateRange initWithStart:end:](v5, "initWithStart:end:", v6, 0);

    p_super = &v7->super;
  }
  else
  {
    memset(v16, 0, sizeof(v16));
    *(_OWORD *)buf = 0u;
    if (v3)
    {
      objc_msgSend(v3, "time");
    }
    else
    {
      memset(buf, 0, sizeof(buf));
      *(_QWORD *)&v16[0] = 0;
    }
    *(_OWORD *)((char *)v16 + 8) = *MEMORY[0x1E0CA2E68];
    *((_QWORD *)&v16[1] + 1) = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    v9 = [AVInterstitialTimeRange alloc];
    v14[0] = *(_OWORD *)buf;
    v14[1] = v16[0];
    v14[2] = v16[1];
    p_super = -[AVInterstitialTimeRange initWithTimeRange:](v9, "initWithTimeRange:", v14);
    v7 = 0;
  }
  -[AVInterstitialTimeRange _setPlayerInterstitialEvent:](p_super, "_setPlayerInterstitialEvent:", v3);
  v10 = objc_msgSend(v3, "restrictions");
  v11 = INFINITY;
  if ((v10 & 4) == 0)
    v11 = 0.0;
  -[AVInterstitialTimeRange setLinearPlaybackRequirementDuration:](p_super, "setLinearPlaybackRequirementDuration:", v11);
  -[AVInterstitialTimeRange setRequiredViewingPolicy:](p_super, "setRequiredViewingPolicy:", ~(2 * objc_msgSend(v3, "restrictions")) & 2);
  if (objc_msgSend(v3, "timelineOccupancy") == 1)
  {
    -[AVInterstitialTimeRange _setCollapsedInTimeLine:](p_super, "_setCollapsedInTimeLine:", 0);
    if (objc_msgSend(v3, "supplementsPrimaryContent"))
      -[AVInterstitialTimeRange _setUnmarked:](p_super, "_setUnmarked:", 1);
  }
  else if (objc_msgSend(v3, "supplementsPrimaryContent"))
  {
    _AVLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "+[AVInterstitialTimeRange(AVPlayerInterstitialSupport) interstitialTimeRangeWithPlayerInterstitialEvent:]";
      _os_log_impl(&dword_1AC4B1000, v12, OS_LOG_TYPE_DEFAULT, "%s Interstitial has invalid combination of supplementsPrimaryContent without fillOccupancy -- overriding primary content designation!", buf, 0xCu);
    }

  }
  return p_super;
}

- (AVInterstitialTimeRange)init
{
  CMTime v4;
  CMTime start;
  CMTimeRange v6;

  start = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  v4 = start;
  CMTimeRangeMake(&v6, &start, &v4);
  return -[AVInterstitialTimeRange initWithTimeRange:](self, "initWithTimeRange:", &v6);
}

- (id)_initWithTimeRange:(id *)a3
{
  AVInterstitialTimeRange *v4;
  AVInterstitialTimeRange *v5;
  __int128 v6;
  __int128 v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVInterstitialTimeRange;
  v4 = -[AVInterstitialTimeRange init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&a3->var0.var3;
    v8[0] = *(_OWORD *)&a3->var0.var0;
    v8[1] = v6;
    v8[2] = *(_OWORD *)&a3->var1.var1;
    _CommonInit(v4, v8);
  }
  return v5;
}

- (AVInterstitialTimeRange)initWithTimeRange:(CMTimeRange *)timeRange
{
  AVInterstitialTimeRange *v4;
  AVInterstitialTimeRange *v5;
  __int128 v6;
  __int128 v8[3];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVInterstitialTimeRange;
  v4 = -[AVInterstitialTimeRange init](&v9, sel_init);
  v5 = v4;
  if (v4)
  {
    v6 = *(_OWORD *)&timeRange->start.epoch;
    v8[0] = *(_OWORD *)&timeRange->start.value;
    v8[1] = v6;
    v8[2] = *(_OWORD *)&timeRange->duration.timescale;
    _CommonInit(v4, v8);
  }
  return v5;
}

- (AVInterstitialTimeRange)initWithHiddenTimeRange:(id *)a3
{
  __int128 v3;
  AVInterstitialTimeRange *result;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  result = -[AVInterstitialTimeRange initWithTimeRange:](self, "initWithTimeRange:", v5);
  if (result)
    result->_hidden = 1;
  return result;
}

- (AVInterstitialTimeRange)initWithCoder:(id)a3
{
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  __int128 v6;
  AVInterstitialTimeRange *v7;
  CMTimeRange v9;
  CMTimeRange v10;

  objc_msgSend(a3, "decodeObjectForKey:", CFSTR("AVTimeRange"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  *(_OWORD *)&v10.start.value = *MEMORY[0x1E0CA2E50];
  *(_OWORD *)&v10.start.epoch = v6;
  *(_OWORD *)&v10.duration.timescale = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  if (v4)
    CMTimeRangeMakeFromDictionary(&v10, v4);
  v9 = v10;
  v7 = -[AVInterstitialTimeRange initWithTimeRange:](self, "initWithTimeRange:", &v9);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  CFDictionaryRef v5;
  CMTimeRange v6;

  v4 = a3;
  -[AVInterstitialTimeRange timeRange](self, "timeRange");
  v5 = CMTimeRangeCopyAsDictionary(&v6, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("AVTimeRange"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  AVInterstitialTimeRange *v4;
  AVInterstitialTimeRange *v5;
  uint64_t v7;

  v4 = +[AVInterstitialTimeRange allocWithZone:](AVInterstitialTimeRange, "allocWithZone:", a3);
  -[AVInterstitialTimeRange timeRange](self, "timeRange");
  v5 = -[AVInterstitialTimeRange initWithTimeRange:](v4, "initWithTimeRange:", &v7);
  v5->_hidden = -[AVInterstitialTimeRange isHidden](self, "isHidden");
  v5->_collapsedInTimeLine = -[AVInterstitialTimeRange isCollapsedInTimeLine](self, "isCollapsedInTimeLine");
  return v5;
}

- (void)_setDurationTimeInterval:(double)a3
{
  CMTime v5;

  -[AVInterstitialTimeRange willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("timeRange"));
  CMTimeMakeWithSeconds(&v5, a3, 1000);
  self->_timeRange.duration = ($95D729B680665BEAEFA1D6FCA8238556)v5;
  -[AVInterstitialTimeRange didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("timeRange"));
}

- (unint64_t)hash
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  CMTime v7;
  __int128 v8;
  _OWORD v9[2];

  memset(v9, 0, sizeof(v9));
  v8 = 0u;
  -[AVInterstitialTimeRange timeRange](self, "timeRange");
  *(_OWORD *)&v7.value = v8;
  v7.epoch = *(_QWORD *)&v9[0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v7));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  v7 = *(CMTime *)((char *)v9 + 8);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&v7));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  return v5 ^ __ROR8__(v3, 61);
}

- (BOOL)isEqualToInterstitialTimeRange:(id)a3
{
  id v4;
  BOOL v5;
  CMTime v7;
  CMTime time1;
  __int128 v9;
  _OWORD v10[2];
  __int128 v11;
  _OWORD v12[2];

  v4 = a3;
  memset(v12, 0, sizeof(v12));
  v11 = 0u;
  -[AVInterstitialTimeRange timeRange](self, "timeRange");
  if (v4
    && (memset(v10, 0, sizeof(v10)),
        v9 = 0u,
        objc_msgSend(v4, "timeRange"),
        *(_OWORD *)&time1.value = v11,
        time1.epoch = *(_QWORD *)&v12[0],
        *(_OWORD *)&v7.value = v9,
        v7.epoch = *(_QWORD *)&v10[0],
        !CMTimeCompare(&time1, &v7)))
  {
    time1 = *(CMTime *)((char *)v12 + 8);
    v7 = *(CMTime *)((char *)v10 + 8);
    v5 = CMTimeCompare(&time1, &v7) == 0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  AVInterstitialTimeRange *v4;
  AVInterstitialTimeRange *v5;
  uint64_t v6;
  BOOL v7;

  v4 = (AVInterstitialTimeRange *)a3;
  v5 = v4;
  if (self == v4)
    v7 = 1;
  else
    v7 = v4
      && (v6 = objc_opt_class(), v6 == objc_opt_class())
      && -[AVInterstitialTimeRange isEqualToInterstitialTimeRange:](self, "isEqualToInterstitialTimeRange:", v5);

  return v7;
}

- (id)description
{
  const __CFAllocator *v3;
  __CFString *v4;
  __CFString *v5;
  id v6;
  AVPlayerInterstitialEvent *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  double Seconds;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  __CFString *v20;
  void *v21;
  void *v22;
  void *v23;
  CMTime v25;
  CMTime time;
  CMTimeRange range;
  CMTime v28;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  -[AVInterstitialTimeRange timeRange](self, "timeRange");
  v4 = (__CFString *)CMTimeRangeCopyDescription(v3, &range);
  v5 = v4;
  if (!self->_playerInterstitialEvent)
  {
    v12 = v4;
    goto LABEL_25;
  }
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = self->_playerInterstitialEvent;
  v8 = (void *)MEMORY[0x1E0CB3940];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ %p"), v10, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v11);

  if (v7)
    -[AVPlayerInterstitialEvent time](v7, "time");
  else
    memset(&time, 0, sizeof(time));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.1f sec"), CMTimeGetSeconds(&time));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v13);
  if (!v7)
  {
    memset(&v25, 0, sizeof(v25));
LABEL_10:
    v28 = v25;
    Seconds = CMTimeGetSeconds(&v28);
    if (Seconds == 0.0)
    {
      v14 = &stru_1E5BB5F88;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("resume %+0.1f sec"), *(_QWORD *)&Seconds);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_13;
  }
  -[AVPlayerInterstitialEvent resumptionOffset](v7, "resumptionOffset");
  if ((~v25.flags & 0x11) != 0)
    goto LABEL_10;
  v14 = CFSTR("resume live stream");
LABEL_13:
  if (-[__CFString length](v14, "length"))
    objc_msgSend(v6, "addObject:", v14);
  v16 = -[AVPlayerInterstitialEvent restrictions](v7, "restrictions");
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v18 = v17;
  if ((v16 & 1) != 0)
    objc_msgSend(v17, "addObject:", CFSTR("ConstrainsSeekingForwardInPrimaryContent"));
  if ((v16 & 4) != 0)
    objc_msgSend(v18, "addObject:", CFSTR("RequiresPlaybackAtPreferredRateForAdvancement"));
  if ((v16 & 0xFFFFFFFFFFFFFFFALL) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unrecognized restrictions 0x%lx"), v16 & 0xFFFFFFFFFFFFFFFALL);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObject:", v19);

  }
  if (objc_msgSend(v18, "count"))
  {
    objc_msgSend(v18, "componentsJoinedByString:", CFSTR(", "));
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v20 = CFSTR("no restrictions");
  }

  objc_msgSend(v6, "addObject:", v20);
  v21 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", "));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("<%@>"), v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ {%@}"), v5, v23);
  v12 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_25:
  return v12;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)isCollapsedInTimeLine
{
  return self->_collapsedInTimeLine;
}

- (void)_setCollapsedInTimeLine:(BOOL)a3
{
  self->_collapsedInTimeLine = a3;
}

- (void)_setActive:(BOOL)a3
{
  if (self->_active != a3)
  {
    self->_active = a3;
    if (!a3)
      -[AVInterstitialTimeRange _setWatchCount:](self, "_setWatchCount:", -[AVInterstitialTimeRange _watchCount](self, "_watchCount") + 1);
  }
}

- (double)playingDuration
{
  double result;
  $95D729B680665BEAEFA1D6FCA8238556 duration;

  result = self->_playingDuration;
  if (result == -1.0)
  {
    duration = self->_timeRange.duration;
    return CMTimeGetSeconds((CMTime *)&duration);
  }
  return result;
}

- (void)_setPlayingDuration:(double)a3
{
  self->_playingDuration = a3;
}

- (id)playerInterstitialEvent
{
  return self->_playerInterstitialEvent;
}

- (void)_setPlayerInterstitialEvent:(id)a3
{
  AVPlayerInterstitialEvent *v5;
  uint64_t v6;
  AVPlayerInterstitialEvent *v7;

  v5 = (AVPlayerInterstitialEvent *)a3;
  if (self->_playerInterstitialEvent != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)&self->_playerInterstitialEvent, a3);
    v5 = v7;
    if (v7)
    {
      if ((~self->_timeRange.duration.flags & 0x11) == 0)
      {
        v6 = MEMORY[0x1E0CA2E68];
        *(_OWORD *)&self->_timeRange.duration.value = *MEMORY[0x1E0CA2E68];
        self->_timeRange.duration.epoch = *(_QWORD *)(v6 + 16);
      }
    }
  }

}

- (CMTimeRange)timeRange
{
  CMTimeRange *result;

  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (BOOL)isActive
{
  return self->_active;
}

- (unint64_t)_watchCount
{
  return self->__watchCount;
}

- (void)_setWatchCount:(unint64_t)a3
{
  self->__watchCount = a3;
}

- (double)linearPlaybackRequirementDuration
{
  return self->_linearPlaybackRequirementDuration;
}

- (void)setLinearPlaybackRequirementDuration:(double)a3
{
  self->_linearPlaybackRequirementDuration = a3;
}

- (int64_t)requiredViewingPolicy
{
  return self->_requiredViewingPolicy;
}

- (void)setRequiredViewingPolicy:(int64_t)a3
{
  self->_requiredViewingPolicy = a3;
}

- (BOOL)isUnmarked
{
  return self->_unmarked;
}

- (void)_setUnmarked:(BOOL)a3
{
  self->_unmarked = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerInterstitialEvent, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
