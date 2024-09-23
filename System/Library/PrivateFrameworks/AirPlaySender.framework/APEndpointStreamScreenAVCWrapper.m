@implementation APEndpointStreamScreenAVCWrapper

- (APEndpointStreamScreenAVCWrapper)initWithClientPID:(__CFNumber *)a3 hdrMode:(__CFString *)a4 presentationMode:(BOOL)a5 hdrMirroringSupported:(BOOL)a6 eventHandlers:(id *)a7 error:(int *)a8
{
  _BOOL8 v10;
  _BOOL8 v11;
  APEndpointStreamScreenAVCWrapper *v14;
  APEndpointStreamScreenAVCWrapper *v15;
  dispatch_semaphore_t v16;
  int v17;
  objc_super v19;

  v10 = a6;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)APEndpointStreamScreenAVCWrapper;
  v14 = -[APEndpointStreamScreenAVCWrapper init](&v19, sel_init);
  v15 = v14;
  if (v14)
  {
    if (a3)
      CFNumberGetValue(a3, kCFNumberIntType, &v14->_clientPID);
    v16 = dispatch_semaphore_create(0);
    v15->_completionSemaphore = (OS_dispatch_semaphore *)v16;
    if (!v16)
      goto LABEL_7;
    v15->_eventWeakContext = (void *)FigCFWeakReferenceHolderCreateWithReferencedObject();
    v15->_eventHandleStart = a7->var1;
    v15->_eventHandleStop = a7->var2;
    v15->_eventHandleFailed = a7->var3;
    v15->_eventHandleClearScreen = a7->var4;
    v15->_isSubFrameEnabled = FigGetCFPreferenceNumberWithDefault();
    v17 = -[APEndpointStreamScreenAVCWrapper initializeNegotiatorWithMode:presentationMode:hdrMirroringSupported:](v15, "initializeNegotiatorWithMode:presentationMode:hdrMirroringSupported:", a4, v11, v10);
    *a8 = v17;
    if (v17)
LABEL_7:
      APSLogErrorAt();
  }
  return v15;
}

- (int)initializeNegotiatorWithMode:(__CFString *)a3 presentationMode:(BOOL)a4 hdrMirroringSupported:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  objc_class *v10;
  uint64_t v11;
  int v12;
  id v14;

  v5 = a4;
  v14 = 0;
  if (a4 || a5)
    v7 = -[APEndpointStreamScreenAVCWrapper convertHDRMode:](self, "convertHDRMode:", a3);
  else
    v7 = 0;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", v7);
  if (v8
    && (v9 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v8, getAVCMediaStreamNegotiatorHDRMode(), 0)) != 0)
  {
    v10 = (objc_class *)objc_msgSend(objc_alloc((Class)getAVCMediaStreamNegotiatorClass()), "initWithMode:options:error:", 2, v9, &v14);
    v11 = 32;
    if (v5)
      v11 = 40;
    *(Class *)((char *)&self->super.isa + v11) = v10;
    if (v14)
    {
      APSLogErrorAt();
      v12 = objc_msgSend(v14, "code");
    }
    else
    {
      v12 = 0;
    }
  }
  else
  {
    APSLogErrorAt();
    v12 = -16761;
  }

  return v12;
}

- (int)initScreeenCaptureWithScreenOptions:(id *)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  AVCScreenCapture *v8;
  int v9;

  v5 = objc_alloc_init(getAVCScreenCaptureConfigurationClass());
  v6 = v5;
  if (v5
    && ((objc_msgSend(v5, "setScreenCaptureDisplayID:", 0xFFFFFFFFLL), a3->var7) ? (v7 = 1) : (v7 = 2),
        objc_msgSend(v6, "setDisplayMode:", v7),
        v8 = (AVCScreenCapture *)objc_msgSend(objc_alloc(getAVCScreenCaptureClass()), "initWithDelegate:withConfig:", self, v6), (self->_avcScreenCapture = v8) != 0))
  {
    v9 = 0;
  }
  else
  {
    APSLogErrorAt();
    v9 = -6718;
  }

  return v9;
}

- (int)setCaptureSourceIDForStreamConfig:(id)a3
{
  AVCScreenCapture *avcScreenCapture;
  int result;

  avcScreenCapture = self->_avcScreenCapture;
  if (!avcScreenCapture || !a3)
  {
    APSLogErrorAt();
    return -6727;
  }
  objc_msgSend((id)objc_msgSend(a3, "video"), "setCaptureSourceID:", -[AVCScreenCapture captureSourceID](avcScreenCapture, "captureSourceID"));
  if (gLogCategory_APEndpointStreamScreenUDP > 50)
    return 0;
  if (gLogCategory_APEndpointStreamScreenUDP != -1 || (result = _LogCategory_Initialize()) != 0)
  {
    objc_msgSend((id)objc_msgSend(a3, "video"), "captureSourceID");
    LogPrintF();
    return 0;
  }
  return result;
}

- (void)dealloc
{
  void *eventWeakContext;
  NSObject *completionSemaphore;
  objc_super v5;

  eventWeakContext = self->_eventWeakContext;
  if (eventWeakContext)
  {
    CFRelease(eventWeakContext);
    self->_eventWeakContext = 0;
  }
  completionSemaphore = self->_completionSemaphore;
  if (completionSemaphore)
  {
    dispatch_release(completionSemaphore);
    self->_completionSemaphore = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APEndpointStreamScreenAVCWrapper;
  -[APEndpointStreamScreenAVCWrapper dealloc](&v5, sel_dealloc);
}

- (int)start
{
  NSObject *completionSemaphore;
  dispatch_time_t v4;

  -[AVCScreenCapture startCapture](self->_avcScreenCapture, "startCapture");
  -[AVCVideoStream start](self->_avcVideoStream, "start");
  completionSemaphore = self->_completionSemaphore;
  v4 = dispatch_time(0, 10000000000);
  if (!dispatch_semaphore_wait(completionSemaphore, v4))
    return self->_didStartStatus;
  APSLogErrorAt();
  return -6722;
}

- (int)startWithNWConnectionClientID:(unsigned __int8)a3[16] negotiatedBlob:(id)a4 screenOptions:(id *)a5 completion:(id *)a6
{
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  int v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  AVCVideoStream *v24;
  uint64_t v25;
  uint64_t v26;
  const void *v27;
  int v29;
  $68F4C1BE55AAC8698867A047E72A1EE9 *v30;
  id v31;

  v31 = 0;
  if (a5->var4)
    v10 = 56;
  else
    v10 = 48;
  v11 = 40;
  if (!a5->var4)
    v11 = 32;
  v12 = *(Class *)((char *)&self->super.isa + v11);
  objc_msgSend(v12, "setAnswer:withError:", a4, &v31);
  if (v31)
  {
    APSLogErrorAt();
    LODWORD(v25) = objc_msgSend(v31, "code");
LABEL_25:
    v19 = 0;
    v20 = 0;
    v18 = 0;
    goto LABEL_19;
  }
  v13 = (Class *)((char *)&self->super.isa + v10);
  v14 = -[APEndpointStreamScreenAVCWrapper createVideoStreamConfig:withDirection:screenOptions:previousConfig:](self, "createVideoStreamConfig:withDirection:screenOptions:previousConfig:", (char *)self + v10, 1, a5, 0);
  if (v14)
  {
    LODWORD(v25) = v14;
LABEL_24:
    APSLogErrorAt();
    goto LABEL_25;
  }
  v15 = -[APEndpointStreamScreenAVCWrapper initScreeenCaptureWithScreenOptions:](self, "initScreeenCaptureWithScreenOptions:", a5);
  if (v15)
  {
    LODWORD(v25) = v15;
    goto LABEL_24;
  }
  v16 = -[APEndpointStreamScreenAVCWrapper setCaptureSourceIDForStreamConfig:](self, "setCaptureSourceIDForStreamConfig:", *v13);
  if (v16)
  {
    LODWORD(v25) = v16;
    goto LABEL_24;
  }
  v17 = (void *)objc_msgSend(v12, "generateMediaStreamInitOptionsWithError:", &v31);
  if (v31)
  {
    APSLogErrorAt();
    v29 = objc_msgSend(v31, "code");
    v19 = 0;
    v20 = 0;
    v18 = 0;
LABEL_30:
    LODWORD(v25) = v29;
    goto LABEL_19;
  }
  v18 = (void *)objc_msgSend(v17, "objectForKeyedSubscript:", getkAVCMediaStreamOptionCallID());
  if (!v18)
  {
    APSLogErrorAt();
    LODWORD(v25) = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_19;
  }
  v30 = a6;
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", APSHasUDPMirroringOutOfProcessSupport() == 0);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInt:", self->_clientPID);
  v21 = objc_alloc(MEMORY[0x1E0C99D80]);
  v22 = getkAVCMediaStreamOptionRunInProcess();
  v23 = getkAVCMediaStreamOptionClientPID();
  v18 = (void *)objc_msgSend(v21, "initWithObjectsAndKeys:", v19, v22, v20, v23, v18, getkAVCMediaStreamOptionCallID(), 0);
  if (!v18)
  {
    APSLogErrorAt();
    LODWORD(v25) = -16761;
    goto LABEL_19;
  }
  v24 = (AVCVideoStream *)objc_msgSend(objc_alloc(getAVCVideoStreamClass()), "initWithNWConnectionClientID:options:error:", a3, v18, &v31);
  self->_avcVideoStream = v24;
  if (v31
    || (-[AVCVideoStream setDelegate:](v24, "setDelegate:", self),
        -[AVCVideoStream configure:error:](self->_avcVideoStream, "configure:error:", *v13, &v31),
        v31))
  {
    APSLogErrorAt();
    v29 = objc_msgSend(v31, "code");
    goto LABEL_30;
  }
  v25 = -[APEndpointStreamScreenAVCWrapper start](self, "start");
  if (self->_eventHandleStart)
  {
    if (self->_eventWeakContext)
    {
      v26 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v26)
      {
        v27 = (const void *)v26;
        ((void (*)(uint64_t, $68F4C1BE55AAC8698867A047E72A1EE9 *, uint64_t))self->_eventHandleStart)(v26, v30, v25);
        CFRelease(v27);
      }
    }
  }
LABEL_19:

  return v25;
}

- (int)stop
{
  NSObject *completionSemaphore;
  dispatch_time_t v4;
  intptr_t v5;

  -[AVCScreenCapture stopCapture](self->_avcScreenCapture, "stopCapture");

  self->_avcScreenCapture = 0;
  -[AVCVideoStream stop](self->_avcVideoStream, "stop");
  completionSemaphore = self->_completionSemaphore;
  v4 = dispatch_time(0, 10000000000);
  v5 = dispatch_semaphore_wait(completionSemaphore, v4);
  if (v5)
  {
    APSLogErrorAt();
    LODWORD(v5) = -6722;
  }
  return v5;
}

- (void)stopWithCompletion:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  v5 = -[APEndpointStreamScreenAVCWrapper stop](self, "stop");
  if (self->_eventHandleStop)
  {
    v6 = v5;
    if (self->_eventWeakContext)
    {
      v7 = FigCFWeakReferenceHolderCopyReferencedObject();
      if (v7)
      {
        v8 = (const void *)v7;
        ((void (*)(uint64_t, $68F4C1BE55AAC8698867A047E72A1EE9 *, uint64_t))self->_eventHandleStop)(v7, a3, v6);
        CFRelease(v8);
      }
    }
  }

  self->_avcVideoStream = 0;
  self->_videoStreamConfigForMirroring = 0;

  self->_videoStreamConfigForPresentationMode = 0;
  self->_avcScreenCapture = 0;
}

- (unint64_t)convertHDRMode:(__CFString *)a3
{
  if (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC6500]))
    return 1;
  else
    return 2 * (CFEqual(a3, (CFTypeRef)*MEMORY[0x1E0CC64F8]) != 0);
}

- (void)getVideoResolutionFromOptions:(id *)a3 width:(unint64_t *)a4 height:(unint64_t *)a5
{
  APSHasHDRSenderSupport();
  APSGetMaxSizePreservingAspectRatio();
  *a4 = (int)APSSettingsGetIntWithDefault();
  *a5 = (int)APSSettingsGetIntWithDefault();
}

- (int)restartWithScreenOptions:(id *)a3 negotiatedBlob:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  AVCMediaStreamConfig **p_videoStreamConfigForPresentationMode;
  uint64_t v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  id v19;

  v19 = 0;
  v7 = 56;
  if (a3->var4)
    v8 = 56;
  else
    v8 = 48;
  if (a3->var4)
    v7 = 48;
  v9 = *(Class *)((char *)&self->super.isa + v7);
  if (a3->var4)
    p_videoStreamConfigForPresentationMode = &self->_videoStreamConfigForPresentationMode;
  else
    p_videoStreamConfigForPresentationMode = &self->_videoStreamConfigForMirroring;
  v11 = 40;
  if (!a3->var4)
    v11 = 32;
  v12 = *(Class *)((char *)&self->super.isa + v11);
  v13 = -[APEndpointStreamScreenAVCWrapper stop](self, "stop");
  if (v13)
  {
    v17 = v13;
LABEL_30:
    APSLogErrorAt();
    return v17;
  }
  if (a4)
  {
    objc_msgSend(v12, "setAnswer:withError:", a4, &v19);
    if (v19)
      goto LABEL_25;
  }
  if (!*(Class *)((char *)&self->super.isa + v8))
  {
    if (!v9)
    {
      APSLogErrorAt();
      return -6727;
    }
    v14 = -[APEndpointStreamScreenAVCWrapper createVideoStreamConfig:withDirection:screenOptions:previousConfig:](self, "createVideoStreamConfig:withDirection:screenOptions:previousConfig:", p_videoStreamConfigForPresentationMode, objc_msgSend(v9, "direction"), a3, v9);
    if (v14)
    {
      v17 = v14;
      goto LABEL_30;
    }
  }
  v15 = -[APEndpointStreamScreenAVCWrapper initScreeenCaptureWithScreenOptions:](self, "initScreeenCaptureWithScreenOptions:", a3);
  if (v15)
  {
    v17 = v15;
    goto LABEL_30;
  }
  v16 = -[APEndpointStreamScreenAVCWrapper setCaptureSourceIDForStreamConfig:](self, "setCaptureSourceIDForStreamConfig:", *(Class *)((char *)&self->super.isa + v8));
  if (v16)
  {
    v17 = v16;
    goto LABEL_30;
  }
  -[AVCVideoStream configure:error:](self->_avcVideoStream, "configure:error:", *(Class *)((char *)&self->super.isa + v8), &v19);
  if (v19)
  {
LABEL_25:
    APSLogErrorAt();
    return objc_msgSend(v19, "code");
  }
  v17 = -[APEndpointStreamScreenAVCWrapper start](self, "start");
  if (v17)
    goto LABEL_30;
  return v17;
}

- (int)createVideoStreamConfig:(id *)a3 withDirection:(int64_t)a4 screenOptions:(id *)a5 previousConfig:(id)a6
{
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t var1;
  uint64_t IntWithDefault;
  uint64_t v16;
  id var2;
  id v18;
  int result;
  uint64_t v20;
  uint64_t v21;
  id v22;

  v21 = 0;
  v22 = 0;
  v20 = 0;
  v11 = 40;
  if (!a5->var4)
    v11 = 32;
  v12 = objc_msgSend(*(id *)((char *)&self->super.isa + v11), "generateMediaStreamConfigurationWithError:", &v22);
  if (v22)
  {
    APSLogErrorAt();
    return objc_msgSend(v22, "code");
  }
  else
  {
    v13 = (void *)v12;
    -[APEndpointStreamScreenAVCWrapper getVideoResolutionFromOptions:width:height:](self, "getVideoResolutionFromOptions:width:height:", a5, &v21, &v20);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setVideoResolution:", 12);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setCustomWidth:", v21);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setCustomHeight:", v20);
    objc_msgSend(v13, "setDirection:", a4);
    var1 = a5->var1;
    if ((_DWORD)var1)
      objc_msgSend((id)objc_msgSend(v13, "video"), "setFramerate:", var1);
    if (self->_isSubFrameEnabled && !a5->var4)
      objc_msgSend((id)objc_msgSend(v13, "video"), "setTilesPerFrame:", 4);
    IntWithDefault = (int)APSSettingsGetIntWithDefault();
    v16 = (int)APSSettingsGetIntWithDefault();
    objc_msgSend((id)objc_msgSend(v13, "video"), "setTxMaxBitrate:", IntWithDefault);
    objc_msgSend((id)objc_msgSend(v13, "video"), "setTxMinBitrate:", v16);
    objc_msgSend(v13, "setRtcpTimeOutEnabled:", 1);
    objc_msgSend(v13, "setRtcpSendInterval:", 1.0);
    objc_msgSend(v13, "setRtcpTimeOutInterval:", 30.0);
    objc_msgSend(v13, "setSRTPCipherSuite:", 5);
    objc_msgSend(v13, "setSRTCPCipherSuite:", 5);
    if (a6)
    {
      objc_msgSend(v13, "setReceiveMasterKey:", objc_msgSend(a6, "receiveMasterKey"));
      var2 = (id)objc_msgSend(a6, "sendMasterKey");
    }
    else
    {
      objc_msgSend(v13, "setReceiveMasterKey:", a5->var3);
      var2 = a5->var2;
    }
    objc_msgSend(v13, "setSendMasterKey:", var2);
    if (gLogCategory_APEndpointStreamScreenUDP <= 50
      && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend((id)objc_msgSend(v13, "video"), "tilesPerFrame");
      objc_msgSend((id)objc_msgSend(v13, "video"), "hdrMode");
      objc_msgSend((id)objc_msgSend(v13, "video"), "pixelFormat");
      LogPrintF();
    }
    v18 = v13;
    result = 0;
    *a3 = v18;
  }
  return result;
}

- (int)getClientUPID:(unint64_t *)a3
{
  void *v4;
  pid_t v5;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0u;
  v9 = 0u;
  v7 = 0u;
  if (APSHasUDPMirroringOutOfProcessSupport())
  {
    v4 = (void *)-[objc_class getDaemonProcessInfo](getAVCDaemonProcessInfoClass(), "getDaemonProcessInfo", v7);
    if (v4)
    {
      *a3 = objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", getAVCKeyDaemonProcessInfoUniquePID()), "longLongValue");
      return 0;
    }
    APSLogErrorAt();
  }
  else
  {
    v5 = getpid();
    if (proc_pidinfo(v5, 17, 1uLL, &v7, 56) == 56)
    {
      *a3 = v8;
      return 0;
    }
    *a3 = 0;
  }
  if (gLogCategory_APEndpointStreamScreenUDP <= 90
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return 0;
}

- (id)negotiationDataForPresentationMode:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = 40;
  if (!a3)
    v3 = 32;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v3), "offer");
}

- (unsigned)isConfigPresentForPresentationMode:(unsigned __int8)a3
{
  uint64_t v3;

  v3 = 56;
  if (!a3)
    v3 = 48;
  return *(Class *)((char *)&self->super.isa + v3) != 0;
}

- (void)handleFailureWithError:(int)a3 reason:(__CFString *)a4
{
  uint64_t v6;
  uint64_t v7;
  const void *v8;

  if (self->_eventHandleFailed && self->_eventWeakContext)
  {
    v6 = *(_QWORD *)&a3;
    v7 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v7)
    {
      v8 = (const void *)v7;
      ((void (*)(uint64_t, uint64_t, __CFString *))self->_eventHandleFailed)(v7, v6, a4);
      CFRelease(v8);
    }
  }
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  int v6;

  if (a5)
    v6 = objc_msgSend(a5, "code");
  else
    v6 = 0;
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_didStartStatus = v6;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
}

- (void)streamDidStop:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_completionSemaphore);
}

- (void)streamDidServerDie:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 30
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  -[APEndpointStreamScreenAVCWrapper handleFailureWithError:reason:](self, "handleFailureWithError:reason:", 0, CFSTR("Server Died"));
}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)screenCapture:(id)a3 screenDidClear:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  const void *v7;

  v4 = a4;
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (self->_eventHandleClearScreen && self->_eventWeakContext)
  {
    v6 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v6)
    {
      v7 = (const void *)v6;
      ((void (*)(uint64_t, _BOOL8))self->_eventHandleClearScreen)(v6, v4);
      CFRelease(v7);
    }
  }
}

- (void)serverDidDisconnect:(id)a3
{
  if (gLogCategory_APEndpointStreamScreenUDP <= 40
    && (gLogCategory_APEndpointStreamScreenUDP != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

@end
