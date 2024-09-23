@implementation FigScreenCaptureController

+ (id)screenCaptureControllerWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4
{
  double height;
  double width;
  FigScreenCaptureController *v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;

  height = a3.height;
  width = a3.width;
  v7 = [FigScreenCaptureController alloc];
  v9 = *a4;
  return -[FigScreenCaptureController initWithSize:minIntervalBetweenFrames:](v7, "initWithSize:minIntervalBetweenFrames:", &v9, width, height);
}

+ (id)screenCaptureControllerWithFigVirtualDisplayOptions:(id)a3
{
  return -[FigScreenCaptureController initWithFigVirtualDisplayOptions:]([FigScreenCaptureController alloc], "initWithFigVirtualDisplayOptions:", a3);
}

+ (id)screenCaptureControllerWithCaptureConfiguration:(id)a3
{
  return -[FigScreenCaptureController initWithScreenCaptureConfiguration:]([FigScreenCaptureController alloc], "initWithScreenCaptureConfiguration:", a3);
}

+ (id)screenCaptureControllerWithDisplayConfiguration:(id)a3
{
  return -[FigScreenCaptureController initWithDisplayConfiguration:]([FigScreenCaptureController alloc], "initWithDisplayConfiguration:", a3);
}

- (FigScreenCaptureController)initWithSize:(CGSize)a3 minIntervalBetweenFrames:(id *)a4
{
  CGFloat height;
  CGFloat width;
  FigScreenCaptureController *v7;
  CFDictionaryRef DictionaryRepresentation;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  objc_super v11;
  const __CFString *v12;
  _QWORD v13[2];
  CGSize v14;

  height = a3.height;
  width = a3.width;
  v13[1] = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)FigScreenCaptureController;
  v7 = -[FigScreenCaptureController init](&v11, sel_init);
  if (v7)
  {
    v7->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v7->_options = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v14.width = width;
    v14.height = height;
    DictionaryRepresentation = CGSizeCreateDictionaryRepresentation(v14);
    v12 = CFSTR("displaySizeInPixels");
    v13[0] = DictionaryRepresentation;
    CFDictionarySetValue(v7->_options, CFSTR("deviceInfo"), (const void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1));
    if (DictionaryRepresentation)
      CFRelease(DictionaryRepresentation);
    v10 = *a4;
    CMTimeGetSeconds((CMTime *)&v10);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v7->_options, CFSTR("usage"), CFSTR("Uncompressed"));
    CFDictionarySetValue(v7->_options, CFSTR("ScreenRecording"), (const void *)*MEMORY[0x1E0C9AE50]);
    FigCFDictionarySetInt32();
    CFDictionarySetValue(v7->_options, CFSTR("DisplayLabel"), CFSTR("ScreenCapture"));
    v7->_mode = 0;
  }
  return v7;
}

- (FigScreenCaptureController)initWithFigVirtualDisplayOptions:(id)a3
{
  FigScreenCaptureController *v4;
  const __CFAllocator *v5;
  __CFDictionary *MutableCopy;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FigScreenCaptureController;
  v4 = -[FigScreenCaptureController init](&v8, sel_init);
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (a3)
      MutableCopy = CFDictionaryCreateMutableCopy(v5, 0, (CFDictionaryRef)a3);
    else
      MutableCopy = CFDictionaryCreateMutable(v5, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v4->_options = MutableCopy;
    CFDictionaryAddValue(MutableCopy, CFSTR("DisplayLabel"), CFSTR("AirPlay"));
    v4->_mode = 0;
  }
  return v4;
}

- (FigScreenCaptureController)initWithScreenCaptureConfiguration:(id)a3
{
  FigScreenCaptureController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  v4 = -[FigScreenCaptureController init](&v6, sel_init);
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)objc_msgSend(a3, "getLock");
    v4->_screenCaptureConfiguration = (FigScreenCaptureConfiguration *)a3;
    v4->_mode = 1;
  }
  return v4;
}

- (FigScreenCaptureController)initWithDisplayConfiguration:(id)a3
{
  FigScreenCaptureController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  v4 = -[FigScreenCaptureController init](&v6, sel_init);
  if (v4)
  {
    v4->_lock = (OpaqueFigSimpleMutex *)objc_msgSend(a3, "getLock");
    v4->_displayConfiguration = (FigDisplayConfiguration *)a3;
    v4->_mode = 2;
  }
  return v4;
}

- (__CFDictionary)getFVDOptions
{
  int mode;
  void *displayConfiguration;

  mode = self->_mode;
  if (mode == 2)
  {
    displayConfiguration = self->_displayConfiguration;
    return (__CFDictionary *)objc_msgSend(displayConfiguration, "getFVDOptions");
  }
  if (mode == 1)
  {
    displayConfiguration = self->_screenCaptureConfiguration;
    return (__CFDictionary *)objc_msgSend(displayConfiguration, "getFVDOptions");
  }
  return self->_options;
}

- (void)setFigVirtualDisplayOption:(id)a3 forKey:(id)a4
{
  __CFDictionary *v7;

  v7 = -[FigScreenCaptureController getFVDOptions](self, "getFVDOptions");
  MEMORY[0x19402EEEC](self->_lock);
  CFDictionarySetValue(v7, a4, a3);
  JUMPOUT(0x19402EF04);
}

- (CGSize)size
{
  int mode;
  double v4;
  double v5;
  CGSize result;

  mode = self->_mode;
  if (mode == 2)
  {
    -[FigDisplayConfiguration maxDisplaySize](self->_displayConfiguration, "maxDisplaySize");
  }
  else if (mode == 1)
  {
    -[FigScreenCaptureConfiguration size](self->_screenCaptureConfiguration, "size");
  }
  else if (mode)
  {
    v4 = 1920.0;
    v5 = 1080.0;
  }
  else
  {
    MEMORY[0x19402EEEC](self->_lock, a2);
    if (CFDictionaryGetValue(self->_options, CFSTR("deviceInfo")))
      FigCFDictionaryGetCGSizeIfPresent();
    MEMORY[0x19402EF04](self->_lock);
    v5 = 1080.0;
    v4 = 1920.0;
  }
  result.height = v5;
  result.width = v4;
  return result;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)minIntervalBetweenFrames
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  int mode;
  int32_t v7;
  CMTime v8;
  int v9;

  v9 = 60;
  *(_QWORD *)&retstr->var1 = 0;
  retstr->var3 = 0;
  retstr->var0 = 0;
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, 60);
  mode = self->_mode;
  if (mode == 2)
  {
    v7 = -[FigDisplayConfiguration refreshRate](self->_displayConfiguration, "refreshRate");
  }
  else
  {
    if (mode == 1)
    {
      result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)self->_screenCaptureConfiguration;
      if (result)
        result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)-[$3CC8671D27C23BF42ADDB32F2B5E48AE minFrameInterval](result, "minFrameInterval");
      else
        memset(&v8, 0, sizeof(v8));
      goto LABEL_10;
    }
    if (mode)
      return result;
    MEMORY[0x19402EEEC](self->_lock);
    FigCFDictionaryGetInt32IfPresent();
    MEMORY[0x19402EF04](self->_lock);
    v7 = v9;
  }
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake(&v8, 1, v7);
LABEL_10:
  *(CMTime *)retstr = v8;
  return result;
}

- (void)dealloc
{
  __CFDictionary *options;
  FigDisplayConfiguration *displayConfiguration;
  FigScreenCaptureConfiguration *screenCaptureConfiguration;
  objc_super v6;

  -[FigScreenCaptureController stopCapture](self, "stopCapture");
  if (!self->_mode)
  {
    options = self->_options;
    if (options)
    {
      CFRelease(options);
      self->_options = 0;
    }
    FigSimpleMutexDestroy();
    self->_lock = 0;
  }
  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)

  screenCaptureConfiguration = self->_screenCaptureConfiguration;
  if (screenCaptureConfiguration)

  v6.receiver = self;
  v6.super_class = (Class)FigScreenCaptureController;
  -[FigScreenCaptureController dealloc](&v6, sel_dealloc);
}

- (id)description
{
  uint64_t mode;
  const __CFString *v4;
  void *v5;
  objc_class *v6;

  mode = self->_mode;
  if (mode > 2)
    v4 = CFSTR("Invalid");
  else
    v4 = off_1E2F7CFA0[mode];
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@: %p, mode = %@, options = %p>"), NSStringFromClass(v6), self, v4, -[FigScreenCaptureController getFVDOptions](self, "getFVDOptions"));
}

- (void)startCapture
{
  __CFDictionary *v3;
  const void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  OpaqueFigVirtualDisplaySession *session;
  uint64_t (*v12)(OpaqueFigVirtualDisplaySession *, __CFDictionary *, _QWORD *);
  int v13;
  NSObject *v14;
  unsigned int v15;
  unsigned int v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  _QWORD v21[5];
  os_log_type_t v22;
  os_log_type_t type[4];
  _QWORD v24[5];
  CFTypeRef v25;
  CFTypeRef cf;
  _BYTE v27[24];
  __int128 v28;
  FigScreenCaptureController *v29;
  uint64_t (*v30)(void *);
  unsigned int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v25 = 0;
  cf = 0;
  v3 = -[FigScreenCaptureController getFVDOptions](self, "getFVDOptions");
  MEMORY[0x19402EEEC](self->_lock);
  v4 = (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[PID%d]"), getpid());
  CFDictionarySetValue(v3, CFSTR("logPrefix"), v4);
  if (self->_session)
  {
    v31 = 0;
    type[0] = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    goto LABEL_21;
  }
  v31 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v5 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
  v6 = FVDUtilsSessionServerEnabled();
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    *(_QWORD *)v27 = 0;
    *(_QWORD *)&v27[8] = v27;
    *(_QWORD *)&v27[16] = 0x3052000000;
    *(_QWORD *)&v28 = __Block_byref_object_copy_;
    *((_QWORD *)&v28 + 1) = __Block_byref_object_dispose_;
    v29 = self;
    v8 = *MEMORY[0x1E0C9AE00];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __42__FigScreenCaptureController_startCapture__block_invoke;
    v24[3] = &unk_1E2F7CF58;
    v24[4] = v27;
    if (FigVirtualDisplaySessionRemoteFrameReceiverCreate(v8, (uint64_t)v3, v24, &self->_session))
    {
      *(_DWORD *)type = 0;
      v22 = OS_LOG_TYPE_DEFAULT;
      v18 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      _Block_object_dispose(v27, 8);
      goto LABEL_21;
    }
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
    _Block_object_dispose(v27, 8);
  }
  else
  {
    v29 = 0;
    v28 = 0u;
    *(_OWORD *)&v27[8] = 0u;
    if (!CFDictionaryContainsKey(v3, CFSTR("clientName")))
    {
      v9 = getprogname();
      if (v9)
        CFDictionarySetValue(v3, CFSTR("clientName"), (const void *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9));
    }
    v10 = *MEMORY[0x1E0C9AE00];
    if (FigVirtualDisplayProcessorCreate(*MEMORY[0x1E0C9AE00], (uint64_t)v3, &cf))
    {
      *(_DWORD *)type = 0;
      v22 = OS_LOG_TYPE_DEFAULT;
      v19 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_21;
    }
    *(_QWORD *)v27 = self;
    *(_QWORD *)&v28 = conduitFinalizeCallback;
    *((_QWORD *)&v28 + 1) = conduitPushFrameCallback;
    v30 = conduitClearScreenCallback;
    if (FigVirtualDisplaySinkConduitCreate(v10, (__int128 *)v27, v3, &v25)
      || FigVirtualDisplaySessionCreateWithComponents(v10, 0, cf, v25, v3, (CFTypeRef *)&self->_session))
    {
      *(_DWORD *)type = 0;
      v22 = OS_LOG_TYPE_DEFAULT;
      v20 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      goto LABEL_21;
    }
  }
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterAddListener();
  session = self->_session;
  v21[0] = v7;
  v21[1] = 3221225472;
  v21[2] = __42__FigScreenCaptureController_startCapture__block_invoke_112;
  v21[3] = &unk_1E2F7CF80;
  v21[4] = self;
  v12 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *, __CFDictionary *, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 8);
  if (v12)
  {
    v13 = v12(session, v3, v21);
    if (!v13)
      goto LABEL_21;
  }
  else
  {
    v13 = -12782;
  }
  v31 = 0;
  type[0] = OS_LOG_TYPE_DEFAULT;
  v14 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  v15 = v31;
  if (os_log_type_enabled(v14, type[0]))
    v16 = v15;
  else
    v16 = v15 & 0xFFFFFFFE;
  if (v16)
  {
    *(_DWORD *)v27 = 136315650;
    *(_QWORD *)&v27[4] = "-[FigScreenCaptureController startCapture]";
    *(_WORD *)&v27[12] = 1024;
    *(_DWORD *)&v27[14] = 1224;
    *(_WORD *)&v27[18] = 1024;
    *(_DWORD *)&v27[20] = v13;
    _os_log_send_and_compose_impl();
  }
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_21:
  MEMORY[0x19402EF04](self->_lock);
  if (cf)
    CFRelease(cf);
  if (v25)
    CFRelease(v25);
}

uint64_t __42__FigScreenCaptureController_startCapture__block_invoke(uint64_t a1, uint64_t a2, unsigned int a3)
{
  void *v6;
  uint64_t result;

  v6 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "delegate");
  if (a2)
    return objc_msgSend(v6, "screenCaptureController:didReceiveSampleBuffer:transformFlags:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2, a3);
  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend((id)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "delegate"), "screenCaptureControllerDidReceiveClearScreen:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return result;
}

uint64_t __42__FigScreenCaptureController_startCapture__block_invoke_112(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  if ((_DWORD)a2)
  {
    v3 = result;
    objc_msgSend(*(id *)(result + 32), "delegate");
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 32), "delegate"), "screenCaptureController:didFailWithStatus:", *(_QWORD *)(v3 + 32), a2);
  }
  return result;
}

- (void)stopCapture
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVirtualDisplaySession *session;
  void (*v5)(OpaqueFigVirtualDisplaySession *);
  OpaqueFigVirtualDisplaySession *v6;

  MEMORY[0x19402EEEC](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterRemoveListener();
    session = self->_session;
    v5 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v5)
      v5(session);
    v6 = self->_session;
    if (v6)
    {
      CFRelease(v6);
      self->_session = 0;
    }
  }
  MEMORY[0x19402EF04](self->_lock);
}

- (void)suspendCapture
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVirtualDisplaySession *session;
  void (*v5)(OpaqueFigVirtualDisplaySession *);
  NSObject *v6;

  MEMORY[0x19402EEEC](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    session = self->_session;
    v5 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v5)
      v5(session);
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x19402EF04](self->_lock);
}

- (void)resumeCapture
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  OpaqueFigVirtualDisplaySession *session;
  void (*v5)(OpaqueFigVirtualDisplaySession *);
  NSObject *v6;

  MEMORY[0x19402EEEC](self->_lock, a2);
  if (self->_session)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
    session = self->_session;
    v5 = *(void (**)(OpaqueFigVirtualDisplaySession *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
    if (v5)
      v5(session);
  }
  else
  {
    v6 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  MEMORY[0x19402EF04](self->_lock);
}

- (FigScreenCaptureFrameHandlerDelegate)delegate
{
  return (FigScreenCaptureFrameHandlerDelegate *)objc_loadWeak((id *)&self->_delegateWeak);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegateWeak, a3);
}

- (FigScreenCaptureConfiguration)screenCaptureConfiguration
{
  return self->_screenCaptureConfiguration;
}

- (FigDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (OpaqueFigVirtualDisplaySession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueFigVirtualDisplaySession *)a3
{
  self->_session = a3;
}

- (OpaqueFigSimpleMutex)lock
{
  return self->_lock;
}

- (void)setLock:(OpaqueFigSimpleMutex *)a3
{
  self->_lock = a3;
}

- (__CFDictionary)options
{
  return self->_options;
}

- (void)setOptions:(__CFDictionary *)a3
{
  self->_options = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegateWeak);
}

@end
