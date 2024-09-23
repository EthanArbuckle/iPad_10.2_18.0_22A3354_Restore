@implementation AVSampleBufferRenderSynchronizer

- (AVSampleBufferRenderSynchronizer)init
{
  void *v3;
  id v4;
  AVSampleBufferRenderSynchronizer *v5;
  AVSampleBufferRenderSynchronizerInternal *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  AVSampleBufferRenderSynchronizerInternal *synchronizerInternal;
  AVSampleBufferRenderSynchronizerInternal *v12;
  CMTime v13;
  objc_super v14;
  uint64_t v15;

  AVTelemetryGenerateID();
  v3 = (void *)objc_msgSend((id)objc_opt_class(), "currentFigRenderSynchronizerFactory");
  v15 = 0;
  v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  v14.receiver = self;
  v14.super_class = (Class)AVSampleBufferRenderSynchronizer;
  v5 = -[AVSampleBufferRenderSynchronizer init](&v14, sel_init);
  if (v5)
  {
    v6 = objc_alloc_init(AVSampleBufferRenderSynchronizerInternal);
    v5->_synchronizerInternal = v6;
    if (!v6)
      goto LABEL_10;
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->rateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.ratequeue", v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->figSynchronizerAccessQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.synchronizeraccessqueue", v8);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5->_synchronizerInternal->rendererListQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avsamplebufferrendersynchronizer.rendererlistqueue", v9);
    v5->_synchronizerInternal->renderers = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v5->_synchronizerInternal->timedRenderRemovals = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    synchronizerInternal = v5->_synchronizerInternal;
    if (!synchronizerInternal->rateQueue)
      goto LABEL_10;
    if (synchronizerInternal->rendererListQueue
      && synchronizerInternal->figSynchronizerAccessQueue
      && synchronizerInternal->renderers
      && synchronizerInternal->timedRenderRemovals
      && (synchronizerInternal->rate = 0.0,
          (v5->_synchronizerInternal->figSynchronizer = (OpaqueFigSampleBufferRenderSynchronizer *)objc_msgSend(v3, "createRenderSynchronizerWithAllocator:options:error:", 0, 0, &v15)) != 0)&& !-[AVSampleBufferRenderSynchronizer _initializeTimebase](v5, "_initializeTimebase"))
    {
      v12 = v5->_synchronizerInternal;
      CMTimebaseGetTime(&v13, -[AVSampleBufferRenderSynchronizer timebase](v5, "timebase"));
      *(CMTime *)(&v12->rate + 1) = v13;
      v5->_synchronizerInternal->STSLabelSinks = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v5->_synchronizerInternal->weakObserver = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v5);
      objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", v5->_synchronizerInternal->weakObserver, avrendersynchronizer_timebaseRateChanged, *MEMORY[0x1E0CA2E78], v5->_synchronizerInternal->readOnlyTimebase, 0);
    }
    else
    {
LABEL_10:

      return 0;
    }
  }
  return v5;
}

- (int)_initializeTimebase
{
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  uint64_t (*v4)(OpaqueFigSampleBufferRenderSynchronizer *, CFTypeRef *);
  int result;
  int v6;
  CFTypeRef cf;

  cf = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  v4 = *(uint64_t (**)(OpaqueFigSampleBufferRenderSynchronizer *, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                        + 32);
  if (!v4)
    return -12782;
  result = v4(figSynchronizer, &cf);
  if (result)
  {
    v6 = result;
    if (cf)
      CFRelease(cf);
    return v6;
  }
  else
  {
    self->_synchronizerInternal->readOnlyTimebase = (OpaqueCMTimebase *)cf;
  }
  return result;
}

- (void)dealloc
{
  AVSampleBufferRenderSynchronizerInternal *synchronizerInternal;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  AVSampleBufferRenderSynchronizerInternal *v9;
  OpaqueCMTimebase *readOnlyTimebase;
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  NSObject *rateQueue;
  NSObject *figSynchronizerAccessQueue;
  NSObject *rendererListQueue;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  synchronizerInternal = self->_synchronizerInternal;
  if (synchronizerInternal)
  {
    if (synchronizerInternal->weakObserver)
    {
      objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_synchronizerInternal->weakObserver, avrendersynchronizer_timebaseRateChanged, *MEMORY[0x1E0CA2E78], self->_synchronizerInternal->readOnlyTimebase);
      synchronizerInternal = self->_synchronizerInternal;
    }
    v4 = (void *)-[NSMutableArray copy](synchronizerInternal->renderers, "copy");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v4);
          avrendersynchronize_performRendererRemoval((uint64_t)synchronizerInternal, *(void **)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v6);
    }

    v9 = self->_synchronizerInternal;
    readOnlyTimebase = v9->readOnlyTimebase;
    if (readOnlyTimebase)
    {
      CFRelease(readOnlyTimebase);
      self->_synchronizerInternal->readOnlyTimebase = 0;
      v9 = self->_synchronizerInternal;
    }
    figSynchronizer = v9->figSynchronizer;
    if (figSynchronizer)
    {
      CFRelease(figSynchronizer);
      self->_synchronizerInternal->figSynchronizer = 0;
      v9 = self->_synchronizerInternal;
    }
    rateQueue = v9->rateQueue;
    if (rateQueue)
    {
      dispatch_release(rateQueue);
      v9 = self->_synchronizerInternal;
    }
    figSynchronizerAccessQueue = v9->figSynchronizerAccessQueue;
    if (figSynchronizerAccessQueue)
    {
      dispatch_release(figSynchronizerAccessQueue);
      v9 = self->_synchronizerInternal;
    }
    rendererListQueue = v9->rendererListQueue;
    if (rendererListQueue)
    {
      dispatch_release(rendererListQueue);
      v9 = self->_synchronizerInternal;
    }

  }
  v15.receiver = self;
  v15.super_class = (Class)AVSampleBufferRenderSynchronizer;
  -[AVSampleBufferRenderSynchronizer dealloc](&v15, sel_dealloc);
}

+ (void)enableSTSLabels
{
  sParticipatesInSTS = 1;
}

+ (id)_makeSTSLabel
{
  uint64_t v2;

  if (_makeSTSLabel_onceToken != -1)
    dispatch_once(&_makeSTSLabel_onceToken, &__block_literal_global_35);
  if (!sParticipatesInSTS)
    return 0;
  v2 = getpid();
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.avfoundation.STS.%d-%d"), v2, FigAtomicIncrement32());
}

void __49__AVSampleBufferRenderSynchronizer__makeSTSLabel__block_invoke()
{
  if (!sParticipatesInSTS)
    sParticipatesInSTS = FigGetCFPreferenceNumberWithDefault();
}

- (CMTimebaseRef)timebase
{
  void *readOnlyTimebase;

  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  if (readOnlyTimebase)
    readOnlyTimebase = (void *)CFRetain(readOnlyTimebase);
  return (CMTimebaseRef)readOnlyTimebase;
}

- (CMTime)currentTime
{
  NSObject *rateQueue;
  CMTime *result;
  CMTime v7;
  CMTime time1;
  _QWORD block[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  uint64_t v15;
  CMTime v16;

  memset(&v16, 0, sizeof(v16));
  CMTimebaseGetTime(&v16, -[AVSampleBufferRenderSynchronizer timebase](self, "timebase"));
  v10 = 0;
  v11 = &v10;
  v12 = 0x3810000000;
  v13 = &unk_1935931BF;
  v14 = *MEMORY[0x1E0CA2E18];
  v15 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  rateQueue = self->_synchronizerInternal->rateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVSampleBufferRenderSynchronizer_currentTime__block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(rateQueue, block);
  time1 = v16;
  v7 = *(CMTime *)(v11 + 4);
  CMTimeMaximum(retstr, &time1, &v7);
  _Block_object_dispose(&v10, 8);
  return result;
}

__n128 __47__AVSampleBufferRenderSynchronizer_currentTime__block_invoke(uint64_t a1)
{
  __n128 *v1;
  uint64_t v2;
  __n128 result;

  v1 = *(__n128 **)(*(_QWORD *)(a1 + 40) + 8);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = *(__n128 *)(v2 + 36);
  v1[3].n128_u64[0] = *(_QWORD *)(v2 + 52);
  v1[2] = result;
  return result;
}

- (float)rate
{
  NSObject *rateQueue;
  float v3;
  _QWORD v5[6];
  uint64_t v6;
  float *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = (float *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  rateQueue = self->_synchronizerInternal->rateQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVSampleBufferRenderSynchronizer_rate__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rateQueue, v5);
  v3 = v7[6];
  _Block_object_dispose(&v6, 8);
  return v3;
}

float __40__AVSampleBufferRenderSynchronizer_rate__block_invoke(uint64_t a1)
{
  float result;

  result = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setRate:(float)rate
{
  __int128 v5;
  uint64_t v6;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v5 = *MEMORY[0x1E0CA2E18];
  v6 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVSampleBufferRenderSynchronizer setRate:time:](self, "setRate:time:", &v5, COERCE_DOUBLE(__PAIR64__(DWORD1(v5), LODWORD(rate))));
}

- (void)setRate:(float)rate time:(CMTime *)time
{
  __int128 v4;
  uint64_t v5;
  CMTime v6;

  v6 = *time;
  v4 = *MEMORY[0x1E0CA2E18];
  v5 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  -[AVSampleBufferRenderSynchronizer setRate:time:atHostTime:](self, "setRate:time:atHostTime:", &v6, &v4);
}

- (void)setRate:(float)rate time:(CMTime *)time atHostTime:(CMTime *)hostTime
{
  CMTime v5;
  CMTime v6;

  v6 = *time;
  v5 = *hostTime;
  -[AVSampleBufferRenderSynchronizer _setRate:time:atHostTime:](self, "_setRate:time:atHostTime:", &v6, &v5);
}

- (BOOL)setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5 error:(id *)a6
{
  signed int v7;
  signed int v8;
  void *v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  v12 = *a4;
  v11 = *a5;
  v7 = -[AVSampleBufferRenderSynchronizer _setRate:time:atHostTime:](self, "_setRate:time:atHostTime:", &v12, &v11);
  v8 = v7;
  if (v7)
  {
    v10 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v7, 0);
    if (a6)
      *a6 = v10;
  }
  return v8 == 0;
}

- (int)_setRate:(float)a3 time:(id *)a4 atHostTime:(id *)a5
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  float v12;
  double v13;
  NSObject *rateQueue;
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  uint64_t (*v16)(OpaqueFigSampleBufferRenderSynchronizer *, __int128 *, __int128 *, float);
  int v17;
  void *v19;
  __int128 v20;
  int64_t v21;
  __int128 v22;
  int64_t v23;
  _QWORD block[6];
  float v25;
  __int128 v26;
  int64_t var3;
  uint64_t v28;
  float *v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  __int128 v33;
  int64_t v34;
  __int128 v35;
  int64_t v36;

  if (a3 < 0.0)
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a5, v5, v6, v7, v8, (uint64_t)"newRate >= 0.0"), 0);
    objc_exception_throw(v19);
  }
  v12 = a3;
  v32 = 0;
  v28 = 0;
  v29 = (float *)&v28;
  v30 = 0x2020000000;
  v31 = 0;
  if (!-[AVSampleBufferRenderSynchronizer _rendererConfigurationIsValid:](self, "_rendererConfigurationIsValid:", &v32))
  {
    v13 = v12;
    v12 = 0.0;
    NSLog(CFSTR("Invalid renderer configuration; forcing rate to 0. rather than %1.3f"), *(_QWORD *)&v13);
  }
  rateQueue = self->_synchronizerInternal->rateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__AVSampleBufferRenderSynchronizer__setRate_time_atHostTime___block_invoke;
  block[3] = &unk_1E3035398;
  block[4] = self;
  block[5] = &v28;
  v25 = v12;
  v26 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  dispatch_sync(rateQueue, block);
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  v22 = *(_OWORD *)&a4->var0;
  v23 = a4->var3;
  v20 = *(_OWORD *)&a5->var0;
  v21 = a5->var3;
  v16 = *(uint64_t (**)(OpaqueFigSampleBufferRenderSynchronizer *, __int128 *, __int128 *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (!v16)
  {
    v17 = -12782;
    goto LABEL_8;
  }
  v35 = v22;
  v36 = v23;
  v33 = v20;
  v34 = v21;
  v17 = v16(figSynchronizer, &v35, &v33, v12);
  if (v17)
LABEL_8:
    -[AVSampleBufferRenderSynchronizer _updateRateFromTimebase](self, "_updateRateFromTimebase");
  if (v12 != v29[6])
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferRenderSynchronizerRateDidChangeNotification"), self);
  _Block_object_dispose(&v28, 8);
  return v17;
}

__n128 __61__AVSampleBufferRenderSynchronizer__setRate_time_atHostTime___block_invoke(uint64_t a1)
{
  __n128 result;
  uint64_t v2;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 32);
  result.n128_u32[0] = *(_DWORD *)(a1 + 48);
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result.n128_u32[0];
  if ((*(_BYTE *)(a1 + 64) & 1) != 0)
  {
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    result = *(__n128 *)(a1 + 52);
    *(_QWORD *)(v2 + 52) = *(_QWORD *)(a1 + 68);
    *(__n128 *)(v2 + 36) = result;
  }
  return result;
}

- (BOOL)delaysRateChangeUntilHasSufficientMediaData
{
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  void (*v3)(OpaqueFigSampleBufferRenderSynchronizer *, _QWORD, _QWORD, CFBooleanRef *);
  BOOL v4;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  v3 = *(void (**)(OpaqueFigSampleBufferRenderSynchronizer *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 1;
  v3(figSynchronizer, *MEMORY[0x1E0CC5E30], *MEMORY[0x1E0C9AE00], &BOOLean);
  if (!BOOLean)
    return 1;
  v4 = CFBooleanGetValue(BOOLean) == 0;
  if (BOOLean)
    CFRelease(BOOLean);
  return v4;
}

- (void)setDelaysRateChangeUntilHasSufficientMediaData:(BOOL)delaysRateChangeUntilHasSufficientMediaData
{
  _BOOL4 v3;
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  void (*v5)(OpaqueFigSampleBufferRenderSynchronizer *, _QWORD, uint64_t);
  uint64_t v6;

  v3 = delaysRateChangeUntilHasSufficientMediaData;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  v5 = *(void (**)(OpaqueFigSampleBufferRenderSynchronizer *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                         + 56);
  if (v5)
  {
    if (v3)
      v6 = *MEMORY[0x1E0C9AE40];
    else
      v6 = *MEMORY[0x1E0C9AE50];
    v5(figSynchronizer, *MEMORY[0x1E0CC5E30], v6);
  }
}

- (void)_updateRateFromTimebase
{
  NSObject *figSynchronizerAccessQueue;
  _QWORD block[5];

  figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(figSynchronizerAccessQueue, block);
}

void __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke(uint64_t a1)
{
  float Rate;
  uint64_t v3;
  NSObject *v4;
  _QWORD block[6];
  float v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  Rate = CMTimebaseGetRate(*(CMTimebaseRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16));
  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(*(_QWORD *)(v3 + 8) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke_2;
  block[3] = &unk_1E30353C0;
  block[4] = v3;
  block[5] = &v7;
  v6 = Rate;
  dispatch_sync(v4, block);
  if (v8[6] != Rate)
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferRenderSynchronizerRateDidChangeNotification"), *(_QWORD *)(a1 + 32));
  _Block_object_dispose(&v7, 8);
}

float __59__AVSampleBufferRenderSynchronizer__updateRateFromTimebase__block_invoke_2(uint64_t a1)
{
  float result;

  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 32);
  result = *(float *)(a1 + 48);
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 32) = result;
  return result;
}

+ (id)_videoRendererForRenderer:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(a3, "_sampleBufferVideoRenderer");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a3;
  else
    return 0;
}

- (NSArray)renderers
{
  NSObject *rendererListQueue;
  NSArray *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  v11 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__renderers__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererListQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __97__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__renderers__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 72), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)_addRenderer:(id)a3 error:(id *)a4
{
  int v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  AVSinkSubscriber *v12;
  AVSinkSubscriber *v13;
  NSObject *figSynchronizerAccessQueue;
  _QWORD v16[6];
  _QWORD v17[4];
  id v18;
  id location;
  void *v20;
  uint64_t v21;

  v21 = 0;
  v20 = 0;
  v7 = -[AVSampleBufferRenderSynchronizer _canAddRendererInternal:error:](self, "_canAddRendererInternal:error:", a3, &v20);
  if (v7)
  {
    v7 = objc_msgSend(a3, "setRenderSynchronizer:error:", self, &v20);
    if (v7)
    {
      -[NSMutableArray addObject:](self->_synchronizerInternal->renderers, "addObject:", a3);
      v8 = +[AVSampleBufferRenderSynchronizer _videoRendererForRenderer:](AVSampleBufferRenderSynchronizer, "_videoRendererForRenderer:", a3);
      v9 = MEMORY[0x1E0C809B0];
      if (v8)
      {
        v10 = v8;
        objc_initWeak(&location, self);
        v11 = objc_msgSend(v10, "_STSLabelPublisher");
        v12 = [AVSinkSubscriber alloc];
        v17[0] = v9;
        v17[1] = 3221225472;
        v17[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke;
        v17[3] = &unk_1E30353E8;
        objc_copyWeak(&v18, &location);
        v13 = -[AVSinkSubscriber initWithPublisher:requestingInitialValue:sink:](v12, "initWithPublisher:requestingInitialValue:sink:", v11, 0, v17);
        -[NSMutableDictionary setObject:forKey:](self->_synchronizerInternal->STSLabelSinks, "setObject:forKey:", v13, objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithPointer:", v10));

        objc_destroyWeak(&v18);
        objc_destroyWeak(&location);
      }
      avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers((uint64_t)self->_synchronizerInternal);
      objc_msgSend(a3, "copyFigSampleBufferAudioRenderer:", &v21);
      if (v21)
      {
        figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
        v16[0] = v9;
        v16[1] = 3221225472;
        v16[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_3;
        v16[3] = &unk_1E302FE78;
        v16[4] = self;
        v16[5] = v21;
        dispatch_async(figSynchronizerAccessQueue, v16);
      }
      LOBYTE(v7) = 1;
    }
  }
  if (a4)
    *a4 = v20;
  return v7;
}

void __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke(uint64_t a1)
{
  _QWORD *Weak;
  _QWORD *v2;
  dispatch_queue_t current_queue;
  NSObject *v4;
  _QWORD block[5];

  Weak = objc_loadWeak((id *)(a1 + 32));
  if (Weak)
  {
    v2 = Weak;
    current_queue = dispatch_get_current_queue();
    v4 = *(NSObject **)(v2[1] + 64);
    if (current_queue == v4)
    {
      avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(v2[1]);
    }
    else
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_2;
      block[3] = &unk_1E302FA10;
      block[4] = v2;
      dispatch_sync(v4, block);
    }
  }
}

uint64_t __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_2(uint64_t a1)
{
  return avrendersynchronize_electRendererForSTSAndSendLabelToAudioRenderers(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
}

void __107__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___addRenderer_error___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t, uint64_t);
  const void *v5;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 96);
  v4 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v4)
    v4(v3, v2);
  v5 = *(const void **)(a1 + 40);
  if (v5)
    CFRelease(v5);
}

- (void)addRenderer:(id)renderer
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *rendererListQueue;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  _QWORD block[8];
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  char v34;

  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3052000000;
  v28 = __Block_byref_object_copy__39;
  v29 = __Block_byref_object_dispose__39;
  v30 = 0;
  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EE2D1548) & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid renderer"), v6, v7, v8, v9, v10, v23), 0);
    objc_exception_throw(v12);
  }
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __100__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__addRenderer___block_invoke;
  block[3] = &unk_1E30347C8;
  block[4] = self;
  block[5] = renderer;
  block[6] = &v31;
  block[7] = &v25;
  dispatch_sync(rendererListQueue, block);
  if (!*((_BYTE *)v32 + 24) && objc_msgSend((id)v26[5], "code") == -11999)
  {
    v13 = (void *)objc_msgSend((id)objc_msgSend((id)v26[5], "userInfo"), "objectForKey:", CFSTR("AVErrorExceptionKey"));
    v14 = objc_msgSend(v13, "reason");
    v15 = (void *)MEMORY[0x1E0C99DA0];
    v21 = objc_msgSend(v13, "name");
    if (v14)
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(": %@"), v14);
    v22 = (void *)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", v21, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot add renderer %p %@"), v16, v17, v18, v19, v20, (uint64_t)renderer), 0);
    objc_exception_throw(v22);
  }
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);
}

uint64_t __100__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__addRenderer___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_addRenderer:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_getTimebaseObserverForRenderer:(id)a3
{
  return avrendersynchronize_getTimebaseObserverForRenderer((uint64_t)a3, self->_synchronizerInternal->timedRenderRemovals);
}

- (id)_getClientCompletionHandlerForRenderer:(id)a3
{
  return avrendersynchronize_getClientCompletionHandlerForRenderer((uint64_t)a3, self->_synchronizerInternal->timedRenderRemovals);
}

- (void)_removeTimebaseObserverForRenderer:(id)a3
{
  avrendersynchronize_removeTimebaseObserverForRenderer((uint64_t)a3, self->_synchronizerInternal->timedRenderRemovals);
}

- (void)_storeObserver:(id)a3 clientCompletionHandler:(id)a4 forRenderer:(id)a5
{
  void *v8;
  uint64_t v9;

  v8 = (void *)objc_msgSend(a4, "copy");
  v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", a5, CFSTR("renderer"), a3, CFSTR("onceTimebaseObserver"), v8, CFSTR("clientCompletionHandler"), 0);

  -[NSMutableArray addObject:](self->_synchronizerInternal->timedRenderRemovals, "addObject:", v9);
}

- (id)_createOnceTimebaseObserverForRemovalOfRenderer:(id)a3 atTime:(id *)a4
{
  AVWeakReference *v7;
  AVWeakReference *v8;
  AVOnceTimebaseObserver *v9;
  AVSampleBufferRenderSynchronizerInternal *synchronizerInternal;
  OpaqueCMTimebase *readOnlyTimebase;
  OS_dispatch_queue *rendererListQueue;
  AVOnceTimebaseObserver *v13;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15;
  _QWORD v16[6];

  v7 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
  v8 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke;
  v16[3] = &unk_1E302FCE8;
  v16[4] = v7;
  v16[5] = v8;
  v9 = [AVOnceTimebaseObserver alloc];
  synchronizerInternal = self->_synchronizerInternal;
  readOnlyTimebase = synchronizerInternal->readOnlyTimebase;
  rendererListQueue = synchronizerInternal->rendererListQueue;
  v15 = *a4;
  v13 = -[AVOnceTimebaseObserver initWithTimebase:fireTime:queue:block:](v9, "initWithTimebase:fireTime:queue:block:", readOnlyTimebase, &v15, rendererListQueue, v16);

  return v13;
}

void __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD block[5];

  v2 = (void *)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  v3 = (void *)MEMORY[0x1940343FC]();
  v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "referencedObject");
  if (v2 && *(_QWORD *)(a1 + 40))
    objc_msgSend(v2, "_performRendererRemoval:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_autoreleasePoolPop(v3);
    if (v5)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke_2;
      block[3] = &unk_1E302FA10;
      block[4] = v5;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {
    objc_autoreleasePoolPop(v3);
  }
}

void __143__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___createOnceTimebaseObserverForRemovalOfRenderer_atTime___block_invoke_2(uint64_t a1)
{

}

- (BOOL)_scheduleTimedRendererRemovalAtTime:(id)a3 atTime:(id *)a4 withClientCompletionHandler:(id)a5
{
  int v9;
  id v10;
  void *v11;
  id v12;
  NSObject *figSynchronizerAccessQueue;
  __int128 v15;
  int64_t var3;
  _QWORD block[5];

  v9 = -[NSMutableArray containsObject:](self->_synchronizerInternal->renderers, "containsObject:");
  if (v9)
  {
    v10 = -[AVSampleBufferRenderSynchronizer _getTimebaseObserverForRenderer:](self, "_getTimebaseObserverForRenderer:", a3);
    if (v10)
    {
      v11 = v10;
      if ((objc_msgSend(v10, "didFire") & 1) != 0)
      {
        LOBYTE(v9) = 0;
        return v9;
      }
      v12 = -[AVSampleBufferRenderSynchronizer _getClientCompletionHandlerForRenderer:](self, "_getClientCompletionHandlerForRenderer:", a3);
      -[AVSampleBufferRenderSynchronizer _removeTimebaseObserverForRenderer:](self, "_removeTimebaseObserverForRenderer:", a3);
      if (v12)
      {
        figSynchronizerAccessQueue = self->_synchronizerInternal->figSynchronizerAccessQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __159__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___scheduleTimedRendererRemovalAtTime_atTime_withClientCompletionHandler___block_invoke;
        block[3] = &unk_1E30324C0;
        block[4] = v12;
        dispatch_async(figSynchronizerAccessQueue, block);
      }
      objc_msgSend(v11, "invalidate");
    }
    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[AVSampleBufferRenderSynchronizer _storeObserver:clientCompletionHandler:forRenderer:](self, "_storeObserver:clientCompletionHandler:forRenderer:", -[AVSampleBufferRenderSynchronizer _createOnceTimebaseObserverForRemovalOfRenderer:atTime:](self, "_createOnceTimebaseObserverForRemovalOfRenderer:atTime:", a3, &v15), a5, a3);
    LOBYTE(v9) = 1;
  }
  return v9;
}

void __159__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement___scheduleTimedRendererRemovalAtTime_atTime_withClientCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

- (void)removeRenderer:(id)a3 atTime:(id *)a4 withCompletionHandler:(id)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[AVSampleBufferRenderSynchronizer removeRenderer:atTime:completionHandler:](self, "removeRenderer:atTime:completionHandler:", a3, &v5, a5);
}

- (void)removeRenderer:(id)renderer atTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *rendererListQueue;
  void *v16;
  uint64_t v17;
  _QWORD block[8];
  __int128 v19;
  CMTimeEpoch epoch;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if ((objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EE2D1548) & 1) == 0)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid renderer"), v10, v11, v12, v13, v14, v17), 0);
    objc_exception_throw(v16);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__removeRenderer_atTime_completionHandler___block_invoke;
  block[3] = &unk_1E3035410;
  block[4] = self;
  block[5] = renderer;
  v19 = *(_OWORD *)&time->value;
  epoch = time->epoch;
  block[6] = completionHandler;
  block[7] = &v21;
  dispatch_sync(rendererListQueue, block);
  if (completionHandler && !*((_BYTE *)v22 + 24))
    (*((void (**)(void *, _QWORD))completionHandler + 2))(completionHandler, 0);
  _Block_object_dispose(&v21, 8);
}

uint64_t __128__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererManagement__removeRenderer_atTime_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  __int128 v6;
  uint64_t v7;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v6 = *(_OWORD *)(a1 + 64);
  v7 = *(_QWORD *)(a1 + 80);
  result = objc_msgSend(v2, "_scheduleTimedRendererRemovalAtTime:atTime:withClientCompletionHandler:", v3, &v6, v4);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (void)_performRendererRemoval:(id)a3
{
  avrendersynchronize_performRendererRemoval((uint64_t)self->_synchronizerInternal, a3);
}

- (BOOL)_canAddRendererInternal:(id)a3 error:(id *)a4
{
  const __CFString *v7;
  void *v8;
  BOOL v9;

  if ((-[NSMutableArray containsObject:](self->_synchronizerInternal->renderers, "containsObject:") & 1) != 0)
  {
    v7 = CFSTR("The SampleBufferRenderer cannot be added to a Synchronizer more than once.");
  }
  else
  {
    if (!-[AVSampleBufferRenderSynchronizer _multipleAudioRenderersDisallowed](self, "_multipleAudioRenderersDisallowed")|| !avsbrs_rendererIsAudioRenderer(a3)|| -[AVSampleBufferRenderSynchronizer _addedAudioRendererCountInternal](self, "_addedAudioRendererCountInternal") < 1)
    {
      v8 = 0;
      v9 = 1;
      if (!a4)
        return v9;
      goto LABEL_4;
    }
    v7 = CFSTR("Multiple AudioRenderers not allowed when using Long Form Routing Policy.");
  }
  v8 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], v7, 0));
  v9 = 0;
  if (a4)
LABEL_4:
    *a4 = v8;
  return v9;
}

- (BOOL)_rendererConfigurationIsValid:(id *)a3
{
  void *v5;
  BOOL v6;

  if (-[AVSampleBufferRenderSynchronizer _multipleAudioRenderersDisallowed](self, "_multipleAudioRenderersDisallowed")
    && -[AVSampleBufferRenderSynchronizer _addedAudioRendererCount](self, "_addedAudioRendererCount") >= 2)
  {
    v5 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Multiple AudioRenderers not allowed when using Long Form Routing Policy."), 0));
    v6 = 0;
    if (!a3)
      return v6;
    goto LABEL_6;
  }
  v5 = 0;
  v6 = 1;
  if (a3)
LABEL_6:
    *a3 = v5;
  return v6;
}

- (BOOL)_multipleAudioRenderersDisallowed
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance"), "routeSharingPolicy") == 1;
}

- (int64_t)_addedAudioRendererCount
{
  NSObject *rendererListQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererListQueue = self->_synchronizerInternal->rendererListQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __114__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererRestrictions___addedAudioRendererCount__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererListQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __114__AVSampleBufferRenderSynchronizer_AVSampleBufferRenderSynchronizerRendererRestrictions___addedAudioRendererCount__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_addedAudioRendererCountInternal");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int64_t)_addedAudioRendererCountInternal
{
  NSMutableArray *renderers;
  uint64_t v3;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  renderers = self->_synchronizerInternal->renderers;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](renderers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (!v3)
    return 0;
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v10;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v10 != v6)
        objc_enumerationMutation(renderers);
      v5 += avsbrs_rendererIsAudioRenderer(*(void **)(*((_QWORD *)&v9 + 1) + 8 * i));
    }
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](renderers, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  }
  while (v4);
  return v5;
}

- (id)addPeriodicTimeObserverForInterval:(CMTime *)interval queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  OpaqueCMTimebase *readOnlyTimebase;
  AVPeriodicTimebaseObserver *v9;
  CMTime v11;

  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  v9 = [AVPeriodicTimebaseObserver alloc];
  v11 = *interval;
  return -[AVPeriodicTimebaseObserver initWithTimebase:interval:queue:block:](v9, "initWithTimebase:interval:queue:block:", readOnlyTimebase, &v11, queue, block);
}

- (id)addBoundaryTimeObserverForTimes:(NSArray *)times queue:(dispatch_queue_t)queue usingBlock:(void *)block
{
  return -[AVOccasionalTimebaseObserver initWithTimebase:times:queue:block:]([AVOccasionalTimebaseObserver alloc], "initWithTimebase:times:queue:block:", self->_synchronizerInternal->readOnlyTimebase, times, queue, block);
}

- (void)removeTimeObserver:(id)observer
{
  OpaqueCMTimebase *readOnlyTimebase;
  void *v6;
  uint64_t v7;
  const __CFString *v8;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("You did not supply a reference to an object returned by either -addPeriodicTimeObserverForInterval:queue:usingBlock: or -addBoundaryTimeObserverForTimes:queue:usingBlock:");
    goto LABEL_6;
  }
  readOnlyTimebase = self->_synchronizerInternal->readOnlyTimebase;
  if (readOnlyTimebase != (OpaqueCMTimebase *)objc_msgSend(observer, "timebase"))
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = CFSTR("An instance of AVSampleBufferRenderSynchronizer cannot remove a time observer that was added by a different instance of AVSampleBufferRenderSynchronizer.");
LABEL_6:
    objc_exception_throw((id)objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v8, 0));
  }
  objc_msgSend(observer, "invalidate");
}

- (BOOL)isDefunct
{
  OpaqueFigSampleBufferRenderSynchronizer *figSynchronizer;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigSampleBufferRenderSynchronizer *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  figSynchronizer = self->_synchronizerInternal->figSynchronizer;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigSampleBufferRenderSynchronizer *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(figSynchronizer, &v8) == 0;
      LODWORD(v4) = v8;
      goto LABEL_6;
    }
  }
  v5 = 0;
LABEL_6:
  if (v5)
    v6 = (int)v4;
  else
    v6 = 1;
  if (!(_DWORD)v4)
    LODWORD(v4) = v6;
  return (_DWORD)v4 == 1;
}

+ (id)currentFigRenderSynchronizerFactory
{
  AVRemoteFigSampleBufferRenderSynchronizerFactory *v2;
  id result;

  v2 = objc_alloc_init(AVRemoteFigSampleBufferRenderSynchronizerFactory);
  result = dispatch_get_specific(CFSTR("AVSampleBufferRenderSynchronizerFigFactoryKey"));
  if (!result)
    return v2;
  return result;
}

+ (void)setFigRenderSynchronizerFactory:(id)a3 forQueue:(id)a4
{
  dispatch_queue_set_specific((dispatch_queue_t)a4, CFSTR("AVSampleBufferRenderSynchronizerFigFactoryKey"), a3, AVSampleBufferRenderSynchronizerReleaseObject);
}

@end
