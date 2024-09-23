@implementation CameraConferenceSynchronizer

- (BOOL)shouldConferenceChangeCameraToCaptureSettings
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 receivedRequestToChangeCamera;
  _BOOL4 isConference720p;
  _BOOL4 isConferenceOniPad;
  _BOOL4 receivedFirstRemoteFrame;
  int cameraHasChangedToCapture;
  int didSendFirstRemoteFrameNotification;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      receivedRequestToChangeCamera = self->receivedRequestToChangeCamera;
      isConference720p = self->isConference720p;
      isConferenceOniPad = self->isConferenceOniPad;
      receivedFirstRemoteFrame = self->receivedFirstRemoteFrame;
      cameraHasChangedToCapture = self->cameraHasChangedToCapture;
      didSendFirstRemoteFrameNotification = self->didSendFirstRemoteFrameNotification;
      v17 = 136317186;
      v18 = v5;
      v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings]";
      v21 = 1024;
      v22 = 47;
      v23 = 1024;
      v24 = receivedRequestToChangeCamera;
      v25 = 1024;
      v26 = isConference720p;
      v27 = 1024;
      v28 = isConferenceOniPad;
      v29 = 1024;
      v30 = receivedFirstRemoteFrame;
      v31 = 1024;
      v32 = cameraHasChangedToCapture;
      v33 = 1024;
      v34 = didSendFirstRemoteFrameNotification;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d %d %d %d %d %d", (uint8_t *)&v17, 0x40u);
    }
  }
  if (self->receivedRequestToChangeCamera)
  {
    if (self->isConference720p)
    {
      v13 = !self->isConferenceOniPad;
      if (self->isConferenceOniPad && self->didSendFirstRemoteFrameNotification)
        v13 = 1;
    }
    else
    {
      v13 = self->didSendFirstRemoteFrameNotification != 0;
    }
  }
  else
  {
    v13 = 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = v14;
      v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings]";
      v21 = 1024;
      v22 = 59;
      v23 = 1024;
      v24 = v13;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v17, 0x22u);
    }
  }
  return v13;
}

- (BOOL)shouldConferenceSendFirstRemoteFrameNotification
{
  int ErrorLogLevelForModule;
  os_log_t *v4;
  uint64_t v5;
  NSObject *v6;
  _BOOL4 receivedRequestToChangeCamera;
  _BOOL4 isConference720p;
  _BOOL4 isConferenceOniPad;
  _BOOL4 receivedFirstRemoteFrame;
  int cameraHasChangedToCapture;
  int didSendFirstRemoteFrameNotification;
  _BOOL4 v13;
  uint64_t v14;
  NSObject *v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
  v4 = (os_log_t *)MEMORY[0x1E0CF2758];
  if (ErrorLogLevelForModule >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      receivedRequestToChangeCamera = self->receivedRequestToChangeCamera;
      isConference720p = self->isConference720p;
      isConferenceOniPad = self->isConferenceOniPad;
      receivedFirstRemoteFrame = self->receivedFirstRemoteFrame;
      cameraHasChangedToCapture = self->cameraHasChangedToCapture;
      didSendFirstRemoteFrameNotification = self->didSendFirstRemoteFrameNotification;
      v17 = 136317186;
      v18 = v5;
      v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification]";
      v21 = 1024;
      v22 = 67;
      v23 = 1024;
      v24 = receivedRequestToChangeCamera;
      v25 = 1024;
      v26 = isConference720p;
      v27 = 1024;
      v28 = isConferenceOniPad;
      v29 = 1024;
      v30 = receivedFirstRemoteFrame;
      v31 = 1024;
      v32 = cameraHasChangedToCapture;
      v33 = 1024;
      v34 = didSendFirstRemoteFrameNotification;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %d %d %d %d %d %d", (uint8_t *)&v17, 0x40u);
    }
  }
  if (self->receivedFirstRemoteFrame)
    v13 = !self->isConference720p || self->isConferenceOniPad || self->cameraHasChangedToCapture != 0;
  else
    v13 = 0;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *v4;
    if (os_log_type_enabled(*v4, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315906;
      v18 = v14;
      v19 = 2080;
      v20 = "-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification]";
      v21 = 1024;
      v22 = 79;
      v23 = 1024;
      v24 = v13;
      _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v17, 0x22u);
    }
  }
  return v13;
}

- (BOOL)shouldConferenceChangeCameraToPreviewSettings
{
  uint64_t v2;
  NSObject *v3;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315906;
      v6 = v2;
      v7 = 2080;
      v8 = "-[CameraConferenceSynchronizer shouldConferenceChangeCameraToPreviewSettings]";
      v9 = 1024;
      v10 = 91;
      v11 = 1024;
      v12 = 0;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d returning %d", (uint8_t *)&v5, 0x22u);
    }
  }
  return 0;
}

- (void)changeCameraToCaptureSettings:(double)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v7;
  NSObject *v8;
  VCVideoRule *captureRule;
  const char *v10;
  dispatch_time_t v11;
  NSObject *global_queue;
  _QWORD v13[5];
  BOOL v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  double v24;
  __int16 v25;
  _BOOL4 v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!self->cameraHasChangedToCapture)
  {
    v4 = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        captureRule = self->captureRule;
        if (captureRule)
          v10 = -[NSString UTF8String](-[VCVideoRule description](captureRule, "description"), "UTF8String");
        else
          v10 = "<nil>";
        *(_DWORD *)buf = 136316418;
        v16 = v7;
        v17 = 2080;
        v18 = "-[CameraConferenceSynchronizer changeCameraToCaptureSettings:forced:]";
        v19 = 1024;
        v20 = 98;
        v21 = 2080;
        v22 = v10;
        v23 = 2048;
        v24 = a3;
        v25 = 1024;
        v26 = v4;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d scheduling camera change to %s in %g ms forced %d", buf, 0x36u);
      }
    }
    v11 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    global_queue = dispatch_get_global_queue(2, 0);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__CameraConferenceSynchronizer_changeCameraToCaptureSettings_forced___block_invoke;
    v13[3] = &unk_1E9E521E8;
    v13[4] = self;
    v14 = v4;
    dispatch_after(v11, global_queue, v13);
  }
}

uint64_t __69__CameraConferenceSynchronizer_changeCameraToCaptureSettings_forced___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  float v5;

  v2 = +[VCVideoCaptureServer VCVideoCaptureServerSingleton](VCVideoCaptureServer, "VCVideoCaptureServerSingleton");
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "iWidth");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "iHeight");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "fRate");
  return objc_msgSend(v2, "setCaptureWidth:height:rate:forced:", v3, v4, (int)v5, *(unsigned __int8 *)(a1 + 40));
}

- (void)notifyClientOfRemoteFrame:(double)a3
{
  int *p_didSendFirstRemoteFrameNotification;
  uint64_t v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSObject *global_queue;
  int v11;
  uint64_t v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->remoteFrameNotificationBlock)
  {
    p_didSendFirstRemoteFrameNotification = &self->didSendFirstRemoteFrameNotification;
    do
    {
      if (__ldxr((unsigned int *)p_didSendFirstRemoteFrameNotification))
      {
        __clrex();
        return;
      }
    }
    while (__stxr(1u, (unsigned int *)p_didSendFirstRemoteFrameNotification));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v11 = 136315906;
        v12 = v7;
        v13 = 2080;
        v14 = "-[CameraConferenceSynchronizer notifyClientOfRemoteFrame:]";
        v15 = 1024;
        v16 = 114;
        v17 = 2048;
        v18 = a3;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d scheduling remote frame notification in %g ms", (uint8_t *)&v11, 0x26u);
      }
    }
    v9 = dispatch_time(0, (uint64_t)(a3 * 1000000.0));
    global_queue = dispatch_get_global_queue(2, 0);
    dispatch_after(v9, global_queue, self->remoteFrameNotificationBlock);
    _Block_release(self->remoteFrameNotificationBlock);
    self->remoteFrameNotificationBlock = 0;
  }
}

- (CameraConferenceSynchronizer)init
{
  CameraConferenceSynchronizer *v2;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v4.receiver = self;
  v4.super_class = (Class)CameraConferenceSynchronizer;
  v2 = -[CameraConferenceSynchronizer init](&v4, sel_init);
  if (v2)
    v2->captureRule = objc_alloc_init(VCVideoRule);
  return v2;
}

- (void)dealloc
{
  VCVideoRule *captureRule;
  id remoteFrameNotificationBlock;
  id didStopNotificationBlock;
  objc_super v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  captureRule = self->captureRule;
  if (captureRule)

  self->captureRule = 0;
  remoteFrameNotificationBlock = self->remoteFrameNotificationBlock;
  if (remoteFrameNotificationBlock)
    _Block_release(remoteFrameNotificationBlock);
  self->remoteFrameNotificationBlock = 0;
  didStopNotificationBlock = self->didStopNotificationBlock;
  if (didStopNotificationBlock)
    _Block_release(didStopNotificationBlock);
  self->didStopNotificationBlock = 0;
  v6.receiver = self;
  v6.super_class = (Class)CameraConferenceSynchronizer;
  -[CameraConferenceSynchronizer dealloc](&v6, sel_dealloc);
}

- (void)reset
{
  uint64_t v3;
  NSObject *v4;
  CGSize *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v3;
      v8 = 2080;
      v9 = "-[CameraConferenceSynchronizer reset]";
      v10 = 1024;
      v11 = 158;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v6, 0x1Cu);
    }
  }
  self->cameraHasChangedToCapture = 0;
  self->didSendFirstRemoteFrameNotification = 0;
  v5 = (CGSize *)MEMORY[0x1E0C9D820];
  *(_DWORD *)&self->isConference720p = 0;
  self->localPortraitAspectRatio = *v5;
}

- (void)cameraSizeChangedTo:(CGSize)a3
{
  double height;
  int *p_cameraHasChangedToCapture;
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  height = a3.height;
  v15 = *MEMORY[0x1E0C80C00];
  if (a3.width == (double)-[VCVideoRule iWidth](self->captureRule, "iWidth")
    && height == (double)-[VCVideoRule iHeight](self->captureRule, "iHeight"))
  {
    p_cameraHasChangedToCapture = &self->cameraHasChangedToCapture;
    do
    {
      if (__ldxr((unsigned int *)p_cameraHasChangedToCapture))
      {
        __clrex();
        return;
      }
    }
    while (__stxr(1u, (unsigned int *)p_cameraHasChangedToCapture));
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v7;
        v11 = 2080;
        v12 = "-[CameraConferenceSynchronizer cameraSizeChangedTo:]";
        v13 = 1024;
        v14 = 175;
        _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d done", (uint8_t *)&v9, 0x1Cu);
      }
    }
    if (-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification](self, "shouldConferenceSendFirstRemoteFrameNotification"))
    {
      -[CameraConferenceSynchronizer notifyClientOfRemoteFrame:](self, "notifyClientOfRemoteFrame:", 0.0);
    }
  }
}

- (void)scheduleFirstRemoteFrameNotification:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  id remoteFrameNotificationBlock;
  _BOOL8 v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v9 = 136315650;
        v10 = v5;
        v11 = 2080;
        v12 = "-[CameraConferenceSynchronizer scheduleFirstRemoteFrameNotification:]";
        v13 = 1024;
        v14 = 188;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v9, 0x1Cu);
      }
    }
    self->receivedFirstRemoteFrame = 1;
    remoteFrameNotificationBlock = self->remoteFrameNotificationBlock;
    if (remoteFrameNotificationBlock)
      _Block_release(remoteFrameNotificationBlock);
    self->remoteFrameNotificationBlock = _Block_copy(a3);
    if (-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification](self, "shouldConferenceSendFirstRemoteFrameNotification"))
    {
      -[CameraConferenceSynchronizer notifyClientOfRemoteFrame:](self, "notifyClientOfRemoteFrame:", 0.0);
    }
    if (-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings](self, "shouldConferenceChangeCameraToCaptureSettings"))
    {
      v8 = self->isConference720p && !self->isConferenceOniPad;
      -[CameraConferenceSynchronizer changeCameraToCaptureSettings:forced:](self, "changeCameraToCaptureSettings:forced:", v8, 0.0);
    }
  }
}

- (void)scheduleCameraChangeToPreviewSettings
{
  uint64_t v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v2 = VRTraceErrorLogLevelToCSTR();
    v3 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136315650;
      v5 = v2;
      v6 = 2080;
      v7 = "-[CameraConferenceSynchronizer scheduleCameraChangeToPreviewSettings]";
      v8 = 1024;
      v9 = 208;
      _os_log_impl(&dword_1D8A54000, v3, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d NoOps", (uint8_t *)&v4, 0x1Cu);
    }
  }
}

- (void)scheduleCameraChangeToCaptureSettings:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      v5 = VRTraceErrorLogLevelToCSTR();
      v6 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v8 = 136315650;
        v9 = v5;
        v10 = 2080;
        v11 = "-[CameraConferenceSynchronizer scheduleCameraChangeToCaptureSettings:]";
        v12 = 1024;
        v13 = 216;
        _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d ", (uint8_t *)&v8, 0x1Cu);
      }
    }
    -[VCVideoRule setToVideoRule:](self->captureRule, "setToVideoRule:", a3);
    self->receivedRequestToChangeCamera = 1;
    v7 = -[VCVideoRule iWidth](self->captureRule, "iWidth");
    self->isConference720p = -[VCVideoRule iHeight](self->captureRule, "iHeight") * v7 == 921600;
    if (-[CameraConferenceSynchronizer shouldConferenceSendFirstRemoteFrameNotification](self, "shouldConferenceSendFirstRemoteFrameNotification"))
    {
      -[CameraConferenceSynchronizer notifyClientOfRemoteFrame:](self, "notifyClientOfRemoteFrame:", 0.0);
    }
    if (-[CameraConferenceSynchronizer shouldConferenceChangeCameraToCaptureSettings](self, "shouldConferenceChangeCameraToCaptureSettings"))
    {
      -[CameraConferenceSynchronizer changeCameraToCaptureSettings:forced:](self, "changeCameraToCaptureSettings:forced:", 1, 0.0);
    }
  }
}

- (void)setLocalPortraitAspectRatio:(CGSize)a3
{
  self->localPortraitAspectRatio = a3;
  self->isConferenceOniPad = a3.width / a3.height == 0.75;
}

- (CGSize)localPortraitAspectRatio
{
  double width;
  double height;
  CGSize result;

  width = self->localPortraitAspectRatio.width;
  height = self->localPortraitAspectRatio.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
