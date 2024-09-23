@implementation AVOnceTimebaseObserver

- (AVOnceTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 fireTime:(id *)a4 queue:(id)a5 block:(id)a6
{
  char *v9;
  AVOnceTimebaseObserver *v10;
  int64_t var3;
  NSObject *v13;
  AVOnceTimebaseObserver *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[5];
  _QWORD block[5];
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)AVOnceTimebaseObserver;
  v9 = -[AVTimebaseObserver initWithTimebase:queue:](&v23, sel_initWithTimebase_queue_, a3, a5);
  v10 = (AVOnceTimebaseObserver *)v9;
  if (v9)
  {
    if (!a6)
    {
      v13 = *((_QWORD *)v9 + 1);
      if (v13)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke;
        block[3] = &unk_1E302FA10;
        block[4] = v10;
        dispatch_async(v13, block);
      }
      else
      {
        -[AVOnceTimebaseObserver invalidate](v10, "invalidate");
      }
      v14 = v10;
      v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v10, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v15, v16, v17, v18, v19, (uint64_t)"block"), 0);
      objc_exception_throw(v20);
    }
    var3 = a4->var3;
    *(_OWORD *)(v9 + 68) = *(_OWORD *)&a4->var0;
    *(_QWORD *)(v9 + 84) = var3;
    *((_QWORD *)v9 + 12) = objc_msgSend(a6, "copy");
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke_2;
    v21[3] = &unk_1E302FA10;
    v21[4] = v10;
    -[AVTimebaseObserver _finishInitializationWithTimerEventHandler:](v10, "_finishInitializationWithTimerEventHandler:", v21);
    -[AVOnceTimebaseObserver _resetNextFireTime](v10, "_resetNextFireTime");
  }
  return v10;
}

uint64_t __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

uint64_t __64__AVOnceTimebaseObserver_initWithTimebase_fireTime_queue_block___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_fireBlock");
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)AVOnceTimebaseObserver;
  -[AVTimebaseObserver dealloc](&v2, sel_dealloc);
}

- (void)invalidate
{
  objc_super v3;

  self->_block = 0;
  v3.receiver = self;
  v3.super_class = (Class)AVOnceTimebaseObserver;
  -[AVTimebaseObserver invalidate](&v3, sel_invalidate);
}

- (void)_fireBlock
{
  void *v3;

  if (!self->super._invalid && !self->_didFire)
  {
    self->_didFire = 1;
    v3 = (void *)MEMORY[0x1940343FC]();
    (*((void (**)(void))self->_block + 2))();
    objc_autoreleasePoolPop(v3);
  }
}

- (BOOL)didFire
{
  return self->_didFire;
}

- (void)_resetNextFireTime
{
  NSObject *timerQueue;
  _QWORD block[5];

  if (!self->super._invalid && !self->_didFire)
  {
    timerQueue = self->super._timerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __44__AVOnceTimebaseObserver__resetNextFireTime__block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
}

void __44__AVOnceTimebaseObserver__resetNextFireTime__block_invoke(uint64_t a1)
{
  double v2;
  uint64_t v3;
  __int128 *v4;
  __int128 v5;
  __int128 v6;
  __int128 *v7;
  OpaqueCMTimebase *v8;
  NSObject *v9;
  __int128 v10;
  CMTime v11;
  CMTime time1;
  __n128 v13;
  CMTimeEpoch v14;

  v13 = 0uLL;
  v14 = 0;
  *(_QWORD *)&v2 = AVTimebaseObserver_figTimebaseGetTime(&v13).n128_u64[0];
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v3 + 64) && !*(_BYTE *)(v3 + 104))
  {
    v4 = (__int128 *)(v3 + 68);
    if ((*(_BYTE *)(v3 + 80) & 1) == 0)
    {
LABEL_4:
      objc_msgSend(*(id *)(a1 + 32), "_fireBlock", v2);
      return;
    }
    if (*(double *)(v3 + 56) >= 0.0)
    {
      v6 = *v4;
      time1.epoch = *(_QWORD *)(v3 + 84);
      *(_OWORD *)&time1.value = v6;
      *(__n128 *)&v11.value = v13;
      v11.epoch = v14;
      if (CMTimeCompare(&time1, &v11) < 1)
        goto LABEL_4;
    }
    else
    {
      *(__n128 *)&time1.value = v13;
      time1.epoch = v14;
      v5 = *v4;
      v11.epoch = *(_QWORD *)(v3 + 84);
      *(_OWORD *)&v11.value = v5;
      if (CMTimeCompare(&time1, &v11) <= 0)
        goto LABEL_4;
    }
    v7 = *(__int128 **)(a1 + 32);
    v9 = *((_QWORD *)v7 + 3);
    v8 = (OpaqueCMTimebase *)*((_QWORD *)v7 + 4);
    v7 = (__int128 *)((char *)v7 + 68);
    v10 = *v7;
    time1.epoch = *((_QWORD *)v7 + 2);
    *(_OWORD *)&time1.value = v10;
    CMTimebaseSetTimerDispatchSourceNextFireTime(v8, v9, &time1, 0);
  }
}

@end
