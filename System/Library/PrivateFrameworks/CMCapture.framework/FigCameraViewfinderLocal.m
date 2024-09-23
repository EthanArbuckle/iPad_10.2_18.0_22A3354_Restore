@implementation FigCameraViewfinderLocal

- (void)startWithOptions:(id)a3
{

  self->_options = (NSDictionary *)objc_msgSend(a3, "copy");
  objc_msgSend(+[FigCaptureSessionObservatory sharedObservatory](FigCaptureSessionObservatory, "sharedObservatory"), "registerObserver:", self);
  self->_observing = 1;
}

- (FigCameraViewfinderLocal)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderLocal;
  return -[FigCameraViewfinder init](&v3, sel_init);
}

+ (id)cameraViewfinder
{
  return objc_alloc_init((Class)objc_opt_class());
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FigCameraViewfinderLocal;
  -[FigCameraViewfinder dealloc](&v3, sel_dealloc);
}

- (void)stop
{
  if (self->_observing)
  {
    self->_observing = 0;
    objc_msgSend(+[FigCaptureSessionObservatory sharedObservatory](FigCaptureSessionObservatory, "sharedObservatory"), "unregisterObserver:", self);
    objc_sync_enter(self);
    -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, 0, 0);
    objc_sync_exit(self);
  }
}

- (void)_updateActiveViewfinderSession:(int)a3 sessionStatus:
{
  void *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD v10[6];
  int v11;
  _QWORD v12[6];

  if (a1)
  {
    v5 = *(void **)(a1 + 40);
    if (v5 != a2)
    {
      v7 = MEMORY[0x1E0C809B0];
      if (v5)
      {
        *(_QWORD *)(a1 + 40) = 0;
        objc_msgSend(v5, "_captureSessionDidStop");
        v8 = *(void **)(a1 + 8);
        v12[0] = v7;
        v12[1] = 3221225472;
        v12[2] = __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke;
        v12[3] = &unk_1E49215D8;
        v12[4] = a1;
        v12[5] = v5;
        objc_msgSend(v8, "invokeDelegateCallbackWithBlock:", v12);

      }
      if (a2)
      {
        *(_QWORD *)(a1 + 40) = a2;
        v9 = *(void **)(a1 + 8);
        v10[0] = v7;
        v10[1] = 3221225472;
        v10[2] = __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke_2;
        v10[3] = &unk_1E4921600;
        v10[4] = a1;
        v10[5] = a2;
        v11 = a3;
        objc_msgSend(v9, "invokeDelegateCallbackWithBlock:", v10);
      }
    }
  }
}

- (void)captureSessionWillStart:(id)a3
{
  FigCameraViewfinderSessionLocal *activeViewfinderSession;
  uint64_t v6;
  id v7;

  if (objc_msgSend(a3, "containsVideoSource"))
  {
    objc_sync_enter(self);
    v7 = -[FigCameraViewfinderSessionLocal _initWithOwningViewfinder:captureSessionProxy:delegateStorage:]([FigCameraViewfinderSessionLocal alloc], "_initWithOwningViewfinder:captureSessionProxy:delegateStorage:", self, a3, self->super._delegateStorage);
    activeViewfinderSession = self->_activeViewfinderSession;
    if (!activeViewfinderSession
      || (v6 = -[FigCameraViewfinderSessionLocal identifier](activeViewfinderSession, "identifier"),
          v6 <= objc_msgSend(a3, "identifier")))
    {
      -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, v7, 1);
    }
    objc_sync_exit(self);

  }
}

- (void)captureSessionDidStart:(id)a3
{
  int64_t v5;
  FigCameraViewfinderSessionLocal *activeViewfinderSession;
  FigDelegateStorage *delegateStorage;
  id v8;
  FigCameraViewfinderSessionLocal *v9;
  uint64_t v10;
  _QWORD v11[6];

  if (objc_msgSend(a3, "containsVideoSource"))
  {
    objc_sync_enter(self);
    v5 = -[FigCameraViewfinderSessionLocal identifier](self->_activeViewfinderSession, "identifier");
    if (v5 == objc_msgSend(a3, "identifier"))
    {
      activeViewfinderSession = self->_activeViewfinderSession;
      delegateStorage = self->super._delegateStorage;
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __51__FigCameraViewfinderLocal_captureSessionDidStart___block_invoke;
      v11[3] = &unk_1E49215D8;
      v11[4] = self;
      v11[5] = activeViewfinderSession;
      -[FigDelegateStorage invokeDelegateCallbackWithBlock:](delegateStorage, "invokeDelegateCallbackWithBlock:", v11);
      v8 = 0;
    }
    else
    {
      v8 = -[FigCameraViewfinderSessionLocal _initWithOwningViewfinder:captureSessionProxy:delegateStorage:]([FigCameraViewfinderSessionLocal alloc], "_initWithOwningViewfinder:captureSessionProxy:delegateStorage:", self, a3, self->super._delegateStorage);
      v9 = self->_activeViewfinderSession;
      if (!v9
        || (v10 = -[FigCameraViewfinderSessionLocal identifier](v9, "identifier"), v10 <= objc_msgSend(a3, "identifier")))
      {
        -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, v8, 2);
      }
    }
    objc_sync_exit(self);

  }
}

uint64_t __51__FigCameraViewfinderLocal_captureSessionDidStart___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidBegin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (void)captureSessionDidStop:(int64_t)a3
{
  objc_sync_enter(self);
  if (-[FigCameraViewfinderSessionLocal identifier](self->_activeViewfinderSession, "identifier") == a3)
    -[FigCameraViewfinderLocal _updateActiveViewfinderSession:sessionStatus:]((uint64_t)self, 0, 0);
  objc_sync_exit(self);
}

- (void)captureSession:(int64_t)a3 didCapturePhotoWithStatus:(int)a4 thumbnailData:(id)a5 timestamp:(id *)a6
{
  uint64_t v8;
  FigCameraViewfinderSessionLocal *activeViewfinderSession;
  __int128 v12;
  int64_t var3;

  if (a3)
  {
    v8 = *(_QWORD *)&a4;
    objc_sync_enter(self);
    if (-[FigCameraViewfinderSessionLocal identifier](self->_activeViewfinderSession, "identifier") == a3)
    {
      activeViewfinderSession = self->_activeViewfinderSession;
      v12 = *(_OWORD *)&a6->var0;
      var3 = a6->var3;
      -[FigCameraViewfinderSessionLocal _captureSessionDidCapturePhotoWithStatus:thumbnailData:timestamp:](activeViewfinderSession, "_captureSessionDidCapturePhotoWithStatus:thumbnailData:timestamp:", v8, a5, &v12);
    }
    objc_sync_exit(self);
  }
}

- (int)photoThumbnailMaxDimension
{
  return objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("PhotoThumbnailMaxDimension")), "intValue");
}

- (BOOL)photoThumbnailQualitySpecified
{
  return -[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("PhotoThumbnailQuality")) != 0;
}

- (float)photoThumbnailQuality
{
  float result;
  float v3;

  objc_msgSend(-[NSDictionary objectForKeyedSubscript:](self->_options, "objectForKeyedSubscript:", CFSTR("PhotoThumbnailQuality")), "floatValue");
  v3 = 0.0;
  if (result < 0.0 || (v3 = 1.0, result > 1.0))
  {
    if ((photoThumbnailQuality_haveWarnedAboutOutOfRangeValues & 1) == 0)
      photoThumbnailQuality_haveWarnedAboutOutOfRangeValues = 1;
    return v3;
  }
  return result;
}

- (void)captureSessionDidStartMovieRecording:(int64_t)a3
{
  objc_sync_enter(self);
  if (-[FigCameraViewfinderSessionLocal identifier](self->_activeViewfinderSession, "identifier") == a3)
    -[FigCameraViewfinderSessionLocal _captureSessionDidStartMovieRecording](self->_activeViewfinderSession, "_captureSessionDidStartMovieRecording");
  objc_sync_exit(self);
}

- (void)captureSessionDidFinishMovieRecording:(int64_t)a3
{
  objc_sync_enter(self);
  if (-[FigCameraViewfinderSessionLocal identifier](self->_activeViewfinderSession, "identifier") == a3)
    -[FigCameraViewfinderSessionLocal _captureSessionDidFinishMovieRecording](self->_activeViewfinderSession, "_captureSessionDidFinishMovieRecording");
  objc_sync_exit(self);
}

uint64_t __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(*(id *)(a1 + 32), "setDelegateActiveViewfinderSession:", 0);
  return objc_msgSend(a2, "cameraViewfinder:viewfinderSessionDidEnd:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

uint64_t __73__FigCameraViewfinderLocal__updateActiveViewfinderSession_sessionStatus___block_invoke_2(uint64_t a1)
{
  uint64_t result;
  int v3;

  result = objc_msgSend(*(id *)(a1 + 32), "setDelegateActiveViewfinderSession:", *(_QWORD *)(a1 + 40));
  v3 = *(_DWORD *)(a1 + 48);
  if (v3 == 2)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "cameraViewfinder:viewfinderSessionDidBegin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  if (v3 == 1)
    return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "delegate"), "cameraViewfinder:viewfinderSessionWillBegin:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  return result;
}

@end
