@implementation AVOccasionalTimebaseObserver

- (AVOccasionalTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 times:(id)a4 queue:(id)a5 block:(id)a6
{
  AVOccasionalTimebaseObserver *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *timerQueue;
  NSObject *v14;
  AVOccasionalTimebaseObserver *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  AVOccasionalTimebaseObserver *v24;
  void *v25;
  _QWORD v26[5];
  _QWORD v27[5];
  _QWORD block[5];
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)AVOccasionalTimebaseObserver;
  v9 = -[AVTimebaseObserver initWithTimebase:queue:](&v29, sel_initWithTimebase_queue_, a3, a5);
  if (v9)
  {
    v10 = objc_msgSend(a4, "count");
    v11 = MEMORY[0x1E0C809B0];
    if (v10)
      goto LABEL_7;
    timerQueue = v9->super._timerQueue;
    if (timerQueue)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke;
      block[3] = &unk_1E302FA10;
      block[4] = v9;
      dispatch_async(timerQueue, block);
    }
    else
    {
      -[AVTimebaseObserver invalidate](v9, "invalidate");
    }
    if (objc_msgSend(a4, "count"))
    {
LABEL_7:
      if (a6)
      {
        v9->_times = (NSArray *)(id)objc_msgSend(a4, "sortedArrayUsingComparator:", &__block_literal_global_10);
        v9->_block = (id)objc_msgSend(a6, "copy");
        v26[0] = v11;
        v26[1] = 3221225472;
        v26[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_4;
        v26[3] = &unk_1E302FA10;
        v26[4] = v9;
        -[AVTimebaseObserver _finishInitializationWithTimerEventHandler:](v9, "_finishInitializationWithTimerEventHandler:", v26);
        return v9;
      }
      v14 = v9->super._timerQueue;
      if (v14)
      {
        v27[0] = v11;
        v27[1] = 3221225472;
        v27[2] = __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_2;
        v27[3] = &unk_1E302FA10;
        v27[4] = v9;
        dispatch_async(v14, v27);
      }
      else
      {
        -[AVTimebaseObserver invalidate](v9, "invalidate");
      }
      v15 = v9;
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = "block != ((void *)0)";
    }
    else
    {
      v24 = v9;
      v21 = (void *)MEMORY[0x1E0C99DA0];
      v22 = *MEMORY[0x1E0C99778];
      v23 = "[times count] > 0";
    }
    v25 = (void *)objc_msgSend(v21, "exceptionWithName:reason:userInfo:", v22, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v9, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v16, v17, v18, v19, v20, (uint64_t)v23), 0);
    objc_exception_throw(v25);
  }
  return v9;
}

- (void)_resetNextFireTime
{
  uint64_t v3;
  double currentRate;
  CMTimeFlags flags;
  CMTimeEpoch epoch;
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;
  __n128 v9;
  uint64_t v10;
  CMTime fireTime;
  __n128 v12;
  uint64_t v13;
  CMTimeValue value;
  CMTimeScale timescale;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = MEMORY[0x1E0CA2E18];
  value = *MEMORY[0x1E0CA2E18];
  timescale = *(_DWORD *)(MEMORY[0x1E0CA2E18] + 8);
  v12 = 0uLL;
  v13 = 0;
  AVTimebaseObserver_figTimebaseGetTime(&v12);
  currentRate = self->super._currentRate;
  if (currentRate <= 0.0)
  {
    flags = *(_DWORD *)(v3 + 12);
    epoch = *(_QWORD *)(v3 + 16);
  }
  else
  {
    v9 = v12;
    v10 = v13;
    -[AVOccasionalTimebaseObserver _nextFiringTimeAfterTime:](self, "_nextFiringTimeAfterTime:", &v9);
    value = fireTime.value;
    flags = fireTime.flags;
    timescale = fireTime.timescale;
    epoch = fireTime.epoch;
    currentRate = self->super._currentRate;
  }
  if (currentRate < 0.0)
  {
    v9 = v12;
    v10 = v13;
    -[AVOccasionalTimebaseObserver _previousFiringTimeBeforeTime:](self, "_previousFiringTimeBeforeTime:", &v9);
    value = fireTime.value;
    flags = fireTime.flags;
    timescale = fireTime.timescale;
    epoch = fireTime.epoch;
  }
  if ((flags & 1) != 0)
  {
    timebase = self->super._timebase;
    if (timebase)
    {
      timerSource = self->super._timerSource;
      if (timerSource)
      {
        fireTime.value = value;
        fireTime.timescale = timescale;
        fireTime.flags = flags;
        fireTime.epoch = epoch;
        CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &fireTime, 0);
      }
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_nextFiringTimeAfterTime:(SEL)a3
{
  NSArray *times;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v8;
  _QWORD v9[4];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;

  times = self->_times;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__AVOccasionalTimebaseObserver__nextFiringTimeAfterTime___block_invoke;
  v9[3] = &__block_descriptor_56_e15_B32__0_8Q16_B24l;
  v10 = *a4;
  result = -[NSArray indexOfObjectPassingTest:](times, "indexOfObjectPassingTest:", v9);
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v8 + 16);
  }
  else
  {
    result = -[NSArray objectAtIndex:](self->_times, "objectAtIndex:", result);
    if (result)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE CMTimeValue](result, "CMTimeValue");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  return result;
}

BOOL __57__AVOccasionalTimebaseObserver__nextFiringTimeAfterTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  int32_t v6;
  CMTime v8;
  CMTime time1;
  CMTime v10;

  memset(&v10, 0, sizeof(v10));
  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  time1 = v10;
  v8 = *(CMTime *)(a1 + 32);
  v6 = CMTimeCompare(&time1, &v8);
  if (v6 >= 1)
    *a4 = 1;
  return v6 > 0;
}

- (void)_handleTimeDiscontinuity
{
  if (self->super._timerSource)
  {
    if (self->super._timebase)
      -[AVOccasionalTimebaseObserver _resetNextFireTime](self, "_resetNextFireTime");
  }
}

- (void)_effectiveRateChanged
{
  OpaqueCMTimebase *timebase;
  Float64 Rate;
  double currentRate;
  BOOL v6;

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
        v6 = Rate == 0.0 || self->super._timerSource == 0;
        if (!v6 && (currentRate == 0.0 || Rate > 0.0 == currentRate <= 0.0))
          -[AVOccasionalTimebaseObserver _resetNextFireTime](self, "_resetNextFireTime");
      }
    }
  }
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  CMTime v5;
  CMTime time1;

  if (!a2)
  {
    memset(&time1, 0, sizeof(time1));
    if (a3)
      goto LABEL_3;
LABEL_5:
    memset(&v5, 0, sizeof(v5));
    return CMTimeCompare(&time1, &v5);
  }
  objc_msgSend(a2, "CMTimeValue");
  if (!a3)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(a3, "CMTimeValue");
  return CMTimeCompare(&time1, &v5);
}

void __67__AVOccasionalTimebaseObserver_initWithTimebase_times_queue_block___block_invoke_4(uint64_t a1)
{
  void *v2;
  _QWORD *v3;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(*(id *)(a1 + 32), "_fireBlock");
  v3 = *(_QWORD **)(a1 + 32);
  if (v3[4])
    objc_msgSend(v3, "_resetNextFireTime");
  objc_autoreleasePoolPop(v2);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AVOccasionalTimebaseObserver;
  -[AVTimebaseObserver dealloc](&v3, sel_dealloc);
}

- (void)_fireBlock
{
  if (!self->super._invalid)
    (*((void (**)(void))self->_block + 2))();
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_previousFiringTimeBeforeTime:(SEL)a3
{
  NSUInteger v7;
  NSArray *times;
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  uint64_t v10;
  _QWORD v11[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v7 = -[NSArray count](self->_times, "count");
  times = self->_times;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __62__AVOccasionalTimebaseObserver__previousFiringTimeBeforeTime___block_invoke;
  v11[3] = &unk_1E3032530;
  v12 = *a4;
  v11[4] = self;
  v11[5] = v7;
  result = -[NSArray indexOfObjectPassingTest:](times, "indexOfObjectPassingTest:", v11);
  if (result == ($3CC8671D27C23BF42ADDB32F2B5E48AE *)0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = MEMORY[0x1E0CA2E18];
    *(_OWORD *)&retstr->var0 = *MEMORY[0x1E0CA2E18];
    retstr->var3 = *(_QWORD *)(v10 + 16);
  }
  else
  {
    result = -[NSArray objectAtIndex:](self->_times, "objectAtIndex:", result);
    if (result)
    {
      return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE CMTimeValue](result, "CMTimeValue");
    }
    else
    {
      retstr->var0 = 0;
      *(_QWORD *)&retstr->var1 = 0;
      retstr->var3 = 0;
    }
  }
  return result;
}

uint64_t __62__AVOccasionalTimebaseObserver__previousFiringTimeBeforeTime___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  void *v8;
  CMTime v9;
  CMTime time2;
  CMTime time1;
  CMTime v12;

  memset(&v12, 0, sizeof(v12));
  if (a2)
    objc_msgSend(a2, "CMTimeValue");
  time1 = v12;
  time2 = *(CMTime *)(a1 + 48);
  if ((CMTimeCompare(&time1, &time2) & 0x80000000) == 0)
    return 0;
  if (*(_QWORD *)(a1 + 40) > (unint64_t)(a3 + 1))
  {
    v8 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "objectAtIndex:");
    if (v8)
      objc_msgSend(v8, "CMTimeValue");
    else
      memset(&v9, 0, sizeof(v9));
    time1 = *(CMTime *)(a1 + 48);
    if (CMTimeCompare(&v9, &time1) < 0)
      return 0;
  }
  result = 1;
  *a4 = 1;
  return result;
}

@end
