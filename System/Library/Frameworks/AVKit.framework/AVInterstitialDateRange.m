@implementation AVInterstitialDateRange

- (AVInterstitialDateRange)initWithTimeRange:(id *)a3
{
  __int128 v3;
  _OWORD v5[3];

  v3 = *(_OWORD *)&a3->var0.var3;
  v5[0] = *(_OWORD *)&a3->var0.var0;
  v5[1] = v3;
  v5[2] = *(_OWORD *)&a3->var1.var1;
  return (AVInterstitialDateRange *)-[AVInterstitialDateRange _initWithTimeRange:](self, "_initWithTimeRange:", v5);
}

- (id)_initWithTimeRange:(id *)a3
{
  void *v4;
  AVInterstitialDateRange *v5;
  CMTime v7;
  CMTime time1;

  time1 = (CMTime)a3->var1;
  v7 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  if (CMTimeCompare(&time1, &v7) >= 1)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("cannot specify duration of AVInterstitialDateRange except by providing dates"));
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[AVInterstitialDateRange initWithStart:end:](self, "initWithStart:end:", v4, 0);

  return v5;
}

- (AVInterstitialDateRange)initWithStart:(id)a3 end:(id)a4
{
  id v7;
  id v8;
  void *v9;
  CMTime *v10;
  Float64 v11;
  CMTime *p_duration;
  id *v13;
  id *v14;
  __int128 v15;
  __int128 v16;
  CMTime v18;
  CMTimeRange start;
  objc_super v20;
  CMTime duration;
  CMTime v22;
  CMTimeRange v23;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  memset(&v23, 0, sizeof(v23));
  v10 = (CMTime *)MEMORY[0x1E0CA2E10];
  if (v8)
  {
    objc_msgSend(v8, "timeIntervalSinceDate:", v7);
    CMTimeMakeWithSeconds(&v22, v11, 1000);
    *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
    start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    p_duration = &v22;
  }
  else
  {
    *(_OWORD *)&start.start.value = *MEMORY[0x1E0CA2E68];
    start.start.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E10];
    p_duration = &duration;
  }
  CMTimeRangeMake(&v23, &start.start, p_duration);
  v20.receiver = self;
  v20.super_class = (Class)AVInterstitialDateRange;
  start = v23;
  v13 = -[AVInterstitialTimeRange _initWithTimeRange:](&v20, sel__initWithTimeRange_, &start);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong(v13 + 20, a3);
    objc_storeStrong(v14 + 21, a4);
    duration = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    v18 = *v10;
    CMTimeRangeMake(&start, &duration, &v18);
    v15 = *(_OWORD *)&start.start.value;
    v16 = *(_OWORD *)&start.duration.timescale;
    *((_OWORD *)v14 + 8) = *(_OWORD *)&start.start.epoch;
    *((_OWORD *)v14 + 9) = v16;
    *((_OWORD *)v14 + 7) = v15;
    objc_msgSend(v14, "_setCollapsedInTimeLine:", 0);
  }

  return (AVInterstitialDateRange *)v14;
}

- (void)setEndDate:(id)a3
{
  id v5;
  double v6;
  id v7;

  v5 = a3;
  if (v5)
  {
    if (!self->_endDate)
    {
      v7 = v5;
      objc_msgSend(v5, "timeIntervalSinceDate:", self->_startDate);
      v5 = v7;
      if (v6 > 0.0)
      {
        objc_storeStrong((id *)&self->_endDate, a3);
        objc_msgSend(v7, "timeIntervalSinceDate:", self->_startDate);
        -[AVInterstitialTimeRange _setDurationTimeInterval:](self, "_setDurationTimeInterval:");
        v5 = v7;
      }
    }
  }

}

- (void)_updateMappedStartTime
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  double Seconds;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;
  _BOOL8 v15;
  char v16;
  char v17;
  CMTime v18;
  CMTime time;

  -[AVInterstitialTimeRange playerInterstitialEvent](self, "playerInterstitialEvent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "status") == 1)
  {
    objc_msgSend(v4, "currentDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(v4, "currentEstimatedDate");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (v4)
      objc_msgSend(v4, "currentTime");
    else
      memset(&time, 0, sizeof(time));
    Seconds = CMTimeGetSeconds(&time);
    if (v8)
    {
      v10 = Seconds;
      -[NSDate timeIntervalSinceReferenceDate](self->_startDate, "timeIntervalSinceReferenceDate");
      v12 = v11;
      objc_msgSend(v8, "timeIntervalSinceReferenceDate");
      CMTimeMakeWithSeconds(&v18, v10 + v12 - v13, 1000);
      self->_mappedTimeRange.start = ($95D729B680665BEAEFA1D6FCA8238556)v18;
      v14 = MEMORY[0x1E0CA2E68];
      *(_OWORD *)&self->_mappedTimeRange.duration.value = *MEMORY[0x1E0CA2E68];
      self->_mappedTimeRange.duration.epoch = *(_QWORD *)(v14 + 16);
      if (v4)
      {
        objc_msgSend(v4, "duration");
        if ((v17 & 1) != 0)
        {
          objc_msgSend(v4, "duration");
          v15 = (v16 & 0x10) == 0;
        }
        else
        {
          v15 = 1;
        }
      }
      else
      {
        v15 = 1;
      }
      -[AVInterstitialTimeRange _setCollapsedInTimeLine:](self, "_setCollapsedInTimeLine:", v15);
    }

  }
}

- (void)_setPlayerInterstitialEvent:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)AVInterstitialDateRange;
  -[AVInterstitialTimeRange _setPlayerInterstitialEvent:](&v4, sel__setPlayerInterstitialEvent_, a3);
  -[AVInterstitialDateRange _updateMappedStartTime](self, "_updateMappedStartTime");
}

- ($008D8879F9973785877FFE498A5CE36E)timeRange
{
  $396D754D935D9DF8FBECB06CD3200188 *p_mappedTimeRange;
  $008D8879F9973785877FFE498A5CE36E *result;
  objc_super v7;

  p_mappedTimeRange = &self->_mappedTimeRange;
  if ((self->_mappedTimeRange.start.flags & 1) == 0)
    -[AVInterstitialDateRange _updateMappedStartTime](self, "_updateMappedStartTime");
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  v7.receiver = self;
  v7.super_class = (Class)AVInterstitialDateRange;
  result = ($008D8879F9973785877FFE498A5CE36E *)-[$008D8879F9973785877FFE498A5CE36E timeRange](&v7, sel_timeRange);
  if ((p_mappedTimeRange->start.flags & 0x1D) == 1)
  {
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&p_mappedTimeRange->start.value;
    retstr->var0.var3 = p_mappedTimeRange->start.epoch;
  }
  return result;
}

- (BOOL)isEqualToInterstitialTimeRange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;
  objc_super v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[AVInterstitialDateRange startDate](self, "startDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "startDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToDate:", v7))
    {
      -[AVInterstitialDateRange endDate](self, "endDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "endDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDate:", v9))
      {
        v12.receiver = self;
        v12.super_class = (Class)AVInterstitialDateRange;
        v10 = -[AVInterstitialTimeRange isEqualToInterstitialTimeRange:](&v12, sel_isEqualToInterstitialTimeRange_, v5);
      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[AVInterstitialDateRange startDate](self, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVInterstitialDateRange endDate](self, "endDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@...%@]"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 160, 1);
}

- (NSDate)endDate
{
  return (NSDate *)objc_getProperty(self, a2, 168, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDate, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end
