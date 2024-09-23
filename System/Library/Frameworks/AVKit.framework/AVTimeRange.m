@implementation AVTimeRange

- (AVInterstitialTimeRange)interstice
{
  AVTimeRange *v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = self;
  else
    v3 = 0;
  return -[AVTimeRange interstice](v3, "interstice");
}

- (AVInterstitialDateRange)dateBasedInterstice
{
  void *v2;
  void *v3;
  AVInterstitialDateRange *v4;

  -[AVTimeRange interstice](self, "interstice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (BOOL)isHidden
{
  void *v3;
  void *v4;
  char v5;

  -[AVTimeRange interstice](self, "interstice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTimeRange interstice](self, "interstice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isHidden");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isSkipped
{
  void *v3;
  void *v4;
  char v5;

  -[AVTimeRange interstice](self, "interstice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTimeRange interstice](self, "interstice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isSkipped");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isCollapsedInTimeLine
{
  void *v3;
  void *v4;
  char v5;

  -[AVTimeRange interstice](self, "interstice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTimeRange interstice](self, "interstice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isCollapsedInTimeLine");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isUnmarked
{
  void *v3;
  void *v4;
  char v5;

  -[AVTimeRange interstice](self, "interstice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[AVTimeRange interstice](self, "interstice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isUnmarked");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)requiresLinearPlaybackForTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;

  v4 = self;
  -[AVTimeRange interstice](self, "interstice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerInterstitialEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v4 = (void *)(((unint64_t)objc_msgSend(v6, "restrictions") >> 2) & 1);
  }
  else if (v5 && objc_msgSend(v4, "containsTime:", a3))
  {
    objc_msgSend(v4, "startTime");
    v9 = v8;
    objc_msgSend(v5, "linearPlaybackRequirementDuration");
    LOBYTE(v4) = v9 + v10 > a3;
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return (char)v4;
}

+ (AVTimeRange)timeRangeWithInterstice:(id)a3
{
  id v3;
  AVTimeRangeForInterstitial *v4;

  v3 = a3;
  v4 = -[AVTimeRangeForInterstitial initWithInterstice:]([AVTimeRangeForInterstitial alloc], "initWithInterstice:", v3);

  return (AVTimeRange *)v4;
}

- (AVTimeRange)init
{
  return -[AVTimeRange initWithStartTime:duration:](self, "initWithStartTime:duration:", 0.0, 0.0);
}

- (AVTimeRange)initWithStartTime:(double)a3 duration:(double)a4
{
  AVTimeRange *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AVTimeRange;
  result = -[AVTimeRange init](&v7, sel_init);
  if (result)
  {
    result->_startTime = a3;
    result->_duration = a4;
  }
  return result;
}

- (AVTimeRange)initWithStartTime:(double)a3 endTime:(double)a4
{
  return -[AVTimeRange initWithStartTime:duration:](self, "initWithStartTime:duration:", a3, a4 - a3);
}

- (AVTimeRange)initWithCMTimeRange:(id *)a3
{
  double Seconds;
  unsigned int var2;
  double v6;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *p_var1;
  $3CC8671D27C23BF42ADDB32F2B5E48AE var0;

  Seconds = 0.0;
  if ((a3->var0.var2 & 1) != 0
    && (var2 = a3->var1.var2, (var2 & 1) != 0)
    && !a3->var1.var3
    && (a3->var0.var2 & 0x1D) == 1
    && (p_var1 = &a3->var1, (a3->var1.var0 & 0x8000000000000000) == 0))
  {
    if ((a3->var1.var2 & 0x1D) == 1 || (v6 = 0.0, (var2 & 0x10) != 0))
    {
      var0 = a3->var0;
      Seconds = CMTimeGetSeconds((CMTime *)&var0);
      var0 = *p_var1;
      v6 = CMTimeGetSeconds((CMTime *)&var0);
    }
  }
  else
  {
    v6 = 0.0;
  }
  return -[AVTimeRange initWithStartTime:duration:](self, "initWithStartTime:duration:", Seconds, v6);
}

- (AVTimeRange)initWithAVTimedMetadataGroup:(id)a3
{
  _OWORD v5[3];

  if (a3)
    objc_msgSend(a3, "timeRange");
  else
    memset(v5, 0, sizeof(v5));
  return -[AVTimeRange initWithCMTimeRange:](self, "initWithCMTimeRange:", v5);
}

- (AVTimeRange)initWithUnionOfCMTimeRanges:(id)a3
{
  id v3;
  CMTimeFlags flags;
  CMTimeValue v5;
  CMTimeScale v6;
  CMTimeFlags v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  CMTimeEpoch epoch;
  CMTimeEpoch v14;
  uint64_t v15;
  NSObject *v16;
  objc_class *v17;
  void *v18;
  CMTimeEpoch v19;
  AVTimeRange *v20;
  uint64_t v23;
  id obj;
  CMTimeEpoch v25;
  CMTimeEpoch v26;
  CMTimeRange otherRange;
  CMTimeRange range;
  CMTimeRange v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CMTimeRange buf;
  _BYTE v35[128];
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  value = *MEMORY[0x1E0CA2E40];
  flags = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 12);
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 8);
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 24);
  v6 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 32);
  v7 = *(_DWORD *)(MEMORY[0x1E0CA2E40] + 36);
  v25 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 16);
  v26 = *(_QWORD *)(MEMORY[0x1E0CA2E40] + 40);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v3;
  v8 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v31;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          memset(&buf, 0, sizeof(buf));
          if (v12)
            objc_msgSend(v12, "CMTimeRangeValue");
          if ((flags & 1) == 0 || (v7 & 1) == 0 || v26 || v5 < 0)
          {
            value = buf.start.value;
            flags = buf.start.flags;
            timescale = buf.start.timescale;
            v5 = buf.duration.value;
            epoch = buf.start.epoch;
            v6 = buf.duration.timescale;
            v7 = buf.duration.flags;
            v14 = buf.duration.epoch;
          }
          else
          {
            range.start.value = value;
            range.start.timescale = timescale;
            range.start.flags = flags;
            range.start.epoch = v25;
            range.duration.value = v5;
            range.duration.timescale = v6;
            range.duration.flags = v7;
            range.duration.epoch = 0;
            otherRange = buf;
            CMTimeRangeGetUnion(&v29, &range, &otherRange);
            value = v29.start.value;
            flags = v29.start.flags;
            timescale = v29.start.timescale;
            epoch = v29.start.epoch;
            v5 = v29.duration.value;
            v6 = v29.duration.timescale;
            v7 = v29.duration.flags;
            v14 = v29.duration.epoch;
          }
          v25 = epoch;
          v26 = v14;
        }
        else
        {
          v15 = v9;
          _AVLog();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            v17 = (objc_class *)objc_opt_class();
            NSStringFromClass(v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.start.value) = 136315650;
            *(CMTimeValue *)((char *)&buf.start.value + 4) = (CMTimeValue)"-[AVTimeRange initWithUnionOfCMTimeRanges:]";
            LOWORD(buf.start.flags) = 2114;
            *(_QWORD *)((char *)&buf.start.flags + 2) = v18;
            HIWORD(buf.start.epoch) = 2048;
            buf.duration.value = (CMTimeValue)v12;
            _os_log_impl(&dword_1AC4B1000, v16, OS_LOG_TYPE_DEFAULT, "%s There's a loadedTimeRange that doesn't respond to -CMTimeRangeValue (<%{public}@ %p>)", (uint8_t *)&buf, 0x20u);

            v10 = v23;
          }

          v9 = v15;
        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v9);
  }
  if ((flags & 1) == 0 || (v7 & 1) == 0 || v26 || v5 < 0)
  {
    value = *MEMORY[0x1E0CA2E50];
    flags = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 12);
    timescale = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 8);
    v5 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 24);
    v25 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 16);
    v6 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 32);
    v7 = *(_DWORD *)(MEMORY[0x1E0CA2E50] + 36);
    v19 = *(_QWORD *)(MEMORY[0x1E0CA2E50] + 40);
  }
  else
  {
    v19 = 0;
  }
  buf.start.value = value;
  buf.start.timescale = timescale;
  buf.start.flags = flags;
  buf.start.epoch = v25;
  buf.duration.value = v5;
  *(_QWORD *)&buf.duration.timescale = __PAIR64__(v7, v6);
  buf.duration.epoch = v19;
  v20 = -[AVTimeRange initWithCMTimeRange:](self, "initWithCMTimeRange:", &buf);

  return v20;
}

- (void)setMapTime:(double)a3 toDate:(id)a4
{
  id v6;
  double v7;
  id v8;

  v6 = a4;
  -[AVTimeRange startTime](self, "startTime");
  objc_msgSend(v6, "dateByAddingTimeInterval:", v7 - a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  -[AVTimeRange setStartDate:](self, "setStartDate:", v8);
}

- (void)setMapDate:(id)a3 toTime:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  double v9;
  double v10;
  uint8_t buf[16];

  v6 = a3;
  -[AVTimeRange startDate](self, "startDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    _AVLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1AC4B1000, v8, OS_LOG_TYPE_ERROR, "setMapDate:toTime: expects startDate to be valid. Did the caller want setMapTime:toDate: instead?", buf, 2u);
    }

  }
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v10 = v9 + a4;
  -[AVTimeRange willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("startTime"));
  self->_startTime = v10;
  -[AVTimeRange didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("startTime"));

}

- (id)dateForTime:(double)a3
{
  void *v5;
  double v6;
  void *v7;

  -[AVTimeRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimeRange startTime](self, "startTime");
  objc_msgSend(v5, "dateByAddingTimeInterval:", a3 - v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)timeForDate:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;

  v4 = a3;
  -[AVTimeRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;
    -[AVTimeRange startTime](self, "startTime");
    v9 = v7 + v8;
  }
  else
  {
    v9 = NAN;
  }

  return v9;
}

- (double)endTime
{
  double v3;
  double v4;
  double v5;

  -[AVTimeRange startTime](self, "startTime");
  v4 = v3;
  -[AVTimeRange duration](self, "duration");
  return v4 + v5;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startCMTime
{
  Float64 v4;

  -[AVTimeRange startTime](self, "startTime");
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v4, 10000);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)endCMTime
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  double v6;
  double v7;
  Float64 v8;
  uint64_t v9;

  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[AVTimeRange endTime](self, "endTime");
  if (fabs(v6) == INFINITY
    || (result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[AVTimeRange duration](self, "duration"), fabs(v7) == INFINITY))
  {
    v9 = MEMORY[0x1E0CA2E10];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E10];
    retstr->var3 = *(_QWORD *)(v9 + 16);
  }
  else
  {
    -[AVTimeRange duration](self, "duration");
    -[AVTimeRange endTime](self, "endTime");
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, v8, 10000);
  }
  return result;
}

- ($008D8879F9973785877FFE498A5CE36E)cmTimeRange
{
  CMTime v6;
  CMTime start;

  -[AVTimeRange startCMTime](self, "startCMTime");
  -[AVTimeRange endCMTime](self, "endCMTime");
  return ($008D8879F9973785877FFE498A5CE36E *)CMTimeRangeFromTimeToTime((CMTimeRange *)retstr, &start, &v6);
}

- (id)endDate
{
  void *v3;
  void *v4;

  -[AVTimeRange startDate](self, "startDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimeRange duration](self, "duration");
  objc_msgSend(v3, "dateByAddingTimeInterval:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)containsTime:(double)a3
{
  double v5;
  double v7;

  -[AVTimeRange startTime](self, "startTime");
  if (v5 > a3)
    return 0;
  -[AVTimeRange endTime](self, "endTime");
  return v7 > a3;
}

- (BOOL)containsDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[AVTimeRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && (-[AVTimeRange startDate](self, "startDate"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "compare:", v4),
        v6,
        (unint64_t)(v7 + 1) <= 1))
  {
    -[AVTimeRange endDate](self, "endDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "compare:", v8) == -1;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (double)deltaTimeFromOutsideTime:(double)a3
{
  double v5;
  double v6;
  double v7;
  double result;

  -[AVTimeRange startTime](self, "startTime");
  v6 = a3 - v5;
  -[AVTimeRange endTime](self, "endTime");
  result = a3 - v7;
  if (result < 0.0)
    result = 0.0;
  if (v6 < 0.0)
    return v6;
  return result;
}

- (double)pinnedTime:(double)a3
{
  double v4;

  -[AVTimeRange deltaTimeFromOutsideTime:](self, "deltaTimeFromOutsideTime:", a3);
  return a3 - v4;
}

- (id)timeRangeIntersectingWithTimeRange:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  AVTimeRange *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  v4 = a3;
  if (v4)
  {
    -[AVTimeRange startTime](self, "startTime");
    v6 = v5;
    objc_msgSend(v4, "startTime");
    if (v6 < v7)
      v6 = v7;
    -[AVTimeRange endTime](self, "endTime");
    v9 = v8;
    objc_msgSend(v4, "endTime");
    if (v9 >= v10)
      v9 = v10;
    if (v9 <= v6)
    {
      +[AVTimeRange timeRangeZero](AVTimeRange, "timeRangeZero");
      v11 = (AVTimeRange *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = -[AVTimeRange initWithStartTime:endTime:]([AVTimeRange alloc], "initWithStartTime:endTime:", v6, v9);
      -[AVTimeRange startDate](self, "startDate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[AVTimeRange startTime](self, "startTime");
        v14 = v13;
        -[AVTimeRange startDate](self, "startDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[AVTimeRange setMapTime:toDate:](v11, "setMapTime:toDate:", v15, v14);

      }
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)timeRangeExcludingTimeRange:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  AVTimeRange *v25;
  AVTimeRange *v26;

  v4 = a3;
  objc_msgSend(v4, "startTime");
  v6 = v5;
  -[AVTimeRange endTime](self, "endTime");
  if (v6 >= v7 || (objc_msgSend(v4, "endTime"), v9 = v8, -[AVTimeRange startTime](self, "startTime"), v9 <= v10))
  {
    v25 = self;
  }
  else
  {
    -[AVTimeRange startTime](self, "startTime");
    v12 = v11;
    objc_msgSend(v4, "startTime");
    v14 = v13;
    -[AVTimeRange startTime](self, "startTime");
    v16 = v15;
    if (v12 > v14)
    {
      objc_msgSend(v4, "endTime");
      if (v16 < v17)
        v16 = v17;
    }
    -[AVTimeRange endTime](self, "endTime");
    v19 = v18;
    objc_msgSend(v4, "endTime");
    v21 = v20;
    -[AVTimeRange endTime](self, "endTime");
    v23 = v22;
    if (v19 < v21)
    {
      objc_msgSend(v4, "startTime");
      if (v23 >= v24)
        v23 = v24;
    }
    if (v23 <= v16)
    {
      +[AVTimeRange timeRangeZero](AVTimeRange, "timeRangeZero");
      v25 = (AVTimeRange *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = -[AVTimeRange initWithStartTime:endTime:]([AVTimeRange alloc], "initWithStartTime:endTime:", v16, v23);
    }
  }
  v26 = v25;

  return v26;
}

- (id)timeRangeByAddingTimeInterval:(double)a3 shiftingDates:(BOOL)a4
{
  _BOOL4 v4;
  AVTimeRange *v7;
  double v8;
  double v9;
  double v10;
  AVTimeRange *v11;
  AVTimeRange *v12;
  double v13;
  double v14;
  void *v15;

  v4 = a4;
  v7 = [AVTimeRange alloc];
  -[AVTimeRange startTime](self, "startTime");
  v9 = v8 + a3;
  -[AVTimeRange duration](self, "duration");
  v11 = -[AVTimeRange initWithStartTime:duration:](v7, "initWithStartTime:duration:", v9, v10);
  v12 = v11;
  if (v4)
    v11 = self;
  -[AVTimeRange startTime](v11, "startTime");
  v14 = v13;
  -[AVTimeRange startDate](self, "startDate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimeRange setMapTime:toDate:](v12, "setMapTime:toDate:", v15, v14);

  return v12;
}

- (id)timeRangeByAddingTimeInterval:(double)a3
{
  return -[AVTimeRange timeRangeByAddingTimeInterval:shiftingDates:](self, "timeRangeByAddingTimeInterval:shiftingDates:", 0, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  AVTimeRange *v4;
  double v5;
  double v6;
  double v7;

  v4 = +[AVTimeRange allocWithZone:](AVTimeRange, "allocWithZone:", a3);
  -[AVTimeRange startTime](self, "startTime");
  v6 = v5;
  -[AVTimeRange duration](self, "duration");
  return -[AVTimeRange initWithStartTime:duration:](v4, "initWithStartTime:duration:", v6, v7);
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;

  -[AVTimeRange startTime](self, "startTime");
  v4 = vcvtd_n_u64_f64(v3, 0x10uLL);
  -[AVTimeRange duration](self, "duration");
  return vcvtd_n_u64_f64(v5, 2uLL) ^ v4;
}

- (BOOL)isEqualToTimeRange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  char v15;
  char v16;
  void *v17;
  void *v18;

  v4 = a3;
  if (!v4)
    goto LABEL_11;
  -[AVTimeRange startDate](self, "startDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 == 0;

  }
  else
  {
    v7 = 1;
  }

  -[AVTimeRange startTime](self, "startTime");
  v9 = v8;
  objc_msgSend(v4, "startTime");
  if (vabdd_f64(v9, v10) < 0.0000001)
  {
    -[AVTimeRange duration](self, "duration");
    v12 = v11;
    objc_msgSend(v4, "duration");
    v14 = vabdd_f64(v12, v13);
    v15 = v14 < 0.0000001;
    v16 = v14 >= 0.0000001 || v7;
    if ((v16 & 1) == 0)
    {
      -[AVTimeRange startDate](self, "startDate");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "startDate");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v17, "isEqualToDate:", v18);

    }
  }
  else
  {
LABEL_11:
    v15 = 0;
  }

  return v15;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = -[AVTimeRange isEqualToTimeRange:](self, "isEqualToTimeRange:", v4);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AVTimeRange;
    v5 = -[AVTimeRange isEqual:](&v8, sel_isEqual_, v4);
  }
  v6 = v5;

  return v6;
}

- (int64_t)compare:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;

  v4 = a3;
  -[AVTimeRange startTime](self, "startTime");
  v6 = v5;
  objc_msgSend(v4, "startTime");
  if (vabdd_f64(v6, v7) <= 0.0000001)
  {
    -[AVTimeRange duration](self, "duration");
    v12 = v11;
    objc_msgSend(v4, "duration");
    if (vabdd_f64(v12, v13) <= 0.0000001)
    {
      v15 = 0;
      goto LABEL_9;
    }
    -[AVTimeRange duration](self, "duration");
    v9 = v14;
    objc_msgSend(v4, "duration");
  }
  else
  {
    -[AVTimeRange startTime](self, "startTime");
    v9 = v8;
    objc_msgSend(v4, "startTime");
  }
  if (v9 >= v10)
    v15 = 1;
  else
    v15 = -1;
LABEL_9:

  return v15;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = objc_alloc_init(MEMORY[0x1E0C8B3A8]);
  objc_msgSend(v3, "setStyle:", 1);
  objc_msgSend(v3, "setFormatTemplate:", 60.0);
  v4 = (void *)MEMORY[0x1E0CB3940];
  -[AVTimeRange startTime](self, "startTime");
  objc_msgSend(v3, "stringFromSeconds:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVTimeRange endTime](self, "endTime");
  objc_msgSend(v3, "stringFromSeconds:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("[%@...%@]"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[AVTimeRange startDate](self, "startDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v9, "setDateStyle:", 0);
    objc_msgSend(v9, "setTimeStyle:", 2);
    -[AVTimeRange duration](self, "duration");
    objc_msgSend(v8, "dateByAddingTimeInterval:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(" (-> [%@...%@])"), v11, v12);
    v13 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = v7;
  }

  return v13;
}

- (double)startTime
{
  return self->_startTime;
}

- (double)duration
{
  return self->_duration;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

+ (id)timeRangeZero
{
  if (timeRangeZero_onceToken != -1)
    dispatch_once(&timeRangeZero_onceToken, &__block_literal_global_21948);
  return (id)timeRangeZero_timeRangeZero;
}

void __28__AVTimeRange_timeRangeZero__block_invoke()
{
  AVTimeRange *v0;
  void *v1;

  v0 = -[AVTimeRange initWithStartTime:duration:]([AVTimeRange alloc], "initWithStartTime:duration:", 0.0, 0.0);
  v1 = (void *)timeRangeZero_timeRangeZero;
  timeRangeZero_timeRangeZero = (uint64_t)v0;

}

@end
