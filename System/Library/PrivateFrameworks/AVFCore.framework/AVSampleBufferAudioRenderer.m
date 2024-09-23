@implementation AVSampleBufferAudioRenderer

- (int)_initializeTimebase
{
  OpaqueCMClock *HostTimeClock;
  int OnlyTimebase;
  int v4;
  CMTimebaseRef timebaseOut;

  timebaseOut = 0;
  HostTimeClock = CMClockGetHostTimeClock();
  OnlyTimebase = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
  if (!OnlyTimebase)
    OnlyTimebase = CMTimebaseCreateReadOnlyTimebase();
  v4 = OnlyTimebase;
  if (timebaseOut)
    CFRelease(timebaseOut);
  return v4;
}

- (void)_triggerMediaRequestCallback
{
  AVMediaDataRequester *v3;

  MEMORY[0x194033BF8](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  v3 = self->_audioRendererInternal->mediaDataRequester.requester;
  MEMORY[0x194033C04](self->_audioRendererInternal->mediaDataRequester.mutex);
  -[AVMediaDataRequester startRequestingMediaData](v3, "startRequestingMediaData");

}

- (void)_wasFlushedAutomaticallyAtTime:(id *)a3
{
  uint64_t v4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v5 = *a3;
  v6 = CFSTR("AVSampleBufferAudioRendererFlushTimeKey");
  v7[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v5);
  v4 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("AVSampleBufferAudioRendererWasFlushedAutomaticallyNotification"), self, v4);
}

- (int)_installNotificationHandlers
{
  id v3;

  self->_audioRendererInternal->weakReferenceToSelf = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", self);
  if (!self->_audioRendererInternal->weakReferenceToSelf)
    return -12786;
  v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler, *MEMORY[0x1E0CC5D20], self->_audioRendererInternal->figAudioRenderer, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler, *MEMORY[0x1E0CC5D48], self->_audioRendererInternal->figAudioRenderer, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler, *MEMORY[0x1E0CC5D28], self->_audioRendererInternal->figAudioRenderer, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererServerDied, *MEMORY[0x1E0CA4B88], self->_audioRendererInternal->figAudioRenderer, 0);
  objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererServerDied, *MEMORY[0x1E0CC5D30], self->_audioRendererInternal->figAudioRenderer, 0);
  return 0;
}

- (void)_uninstallNotificationHandlers
{
  id v3;

  if (self->_audioRendererInternal->weakReferenceToSelf)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererNowBelowLowWaterLevelNotificationHandler, *MEMORY[0x1E0CC5D20], self->_audioRendererInternal->figAudioRenderer);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererWasFlushedAutomaticallyNotificationHandler, *MEMORY[0x1E0CC5D48], self->_audioRendererInternal->figAudioRenderer);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererRebuildCouldBenefitFidelityNotificationHandler, *MEMORY[0x1E0CC5D28], self->_audioRendererInternal->figAudioRenderer);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererServerDied, *MEMORY[0x1E0CA4B88], self->_audioRendererInternal->figAudioRenderer);
    objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", self->_audioRendererInternal->weakReferenceToSelf, avqsbar_figRendererServerDied, *MEMORY[0x1E0CC5D30], self->_audioRendererInternal->figAudioRenderer);
  }
}

- (id)outputContext
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v3)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFTypeRef *);
  int v4;
  CFTypeRef v5;
  id v6;
  CFTypeRef cf;

  cf = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v3 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFTypeRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 0;
  v4 = v3(figAudioRenderer, *MEMORY[0x1E0CC5DB0], *MEMORY[0x1E0C9AE00], &cf);
  v5 = cf;
  if (v4)
  {
    v6 = 0;
    if (!cf)
      return v6;
    goto LABEL_4;
  }
  v6 = +[AVOutputContext outputContextForID:](AVOutputContext, "outputContextForID:", cf);
  v5 = cf;
  if (cf)
LABEL_4:
    CFRelease(v5);
  return v6;
}

- (void)setOutputContext:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  unsigned int (*v12)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, uint64_t);
  void *v13;

  if (!a3)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"outputContext != nil"), 0);
    objc_exception_throw(v13);
  }
  if (self->_audioRendererInternal->outputContext != a3)
  {
    v10 = objc_msgSend(a3, "contextID");
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    v12 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                               + 56);
    if (v12)
    {
      if (!v12(figAudioRenderer, *MEMORY[0x1E0CC5DB0], v10))
      {

        self->_audioRendererInternal->outputContext = (AVOutputContext *)a3;
      }
    }
  }
}

- (AVSampleBufferAudioRenderer)init
{
  void *v3;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  AVSampleBufferAudioRendererInternal *v6;
  int v7;
  const AVAudioTimePitchAlgorithm *v8;
  AVSampleBufferAudioRenderer *v9;
  objc_super v11;
  uint64_t v12;

  v3 = (void *)objc_msgSend((id)objc_opt_class(), "currentFigAudioRendererFactory");
  v12 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v5 = Mutable;
    v11.receiver = self;
    v11.super_class = (Class)AVSampleBufferAudioRenderer;
    self = -[AVSampleBufferAudioRenderer init](&v11, sel_init);
    if (!self)
      goto LABEL_11;
    v6 = objc_alloc_init(AVSampleBufferAudioRendererInternal);
    self->_audioRendererInternal = v6;
    if (!v6)
      goto LABEL_11;
    CFRetain(v6);
    self->_audioRendererInternal->mediaDataRequester.mutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    if (!self->_audioRendererInternal->mediaDataRequester.mutex)
      goto LABEL_11;
    if (-[AVSampleBufferAudioRenderer _initializeTimebase](self, "_initializeTimebase"))
      goto LABEL_11;
    self->_audioRendererInternal->rate = 0.0;
    self->_audioRendererInternal->volume = 1.0;
    self->_audioRendererInternal->muted = 0;
    self->_audioRendererInternal->audioOutputDeviceUniqueID = 0;
    self->_audioRendererInternal->outputContext = 0;
    self->_audioRendererInternal->loggingIdentifier = (AVLoggingIdentifier *)+[AVSampleBufferAudioRenderer makeRendererLoggingIdentifier](AVSampleBufferAudioRenderer, "makeRendererLoggingIdentifier");
    CFDictionarySetValue(v5, (const void *)*MEMORY[0x1E0CC5CF8], (const void *)-[AVLoggingIdentifier name](self->_audioRendererInternal->loggingIdentifier, "name"));
    self->_audioRendererInternal->figAudioRenderer = (OpaqueFigSampleBufferAudioRenderer *)objc_msgSend(v3, "createAudioRendererWithAllocator:options:error:", 0, v5, &v12);
    if (!self->_audioRendererInternal->figAudioRenderer)
      goto LABEL_11;
    v7 = dyld_program_sdk_at_least();
    v8 = &AVAudioTimePitchAlgorithmTimeDomain;
    if (!v7)
      v8 = &AVAudioTimePitchAlgorithmLowQualityZeroLatency;
    -[AVSampleBufferAudioRenderer setAudioTimePitchAlgorithm:](self, "setAudioTimePitchAlgorithm:", *v8);
    self->_audioRendererInternal->allowedAudioSpatializationFormats = 4;
    if (!-[AVSampleBufferAudioRenderer _installNotificationHandlers](self, "_installNotificationHandlers"))
      v9 = self;
    else
LABEL_11:
      v9 = 0;
    CFRelease(v5);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)sampleBufferAudioRenderer
{
  return objc_alloc_init(AVSampleBufferAudioRenderer);
}

- (void)dealloc
{
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  AVSampleBufferAudioRendererInternal *v4;
  AVSampleBufferAudioRendererInternal *v5;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  opaqueMTAudioProcessingTap *audioProcessingTap;
  AVSampleBufferAudioRendererInternal *v8;
  OpaqueCMTimebase *readOnlyControlTimebase;
  OpaqueFigCPECryptor *lastCryptor;
  opaqueCMFormatDescription *lastFormatDescription;
  objc_super v12;

  audioRendererInternal = self->_audioRendererInternal;
  if (audioRendererInternal)
  {

    v4 = self->_audioRendererInternal;
    if (v4->mediaDataRequester.mutex)
    {
      FigSimpleMutexDestroy();
      self->_audioRendererInternal->mediaDataRequester.mutex = 0;
      v4 = self->_audioRendererInternal;
    }
    -[AVMediaDataRequester invalidate](v4->mediaDataRequester.requester, "invalidate");

    -[AVSampleBufferAudioRenderer _uninstallNotificationHandlers](self, "_uninstallNotificationHandlers");
    v5 = self->_audioRendererInternal;
    figAudioRenderer = v5->figAudioRenderer;
    if (figAudioRenderer)
    {
      CFRelease(figAudioRenderer);
      self->_audioRendererInternal->figAudioRenderer = 0;
      v5 = self->_audioRendererInternal;
    }
    audioProcessingTap = v5->audioProcessingTap;
    if (audioProcessingTap)
    {
      CFRelease(audioProcessingTap);
      self->_audioRendererInternal->audioProcessingTap = 0;
      v5 = self->_audioRendererInternal;
    }

    v8 = self->_audioRendererInternal;
    readOnlyControlTimebase = v8->readOnlyControlTimebase;
    if (readOnlyControlTimebase)
    {
      CFRelease(readOnlyControlTimebase);
      self->_audioRendererInternal->readOnlyControlTimebase = 0;
      v8 = self->_audioRendererInternal;
    }
    lastCryptor = v8->lastCryptor;
    if (lastCryptor)
    {
      CFRelease(lastCryptor);
      v8 = self->_audioRendererInternal;
    }
    lastFormatDescription = v8->lastFormatDescription;
    if (lastFormatDescription)
    {
      CFRelease(lastFormatDescription);
      v8 = self->_audioRendererInternal;
    }

    CFRelease(self->_audioRendererInternal);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVSampleBufferAudioRenderer;
  -[AVSampleBufferAudioRenderer dealloc](&v12, sel_dealloc);
}

- (void)setAudioSession:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t SInt32;
  const void *v11;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  unsigned int (*v13)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, const void *);
  id v14;
  void *v15;

  if (!a3)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"audioSession != nil"), 0);
    objc_exception_throw(v15);
  }
  objc_msgSend(a3, "opaqueSessionID");
  SInt32 = FigCFNumberCreateSInt32();
  if (SInt32)
  {
    v11 = (const void *)SInt32;
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    v13 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v13)
    {
      if (!v13(figAudioRenderer, *MEMORY[0x1E0CC5D68], v11))
      {
        v14 = a3;

        self->_audioRendererInternal->audioSession = (AVAudioSession *)a3;
      }
    }
    CFRelease(v11);
  }
}

- (id)audioSession
{
  id result;

  result = self->_audioRendererInternal->audioSession;
  if (!result)
    return (id)objc_msgSend(MEMORY[0x1E0C89AE8], "sharedInstance");
  return result;
}

- (void)_transitionToStatus:(int64_t)a3 error:(id)a4
{
  const __CFString *v7;

  if (self->_audioRendererInternal->status < a3)
  {
    -[AVSampleBufferAudioRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("status"));
    if (a4)
    {
      v7 = CFSTR("error");
      -[AVSampleBufferAudioRenderer willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("error"));
      self->_audioRendererInternal->status = a3;
      self->_audioRendererInternal->error = (NSError *)a4;
      -[AVSampleBufferAudioRenderer didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("status"));
    }
    else
    {
      self->_audioRendererInternal->status = a3;
      self->_audioRendererInternal->error = 0;
      v7 = CFSTR("status");
    }
    -[AVSampleBufferAudioRenderer didChangeValueForKey:](self, "didChangeValueForKey:", v7);
  }
}

- (void)_transitionToFailedStatusWithOSStatus:(int)a3
{
  -[AVSampleBufferAudioRenderer _transitionToStatus:error:](self, "_transitionToStatus:error:", 2, AVLocalizedErrorWithUnderlyingOSStatus(a3, 0));
}

- (AVQueuedSampleBufferRenderingStatus)status
{
  return self->_audioRendererInternal->status;
}

- (NSError)error
{
  return self->_audioRendererInternal->error;
}

- (void)setAudioOutputDeviceUniqueID:(NSString *)audioOutputDeviceUniqueID
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t FigBaseObject;
  unsigned int (*v11)(uint64_t, _QWORD, NSString *);
  NSString *v12;
  void *v13;

  if (!audioOutputDeviceUniqueID)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"audioOutputDeviceUniqueID != nil"), 0);
    objc_exception_throw(v13);
  }
  if (!-[NSString isEqualToString:](self->_audioRendererInternal->audioOutputDeviceUniqueID, "isEqualToString:"))
  {
    FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    v11 = *(unsigned int (**)(uint64_t, _QWORD, NSString *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
    {
      if (!v11(FigBaseObject, *MEMORY[0x1E0CC5D50], audioOutputDeviceUniqueID))
      {
        v12 = (NSString *)-[NSString copy](audioOutputDeviceUniqueID, "copy");

        self->_audioRendererInternal->audioOutputDeviceUniqueID = v12;
      }
    }
  }
}

- (NSString)audioOutputDeviceUniqueID
{
  return self->_audioRendererInternal->audioOutputDeviceUniqueID;
}

- (void)setAudioTimePitchAlgorithm:(AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v10;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  unsigned int (*v12)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, AVAudioTimePitchAlgorithm);
  AVAudioTimePitchAlgorithm v13;
  NSString *v14;
  void *v15;

  if (!audioTimePitchAlgorithm)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"newAudioTimePitchAlgorithm != nil"), 0);
    objc_exception_throw(v15);
  }
  if (!-[NSString isEqualToString:](self->_audioRendererInternal->audioTimePitchAlgorithm, "isEqualToString:"))
  {
    v10 = -[NSString isEqualToString:](audioTimePitchAlgorithm, "isEqualToString:", CFSTR("LowQualityZeroLatency"));
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    v12 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, AVAudioTimePitchAlgorithm))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v12)
    {
      if (v10)
        v13 = (AVAudioTimePitchAlgorithm)*MEMORY[0x1E0CC5DE0];
      else
        v13 = audioTimePitchAlgorithm;
      if (!v12(figAudioRenderer, *MEMORY[0x1E0CC5D70], v13))
      {
        v14 = (NSString *)-[NSString copy](audioTimePitchAlgorithm, "copy");

        self->_audioRendererInternal->audioTimePitchAlgorithm = v14;
      }
    }
  }
}

- (AVAudioTimePitchAlgorithm)audioTimePitchAlgorithm
{
  return self->_audioRendererInternal->audioTimePitchAlgorithm;
}

- (BOOL)willTrimShortDurationSamples
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v3)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFBooleanRef *);
  int v4;
  CFBooleanRef v5;
  BOOL v6;
  BOOL v7;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v3 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v3)
    return 1;
  v4 = v3(figAudioRenderer, *MEMORY[0x1E0CC5DD8], *MEMORY[0x1E0C9AE00], &BOOLean);
  v5 = BOOLean;
  if (v4)
    v6 = 1;
  else
    v6 = BOOLean == 0;
  if (v6)
  {
    v7 = 1;
    if (!BOOLean)
      return v7;
    goto LABEL_11;
  }
  v7 = CFBooleanGetValue(BOOLean) != 0;
  v5 = BOOLean;
  if (BOOLean)
LABEL_11:
    CFRelease(v5);
  return v7;
}

- (void)setAudioTapProcessor:(opaqueMTAudioProcessingTap *)a3
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  unsigned int (*v6)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, opaqueMTAudioProcessingTap *);
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  opaqueMTAudioProcessingTap *audioProcessingTap;

  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v6 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, opaqueMTAudioProcessingTap *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v6 && !v6(figAudioRenderer, *MEMORY[0x1E0CC5D58], a3))
  {
    audioRendererInternal = self->_audioRendererInternal;
    audioProcessingTap = audioRendererInternal->audioProcessingTap;
    audioRendererInternal->audioProcessingTap = a3;
    if (a3)
      CFRetain(a3);
    if (audioProcessingTap)
      CFRelease(audioProcessingTap);
  }
}

- (opaqueMTAudioProcessingTap)audioTapProcessor
{
  return self->_audioRendererInternal->audioProcessingTap;
}

- (void)setAllowedAudioSpatializationFormats:(AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  unint64_t v4;
  _QWORD *v7;
  int v8;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v10)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD);
  AVSampleBufferAudioRendererInternal *v11;
  OpaqueFigSampleBufferAudioRenderer *v12;
  uint64_t (*v13)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD);

  audioRendererInternal = self->_audioRendererInternal;
  v4 = audioRendererInternal->allowedAudioSpatializationFormats;
  if (v4 != allowedAudioSpatializationFormats)
  {
    v7 = (_QWORD *)MEMORY[0x1E0C9AE50];
    if ((v4 & 4) != 0)
    {
      figAudioRenderer = audioRendererInternal->figAudioRenderer;
      v10 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 56);
      if (v10)
        v8 = v10(figAudioRenderer, *MEMORY[0x1E0CC5DA0], *v7);
      else
        v8 = -12782;
    }
    else
    {
      v8 = 0;
    }
    v11 = self->_audioRendererInternal;
    if ((v11->allowedAudioSpatializationFormats & 3) != 0)
    {
      v12 = v11->figAudioRenderer;
      v13 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                                           + 56);
      if (!v13)
        return;
      v8 = v13(v12, *MEMORY[0x1E0CC5DC0], *v7);
    }
    if (!v8)
      self->_audioRendererInternal->allowedAudioSpatializationFormats = allowedAudioSpatializationFormats;
  }
}

- (AVAudioSpatializationFormats)allowedAudioSpatializationFormats
{
  return self->_audioRendererInternal->allowedAudioSpatializationFormats;
}

- (void)setVolume:(float)volume
{
  CFNumberRef v4;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, CFNumberRef);
  float valuePtr;

  valuePtr = volume;
  if (self->_audioRendererInternal->volume != volume)
  {
    v4 = CFNumberCreate(0, kCFNumberFloat32Type, &valuePtr);
    FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    v6 = *(unsigned int (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6 && !v6(FigBaseObject, *MEMORY[0x1E0CC5DC8], v4))
      self->_audioRendererInternal->volume = valuePtr;
    if (v4)
      CFRelease(v4);
  }
}

- (float)volume
{
  return self->_audioRendererInternal->volume;
}

- (void)setMuted:(BOOL)muted
{
  _BOOL4 v3;
  uint64_t FigBaseObject;
  unsigned int (*v6)(uint64_t, _QWORD, uint64_t);
  uint64_t v7;

  if (self->_audioRendererInternal->muted != muted)
  {
    v3 = muted;
    FigBaseObject = FigSampleBufferAudioRendererGetFigBaseObject();
    v6 = *(unsigned int (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v6)
    {
      if (v3)
        v7 = *MEMORY[0x1E0C9AE50];
      else
        v7 = *MEMORY[0x1E0C9AE40];
      if (!v6(FigBaseObject, *MEMORY[0x1E0CC5DA8], v7))
        self->_audioRendererInternal->muted = v3;
    }
  }
}

- (BOOL)isMuted
{
  return self->_audioRendererInternal->muted;
}

- (OpaqueCMTimebase)timebase
{
  void *readOnlyControlTimebase;

  readOnlyControlTimebase = self->_audioRendererInternal->readOnlyControlTimebase;
  if (readOnlyControlTimebase)
    readOnlyControlTimebase = (void *)CFRetain(readOnlyControlTimebase);
  return (OpaqueCMTimebase *)readOnlyControlTimebase;
}

- (void)copyFigSampleBufferAudioRenderer:(OpaqueFigSampleBufferAudioRenderer *)a3
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;

  if (a3)
  {
    figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
    if (figAudioRenderer)
      figAudioRenderer = (OpaqueFigSampleBufferAudioRenderer *)CFRetain(figAudioRenderer);
    *a3 = figAudioRenderer;
  }
}

- (BOOL)setRenderSynchronizer:(id)a3 error:(id *)a4
{
  AVWeakReference *weakReferenceToSynchronizer;
  void *v8;
  OpaqueCMClock *HostTimeClock;
  uint64_t v10;
  uint64_t OnlyTimebaseSetTargetTimebase;
  CMTimebaseRef timebaseOut;

  timebaseOut = 0;
  weakReferenceToSynchronizer = self->_audioRendererInternal->weakReferenceToSynchronizer;
  if (!a3)
  {

    self->_audioRendererInternal->weakReferenceToSynchronizer = 0;
    HostTimeClock = CMClockGetHostTimeClock();
    v10 = CMTimebaseCreateWithSourceClock(0, HostTimeClock, &timebaseOut);
    if (!(_DWORD)v10)
    {
      OnlyTimebaseSetTargetTimebase = FigReadOnlyTimebaseSetTargetTimebase();
      if (!(_DWORD)OnlyTimebaseSetTargetTimebase)
        goto LABEL_9;
      goto LABEL_7;
    }
LABEL_14:
    OnlyTimebaseSetTargetTimebase = v10;
LABEL_7:
    -[AVSampleBufferAudioRenderer _transitionToFailedStatusWithOSStatus:](self, "_transitionToFailedStatusWithOSStatus:", OnlyTimebaseSetTargetTimebase);
    goto LABEL_9;
  }
  if (!-[AVWeakReference referencedObject](weakReferenceToSynchronizer, "referencedObject"))
  {

    self->_audioRendererInternal->weakReferenceToSynchronizer = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", a3);
    objc_msgSend(a3, "timebase");
    v10 = FigReadOnlyTimebaseSetTargetTimebase();
    if (!(_DWORD)v10)
    {
LABEL_9:
      v8 = 0;
      if (!a4)
        goto LABEL_11;
      goto LABEL_10;
    }
    goto LABEL_14;
  }
  v8 = (void *)AVErrorForClientProgrammingError(objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("The AudioRenderer cannot be added to a Synchronizer when it has already been added to a Synchronizer."), 0));
  if (a4)
LABEL_10:
    *a4 = v8;
LABEL_11:
  if (timebaseOut)
    CFRelease(timebaseOut);
  return v8 == 0;
}

- (void)setSTSLabel:(id)a3
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  void (*v5)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, id);

  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v5 = *(void (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, id))(*(_QWORD *)(CMBaseObjectGetVTable() + 8)
                                                                               + 56);
  if (v5)
    v5(figAudioRenderer, *MEMORY[0x1E0CC5DB8], a3);
}

- (void)enqueueSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const opaqueCMFormatDescription *FormatDescription;
  opaqueCMFormatDescription *v12;
  CMMediaType MediaType;
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  int v15;
  opaqueCMFormatDescription *lastFormatDescription;
  AVSampleBufferAudioRendererInternal *v17;
  OpaqueFigCPECryptor *lastCryptor;
  CFTypeRef v19;
  AVSampleBufferAudioRendererInternal *v20;
  int64_t status;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v23)(OpaqueFigSampleBufferAudioRenderer *, opaqueCMSampleBuffer *);
  signed int v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  CFTypeRef cf;
  void *v35;

  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  cf = 0;
  v35 = 0;
  if (!a3)
  {
    v25 = (void *)MEMORY[0x1E0C99DA0];
    v26 = *MEMORY[0x1E0C99778];
    v27 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v3, v4, v5, v6, v7, (uint64_t)"sampleBuffer != NULL");
    goto LABEL_36;
  }
  FormatDescription = CMSampleBufferGetFormatDescription(a3);
  v12 = FormatDescription;
  if (FormatDescription)
  {
    MediaType = CMFormatDescriptionGetMediaType(FormatDescription);
    if (MediaType != 1936684398)
    {
      v25 = (void *)MEMORY[0x1E0C99DA0];
      v26 = *MEMORY[0x1E0C99778];
      v28 = AVStringForOSType(MediaType);
      AVStringForOSType(0x736F756Eu);
      v27 = AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("Sample buffer has media type '%@' instead of '%@'"), v29, v30, v31, v32, v33, v28);
LABEL_36:
      objc_exception_throw((id)objc_msgSend(v25, "exceptionWithName:reason:userInfo:", v26, v27, 0));
    }
  }
  if (objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession))
  {
    audioRendererInternal = self->_audioRendererInternal;
    if (audioRendererInternal->lastCryptor
      && (v15 = FigCFEqual(), audioRendererInternal = self->_audioRendererInternal, v15))
    {
      FigSampleBufferSetDecryptor();
    }
    else
    {
      lastFormatDescription = audioRendererInternal->lastFormatDescription;
      audioRendererInternal->lastFormatDescription = v12;
      if (v12)
        CFRetain(v12);
      if (lastFormatDescription)
        CFRelease(lastFormatDescription);
      if (!objc_msgSend(objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession), "copyCryptorForFormatDescription:cryptorOut:errorOut:", v12, &cf, &v35))goto LABEL_26;
      v17 = self->_audioRendererInternal;
      lastCryptor = v17->lastCryptor;
      v19 = cf;
      v17->lastCryptor = (OpaqueFigCPECryptor *)cf;
      if (v19)
        CFRetain(v19);
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
  v20 = self->_audioRendererInternal;
  status = v20->status;
  if (status == 2)
  {
LABEL_26:
    v24 = 0;
    goto LABEL_28;
  }
  if (!status)
  {
    -[AVSampleBufferAudioRenderer _transitionToStatus:error:](self, "_transitionToStatus:error:", 1, 0);
    v20 = self->_audioRendererInternal;
  }
  figAudioRenderer = v20->figAudioRenderer;
  v23 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, opaqueCMSampleBuffer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                               + 16);
  if (v23)
    v24 = v23(figAudioRenderer, a3);
  else
    v24 = -12782;
LABEL_28:
  if (cf)
    CFRelease(cf);
  if (v24 || v35)
    -[AVSampleBufferAudioRenderer _transitionToStatus:error:](self, "_transitionToStatus:error:", 2, AVLocalizedErrorWithUnderlyingOSStatusAndUnderlyingError(v24, 0, v35, 1));
}

- (void)flush
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v4)(OpaqueFigSampleBufferAudioRenderer *);
  uint64_t v5;

  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v4 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
  if (!v4)
  {
    v5 = 4294954514;
    goto LABEL_5;
  }
  v5 = v4(figAudioRenderer);
  if ((_DWORD)v5)
LABEL_5:
    -[AVSampleBufferAudioRenderer _transitionToFailedStatusWithOSStatus:](self, "_transitionToFailedStatusWithOSStatus:", v5);
}

- (void)flushFromSourceTime:(CMTime *)time completionHandler:(void *)completionHandler
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (**v10)(_QWORD, _QWORD);
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v12)(OpaqueFigSampleBufferAudioRenderer *, CMTime *, void (*)(int, void (**)(_QWORD, _QWORD)), void (**)(_QWORD, _QWORD));
  uint64_t v13;
  void *v14;
  CMTime v15;
  CMTime v16;

  if (!completionHandler)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), 0, v4, v5, v6, v7, (uint64_t)"completionHandler != nil"), 0);
    objc_exception_throw(v14);
  }
  v10 = (void (**)(_QWORD, _QWORD))objc_msgSend(completionHandler, "copy");
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v15 = *time;
  v12 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, CMTime *, void (*)(int, void (**)(_QWORD, _QWORD)), void (**)(_QWORD, _QWORD)))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
  if (!v12)
  {
    v10[2](v10, 0);

    v13 = 4294954514;
    goto LABEL_6;
  }
  v16 = v15;
  v13 = v12(figAudioRenderer, &v16, AVSampleBufferAudioRendererFlushFromMediaTimeCallback, v10);
  if ((_DWORD)v13)
LABEL_6:
    -[AVSampleBufferAudioRenderer _transitionToFailedStatusWithOSStatus:](self, "_transitionToFailedStatusWithOSStatus:", v13);
}

- (BOOL)isReadyForMoreMediaData
{
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  unsigned int (*v4)(OpaqueFigSampleBufferAudioRenderer *);
  BOOL result;

  audioRendererInternal = self->_audioRendererInternal;
  result = audioRendererInternal->status != 2
        && (figAudioRenderer = audioRendererInternal->figAudioRenderer,
            (v4 = *(unsigned int (**)(OpaqueFigSampleBufferAudioRenderer *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 8)) != 0)
        && v4(figAudioRenderer) == 0;
  return result;
}

- (void)requestMediaDataWhenReadyOnQueue:(id)a3 usingBlock:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  AVMediaDataRequester *requester;
  void *v13;
  uint64_t v14;
  const char *v15;
  void *v16;
  AVMediaDataRequester *v17;

  if (!a3)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "queue != NULL";
    goto LABEL_6;
  }
  if (!a4)
  {
    v13 = (void *)MEMORY[0x1E0C99DA0];
    v14 = *MEMORY[0x1E0C99778];
    v15 = "block != nil";
LABEL_6:
    v16 = (void *)objc_msgSend(v13, "exceptionWithName:reason:userInfo:", v14, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)v15), 0);
    objc_exception_throw(v16);
  }
  MEMORY[0x194033BF8](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  audioRendererInternal = self->_audioRendererInternal;
  requester = audioRendererInternal->mediaDataRequester.requester;
  audioRendererInternal->mediaDataRequester.requester = 0;
  v17 = -[AVMediaDataRequester initWithMediaDataConsumer:requestQueue:requestBlock:]([AVMediaDataRequester alloc], "initWithMediaDataConsumer:requestQueue:requestBlock:", self, a3, a4);
  self->_audioRendererInternal->mediaDataRequester.requester = v17;
  MEMORY[0x194033C04](self->_audioRendererInternal->mediaDataRequester.mutex);
  -[AVMediaDataRequester invalidate](requester, "invalidate");

  -[AVMediaDataRequester startRequestingMediaData](v17, "startRequestingMediaData");
}

- (void)stopRequestingMediaData
{
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  AVMediaDataRequester *requester;

  MEMORY[0x194033BF8](self->_audioRendererInternal->mediaDataRequester.mutex, a2);
  audioRendererInternal = self->_audioRendererInternal;
  requester = audioRendererInternal->mediaDataRequester.requester;
  audioRendererInternal->mediaDataRequester.requester = 0;
  MEMORY[0x194033C04](self->_audioRendererInternal->mediaDataRequester.mutex);
  -[AVMediaDataRequester invalidate](requester, "invalidate");

}

- (BOOL)hasSufficientMediaDataForReliablePlaybackStart
{
  AVSampleBufferAudioRendererInternal *audioRendererInternal;
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  uint64_t (*v4)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFBooleanRef *);
  int v5;
  CFBooleanRef v6;
  BOOL v7;
  CFBooleanRef BOOLean;

  BOOLean = 0;
  audioRendererInternal = self->_audioRendererInternal;
  if (audioRendererInternal->status == 2)
    return 0;
  figAudioRenderer = audioRendererInternal->figAudioRenderer;
  v4 = *(uint64_t (**)(OpaqueFigSampleBufferAudioRenderer *, _QWORD, _QWORD, CFBooleanRef *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 48);
  if (!v4)
    return 0;
  v5 = v4(figAudioRenderer, *MEMORY[0x1E0CC5D98], *MEMORY[0x1E0C9AE00], &BOOLean);
  v6 = BOOLean;
  if (v5)
  {
    v7 = 0;
    if (!BOOLean)
      return v7;
    goto LABEL_8;
  }
  v7 = CFBooleanGetValue(BOOLean) == 0;
  v6 = BOOLean;
  if (BOOLean)
LABEL_8:
    CFRelease(v6);
  return v7;
}

- (BOOL)isDefunct
{
  OpaqueFigSampleBufferAudioRenderer *figAudioRenderer;
  _QWORD *v3;
  unsigned int (*v4)(OpaqueFigSampleBufferAudioRenderer *, unsigned __int8 *);
  BOOL v5;
  int v6;
  unsigned __int8 v8;

  v8 = 0;
  figAudioRenderer = self->_audioRendererInternal->figAudioRenderer;
  v3 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v3 < 5uLL)
  {
    LODWORD(v4) = 0;
  }
  else
  {
    v4 = (unsigned int (*)(OpaqueFigSampleBufferAudioRenderer *, unsigned __int8 *))v3[11];
    if (v4)
    {
      v5 = v4(figAudioRenderer, &v8) == 0;
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

- (BOOL)mayRequireContentKeysForMediaDataProcessing
{
  return 1;
}

- (int)_attachToContentKeySession:(id)a3 contentKeyBoss:(OpaqueFigContentKeyBoss *)a4 failedSinceAlreadyAttachedToAnotherSession:(BOOL *)a5
{
  id Weak;

  Weak = objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession);
  if (!Weak)
  {
    objc_storeWeak((id *)&self->_audioRendererInternal->weakContentKeySession, a3);
    if (!a5)
      return 0;
    goto LABEL_3;
  }
  if (a5)
LABEL_3:
    *a5 = Weak != 0;
  return 0;
}

- (BOOL)_attachedToExternalContentKeySession
{
  return objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession) != 0;
}

- (id)contentKeySession
{
  return objc_loadWeak((id *)&self->_audioRendererInternal->weakContentKeySession);
}

+ (id)makeRendererLoggingIdentifier
{
  return objc_alloc_init(AVSampleBufferAudioRendererLoggingIdentifier);
}

- (id)loggingIdentifier
{
  return self->_audioRendererInternal->loggingIdentifier;
}

- (void)setLoggingIdentifier:(id)a3
{
  AVLoggingIdentifier *loggingIdentifier;

  loggingIdentifier = self->_audioRendererInternal->loggingIdentifier;
  if (loggingIdentifier != a3)
  {

    self->_audioRendererInternal->loggingIdentifier = (AVLoggingIdentifier *)a3;
  }
}

+ (id)currentFigAudioRendererFactory
{
  AVFigSampleBufferAudioRendererFactory *v2;
  id result;

  v2 = objc_alloc_init(AVFigSampleBufferAudioRendererFactory);
  result = dispatch_get_specific(CFSTR("AVSampleBufferAudioRendererFigFactoryKey"));
  if (!result)
    return v2;
  return result;
}

+ (void)setFigAudioRendererFactory:(id)a3 forQueue:(id)a4
{
  dispatch_queue_set_specific((dispatch_queue_t)a4, CFSTR("AVSampleBufferAudioRendererFigFactoryKey"), a3, AVSampleBufferAudioRendererReleaseObject);
}

@end
