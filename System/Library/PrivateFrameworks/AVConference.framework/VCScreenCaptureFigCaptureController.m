@implementation VCScreenCaptureFigCaptureController

- (VCScreenCaptureFigCaptureController)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4
{
  uint64_t v7;
  NSObject *v8;
  VCScreenCaptureFigCaptureController *v9;
  objc_super v11;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      v13 = v7;
      v14 = 2080;
      v15 = "-[VCScreenCaptureFigCaptureController initWithDelegate:screenCaptureSourceContext:]";
      v16 = 1024;
      v17 = 40;
      v18 = 2112;
      v19 = a3;
      _os_log_impl(&dword_1D8A54000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VCScreenCaptureFigCaptureController;
  v9 = -[VCObject init](&v11, sel_init);
  if (v9)
  {
    v9->_delegate = (VCScreenCaptureSourceDelegate *)a3;
    v9->_frameCallback = *a4;
    pthread_mutex_init(&v9->_stateMutex, 0);
    v9->_isRunning = 0;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_stateMutex);
  v3.receiver = self;
  v3.super_class = (Class)VCScreenCaptureFigCaptureController;
  -[VCObject dealloc](&v3, sel_dealloc);
}

- (int)startScreenCaptureWithConfig:(id)a3
{
  uint64_t v5;
  NSObject *v6;
  FigScreenCaptureController *captureControllerSession;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315906;
      v10 = v5;
      v11 = 2080;
      v12 = "-[VCScreenCaptureFigCaptureController startScreenCaptureWithConfig:]";
      v13 = 1024;
      v14 = 56;
      v15 = 2112;
      v16 = a3;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting with config=%@", (uint8_t *)&v9, 0x26u);
    }
  }
  captureControllerSession = self->_captureControllerSession;
  if (!captureControllerSession)
  {
    captureControllerSession = (FigScreenCaptureController *)(id)objc_msgSend(MEMORY[0x1E0CC3248], "screenCaptureControllerWithFigVirtualDisplayOptions:", a3);
    self->_captureControllerSession = captureControllerSession;
  }
  -[FigScreenCaptureController setDelegate:](captureControllerSession, "setDelegate:", self);
  -[FigScreenCaptureController startCapture](self->_captureControllerSession, "startCapture");
  -[VCScreenCaptureFigCaptureController setIsRunning:](self, "setIsRunning:", 1);
  return 0;
}

- (int)stopScreenCapture
{
  uint64_t v3;
  NSObject *v4;
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
      v9 = "-[VCScreenCaptureFigCaptureController stopScreenCapture]";
      v10 = 1024;
      v11 = 67;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping", (uint8_t *)&v6, 0x1Cu);
    }
  }
  if (self->_captureControllerSession)
  {
    -[VCScreenCaptureFigCaptureController setIsRunning:](self, "setIsRunning:", 0);
    -[FigScreenCaptureController stopCapture](self->_captureControllerSession, "stopCapture");
    -[FigScreenCaptureController setDelegate:](self->_captureControllerSession, "setDelegate:", 0);

    self->_captureControllerSession = 0;
  }
  return 0;
}

- (int)pauseScreenCapture:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  NSObject *v6;
  const char *v7;
  int v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const char *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = "Resuming";
      v10 = v5;
      v9 = 136315906;
      v12 = "-[VCScreenCaptureFigCaptureController pauseScreenCapture:]";
      v11 = 2080;
      if (v3)
        v7 = "Pausing";
      v13 = 1024;
      v14 = 79;
      v15 = 2080;
      v16 = v7;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d shouldPause=%s", (uint8_t *)&v9, 0x26u);
    }
  }
  if (v3)
  {
    -[VCScreenCaptureFigCaptureController setIsRunning:](self, "setIsRunning:", 0);
    -[FigScreenCaptureController suspendCapture](self->_captureControllerSession, "suspendCapture");
  }
  else
  {
    -[VCScreenCaptureFigCaptureController setIsRunning:](self, "setIsRunning:", 1);
    -[FigScreenCaptureController resumeCapture](self->_captureControllerSession, "resumeCapture");
  }
  return 0;
}

- (void)finalize
{
  uint64_t v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315650;
      v6 = v3;
      v7 = 2080;
      v8 = "-[VCScreenCaptureFigCaptureController finalize]";
      v9 = 1024;
      v10 = 91;
      _os_log_impl(&dword_1D8A54000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finalizing", (uint8_t *)&v5, 0x1Cu);
    }
  }
  -[VCScreenCaptureFigCaptureController stopScreenCapture](self, "stopScreenCapture");

  self->_delegate = 0;
  self->_frameCallback.sinkContext = 0;
  self->_frameCallback.sinkCallback = 0;
}

- (void)setIsRunning:(BOOL)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;

  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  self->_isRunning = a3;
  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureController:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4 transformFlags:(unint64_t)a5
{
  _opaque_pthread_mutex_t *p_stateMutex;
  _BOOL4 isRunning;
  void (*sinkCallback)(void *, opaqueCMSampleBuffer *, unint64_t);
  BOOL v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  isRunning = self->_isRunning;
  if (!a4
    || ((sinkCallback = (void (*)(void *, opaqueCMSampleBuffer *, unint64_t))self->_frameCallback.sinkCallback,
         self->_isRunning)
      ? (v11 = sinkCallback == 0)
      : (v11 = 1),
        v11))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      v12 = VRTraceErrorLogLevelToCSTR();
      v13 = *MEMORY[0x1E0CF2758];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
      {
        v16 = 136315906;
        v17 = v12;
        v18 = 2080;
        v19 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
        v20 = 1024;
        v21 = 119;
        v22 = 1024;
        v23 = isRunning;
        _os_log_impl(&dword_1D8A54000, v13, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Callback is missing a sample buffer, isRunning=%d", (uint8_t *)&v16, 0x22u);
      }
    }
  }
  else
  {
    sinkCallback(self->_frameCallback.sinkContext, a4, a5);
    if (self->_shouldClearScreen)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        v14 = VRTraceErrorLogLevelToCSTR();
        v15 = *MEMORY[0x1E0CF2758];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
        {
          v16 = 136315650;
          v17 = v14;
          v18 = 2080;
          v19 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didReceiveSampleBuffer:transformFlags:]";
          v20 = 1024;
          v21 = 114;
          _os_log_impl(&dword_1D8A54000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear screen state unset", (uint8_t *)&v16, 0x1Cu);
        }
      }
      self->_shouldClearScreen = 0;
      -[VCScreenCaptureFigCaptureController shouldClearScreen:](self, "shouldClearScreen:", 0);
    }
  }
  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureController:(id)a3 didFailWithStatus:(int)a4
{
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v6 = VRTraceErrorLogLevelToCSTR();
    v7 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315906;
      v9 = v6;
      v10 = 2080;
      v11 = "-[VCScreenCaptureFigCaptureController screenCaptureController:didFailWithStatus:]";
      v12 = 1024;
      v13 = 125;
      v14 = 1024;
      v15 = a4;
      _os_log_impl(&dword_1D8A54000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d didStart with status=%d", (uint8_t *)&v8, 0x22u);
    }
  }
  if (a4)
  {
    -[VCScreenCaptureFigCaptureController setIsRunning:](self, "setIsRunning:", 0);
    -[VCScreenCaptureFigCaptureController callbackWithEventString:](self, "callbackWithEventString:", CFSTR("vcScreenCaptureFailStart"));
  }
}

- (void)screenCaptureControllerWasPreempted:(id)a3
{
  uint64_t v4;
  NSObject *v5;
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
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerWasPreempted:]";
      v10 = 1024;
      v11 = 135;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Was preempted", (uint8_t *)&v6, 0x1Cu);
    }
  }
  -[VCScreenCaptureFigCaptureController callbackWithEventString:](self, "callbackWithEventString:", CFSTR("vcScreenCaptureFailPreempt"));
}

- (void)screenCaptureControllerMediaServicesWereReset:(id)a3
{
  _opaque_pthread_mutex_t *p_stateMutex;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_stateMutex = &self->_stateMutex;
  pthread_mutex_lock(&self->_stateMutex);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315650;
      v8 = v5;
      v9 = 2080;
      v10 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerMediaServicesWereReset:]";
      v11 = 1024;
      v12 = 141;
      _os_log_impl(&dword_1D8A54000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Services were reset", (uint8_t *)&v7, 0x1Cu);
    }
  }
  if (VCFeatureFlagManager_DaemonCrashRecovery())
  {
    if (self->_isRunning)
    {
      -[FigScreenCaptureController stopCapture](self->_captureControllerSession, "stopCapture");
      -[FigScreenCaptureController startCapture](self->_captureControllerSession, "startCapture");
    }
  }
  else
  {
    -[VCScreenCaptureFigCaptureController callbackWithEventString:](self, "callbackWithEventString:", CFSTR("vcScreenCaptureFailServerDied"));
  }
  pthread_mutex_unlock(p_stateMutex);
}

- (void)screenCaptureControllerDidReceiveClearScreen:(id)a3
{
  uint64_t v4;
  NSObject *v5;
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
    v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E0CF2758];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CF2758], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315650;
      v7 = v4;
      v8 = 2080;
      v9 = "-[VCScreenCaptureFigCaptureController screenCaptureControllerDidReceiveClearScreen:]";
      v10 = 1024;
      v11 = 155;
      _os_log_impl(&dword_1D8A54000, v5, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Clear screen state set", (uint8_t *)&v6, 0x1Cu);
    }
  }
  self->_shouldClearScreen = 1;
  -[VCScreenCaptureFigCaptureController shouldClearScreen:](self, "shouldClearScreen:", 1);
}

- (void)shouldClearScreen:(BOOL)a3
{
  VCScreenCaptureSourceDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    -[VCScreenCaptureSourceDelegate screenCaptureSourceShouldClearScreen:](delegate, "screenCaptureSourceShouldClearScreen:", a3);
}

- (void)callbackWithEventString:(id)a3
{
  VCScreenCaptureSourceDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    -[VCScreenCaptureSourceDelegate screenCaptureSourceProcessEventString:](delegate, "screenCaptureSourceProcessEventString:", a3);
}

@end
