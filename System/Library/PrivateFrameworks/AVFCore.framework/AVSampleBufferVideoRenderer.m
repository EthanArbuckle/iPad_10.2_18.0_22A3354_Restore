@implementation AVSampleBufferVideoRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work();
    fig_note_initialize_category_with_default_work();
  }
}

- (void)_fireDisplayLayerNotificationNowThenReleaseOnMainThread:(id)a3 userInfo:(id)a4
{
  void *v7;
  id WeakRetained;
  id v9;
  _QWORD block[5];

  v7 = (void *)MEMORY[0x1940343FC](self, a2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_weakDisplayLayer);
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", a3, WeakRetained, a4);
    objc_autoreleasePoolPop(v7);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__AVSampleBufferVideoRenderer__fireDisplayLayerNotificationNowThenReleaseOnMainThread_userInfo___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }
  else
  {
    objc_autoreleasePoolPop(v7);
  }
}

void __96__AVSampleBufferVideoRenderer__fireDisplayLayerNotificationNowThenReleaseOnMainThread_userInfo___block_invoke(uint64_t a1)
{

}

- (void)setControlTimebase:(OpaqueCMTimebase *)a3
{
  NSObject *serialQueue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__AVSampleBufferVideoRenderer_setControlTimebase___block_invoke;
  block[3] = &unk_1E3031868;
  block[4] = self;
  block[5] = &v15;
  block[6] = a3;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The control timebase can not be changed after the display layer or video renderer has been added to a synchronizer"), v7, v8, v9, v10, v11, v13), 0);
    objc_exception_throw(v12);
  }
  if (a3)
  {
    self->_controlTimebaseSetByUserIsInUse = 1;
    FigReadOnlyTimebaseSetTargetTimebase();
  }
  else
  {
    self->_controlTimebaseSetByUserIsInUse = 0;
    _targetReadOnlyTimebaseAtDummyTimebase();
  }
  _Block_object_dispose(&v15, 8);
}

void __50__AVSampleBufferVideoRenderer_setControlTimebase___block_invoke(_QWORD *a1)
{
  uint64_t v1;
  const void *v2;
  const void *v3;

  v1 = a1[4];
  if (*(_BYTE *)(v1 + 168))
  {
    *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    v2 = *(const void **)(v1 + 176);
    v3 = (const void *)a1[6];
    *(_QWORD *)(v1 + 176) = v3;
    if (v3)
      CFRetain(v3);
    if (v2)
      CFRelease(v2);
  }
}

- (BOOL)_setSynchronizerTimebase:(OpaqueCMTimebase *)a3 error:(id *)a4
{
  NSObject *serialQueue;
  uint64_t *v8;
  int v9;
  BOOL v10;
  _QWORD v12[8];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 1;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__36;
  v17 = __Block_byref_object_dispose__36;
  v18 = 0;
  serialQueue = self->_serialQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __62__AVSampleBufferVideoRenderer__setSynchronizerTimebase_error___block_invoke;
  v12[3] = &unk_1E3034FE8;
  v12[4] = self;
  v12[5] = &v13;
  v12[6] = &v19;
  v12[7] = a3;
  dispatch_sync(serialQueue, v12);
  v8 = v20;
  v9 = *((unsigned __int8 *)v20 + 24);
  if (*((_BYTE *)v20 + 24))
  {
    if (a3)
    {
      self->_addedToSynchronizer = 1;
      FigReadOnlyTimebaseSetTargetTimebase();
      FigReadOnlyTimebaseSetTargetTimebase();
    }
    else
    {
      self->_addedToSynchronizer = 0;
      _targetReadOnlyTimebaseAtDummyTimebase();
      _targetReadOnlyTimebaseAtDummyTimebase();
    }
    v8 = v20;
    v9 = 1;
    *((_BYTE *)v20 + 24) = 1;
  }
  if (a4)
  {
    *a4 = (id)v14[5];
    v9 = *((unsigned __int8 *)v8 + 24);
  }
  v10 = v9 != 0;
  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);
  return v10;
}

uint64_t __62__AVSampleBufferVideoRenderer__setSynchronizerTimebase_error___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 168) = *(_QWORD *)(result + 56) != 0;
  if (*(_BYTE *)(*(_QWORD *)(result + 32) + 169))
  {
    v1 = result;
    result = AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("The display layer or video renderer cannot be added to a synchronizer if the control timebase has already been set."), 0));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 40) = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (OpaqueCMTimebase)_readOnlyVideoQueueTimebase
{
  NSObject *serialQueue;
  OpaqueCMTimebase *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__AVSampleBufferVideoRenderer__readOnlyVideoQueueTimebase__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (OpaqueCMTimebase *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __58__AVSampleBufferVideoRenderer__readOnlyVideoQueueTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 184);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (int)_initializeTimebases
{
  OpaqueCMClock *HostTimeClock;
  int OnlyTimebase;
  OpaqueCMTimebase *v4;
  OpaqueCMClock *v5;
  OpaqueCMClock *v6;
  int v7;
  CMTime time;
  CMTimebaseRef timebaseOut;
  CMTimebaseRef v11;

  v11 = 0;
  timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  OnlyTimebase = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
  if (!OnlyTimebase)
  {
    OnlyTimebase = CMTimebaseSetRate(timebaseOut, 1.0);
    if (!OnlyTimebase)
    {
      v4 = timebaseOut;
      v5 = CMClockGetHostTimeClock();
      CMClockGetTime(&time, v5);
      OnlyTimebase = CMTimebaseSetTime(v4, &time);
      if (!OnlyTimebase)
      {
        OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
        if (!OnlyTimebase)
        {
          v6 = CMClockGetHostTimeClock();
          OnlyTimebase = CMTimebaseCreateWithSourceClock(0, v6, &v11);
          if (!OnlyTimebase)
            OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
        }
      }
    }
  }
  v7 = OnlyTimebase;
  if (timebaseOut)
    CFRelease(timebaseOut);
  if (v11)
    CFRelease(v11);
  return v7;
}

- (int)_createVideoQueue:(OpaqueFigVideoQueue *)a3 errorStep:(id *)a4
{
  NSObject *videoQueueQueue;
  uint64_t v8;
  int v9;
  NSObject *v10;
  NSObject *v11;
  const void *v12;
  uint64_t *v13;
  int v14;
  _QWORD v16[7];
  _QWORD v17[6];
  _QWORD block[6];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;

  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  videoQueueQueue = self->_videoQueueQueue;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke;
  block[3] = &unk_1E3035010;
  block[4] = &v23;
  block[5] = &v19;
  dispatch_sync(videoQueueQueue, block);
  if (*((_DWORD *)v24 + 6))
    goto LABEL_15;
  v9 = -[AVSampleBufferVideoRenderer _setContentLayerOnFigVideoQueue:](self, "_setContentLayerOnFigVideoQueue:", v20[3]);
  *((_DWORD *)v24 + 6) = v9;
  if (v9)
    goto LABEL_15;
  v10 = self->_videoQueueQueue;
  v17[0] = v8;
  v17[1] = 3221225472;
  v17[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_2;
  v17[3] = &unk_1E3035010;
  v17[4] = &v19;
  v17[5] = &v23;
  dispatch_sync(v10, v17);
  if (*((_DWORD *)v24 + 6))
    goto LABEL_15;
  v11 = self->_videoQueueQueue;
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_3;
  v16[3] = &unk_1E3031E18;
  v16[5] = &v23;
  v16[6] = &v19;
  v16[4] = self;
  dispatch_sync(v11, v16);
  if (*((_DWORD *)v24 + 6))
  {
LABEL_15:
    v12 = (const void *)v20[3];
    if (v12)
    {
      CFRelease(v12);
      v20[3] = 0;
    }
  }
  if (a3)
    *a3 = (OpaqueFigVideoQueue *)v20[3];
  v13 = v24;
  v14 = *((_DWORD *)v24 + 6);
  if (a4 && v14)
  {
    *a4 = 0;
    v14 = *((_DWORD *)v13 + 6);
  }
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v23, 8);
  return v14;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigVideoQueueCreateRemote();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_2(uint64_t a1)
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD);
  uint64_t v4;
  uint64_t (*v5)(uint64_t, _QWORD);
  uint64_t result;

  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v3 = *(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v3)
    v3(CMBaseObject, *MEMORY[0x1E0CC6438], *MEMORY[0x1E0C9AE50]);
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  v5 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v5)
    result = v5(v4, 0);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer__createVideoQueue_errorStep___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_readOnlyVideoQueueTimebase");
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6408], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_isCreateVideoQueueErrorRetryable:(int)a3
{
  return a3 == -12083 || a3 == -16155;
}

- (int)createVideoQueue:(OpaqueFigVideoQueue *)a3
{
  unsigned int v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v9;

  v5 = 0;
  v9 = 0;
  do
  {
    v6 = -[AVSampleBufferVideoRenderer _createVideoQueue:errorStep:](self, "_createVideoQueue:errorStep:", a3, &v9);
    if (-[AVSampleBufferVideoRenderer _isCreateVideoQueueErrorRetryable:](self, "_isCreateVideoQueueErrorRetryable:", v6))
    {
      v7 = v5 >= 4;
    }
    else
    {
      v7 = 1;
    }
    ++v5;
  }
  while (!v7);
  return v6;
}

- (OpaqueFigVideoQueue)_copyVideoQueue
{
  NSObject *serialQueue;
  OpaqueFigVideoQueue *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVSampleBufferVideoRenderer__copyVideoQueue__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (OpaqueFigVideoQueue *)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __46__AVSampleBufferVideoRenderer__copyVideoQueue__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 8);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)_hasEverEnqueued
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__AVSampleBufferVideoRenderer__hasEverEnqueued__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __47__AVSampleBufferVideoRenderer__hasEverEnqueued__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 109);
  return result;
}

- (void)_refreshAboveHighWaterLevel
{
  OpaqueFigVideoQueue *v3;
  uint64_t v4;
  NSObject *videoQueueQueue;
  NSObject *serialQueue;
  _QWORD v7[8];
  _QWORD block[6];
  _QWORD v9[3];
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__36;
  v15 = __Block_byref_object_dispose__36;
  v16 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke;
    block[3] = &unk_1E3031EB8;
    block[4] = v9;
    block[5] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  serialQueue = self->_serialQueue;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke_2;
  v7[3] = &unk_1E3031A68;
  v7[4] = self;
  v7[5] = v9;
  v7[6] = &v17;
  v7[7] = &v11;
  dispatch_sync(serialQueue, v7);
  if (*((_BYTE *)v18 + 24))
  {
    objc_msgSend((id)v12[5], "startRequestingMediaData");

    v12[5] = 0;
  }
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
}

uint64_t __58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t (*v4)(uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 48);
  if (v4)
  {
    result = v4(v2);
    LOBYTE(v4) = (_DWORD)result != 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_BYTE)v4;
  return result;
}

_QWORD *__58__AVSampleBufferVideoRenderer__refreshAboveHighWaterLevel__block_invoke_2(_QWORD *result)
{
  uint64_t v1;
  int v2;
  _QWORD *v3;
  uint64_t v4;

  v1 = result[4];
  v2 = *(unsigned __int8 *)(v1 + 121);
  *(_BYTE *)(v1 + 121) = *(_BYTE *)(*(_QWORD *)(result[5] + 8) + 24);
  if (v2)
  {
    v3 = result;
    v4 = result[4];
    if (!*(_BYTE *)(v4 + 121))
    {
      if (*(_BYTE *)(v4 + 110))
      {
        *(_BYTE *)(*(_QWORD *)(result[6] + 8) + 24) = 1;
        result = *(id *)(result[4] + 112);
        *(_QWORD *)(*(_QWORD *)(v3[7] + 8) + 40) = result;
      }
    }
  }
  return result;
}

- (void)_setStatus:(int64_t)a3 error:(id)a4
{
  NSObject *serialQueue;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (self->_status < a3)
  {
    -[AVSampleBufferVideoRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    if (a4)
      -[AVSampleBufferVideoRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
    serialQueue = self->_serialQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __48__AVSampleBufferVideoRenderer__setStatus_error___block_invoke;
    v8[3] = &unk_1E3034F90;
    v8[4] = self;
    v8[5] = a4;
    v8[6] = &v9;
    v8[7] = a3;
    dispatch_sync(serialQueue, v8);
    if (*((_BYTE *)v10 + 24))
      -[AVSampleBufferVideoRenderer _setRequiresFlushToResumeDecoding:](self, "_setRequiresFlushToResumeDecoding:", 1);
    -[AVSampleBufferVideoRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
    if (a4)
      -[AVSampleBufferVideoRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  }
  _Block_object_dispose(&v9, 8);
}

_QWORD *__48__AVSampleBufferVideoRenderer__setStatus_error___block_invoke(_QWORD *result)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = result[7];
  v2 = result[4];
  if (v1 > *(_QWORD *)(v2 + 24))
  {
    v3 = result;
    if (dword_1EE2B01F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      v1 = v3[7];
      v2 = v3[4];
    }
    *(_QWORD *)(v2 + 24) = v1;
    result = *(_QWORD **)(v3[4] + 32);
    if (result
      || (result = (_QWORD *)v3[5]) != 0
      && (*(_QWORD *)(v3[4] + 32) = objc_msgSend(result, "copy"), (result = *(_QWORD **)(v3[4] + 32)) != 0))
    {
      result = (_QWORD *)objc_msgSend(result, "code", v5, v6);
      if (result == (_QWORD *)-11847
        || (result = (_QWORD *)objc_msgSend(*(id *)(v3[4] + 32), "code"), result == (_QWORD *)-11819))
      {
        *(_BYTE *)(*(_QWORD *)(v3[6] + 8) + 24) = 1;
      }
    }
  }
  return result;
}

- (void)_resetStatusWithOSStatus:(int)a3
{
  NSError *error;
  NSObject *serialQueue;
  _QWORD block[5];

  if (a3)
  {
    -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 2, AVLocalizedErrorWithUnderlyingOSStatus(a3, 0));
  }
  else if (self->_status >= 1)
  {
    error = self->_error;
    -[AVSampleBufferVideoRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    if (error)
      -[AVSampleBufferVideoRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__AVSampleBufferVideoRenderer__resetStatusWithOSStatus___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    -[AVSampleBufferVideoRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
    if (error)
      -[AVSampleBufferVideoRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("error"));
  }
}

void __56__AVSampleBufferVideoRenderer__resetStatusWithOSStatus___block_invoke(uint64_t a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  if (dword_1EE2B01F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = 0;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
}

- (void)_setOutputObscuredDueToInsufficientExternalProtection:(BOOL)a3
{
  NSObject *serialQueue;
  _QWORD v6[5];
  BOOL v7;

  if (-[AVSampleBufferVideoRenderer outputObscuredDueToInsufficientExternalProtection](self, "outputObscuredDueToInsufficientExternalProtection") != a3)
  {
    -[AVSampleBufferVideoRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("outputObscuredDueToInsufficientExternalProtection"));
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __85__AVSampleBufferVideoRenderer__setOutputObscuredDueToInsufficientExternalProtection___block_invoke;
    v6[3] = &unk_1E302FD38;
    v6[4] = self;
    v7 = a3;
    dispatch_sync(serialQueue, v6);
    -[AVSampleBufferVideoRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("outputObscuredDueToInsufficientExternalProtection"));
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferVideoRendererOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification"), self);
    -[AVSampleBufferVideoRenderer _fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:](self, "_fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:", CFSTR("AVSampleBufferDisplayLayerOutputObscuredDueToInsufficientExternalProtectionDidChangeNotification"), 0);
  }
}

uint64_t __85__AVSampleBufferVideoRenderer__setOutputObscuredDueToInsufficientExternalProtection___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (void)_addFigVideoQueueListeners
{
  OpaqueFigVideoQueue *v2;
  OpaqueFigVideoQueue *v3;

  v2 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v2)
  {
    v3 = v2;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterAddWeakListeners();
    CFRelease(v3);
  }
}

- (void)_removeFigVideoQueueListeners
{
  OpaqueFigVideoQueue *v2;
  OpaqueFigVideoQueue *v3;

  v2 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v2)
  {
    v3 = v2;
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListeners();
    CFRelease(v3);
  }
}

- (void)_setRequiresFlushToResumeDecoding:(BOOL)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[6];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
    -[AVSampleBufferVideoRenderer setReadyForDisplayWithoutKVO:](self, "setReadyForDisplayWithoutKVO:", 0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__AVSampleBufferVideoRenderer__setRequiresFlushToResumeDecoding___block_invoke;
  block[3] = &unk_1E3031820;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v11 + 24))
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVSampleBufferVideoRendererRequiresFlushToResumeDecodingDidChangeNotification"), self);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v6);
    -[AVSampleBufferVideoRenderer _fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:](self, "_fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:", CFSTR("AVSampleBufferDisplayLayerRequiresFlushToResumeDecodingDidChangeNotification"), 0);
    if (dword_1EE2B01F0)
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
    }
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __65__AVSampleBufferVideoRenderer__setRequiresFlushToResumeDecoding___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 106) != v2)
  {
    *(_BYTE *)(v1 + 106) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)_setCreateVideoQueueFailedWithOSStatus:(int)a3
{
  NSObject *serialQueue;
  _QWORD v4[5];
  int v5;

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __70__AVSampleBufferVideoRenderer__setCreateVideoQueueFailedWithOSStatus___block_invoke;
  v4[3] = &unk_1E30317D0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(serialQueue, v4);
}

uint64_t __70__AVSampleBufferVideoRenderer__setCreateVideoQueueFailedWithOSStatus___block_invoke(uint64_t result)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 122) = *(_DWORD *)(result + 40) != 0;
  if (dword_1EE2B01F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

- (BOOL)_createVideoQueueFailed
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVSampleBufferVideoRenderer__createVideoQueueFailed__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __54__AVSampleBufferVideoRenderer__createVideoQueueFailed__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 122);
  return result;
}

- (AVSampleBufferVideoRenderer)init
{
  AVSampleBufferVideoRenderer *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  CGSize v12;
  uint64_t v13;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v15;
  unsigned int v16;
  unsigned int v17;
  OpaqueFigVideoQueue *videoQueue;
  uint64_t v20;
  uint64_t v21;
  os_log_type_t v22[8];
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;
  int v27;
  const char *v28;
  __int16 v29;
  AVSampleBufferVideoRenderer *v30;
  __int16 v31;
  OpaqueFigVideoQueue *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v26.receiver = self;
  v26.super_class = (Class)AVSampleBufferVideoRenderer;
  v2 = -[AVSampleBufferVideoRenderer init](&v26, sel_init);
  if (v2)
  {
    v2->_figVideoTargets = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_serialQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer serial", v3);
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_videoQueueQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer videoQueue", v4);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_layerQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer layerQueue", v5);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_videoPerformanceMetricsQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRenderer videoPerformanceMetricsQueue", v6);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_flushCallbackListQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererCallbackListQueue", v7);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_flushCallbackQueue = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererFlushCallbackQueue", v8);
    v2->_flushCallbacks = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 0);
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queueForProtectingPrerollCompleteCallback = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererQueueForProtectingPrerollCompleteCallback", v9);
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v2->_queueForCallingPrerollCompleteCallback = (OS_dispatch_queue *)dispatch_queue_create("AVSampleBufferVideoRendererQueueForCallingPrerollCompleteCallback", v10);
    v2->_applicationStateMonitor = (AVApplicationStateMonitor *)+[AVApplicationStateMonitor sharedApplicationStateMonitor](AVApplicationStateMonitor, "sharedApplicationStateMonitor");
    objc_initWeak(&location, v2);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __35__AVSampleBufferVideoRenderer_init__block_invoke;
    v23[3] = &unk_1E302FA38;
    objc_copyWeak(&v24, &location);
    v2->_didFinishSuspensionNotificationToken = (id)objc_msgSend(v11, "addObserverForName:object:queue:usingBlock:", CFSTR("_UIApplicationDidFinishSuspensionSnapshotNotification"), 0, 0, v23);
    *(_WORD *)&v2->_preventsDisplaySleepDuringVideoPlayback = 257;
    v2->_videoOutputs = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (-[AVSampleBufferVideoRenderer _initializeTimebases](v2, "_initializeTimebases"))
    {
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
      goto LABEL_9;
    }
    v2->_status = 0;
    v2->_error = 0;
    v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v2->_previousSourceRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v2->_previousSourceRect.size = v12;
    v2->_createVideoQueueFailed = 0;
    *(_QWORD *)v22 = 0;
    v13 = objc_msgSend(-[AVSampleBufferVideoRenderer currentFigVideoQueueFactory](v2, "currentFigVideoQueueFactory"), "createVideoQueue:", v22);
    if ((_DWORD)v13)
    {
      if (dyld_program_sdk_at_least())
      {
        if (dword_1EE2B01F0)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        -[AVSampleBufferVideoRenderer _setCreateVideoQueueFailedWithOSStatus:](v2, "_setCreateVideoQueueFailedWithOSStatus:", v13, v20, v21);
        -[AVSampleBufferVideoRenderer _resetStatusWithOSStatus:](v2, "_resetStatusWithOSStatus:", v13);
        -[AVSampleBufferVideoRenderer _setRequiresFlushToResumeDecoding:](v2, "_setRequiresFlushToResumeDecoding:", 1);
        v2->_videoQueue = 0;
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
        goto LABEL_11;
      }
      v2->_videoQueue = 0;
      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
LABEL_9:

      return 0;
    }
    v2->_videoQueue = *(OpaqueFigVideoQueue **)v22;
    -[AVSampleBufferVideoRenderer _addFigVideoQueueListeners](v2, "_addFigVideoQueueListeners");
    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }
LABEL_11:
  if (dword_1EE2B01F0 >= 3)
  {
    LODWORD(location) = 0;
    v22[0] = OS_LOG_TYPE_DEFAULT;
    v15 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    v16 = location;
    if (os_log_type_enabled(v15, v22[0]))
      v17 = v16;
    else
      v17 = v16 & 0xFFFFFFFE;
    if (v17)
    {
      videoQueue = v2->_videoQueue;
      v27 = 136315650;
      v28 = "-[AVSampleBufferVideoRenderer init]";
      v29 = 2048;
      v30 = v2;
      v31 = 2048;
      v32 = videoQueue;
      _os_log_send_and_compose_impl();
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return v2;
}

uint64_t __35__AVSampleBufferVideoRenderer_init__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(objc_loadWeak((id *)(a1 + 32)), "_didFinishSuspension:", a2);
}

- (void)dealloc
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSError *error;
  OpaqueFigVideoQueue *videoQueue;
  AVMediaDataRequester *mediaDataRequester;
  OS_dispatch_queue *serialQueue;
  OS_dispatch_queue *videoQueueQueue;
  OS_dispatch_queue *layerQueue;
  OS_dispatch_queue *videoPerformanceMetricsQueue;
  NSObject *flushCallbackListQueue;
  NSObject *flushCallbackQueue;
  NSObject *queueForProtectingPrerollCompleteCallback;
  NSObject *queueForCallingPrerollCompleteCallback;
  OpaqueCMTimebase *controlTimebaseSetByUser;
  OpaqueCMTimebase *readOnlyVideoQueueTimebase;
  OpaqueCMTimebase *readOnlyRenderingTimebase;
  opaqueCMFormatDescription *lastFormatDescription;
  OpaqueFigCPECryptor *lastCryptor;
  __CFArray *figVideoTargets;
  objc_super v21;
  os_log_type_t type;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B01F0 >= 3)
  {
    v23 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (self->_isRequestingMediaData)
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("An object conforming to AVQueuedSampleBufferRendering, configured to request more media data via requestMediaDataWhenReadyOnQueue:usingBlock:, was released without first having been messaged stopRequestingMediaData:."), 0));
  -[AVSampleBufferVideoRenderer _callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:](self, "_callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:", 0, 0, 0);
  -[AVSampleBufferVideoRenderer _removeFigVideoQueueListeners](self, "_removeFigVideoQueueListeners");
  error = self->_error;
  if (error)
    CFRelease(error);
  videoQueue = self->_videoQueue;
  if (videoQueue)
  {
    CFRelease(videoQueue);
    self->_videoQueue = 0;
  }
  mediaDataRequester = self->_mediaDataRequester;
  if (mediaDataRequester)
    CFRelease(mediaDataRequester);
  serialQueue = self->_serialQueue;
  if (serialQueue)
    CFRelease(serialQueue);
  videoQueueQueue = self->_videoQueueQueue;
  if (videoQueueQueue)
    CFRelease(videoQueueQueue);
  layerQueue = self->_layerQueue;
  if (layerQueue)
    CFRelease(layerQueue);
  videoPerformanceMetricsQueue = self->_videoPerformanceMetricsQueue;
  if (videoPerformanceMetricsQueue)
    CFRelease(videoPerformanceMetricsQueue);

  flushCallbackListQueue = self->_flushCallbackListQueue;
  if (flushCallbackListQueue)
  {
    dispatch_release(flushCallbackListQueue);
    self->_flushCallbackListQueue = 0;
  }
  flushCallbackQueue = self->_flushCallbackQueue;
  if (flushCallbackQueue)
  {
    dispatch_release(flushCallbackQueue);
    self->_flushCallbackQueue = 0;
  }
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  if (queueForProtectingPrerollCompleteCallback)
  {
    dispatch_release(queueForProtectingPrerollCompleteCallback);
    self->_queueForProtectingPrerollCompleteCallback = 0;
  }
  queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
  if (queueForCallingPrerollCompleteCallback)
  {
    dispatch_release(queueForCallingPrerollCompleteCallback);
    self->_queueForCallingPrerollCompleteCallback = 0;
  }
  controlTimebaseSetByUser = self->_controlTimebaseSetByUser;
  if (controlTimebaseSetByUser)
    CFRelease(controlTimebaseSetByUser);
  readOnlyVideoQueueTimebase = self->_readOnlyVideoQueueTimebase;
  if (readOnlyVideoQueueTimebase)
    CFRelease(readOnlyVideoQueueTimebase);
  readOnlyRenderingTimebase = self->_readOnlyRenderingTimebase;
  if (readOnlyRenderingTimebase)
    CFRelease(readOnlyRenderingTimebase);
  lastFormatDescription = self->_lastFormatDescription;
  if (lastFormatDescription)
    CFRelease(lastFormatDescription);
  lastCryptor = self->_lastCryptor;
  if (lastCryptor)
    CFRelease(lastCryptor);

  if (self->_didFinishSuspensionNotificationToken)
  {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", self->_didFinishSuspensionNotificationToken);

  }
  figVideoTargets = self->_figVideoTargets;
  if (figVideoTargets)
    CFRelease(figVideoTargets);
  v21.receiver = self;
  v21.super_class = (Class)AVSampleBufferVideoRenderer;
  -[AVSampleBufferVideoRenderer dealloc](&v21, sel_dealloc);
}

- (OpaqueCMTimebase)controlTimebase
{
  NSObject *serialQueue;
  OpaqueCMTimebase *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __46__AVSampleBufferVideoRenderer_controlTimebase__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (OpaqueCMTimebase *)(id)v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

CFTypeRef __46__AVSampleBufferVideoRenderer_controlTimebase__block_invoke(uint64_t a1)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(*(_QWORD *)(a1 + 32) + 176);
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setDisplayLayerVisibility:(BOOL)a3
{
  NSObject *layerQueue;
  _QWORD v4[5];
  BOOL v5;

  layerQueue = self->_layerQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke;
  v4[3] = &unk_1E302FD38;
  v4[4] = self;
  v5 = a3;
  dispatch_async(layerQueue, v4);
}

void __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  NSObject *v4;
  _QWORD block[6];
  char v6;
  _QWORD v7[3];
  int v8;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_copyVideoQueue");
  if (v2)
  {
    v3 = (const void *)v2;
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x2020000000;
    v8 = 0;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke_2;
    block[3] = &unk_1E3035038;
    block[4] = v7;
    block[5] = v3;
    v6 = *(_BYTE *)(a1 + 40);
    dispatch_sync(v4, block);
    CFRelease(v3);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:", CFSTR("AVSampleBufferVideoRendererVisibilityDidChangeNotification"), *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "_fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:", CFSTR("AVSampleBufferDisplayLayerVisibilityDidChangeNotification"), 0);
    _Block_object_dispose(v7, 8);
  }
}

uint64_t __57__AVSampleBufferVideoRenderer_setDisplayLayerVisibility___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6428], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  AVSampleBufferRenderSynchronizer **p_weakReferenceToSynchronizer;
  uint64_t v8;
  _BOOL4 v9;
  void *v11;

  v11 = 0;
  p_weakReferenceToSynchronizer = &self->_weakReferenceToSynchronizer;
  if (a3)
  {
    if (objc_loadWeak((id *)&self->_weakReferenceToSynchronizer))
    {
      v8 = AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("The DisplayLayer cannot be added to a Synchronizer when it has already been added to a Synchronizer."), 0));
      LOBYTE(v9) = 0;
      v11 = (void *)v8;
    }
    else
    {
      v9 = -[AVSampleBufferVideoRenderer _setSynchronizerTimebase:error:](self, "_setSynchronizerTimebase:error:", objc_msgSend(a3, "timebase"), &v11);
      if (v9)
      {
        objc_storeWeak((id *)p_weakReferenceToSynchronizer, a3);
        LOBYTE(v9) = 1;
      }
    }
  }
  else
  {
    objc_storeWeak((id *)&self->_weakReferenceToSynchronizer, 0);
    LOBYTE(v9) = -[AVSampleBufferVideoRenderer _setSynchronizerTimebase:error:](self, "_setSynchronizerTimebase:error:", 0, &v11);
  }
  if (a4)
    *a4 = v11;
  return v9;
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  if (a3)
    *a3 = 0;
}

- (void)setSTSLabel:(id)a3
{
  NSObject *serialQueue;
  uint64_t v5;
  _QWORD v6[6];

  serialQueue = self->_serialQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __43__AVSampleBufferVideoRenderer_setSTSLabel___block_invoke;
  v6[3] = &unk_1E302FCE8;
  v6[4] = a3;
  v6[5] = self;
  dispatch_sync(serialQueue, v6);
  v5 = objc_msgSend(MEMORY[0x1E0CB37C0], "notificationWithName:object:", CFSTR("AVSampleBufferSTSLabelDidChangeNotification"), self);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotification:", v5);
}

void __43__AVSampleBufferVideoRenderer_setSTSLabel___block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 320) = *(_QWORD *)(a1 + 32);
}

- (NSString)_STSLabel
{
  NSObject *serialQueue;
  NSString *v3;
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
  v9 = __Block_byref_object_copy__36;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __40__AVSampleBufferVideoRenderer__STSLabel__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (NSString *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __40__AVSampleBufferVideoRenderer__STSLabel__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 320);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (id)_STSLabelPublisher
{
  return +[AVPropertyValuePublisher propertyValuePublisherWithObject:key:notificationName:](AVPropertyValuePublisher, "propertyValuePublisherWithObject:key:notificationName:", self, CFSTR("STSLabel"), CFSTR("AVSampleBufferSTSLabelDidChangeNotification"));
}

- (id)_displayLayer
{
  return objc_loadWeak((id *)&self->_weakDisplayLayer);
}

- (void)setToneMapToStandardDynamicRange:(BOOL)a3
{
  OpaqueFigVideoQueue *v5;
  OpaqueFigVideoQueue *v6;
  NSObject *videoQueueQueue;
  _QWORD block[6];
  BOOL v9;
  _QWORD v10[3];
  int v11;

  v5 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v5)
  {
    v6 = v5;
    v10[0] = 0;
    v10[1] = v10;
    v10[2] = 0x2020000000;
    v11 = 0;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__AVSampleBufferVideoRenderer_setToneMapToStandardDynamicRange___block_invoke;
    block[3] = &unk_1E3035038;
    block[4] = v10;
    block[5] = v6;
    v9 = a3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
    _Block_object_dispose(v10, 8);
  }
}

uint64_t __64__AVSampleBufferVideoRenderer_setToneMapToStandardDynamicRange___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6468], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setReadyForDisplayWithoutKVO:(BOOL)a3
{
  NSObject *serialQueue;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  _QWORD block[6];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__AVSampleBufferVideoRenderer_setReadyForDisplayWithoutKVO___block_invoke;
  block[3] = &unk_1E3035060;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v9 + 24))
    -[AVSampleBufferVideoRenderer _fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:](self, "_fireDisplayLayerNotificationNowThenReleaseOnMainThread:userInfo:", CFSTR("AVSampleBufferDisplayLayerReadyForDisplayDidChangeNotification"), 0);
  if (dword_1EE2B01F0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  _Block_object_dispose(&v8, 8);
}

uint64_t __60__AVSampleBufferVideoRenderer_setReadyForDisplayWithoutKVO___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(unsigned __int8 *)(*(_QWORD *)(result + 32) + 120) != *(unsigned __int8 *)(result + 48);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 120) = *(_BYTE *)(result + 48);
  return result;
}

- (BOOL)isReadyForDisplay
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVSampleBufferVideoRenderer_isReadyForDisplay__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__AVSampleBufferVideoRenderer_isReadyForDisplay__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 120);
  return result;
}

- (void)setContentKeySession:(id)a3
{
  NSObject *serialQueue;
  _QWORD v4[6];

  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__AVSampleBufferVideoRenderer_setContentKeySession___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(serialQueue, v4);
}

id __52__AVSampleBufferVideoRenderer_setContentKeySession___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
}

- (int)attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  NSObject *serialQueue;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __115__AVSampleBufferVideoRenderer_attachToContentKeySession_contentKeyBoss_failedSinceAlreadyAttachedToAnotherSession___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v9;
  dispatch_sync(serialQueue, block);
  if (a5)
    *a5 = *((_BYTE *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return 0;
}

id __115__AVSampleBufferVideoRenderer_attachToContentKeySession_contentKeyBoss_failedSinceAlreadyAttachedToAnotherSession___block_invoke(uint64_t a1)
{
  id result;
  char v3;

  result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 296));
  if (result)
  {
    v3 = 1;
  }
  else
  {
    result = objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 296), *(id *)(a1 + 40));
    v3 = 0;
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;
  return result;
}

- (BOOL)attachedToExternalContentKeySession
{
  NSObject *serialQueue;
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __66__AVSampleBufferVideoRenderer_attachedToExternalContentKeySession__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __66__AVSampleBufferVideoRenderer_attachedToExternalContentKeySession__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 296));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result != 0;
  return result;
}

- (void)removeDisplayLayer
{
  OpaqueFigVideoQueue *v3;
  OpaqueFigVideoQueue *v4;
  NSObject *videoQueueQueue;
  _QWORD block[5];

  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    v4 = v3;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AVSampleBufferVideoRenderer_removeDisplayLayer__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v4;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v4);
  }
}

uint64_t __49__AVSampleBufferVideoRenderer_removeDisplayLayer__block_invoke()
{
  uint64_t CMBaseObject;
  uint64_t result;
  uint64_t (*v2)(uint64_t, _QWORD, _QWORD);

  CMBaseObject = FigVideoQueueGetCMBaseObject();
  result = CMBaseObjectGetVTable();
  v2 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(result + 8) + 56);
  if (v2)
    return v2(CMBaseObject, *MEMORY[0x1E0CC6420], 0);
  return result;
}

- (id)contentKeySession
{
  NSObject *serialQueue;
  void *v3;
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
  v9 = __Block_byref_object_copy__36;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__AVSampleBufferVideoRenderer_contentKeySession__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __48__AVSampleBufferVideoRenderer_contentKeySession__block_invoke(uint64_t a1)
{
  id result;

  result = objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 296));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)isReadyForMoreMediaData
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__AVSampleBufferVideoRenderer_isReadyForMoreMediaData__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

const __CFArray *__54__AVSampleBufferVideoRenderer_isReadyForMoreMediaData__block_invoke(const __CFArray *result)
{
  uint64_t v1;
  const __CFArray *v2;

  *(_BYTE *)(*(_QWORD *)(*((_QWORD *)result + 5) + 8) + 24) = *(_BYTE *)(*((_QWORD *)result + 4) + 121) ^ 1;
  v1 = *((_QWORD *)result + 4);
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = result;
    result = *(const __CFArray **)(v1 + 56);
    if (!result || (result = (const __CFArray *)CFArrayGetCount(result)) == 0)
      *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v2 + 5) + 8) + 24) = 0;
  }
  return result;
}

+ (BOOL)automaticallyNotifiesObserversForKey:(id)a3
{
  objc_super v6;

  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("outputObscuredDueToInsufficientExternalProtection")) & 1) != 0)
    return 0;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___AVSampleBufferVideoRenderer;
  return objc_msgSendSuper2(&v6, sel_automaticallyNotifiesObserversForKey_, a3);
}

- (id)_statusString:(int64_t)a3
{
  if ((unint64_t)a3 > 2)
    return CFSTR("Invalid");
  else
    return off_1E3035260[a3];
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  NSObject *serialQueue;
  AVQueuedSampleBufferRenderingStatus v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37__AVSampleBufferVideoRenderer_status__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __37__AVSampleBufferVideoRenderer_status__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

- (NSError)error
{
  NSObject *serialQueue;
  NSError *v3;
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
  v9 = __Block_byref_object_copy__36;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __36__AVSampleBufferVideoRenderer_error__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (NSError *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__AVSampleBufferVideoRenderer_error__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "copy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (OpaqueCMTimebase)timebase
{
  return self->_readOnlyVideoQueueTimebase;
}

- (int)_enqueueSingleSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4
{
  uint64_t v7;
  NSObject *serialQueue;
  uint64_t v9;
  NSObject *v10;
  OpaqueFigVideoQueue *v11;
  NSObject *videoQueueQueue;
  int v13;
  _QWORD v15[8];
  CMTime v16;
  int v17;
  _QWORD v18[5];
  CMTime v19;
  CMTime time2;
  CMTime time1;
  _QWORD block[7];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void *v30;
  __int128 v31;
  uint64_t v32;

  v27 = 0;
  v28 = &v27;
  v29 = 0x3810000000;
  v31 = *MEMORY[0x1E0CA2E18];
  v7 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  v30 = &unk_1935931BF;
  v32 = v7;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  serialQueue = self->_serialQueue;
  v9 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v27;
  block[6] = &v23;
  dispatch_sync(serialQueue, block);
  if (*((_DWORD *)v24 + 6) >= 2u)
  {
    memset(&v16, 0, sizeof(v16));
    CMSampleBufferGetOutputPresentationTimeStamp(&v16, a3);
    time1 = v16;
    time2 = *(CMTime *)(v28 + 4);
    CMTimeCompare(&time1, &time2);
    if (*((_DWORD *)v24 + 6) == 2)
    {
      v10 = self->_serialQueue;
      v18[0] = v9;
      v18[1] = 3221225472;
      v18[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_2;
      v18[3] = &unk_1E3031E68;
      v19 = v16;
      v18[4] = self;
      dispatch_sync(v10, v18);
    }
  }
  v16.value = 0;
  *(_QWORD *)&v16.timescale = &v16;
  v16.epoch = 0x2020000000;
  v17 = 0;
  v11 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v11)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v15[0] = v9;
    v15[1] = 3221225472;
    v15[2] = __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_3;
    v15[3] = &unk_1E3035088;
    v15[4] = &v16;
    v15[5] = v11;
    v15[6] = a3;
    v15[7] = a4;
    dispatch_sync(videoQueueQueue, v15);
    CFRelease(v11);
  }
  v13 = *(_DWORD *)(*(_QWORD *)&v16.timescale + 24);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v27, 8);
  return v13;
}

__n128 __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke(_QWORD *a1)
{
  __n128 *v1;
  __n128 result;

  v1 = *(__n128 **)(a1[5] + 8);
  result = *(__n128 *)(a1[4] + 268);
  v1[3].n128_u64[0] = *(_QWORD *)(a1[4] + 284);
  v1[2] = result;
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_DWORD *)(a1[4] + 264);
  return result;
}

__n128 __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_2(uint64_t a1)
{
  __n128 *v1;
  __n128 result;

  v1 = (__n128 *)(*(_QWORD *)(a1 + 32) + 268);
  result = *(__n128 *)(a1 + 40);
  v1[1].n128_u64[0] = *(_QWORD *)(a1 + 56);
  *v1 = result;
  return result;
}

uint64_t __79__AVSampleBufferVideoRenderer__enqueueSingleSampleBuffer_bufferEnqueueingInfo___block_invoke_3(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  double *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  uint64_t (*v13)(uint64_t, uint64_t, _QWORD, double, double, double, double, double, double, double, double);
  uint64_t result;

  v2 = a1[5];
  v3 = a1[6];
  v4 = (double *)a1[7];
  v5 = *v4;
  v6 = v4[1];
  v7 = v4[2];
  v8 = v4[3];
  v9 = v4[4];
  v10 = v4[5];
  v12 = v4[6];
  v11 = v4[7];
  v13 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD, double, double, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v13)
    result = v13(v2, v3, 0, v5, v6, v7, v8, v9, v10, v12, v11);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

- ($8A865F3275AFFA793BA84D73056FEF19)_computeSampleBufferEnqueueingInfoForSampleBuffer:(SEL)a3
{
  const opaqueCMFormatDescription *FormatDescription;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  NSObject *serialQueue;
  void (*v12)(_QWORD);
  CGPoint origin;
  CGSize size;
  CGSize v15;
  CGSize v16;
  CGSize v17;
  $8A865F3275AFFA793BA84D73056FEF19 *result;
  void (*v19[5])(_QWORD);
  CGPoint v20;
  CGSize v21;
  CGPoint v22;
  CGSize v23;
  _QWORD block[6];
  CGPoint v25;
  CGSize v26;
  CGPoint v27;
  CGSize v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  FormatDescription = CMSampleBufferGetFormatDescription(a4);
  retstr->var0.origin = 0u;
  retstr->var0.size = 0u;
  retstr->var1.origin = 0u;
  retstr->var1.size = 0u;
  retstr->var0.size = CMVideoFormatDescriptionGetPresentationDimensions(FormatDescription, 1u, 1u);
  +[AVSampleBufferDisplayLayer _destRectForAspectRatio:](AVSampleBufferDisplayLayer, "_destRectForAspectRatio:");
  retstr->var1.origin.x = v7;
  retstr->var1.origin.y = v8;
  retstr->var1.size.width = v9;
  retstr->var1.size.height = v10;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  serialQueue = self->_serialQueue;
  v12 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke;
  block[3] = &unk_1E30350B0;
  origin = retstr->var0.origin;
  size = retstr->var0.size;
  v15 = retstr->var1.size;
  v27 = retstr->var1.origin;
  v28 = v15;
  v25 = origin;
  v26 = size;
  block[4] = self;
  block[5] = &v29;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v30 + 24))
  {
    v19[1] = (void (*)(_QWORD))3221225472;
    v16 = retstr->var0.size;
    v20 = retstr->var0.origin;
    v21 = v16;
    v17 = retstr->var1.size;
    v22 = retstr->var1.origin;
    v23 = v17;
    v19[0] = v12;
    v19[2] = __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke_2;
    v19[3] = (void (*)(_QWORD))&unk_1E30350D8;
    v19[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v19);
  }
  _Block_object_dispose(&v29, 8);
  return result;
}

__n128 __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  uint64_t v4;
  __int128 v5;

  v2 = a1 + 48;
  if (!CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(a1 + 32) + 64), *(CGRect *)(a1 + 48)))
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v4 = *(_QWORD *)(a1 + 32);
    result = *(__n128 *)v2;
    v5 = *(_OWORD *)(v2 + 16);
    *(_OWORD *)(v4 + 64) = *(_OWORD *)v2;
    *(_OWORD *)(v4 + 80) = v5;
  }
  return result;
}

void __81__AVSampleBufferVideoRenderer__computeSampleBufferEnqueueingInfoForSampleBuffer___block_invoke_2(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(objc_loadWeak((id *)(*(_QWORD *)(a1 + 32) + 40)), "_updatePresentationSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  objc_autoreleasePoolPop(v2);
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *serialQueue;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFArray *figVideoTargets;
  void *v13;
  _OWORD v14[4];
  _QWORD block[6];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__AVSampleBufferVideoRenderer_enqueueSampleBuffer___block_invoke;
  block[3] = &unk_1E302FD60;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v17 + 24))
  {
    if (CMSampleBufferGetFormatDescription(a3))
    {
      -[AVSampleBufferVideoRenderer _computeSampleBufferEnqueueingInfoForSampleBuffer:](self, "_computeSampleBufferEnqueueingInfoForSampleBuffer:", a3, 0, 0, 0, 0, 0, 0, 0, 0);
      -[AVSampleBufferVideoRenderer enqueueSampleBuffer:bufferEnqueueingInfo:](self, "enqueueSampleBuffer:bufferEnqueueingInfo:", a3, v14);
    }
  }
  else
  {
    figVideoTargets = self->_figVideoTargets;
    if ((!figVideoTargets || CFArrayGetCount(figVideoTargets) <= 0) && !self->_shouldWaitForVideoTarget)
    {
      v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("An AVSampleBufferDisplayLayer or video target must be added to the AVSampleBufferVideoRenderer prior to enqueueing sample buffers."), v7, v8, v9, v10, v11, *(uint64_t *)&v14[0]), 0);
      objc_exception_throw(v13);
    }
    memset(v14, 0, sizeof(v14));
    -[AVSampleBufferVideoRenderer enqueueSampleBuffer:bufferEnqueueingInfo:](self, "enqueueSampleBuffer:bufferEnqueueingInfo:", a3, v14);
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __51__AVSampleBufferVideoRenderer_enqueueSampleBuffer___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3 bufferEnqueueingInfo:(id *)a4
{
  opaqueCMFormatDescription *FormatDescription;
  opaqueCMFormatDescription *lastFormatDescription;
  OpaqueFigCPECryptor *lastCryptor;
  CFTypeRef v10;
  NSObject *serialQueue;
  _QWORD refcon[2];
  _QWORD block[5];
  CFTypeRef cf;
  uint64_t v15;

  v15 = 0;
  cf = 0;
  if (-[AVSampleBufferVideoRenderer status](self, "status") == AVQueuedSampleBufferRenderingStatusFailed)
    return;
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (objc_loadWeak((id *)&self->_weakContentKeySession))
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    if (self->_lastCryptor && FigCFEqual())
    {
      FigSampleBufferSetDecryptor();
    }
    else
    {
      lastFormatDescription = self->_lastFormatDescription;
      self->_lastFormatDescription = FormatDescription;
      if (FormatDescription)
        CFRetain(FormatDescription);
      if (lastFormatDescription)
        CFRelease(lastFormatDescription);
      if (!objc_msgSend(objc_loadWeak((id *)&self->_weakContentKeySession), "copyCryptorForFormatDescription:cryptorOut:errorOut:", FormatDescription, &cf, &v15))goto LABEL_20;
      lastCryptor = self->_lastCryptor;
      v10 = cf;
      self->_lastCryptor = (OpaqueFigCPECryptor *)cf;
      if (v10)
        CFRetain(v10);
      if (lastCryptor)
        CFRelease(lastCryptor);
      FigSampleBufferSetDecryptor();
      if (cf)
      {
        CFRelease(cf);
        cf = 0;
      }
    }
  }
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__AVSampleBufferVideoRenderer_enqueueSampleBuffer_bufferEnqueueingInfo___block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 1, 0);
  refcon[0] = self;
  refcon[1] = a4;
  CMSampleBufferCallForEachSample(a3, (OSStatus (__cdecl *)(CMSampleBufferRef, CMItemCount, void *))_enqueueSingleSampleBufferStatic, refcon);
  -[AVSampleBufferVideoRenderer _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel");
LABEL_20:
  if (cf)
    CFRelease(cf);
  if (v15)
    -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 2);
}

uint64_t __72__AVSampleBufferVideoRenderer_enqueueSampleBuffer_bufferEnqueueingInfo___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 109) = 1;
  return result;
}

- (void)flush
{
  -[AVSampleBufferVideoRenderer flushWithRemovalOfDisplayedImage:completionHandler:](self, "flushWithRemovalOfDisplayedImage:completionHandler:", 0, 0);
}

- (void)flushAndRemoveImage
{
  -[AVSampleBufferVideoRenderer flushWithRemovalOfDisplayedImage:completionHandler:](self, "flushWithRemovalOfDisplayedImage:completionHandler:", 1, 0);
}

- (void)flushWithRemovalOfDisplayedImage:(BOOL)removeDisplayedImage completionHandler:(void *)handler
{
  _BOOL4 v5;
  uint64_t v7;
  NSObject *serialQueue;
  NSObject *flushCallbackListQueue;
  int v10;
  NSObject *v11;
  OpaqueFigVideoQueue *v12;
  NSObject *videoQueueQueue;
  int v14;
  int v15;
  NSObject *v16;
  NSObject *v17;
  CFTypeRef v18;
  uint64_t *v19;
  int v20;
  _QWORD v21[6];
  int v22;
  _QWORD v23[6];
  CFTypeRef cf;
  _QWORD v25[6];
  int v26;
  _QWORD v27[5];
  _QWORD v28[6];
  _QWORD block[5];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v5 = removeDisplayedImage;
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  v7 = MEMORY[0x1E0C809B0];
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  -[AVSampleBufferVideoRenderer setReadyForDisplayWithoutKVO:](self, "setReadyForDisplayWithoutKVO:", 0);
  -[AVSampleBufferVideoRenderer _callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:](self, "_callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:", 0, 0, 0);
  if (handler)
  {
    flushCallbackListQueue = self->_flushCallbackListQueue;
    v28[0] = v7;
    v28[1] = 3221225472;
    v28[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_2;
    v28[3] = &unk_1E3032448;
    v28[4] = self;
    v28[5] = handler;
    dispatch_sync(flushCallbackListQueue, v28);
    v10 = 2;
    if (!v5)
      goto LABEL_4;
    goto LABEL_3;
  }
  v10 = 0;
  if (v5)
  {
LABEL_3:
    v10 |= 1u;
    v11 = self->_serialQueue;
    v27[0] = v7;
    v27[1] = 3221225472;
    v27[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_3;
    v27[3] = &unk_1E302FA10;
    v27[4] = self;
    dispatch_sync(v11, v27);
  }
LABEL_4:
  v12 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v12)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v25[0] = v7;
    v25[1] = 3221225472;
    v25[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_4;
    v25[3] = &unk_1E3035100;
    v25[4] = &v30;
    v25[5] = v12;
    v26 = v10;
    dispatch_sync(videoQueueQueue, v25);
    CFRelease(v12);
  }
  if (!-[AVSampleBufferVideoRenderer _createVideoQueueFailed](self, "_createVideoQueueFailed"))
  {
    v14 = *((_DWORD *)v31 + 6);
    if (v14 != -12083 && v14 != -12785)
      goto LABEL_24;
  }
  -[AVSampleBufferVideoRenderer _removeFigVideoQueueListeners](self, "_removeFigVideoQueueListeners");
  cf = 0;
  v15 = objc_msgSend(-[AVSampleBufferVideoRenderer currentFigVideoQueueFactory](self, "currentFigVideoQueueFactory"), "createVideoQueue:", &cf);
  *((_DWORD *)v31 + 6) = v15;
  if (!v15)
  {
    v16 = self->_serialQueue;
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_5;
    v23[3] = &unk_1E302FE78;
    v23[4] = self;
    v23[5] = cf;
    dispatch_sync(v16, v23);
  }
  -[AVSampleBufferVideoRenderer _addFigVideoQueueListeners](self, "_addFigVideoQueueListeners");
  -[AVSampleBufferVideoRenderer _resetStatusWithOSStatus:](self, "_resetStatusWithOSStatus:", *((unsigned int *)v31 + 6));
  -[AVSampleBufferVideoRenderer _setCreateVideoQueueFailedWithOSStatus:](self, "_setCreateVideoQueueFailedWithOSStatus:", *((unsigned int *)v31 + 6));
  if (cf)
  {
    v17 = self->_videoQueueQueue;
    v21[0] = v7;
    v21[1] = 3221225472;
    v21[2] = __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_6;
    v21[3] = &unk_1E3035100;
    v21[4] = &v30;
    v21[5] = cf;
    v22 = v10;
    dispatch_sync(v17, v21);
    v18 = cf;
    if (!handler)
      goto LABEL_22;
    v19 = v31;
    if (cf)
    {
      v20 = *((_DWORD *)v31 + 6);
      if (!v20)
        goto LABEL_23;
      goto LABEL_21;
    }
  }
  else
  {
    if (!handler)
      goto LABEL_24;
    v19 = v31;
  }
  v20 = *((_DWORD *)v19 + 6);
LABEL_21:
  -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 2, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), v20, 0));
  -[AVSampleBufferVideoRenderer _flushComplete](self, "_flushComplete");
  v18 = cf;
LABEL_22:
  if (v18)
LABEL_23:
    CFRelease(v18);
LABEL_24:
  -[AVSampleBufferVideoRenderer _setRequiresFlushToResumeDecoding:](self, "_setRequiresFlushToResumeDecoding:", 0);
  -[AVSampleBufferVideoRenderer _refreshAboveHighWaterLevel](self, "_refreshAboveHighWaterLevel");
  -[AVSampleBufferVideoRenderer resetUpcomingSampleBufferPresentationTimeExpectations](self, "resetUpcomingSampleBufferPresentationTimeExpectations");
  _Block_object_dispose(&v30, 8);
}

__n128 __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  __n128 result;
  __int128 v3;

  v1 = *(_QWORD *)(a1 + 32);
  result = *(__n128 *)MEMORY[0x1E0C9D648];
  v3 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)(v1 + 64) = *MEMORY[0x1E0C9D648];
  *(_OWORD *)(v1 + 80) = v3;
  return result;
}

void __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  v2 = (id)objc_msgSend(*(id *)(a1 + 40), "copy");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "addObject:", v2);

}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_3(uint64_t a1)
{
  void *v1;
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (result)
  {
    v3 = result;
    v4 = *(_QWORD *)v7;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v7 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * v5++), "_resetLastImageTime");
      }
      while (v3 != v5);
      result = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v4)
    result = v4(v2, v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_5(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = v1;
  if (v1)
    CFRetain(v1);
  if (v3)
    CFRelease(v3);
}

uint64_t __82__AVSampleBufferVideoRenderer_flushWithRemovalOfDisplayedImage_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned int *)(a1 + 48);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v4)
    result = v4(v2, v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_flushComplete
{
  NSObject *flushCallbackListQueue;
  void *v4;
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
  v9 = __Block_byref_object_copy__70;
  v10 = __Block_byref_object_dispose__71;
  v11 = 0;
  flushCallbackListQueue = self->_flushCallbackListQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__AVSampleBufferVideoRenderer__flushComplete__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(flushCallbackListQueue, v5);
  v4 = (void *)v7[5];
  if (v4)
  {
    dispatch_async((dispatch_queue_t)self->_flushCallbackQueue, v4);

  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __45__AVSampleBufferVideoRenderer__flushComplete__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  id v4;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "count");
  if (result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "objectAtIndex:", 0);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
    v3 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v3)
    {
      v4 = v3;
      return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 224), "removeObjectAtIndex:", 0);
    }
  }
  return result;
}

- (void)_callOldPrerollCompletionHandlerWithSuccess:(BOOL)a3 andSetNewPrerollCompletionHandler:(id)a4 forRequestID:(int)a5
{
  NSObject *queueForProtectingPrerollCompleteCallback;
  uint64_t v8;
  NSObject *queueForCallingPrerollCompleteCallback;
  _QWORD v10[5];
  BOOL v11;
  _QWORD block[7];
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy__70;
  v18 = __Block_byref_object_dispose__71;
  v19 = 0;
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  v8 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke;
  block[3] = &unk_1E3035128;
  block[5] = a4;
  block[6] = &v14;
  block[4] = self;
  v13 = a5;
  dispatch_sync(queueForProtectingPrerollCompleteCallback, block);
  if (v15[5])
  {
    queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke_2;
    v10[3] = &unk_1E3035150;
    v10[4] = &v14;
    v11 = a3;
    dispatch_async(queueForCallingPrerollCompleteCallback, v10);
  }
  _Block_object_dispose(&v14, 8);
}

void *__122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240);
  if (v2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v2;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = 0;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 248) = 0;
  }
  result = *(void **)(a1 + 40);
  if (result)
  {
    result = _Block_copy(result);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = result;
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 248) = *(_DWORD *)(a1 + 56);
  }
  return result;
}

void __122__AVSampleBufferVideoRenderer__callOldPrerollCompletionHandlerWithSuccess_andSetNewPrerollCompletionHandler_forRequestID___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
  _Block_release(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)_completedDecodeForPrerollForRequestID:(int)a3
{
  NSObject *queueForProtectingPrerollCompleteCallback;
  uint64_t v5;
  NSObject *queueForCallingPrerollCompleteCallback;
  _QWORD v7[5];
  _QWORD block[6];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__70;
  v14 = __Block_byref_object_dispose__71;
  v15 = 0;
  queueForProtectingPrerollCompleteCallback = self->_queueForProtectingPrerollCompleteCallback;
  v5 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke;
  block[3] = &unk_1E3032018;
  v9 = a3;
  block[4] = self;
  block[5] = &v10;
  dispatch_sync(queueForProtectingPrerollCompleteCallback, block);
  if (v11[5])
  {
    queueForCallingPrerollCompleteCallback = self->_queueForCallingPrerollCompleteCallback;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke_2;
    v7[3] = &unk_1E3031C38;
    v7[4] = &v10;
    dispatch_async(queueForCallingPrerollCompleteCallback, v7);
  }
  _Block_object_dispose(&v10, 8);
}

uint64_t __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 240);
  if (v2)
  {
    if (*(_DWORD *)(result + 48) == *(_DWORD *)(v1 + 248))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = v2;
      *(_QWORD *)(*(_QWORD *)(result + 32) + 240) = 0;
    }
  }
  return result;
}

void __70__AVSampleBufferVideoRenderer__completedDecodeForPrerollForRequestID___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) + 16))();
  _Block_release(*(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
}

- (void)prerollDecodeWithCompletionHandler:(id)a3
{
  uint64_t v5;
  OpaqueFigVideoQueue *v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *videoQueueQueue;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD block[6];
  int v13;
  os_log_type_t type;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v5 = FigAtomicIncrement32();
  -[AVSampleBufferVideoRenderer _callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:](self, "_callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:", 0, a3, v5);
  v6 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (!v6)
    goto LABEL_5;
  if (dword_1EE2B01F0)
  {
    v15 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  videoQueueQueue = self->_videoQueueQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__AVSampleBufferVideoRenderer_prerollDecodeWithCompletionHandler___block_invoke;
  block[3] = &unk_1E3035100;
  block[4] = &v16;
  block[5] = v6;
  v13 = v5;
  dispatch_sync(videoQueueQueue, block);
  v9 = *((_DWORD *)v17 + 6);
  CFRelease(v6);
  if (v9)
LABEL_5:
    -[AVSampleBufferVideoRenderer _callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:](self, "_callOldPrerollCompletionHandlerWithSuccess:andSetNewPrerollCompletionHandler:forRequestID:", 0, 0, 0, v10, v11);
  _Block_object_dispose(&v16, 8);
}

uint64_t __66__AVSampleBufferVideoRenderer_prerollDecodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t (*v4)(uint64_t, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(a1 + 48));
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
  if (v4)
    result = v4(v2, v3);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *serialQueue;
  void *v12;
  uint64_t v13;
  const char *v14;
  void *v15;
  AVMediaDataRequester *v16;
  _QWORD block[6];

  if (!a3)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "queue != NULL";
    goto LABEL_6;
  }
  if (!a4)
  {
    v12 = (void *)MEMORY[0x1E0C99DA0];
    v13 = *MEMORY[0x1E0C99778];
    v14 = "block != nil";
LABEL_6:
    v15 = (void *)objc_msgSend(v12, "exceptionWithName:reason:userInfo:", v13, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v14), 0);
    objc_exception_throw(v15);
  }
  -[AVSampleBufferVideoRenderer stopRequestingMediaData](self, "stopRequestingMediaData");
  v16 = -[AVMediaDataRequester initWithMediaDataConsumer:requestQueue:requestBlock:]([AVMediaDataRequester alloc], "initWithMediaDataConsumer:requestQueue:requestBlock:", self, a3, a4);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__AVSampleBufferVideoRenderer_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = v16;
  dispatch_sync(serialQueue, block);
  -[AVMediaDataRequester startRequestingMediaData](v16, "startRequestingMediaData");

}

id __75__AVSampleBufferVideoRenderer_requestMediaDataWhenReadyOnQueue_usingBlock___block_invoke(uint64_t a1)
{
  id result;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 110) = 1;
  result = *(id *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = result;
  return result;
}

- (void)stopRequestingMediaData
{
  NSObject *serialQueue;
  _QWORD v3[6];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t);
  void (*v8)(uint64_t);
  uint64_t v9;

  v4 = 0;
  v5 = &v4;
  v6 = 0x3052000000;
  v7 = __Block_byref_object_copy__36;
  v8 = __Block_byref_object_dispose__36;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__AVSampleBufferVideoRenderer_stopRequestingMediaData__block_invoke;
  v3[3] = &unk_1E302FDB0;
  v3[4] = self;
  v3[5] = &v4;
  dispatch_sync(serialQueue, v3);
  objc_msgSend((id)v5[5], "invalidate");

  _Block_object_dispose(&v4, 8);
}

uint64_t __54__AVSampleBufferVideoRenderer_stopRequestingMediaData__block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 110))
  {
    *(_BYTE *)(v1 + 110) = 0;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(result + 32) + 112);
    *(_QWORD *)(*(_QWORD *)(result + 32) + 112) = 0;
  }
  return result;
}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  AVSampleBufferVideoRenderer *v2;
  NSObject *serialQueue;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v2 = self;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v9 = !-[AVSampleBufferVideoRenderer isReadyForMoreMediaData](self, "isReadyForMoreMediaData");
  serialQueue = v2->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __77__AVSampleBufferVideoRenderer_hasSufficientMediaDataForReliablePlaybackStart__block_invoke;
  v5[3] = &unk_1E302FDB0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  LOBYTE(v2) = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

const __CFArray *__77__AVSampleBufferVideoRenderer_hasSufficientMediaDataForReliablePlaybackStart__block_invoke(const __CFArray *result)
{
  uint64_t v1;
  const __CFArray *v2;

  v1 = *((_QWORD *)result + 4);
  if (!*(_BYTE *)(v1 + 48))
  {
    v2 = result;
    result = *(const __CFArray **)(v1 + 56);
    if (!result || (result = (const __CFArray *)CFArrayGetCount(result)) == 0)
      *(_BYTE *)(*(_QWORD *)(*((_QWORD *)v2 + 5) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)requiresFlushToResumeDecoding
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __60__AVSampleBufferVideoRenderer_requiresFlushToResumeDecoding__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __60__AVSampleBufferVideoRenderer_requiresFlushToResumeDecoding__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 106);
  return result;
}

- (void)addSampleBufferDisplayLayer:(id)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *serialQueue;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  OpaqueFigVideoQueue *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _QWORD block[7];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;

  if (-[AVSampleBufferVideoRenderer _hasEverEnqueued](self, "_hasEverEnqueued")
    && !-[AVSampleBufferVideoRenderer shouldWaitForVideoTarget](self, "shouldWaitForVideoTarget"))
  {
    v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot add AVSampleBufferDisplayLayer while enqueueing sample buffers."), v6, v7, v8, v9, v10, v20), 0);
    objc_exception_throw(v19);
  }
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer_addSampleBufferDisplayLayer___block_invoke;
  block[3] = &unk_1E3035178;
  block[5] = a3;
  block[6] = &v22;
  block[4] = self;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v23 + 24))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("An AVSampleBufferDisplayLayer is already attached to the AVSampleBufferVideoRenderer.  Only 1 is allowed at a time."), v12, v13, v14, v15, v16, v20), 0);
    objc_exception_throw(v18);
  }
  v17 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v17)
  {
    -[AVSampleBufferVideoRenderer _setContentLayerOnFigVideoQueue:](self, "_setContentLayerOnFigVideoQueue:", v17);
    CFRelease(v17);
  }
  _Block_object_dispose(&v22, 8);
}

id *__59__AVSampleBufferVideoRenderer_addSampleBufferDisplayLayer___block_invoke(id *result)
{
  id *v1;
  id *v2;

  v1 = result;
  v2 = (id *)result[4];
  if (*((_BYTE *)v2 + 48))
  {
    *(_BYTE *)(*((_QWORD *)result[6] + 1) + 24) = 1;
  }
  else
  {
    result = (id *)objc_storeWeak(v2 + 5, result[5]);
    *((_BYTE *)v1[4] + 48) = 1;
  }
  return result;
}

- (BOOL)shouldWaitForVideoTarget
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__AVSampleBufferVideoRenderer_shouldWaitForVideoTarget__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__AVSampleBufferVideoRenderer_shouldWaitForVideoTarget__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 108);
  return result;
}

- (void)setShouldWaitForVideoTarget:(BOOL)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  OpaqueFigVideoQueue *v7;
  NSObject *videoQueueQueue;
  _QWORD v9[6];
  BOOL v10;
  _QWORD v11[3];
  int v12;
  _QWORD block[6];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke;
  block[3] = &unk_1E3031820;
  v14 = a3;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v7 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    if (v7)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke_2;
      v9[3] = &unk_1E3035038;
      v9[4] = v11;
      v9[5] = v7;
      v10 = a3;
      dispatch_sync(videoQueueQueue, v9);
      CFRelease(v7);
    }
    _Block_object_dispose(v11, 8);
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 108) != v2)
  {
    *(_BYTE *)(v1 + 108) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __59__AVSampleBufferVideoRenderer_setShouldWaitForVideoTarget___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6460], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_updateVideoTargetsOnVideoQueue
{
  OpaqueFigVideoQueue *v3;
  OpaqueFigVideoQueue *v4;
  NSObject *serialQueue;
  uint64_t v6;
  NSObject *videoQueueQueue;
  _QWORD v8[7];
  _QWORD v9[3];
  int v10;
  _QWORD block[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    v4 = v3;
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    serialQueue = self->_serialQueue;
    v6 = MEMORY[0x1E0C809B0];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke;
    block[3] = &unk_1E302FD60;
    block[4] = self;
    block[5] = &v12;
    dispatch_sync(serialQueue, block);
    if (v13[3])
    {
      v9[0] = 0;
      v9[1] = v9;
      v9[2] = 0x2020000000;
      v10 = 0;
      videoQueueQueue = self->_videoQueueQueue;
      v8[0] = v6;
      v8[1] = 3221225472;
      v8[2] = __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke_2;
      v8[3] = &unk_1E3031F48;
      v8[5] = &v12;
      v8[6] = v4;
      v8[4] = v9;
      dispatch_sync(videoQueueQueue, v8);
      CFRelease((CFTypeRef)v13[3]);
      _Block_object_dispose(v9, 8);
    }
    CFRelease(v4);
    _Block_object_dispose(&v12, 8);
  }
}

uint64_t __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = FigCFArrayCreateMutableCopy();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __62__AVSampleBufferVideoRenderer__updateVideoTargetsOnVideoQueue__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6478], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)addVideoTarget:(OpaqueFigVideoTarget *)a3
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *serialQueue;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _QWORD block[7];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  if (-[AVSampleBufferVideoRenderer _hasEverEnqueued](self, "_hasEverEnqueued")
    && !-[AVSampleBufferVideoRenderer shouldWaitForVideoTarget](self, "shouldWaitForVideoTarget"))
  {
    v18 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Cannot add video target while enqueueing sample buffers."), v6, v7, v8, v9, v10, v19), 0);
    objc_exception_throw(v18);
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__AVSampleBufferVideoRenderer_addVideoTarget___block_invoke;
    block[3] = &unk_1E3031868;
    block[5] = &v21;
    block[6] = a3;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    if (*((_BYTE *)v22 + 24))
    {
      v17 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The FigVideoTarget is already attached to the AVSampleBufferVideoRenderer."), v12, v13, v14, v15, v16, v19), 0);
      objc_exception_throw(v17);
    }
    -[AVSampleBufferVideoRenderer _updateVideoTargetsOnVideoQueue](self, "_updateVideoTargetsOnVideoQueue");
  }
  _Block_object_dispose(&v21, 8);
}

void __46__AVSampleBufferVideoRenderer_addVideoTarget___block_invoke(uint64_t a1)
{
  CFIndex v2;
  const __CFArray *Count;
  const void *v4;
  const void *ValueAtIndex;

  v2 = 0;
  while (1)
  {
    Count = *(const __CFArray **)(*(_QWORD *)(a1 + 32) + 56);
    if (Count)
      Count = (const __CFArray *)CFArrayGetCount(Count);
    if (v2 >= (uint64_t)Count)
      break;
    v4 = *(const void **)(a1 + 48);
    ValueAtIndex = CFArrayGetValueAtIndex(*(CFArrayRef *)(*(_QWORD *)(a1 + 32) + 56), v2++);
    if (v4 == ValueAtIndex)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
      break;
    }
  }
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    CFArrayAppendValue(*(CFMutableArrayRef *)(*(_QWORD *)(a1 + 32) + 56), *(const void **)(a1 + 48));
}

- (int)_setContentLayerOnFigVideoQueue:(OpaqueFigVideoQueue *)a3
{
  OpaqueFigVideoQueue *v3;
  void *v5;
  id WeakRetained;
  id v7;
  uint64_t v8;
  void (*v9)(_QWORD);
  void (*v10)(_QWORD);
  _QWORD block[5];
  void (*v13[8])(_QWORD);
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v3 = a3;
  if (a3)
  {
    v5 = (void *)MEMORY[0x1940343FC](self, a2);
    WeakRetained = objc_loadWeakRetained((id *)&self->_weakDisplayLayer);
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = objc_msgSend(WeakRetained, "_contentLayer");
      v9 = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
      if (v8)
      {
        v10 = (void (*)(_QWORD))v8;
        v14 = 0;
        v15 = &v14;
        v16 = 0x2020000000;
        v17 = 0;
        CFRetain(v3);
        v13[0] = v9;
        v13[1] = (void (*)(_QWORD))3221225472;
        v13[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke;
        v13[3] = (void (*)(_QWORD))&unk_1E30351A0;
        v13[6] = (void (*)(_QWORD))&v14;
        v13[7] = (void (*)(_QWORD))v3;
        v13[4] = (void (*)(_QWORD))self;
        v13[5] = v10;
        AVSerializeOnQueueAsyncIfNecessary(MEMORY[0x1E0C80D38], v13);
        if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
          LODWORD(v3) = *((_DWORD *)v15 + 6);
        else
          LODWORD(v3) = 0;
        _Block_object_dispose(&v14, 8);
      }
      else
      {
        LODWORD(v3) = 0;
      }
      objc_autoreleasePoolPop(v5);
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_3;
      block[3] = &unk_1E302FA10;
      block[4] = v7;
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
    else
    {
      objc_autoreleasePoolPop(v5);
      LODWORD(v3) = 0;
    }
  }
  return (int)v3;
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke(uint64_t a1)
{
  NSObject *v1;
  _QWORD block[4];
  __int128 v3;
  uint64_t v4;

  v1 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_2;
  block[3] = &unk_1E3031988;
  v4 = *(_QWORD *)(a1 + 56);
  v3 = *(_OWORD *)(a1 + 40);
  dispatch_sync(v1, block);
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_2(_QWORD *a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  int v5;
  const void *v6;

  v2 = a1[4];
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    v5 = v4(CMBaseObject, *MEMORY[0x1E0CC6420], v2);
  else
    v5 = -12782;
  v6 = (const void *)a1[6];
  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = v5;
  CFRelease(v6);
}

void __63__AVSampleBufferVideoRenderer__setContentLayerOnFigVideoQueue___block_invoke_3(uint64_t a1)
{

}

- (void)_didFinishSuspension:(id)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVideoQueue *v5;
  OpaqueFigVideoQueue *v6;
  NSObject *videoQueueQueue;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];
  os_log_type_t type;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (dword_1EE2B01F0)
  {
    v12 = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue", a3, v8, v9);
  if (v5)
  {
    v6 = v5;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__AVSampleBufferVideoRenderer__didFinishSuspension___block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v6;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
  }
  -[AVSampleBufferVideoRenderer _setRequiresFlushToResumeDecoding:](self, "_setRequiresFlushToResumeDecoding:", 1);
  -[AVSampleBufferVideoRenderer _setStatus:error:](self, "_setStatus:error:", 2, AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11847, 0));
}

uint64_t __52__AVSampleBufferVideoRenderer__didFinishSuspension___block_invoke()
{
  uint64_t result;
  uint64_t v1;
  uint64_t (*v2)(uint64_t);

  result = FigVideoQueueGetCMBaseObject();
  if (result)
  {
    v1 = result;
    result = CMBaseObjectGetVTable();
    v2 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 8) + 24);
    if (v2)
      return v2(v1);
  }
  return result;
}

- (NSString)description
{
  NSObject *serialQueue;
  void *v4;
  objc_class *v5;
  NSString *v6;
  NSString *v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __42__AVSampleBufferVideoRenderer_description__block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v14;
  block[6] = &v10;
  dispatch_sync(serialQueue, block);
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = (NSString *)objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p, AVSBDLs = %d, FVTs = %d>"), v6, self, *((unsigned int *)v15 + 6), *((unsigned int *)v11 + 6));
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v7;
}

const __CFArray *__42__AVSampleBufferVideoRenderer_description__block_invoke(_QWORD *a1)
{
  const __CFArray *result;

  *(_DWORD *)(*(_QWORD *)(a1[5] + 8) + 24) = *(unsigned __int8 *)(a1[4] + 48);
  result = *(const __CFArray **)(a1[4] + 56);
  if (result)
    result = (const __CFArray *)CFArrayGetCount(result);
  *(_DWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = (_DWORD)result;
  return result;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakContentKeySession);
  objc_destroyWeak((id *)&self->_weakReferenceToSynchronizer);
  objc_destroyWeak((id *)&self->_weakDisplayLayer);
}

- (id)videoPerformanceMetrics
{
  OpaqueFigVideoQueue *v3;
  NSObject *videoQueueQueue;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  AVVideoPerformanceMetrics *v14;
  AVVideoPerformanceMetrics *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__36;
  v26 = __Block_byref_object_dispose__36;
  v27 = 0;
  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __86__AVSampleBufferVideoRenderer_VideoPerformanceMetricsPrivate__videoPerformanceMetrics__block_invoke;
    block[3] = &unk_1E3031EB8;
    block[4] = &v22;
    block[5] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  v5 = (void *)objc_msgSend((id)v23[5], "objectForKey:", *MEMORY[0x1E0CC6360]);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v18;
    v8 = *MEMORY[0x1E0CC6368];
LABEL_5:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v7)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v9);
      v11 = (void *)objc_msgSend(v10, "objectForKey:", v8);
      if (v11)
      {
        if (!objc_msgSend(v11, "intValue"))
          break;
      }
      if (v6 == ++v9)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
        if (v6)
          goto LABEL_5;
        goto LABEL_12;
      }
    }
  }
  else
  {
LABEL_12:
    v10 = 0;
  }
  v12 = (id)objc_msgSend((id)v23[5], "mutableCopy");
  v13 = v12;
  if (v10)
    objc_msgSend(v12, "addEntriesFromDictionary:", v10);
  v14 = -[AVVideoPerformanceMetrics initWithDictionary:]([AVVideoPerformanceMetrics alloc], "initWithDictionary:", v13);

  v15 = v14;
  _Block_object_dispose(&v22, 8);
  return v15;
}

uint64_t __86__AVSampleBufferVideoRenderer_VideoPerformanceMetricsPrivate__videoPerformanceMetrics__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t CMBaseObject;
  uint64_t result;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(result + 8) + 48);
  if (v4)
    return v4(CMBaseObject, *MEMORY[0x1E0CC6440], *MEMORY[0x1E0C9AE00], v1 + 40);
  return result;
}

- (void)loadVideoPerformanceMetricsWithCompletionHandler:(id)a3
{
  NSObject *videoPerformanceMetricsQueue;
  _QWORD v4[6];

  videoPerformanceMetricsQueue = self->_videoPerformanceMetricsQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __132__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoPerformanceMetrics__loadVideoPerformanceMetricsWithCompletionHandler___block_invoke;
  v4[3] = &unk_1E3032448;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(videoPerformanceMetricsQueue, v4);
}

uint64_t __132__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoPerformanceMetrics__loadVideoPerformanceMetricsWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "videoPerformanceMetrics"));
}

- (BOOL)outputObscuredDueToInsufficientExternalProtection
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __125__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererProtectedContent__outputObscuredDueToInsufficientExternalProtection__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __125__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererProtectedContent__outputObscuredDueToInsufficientExternalProtection__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)setPreventsCapture:(BOOL)a3
{
  OpaqueFigVideoQueue *v5;
  OpaqueFigVideoQueue *v6;
  NSObject *videoQueueQueue;
  _QWORD block[6];
  BOOL v9;
  _QWORD v10[3];
  int v11;

  v5 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  if (v5)
  {
    v6 = v5;
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __94__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__setPreventsCapture___block_invoke;
    block[3] = &unk_1E3035038;
    block[4] = v10;
    block[5] = v6;
    v9 = a3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v6);
  }
  _Block_object_dispose(v10, 8);
}

uint64_t __94__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__setPreventsCapture___block_invoke(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6458], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)preventsCapture
{
  OpaqueFigVideoQueue *v3;
  NSObject *videoQueueQueue;
  uint64_t v5;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[3];
  int v14;

  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__preventsCapture__block_invoke;
    block[3] = &unk_1E3031F48;
    block[4] = v13;
    block[5] = &v9;
    block[6] = v3;
    dispatch_sync(videoQueueQueue, block);
    CFRelease(v3);
  }
  v5 = v10[3];
  if (v5)
    CFRelease((CFTypeRef)v10[3]);
  v6 = *MEMORY[0x1E0C9AE50] == v5;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v13, 8);
  return v6;
}

uint64_t __90__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererImageProtection__preventsCapture__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6458], *MEMORY[0x1E0C9AE00], v2 + 24);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)setPreventsDisplaySleepDuringVideoPlayback:(BOOL)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  OpaqueFigVideoQueue *v7;
  NSObject *videoQueueQueue;
  _QWORD v9[6];
  BOOL v10;
  char v11;
  _QWORD v12[3];
  int v13;
  _QWORD block[6];
  BOOL v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;

  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E3031820;
  v15 = a3;
  block[4] = self;
  block[5] = &v16;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v17 + 24))
  {
    v7 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x2020000000;
    v13 = 0;
    if (v7)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2;
      v9[3] = &unk_1E30351C8;
      v9[4] = v12;
      v9[5] = v7;
      v10 = a3;
      v11 = 0;
      dispatch_sync(videoQueueQueue, v9);
      CFRelease(v7);
    }
    _Block_object_dispose(v12, 8);
  }
  _Block_object_dispose(&v16, 8);
}

uint64_t __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 104) != v2)
  {
    *(_BYTE *)(v1 + 104) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __130__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__setPreventsDisplaySleepDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t CMBaseObject;
  uint64_t (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;
  uint64_t result;
  int v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, _QWORD, uint64_t);
  uint64_t v12;

  v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = *MEMORY[0x1E0C9AE50];
  v4 = *MEMORY[0x1E0C9AE40];
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v6 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6)
  {
    if (v2)
      v7 = v3;
    else
      v7 = v4;
    result = v6(CMBaseObject, *MEMORY[0x1E0CC6450], v7);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_BYTE *)(a1 + 49))
  {
    v9 = *(unsigned __int8 *)(a1 + 48);
    v10 = FigVideoQueueGetCMBaseObject();
    v11 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
    {
      if (v9)
        v12 = v3;
      else
        v12 = v4;
      result = v11(v10, *MEMORY[0x1E0CC6448], v12);
    }
    else
    {
      result = 4294954514;
    }
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

- (BOOL)preventsDisplaySleepDuringVideoPlayback
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __126__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __126__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererVideoDisplaySleepPrevention__preventsDisplaySleepDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 104);
  return result;
}

- (void)setPreventsAutomaticBackgroundingDuringVideoPlayback:(BOOL)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  OpaqueFigVideoQueue *v7;
  NSObject *videoQueueQueue;
  _QWORD v9[6];
  BOOL v10;
  _QWORD v11[3];
  int v12;
  _QWORD block[6];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke;
  block[3] = &unk_1E3031820;
  v14 = a3;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v7 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    if (v7)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2;
      v9[3] = &unk_1E3035038;
      v9[4] = v11;
      v9[5] = v7;
      v10 = a3;
      dispatch_sync(videoQueueQueue, v9);
      CFRelease(v7);
    }
    _Block_object_dispose(v11, 8);
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 105) != v2)
  {
    *(_BYTE *)(v1 + 105) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __142__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__setPreventsAutomaticBackgroundingDuringVideoPlayback___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6448], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)preventsAutomaticBackgroundingDuringVideoPlayback
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __138__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __138__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererAutomaticBackgroundPrevention__preventsAutomaticBackgroundingDuringVideoPlayback__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 105);
  return result;
}

- (void)_setDisallowsVideoLayerDisplayCompositing:(BOOL)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  OpaqueFigVideoQueue *v7;
  NSObject *videoQueueQueue;
  _QWORD v9[6];
  BOOL v10;
  _QWORD v11[3];
  int v12;
  _QWORD block[6];
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  serialQueue = self->_serialQueue;
  v6 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke;
  block[3] = &unk_1E3031820;
  v14 = a3;
  block[4] = self;
  block[5] = &v15;
  dispatch_sync(serialQueue, block);
  if (*((_BYTE *)v16 + 24))
  {
    v7 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    if (v7)
    {
      videoQueueQueue = self->_videoQueueQueue;
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke_2;
      v9[3] = &unk_1E3035038;
      v9[4] = v11;
      v9[5] = v7;
      v10 = a3;
      dispatch_sync(videoQueueQueue, v9);
      CFRelease(v7);
    }
    _Block_object_dispose(v11, 8);
  }
  _Block_object_dispose(&v15, 8);
}

uint64_t __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke(uint64_t result)
{
  uint64_t v1;
  int v2;

  v1 = *(_QWORD *)(result + 32);
  v2 = *(unsigned __int8 *)(result + 48);
  if (*(unsigned __int8 *)(v1 + 107) != v2)
  {
    *(_BYTE *)(v1 + 107) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __120__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___setDisallowsVideoLayerDisplayCompositing___block_invoke_2(uint64_t a1)
{
  int v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t v5;
  uint64_t result;

  v2 = *(unsigned __int8 *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
  {
    if (v2)
      v5 = *MEMORY[0x1E0C9AE50];
    else
      v5 = *MEMORY[0x1E0C9AE40];
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6418], v5);
  }
  else
  {
    result = 4294954514;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (BOOL)_disallowsVideoLayerDisplayCompositing
{
  NSObject *serialQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __116__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___disallowsVideoLayerDisplayCompositing__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __116__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererDisplayCompositing___disallowsVideoLayerDisplayCompositing__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 107);
  return result;
}

- (BOOL)_setUpcomingPresentationTimeExpectations:(int)a3 minimumPresentationTime:(id *)a4
{
  NSObject *serialQueue;
  char v5;
  _QWORD v7[6];
  int v8;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __115__AVSampleBufferVideoRenderer_PowerOptimization___setUpcomingPresentationTimeExpectations_minimumPresentationTime___block_invoke;
  v7[3] = &unk_1E30351F0;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v10;
  v9 = *a4;
  dispatch_sync(serialQueue, v7);
  v5 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v5;
}

__n128 __115__AVSampleBufferVideoRenderer_PowerOptimization___setUpcomingPresentationTimeExpectations_minimumPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  __n128 *v3;
  __n128 result;

  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 48);
  if (*(_DWORD *)(v1 + 264) != v2)
  {
    *(_DWORD *)(v1 + 264) = v2;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  if ((*(_DWORD *)(a1 + 64) & 0x1D) == 1)
  {
    v3 = (__n128 *)(*(_QWORD *)(a1 + 32) + 268);
    result = *(__n128 *)(a1 + 52);
    v3[1].n128_u64[0] = *(_QWORD *)(a1 + 68);
    *v3 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
  return result;
}

- (void)expectMinimumUpcomingSampleBufferPresentationTime:(id *)a3
{
  __CFDictionary *Mutable;
  OpaqueFigVideoQueue *v6;
  NSObject *videoQueueQueue;
  _QWORD block[7];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  int v10;

  if ((a3->var2 & 0x1D) == 1)
  {
    v9 = *a3;
    if (-[AVSampleBufferVideoRenderer _setUpcomingPresentationTimeExpectations:minimumPresentationTime:](self, "_setUpcomingPresentationTimeExpectations:minimumPresentationTime:", 3, &v9))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC6490], (const void *)*MEMORY[0x1E0C9AE50]);
      v9 = *a3;
      FigCFDictionarySetCMTime();
      v9.var0 = 0;
      *(_QWORD *)&v9.var1 = &v9;
      v9.var3 = 0x2020000000;
      v10 = 0;
      v6 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
      if (v6)
      {
        videoQueueQueue = self->_videoQueueQueue;
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __100__AVSampleBufferVideoRenderer_PowerOptimization__expectMinimumUpcomingSampleBufferPresentationTime___block_invoke;
        block[3] = &unk_1E3035218;
        block[4] = &v9;
        block[5] = v6;
        block[6] = Mutable;
        dispatch_sync(videoQueueQueue, block);
        CFRelease(v6);
      }
      if (Mutable)
        CFRelease(Mutable);
      _Block_object_dispose(&v9, 8);
    }
  }
}

uint64_t __100__AVSampleBufferVideoRenderer_PowerOptimization__expectMinimumUpcomingSampleBufferPresentationTime___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6470], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes
{
  __CFDictionary *Mutable;
  OpaqueFigVideoQueue *v4;
  NSObject *videoQueueQueue;
  _QWORD block[7];
  __int128 v7;
  uint64_t v8;
  int v9;

  v7 = *MEMORY[0x1E0CA2E18];
  v8 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  if (-[AVSampleBufferVideoRenderer _setUpcomingPresentationTimeExpectations:minimumPresentationTime:](self, "_setUpcomingPresentationTimeExpectations:minimumPresentationTime:", 2, &v7))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC6490], (const void *)*MEMORY[0x1E0C9AE40]);
    *(_QWORD *)&v7 = 0;
    *((_QWORD *)&v7 + 1) = &v7;
    v8 = 0x2020000000;
    v9 = 0;
    v4 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    if (v4)
    {
      videoQueueQueue = self->_videoQueueQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __116__AVSampleBufferVideoRenderer_PowerOptimization__expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes__block_invoke;
      block[3] = &unk_1E3035218;
      block[4] = &v7;
      block[5] = v4;
      block[6] = Mutable;
      dispatch_sync(videoQueueQueue, block);
      CFRelease(v4);
    }
    if (Mutable)
      CFRelease(Mutable);
    _Block_object_dispose(&v7, 8);
  }
}

uint64_t __116__AVSampleBufferVideoRenderer_PowerOptimization__expectMonotonicallyIncreasingUpcomingSampleBufferPresentationTimes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6470], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)resetUpcomingSampleBufferPresentationTimeExpectations
{
  uint64_t v3;
  __CFDictionary *Mutable;
  OpaqueFigVideoQueue *v5;
  NSObject *videoQueueQueue;
  __int128 v7;
  _QWORD block[7];
  __int128 v9;
  uint64_t v10;
  int v11;

  v7 = *MEMORY[0x1E0CA2E28];
  v9 = *MEMORY[0x1E0CA2E28];
  v3 = *(_QWORD *)(MEMORY[0x1E0CA2E28] + 16);
  v10 = v3;
  if (-[AVSampleBufferVideoRenderer _setUpcomingPresentationTimeExpectations:minimumPresentationTime:](self, "_setUpcomingPresentationTimeExpectations:minimumPresentationTime:", 1, &v9))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CC6490], (const void *)*MEMORY[0x1E0C9AE50]);
    v9 = v7;
    v10 = v3;
    FigCFDictionarySetCMTime();
    *(_QWORD *)&v9 = 0;
    *((_QWORD *)&v9 + 1) = &v9;
    v10 = 0x2020000000;
    v11 = 0;
    v5 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
    if (v5)
    {
      videoQueueQueue = self->_videoQueueQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __103__AVSampleBufferVideoRenderer_PowerOptimization__resetUpcomingSampleBufferPresentationTimeExpectations__block_invoke;
      block[3] = &unk_1E3035218;
      block[4] = &v9;
      block[5] = v5;
      block[6] = Mutable;
      dispatch_sync(videoQueueQueue, block);
      CFRelease(v5);
    }
    if (Mutable)
      CFRelease(Mutable);
    _Block_object_dispose(&v9, 8);
  }
}

uint64_t __103__AVSampleBufferVideoRenderer_PowerOptimization__resetUpcomingSampleBufferPresentationTimeExpectations__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 48);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6470], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

- (void)_updateVideoOutputs
{
  OpaqueFigVideoQueue *v3;
  OpaqueFigVideoQueue *v4;
  NSObject *serialQueue;
  _QWORD v6[6];

  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    v4 = v3;
    serialQueue = self->_serialQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke;
    v6[3] = &unk_1E302FE78;
    v6[4] = self;
    v6[5] = v4;
    dispatch_sync(serialQueue, v6);
    CFRelease(v4);
  }
}

void __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  _QWORD block[7];
  _QWORD v12[3];
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 200);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "_visualContext");
        if (v8)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v13 = 0;
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke_2;
  block[3] = &unk_1E3031988;
  block[5] = v12;
  block[6] = v9;
  block[4] = v2;
  dispatch_sync(v10, block);
  _Block_object_dispose(v12, 8);
}

uint64_t __86__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs___updateVideoOutputs__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, uint64_t);
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 32);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6480], v2);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)addOutput:(id)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  if (a3)
  {
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __77__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__addOutput___block_invoke;
    block[3] = &unk_1E3030FB8;
    block[5] = a3;
    block[6] = &v14;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    if (*((_BYTE *)v15 + 24))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The AVSampleBufferVideoOutput has already been added to the AVSampleBufferVideoRenderer."), v6, v7, v8, v9, v10, v12), 0);
      objc_exception_throw(v11);
    }
    -[AVSampleBufferVideoRenderer _updateVideoOutputs](self, "_updateVideoOutputs");
  }
  _Block_object_dispose(&v14, 8);
}

uint64_t __77__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__addOutput___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 200), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  if (!*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 200), "addObject:", a1[5]);
  return result;
}

- (void)removeOutput:(id)a3
{
  NSObject *serialQueue;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  if (a3)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 0;
    serialQueue = self->_serialQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __80__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__removeOutput___block_invoke;
    block[3] = &unk_1E3030FB8;
    block[5] = a3;
    block[6] = &v14;
    block[4] = self;
    dispatch_sync(serialQueue, block);
    if (!*((_BYTE *)v15 + 24))
    {
      v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("The video target was removed, but not already attached to AVSampleBufferVideoRenderer."), v6, v7, v8, v9, v10, v12), 0);
      objc_exception_throw(v11);
    }
    -[AVSampleBufferVideoRenderer _updateVideoOutputs](self, "_updateVideoOutputs");
    _Block_object_dispose(&v14, 8);
  }
}

uint64_t __80__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__removeOutput___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 200), "indexOfObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result != 0x7FFFFFFFFFFFFFFFLL;
  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
    return objc_msgSend(*(id *)(a1[4] + 200), "removeObject:", a1[5]);
  return result;
}

- (NSArray)outputs
{
  NSObject *serialQueue;
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
  v9 = __Block_byref_object_copy__36;
  v10 = __Block_byref_object_dispose__36;
  v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __74__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__outputs__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  v3 = (NSArray *)(id)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

id __74__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__outputs__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 200);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (__CVBuffer)copyDisplayedPixelBuffer
{
  OpaqueFigVideoQueue *v3;
  NSObject *videoQueueQueue;
  __CVBuffer *v5;
  _QWORD v7[8];
  _QWORD v8[3];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v9 = 0;
  v3 = -[AVSampleBufferVideoRenderer _copyVideoQueue](self, "_copyVideoQueue");
  if (v3)
  {
    videoQueueQueue = self->_videoQueueQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __91__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__copyDisplayedPixelBuffer__block_invoke;
    v7[3] = &unk_1E3035240;
    v7[6] = &v10;
    v7[7] = v3;
    v7[4] = self;
    v7[5] = v8;
    dispatch_sync(videoQueueQueue, v7);
    CFRelease(v3);
  }
  v5 = (__CVBuffer *)v11[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __91__AVSampleBufferVideoRenderer_AVSampleBufferVideoRendererOutputs__copyDisplayedPixelBuffer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t CMBaseObject;
  uint64_t (*v4)(uint64_t, _QWORD, _QWORD, uint64_t);
  uint64_t result;
  BOOL v6;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  CMBaseObject = FigVideoQueueGetCMBaseObject();
  v4 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (v4)
    result = v4(CMBaseObject, *MEMORY[0x1E0CC6410], *MEMORY[0x1E0C9AE00], v2 + 24);
  else
    result = 4294954514;
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    v6 = dword_1EE2B01F0 == 0;
  else
    v6 = 1;
  if (!v6)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    return fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  return result;
}

@end
