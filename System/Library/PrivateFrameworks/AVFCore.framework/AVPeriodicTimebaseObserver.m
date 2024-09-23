@implementation AVPeriodicTimebaseObserver

- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 queue:(id)a5 block:(id)a6
{
  AVPeriodicTimebaseObserver *v10;
  AVPeriodicTimebaseObserver *v11;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  int64_t var3;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVPeriodicTimebaseObserver;
  v10 = -[AVTimebaseObserver initWithTimebase:queue:](&v17, sel_initWithTimebase_queue_, a3, a5);
  v11 = v10;
  if (v10)
  {
    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v13 = *MEMORY[0x1E0CA2E68];
    v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
    -[AVPeriodicTimebaseObserver initGutsWithTimebase:interval:offset:queue:block:](v10, "initGutsWithTimebase:interval:offset:queue:block:", a3, &v15, &v13, a5, a6);
  }
  return v11;
}

- (AVPeriodicTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7
{
  AVPeriodicTimebaseObserver *v12;
  AVPeriodicTimebaseObserver *v13;
  __int128 v15;
  int64_t v16;
  __int128 v17;
  int64_t var3;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)AVPeriodicTimebaseObserver;
  v12 = -[AVTimebaseObserver initWithTimebase:queue:](&v19, sel_initWithTimebase_queue_, a3, a6);
  v13 = v12;
  if (v12)
  {
    v17 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v15 = *(_OWORD *)&a5->var0;
    v16 = a5->var3;
    -[AVPeriodicTimebaseObserver initGutsWithTimebase:interval:offset:queue:block:](v12, "initGutsWithTimebase:interval:offset:queue:block:", a3, &v17, &v15, a6, a7);
  }
  return v13;
}

- (void)initGutsWithTimebase:(OpaqueCMTimebase *)a3 interval:(id *)a4 offset:(id *)a5 queue:(id)a6 block:(id)a7
{
  uint64_t v12;
  NSObject *timerQueue;
  CMTimeEpoch v14;
  NSObject *v15;
  int64_t var3;
  int64_t v17;
  NSObject *v18;
  AVPeriodicTimebaseObserver *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  AVPeriodicTimebaseObserver *v28;
  AVPeriodicTimebaseObserver *v29;
  void *v30;
  __int128 v31;
  _QWORD v32[5];
  _QWORD v33[5];
  _QWORD v34[5];
  CMTime time2;
  CMTime time1;
  _QWORD block[7];

  v12 = MEMORY[0x1E0C809B0];
  if ((a4->var2 & 0x1D) != 1)
  {
    timerQueue = self->super._timerQueue;
    if (timerQueue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke;
      block[3] = &unk_1E302FA10;
      block[4] = self;
      dispatch_async(timerQueue, block);
    }
    else
    {
      -[AVTimebaseObserver invalidate](self, "invalidate", a3);
    }
    if ((a4->var2 & 0x1D) != 1)
    {
      v19 = self;
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = "((Boolean)(((interval).flags & (kCMTimeFlags_Valid | kCMTimeFlags_ImpliedValueFlagsMask)) == kCMTimeFlags_Valid))";
      goto LABEL_19;
    }
  }
  time1 = (CMTime)*a4;
  v31 = *MEMORY[0x1E0CA2E68];
  *(_OWORD *)&time2.value = *MEMORY[0x1E0CA2E68];
  v14 = *(_QWORD *)(MEMORY[0x1E0CA2E68] + 16);
  time2.epoch = v14;
  if (CMTimeCompare(&time1, &time2) <= 0)
  {
    v15 = self->super._timerQueue;
    if (v15)
    {
      v34[0] = v12;
      v34[1] = 3221225472;
      v34[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_2;
      v34[3] = &unk_1E302FA10;
      v34[4] = self;
      dispatch_async(v15, v34);
    }
    else
    {
      -[AVTimebaseObserver invalidate](self, "invalidate");
    }
    time1 = (CMTime)*a4;
    *(_OWORD *)&time2.value = v31;
    time2.epoch = v14;
    if (CMTimeCompare(&time1, &time2) <= 0)
    {
      v29 = self;
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v27 = "((Boolean)(CMTimeCompare(interval, kCMTimeZero) > 0))";
      goto LABEL_19;
    }
  }
  if (!a7)
  {
    v18 = self->super._timerQueue;
    if (v18)
    {
      v33[0] = v12;
      v33[1] = 3221225472;
      v33[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_3;
      v33[3] = &unk_1E302FA10;
      v33[4] = self;
      dispatch_async(v18, v33);
    }
    else
    {
      -[AVTimebaseObserver invalidate](self, "invalidate");
    }
    v28 = self;
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v27 = "block != ((void *)0)";
LABEL_19:
    v30 = (void *)objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v20, v21, v22, v23, v24, (uint64_t)v27), 0);
    objc_exception_throw(v30);
  }
  *(_QWORD *)&self->_sequenceNum = objc_msgSend(a7, "copy");
  var3 = a4->var3;
  *(_OWORD *)(&self->super._invalid + 4) = *(_OWORD *)&a4->var0;
  *(_QWORD *)&self->_intervalRequested.flags = var3;
  v17 = a5->var3;
  *(_OWORD *)((char *)&self->_lastStopTime.epoch + 4) = *(_OWORD *)&a5->var0;
  *(_QWORD *)&self->_nonPeriodicOffset.flags = v17;
  *(_QWORD *)&self->_lastPeriodicFireTime.flags = v14;
  *(_OWORD *)((char *)&self->_lastIntervalUsed.epoch + 4) = v31;
  v32[0] = v12;
  v32[1] = 3221225472;
  v32[2] = __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_4;
  v32[3] = &unk_1E302FA10;
  v32[4] = self;
  -[AVTimebaseObserver _finishInitializationWithTimerEventHandler:](self, "_finishInitializationWithTimerEventHandler:", v32);
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __79__AVPeriodicTimebaseObserver_initGutsWithTimebase_interval_offset_queue_block___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  __n128 v4;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(*(id *)(a1 + 32), "_fireBlockForTime:", &v4, AVTimebaseObserver_figTimebaseGetTime(&v4).n128_f64[0]);
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[4])
    objc_msgSend(v3, "_resetNextFireTime");
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVPeriodicTimebaseObserver;
  -[AVTimebaseObserver dealloc](&v3, sel_dealloc);
}

- (void)_fireBlockForTime:(id *)a3
{
  uint64_t v3;
  void (*v4)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *);
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  if (!self->super._invalid)
  {
    v3 = *(_QWORD *)&self->_sequenceNum;
    v4 = *(void (**)(uint64_t, $3CC8671D27C23BF42ADDB32F2B5E48AE *, $3CC8671D27C23BF42ADDB32F2B5E48AE *))(v3 + 16);
    v5 = *a3;
    v4(v3, &v5, a3);
  }
}

- (void)_effectiveRateChanged
{
  OpaqueCMTimebase *timebase;
  Float64 Rate;
  double currentRate;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double lastRate;
  __int128 v10;
  __n128 v11;
  uint64_t v12;
  __n128 v13;
  uint64_t v14;

  if (self->super._timerSource)
  {
    timebase = self->super._timebase;
    if (timebase)
    {
      Rate = CMTimebaseGetRate(timebase);
      currentRate = self->super._currentRate;
      if (Rate != currentRate)
      {
        self->super._lastRate = currentRate;
        self->super._currentRate = Rate;
        v6 = MEMORY[0x1E0CA2E18];
        v10 = *MEMORY[0x1E0CA2E18];
        *(_OWORD *)((char *)&self->_intervalRequested.epoch + 4) = *MEMORY[0x1E0CA2E18];
        v7 = *(_QWORD *)(v6 + 16);
        *(_QWORD *)&self->_lastIntervalUsed.flags = v7;
        v13 = 0uLL;
        v14 = 0;
        AVTimebaseObserver_figTimebaseGetTime(&v13);
        if (self->super._currentRate == 0.0)
        {
          *(__n128 *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = v13;
          *(_QWORD *)&self->_lastStopTime.flags = v14;
          v8 = (void *)MEMORY[0x1940343FC]();
          v11 = v13;
          v12 = v14;
          -[AVPeriodicTimebaseObserver _fireBlockForTime:](self, "_fireBlockForTime:", &v11);
        }
        else
        {
          lastRate = self->super._lastRate;
          if (lastRate != 0.0)
          {
            -[AVPeriodicTimebaseObserver _resetNextFireTime](self, "_resetNextFireTime", lastRate, *(double *)&v10);
            return;
          }
          *(_OWORD *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = v10;
          *(_QWORD *)&self->_lastStopTime.flags = v7;
          v8 = (void *)MEMORY[0x1940343FC]();
          v11 = v13;
          v12 = v14;
          -[AVPeriodicTimebaseObserver _fireBlockForTime:](self, "_fireBlockForTime:", &v11);
          if (self->super._timebase)
          {
            *(__n128 *)((char *)&self->_lastPeriodicFireTime.epoch + 4) = v13;
            *(_QWORD *)&self->_lastNonperiodicFireTime.flags = v14;
            -[AVPeriodicTimebaseObserver _resetNextFireTime](self, "_resetNextFireTime");
          }
        }
        objc_autoreleasePoolPop(v8);
      }
    }
  }
}

- (void)_resetNextFireTime
{
  CMTimeValue *v3;
  int *p_timescale;
  double v5;
  CMTimeValue value;
  int32_t value_high;
  int epoch_high;
  _OWORD *v9;
  CMTimeScale timescale;
  CMTimeFlags flags;
  CMTimeValue v12;
  CMTimeEpoch v13;
  uint64_t v14;
  CMTimeFlags v15;
  CMTimeEpoch v16;
  double currentRate;
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;
  CMTime v20;
  CMTime lhs;
  CMTime time2;
  CMTime time;
  __n128 v24;
  CMTimeEpoch v25;
  int64_t v26;
  CMTimeScale v27;
  uint64_t v28;
  int epoch;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v24 = 0uLL;
  v25 = 0;
  AVTimebaseObserver_figTimebaseGetTime(&v24);
  v3 = (int64_t *)((char *)&self->_intervalRequested.epoch + 4);
  p_timescale = &self->_lastIntervalUsed.timescale;
  if ((self->_lastIntervalUsed.timescale & 1) != 0)
  {
    value = *v3;
    value_high = HIDWORD(self->_lastIntervalUsed.value);
    v28 = *(_QWORD *)p_timescale;
    epoch = self->_lastIntervalUsed.epoch;
  }
  else
  {
    v5 = fabs(self->super._currentRate);
    time = *(CMTime *)(&self->super._invalid + 4);
    if (CMTimeGetSeconds(&time) / v5 >= 0.005)
    {
      value = *(_QWORD *)(&self->super._invalid + 4);
      value_high = HIDWORD(self->_intervalRequested.value);
      v28 = *(_QWORD *)&self->_intervalRequested.timescale;
      epoch_high = self->_intervalRequested.epoch;
    }
    else
    {
      CMTimeMakeWithSeconds(&time, v5 * 0.005, HIDWORD(self->_intervalRequested.value));
      value = time.value;
      value_high = time.timescale;
      v28 = *(_QWORD *)&time.flags;
      epoch_high = HIDWORD(time.epoch);
    }
    epoch = epoch_high;
    *v3 = value;
    HIDWORD(self->_lastIntervalUsed.value) = value_high;
    *(_QWORD *)p_timescale = v28;
    LODWORD(self->_lastIntervalUsed.epoch) = epoch;
  }
  v9 = (_OWORD *)((char *)&self->_lastPeriodicFireTime.epoch + 4);
  if ((self->_lastNonperiodicFireTime.timescale & 0x1D) == 1)
  {
    memset(&time, 0, sizeof(time));
    *(_OWORD *)&time2.value = *v9;
    time2.epoch = *(_QWORD *)&self->_lastNonperiodicFireTime.flags;
    CMTimeConvertScale(&time, &time2, value_high, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    CMTimeMake(&time2, time.value / value * value, value_high);
    timescale = time2.timescale;
    flags = time2.flags;
    v27 = time2.timescale;
    v12 = time2.value;
    v26 = time2.value;
    v13 = time2.epoch;
    v14 = MEMORY[0x1E0CA2E18];
    *v9 = *MEMORY[0x1E0CA2E18];
    *(_QWORD *)&self->_lastNonperiodicFireTime.flags = *(_QWORD *)(v14 + 16);
    lhs.timescale = timescale;
    lhs.flags = flags;
    lhs.epoch = v13;
    v20 = *(CMTime *)((char *)&self->_lastStopTime.epoch + 4);
    lhs.value = v12;
    CMTimeAdd(&time2, &lhs, &v20);
    v26 = time2.value;
    v15 = time2.flags;
    v27 = time2.timescale;
    v16 = time2.epoch;
  }
  else
  {
    v26 = *(int64_t *)((char *)&self->_lastIntervalUsed.epoch + 4);
    v15 = self->_lastPeriodicFireTime.timescale;
    v27 = HIDWORD(self->_lastPeriodicFireTime.value);
    v16 = *(_QWORD *)&self->_lastPeriodicFireTime.flags;
  }
  currentRate = self->super._currentRate;
  if (currentRate <= 0.0)
  {
    if (currentRate < 0.0)
    {
      while (1)
      {
        time.value = v26;
        time.timescale = v27;
        time.flags = v15;
        time.epoch = v16;
        *(__n128 *)&time2.value = v24;
        time2.epoch = v25;
        if (CMTimeCompare(&time, &time2) < 0 || (v15 & 0x1D) != 1)
          break;
        time2.value = v26;
        time2.timescale = v27;
        time2.flags = v15;
        time2.epoch = v16;
        lhs.value = value;
        lhs.timescale = value_high;
        *(_QWORD *)&lhs.flags = v28;
        HIDWORD(lhs.epoch) = epoch;
        CMTimeSubtract(&time, &time2, &lhs);
        v26 = time.value;
        v15 = time.flags;
        v27 = time.timescale;
        v16 = time.epoch;
      }
    }
  }
  else
  {
    while (1)
    {
      time.value = v26;
      time.timescale = v27;
      time.flags = v15;
      time.epoch = v16;
      *(__n128 *)&time2.value = v24;
      time2.epoch = v25;
      if (CMTimeCompare(&time, &time2) > 0 || (v15 & 0x1D) != 1)
        break;
      time2.value = v26;
      time2.timescale = v27;
      time2.flags = v15;
      time2.epoch = v16;
      lhs.value = value;
      lhs.timescale = value_high;
      *(_QWORD *)&lhs.flags = v28;
      HIDWORD(lhs.epoch) = epoch;
      CMTimeAdd(&time, &time2, &lhs);
      v26 = time.value;
      v15 = time.flags;
      v27 = time.timescale;
      v16 = time.epoch;
    }
  }
  timebase = self->super._timebase;
  if (timebase)
  {
    timerSource = self->super._timerSource;
    if (timerSource)
    {
      time.value = v26;
      time.timescale = v27;
      time.flags = v15;
      time.epoch = v16;
      CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &time, 0);
    }
  }
  *(int64_t *)((char *)&self->_lastIntervalUsed.epoch + 4) = v26;
  HIDWORD(self->_lastPeriodicFireTime.value) = v27;
  self->_lastPeriodicFireTime.timescale = v15;
  *(_QWORD *)&self->_lastPeriodicFireTime.flags = v16;
}

- (void)_handleTimeDiscontinuity
{
  void *v3;
  _OWORD *v4;
  CMTime v5;
  CMTime time1;
  __n128 v7;
  CMTimeEpoch v8;

  if (self->super._timerSource && self->super._timebase)
  {
    v3 = (void *)MEMORY[0x1940343FC]();
    v7 = 0uLL;
    v8 = 0;
    AVTimebaseObserver_figTimebaseGetTime(&v7);
    *(__n128 *)&time1.value = v7;
    time1.epoch = v8;
    v5 = *(CMTime *)((char *)&self->_lastNonperiodicFireTime.epoch + 4);
    if (CMTimeCompare(&time1, &v5))
    {
      *(__n128 *)&time1.value = v7;
      time1.epoch = v8;
      -[AVPeriodicTimebaseObserver _fireBlockForTime:](self, "_fireBlockForTime:", &time1);
      v4 = (_OWORD *)MEMORY[0x1E0CA2E18];
      *(_QWORD *)&self->_lastStopTime.flags = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      *(_OWORD *)((char *)&self->_lastNonperiodicFireTime.epoch + 4) = *v4;
      if (self->super._timebase)
      {
        if (self->super._currentRate != 0.0)
        {
          *(__n128 *)((char *)&self->_lastPeriodicFireTime.epoch + 4) = v7;
          *(_QWORD *)&self->_lastNonperiodicFireTime.flags = v8;
          -[AVPeriodicTimebaseObserver _resetNextFireTime](self, "_resetNextFireTime");
        }
      }
    }
    objc_autoreleasePoolPop(v3);
  }
}

@end
