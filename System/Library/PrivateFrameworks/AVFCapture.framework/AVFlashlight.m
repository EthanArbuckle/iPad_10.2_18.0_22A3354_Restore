@implementation AVFlashlight

- (float)flashlightLevel
{
  AVFlashlightInternal *internal;
  float flashlightLevel;

  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = self->_internal;
  flashlightLevel = internal->flashlightLevel;
  MEMORY[0x1A1AF12A4](internal->lock);
  return flashlightLevel;
}

- (BOOL)isOverheated
{
  AVFlashlight *v2;
  AVFlashlightInternal *internal;

  v2 = self;
  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = v2->_internal;
  LOBYTE(v2) = internal->overheated;
  MEMORY[0x1A1AF12A4](internal->lock);
  return (char)v2;
}

- (BOOL)isAvailable
{
  AVFlashlight *v2;
  AVFlashlightInternal *internal;

  v2 = self;
  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = v2->_internal;
  LOBYTE(v2) = internal->available;
  MEMORY[0x1A1AF12A4](internal->lock);
  return (char)v2;
}

- (void)_handleNotification:(id)a3 payload:(id)a4
{
  AVFlashlightInternal *internal;
  int available;
  int overheated;
  float flashlightLevel;
  float beamWidth;
  int v12;
  int v13;
  float v14;
  float v15;
  int v16;
  float v17;
  float v18;

  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = self->_internal;
  available = internal->available;
  overheated = internal->overheated;
  flashlightLevel = internal->flashlightLevel;
  beamWidth = internal->beamWidth;
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05380]))
  {
    v12 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05378]), "BOOLValue");
    v13 = overheated != 0;
    if (v12)
      v14 = flashlightLevel;
    else
      v14 = 0.0;
    goto LABEL_12;
  }
  if (objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05398]))
  {
    v13 = objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05378]), "BOOLValue");
    v12 = available != 0;
LABEL_11:
    v14 = flashlightLevel;
    goto LABEL_12;
  }
  if (!objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05390]))
  {
    v16 = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x1E0D05388]);
    v12 = available != 0;
    v13 = overheated != 0;
    if (v16)
    {
      objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05378]), "floatValue");
      v18 = self->_internal->minBeamWidth
          + (float)(v17 * (float)(self->_internal->maxBeamWidth - self->_internal->minBeamWidth));
      v14 = flashlightLevel;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  objc_msgSend((id)objc_msgSend(a4, "objectForKeyedSubscript:", *MEMORY[0x1E0D05378]), "floatValue");
  v14 = v15;
  v12 = available != 0;
  v13 = overheated != 0;
LABEL_12:
  v18 = beamWidth;
LABEL_13:
  MEMORY[0x1A1AF12A4](self->_internal->lock);
  if (v14 != flashlightLevel)
    -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("flashlightLevel"));
  if (v18 != beamWidth)
    -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("beamWidth"));
  if (available != v12)
    -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("available"));
  if (overheated != v13)
    -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("overheated"));
  MEMORY[0x1A1AF1298](self->_internal->lock);
  self->_internal->flashlightLevel = v14;
  self->_internal->beamWidth = v18;
  self->_internal->available = v12;
  self->_internal->overheated = v13;
  MEMORY[0x1A1AF12A4](self->_internal->lock);
  if (overheated != v13)
    -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("overheated"));
  if (available != v12)
    -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("available"));
  if (v14 != flashlightLevel)
    -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("flashlightLevel"));
  if (v18 != beamWidth)
    -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("BeamWidth"));
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

+ (BOOL)hasFlashlight
{
  if (hasFlashlight_onceToken != -1)
    dispatch_once(&hasFlashlight_onceToken, &__block_literal_global_1);
  return hasFlashlight_hasFlashlight;
}

uint64_t __29__AVFlashlight_hasFlashlight__block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  hasFlashlight_hasFlashlight = result;
  return result;
}

- (void)_setupFlashlight
{
  int v3;
  void *v4;

  FigSimpleMutexCheckIsLockedOnThisThread();
  if ((AVCaptureIsRunningInMediaserverd() & 1) != 0)
  {
    if (FigFlashlightCreate())
    {
LABEL_8:
      FigDebugAssert3();
      return;
    }
  }
  else if (FigFlashlightRemoteCreate())
  {
    v3 = 2;
    while (1)
    {
      usleep(0x3D090u);
      if (!FigFlashlightRemoteCreate())
        break;
      if (!--v3)
        goto LABEL_8;
    }
  }
  v4 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, avflashlightNotification, *MEMORY[0x1E0D05380], self->_internal->flashlight, 0);
  objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, avflashlightNotification, *MEMORY[0x1E0D05398], self->_internal->flashlight, 0);
  objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, avflashlightNotification, *MEMORY[0x1E0D05390], self->_internal->flashlight, 0);
  objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, avflashlightNotification, *MEMORY[0x1E0D05388], self->_internal->flashlight, 0);
  objc_msgSend(v4, "addListenerWithWeakReference:callback:name:object:flags:", self->_internal->weakReference, avflashlightNotification, *MEMORY[0x1E0D053A0], self->_internal->flashlight, 0);
}

- (void)_teardownFlashlight
{
  void *v3;
  AVFlashlightInternal *internal;
  AVWeakReference *weakReference;
  OpaqueFigFlashlight *flashlight;

  FigSimpleMutexCheckIsLockedOnThisThread();
  if (self->_internal->flashlight)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CF2D18], "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    internal = self->_internal;
    weakReference = internal->weakReference;
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakReference, avflashlightNotification, *MEMORY[0x1E0D05380], internal->flashlight);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakReference, avflashlightNotification, *MEMORY[0x1E0D05398], self->_internal->flashlight);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakReference, avflashlightNotification, *MEMORY[0x1E0D05390], self->_internal->flashlight);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakReference, avflashlightNotification, *MEMORY[0x1E0D05388], self->_internal->flashlight);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", weakReference, avflashlightNotification, *MEMORY[0x1E0D053A0], self->_internal->flashlight);
    flashlight = self->_internal->flashlight;
    if (flashlight)
    {
      CFRelease(flashlight);
      self->_internal->flashlight = 0;
    }
  }
}

- (AVFlashlight)init
{
  AVFlashlight *v3;
  NSObject *v4;
  OpaqueFigFlashlight *flashlight;
  void (*v6)(OpaqueFigFlashlight *);
  float FloatAnswer;
  BOOL v8;
  AVFlashlightInternal *internal;
  AVFlashlightInternal *v10;
  void *v11;
  objc_super v13;

  if (!+[AVFlashlight hasFlashlight](AVFlashlight, "hasFlashlight"))
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99750], AVMethodExceptionReasonWithObjectAndSelector(), 0);

    if (AVCaptureShouldThrowForAPIViolations())
      objc_exception_throw(v11);
    NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v11);
    return 0;
  }
  v13.receiver = self;
  v13.super_class = (Class)AVFlashlight;
  v3 = -[AVFlashlight init](&v13, sel_init);
  if (v3)
  {
    v3->_internal = objc_alloc_init(AVFlashlightInternal);
    v3->_internal->weakReference = (AVWeakReference *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF2D50]), "initWithReferencedObject:", v3);
    v3->_internal->lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3->_internal->serverReconnectQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.avflashlight-server-reconnect", v4);
    MEMORY[0x1A1AF1298](v3->_internal->lock);
    -[AVFlashlight _setupFlashlight](v3, "_setupFlashlight");
    *(_WORD *)&v3->_internal->available = 1;
    flashlight = v3->_internal->flashlight;
    if (flashlight)
    {
      v6 = *(void (**)(OpaqueFigFlashlight *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
      if (v6)
        v6(flashlight);
    }
    v3->_internal->flashlightLevel = 0.0;
    v3->_internal->minBeamWidth = AVGestaltGetFloatAnswer((uint64_t)CFSTR("AVGQTorchMinBeamWidth"));
    FloatAnswer = AVGestaltGetFloatAnswer((uint64_t)CFSTR("AVGQTorchMaxBeamWidth"));
    v8 = 0;
    v3->_internal->maxBeamWidth = FloatAnswer;
    internal = v3->_internal;
    if (internal->minBeamWidth > 0.0)
      v8 = internal->maxBeamWidth > 0.0;
    internal->beamWidthControlSupported = v8;
    v10 = v3->_internal;
    if (v10->beamWidthControlSupported && v10->minBeamWidth > v10->maxBeamWidth)
    {
      v10->beamWidthControlSupported = 0;
      v10 = v3->_internal;
    }
    v10->beamWidth = v10->minBeamWidth;
    MEMORY[0x1A1AF12A4](v3->_internal->lock);
    if (!v3->_internal->flashlight)
    {

      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  AVFlashlightInternal *internal;
  objc_super v4;

  internal = self->_internal;
  if (internal)
  {
    MEMORY[0x1A1AF1298](internal->lock, a2);
    -[AVFlashlight _teardownFlashlight](self, "_teardownFlashlight");
    MEMORY[0x1A1AF12A4](self->_internal->lock);
    FigSimpleMutexDestroy();

  }
  v4.receiver = self;
  v4.super_class = (Class)AVFlashlight;
  -[AVFlashlight dealloc](&v4, sel_dealloc);
}

- (BOOL)turnPowerOnWithError:(id *)a3
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigFlashlight *flashlight;
  uint64_t (*v7)(OpaqueFigFlashlight *);
  int v8;

  if (dword_1ECFED5E0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  flashlight = self->_internal->flashlight;
  if (flashlight)
  {
    v7 = *(uint64_t (**)(OpaqueFigFlashlight *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v7)
      v8 = v7(flashlight);
    else
      v8 = -12782;
  }
  else
  {
    v8 = -16450;
  }
  MEMORY[0x1A1AF12A4](self->_internal->lock);
  if (a3 && v8)
    *a3 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
  return v8 == 0;
}

- (void)turnPowerOff
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigFlashlight *flashlight;
  void (*v5)(OpaqueFigFlashlight *);

  if (dword_1ECFED5E0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  flashlight = self->_internal->flashlight;
  if (flashlight)
  {
    v5 = *(void (**)(OpaqueFigFlashlight *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v5)
      v5(flashlight);
  }
  MEMORY[0x1A1AF12A4](self->_internal->lock);
}

- (BOOL)setFlashlightLevel:(float)a3 withError:(id *)a4
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v9;
  AVFlashlightInternal *internal;
  float flashlightLevel;
  _BOOL4 v12;
  _BOOL4 v13;
  OpaqueFigFlashlight *flashlight;
  unsigned int (*v15)(OpaqueFigFlashlight *, float);
  OpaqueFigFlashlight *v16;
  float (*v17)(OpaqueFigFlashlight *);

  if (dword_1ECFED5E0)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  if (a3 != 3.4028e38 && (a3 < 0.0 || a3 > 1.0))
  {
    v9 = 0;
    if (a4)
      *a4 = (id)AVLocalizedError();
    return v9;
  }
  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = self->_internal;
  flashlightLevel = internal->flashlightLevel;
  v12 = flashlightLevel != 1.0 || a3 != 3.4028e38;
  v13 = flashlightLevel != a3 && v12;
  if (!v13)
    goto LABEL_25;
  flashlight = internal->flashlight;
  if (!flashlight)
    goto LABEL_23;
  v15 = *(unsigned int (**)(OpaqueFigFlashlight *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v15)
  {
    if (!a4)
      goto LABEL_25;
    goto LABEL_24;
  }
  if (v15(flashlight, a3))
  {
LABEL_23:
    if (a4)
LABEL_24:
      *a4 = (id)AVLocalizedErrorWithUnderlyingOSStatus();
LABEL_25:
    v9 = !v13;
    MEMORY[0x1A1AF12A4](self->_internal->lock);
    return v9;
  }
  if (a3 == 3.4028e38)
  {
    v16 = self->_internal->flashlight;
    v17 = *(float (**)(OpaqueFigFlashlight *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
    if (v17)
      a3 = v17(v16);
    else
      a3 = 0.0;
  }
  MEMORY[0x1A1AF12A4](self->_internal->lock);
  -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("flashlightLevel"));
  MEMORY[0x1A1AF1298](self->_internal->lock);
  self->_internal->flashlightLevel = a3;
  MEMORY[0x1A1AF12A4](self->_internal->lock);
  -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("flashlightLevel"));
  return 1;
}

- (BOOL)beamWidthControlSupported
{
  return self->_internal->beamWidthControlSupported;
}

- (float)minBeamWidth
{
  return self->_internal->minBeamWidth;
}

- (float)maxBeamWidth
{
  return self->_internal->maxBeamWidth;
}

- (void)setBeamWidth:(float)a3
{
  AVFlashlightInternal *internal;
  void *v7;
  uint64_t v8;
  void *v9;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  AVFlashlightInternal *v11;
  OpaqueFigFlashlight *flashlight;
  float minBeamWidth;
  float maxBeamWidth;
  uint64_t (*v15)(OpaqueFigFlashlight *, float);
  int v16;

  internal = self->_internal;
  if (internal->beamWidthControlSupported)
  {
    if (internal->minBeamWidth <= a3 && internal->maxBeamWidth >= a3)
    {
      if (dword_1ECFED5E0)
      {
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        internal = self->_internal;
      }
      MEMORY[0x1A1AF1298](internal->lock, a2);
      v11 = self->_internal;
      if (v11->beamWidth != a3)
      {
        flashlight = v11->flashlight;
        if (flashlight)
        {
          minBeamWidth = v11->minBeamWidth;
          maxBeamWidth = v11->maxBeamWidth;
          v15 = *(uint64_t (**)(OpaqueFigFlashlight *, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
          if (v15)
          {
            v16 = v15(flashlight, (float)(a3 - minBeamWidth) / (float)(maxBeamWidth - minBeamWidth));
            MEMORY[0x1A1AF12A4](self->_internal->lock);
            if (!v16)
            {
              -[AVFlashlight willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("beamWidth"));
              MEMORY[0x1A1AF1298](self->_internal->lock);
              self->_internal->beamWidth = a3;
              MEMORY[0x1A1AF12A4](self->_internal->lock);
              -[AVFlashlight didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("beamWidth"));
            }
            return;
          }
          v11 = self->_internal;
        }
      }
      MEMORY[0x1A1AF12A4](v11->lock);
      return;
    }
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99858];
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C99DA0];
    v8 = *MEMORY[0x1E0C99750];
  }
  v9 = (void *)objc_msgSend(v7, "exceptionWithName:reason:userInfo:", v8, AVMethodExceptionReasonWithObjectAndSelector(), 0);
  if (AVCaptureShouldThrowForAPIViolations())
    objc_exception_throw(v9);
  NSLog(CFSTR("** Suppressing exception throw for API contract violation - %@"), v9);
}

- (float)beamWidth
{
  AVFlashlightInternal *internal;
  float beamWidth;

  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = self->_internal;
  beamWidth = internal->beamWidth;
  MEMORY[0x1A1AF12A4](internal->lock);
  return beamWidth;
}

- (void)_reconnectToServer
{
  AVFlashlightInternal *internal;
  float flashlightLevel;
  _QWORD *v5;
  void *v6;
  _QWORD block[5];

  MEMORY[0x1A1AF1298](self->_internal->lock, a2);
  internal = self->_internal;
  flashlightLevel = internal->flashlightLevel;
  MEMORY[0x1A1AF12A4](internal->lock);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__AVFlashlight__reconnectToServer__block_invoke;
  block[3] = &unk_1E42165A8;
  block[4] = self;
  if (flashlightLevel <= 0.0)
  {
    v6 = 0;
    v5 = block;
  }
  else
  {
    v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_USER_INTERACTIVE, 0, block);
    v6 = v5;
  }
  dispatch_async((dispatch_queue_t)self->_internal->serverReconnectQueue, v5);

}

void __34__AVFlashlight__reconnectToServer__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  float v4;
  float v5;
  float v6;
  void (*v7)(uint64_t, float);
  uint64_t v8;
  float v9;
  uint64_t v10;
  void (*v11)(uint64_t, float);
  uint64_t v12;
  void (*v13)(uint64_t);

  MEMORY[0x1A1AF1298](*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
  objc_msgSend(*(id *)(a1 + 32), "_teardownFlashlight");
  objc_msgSend(*(id *)(a1 + 32), "_setupFlashlight");
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v3 = *(_QWORD *)(v2 + 16);
  if (v3)
  {
    v4 = *(float *)(v2 + 44);
    if (v4 > 0.0)
    {
      v5 = *(float *)(v2 + 36);
      v6 = *(float *)(v2 + 40);
      v7 = *(void (**)(uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
      if (v7)
        v7(v3, (float)(v4 - v5) / (float)(v6 - v5));
    }
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(float *)(v8 + 28);
    if (v9 > 0.0)
    {
      v10 = *(_QWORD *)(v8 + 16);
      v11 = *(void (**)(uint64_t, float))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
      if (v11)
        v11(v10, v9);
    }
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 16);
    v13 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
    if (v13)
      v13(v12);
  }
  JUMPOUT(0x1A1AF12A4);
}

@end
