@implementation APRKStreamRenderer

- (void)dealloc
{
  OpaqueFigCFWeakReferenceHolder *backingUIControllerWeakRef;
  OpaqueAPSNetworkAddress *sessionReceiverAddr;
  OpaqueAPSNetworkClock *receiverNetworkClock;
  objc_super v6;

  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterRemoveListener();
  backingUIControllerWeakRef = self->_backingUIControllerWeakRef;
  if (backingUIControllerWeakRef)
  {
    CFRelease(backingUIControllerWeakRef);
    self->_backingUIControllerWeakRef = 0;
  }
  sessionReceiverAddr = self->_sessionReceiverAddr;
  if (sessionReceiverAddr)
  {
    CFRelease(sessionReceiverAddr);
    self->_sessionReceiverAddr = 0;
  }
  receiverNetworkClock = self->_receiverNetworkClock;
  if (receiverNetworkClock)
  {
    CFRelease(receiverNetworkClock);
    self->_receiverNetworkClock = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)APRKStreamRenderer;
  -[APRKStreamRenderer dealloc](&v6, sel_dealloc);
}

- (void)stop
{
  NSObject *rendererStateUpdateQueue;
  _QWORD block[5];

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__APRKStreamRenderer_stop__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(rendererStateUpdateQueue, block);
}

uint64_t __26__APRKStreamRenderer_stop__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  CFTypeRef *v4;
  uint64_t v5;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 16))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v3 = _LogCategory_Initialize(), v2 = *(_QWORD *)(v1 + 32), v3))
      {
        v5 = v2;
        LogPrintF();
        v2 = *(_QWORD *)(v1 + 32);
      }
    }
    *(_BYTE *)(v2 + 16) = 1;
    objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "removeObserver:forKeyPath:", *(_QWORD *)(v1 + 32), CFSTR("bounds"), v5);
    v4 = *(CFTypeRef **)(v1 + 32);
    if (v4[33])
    {
      CFRelease(v4[33]);
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 264) = 0;
      v4 = *(CFTypeRef **)(v1 + 32);
    }
    if (v4[34])
    {
      CFRelease(v4[34]);
      *(_QWORD *)(*(_QWORD *)(v1 + 32) + 272) = 0;
      v4 = *(CFTypeRef **)(v1 + 32);
    }
    return -[CFTypeRef _performUIControllerActionWithBlock:](v4, "_performUIControllerActionWithBlock:", &__block_literal_global_1);
  }
  return result;
}

uint64_t __26__APRKStreamRenderer_stop__block_invoke_2()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (BOOL)startRecordingWithOutputURL:(id)a3
{
  id v4;
  NSObject *rendererVideoBufferQueue;
  BOOL v6;
  APRKStreamRenderer *v8;
  void *v9;
  _QWORD block[5];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    objc_msgSend(v4, "absoluteString");
    v8 = self;
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF();

  }
  if (-[APRKStreamRenderer canRecord](self, "canRecord", v8, v9))
  {
    rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __50__APRKStreamRenderer_startRecordingWithOutputURL___block_invoke;
    block[3] = &unk_24FA1BD60;
    v12 = &v13;
    block[4] = self;
    v11 = v4;
    dispatch_sync(rendererVideoBufferQueue, block);

    v6 = *((_BYTE *)v14 + 24) != 0;
  }
  else
  {
    v6 = 0;
    *((_BYTE *)v14 + 24) = 0;
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

uint64_t __50__APRKStreamRenderer_startRecordingWithOutputURL___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performStartRecordingWithOutputURL:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (BOOL)stopRecording
{
  NSObject *rendererVideoBufferQueue;
  char v4;
  _QWORD block[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_stopRecording__block_invoke;
  block[3] = &unk_24FA1BDB0;
  block[4] = self;
  block[5] = &v7;
  dispatch_sync(rendererVideoBufferQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __35__APRKStreamRenderer_stopRecording__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_performStopRecording");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)makeNowPlayingRenderer
{
  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_streamRendererMode == 2)
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_8);
}

uint64_t __44__APRKStreamRenderer_makeNowPlayingRenderer__block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (id)mirroringLayer
{
  return self->_mirroringLayer;
}

- (id)player
{
  return -[APRKMediaPlayer backingAVQueuePlayer](self->_player, "backingAVQueuePlayer");
}

- (id)mediaPlayer
{
  return self->_player;
}

- (void)updateDisplayInfo
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_10);
}

uint64_t __39__APRKStreamRenderer_updateDisplayInfo__block_invoke()
{
  return UIControllerPostNotificationForUpdateDisplayInfo();
}

- (BOOL)isRecording
{
  NSObject *rendererVideoBufferQueue;
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
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__APRKStreamRenderer_isRecording__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__APRKStreamRenderer_isRecording__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 104) != 0;
  return result;
}

- (BOOL)canRecord
{
  NSObject *rendererStateUpdateQueue;
  void *v3;
  int v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__APRKStreamRenderer_canRecord__block_invoke;
  v6[3] = &unk_24FA1BDB0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(rendererStateUpdateQueue, v6);
  if (*((_BYTE *)v8 + 24))
  {
    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "optimizeAudioRenderingLatency") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __31__APRKStreamRenderer_canRecord__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 19);
  return result;
}

- (CGSize)videoFrameSize
{
  NSObject *rendererVideoBufferQueue;
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  CGSize result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_22E26F797;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __36__APRKStreamRenderer_videoFrameSize__block_invoke;
  v7[3] = &unk_24FA1BDB0;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(rendererVideoBufferQueue, v7);
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
}

__n128 __36__APRKStreamRenderer_videoFrameSize__block_invoke(uint64_t a1)
{
  __n128 result;

  result = *(__n128 *)(*(_QWORD *)(a1 + 32) + 168);
  *(__n128 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 32) = result;
  return result;
}

- (void)setMirroringVolume:(float)a3
{
  -[AVSampleBufferAudioRenderer setVolume:](self->_audioRenderer, "setVolume:");
}

- (float)mirroringVolume
{
  float result;

  -[AVSampleBufferAudioRenderer volume](self->_audioRenderer, "volume");
  return result;
}

- (void)setIsPaused:(BOOL)a3
{
  NSObject *rendererVideoBufferQueue;
  _QWORD v6[5];
  BOOL v7;

  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __34__APRKStreamRenderer_setIsPaused___block_invoke;
  v6[3] = &unk_24FA1BFB0;
  v6[4] = self;
  v7 = a3;
  dispatch_async(rendererVideoBufferQueue, v6);
  self->_isMirroringAudioStreamPaused = a3;
}

uint64_t __34__APRKStreamRenderer_setIsPaused___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 25) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isPaused
{
  NSObject *rendererVideoBufferQueue;
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
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__APRKStreamRenderer_isPaused__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__APRKStreamRenderer_isPaused__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

- (void)setIsMirroringVideoStreamPaused:(BOOL)a3
{
  NSObject *rendererVideoBufferQueue;
  _QWORD v4[5];
  BOOL v5;

  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke;
  v4[3] = &unk_24FA1BFB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(rendererVideoBufferQueue, v4);
}

uint64_t __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 25) && !*(_BYTE *)(result + 40))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(v1 + 32) + 24) = 1;
    result = objc_msgSend(*(id *)(v1 + 32), "_performUIControllerActionWithBlock:", &__block_literal_global_12);
    v2 = *(_QWORD *)(v1 + 32);
  }
  *(_BYTE *)(v2 + 25) = *(_BYTE *)(v1 + 40);
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

uint64_t __54__APRKStreamRenderer_setIsMirroringVideoStreamPaused___block_invoke_2()
{
  return UIControllerPostNotificationForKeyFrameRequest();
}

- (BOOL)isMirroringVideoStreamPaused
{
  NSObject *rendererVideoBufferQueue;
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
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__APRKStreamRenderer_isMirroringVideoStreamPaused__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__APRKStreamRenderer_isMirroringVideoStreamPaused__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 25);
  return result;
}

- (void)setIsMirroringAudioStreamPaused:(BOOL)a3
{
  NSObject *rendererVideoBufferQueue;
  _QWORD v4[5];
  BOOL v5;

  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __54__APRKStreamRenderer_setIsMirroringAudioStreamPaused___block_invoke;
  v4[3] = &unk_24FA1BFB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(rendererVideoBufferQueue, v4);
}

uint64_t __54__APRKStreamRenderer_setIsMirroringAudioStreamPaused___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 26) = *(_BYTE *)(result + 40);
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)setSampleBufferDelegate:(id)a3
{
  id v4;
  NSObject *rendererVideoBufferQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__APRKStreamRenderer_setSampleBufferDelegate___block_invoke;
  block[3] = &unk_24FA1BD10;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(rendererVideoBufferQueue, block);

}

id __46__APRKStreamRenderer_setSampleBufferDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 320), *(id *)(a1 + 40));
}

- (void)postVideoV1EventWithType:(const char *)a3 params:(__CFDictionary *)a4
{
  const char *v7;
  __CFDictionary *v8;
  _QWORD v9[6];

  if (a3)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v7 = a3;
      v8 = a4;
      LogPrintF();
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __54__APRKStreamRenderer_postVideoV1EventWithType_params___block_invoke;
    v9[3] = &__block_descriptor_48_e39_v16__0__OpaqueAPReceiverUIController__8l;
    v9[4] = a3;
    v9[5] = a4;
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v9, v7, v8);
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

uint64_t __54__APRKStreamRenderer_postVideoV1EventWithType_params___block_invoke(uint64_t a1, uint64_t a2)
{
  return UIControllerPostVideoV1Event(a2, *(const char **)(a1 + 32), *(const __CFDictionary **)(a1 + 40));
}

- (void)setVideoV1Delegate:(id)a3 withDelegateQueue:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __59__APRKStreamRenderer_setVideoV1Delegate_withDelegateQueue___block_invoke;
    v9[3] = &unk_24FA1C018;
    v10 = v6;
    v11 = v8;
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v9);

  }
  else if (gLogCategory_AirPlayReceiverKit <= 90
         && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }

}

void __59__APRKStreamRenderer_setVideoV1Delegate_withDelegateQueue___block_invoke(uint64_t a1, uint64_t a2)
{
  UIControllerSetVideoV1Delegate(a2, *(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (void)setIsWiredLink:(BOOL)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD block[5];
  BOOL v7;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__APRKStreamRenderer_setIsWiredLink___block_invoke;
  block[3] = &unk_24FA1BFB0;
  block[4] = self;
  v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __37__APRKStreamRenderer_setIsWiredLink___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 17) = *(_BYTE *)(result + 40);
  *(_BYTE *)(*(_QWORD *)(result + 32) + 19) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isWiredLink
{
  NSObject *rendererStateUpdateQueue;
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
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__APRKStreamRenderer_isWiredLink__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __33__APRKStreamRenderer_isWiredLink__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 17);
  return result;
}

- (void)setIsP2PWiFi:(BOOL)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD block[5];
  BOOL v7;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_setIsP2PWiFi___block_invoke;
  block[3] = &unk_24FA1BFB0;
  block[4] = self;
  v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __35__APRKStreamRenderer_setIsP2PWiFi___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 18) = *(_BYTE *)(result + 40);
  return result;
}

- (BOOL)isP2PWiFi
{
  NSObject *rendererStateUpdateQueue;
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
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __31__APRKStreamRenderer_isP2PWiFi__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __31__APRKStreamRenderer_isP2PWiFi__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 18);
  return result;
}

- (void)setCanRecord:(BOOL)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD block[5];
  BOOL v7;

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__APRKStreamRenderer_setCanRecord___block_invoke;
  block[3] = &unk_24FA1BFB0;
  block[4] = self;
  v7 = a3;
  dispatch_sync(rendererStateUpdateQueue, block);
}

uint64_t __35__APRKStreamRenderer_setCanRecord___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 19) = *(_BYTE *)(result + 40);
  return result;
}

- (unint64_t)currentVideoPlaybackVersion
{
  NSObject *rendererVideoBufferQueue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __49__APRKStreamRenderer_currentVideoPlaybackVersion__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __49__APRKStreamRenderer_currentVideoPlaybackVersion__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 304);
  return result;
}

- (id)videoQueuePerformanceDictionary
{
  uint64_t CMBaseObject;
  void (*v3)(uint64_t, _QWORD, _QWORD, _QWORD);
  void (*v4)(_QWORD, _QWORD, _QWORD, _QWORD);
  void (*v6)(uint64_t, _QWORD, _QWORD, _QWORD);

  v6 = 0;
  if (self->_figVideoQueue)
  {
    CMBaseObject = FigVideoQueueGetCMBaseObject();
    v3 = *(void (**)(uint64_t, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
    if (v3)
    {
      v3(CMBaseObject, *MEMORY[0x24BDDD028], *MEMORY[0x24BDBD240], &v6);
      v3 = v6;
    }
  }
  else
  {
    v3 = 0;
  }
  v4 = v3;

  return v4;
}

- (id)sampleBufferDelegate
{
  NSObject *rendererVideoBufferQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __42__APRKStreamRenderer_sampleBufferDelegate__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererVideoBufferQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __42__APRKStreamRenderer_sampleBufferDelegate__block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 320));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = WeakRetained;

}

- (id)HUDLayer
{
  return self->_debugLayer;
}

- (id)ensembleInfo
{
  NSObject *rendererStateUpdateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __34__APRKStreamRenderer_ensembleInfo__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __34__APRKStreamRenderer_ensembleInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 328));
}

- (id)demoDeviceInfo
{
  NSObject *rendererStateUpdateQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__0;
  v10 = __Block_byref_object_dispose__0;
  v11 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __36__APRKStreamRenderer_demoDeviceInfo__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __36__APRKStreamRenderer_demoDeviceInfo__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 336));
}

- (APRKStreamRenderer)initWithUniqueID:(id)a3 clientName:(id)a4 UIController:(OpaqueAPReceiverUIController *)a5 useCALayerForMirroring:(BOOL)a6
{
  _BOOL4 v6;
  char *v11;
  id v12;
  char *v13;
  const __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSObject *v18;
  dispatch_queue_t v19;
  void *v20;
  NSObject *v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_queue_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  char *v38;
  id v39;
  OpaqueAPReceiverUIController *v40;
  const __CFString *v41;
  objc_super v42;

  v6 = a6;
  v11 = (char *)a3;
  v12 = a4;
  v42.receiver = self;
  v42.super_class = (Class)APRKStreamRenderer;
  v13 = -[APRKStreamRenderer init](&v42, sel_init);
  if (v13)
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v14 = CFSTR("NO");
      if (v6)
        v14 = CFSTR("YES");
      v38 = v11;
      v39 = v12;
      v40 = a5;
      v41 = v14;
      LogPrintF();
    }
    objc_storeStrong((id *)v13 + 44, a3);
    *((_QWORD *)v13 + 4) = 0;
    *((_DWORD *)v13 + 7) = 0;
    v15 = objc_msgSend(v12, "copy");
    v16 = (void *)*((_QWORD *)v13 + 45);
    *((_QWORD *)v13 + 45) = v15;

    *((_WORD *)v13 + 8) = 0;
    v13[19] = 0;
    v17 = (void *)*((_QWORD *)v13 + 11);
    *((_QWORD *)v13 + 11) = 0;

    v13[20] = v6;
    *(_WORD *)(v13 + 21) = 0;
    *((_DWORD *)v13 + 6) = 0x1000000;
    v13[344] = 1;
    *((_QWORD *)v13 + 47) = 0;
    *((_QWORD *)v13 + 38) = 0;
    *(_OWORD *)(v13 + 168) = *MEMORY[0x24BDBF148];
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererVideoBufferQueue", v18);
    v20 = (void *)*((_QWORD *)v13 + 17);
    *((_QWORD *)v13 + 17) = v19;

    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererAudioBufferQueue", v21);
    v23 = (void *)*((_QWORD *)v13 + 18);
    *((_QWORD *)v13 + 18) = v22;

    v24 = dispatch_queue_create("com.apple.APRKStreamRenderer.rendererStateUpdateQueue", 0);
    v25 = (void *)*((_QWORD *)v13 + 19);
    *((_QWORD *)v13 + 19) = v24;

    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "delegateQueue");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = (void *)*((_QWORD *)v13 + 20);
    *((_QWORD *)v13 + 20) = v27;

    v29 = MEMORY[0x24BDC0D40];
    v30 = *MEMORY[0x24BDC0D40];
    *(_OWORD *)(v13 + 44) = *MEMORY[0x24BDC0D40];
    v31 = *(_QWORD *)(v29 + 16);
    *(_QWORD *)(v13 + 60) = v31;
    *(_OWORD *)(v13 + 232) = v30;
    *((_QWORD *)v13 + 31) = v31;
    if (a5)
    {
      v32 = FigCFWeakReferenceHolderCreateWithReferencedObject();
      *((_QWORD *)v13 + 1) = v32;
      if (!v32
        && gLogCategory_AirPlayReceiverKit <= 90
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        v38 = v13;
        LogPrintF();
      }
      CMNotificationCenterGetDefaultLocalCenter();
      CMNotificationCenterAddListener();
    }
    if (v13[20] && objc_msgSend(v13, "_receiverSupportsMirroring"))
    {
      objc_msgSend(MEMORY[0x24BDE56D0], "layer");
      v33 = objc_claimAutoreleasedReturnValue();
      v34 = (void *)*((_QWORD *)v13 + 11);
      *((_QWORD *)v13 + 11) = v33;

      objc_msgSend(*((id *)v13 + 11), "setName:", CFSTR("APRKStreamRendererMirroringLayer"));
      objc_msgSend(*((id *)v13 + 11), "addObserver:forKeyPath:options:context:", v13, CFSTR("bounds"), 1, VideoRenderingLayerContext);
    }
    objc_msgSend(MEMORY[0x24BDE56D0], "layer", v38, v39, v40, v41);
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)*((_QWORD *)v13 + 12);
    *((_QWORD *)v13 + 12) = v35;

    objc_msgSend(*((id *)v13 + 12), "setName:", CFSTR("APRKHUDLayer"));
  }

  return (APRKStreamRenderer *)v13;
}

- (id)backingMediaPlayer
{
  return self->_player;
}

- (unsigned)screenSessionCount
{
  NSObject *rendererStateUpdateQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__APRKStreamRenderer_screenSessionCount__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__APRKStreamRenderer_screenSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 28);
  return result;
}

- (unsigned)audioSessionCount
{
  NSObject *rendererStateUpdateQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__APRKStreamRenderer_audioSessionCount__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__APRKStreamRenderer_audioSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 36);
  return result;
}

- (unsigned)videoSessionCount
{
  NSObject *rendererStateUpdateQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__APRKStreamRenderer_videoSessionCount__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__APRKStreamRenderer_videoSessionCount__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (unsigned)currentVideoSessionID
{
  NSObject *rendererStateUpdateQueue;
  unsigned int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __43__APRKStreamRenderer_currentVideoSessionID__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__APRKStreamRenderer_currentVideoSessionID__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 40);
  return result;
}

- (BOOL)isActive
{
  NSObject *rendererStateUpdateQueue;
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
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __30__APRKStreamRenderer_isActive__block_invoke;
  v5[3] = &unk_24FA1BDB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(rendererStateUpdateQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __30__APRKStreamRenderer_isActive__block_invoke(uint64_t result)
{
  _DWORD *v1;
  BOOL v2;

  v1 = *(_DWORD **)(result + 32);
  v2 = v1[7] || v1[9] || v1[8] != 0;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

- (void)setDeferLayerRendering:(BOOL)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v4[5];
  BOOL v5;

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__APRKStreamRenderer_setDeferLayerRendering___block_invoke;
  v4[3] = &unk_24FA1BFB0;
  v4[4] = self;
  v5 = a3;
  dispatch_async(rendererStateUpdateQueue, v4);
}

uint64_t __45__APRKStreamRenderer_setDeferLayerRendering___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 21) = *(_BYTE *)(result + 40);
  return result;
}

- (void)setSessionReceiverAddress:(OpaqueAPSNetworkAddress *)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v4[6];

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__APRKStreamRenderer_setSessionReceiverAddress___block_invoke;
  v4[3] = &unk_24FA1C040;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

void __48__APRKStreamRenderer_setSessionReceiverAddress___block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 264);
  *(_QWORD *)(v2 + 264) = v1;
  if (v1)
    CFRetain(v1);
  if (v3)
    CFRelease(v3);
}

- (void)setReceiverNetworkClock:(OpaqueAPSNetworkClock *)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v4[6];

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__APRKStreamRenderer_setReceiverNetworkClock___block_invoke;
  v4[3] = &unk_24FA1C040;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

void __46__APRKStreamRenderer_setReceiverNetworkClock___block_invoke(uint64_t a1)
{
  const void *v1;
  uint64_t v2;
  const void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(const void **)(a1 + 40);
  v3 = *(const void **)(v2 + 272);
  *(_QWORD *)(v2 + 272) = v1;
  if (v1)
    CFRetain(v1);
  if (v3)
    CFRelease(v3);
}

- (void)setEnsembleInfo:(id)a3
{
  id v4;
  NSObject *rendererStateUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __38__APRKStreamRenderer_setEnsembleInfo___block_invoke;
  v7[3] = &unk_24FA1BD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(rendererStateUpdateQueue, v7);

}

void __38__APRKStreamRenderer_setEnsembleInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 328), *(id *)(a1 + 40));
}

- (void)setDemoDeviceInfo:(id)a3
{
  id v4;
  NSObject *rendererStateUpdateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __40__APRKStreamRenderer_setDemoDeviceInfo___block_invoke;
  v7[3] = &unk_24FA1BD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(rendererStateUpdateQueue, v7);

}

void __40__APRKStreamRenderer_setDemoDeviceInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 336), *(id *)(a1 + 40));
}

- (void)processShowPasscodePromptRequest:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __55__APRKStreamRenderer_processShowPasscodePromptRequest___block_invoke;
  v7[3] = &unk_24FA1BD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

void __55__APRKStreamRenderer_processShowPasscodePromptRequest___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();

    }
    if (IsAppleInternalBuild()
      && gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      v4 = *(void **)(a1 + 40);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shouldShowPasscodePromptWithString:forRenderer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (void)processHidePasscodePromptRequest
{
  NSObject *delegateQueue;
  _QWORD block[5];

  delegateQueue = self->_delegateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__APRKStreamRenderer_processHidePasscodePromptRequest__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(delegateQueue, block);
}

void __54__APRKStreamRenderer_processHidePasscodePromptRequest__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "shouldHidePasscodePromptForRenderer:", *(_QWORD *)(a1 + 32));

  }
}

- (void)processStartScreenPresentationWithSessionID:(unsigned int)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v4[5];
  unsigned int v5;

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke;
  v4[3] = &unk_24FA1BEC0;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(rendererStateUpdateQueue, v4);
}

uint64_t __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v8;
  uint64_t v9;
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(unsigned int *)(a1 + 40);
    LogPrintF();
  }
  v2 = *(_BYTE **)(a1 + 32);
  if (v2[20] && objc_msgSend(v2, "_receiverSupportsMirroring"))
  {
    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldForwardLayers");

    if ((v4 & 1) != 0)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        v8 = *(_QWORD *)(a1 + 32);
        LogPrintF();
      }
    }
    else
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(NSObject **)(v5 + 136);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_2;
      block[3] = &unk_24FA1BC70;
      block[4] = v5;
      dispatch_async(v6, block);
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 28);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStreamingMode", v8, v9);
}

void __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_3;
  block[3] = &unk_24FA1BC70;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(MEMORY[0x24BDAC9B8], block);
}

uint64_t __66__APRKStreamRenderer_processStartScreenPresentationWithSessionID___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_ensureFigVideoQueue");
  if ((_DWORD)result)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90)
    {
      if (gLogCategory_AirPlayReceiverKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (BOOL)processStopScreenPresentationWithSessionID:(unsigned int)a3
{
  uint64_t v4;
  NSObject *rendererStateUpdateQueue;
  NSObject *rendererVideoBufferQueue;
  _QWORD v8[5];
  _QWORD block[5];

  v4 = MEMORY[0x24BDAC760];
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_sync(rendererStateUpdateQueue, block);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  v8[0] = v4;
  v8[1] = 3221225472;
  v8[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_2;
  v8[3] = &unk_24FA1BC70;
  v8[4] = self;
  dispatch_sync(rendererVideoBufferQueue, v8);
  -[APRKStreamRenderer _updateStreamingMode](self, "_updateStreamingMode");
  return 1;
}

uint64_t __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke(uint64_t result)
{
  --*(_DWORD *)(*(_QWORD *)(result + 32) + 28);
  return result;
}

uint64_t __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFTypeRef *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "_unregisterForFigVideoQueueNotifications");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 128);
  *(_QWORD *)(v2 + 128) = 0;
  if (v3)
  {
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_3;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v3;
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
  v4 = *(CFTypeRef **)(a1 + 32);
  if (v4[28])
  {
    CFRelease(v4[28]);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 224) = 0;
    v4 = *(CFTypeRef **)(a1 + 32);
  }
  return -[CFTypeRef _performStopRecording](v4, "_performStopRecording");
}

void __65__APRKStreamRenderer_processStopScreenPresentationWithSessionID___block_invoke_3(uint64_t a1)
{
  uint64_t CMBaseObject;
  uint64_t v3;
  void (*v4)(uint64_t);

  CMBaseObject = FigVideoQueueGetCMBaseObject();
  if (CMBaseObject)
  {
    v3 = CMBaseObject;
    v4 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
    if (v4)
      v4(v3);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)processStartVideoPlaybackRequestWithWithSessionID:(unsigned int)a3 version:(unint64_t)a4
{
  uint64_t v5;
  NSObject *rendererStateUpdateQueue;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[7];
  int v11;
  _QWORD block[6];
  unsigned int v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v5 = *(_QWORD *)&a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v8 = MEMORY[0x24BDAC760];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke;
  block[3] = &unk_24FA1C088;
  v13 = a3;
  block[4] = self;
  block[5] = &v18;
  dispatch_sync(rendererStateUpdateQueue, block);
  if (*((_BYTE *)v19 + 24))
    -[APRKStreamRenderer processStopVideoPlaybackRequestWithSessionID:](self, "processStopVideoPlaybackRequestWithSessionID:", self->_currentVideoSessionID);
  v9 = self->_rendererStateUpdateQueue;
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke_2;
  v10[3] = &unk_24FA1C0B0;
  v11 = v5;
  v10[5] = &v14;
  v10[6] = a4;
  v10[4] = self;
  dispatch_sync(v9, v10);
  if (*((_BYTE *)v15 + 24))
    -[APRKStreamRenderer _ensureInternalPlayerFor:](self, "_ensureInternalPlayerFor:", v5);
  if (self->_receiverNetworkClock)
    -[APRKMediaPlayer setReceiverNetworkClock:](self->_player, "setReceiverNetworkClock:");
  -[APRKStreamRenderer _updateStreamingMode](self, "_updateStreamingMode");
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
}

uint64_t __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_DWORD *)(*(_QWORD *)(result + 32) + 40))
  {
    v1 = result;
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  }
  return result;
}

uint64_t __80__APRKStreamRenderer_processStartVideoPlaybackRequestWithWithSessionID_version___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
      result = LogPrintF();
  }
  *(_QWORD *)(*(_QWORD *)(v1 + 32) + 304) = *(_QWORD *)(v1 + 48);
  ++*(_DWORD *)(*(_QWORD *)(v1 + 32) + 32);
  *(_DWORD *)(*(_QWORD *)(v1 + 32) + 40) = *(_DWORD *)(v1 + 56);
  if (*(_QWORD *)(*(_QWORD *)(v1 + 32) + 304) == 2)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 40) + 8) + 24) = 1;
  return result;
}

- (BOOL)processStopVideoPlaybackRequestWithSessionID:(unsigned int)a3
{
  NSObject *rendererStateUpdateQueue;
  BOOL v5;
  _QWORD v7[7];
  unsigned int v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __67__APRKStreamRenderer_processStopVideoPlaybackRequestWithSessionID___block_invoke;
  v7[3] = &unk_24FA1C0D8;
  v8 = a3;
  v7[4] = self;
  v7[5] = &v13;
  v7[6] = &v9;
  dispatch_sync(rendererStateUpdateQueue, v7);
  if (*((_BYTE *)v14 + 24))
    -[APRKStreamRenderer _cleanupInternalPlayer](self, "_cleanupInternalPlayer");
  if (*((_BYTE *)v10 + 24))
  {
    -[APRKStreamRenderer _updateStreamingMode](self, "_updateStreamingMode");
    v5 = *((_BYTE *)v10 + 24) != 0;
  }
  else
  {
    v5 = 0;
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v5;
}

uint64_t __67__APRKStreamRenderer_processStopVideoPlaybackRequestWithSessionID___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_DWORD *)(v2 + 40) == *(_DWORD *)(result + 56))
  {
    if (gLogCategory_AirPlayReceiverKit <= 30)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (result = _LogCategory_Initialize(), v2 = v1[4], (_DWORD)result))
      {
        result = LogPrintF();
        v2 = v1[4];
      }
    }
    if (*(_QWORD *)(v2 + 304) == 2)
    {
      *(_BYTE *)(*(_QWORD *)(v1[5] + 8) + 24) = 1;
      v2 = v1[4];
    }
    *(_QWORD *)(v2 + 304) = 0;
    --*(_DWORD *)(v1[4] + 32);
    *(_DWORD *)(v1[4] + 40) = 0;
    *(_BYTE *)(*(_QWORD *)(v1[6] + 8) + 24) = 1;
  }
  else if (gLogCategory_AirPlayReceiverKit <= 30)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      return LogPrintF();
    result = _LogCategory_Initialize();
    if ((_DWORD)result)
      return LogPrintF();
  }
  return result;
}

- (void)processStartAudioSessionRequestWithSessionID:(unsigned int)a3 isScreenAudio:(BOOL)a4
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v5[5];
  unsigned int v6;
  BOOL v7;

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke;
  v5[3] = &unk_24FA1C100;
  v5[4] = self;
  v6 = a3;
  v7 = a4;
  dispatch_async(rendererStateUpdateQueue, v5);
}

uint64_t __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (*(_BYTE *)(a1 + 44))
  {
    +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "optimizeAudioRenderingLatency");

    if (v3)
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(NSObject **)(v4 + 144);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke_2;
      block[3] = &unk_24FA1BC70;
      block[4] = v4;
      dispatch_sync(v5, block);
    }
  }
  ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStreamingMode");
}

uint64_t __81__APRKStreamRenderer_processStartAudioSessionRequestWithSessionID_isScreenAudio___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = 1;
  v2 = objc_alloc_init(MEMORY[0x24BDB2688]);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 80);
  *(_QWORD *)(v3 + 80) = v2;

  v5 = objc_alloc_init(MEMORY[0x24BDB2698]);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v5;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addRenderer:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

- (BOOL)processStopAudioSessionRequestWithSessionID:(unsigned int)a3
{
  NSObject *rendererStateUpdateQueue;
  _QWORD v5[5];
  unsigned int v6;

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke;
  v5[3] = &unk_24FA1BEC0;
  v5[4] = self;
  v6 = a3;
  dispatch_async(rendererStateUpdateQueue, v5);
  return 1;
}

uint64_t __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 144);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_2;
  block[3] = &unk_24FA1BC70;
  block[4] = v2;
  dispatch_sync(v3, block);
  --*(_DWORD *)(*(_QWORD *)(a1 + 32) + 36);
  return objc_msgSend(*(id *)(a1 + 32), "_updateStreamingMode");
}

void __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 72);
  v4 = *(_QWORD *)(v2 + 80);
  v12 = *MEMORY[0x24BDC0D40];
  v11 = v12;
  v13 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  v5 = v13;
  objc_msgSend(v3, "removeRenderer:atTime:completionHandler:", v4, &v12, &__block_literal_global_68);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23) = 0;
  v6 = *(_QWORD *)(a1 + 32);
  *(_OWORD *)(v6 + 44) = v11;
  *(_QWORD *)(v6 + 60) = v5;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 80);
  *(_QWORD *)(v7 + 80) = 0;

  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(v9 + 72);
  *(_QWORD *)(v9 + 72) = 0;

}

void __66__APRKStreamRenderer_processStopAudioSessionRequestWithSessionID___block_invoke_3()
{
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (BOOL)processVideoSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *rendererVideoBufferQueue;
  BOOL v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  rendererVideoBufferQueue = self->_rendererVideoBufferQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke;
  block[3] = &unk_24FA1C1B8;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(rendererVideoBufferQueue, block);
  v4 = *((_DWORD *)v8 + 6) == 0;
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke(uint64_t a1)
{
  const void *v2;
  uint64_t v3;
  CFTypeRef v4;
  CFTypeRef v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  const __CFDictionary *v10;
  const __CFDictionary *v11;
  CFTypeID v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  CFTypeID v15;
  const opaqueCMFormatDescription *FormatDescription;
  unint64_t Dimensions;
  int32_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  double v24;
  double v25;
  int v26;
  double v27;
  const void *v28;
  uint64_t v29;
  id WeakRetained;
  char v31;
  id v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  NSObject *v39;
  const void *v40;
  _QWORD v41[5];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  BOOL v50;
  _QWORD v51[5];
  int v52;
  _QWORD block[5];
  BOOL v54;
  CMTime v55;
  int valuePtr;

  valuePtr = 0;
  v2 = *(const void **)(a1 + 48);
  if (!v2)
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  CFRetain(v2);
  v3 = *(_QWORD *)(a1 + 32);
  CMSampleBufferGetOutputPresentationTimeStamp(&v55, *(CMSampleBufferRef *)(a1 + 48));
  *(CMTime *)(v3 + 232) = v55;
  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 25))
    goto LABEL_43;
  v4 = (CFTypeRef)*MEMORY[0x24BDBD270];
  v5 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x24BDC0CF0], 0);
  v6 = v4 == v5;
  v7 = *(_QWORD *)(a1 + 32);
  if (*(unsigned __int8 *)(v7 + 27) != v6)
  {
    *(_BYTE *)(v7 + 27) = v6;
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(NSObject **)(v8 + 160);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_2;
    block[3] = &unk_24FA1BFB0;
    block[4] = v8;
    v54 = v4 == v5;
    dispatch_async(v9, block);
  }
  if (v4 == v5)
  {
    v24 = *MEMORY[0x24BDBF148];
    v25 = *(double *)(MEMORY[0x24BDBF148] + 8);
    goto LABEL_25;
  }
  v10 = (const __CFDictionary *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x24BDC1278], 0);
  if (!v10 || (v11 = v10, v12 = CFGetTypeID(v10), v12 != CFDictionaryGetTypeID()))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -6705;
LABEL_55:
    APSLogErrorAt();
    goto LABEL_43;
  }
  if (!CGRectMakeWithDictionaryRepresentation(v11, (CGRect *)(*(_QWORD *)(a1 + 32) + 192)))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  v13 = (const __CFNumber *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 48), (CFStringRef)*MEMORY[0x24BDC1280], 0);
  if (!v13 || (v14 = v13, v15 = CFGetTypeID(v13), v15 != CFNumberGetTypeID()))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = -6705;
    goto LABEL_55;
  }
  CFNumberGetValue(v14, kCFNumberSInt32Type, &valuePtr);
  FormatDescription = CMSampleBufferGetFormatDescription(*(CMSampleBufferRef *)(a1 + 48));
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
  v18 = Dimensions;
  v19 = HIDWORD(Dimensions);
  v20 = valuePtr;
  v21 = *(_QWORD *)(a1 + 32);
  if (valuePtr != *(_DWORD *)(v21 + 260))
  {
    *(_DWORD *)(v21 + 260) = valuePtr;
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(NSObject **)(v22 + 160);
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_3;
    v51[3] = &unk_24FA1BEC0;
    v51[4] = v22;
    v52 = v20;
    dispatch_async(v23, v51);
    v21 = *(_QWORD *)(a1 + 32);
  }
  v24 = (double)v18;
  v25 = (double)(int)v19;
  if (*(_BYTE *)(v21 + 344))
  {
    *(_DWORD *)(v21 + 256) = valuePtr;
    v26 = objc_msgSend(*(id *)(a1 + 32), "_isRotatedTransform:", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 256));
    if (v26)
      v27 = (double)(int)v19;
    else
      v27 = (double)v18;
    if (v26)
      v25 = (double)v18;
    v21 = *(_QWORD *)(a1 + 32);
    v24 = v27;
  }
  v28 = *(const void **)(v21 + 224);
  *(_QWORD *)(v21 + 224) = FormatDescription;
  if (FormatDescription)
    CFRetain(FormatDescription);
  if (v28)
    CFRelease(v28);
LABEL_25:
  v29 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v29 + 24))
  {
    if (!objc_msgSend((id)v29, "_sampleBufferRepresentsKeyFrame:", *(_QWORD *)(a1 + 48)))
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_37;
    }
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
    v29 = *(_QWORD *)(a1 + 32);
  }
  if (*(_QWORD *)(v29 + 88) && !*(_BYTE *)(v29 + 21))
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend((id)v29, "_enqueueVideoFrameForRendering:", *(_QWORD *)(a1 + 48));
    v29 = *(_QWORD *)(a1 + 32);
  }
  WeakRetained = objc_loadWeakRetained((id *)(v29 + 320));
  v31 = objc_opt_respondsToSelector();

  if ((v31 & 1) != 0)
  {
    v32 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 320));
    objc_msgSend(v32, "renderer:didOutputVideoSampleBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));

  }
LABEL_37:
  v33 = *(_QWORD *)(a1 + 32);
  if (v4 != v5 && *(_BYTE *)(v33 + 22))
  {
    objc_msgSend((id)v33, "_enqueueSampleBufferForRecording:isAudioSBuf:", *(_QWORD *)(a1 + 48), 0);
    v33 = *(_QWORD *)(a1 + 32);
  }
  if (v24 != *(double *)(v33 + 168) || v25 != *(double *)(v33 + 176))
  {
    *(double *)(v33 + 168) = v24;
    *(double *)(v33 + 176) = v25;
    v41[1] = 3221225472;
    v34 = *(_OWORD *)(MEMORY[0x24BDE5598] + 80);
    v46 = *(_OWORD *)(MEMORY[0x24BDE5598] + 64);
    v47 = v34;
    v35 = *(_OWORD *)(MEMORY[0x24BDE5598] + 112);
    v48 = *(_OWORD *)(MEMORY[0x24BDE5598] + 96);
    v36 = *(_OWORD *)(MEMORY[0x24BDE5598] + 16);
    v42 = *MEMORY[0x24BDE5598];
    v43 = v36;
    v37 = *(_OWORD *)(MEMORY[0x24BDE5598] + 48);
    v44 = *(_OWORD *)(MEMORY[0x24BDE5598] + 32);
    v38 = *(_QWORD *)(a1 + 32);
    v39 = *(NSObject **)(v38 + 160);
    v41[0] = MEMORY[0x24BDAC760];
    v41[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_4;
    v41[3] = &unk_24FA1C190;
    v41[4] = v38;
    v45 = v37;
    v49 = v35;
    v50 = v4 == v5;
    dispatch_async(v39, v41);
  }
LABEL_43:
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v40 = *(const void **)(a1 + 48);
  if (v40)
    CFRelease(v40);
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoStreamIsCleared:forRenderer:", *(unsigned __int8 *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "videoLayerOrientationDidChangeTo:forRenderer:", *(unsigned int *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

void __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_4(uint64_t a1)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD block[5];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_5;
  block[3] = &unk_24FA1C168;
  block[4] = *(_QWORD *)(a1 + 32);
  v2 = *(_OWORD *)(a1 + 120);
  v13 = *(_OWORD *)(a1 + 104);
  v14 = v2;
  v15 = *(_OWORD *)(a1 + 136);
  v16 = *(_OWORD *)(a1 + 152);
  v3 = *(_OWORD *)(a1 + 56);
  v9 = *(_OWORD *)(a1 + 40);
  v10 = v3;
  v4 = *(_OWORD *)(a1 + 88);
  v11 = *(_OWORD *)(a1 + 72);
  v12 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if (!*(_BYTE *)(a1 + 168))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_opt_respondsToSelector();

    if ((v6 & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "videoLayerSizeDidChangeTo:forRenderer:", *(double *)(*(_QWORD *)(a1 + 32) + 168), *(double *)(*(_QWORD *)(a1 + 32) + 176));

    }
  }
}

uint64_t __47__APRKStreamRenderer_processVideoSampleBuffer___block_invoke_5(uint64_t a1)
{
  void *v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];

  objc_msgSend(MEMORY[0x24BDE57D8], "begin");
  objc_msgSend(MEMORY[0x24BDE57D8], "setDisableActions:", 1);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 88);
  v3 = *(_OWORD *)(a1 + 120);
  v8[4] = *(_OWORD *)(a1 + 104);
  v8[5] = v3;
  v4 = *(_OWORD *)(a1 + 152);
  v8[6] = *(_OWORD *)(a1 + 136);
  v8[7] = v4;
  v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  v6 = *(_OWORD *)(a1 + 88);
  v8[2] = *(_OWORD *)(a1 + 72);
  v8[3] = v6;
  objc_msgSend(v2, "setTransform:", v8);
  return objc_msgSend(MEMORY[0x24BDE57D8], "commit");
}

- (BOOL)processAudioSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  NSObject *rendererAudioBufferQueue;
  BOOL v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  int v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  if (a3)
    CFRetain(a3);
  rendererAudioBufferQueue = self->_rendererAudioBufferQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__APRKStreamRenderer_processAudioSampleBuffer___block_invoke;
  block[3] = &unk_24FA1C1E0;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(rendererAudioBufferQueue, block);
  if (a3)
    CFRelease(a3);
  v6 = *((_DWORD *)v10 + 6) == 0;
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __47__APRKStreamRenderer_processAudioSampleBuffer___block_invoke(uint64_t result)
{
  _QWORD *v1;
  uint64_t v2;
  void *v3;
  OpaqueCMClock *HostTimeClock;
  double v5;
  int v6;
  void *v7;
  id WeakRetained;
  char v9;
  id v10;
  CMTime v11;
  CMTime v12;

  v1 = (_QWORD *)result;
  v2 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v2 + 23) && !*(_BYTE *)(v2 + 26))
  {
    if ((*(_BYTE *)(v2 + 56) & 1) == 0)
    {
      CMSampleBufferGetOutputPresentationTimeStamp(&v12, *(CMSampleBufferRef *)(result + 48));
      *(CMTime *)(v2 + 44) = v12;
      v3 = *(void **)(v1[4] + 72);
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&v11, HostTimeClock);
      LODWORD(v5) = 1.0;
      objc_msgSend(v3, "setRate:time:", &v11, v5);
      v2 = v1[4];
    }
    v6 = objc_msgSend(*(id *)(v2 + 80), "isReadyForMoreMediaData");
    v7 = *(void **)(v1[4] + 80);
    if (v6)
    {
      objc_msgSend(v7, "enqueueSampleBuffer:", v1[6]);
      WeakRetained = objc_loadWeakRetained((id *)(v1[4] + 320));
      v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) != 0)
      {
        v10 = objc_loadWeakRetained((id *)(v1[4] + 320));
        objc_msgSend(v10, "renderer:didOutputAudioSampleBuffer:", v1[4], v1[6]);

      }
      result = v1[4];
      if (*(_BYTE *)(result + 22))
        result = objc_msgSend((id)result, "_enqueueSampleBufferForRecording:isAudioSBuf:", v1[6], 1);
    }
    else
    {
      result = objc_msgSend(v7, "status");
      if (result == 2)
      {
        *(_DWORD *)(*(_QWORD *)(v1[5] + 8) + 24) = -6762;
        result = APSLogErrorAt();
      }
    }
  }
  if (*(_DWORD *)(*(_QWORD *)(v1[5] + 8) + 24))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90)
    {
      if (gLogCategory_AirPlayReceiverKit != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

- (void)_registerForFigVideoQueueNotifications
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *figVideoQueueNotifObserver;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  if (self->_figVideoQueue)
  {
    if (!self->_figVideoQueueNotifObserver)
    {
      objc_initWeak(&location, self);
      v7 = MEMORY[0x24BDAC760];
      v8 = 3221225472;
      v9 = __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke;
      v10 = &unk_24FA1C228;
      objc_copyWeak(&v11, &location);
      v3 = _Block_copy(&v7);
      objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v7, v8, v9, v10);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x24BDDCFF0], self->_figVideoQueue, 0, v3);
      v5 = objc_claimAutoreleasedReturnValue();
      figVideoQueueNotifObserver = self->_figVideoQueueNotifObserver;
      self->_figVideoQueueNotifObserver = v5;

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  objc_msgSend(WeakRetained, "_performUIControllerActionWithBlock:", &__block_literal_global_87);

}

uint64_t __60__APRKStreamRenderer__registerForFigVideoQueueNotifications__block_invoke_2()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (void)_unregisterForFigVideoQueueNotifications
{
  void *v3;
  NSObject *figVideoQueueNotifObserver;

  if (self->_figVideoQueueNotifObserver)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:", self->_figVideoQueueNotifObserver);

    figVideoQueueNotifObserver = self->_figVideoQueueNotifObserver;
    self->_figVideoQueueNotifObserver = 0;

  }
}

- (signed)_ensureFigVideoQueue
{
  uint64_t *p_figVideoQueue;
  int v4;
  OpaqueCMClock *HostTimeClock;
  OSStatus v6;
  OSStatus v7;
  OpaqueCMTimebase *v8;
  OpaqueCMClock *v9;
  OSStatus v10;
  int OnlyTimebase;
  uint64_t CMBaseObject;
  uint64_t (*v13)(uint64_t, _QWORD, _QWORD);
  int v14;
  int v15;
  int v16;
  int v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, _QWORD);
  int v20;
  int v21;
  CMTime time;
  CFTypeRef cf;
  CMTimebaseRef timebaseOut;

  cf = 0;
  timebaseOut = 0;
  p_figVideoQueue = (uint64_t *)&self->_figVideoQueue;
  if (self->_figVideoQueue)
  {
    v21 = 0;
  }
  else
  {
    v4 = MEMORY[0x22E3295F4](*MEMORY[0x24BDBD240], p_figVideoQueue);
    if (v4)
    {
      v21 = v4;
    }
    else
    {
      -[APRKStreamRenderer _registerForFigVideoQueueNotifications](self, "_registerForFigVideoQueueNotifications");
      HostTimeClock = CMClockGetHostTimeClock();
      v6 = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
      if (v6)
      {
        v21 = v6;
      }
      else
      {
        v7 = CMTimebaseSetRate(timebaseOut, 1.0);
        if (v7)
        {
          v21 = v7;
        }
        else
        {
          v8 = timebaseOut;
          v9 = CMClockGetHostTimeClock();
          CMClockGetTime(&time, v9);
          v10 = CMTimebaseSetTime(v8, &time);
          if (v10)
          {
            v21 = v10;
          }
          else
          {
            OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
            if (OnlyTimebase)
            {
              v21 = OnlyTimebase;
            }
            else
            {
              CMBaseObject = FigVideoQueueGetCMBaseObject();
              v13 = *(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
              if (v13)
              {
                v14 = v13(CMBaseObject, *MEMORY[0x24BDDCFF8], *MEMORY[0x24BDBD268]);
                if (v14)
                {
                  v21 = v14;
                }
                else
                {
                  v15 = FigVideoQueueSetProperty(*p_figVideoQueue, *MEMORY[0x24BDDD000], (uint64_t)cf);
                  if (v15)
                  {
                    v21 = v15;
                  }
                  else
                  {
                    v16 = FigVideoQueueSetProperty((uint64_t)self->_figVideoQueue, *MEMORY[0x24BDDD018], (uint64_t)self->_mirroringLayer);
                    if (v16)
                    {
                      v21 = v16;
                    }
                    else
                    {
                      v17 = FigVideoQueueSetProperty(*p_figVideoQueue, *MEMORY[0x24BDDD020], *MEMORY[0x24BDBD270]);
                      if (v17)
                      {
                        v21 = v17;
                      }
                      else
                      {
                        v18 = *p_figVideoQueue;
                        v19 = *(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
                        if (v19)
                        {
                          v20 = v19(v18, 0);
                          v21 = 0;
                          if (!v20)
                            goto LABEL_19;
                          v21 = v20;
                        }
                        else
                        {
                          v21 = -12782;
                        }
                      }
                    }
                  }
                }
              }
              else
              {
                v21 = -12782;
              }
            }
          }
        }
      }
    }
    APSLogErrorAt();
  }
LABEL_19:
  if (timebaseOut)
    CFRelease(timebaseOut);
  if (cf)
    CFRelease(cf);
  if (v21
    && gLogCategory_AirPlayReceiverKit <= 90
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return v21;
}

- (void)_ensureInternalPlayerFor:(int)a3
{
  APRKMediaPlayer *v4;
  APRKMediaPlayer *player;

  if (!self->_player)
  {
    v4 = -[APRKMediaPlayer initWithP2PWiFiSupport:isInterstitialPlayer:playerSessionID:]([APRKMediaPlayer alloc], "initWithP2PWiFiSupport:isInterstitialPlayer:playerSessionID:", self->_isP2PWiFiSession, 0, *(_QWORD *)&a3);
    player = self->_player;
    self->_player = v4;

    -[APRKMediaPlayer addObserver:forKeyPath:options:context:](self->_player, "addObserver:forKeyPath:options:context:", self, CFSTR("currentItemMetadata"), 1, APRKMediaPlayerContext);
    -[APRKMediaPlayer setMessagingDelegate:](self->_player, "setMessagingDelegate:", self);
    -[APRKMediaPlayer setSessionReceiverAddress:](self->_player, "setSessionReceiverAddress:", self->_sessionReceiverAddr);
  }
}

- (void)_cleanupInternalPlayer
{
  APRKMediaPlayer *v3;
  APRKMediaPlayer *player;
  APRKMediaPlayer *v5;
  _QWORD v6[4];
  APRKMediaPlayer *v7;

  v3 = self->_player;
  player = self->_player;
  self->_player = 0;

  -[APRKMediaPlayer removeObserver:forKeyPath:](v3, "removeObserver:forKeyPath:", self, CFSTR("currentItemMetadata"));
  -[APRKMediaPlayer setMessagingDelegate:](v3, "setMessagingDelegate:", 0);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __44__APRKStreamRenderer__cleanupInternalPlayer__block_invoke;
  v6[3] = &unk_24FA1BC70;
  v7 = v3;
  v5 = v3;
  -[APRKMediaPlayer stopWithCompletionBlock:](v5, "stopWithCompletionBlock:", v6);

}

uint64_t __44__APRKStreamRenderer__cleanupInternalPlayer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (int)_enqueueVideoFrameForRendering:(opaqueCMSampleBuffer *)a3
{
  opaqueCMFormatDescription *formatDesc;
  OSStatus v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  OpaqueFigVideoQueue *figVideoQueue;
  CFTypeRef v15;
  uint64_t transform;
  double x;
  double y;
  double width;
  double height;
  uint64_t (*v21)(OpaqueFigVideoQueue *, CFTypeRef, uint64_t, double, double, double, double, double, double, double, double);
  int v22;
  CMSampleTimingInfo sampleTimingArray;
  CFTypeRef cf;

  cf = a3;
  if (!a3)
  {
    if (!self->_figVideoQueue)
      goto LABEL_21;
    formatDesc = self->_formatDesc;
    if (!formatDesc)
      goto LABEL_21;
    sampleTimingArray.presentationTimeStamp = (CMTime)self->_lastPTS;
    sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x24BDC0D88];
    sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v5 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, 1u, 0, 0, formatDesc, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&cf);
    if (v5)
    {
      v22 = v5;
LABEL_11:
      APSLogErrorAt();
      goto LABEL_12;
    }
LABEL_7:
    -[CALayer frame](self->_mirroringLayer, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    figVideoQueue = self->_figVideoQueue;
    v15 = cf;
    transform = self->_transform;
    x = self->_sourceRect.origin.x;
    y = self->_sourceRect.origin.y;
    width = self->_sourceRect.size.width;
    height = self->_sourceRect.size.height;
    v21 = *(uint64_t (**)(OpaqueFigVideoQueue *, CFTypeRef, uint64_t, double, double, double, double, double, double, double, double))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v21)
    {
      v22 = v21(figVideoQueue, v15, transform, x, y, width, height, v7, v9, v11, v13);
      if (!v22)
        goto LABEL_12;
    }
    else
    {
      v22 = -12782;
    }
    goto LABEL_11;
  }
  CFRetain(a3);
  if (self->_figVideoQueue)
    goto LABEL_7;
LABEL_21:
  v22 = 0;
LABEL_12:
  if (cf)
    CFRelease(cf);
  if (v22)
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    self->_isMirroringVideoStreamPaused = 1;
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_95);
  }
  return v22;
}

uint64_t __53__APRKStreamRenderer__enqueueVideoFrameForRendering___block_invoke()
{
  return UIControllerPostNotificationForRendererStoppedEvent();
}

- (int)_enqueueSampleBufferForRecording:(opaqueCMSampleBuffer *)a3 isAudioSBuf:(BOOL)a4
{
  const opaqueCMFormatDescription *FormatDescription;
  unint64_t Dimensions;
  unint64_t v9;
  unint64_t v10;
  _BOOL4 recorderNeedsKeyFrame;
  APRKStreamRecorder *v12;
  APRKStreamRecorder *recorder;
  uint64_t v14;
  APRKStreamRecorder *v15;
  uint64_t v16;
  NSObject *delegateQueue;
  uint64_t width;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD block[5];

  if (a3)
    CFRetain(a3);
  if (!a4)
  {
    FormatDescription = CMSampleBufferGetFormatDescription(a3);
    Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(FormatDescription);
    v9 = Dimensions;
    v10 = HIDWORD(Dimensions);
    if (*(_QWORD *)&self->_lastVideoSampleBufferSize == Dimensions)
    {
      recorderNeedsKeyFrame = self->_recorderNeedsKeyFrame;
      self->_lastVideoSampleBufferSize = ($470D365275581EF16070F5A11344F73E)Dimensions;
      if (!recorderNeedsKeyFrame)
        goto LABEL_13;
    }
    else
    {
      if (gLogCategory_AirPlayReceiverKit <= 30
        && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
      {
        v21 = v9;
        v22 = v10;
        width = (int)self->_presentationVideoSize.width;
        v20 = width;
        LogPrintF();
      }
      -[APRKStreamRenderer _performStopRecording](self, "_performStopRecording", width, v20, v21, v22);
      self->_recorderNeedsKeyFrame = 1;
      self->_lastVideoSampleBufferSize.width = v9;
      self->_lastVideoSampleBufferSize.height = v10;
    }
    self->_recorderNeedsKeyFrame = !-[APRKStreamRenderer _sampleBufferRepresentsKeyFrame:](self, "_sampleBufferRepresentsKeyFrame:", a3);
  }
LABEL_13:
  if (self->_recorder || self->_recorderNeedsKeyFrame)
    goto LABEL_35;
  dispatch_source_cancel((dispatch_source_t)self->_recorderKeyFrameTimer);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v12 = objc_alloc_init(APRKStreamRecorder);
  recorder = self->_recorder;
  self->_recorder = v12;

  v14 = -[APRKStreamRecorder startRecordingAtURL:](self->_recorder, "startRecordingAtURL:", self->_currentRecordingURL);
  if (!(_DWORD)v14)
  {
LABEL_35:
    if (!self->_recorderNeedsKeyFrame)
    {
      v15 = self->_recorder;
      if (a4)
        -[APRKStreamRecorder recordAudioSampleBuffer:](v15, "recordAudioSampleBuffer:", a3);
      else
        -[APRKStreamRecorder recordVideoSampleBuffer:](v15, "recordVideoSampleBuffer:", a3);
    }
    LODWORD(v16) = 0;
    if (a3)
LABEL_25:
      CFRelease(a3);
  }
  else
  {
    v16 = v14;
    APSLogErrorAt();
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      width = v16;
      LogPrintF();
    }
    -[APRKStreamRenderer _performStopRecording](self, "_performStopRecording", width);
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__APRKStreamRenderer__enqueueSampleBufferForRecording_isAudioSBuf___block_invoke;
    block[3] = &unk_24FA1BC70;
    block[4] = self;
    dispatch_async(delegateQueue, block);
    if (a3)
      goto LABEL_25;
  }
  return v16;
}

void __67__APRKStreamRenderer__enqueueSampleBufferForRecording_isAudioSBuf___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordingSessionDidFailForRenderer:", *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_sampleBufferRepresentsKeyFrame:(opaqueCMSampleBuffer *)a3
{
  const __CFArray *SampleAttachmentsArray;
  const __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex v7;

  SampleAttachmentsArray = CMSampleBufferGetSampleAttachmentsArray(a3, 0);
  if (!SampleAttachmentsArray)
    return 1;
  v4 = SampleAttachmentsArray;
  Count = CFArrayGetCount(SampleAttachmentsArray);
  v6 = Count - 1;
  if (Count < 1)
    return 1;
  v7 = 0;
  do
  {
    CFArrayGetValueAtIndex(v4, v7);
    if (FigCFDictionaryGetBooleanIfPresent())
      break;
  }
  while (v6 != v7++);
  return 1;
}

- (BOOL)_performStartRecordingWithOutputURL:(id)a3
{
  NSURL *v4;
  NSURL *currentRecordingURL;
  NSURL *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *recorderKeyFrameTimer;
  NSObject *v9;
  NSObject *v10;
  dispatch_time_t v11;
  _QWORD handler[5];

  v4 = (NSURL *)a3;
  if (self->_recorder)
    -[APRKStreamRenderer _performStopRecording](self, "_performStopRecording");
  currentRecordingURL = self->_currentRecordingURL;
  self->_currentRecordingURL = v4;
  v6 = v4;

  self->_recorderNeedsKeyFrame = 1;
  self->_shouldRecordFrames = 1;
  -[APRKStreamRenderer _cleanupPreviousRecordingIfExisting](self, "_cleanupPreviousRecordingIfExisting");
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_103);
  v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, (dispatch_queue_t)self->_rendererVideoBufferQueue);
  recorderKeyFrameTimer = self->_recorderKeyFrameTimer;
  self->_recorderKeyFrameTimer = v7;

  v9 = self->_recorderKeyFrameTimer;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_2;
  handler[3] = &unk_24FA1BC70;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  v10 = self->_recorderKeyFrameTimer;
  v11 = dispatch_time(0, 5000000000);
  dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  dispatch_resume((dispatch_object_t)self->_recorderKeyFrameTimer);
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_105);

  return 1;
}

uint64_t __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke()
{
  return UIControllerPostNotificationForKeyFrameRequest();
}

void __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD block[5];

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 288))
  {
    if (gLogCategory_AirPlayReceiverKit <= 90
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "_performStopRecording");
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(NSObject **)(v2 + 160);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_3;
    block[3] = &unk_24FA1BC70;
    block[4] = v2;
    dispatch_async(v3, block);
  }
}

void __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_3(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "recordingSessionDidFailForRenderer:", *(_QWORD *)(a1 + 32));

  }
}

uint64_t __58__APRKStreamRenderer__performStartRecordingWithOutputURL___block_invoke_4()
{
  return UIControllerPostNotificationForStartRecordingEvent();
}

- (BOOL)_performStopRecording
{
  NSURL *currentRecordingURL;
  BOOL v4;
  APRKStreamRecorder *recorder;

  if (self->_recorder)
  {
    dispatch_source_cancel((dispatch_source_t)self->_recorderKeyFrameTimer);
    -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", &__block_literal_global_107);
    currentRecordingURL = self->_currentRecordingURL;
    self->_currentRecordingURL = 0;

    self->_recorderNeedsKeyFrame = 0;
    self->_shouldRecordFrames = 0;
    v4 = -[APRKStreamRecorder finalizeRecording](self->_recorder, "finalizeRecording");
    recorder = self->_recorder;
    self->_recorder = 0;

    return !v4;
  }
  else
  {
    if (gLogCategory_AirPlayReceiverKit <= 30
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return 1;
  }
}

uint64_t __43__APRKStreamRenderer__performStopRecording__block_invoke()
{
  return UIControllerPostNotificationForStopRecordingEvent();
}

- (void)_cleanupPreviousRecordingIfExisting
{
  void *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  char v10;

  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_currentRecordingURL, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v4, &v10);

  v6 = 0;
  if (!v10)
  {
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSURL path](self->_currentRecordingURL, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0;
      objc_msgSend(v7, "removeItemAtPath:error:", v8, &v9);
      v6 = v9;

      if (v6)
      {
        if (gLogCategory_AirPlayReceiverKit <= 90
          && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
        {
          LogPrintF();
        }
      }
    }
  }

}

- (BOOL)_isRotatedTransform:(unint64_t)a3
{
  return a3 == 7 || a3 == 4;
}

- (BOOL)_shouldFlip:(unsigned int)a3
{
  BOOL v5;

  v5 = -[APRKStreamRenderer _isRotatedTransform:](self, "_isRotatedTransform:", self->_transform);
  return v5 ^ -[APRKStreamRenderer _isRotatedTransform:](self, "_isRotatedTransform:", a3);
}

- (void)_updateStreamingMode
{
  NSObject *rendererStateUpdateQueue;
  _QWORD block[5];

  rendererStateUpdateQueue = self->_rendererStateUpdateQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __42__APRKStreamRenderer__updateStreamingMode__block_invoke;
  block[3] = &unk_24FA1BC70;
  block[4] = self;
  dispatch_async(rendererStateUpdateQueue, block);
}

void __42__APRKStreamRenderer__updateStreamingMode__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  _QWORD block[6];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 32))
  {
    v3 = 4;
  }
  else if (*(_DWORD *)(v2 + 28))
  {
    v3 = 1;
  }
  else
  {
    v3 = 2 * (*(_DWORD *)(v2 + 36) != 0);
  }
  v4 = *(_QWORD *)(v2 + 376);
  if (gLogCategory_AirPlayReceiverKit <= 30
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v4 != v3)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 376) = v3;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(NSObject **)(v5 + 160);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __42__APRKStreamRenderer__updateStreamingMode__block_invoke_2;
    block[3] = &unk_24FA1C040;
    block[4] = v5;
    block[5] = v3;
    dispatch_async(v6, block);
  }
}

void __42__APRKStreamRenderer__updateStreamingMode__block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 50
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 40);
      v7 = *(_QWORD *)(a1 + 32);
      v5 = v4;
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v5, v6, v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "didChangeStreamRendererModeTo:forRenderer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (BOOL)_receiverSupportsMirroring
{
  void *v2;
  BOOL v3;

  +[APRKStreamRenderingManager sharedInstance](APRKStreamRenderingManager, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportedModesMask") & 1;

  return v3;
}

- (void)_performUIControllerActionWithBlock:(id)a3
{
  void (**v4)(_QWORD, uint64_t);
  uint64_t v5;
  const void *v6;
  int v7;
  int v8;
  void (**v9)(_QWORD, uint64_t);

  v4 = (void (**)(_QWORD, uint64_t))a3;
  v9 = v4;
  if (self->_backingUIControllerWeakRef)
  {
    v5 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v5)
    {
      v6 = (const void *)v5;
      if (v9)
        v9[2](v9, v5);
      CFRelease(v6);
      goto LABEL_6;
    }
    v4 = v9;
    if (gLogCategory_AirPlayReceiverKit <= 60)
    {
      if (gLogCategory_AirPlayReceiverKit != -1 || (v8 = _LogCategory_Initialize(), v4 = v9, v8))
      {
LABEL_13:
        LogPrintF();
LABEL_6:
        v4 = v9;
      }
    }
  }
  else if (gLogCategory_AirPlayReceiverKit <= 60)
  {
    if (gLogCategory_AirPlayReceiverKit != -1)
      goto LABEL_13;
    v7 = _LogCategory_Initialize();
    v4 = v9;
    if (v7)
      goto LABEL_13;
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *delegateQueue;
  _QWORD *v14;
  objc_super v15;
  _QWORD block[5];
  _QWORD v17[5];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if ((void *)VideoRenderingLayerContext == a6)
  {
    if (!objc_msgSend(v10, "isEqualToString:", CFSTR("bounds")))
      goto LABEL_8;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v17[3] = &unk_24FA1BC70;
    v17[4] = self;
    delegateQueue = MEMORY[0x24BDAC9B8];
    v14 = v17;
LABEL_7:
    dispatch_async(delegateQueue, v14);
    goto LABEL_8;
  }
  if ((void *)APRKMediaPlayerContext == a6)
  {
    delegateQueue = self->_delegateQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    block[3] = &unk_24FA1BC70;
    block[4] = self;
    v14 = block;
    goto LABEL_7;
  }
  v15.receiver = self;
  v15.super_class = (Class)APRKStreamRenderer;
  -[APRKStreamRenderer observeValueForKeyPath:ofObject:change:context:](&v15, sel_observeValueForKeyPath_ofObject_change_context_, v10, v11, v12, a6);
LABEL_8:

}

uint64_t __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_enqueueVideoFrameForRendering:", 0);
}

void __69__APRKStreamRenderer_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v2;
  char v3;
  void *v4;
  id WeakRetained;
  id v6;

  if (gLogCategory_AirPlayReceiverKit <= 50
    && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
  {
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
    LogPrintF();

  }
  v2 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    v6 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 368));
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "currentItemMetadata");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "didUpdateMetadata:forRenderer:", v4, *(_QWORD *)(a1 + 32));

  }
}

- (void)mediaPlayer:(id)a3 wantsToSendUpstreamMessageWithDictionary:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __75__APRKStreamRenderer_mediaPlayer_wantsToSendUpstreamMessageWithDictionary___block_invoke;
  v7[3] = &unk_24FA1C2D0;
  v8 = v5;
  v6 = v5;
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v7);

}

void __75__APRKStreamRenderer_mediaPlayer_wantsToSendUpstreamMessageWithDictionary___block_invoke(uint64_t a1, uint64_t a2)
{
  UIControllerSendUpstreamMessage(a2, *(_QWORD *)(a1 + 32));
}

- (void)mediaPlayer:(id)a3 didGenerateFPSSecureStopRecordPayload:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__APRKStreamRenderer_mediaPlayer_didGenerateFPSSecureStopRecordPayload___block_invoke;
  v7[3] = &unk_24FA1C2D0;
  v8 = v5;
  v6 = v5;
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v7);

}

uint64_t __72__APRKStreamRenderer_mediaPlayer_didGenerateFPSSecureStopRecordPayload___block_invoke()
{
  return UIControllerPostNotificationForFPSSecureStopGeneratedEvent();
}

- (void)mediaPlayerNeedsTLSInfo:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__APRKStreamRenderer_mediaPlayerNeedsTLSInfo___block_invoke;
  v6[3] = &unk_24FA1C2D0;
  v7 = v4;
  v5 = v4;
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v6);

}

void __46__APRKStreamRenderer_mediaPlayerNeedsTLSInfo___block_invoke(uint64_t a1)
{
  id v2;

  v2 = (id)UIControllerCopyTLSInfo();
  objc_msgSend(*(id *)(a1 + 32), "processTLSInfoDictionary:", v2);

}

- (void)mediaPlayer:(id)a3 wantsToPostNotification:(id)a4 withPayload:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__APRKStreamRenderer_mediaPlayer_wantsToPostNotification_withPayload___block_invoke;
  v11[3] = &unk_24FA1C018;
  v12 = v7;
  v13 = v8;
  v9 = v8;
  v10 = v7;
  -[APRKStreamRenderer _performUIControllerActionWithBlock:](self, "_performUIControllerActionWithBlock:", v11);

}

uint64_t __70__APRKStreamRenderer_mediaPlayer_wantsToPostNotification_withPayload___block_invoke()
{
  CMNotificationCenterGetDefaultLocalCenter();
  return CMNotificationCenterPostNotification();
}

- (void)processSenderUIEvent:(id)a3
{
  id v4;
  NSObject *delegateQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  delegateQueue = self->_delegateQueue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __43__APRKStreamRenderer_processSenderUIEvent___block_invoke;
  v7[3] = &unk_24FA1BD10;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(delegateQueue, v7);

}

void __43__APRKStreamRenderer_processSenderUIEvent___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    if (gLogCategory_AirPlayReceiverKit <= 10
      && (gLogCategory_AirPlayReceiverKit != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();

    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleSenderUIEvent:forRenderer:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

  }
}

- (NSUUID)uniqueID
{
  return self->_uniqueID;
}

- (NSString)managedClientName
{
  return self->_managedClientName;
}

- (APRKStreamRendererDelegate)delegate
{
  return (APRKStreamRendererDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isMirroringAudioStreamPaused
{
  return self->_isMirroringAudioStreamPaused;
}

- (BOOL)autoRotateLayerFollowingClientRotation
{
  return self->_autoRotateLayerFollowingClientRotation;
}

- (void)setAutoRotateLayerFollowingClientRotation:(BOOL)a3
{
  self->_autoRotateLayerFollowingClientRotation = a3;
}

- (unint64_t)streamRendererMode
{
  return self->_streamRendererMode;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedClientName, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_demoDeviceInfo, 0);
  objc_storeStrong((id *)&self->_ensembleInfo, 0);
  objc_destroyWeak((id *)&self->_sampleBufferDelegate);
  objc_destroyWeak((id *)&self->_airPlayReceiverUIDelegate);
  objc_storeStrong((id *)&self->_currentRecordingURL, 0);
  objc_storeStrong((id *)&self->_recorderKeyFrameTimer, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_rendererStateUpdateQueue, 0);
  objc_storeStrong((id *)&self->_rendererAudioBufferQueue, 0);
  objc_storeStrong((id *)&self->_rendererVideoBufferQueue, 0);
  objc_storeStrong((id *)&self->_figVideoQueueNotifObserver, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_recorder, 0);
  objc_storeStrong((id *)&self->_debugLayer, 0);
  objc_storeStrong((id *)&self->_mirroringLayer, 0);
  objc_storeStrong((id *)&self->_audioRenderer, 0);
  objc_storeStrong((id *)&self->_synchronizer, 0);
}

@end
