@implementation RPScreenRecorder

- (RPScreenRecorder)init
{
  char *v2;
  void *v3;
  objc_super v5;
  uint8_t buf[4];
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5.receiver = self;
  v5.super_class = (Class)RPScreenRecorder;
  v2 = -[RPScreenRecorder init](&v5, sel_init);
  if (v2)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v7 = "-[RPScreenRecorder init]";
      v8 = 1024;
      v9 = 135;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
    }
    *(_WORD *)(v2 + 9) = 0;
    v2[15] = 0;
    *((_WORD *)v2 + 6) = 0;
    v3 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = 0;

    v2[8] = 1;
    objc_msgSend(v2, "updateStateWithActive:error:", 0, 0);
    objc_msgSend(v2, "isScreenRecordingAvailable");
  }
  return (RPScreenRecorder *)v2;
}

- (void)setDelegate:(id)delegate
{
  id v4;
  id v5;
  char v6;
  _BOOL4 available;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = delegate;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446722;
    v10 = "-[RPScreenRecorder setDelegate:]";
    v11 = 1024;
    v12 = 165;
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate %p", (uint8_t *)&v9, 0x1Cu);
  }
  v5 = objc_storeWeak((id *)&self->_delegate, v4);
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      available = self->_available;
      v9 = 136446722;
      v10 = "-[RPScreenRecorder setDelegate:]";
      v11 = 1024;
      v12 = 168;
      v13 = 1024;
      LODWORD(v14) = available;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v9, 0x18u);
    }
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "screenRecorderDidChangeAvailability:", self);

  }
}

- (void)setSecondDelegate:(id)a3
{
  id v5;
  _BOOL4 available;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446722;
    v8 = "-[RPScreenRecorder setSecondDelegate:]";
    v9 = 1024;
    v10 = 174;
    v11 = 2048;
    v12 = v5;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d secondDelegate %p", (uint8_t *)&v7, 0x1Cu);
  }
  objc_storeStrong((id *)&self->_secondDelegate, a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      available = self->_available;
      v7 = 136446722;
      v8 = "-[RPScreenRecorder setSecondDelegate:]";
      v9 = 1024;
      v10 = 177;
      v11 = 1024;
      LODWORD(v12) = available;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v7, 0x18u);
    }
    -[RPScreenRecorderDelegate screenRecorderDidChangeAvailability:](self->_secondDelegate, "screenRecorderDidChangeAvailability:", self);
  }

}

- (void)setMicrophoneEnabled:(BOOL)microphoneEnabled
{
  _BOOL8 v3;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v3 = microphoneEnabled;
  v14 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446978;
    v7 = "-[RPScreenRecorder setMicrophoneEnabled:]";
    v8 = 1024;
    v9 = 183;
    v10 = 1024;
    v11 = v3;
    v12 = 1024;
    v13 = -[RPScreenRecorder isMicrophoneEnabled](self, "isMicrophoneEnabled");
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d :%d from current mic state:%d", (uint8_t *)&v6, 0x1Eu);
  }
  if (self->_microphoneEnabled != v3)
  {
    if (-[RPScreenRecorder systemRecording](self, "systemRecording"))
    {
      +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setMicrophoneEnabled:", v3);

    }
    self->_microphoneEnabled = v3;
  }
  -[RPScreenRecorder notifyDelegateOfUpdatedState](self, "notifyDelegateOfUpdatedState");
}

+ (RPScreenRecorder)sharedRecorder
{
  _QWORD block[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __34__RPScreenRecorder_sharedRecorder__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedRecorder_onceToken != -1)
    dispatch_once(&sharedRecorder_onceToken, block);
  if (!__RPLogLevel && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "+[RPScreenRecorder sharedRecorder]";
    v7 = 1024;
    v8 = 228;
    v9 = 2048;
    v10 = a1;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [DEBUG] %{public}s:%d Accessing the sharedRecorder %p", buf, 0x1Cu);
  }
  return (RPScreenRecorder *)(id)sharedRecorder_replayRecorder;
}

uint64_t __34__RPScreenRecorder_sharedRecorder__block_invoke()
{
  id v0;
  void *v1;
  NSObject *v2;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedRecorder_replayRecorder;
  sharedRecorder_replayRecorder = (uint64_t)v0;

  objc_msgSend((id)sharedRecorder_replayRecorder, "processQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_3);

  return objc_msgSend((id)sharedRecorder_replayRecorder, "setCameraPosition:", 1);
}

void __34__RPScreenRecorder_sharedRecorder__block_invoke_2()
{
  id v0;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "addObserver:selector:name:object:", sharedRecorder_replayRecorder, sel_updateRecordingAvailability_, *MEMORY[0x24BE63740], 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  RPScreenRecorder *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v6 = "-[RPScreenRecorder dealloc]";
    v7 = 1024;
    v8 = 233;
    v9 = 2048;
    v10 = self;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d %p", buf, 0x1Cu);
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RPScreenRecorder;
  -[RPScreenRecorder dealloc](&v4, sel_dealloc);
}

- (BOOL)isAvailable
{
  _BOOL4 available;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    available = self->_available;
    v5 = 136446722;
    v6 = "-[RPScreenRecorder isAvailable]";
    v7 = 1024;
    v8 = 240;
    v9 = 1024;
    v10 = available;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d isAvailable %d", (uint8_t *)&v5, 0x18u);
  }
  if (self->_available)
    return 1;
  -[RPScreenRecorder isScreenRecordingAvailable](self, "isScreenRecordingAvailable");
  return self->_available;
}

- (void)startRecordingWithMicrophoneEnabled:(BOOL)microphoneEnabled handler:(void *)handler
{
  _BOOL8 v4;
  void *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v4 = microphoneEnabled;
  v11 = *MEMORY[0x24BDAC8D0];
  v6 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446466;
    v8 = "-[RPScreenRecorder startRecordingWithMicrophoneEnabled:handler:]";
    v9 = 1024;
    v10 = 251;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v7, 0x12u);
  }
  -[RPScreenRecorder setMicrophoneEnabled:](self, "setMicrophoneEnabled:", v4);
  -[RPScreenRecorder startRecordingWithHandler:](self, "startRecordingWithHandler:", v6);

}

- (void)stopRecordingWithVideoURLHandler:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPScreenRecorder stopRecordingWithVideoURLHandler:]";
    v7 = 1024;
    v8 = 261;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPScreenRecorder stopSystemRecordingWithURLHandler:](self, "stopSystemRecordingWithURLHandler:", v4);

}

- (void)stopRecordingWithAdditionalShareFileAttachment:(id)a3 overrideShareMessage:(id)a4 previewViewControllerOverrideTintColor:(id)a5 handler:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136446466;
    v15 = "-[RPScreenRecorder stopRecordingWithAdditionalShareFileAttachment:overrideShareMessage:previewViewControllerOv"
          "errideTintColor:handler:]";
    v16 = 1024;
    v17 = 274;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v14, 0x12u);
  }
  -[RPScreenRecorder stopRecordingWithHandler:](self, "stopRecordingWithHandler:", v13);

}

- (void)startRecordingWithHandler:(void *)handler
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startRecordingWithHandler:]";
    v11 = 1024;
    v12 = 280;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder startRecordingWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke;
      v7[3] = &unk_24D15D850;
      v7[4] = self;
      v8 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v7);

      goto LABEL_12;
    }
    if (!v4)
      goto LABEL_12;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  (*((void (**)(void *, uint64_t))v4 + 2))(v4, v5);

LABEL_12:
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "checkContextID:withHandler:", v2, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
    v7 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
    v8 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2;
    v11[3] = &unk_24D15D828;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v9, "startInAppRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v8, v7, v11, v4, v6);

  }
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startRecordingWithHandler:]_block_invoke";
    v22 = 1024;
    v23 = 313;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9;
  v15[3] = &unk_24D15D800;
  v19 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v16 = v7;
  v17 = v12;
  v18 = v13;
  v14 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "instantiatePipView");
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "updateStateWithActive:error:", 1, v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9_cold_1();
  }
}

- (void)stopRecordingWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopRecordingWithHandler:]";
    v11 = 1024;
    v12 = 347;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    -[RPScreenRecorder setWindowRotationLocked:](self, "setWindowRotationLocked:", 0);
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke;
    v7[3] = &unk_24D15D8A0;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopInAppRecordingWithHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopRecordingWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v8[4];
  id v9;
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0, v6);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    if (v6)
    {
      if (__RPLogLevel <= 2)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_cold_1(v6);
        v7 = *(_QWORD *)(a1 + 40);
      }
      (*(void (**)(uint64_t, _QWORD, id))(v7 + 16))(v7, 0, v6);
    }
    else if (v5)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v12 = "-[RPScreenRecorder stopRecordingWithHandler:]_block_invoke";
        v13 = 1024;
        v14 = 365;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop recording successful", buf, 0x12u);
      }
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_12;
      v8[3] = &unk_24D15D850;
      v9 = v5;
      v10 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x24BDAC9B8], v8);

    }
  }

}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_12(uint64_t a1)
{
  uint64_t v1;
  _QWORD v2[4];
  id v3;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_2;
  v2[3] = &unk_24D15D878;
  v1 = *(_QWORD *)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:attachmentURL:overrideShareMessage:overrideTintColor:completion:](RPPreviewViewController, "loadPreviewViewControllerWithMovieURL:attachmentURL:overrideShareMessage:overrideTintColor:completion:", v1, 0, 0, 0, v2);

}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  _BOOL4 v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPScreenRecorder stopRecordingWithHandler:]_block_invoke_2";
    v8 = 1024;
    v9 = 381;
    v10 = 1024;
    v11 = v5 == 1;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d shouldApplyPadUILayout=%d", (uint8_t *)&v6, 0x18u);
  }
  if (v5 == 1)
    objc_msgSend(v3, "setModalPresentationStyle:", 7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)stopRecordingWithOutputURL:(NSURL *)url completionHandler:(void *)completionHandler
{
  NSURL *v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  _QWORD v10[5];
  void (**v11)(void *, void *);
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = url;
  v7 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPScreenRecorder stopRecordingWithOutputURL:completionHandler:]";
    v14 = 1024;
    v15 = 400;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder stopRecordingWithOutputURL:completionHandler:].cold.1();
      if (!v7)
        goto LABEL_12;
    }
    else if (!v7)
    {
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9);

    goto LABEL_12;
  }
  if (!self->_systemRecording)
    -[RPScreenRecorder setWindowRotationLocked:](self, "setWindowRotationLocked:", 0);
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __65__RPScreenRecorder_stopRecordingWithOutputURL_completionHandler___block_invoke;
  v10[3] = &unk_24D15D8C8;
  v10[4] = self;
  v11 = v7;
  objc_msgSend(v8, "stopInAppRecordingWithUrl:handler:", v6, v10);

LABEL_12:
}

void __65__RPScreenRecorder_stopRecordingWithOutputURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setRecording:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateProcessIDForAudioCapture:", 0);
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0, v4);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)discardRecordingWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPScreenRecorder discardRecordingWithHandler:]";
    v8 = 1024;
    v9 = 428;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v6, 0x12u);
  }
  if (!self->_recording)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "discardInAppRecordingWithHandler:", v4);

  }
}

- (void)pauseInAppRecording
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPScreenRecorder pauseInAppRecording]";
    v6 = 1024;
    v7 = 436;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseInAppRecording");

  }
}

- (void)resumeInAppRecording
{
  _BOOL4 recording;
  _BOOL4 paused;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    recording = self->_recording;
    paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    v9 = "-[RPScreenRecorder resumeInAppRecording]";
    v10 = 1024;
    v11 = 444;
    v12 = 1024;
    v13 = recording;
    v14 = 1024;
    v15 = paused;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPScreenRecorder currentWindowLayerContextID](self, "currentWindowLayerContextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_resumeInAppRecording__block_invoke;
    v7[3] = &unk_24D15D8F0;
    v7[4] = self;
    objc_msgSend(v5, "resumeInAppRecordingWithWindowLayerContextID:completionHandler:", v6, v7);

  }
}

void __40__RPScreenRecorder_resumeInAppRecording__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446722;
      v13 = "-[RPScreenRecorder resumeInAppRecording]_block_invoke";
      v14 = 1024;
      v15 = 450;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "recordingDidStopWithError:movieURL:", v7, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);

}

- (void)startCaptureWithHandler:(void *)captureHandler completionHandler:(void *)completionHandler
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];
  id v11;
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = captureHandler;
  v7 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v14 = "-[RPScreenRecorder startCaptureWithHandler:completionHandler:]";
    v15 = 1024;
    v16 = 466;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder startCaptureWithHandler:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (self->_available)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke;
      block[3] = &unk_24D15D918;
      block[4] = self;
      v11 = v7;
      v12 = v6;
      dispatch_async(MEMORY[0x24BDAC9B8], block);

      goto LABEL_12;
    }
    if (!v7)
      goto LABEL_12;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v8 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v8;
  (*((void (**)(void *, uint64_t))v7 + 2))(v7, v8);

LABEL_12:
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "checkContextID:withHandler:", v2, *(_QWORD *)(a1 + 40)))
  {
    v7 = (void *)objc_msgSend(*(id *)(a1 + 48), "copy");
    objc_msgSend(*(id *)(a1 + 32), "setCaptureHandler:", v7);

    objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
    v8 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
    v9 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2;
    v12[3] = &unk_24D15D828;
    v11 = *(void **)(a1 + 40);
    v12[4] = *(_QWORD *)(a1 + 32);
    v13 = v11;
    objc_msgSend(v10, "startInAppCaptureWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v2, v9, v8, v12, v4, v6);

  }
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startCaptureWithHandler:completionHandler:]_block_invoke";
    v22 = 1024;
    v23 = 502;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19;
  v15[3] = &unk_24D15D800;
  v19 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v16 = v7;
  v17 = v12;
  v18 = v13;
  v14 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "instantiatePipView");
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "updateStateWithActive:error:", 1, v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19_cold_1();
  }
}

- (void)stopCaptureWithHandler:(void *)handler
{
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = handler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopCaptureWithHandler:]";
    v11 = 1024;
    v12 = 537;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __43__RPScreenRecorder_stopCaptureWithHandler___block_invoke;
    v7[3] = &unk_24D15D8C8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopInAppCaptureWithHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopCaptureWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(void *, void *))v4 + 2))(v4, v6);

  }
}

void __43__RPScreenRecorder_stopCaptureWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)pauseInAppCapture
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPScreenRecorder pauseInAppCapture]";
    v6 = 1024;
    v7 = 556;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseInAppCapture");

  }
}

- (void)resumeInAppCapture
{
  _BOOL4 recording;
  _BOOL4 paused;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    recording = self->_recording;
    paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    v9 = "-[RPScreenRecorder resumeInAppCapture]";
    v10 = 1024;
    v11 = 564;
    v12 = 1024;
    v13 = recording;
    v14 = 1024;
    v15 = paused;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPScreenRecorder currentWindowLayerContextID](self, "currentWindowLayerContextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __38__RPScreenRecorder_resumeInAppCapture__block_invoke;
    v7[3] = &unk_24D15D8F0;
    v7[4] = self;
    objc_msgSend(v5, "resumeInAppCaptureWithWindowLayerContextID:completionHandler:", v6, v7);

  }
}

void __38__RPScreenRecorder_resumeInAppCapture__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446722;
      v13 = "-[RPScreenRecorder resumeInAppCapture]_block_invoke";
      v14 = 1024;
      v15 = 570;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "recordingDidStopWithError:movieURL:", v7, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);

}

- (void)captureHandlerWithSample:(id)a3 timingData:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  RPScreenRecorder *v14;

  v6 = a3;
  v7 = a4;
  -[RPScreenRecorder videoQueue](self, "videoQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__RPScreenRecorder_captureHandlerWithSample_timingData___block_invoke;
  block[3] = &unk_24D15D940;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __56__RPScreenRecorder_captureHandlerWithSample_timingData___block_invoke(uint64_t a1)
{
  __IOSurface *v2;
  CMSampleBufferRef v3;
  CMSampleTimingInfo v4;
  CMSampleTimingInfo v5;

  v2 = (__IOSurface *)objc_msgSend(*(id *)(a1 + 32), "ioSurface");
  memset(&v5, 0, sizeof(v5));
  objc_msgSend(*(id *)(a1 + 40), "getBytes:length:", &v5, 72);
  v4 = v5;
  v3 = RPSampleBufferUtilities_CreateSampleBufferFromIOSurface(v2, &v4);
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 88) + 16))();
  CFRelease(v3);
}

- (void)captureHandlerWithAudioSample:(id)a3 bufferType:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  RPScreenRecorder *v11;
  int64_t v12;

  v6 = a3;
  -[RPScreenRecorder audioQueue](self, "audioQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__RPScreenRecorder_captureHandlerWithAudioSample_bufferType___block_invoke;
  block[3] = &unk_24D15D968;
  v10 = v6;
  v11 = self;
  v12 = a4;
  v8 = v6;
  dispatch_async(v7, block);

}

void __61__RPScreenRecorder_captureHandlerWithAudioSample_bufferType___block_invoke(uint64_t a1)
{
  CMSampleBufferRef DecodeAudioSampleBuffer;
  CMSampleBufferRef v3;

  DecodeAudioSampleBuffer = RPSampleBufferUtilities_CreateDecodeAudioSampleBuffer(*(void **)(a1 + 32));
  if (DecodeAudioSampleBuffer)
  {
    v3 = DecodeAudioSampleBuffer;
    (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 88) + 16))();
    CFRelease(v3);
  }
}

- (void)startInAppBroadcastWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startInAppBroadcastWithHandler:]";
    v11 = 1024;
    v12 = 621;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke;
      v7[3] = &unk_24D15D850;
      v7[4] = self;
      v8 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v7);

      goto LABEL_18;
    }
    if (!v4)
      goto LABEL_18;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder startInAppBroadcastWithHandler:].cold.2();
    if (v4)
      goto LABEL_8;
  }
  else if (v4)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v5;
    (*((void (**)(id, uint64_t))v4 + 2))(v4, v5);

    goto LABEL_18;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    -[RPScreenRecorder startInAppBroadcastWithHandler:].cold.1();
LABEL_18:

}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "checkContextID:withHandler:", v2, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
    v7 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
    v8 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2;
    v11[3] = &unk_24D15D828;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v9, "startInAppBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v2, v8, v7, 0, v11, v4, v6);

  }
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startInAppBroadcastWithHandler:]_block_invoke";
    v22 = 1024;
    v23 = 655;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21;
  v15[3] = &unk_24D15D800;
  v19 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v16 = v7;
  v17 = v12;
  v18 = v13;
  v14 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "instantiatePipView");
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "updateStateWithActive:error:", 1, v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21_cold_1();
  }
}

- (void)stopInAppBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopInAppBroadcastWithHandler:]";
    v11 = 1024;
    v12 = 694;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPScreenRecorder isRecording](self, "isRecording"))
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke;
    v7[3] = &unk_24D15D8C8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopInAppBroadcastWithHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopInAppBroadcastWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

void __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke_cold_1();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0, 0);
  }
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, _QWORD, id))(v4 + 16))(v4, 0, v3);

}

- (void)pauseInAppBroadcast
{
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446466;
    v5 = "-[RPScreenRecorder pauseInAppBroadcast]";
    v6 = 1024;
    v7 = 716;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v4, 0x12u);
  }
  if (self->_recording && !self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pauseInAppBroadcast");

  }
}

- (void)resumeInAppBroadcast
{
  _BOOL4 recording;
  _BOOL4 paused;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    recording = self->_recording;
    paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    v9 = "-[RPScreenRecorder resumeInAppBroadcast]";
    v10 = 1024;
    v11 = 724;
    v12 = 1024;
    v13 = recording;
    v14 = 1024;
    v15 = paused;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPScreenRecorder currentWindowLayerContextID](self, "currentWindowLayerContextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_resumeInAppBroadcast__block_invoke;
    v7[3] = &unk_24D15D8F0;
    v7[4] = self;
    objc_msgSend(v5, "resumeInAppBroadcastWithWindowLayerContextID:completionHandler:", v6, v7);

  }
}

void __40__RPScreenRecorder_resumeInAppBroadcast__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446722;
      v13 = "-[RPScreenRecorder resumeInAppBroadcast]_block_invoke";
      v14 = 1024;
      v15 = 730;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "recordingDidStopWithError:movieURL:", v7, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);

}

- (void)setBroadcastURL:(id)a3
{
  id v4;
  id v5;

  objc_storeStrong((id *)&self->_broadcastURL, a3);
  v4 = a3;
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBroadcastURL:", v4);

}

- (void)clientDidUpdateBroadcastServiceInfo:(id)a3
{
  id v4;
  RPBroadcastController *activeBroadcastController;
  RPBroadcastController *v6;
  void *v7;
  RPBroadcastController *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  RPBroadcastController *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  activeBroadcastController = self->_activeBroadcastController;
  if (activeBroadcastController)
  {
    if (__RPLogLevel <= 1)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v6 = self->_activeBroadcastController;
        v12 = 136446722;
        v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
        v14 = 1024;
        v15 = 752;
        v16 = 2112;
        v17 = v6;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d activeBroadcastController: %@", (uint8_t *)&v12, 0x1Cu);
      }
      activeBroadcastController = self->_activeBroadcastController;
    }
    -[RPBroadcastController setServiceInfo:](activeBroadcastController, "setServiceInfo:", v4);
    -[RPBroadcastController delegate](self->_activeBroadcastController, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        -[RPBroadcastController delegate](self->_activeBroadcastController, "delegate");
        v8 = (RPBroadcastController *)objc_claimAutoreleasedReturnValue();
        v12 = 136446722;
        v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
        v14 = 1024;
        v15 = 755;
        v16 = 2112;
        v17 = v8;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d activeBroadcastController delegate: %@", (uint8_t *)&v12, 0x1Cu);

      }
      -[RPBroadcastController delegate](self->_activeBroadcastController, "delegate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_opt_respondsToSelector();

      if ((v10 & 1) != 0)
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v12 = 136446466;
          v13 = "-[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:]";
          v14 = 1024;
          v15 = 758;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d delegate responds to protocol", (uint8_t *)&v12, 0x12u);
        }
        -[RPBroadcastController delegate](self->_activeBroadcastController, "delegate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "broadcastController:didUpdateServiceInfo:", self->_activeBroadcastController, v4);

      }
      else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:].cold.3();
      }
    }
    else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:].cold.2();
    }
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder clientDidUpdateBroadcastServiceInfo:].cold.1();
  }

}

- (void)startSystemRecordingWithMicrophoneEnabled:(BOOL)a3 handler:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v11 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]";
    v12 = 1024;
    v13 = 774;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RPScreenRecorder setSystemRecording:](self, "setSystemRecording:", 1);
    if (self->_available)
    {
      v8[0] = MEMORY[0x24BDAC760];
      v8[1] = 3221225472;
      v8[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke;
      v8[3] = &unk_24D15D850;
      v8[4] = self;
      v9 = v5;
      dispatch_async(MEMORY[0x24BDAC9B8], v8);

      goto LABEL_12;
    }
    if (!v5)
      goto LABEL_12;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v6 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)v6;
  (*((void (**)(id, uint64_t))v5 + 2))(v5, v6);

LABEL_12:
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _QWORD v20[5];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v7);
        NSClassFromString(CFSTR("FBRootWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "setWindowToRecord:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v34, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
  +[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "screenRecordingCameraPip");

  if ((v15 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setCameraEnabled:", 0);
  v16 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
  v17 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446978;
    v27 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]_block_invoke";
    v28 = 1024;
    v29 = 814;
    v30 = 1024;
    v31 = v16;
    v32 = 1024;
    v33 = v17;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start system recording with mic:%d cam:%d", buf, 0x1Eu);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27;
  v20[3] = &unk_24D15D8C8;
  v19 = *(void **)(a1 + 40);
  v20[4] = *(_QWORD *)(a1 + 32);
  v21 = v19;
  objc_msgSend(v18, "startSystemRecordingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withHandler:", v9, v16, v17, v20, v11, v13);

}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startSystemRecordingWithMicrophoneEnabled:handler:]_block_invoke";
    v11 = 1024;
    v12 = 823;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28;
  block[3] = &unk_24D15D558;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 1, *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28_cold_1();
  }
}

- (void)stopSystemRecording:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopSystemRecording:]";
    v11 = 1024;
    v12 = 848;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPScreenRecorder isRecording](self, "isRecording"))
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __40__RPScreenRecorder_stopSystemRecording___block_invoke;
    v7[3] = &unk_24D15D8C8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopSystemRecordingWithHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopSystemRecording:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void *))v4 + 2))(v4, v6);

  }
}

void __40__RPScreenRecorder_stopSystemRecording___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setSystemRecording:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);

}

- (void)stopSystemRecordingWithURLHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopSystemRecordingWithURLHandler:]";
    v11 = 1024;
    v12 = 869;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPScreenRecorder isRecording](self, "isRecording"))
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __54__RPScreenRecorder_stopSystemRecordingWithURLHandler___block_invoke;
    v7[3] = &unk_24D15D8A0;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopSystemRecordingWithURLHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopSystemRecordingWithURLHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

void __54__RPScreenRecorder_stopSystemRecordingWithURLHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0, v5);
  objc_msgSend(*(id *)(a1 + 32), "setSystemRecording:", 0);
  v6 = *(_QWORD *)(a1 + 40);
  if (v6)
    (*(void (**)(uint64_t, id, id))(v6 + 16))(v6, v7, v5);

}

- (void)resumeSystemRecording
{
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[RPScreenRecorder resumeSystemRecording]";
    v7 = 1024;
    v8 = 892;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __41__RPScreenRecorder_resumeSystemRecording__block_invoke;
    v4[3] = &unk_24D15D990;
    v4[4] = self;
    objc_msgSend(v3, "resumeSystemRecordingWithCompletionHandler:", v4);

  }
}

void __41__RPScreenRecorder_resumeSystemRecording__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __41__RPScreenRecorder_resumeSystemRecording__block_invoke_cold_1();
  }
}

- (void)setupSystemBroadcastWithExtension:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  RPBroadcastConfiguration *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "-[RPScreenRecorder setupSystemBroadcastWithExtension:handler:]";
    v18 = 1024;
    v19 = 908;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x24BDBCE70]);
  v10 = objc_alloc_init(RPBroadcastConfiguration);
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke;
  v14[3] = &unk_24D15D9B8;
  v15 = v6;
  v13 = v6;
  objc_msgSend(v12, "setupSystemBroadcastWithHostBundleID:broadcastExtensionBundleID:broadcastConfigurationData:userInfo:handler:", v8, v5, v11, v9, v14);

}

void __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (v3 && __RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke_cold_1(v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)startSystemBroadcastWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]";
    v11 = 1024;
    v12 = 926;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder startSystemBroadcastWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[RPScreenRecorder setSystemRecording:](self, "setSystemRecording:", 1);
    if (self->_available)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke;
      v7[3] = &unk_24D15D850;
      v7[4] = self;
      v8 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v7);

      goto LABEL_12;
    }
    if (!v4)
      goto LABEL_12;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  (*((void (**)(id, uint64_t))v4 + 2))(v4, v5);

LABEL_12:
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  char v15;
  int v16;
  int v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  _QWORD v22[5];
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "windows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v25;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v25 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v7);
        NSClassFromString(CFSTR("FBRootWindow"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(*(id *)(a1 + 32), "setWindowToRecord:", v8);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v11 = v10;
  v13 = v12;
  objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
  +[RPFeatureFlagUtility sharedInstance](RPFeatureFlagUtility, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "screenRecordingCameraPip");

  if ((v15 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setCameraEnabled:", 0);
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v16 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
    v17 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
    *(_DWORD *)buf = 136446978;
    v29 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]_block_invoke";
    v30 = 1024;
    v31 = 954;
    v32 = 1024;
    v33 = v16;
    v34 = 1024;
    v35 = v17;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d attempting to start system broadcast with mic:%d cam:%d", buf, 0x1Eu);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
  v20 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34;
  v22[3] = &unk_24D15D8C8;
  v21 = *(void **)(a1 + 40);
  v22[4] = *(_QWORD *)(a1 + 32);
  v23 = v21;
  objc_msgSend(v18, "startSystemBroadcastWithContextID:windowSize:microphoneEnabled:cameraEnabled:listenerEndpoint:withHandler:", v9, v19, v20, 0, v22, v11, v13);

}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _QWORD block[5];
  id v7;
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (v3)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startSystemBroadcastWithHandler:]_block_invoke";
    v11 = 1024;
    v12 = 964;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35;
  block[3] = &unk_24D15D558;
  v4 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 1, *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
  {
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(_QWORD *)(a1 + 40));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35_cold_1();
  }
}

- (void)stopSystemBroadcastWithHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopSystemBroadcastWithHandler:]";
    v11 = 1024;
    v12 = 989;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (-[RPScreenRecorder isRecording](self, "isRecording"))
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __51__RPScreenRecorder_stopSystemBroadcastWithHandler___block_invoke;
    v7[3] = &unk_24D15D8C8;
    v7[4] = self;
    v8 = v4;
    objc_msgSend(v5, "stopSystemBroadcastWithHandler:", v7);

  }
  else
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder stopSystemBroadcastWithHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))v4 + 2))(v4, 0, v6);

  }
}

void __51__RPScreenRecorder_stopSystemBroadcastWithHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0);
  v3 = *(_QWORD *)(a1 + 40);
  if (v3)
    (*(void (**)(uint64_t, _QWORD, id))(v3 + 16))(v3, 0, v4);

}

- (void)resumeSystemBroadcast
{
  void *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v6 = "-[RPScreenRecorder resumeSystemBroadcast]";
    v7 = 1024;
    v8 = 1007;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke;
    v4[3] = &unk_24D15D990;
    v4[4] = self;
    objc_msgSend(v3, "resumeSystemBroadcastWithCompletionHandler:", v4);

  }
}

void __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke_cold_1();
  }
}

- (void)startClipBufferingWithCompletionHandler:(void *)completionHandler
{
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder startClipBufferingWithCompletionHandler:]";
    v11 = 1024;
    v12 = 1024;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (self->_available)
    {
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 3221225472;
      v7[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke;
      v7[3] = &unk_24D15D850;
      v7[4] = self;
      v8 = v4;
      dispatch_async(MEMORY[0x24BDAC9B8], v7);

      goto LABEL_12;
    }
    if (!v4)
      goto LABEL_12;
    -[RPScreenRecorder handleUnavailableState](self, "handleUnavailableState");
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder startClipBufferingWithCompletionHandler:].cold.1();
    if (!v4)
      goto LABEL_12;
    goto LABEL_8;
  }
  if (v4)
  {
LABEL_8:
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5830, 0);
    v5 = objc_claimAutoreleasedReturnValue();
LABEL_9:
    v6 = (void *)v5;
    (*((void (**)(void *, uint64_t))v4 + 2))(v4, v5);

  }
LABEL_12:

}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "currentWindowLayerContextID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "currentWindowSize");
  v4 = v3;
  v6 = v5;
  if (objc_msgSend(*(id *)(a1 + 32), "checkContextID:withHandler:", v2, *(_QWORD *)(a1 + 40)))
  {
    objc_msgSend(*(id *)(a1 + 32), "registerAppForStateChangeSetRotationLock:", 1);
    v7 = objc_msgSend(*(id *)(a1 + 32), "isCameraEnabled");
    v8 = objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled");
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2;
    v11[3] = &unk_24D15D828;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v9, "startClipBufferingWithContextID:windowSize:microphoneEnabled:cameraEnabled:withCompletionHandler:", v2, v8, v7, v11, v4, v6);

  }
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  id v18;
  char v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  if (v7)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2_cold_1();
  }
  else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v21 = "-[RPScreenRecorder startClipBufferingWithCompletionHandler:]_block_invoke";
    v22 = 1024;
    v23 = 1057;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d started", buf, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37;
  v15[3] = &unk_24D15D800;
  v19 = a3;
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(void **)(a1 + 40);
  v16 = v7;
  v17 = v12;
  v18 = v13;
  v14 = v7;
  dispatch_async(MEMORY[0x24BDAC9B8], v15);

}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    if (*(_BYTE *)(a1 + 56))
    {
      objc_msgSend(*(id *)(a1 + 40), "instantiatePipView");
      v2 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      v2 = 0;
    }
  }
  objc_msgSend(*(id *)(a1 + 40), "updateStateWithActive:error:", 1, v2);
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, *(_QWORD *)(a1 + 32));
  }
  else if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37_cold_1();
  }
}

- (void)stopClipBufferingWithCompletionHandler:(void *)completionHandler
{
  void (**v4)(void *, void *);
  void *v5;
  void *v6;
  _QWORD v7[5];
  void (**v8)(void *, void *);
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v10 = "-[RPScreenRecorder stopClipBufferingWithCompletionHandler:]";
    v11 = 1024;
    v12 = 1095;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  if (!self->_recording)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder stopClipBufferingWithCompletionHandler:].cold.1();
      if (!v4)
        goto LABEL_10;
    }
    else if (!v4)
    {
      goto LABEL_10;
    }
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5829, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v4[2](v4, v6);

    goto LABEL_10;
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __59__RPScreenRecorder_stopClipBufferingWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D15D8C8;
  v7[4] = self;
  v8 = v4;
  objc_msgSend(v5, "stopClipBufferingWithCompletionHandler:", v7);

LABEL_10:
}

void __59__RPScreenRecorder_stopClipBufferingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPScreenRecorder stopClipBufferingWithCompletionHandler:]_block_invoke";
    v7 = 1024;
    v8 = 1099;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stopped", (uint8_t *)&v5, 0x12u);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateStateWithActive:error:", 0, v3);
  v4 = *(_QWORD *)(a1 + 40);
  if (v4)
    (*(void (**)(uint64_t, id))(v4 + 16))(v4, v3);

}

- (void)exportClipToURL:(NSURL *)url duration:(NSTimeInterval)duration completionHandler:(void *)completionHandler
{
  NSURL *v8;
  void (**v9)(void *, void *);
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v8 = url;
  v9 = completionHandler;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136446466;
    v12 = "-[RPScreenRecorder exportClipToURL:duration:completionHandler:]";
    v13 = 1024;
    v14 = 1116;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v11, 0x12u);
  }
  if (self->_recording)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "exportClipToURL:duration:completionHandler:", v8, v9, duration);
LABEL_10:

    goto LABEL_11;
  }
  if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[RPScreenRecorder exportClipToURL:duration:completionHandler:].cold.1();
    if (!v9)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (v9)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5832, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)resumeInAppClip
{
  _BOOL4 recording;
  _BOOL4 paused;
  void *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  _BOOL4 v13;
  __int16 v14;
  _BOOL4 v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    recording = self->_recording;
    paused = self->_paused;
    *(_DWORD *)buf = 136446978;
    v9 = "-[RPScreenRecorder resumeInAppClip]";
    v10 = 1024;
    v11 = 1129;
    v12 = 1024;
    v13 = recording;
    v14 = 1024;
    v15 = paused;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording %d paused %d", buf, 0x1Eu);
  }
  if (self->_recording && self->_paused)
  {
    +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPScreenRecorder currentWindowLayerContextID](self, "currentWindowLayerContextID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __35__RPScreenRecorder_resumeInAppClip__block_invoke;
    v7[3] = &unk_24D15D8F0;
    v7[4] = self;
    objc_msgSend(v5, "resumeInAppClipWithWindowLayerContextID:completionHandler:", v6, v7);

  }
}

void __35__RPScreenRecorder_resumeInAppClip__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7;
  _BYTE *v8;
  _BOOL8 v9;
  _BYTE *v10;
  _BOOL8 v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  if (v7)
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v12 = 136446722;
      v13 = "-[RPScreenRecorder resumeInAppClip]_block_invoke";
      v14 = 1024;
      v15 = 1135;
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d can not resume with error %@", (uint8_t *)&v12, 0x1Cu);
    }
    objc_msgSend(*(id *)(a1 + 32), "recordingDidStopWithError:movieURL:", v7, 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForCamera:", a3);
  objc_msgSend(*(id *)(a1 + 32), "setHasUserConsentForMicrophone:", a4);
  v8 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a3)
    v9 = v8[11] != 0;
  else
    v9 = 0;
  objc_msgSend(v8, "setCameraEnabled:", v9);
  v10 = *(_BYTE **)(a1 + 32);
  if ((_DWORD)a4)
    v11 = v10[10] != 0;
  else
    v11 = 0;
  objc_msgSend(v10, "setMicrophoneEnabled:", v11);

}

- (void)saveVideoToCameraRoll:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPScreenRecorder saveVideoToCameraRoll:handler:]";
    v13 = 1024;
    v14 = 1152;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __50__RPScreenRecorder_saveVideoToCameraRoll_handler___block_invoke;
  v9[3] = &unk_24D15D9B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "saveVideoToCameraRoll:handler:", v5, v9);

}

uint64_t __50__RPScreenRecorder_saveVideoToCameraRoll_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveClipToCameraRoll:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPScreenRecorder saveClipToCameraRoll:handler:]";
    v13 = 1024;
    v14 = 1162;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __49__RPScreenRecorder_saveClipToCameraRoll_handler___block_invoke;
  v9[3] = &unk_24D15D9B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "saveClipToCameraRoll:handler:", v5, v9);

}

uint64_t __49__RPScreenRecorder_saveClipToCameraRoll_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)saveVideo:(id)a3 handler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v12 = "-[RPScreenRecorder saveVideo:handler:]";
    v13 = 1024;
    v14 = 1171;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __38__RPScreenRecorder_saveVideo_handler___block_invoke;
  v9[3] = &unk_24D15D9B8;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "saveVideo:handler:", v5, v9);

}

uint64_t __38__RPScreenRecorder_saveVideo_handler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePipView
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__RPScreenRecorder_removePipView__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __33__RPScreenRecorder_removePipView__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446466;
    v7 = "-[RPScreenRecorder removePipView]_block_invoke";
    v8 = 1024;
    v9 = 1183;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d remove camera pip from view", (uint8_t *)&v6, 0x12u);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeFromSuperview");
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 72);
  *(_QWORD *)(v4 + 72) = 0;

}

- (void)setCameraEnabled:(BOOL)cameraEnabled
{
  _BOOL4 v3;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  _BOOL4 v10;
  uint64_t v11;

  v3 = cameraEnabled;
  v11 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446722;
    v6 = "-[RPScreenRecorder setCameraEnabled:]";
    v7 = 1024;
    v8 = 1197;
    v9 = 1024;
    v10 = v3;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera enabled %d", (uint8_t *)&v5, 0x18u);
  }
  if (self->_cameraEnabled != v3)
  {
    if (-[RPScreenRecorder isRecording](self, "isRecording"))
    {
      if (v3)
      {
        if (self->_hasUserConsentForCamera)
        {
          if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            v5 = 136446466;
            v6 = "-[RPScreenRecorder setCameraEnabled:]";
            v7 = 1024;
            v8 = 1205;
            _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d start camera pip", (uint8_t *)&v5, 0x12u);
          }
          -[RPPipViewController startPipSession](self->_pipViewController, "startPipSession");
        }
        else if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v5 = 136446466;
          v6 = "-[RPScreenRecorder setCameraEnabled:]";
          v7 = 1024;
          v8 = 1203;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d Camera must be enabled first prior to startRecording", (uint8_t *)&v5, 0x12u);
        }
      }
      else
      {
        if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v5 = 136446466;
          v6 = "-[RPScreenRecorder setCameraEnabled:]";
          v7 = 1024;
          v8 = 1209;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d stop camera pip", (uint8_t *)&v5, 0x12u);
        }
        -[RPPipViewController stopPipSession](self->_pipViewController, "stopPipSession");
        -[RPScreenRecorder removePipView](self, "removePipView");
      }
    }
    self->_cameraEnabled = v3;
  }
}

- (void)setCameraPosition:(RPCameraPosition)cameraPosition
{
  RPPipViewController *pipViewController;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136446722;
    v10 = "-[RPScreenRecorder setCameraPosition:]";
    v11 = 1024;
    v12 = 1226;
    v13 = 1024;
    v14 = cameraPosition;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d camera position %d", (uint8_t *)&v9, 0x18u);
  }
  if (self->_cameraPosition != cameraPosition)
  {
    pipViewController = self->_pipViewController;
    if (!pipViewController)
    {
LABEL_13:
      self->_cameraPosition = cameraPosition;
      return;
    }
    if (cameraPosition == RPCameraPositionFront)
    {
      v6 = 2;
    }
    else
    {
      if (cameraPosition != RPCameraPositionBack)
        goto LABEL_11;
      v6 = 1;
    }
    -[RPPipViewController setCameraPosition:](pipViewController, "setCameraPosition:", v6);
LABEL_11:
    if (-[RPScreenRecorder isRecording](self, "isRecording"))
    {
      +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPScreenRecorder pipViewController](self, "pipViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reportCameraUsage:", objc_msgSend(v8, "cameraPosition"));

    }
    goto LABEL_13;
  }
}

- (void)instantiatePipView
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  RPPipViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "orientation");

  if (-[RPScreenRecorder isCameraEnabled](self, "isCameraEnabled"))
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136446722;
      v12 = "-[RPScreenRecorder instantiatePipView]";
      v13 = 1024;
      v14 = 1256;
      v15 = 1024;
      v16 = -[RPScreenRecorder cameraPosition](self, "cameraPosition");
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d create pip for camera position %d", (uint8_t *)&v11, 0x18u);
    }
    if (-[RPScreenRecorder cameraPosition](self, "cameraPosition") == RPCameraPositionFront)
    {
      v5 = 2;
    }
    else
    {
      if (-[RPScreenRecorder cameraPosition](self, "cameraPosition") != RPCameraPositionBack)
      {
LABEL_10:
        +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPScreenRecorder pipViewController](self, "pipViewController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "reportCameraUsage:", objc_msgSend(v8, "cameraPosition"));

        -[RPScreenRecorder pipViewController](self, "pipViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "view");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPScreenRecorder setCameraPreviewView:](self, "setCameraPreviewView:", v10);

        return;
      }
      v5 = 1;
    }
    v6 = -[RPPipViewController initWithOrientation:position:]([RPPipViewController alloc], "initWithOrientation:position:", v4, v5);
    -[RPScreenRecorder setPipViewController:](self, "setPipViewController:", v6);

    goto LABEL_10;
  }
}

- (void)isScreenRecordingAvailable
{
  NSObject *v3;
  _QWORD block[5];

  -[RPScreenRecorder processQueue](self, "processQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__RPScreenRecorder_isScreenRecordingAvailable__block_invoke;
  block[3] = &unk_24D15D648;
  block[4] = self;
  dispatch_async(v3, block);

}

void __46__RPScreenRecorder_isScreenRecordingAvailable__block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  uint64_t v8;
  id WeakRetained;
  char v10;
  int v11;
  id v12;
  int v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "screenRecordingAllowed");
  v3 = objc_msgSend(*(id *)(a1 + 32), "screenRecordingSupportedOnDevice");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(unsigned __int8 *)(v4 + 8);
  *(_BYTE *)(v4 + 8) = v2 & v3;
  if (__RPLogLevel <= 1)
  {
    v6 = v3;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v7 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
      v14 = 136447490;
      v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
      v16 = 1024;
      v17 = 1301;
      v18 = 1024;
      v19 = v7;
      v20 = 1024;
      v21 = 1;
      v22 = 1024;
      v23 = v2;
      v24 = 1024;
      v25 = v6;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recording available %i with display available %i, allowed %i, and supported on device %i", (uint8_t *)&v14, 0x2Au);
    }
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v5 != *(unsigned __int8 *)(v8 + 8))
  {
    WeakRetained = objc_loadWeakRetained((id *)(v8 + 24));
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v11 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
        v14 = 136446722;
        v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
        v16 = 1024;
        v17 = 1305;
        v18 = 1024;
        v19 = v11;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v14, 0x18u);
      }
      v12 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
      objc_msgSend(v12, "screenRecorderDidChangeAvailability:", *(_QWORD *)(a1 + 32));

    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        v13 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 8);
        v14 = 136446722;
        v15 = "-[RPScreenRecorder isScreenRecordingAvailable]_block_invoke";
        v16 = 1024;
        v17 = 1309;
        v18 = 1024;
        v19 = v13;
        _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d notify client available %d", (uint8_t *)&v14, 0x18u);
      }
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "screenRecorderDidChangeAvailability:");
    }
  }
}

- (void)registerAppForStateChangeSetRotationLock:(BOOL)a3
{
  -[RPScreenRecorder setWindowRotationLocked:](self, "setWindowRotationLocked:", 1);
}

- (void)updateStateWithActive:(BOOL)a3 error:(id)a4
{
  _BOOL4 v4;
  id v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  _BOOL4 v12;
  __int16 v13;
  _BOOL4 v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136446978;
    v8 = "-[RPScreenRecorder updateStateWithActive:error:]";
    v9 = 1024;
    v10 = 1328;
    v11 = 1024;
    v12 = v4;
    v13 = 1024;
    v14 = v6 != 0;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d update state with isActive %d error %d", (uint8_t *)&v7, 0x1Eu);
  }
  if (v6 || !v4)
  {
    -[RPScreenRecorder setRecording:](self, "setRecording:", 0);
    -[RPScreenRecorder removePipView](self, "removePipView");
    -[RPScreenRecorder updateProcessIDForAudioCapture:](self, "updateProcessIDForAudioCapture:", 0);
    -[RPScreenRecorder setWindowRotationLocked:](self, "setWindowRotationLocked:", 0);
  }
  else
  {
    -[RPScreenRecorder setRecording:](self, "setRecording:", 1);
  }

}

- (id)handleUnavailableState
{
  void *v3;

  if (-[RPScreenRecorder screenRecordingAllowed](self, "screenRecordingAllowed"))
  {
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5803, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder handleUnavailableState].cold.1();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5802, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[RPScreenRecorder handleUnavailableState].cold.2();
  }
  -[RPScreenRecorder isScreenRecordingAvailable](self, "isScreenRecordingAvailable");
  return v3;
}

- (id)applicationWindow
{
  UIWindow *windowToRecord;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  windowToRecord = self->_windowToRecord;
  if (windowToRecord)
    return windowToRecord;
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v5, "window"), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136446466;
      v10 = "-[RPScreenRecorder applicationWindow]";
      v11 = 1024;
      v12 = 1421;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d appWindow: app doesn't have the window property set on UIApplicationDelegate. Using first window.", (uint8_t *)&v9, 0x12u);
    }
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "windows");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (CGSize)currentWindowSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  float v16;
  double v17;
  double v18;
  double v19;
  int v20;
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;
  CGSize result;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  v10 = v9;

  if (!self->_systemRecording)
  {
    -[RPScreenRecorder applicationWindow](self, "applicationWindow");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v5 = v12;
    v7 = v13;

  }
  v14 = v5;
  v15 = v10 * ceilf(v14);
  v16 = v7;
  v17 = v10 * ceilf(v16);
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136446978;
    v21 = "-[RPScreenRecorder currentWindowSize]";
    v22 = 1024;
    v23 = 1439;
    v24 = 2048;
    v25 = v15;
    v26 = 2048;
    v27 = v17;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d scaled window size width %.1f x height:%.1f", (uint8_t *)&v20, 0x26u);
  }
  v18 = v15;
  v19 = v17;
  result.height = v19;
  result.width = v18;
  return result;
}

- (id)currentWindowLayerContextID
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  -[RPScreenRecorder windowToRecord](self, "windowToRecord");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[UIWindow layer](self->_windowToRecord, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "context");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "contextId");
  }
  else
  {
    if (self->_systemRecording)
    {
      v6 = 0xFFFFFFFFLL;
      goto LABEL_6;
    }
    -[RPScreenRecorder applicationWindow](self, "applicationWindow");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v10, "contextId");

  }
LABEL_6:
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)setWindowRotationLocked:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__RPScreenRecorder_setWindowRotationLocked___block_invoke;
  v3[3] = &unk_24D15D9E0;
  v4 = a3;
  v3[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

void __44__RPScreenRecorder_setWindowRotationLocked___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v2 = *(unsigned __int8 *)(a1 + 40);
    v4 = 136446722;
    v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
    v6 = 1024;
    v7 = 1502;
    v8 = 1024;
    v9 = v2;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d setWindowRotationLocked: %i", (uint8_t *)&v4, 0x18u);
  }
  if (*(_BYTE *)(a1 + 40))
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446466;
      v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
      v6 = 1024;
      v7 = 1511;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d disabling autorotation", (uint8_t *)&v4, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "applicationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "beginDisablingInterfaceAutorotation");
  }
  else
  {
    if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v4 = 136446466;
      v5 = "-[RPScreenRecorder setWindowRotationLocked:]_block_invoke";
      v6 = 1024;
      v7 = 1522;
      _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d enabling autorotation", (uint8_t *)&v4, 0x12u);
    }
    objc_msgSend(*(id *)(a1 + 32), "applicationWindow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endDisablingInterfaceAutorotation");
  }

}

- (id)audioQueue
{
  if (audioQueue_onceToken != -1)
    dispatch_once(&audioQueue_onceToken, &__block_literal_global_43);
  return (id)audioQueue_sAudioQueue;
}

void __30__RPScreenRecorder_audioQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.replaykit.capture.AudioSampleQueue", v2);
  v1 = (void *)audioQueue_sAudioQueue;
  audioQueue_sAudioQueue = (uint64_t)v0;

}

- (id)videoQueue
{
  if (videoQueue_onceToken != -1)
    dispatch_once(&videoQueue_onceToken, &__block_literal_global_45);
  return (id)videoQueue_sVideoQueue;
}

void __30__RPScreenRecorder_videoQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.replaykit.capture.VideoSampleQueue", v2);
  v1 = (void *)videoQueue_sVideoQueue;
  videoQueue_sVideoQueue = (uint64_t)v0;

}

- (id)processQueue
{
  if (processQueue_onceToken != -1)
    dispatch_once(&processQueue_onceToken, &__block_literal_global_47);
  return (id)processQueue_sProcessQueue;
}

void __32__RPScreenRecorder_processQueue__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.replaykit.capture.ProcessQueue", v2);
  v1 = (void *)processQueue_sProcessQueue;
  processQueue_sProcessQueue = (uint64_t)v0;

}

- (void)recordingLockInterrupted:(id)a3
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "-[RPScreenRecorder recordingLockInterrupted:]";
    v6 = 1024;
    v7 = 1563;
    v8 = 1024;
    v9 = objc_msgSend(v3, "code");
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d recordingLockInterrupted error[%d]", (uint8_t *)&v4, 0x18u);
  }

}

- (void)recordingTimerDidUpdate:(id)a3
{
  id v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136446722;
    v7 = "-[RPScreenRecorder recordingTimerDidUpdate:]";
    v8 = 1024;
    v9 = 1568;
    v10 = 2112;
    v11 = v4;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d time[%@]", (uint8_t *)&v6, 0x1Cu);
  }
  -[RPScreenRecorder privateDelegate](self, "privateDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recordingTimerDidUpdate:", v4);

}

- (void)recordingDidPause
{
  if (self->_recording)
    -[RPScreenRecorder setPaused:](self, "setPaused:", 1);
}

- (void)shouldResumeSessionType:(id)a3
{
  id v4;
  _BOOL4 systemRecording;
  _BOOL4 recording;
  _BOOL4 paused;
  dispatch_time_t v8;
  NSObject *v9;
  _QWORD *v10;
  _QWORD v11[5];
  _QWORD v12[5];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  _BOOL4 v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    systemRecording = self->_systemRecording;
    recording = self->_recording;
    paused = self->_paused;
    *(_DWORD *)buf = 136447234;
    v14 = "-[RPScreenRecorder shouldResumeSessionType:]";
    v15 = 1024;
    v16 = 1581;
    v17 = 1024;
    v18 = systemRecording;
    v19 = 1024;
    v20 = recording;
    v21 = 1024;
    v22 = paused;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d system recording %d isRecording %d paused %d", buf, 0x24u);
  }
  if (self->_recording && self->_paused)
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("RPInAppRecording")))
    {
      -[RPScreenRecorder resumeInAppRecording](self, "resumeInAppRecording");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("RPInAppCapture")))
    {
      -[RPScreenRecorder resumeInAppCapture](self, "resumeInAppCapture");
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("RPInAppBroadcast")))
    {
      -[RPScreenRecorder resumeInAppBroadcast](self, "resumeInAppBroadcast");
    }
    else
    {
      if (!objc_msgSend(v4, "isEqualToString:", CFSTR("RPInAppClip")))
      {
        if (objc_msgSend(v4, "isEqualToString:", CFSTR("RPSystemRecording")))
        {
          v8 = dispatch_time(0, 200000000);
          -[RPScreenRecorder processQueue](self, "processQueue");
          v9 = objc_claimAutoreleasedReturnValue();
          v12[0] = MEMORY[0x24BDAC760];
          v12[1] = 3221225472;
          v12[2] = __44__RPScreenRecorder_shouldResumeSessionType___block_invoke;
          v12[3] = &unk_24D15D648;
          v12[4] = self;
          v10 = v12;
        }
        else
        {
          if (!objc_msgSend(v4, "isEqualToString:", CFSTR("RPSystemBroadcast")))
            goto LABEL_19;
          v8 = dispatch_time(0, 200000000);
          -[RPScreenRecorder processQueue](self, "processQueue");
          v9 = objc_claimAutoreleasedReturnValue();
          v11[0] = MEMORY[0x24BDAC760];
          v11[1] = 3221225472;
          v11[2] = __44__RPScreenRecorder_shouldResumeSessionType___block_invoke_2;
          v11[3] = &unk_24D15D648;
          v11[4] = self;
          v10 = v11;
        }
        dispatch_after(v8, v9, v10);

        goto LABEL_19;
      }
      -[RPScreenRecorder resumeInAppClip](self, "resumeInAppClip");
    }
  }
LABEL_19:

}

uint64_t __44__RPScreenRecorder_shouldResumeSessionType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeSystemRecording");
}

uint64_t __44__RPScreenRecorder_shouldResumeSessionType___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "resumeSystemBroadcast");
}

- (void)updateScreenRecordingStateWithCurrentState:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPScreenRecorder updateScreenRecordingStateWithCurrentState:]";
    v7 = 1024;
    v8 = 1609;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d updateScreenRecordingStateWithCurrentState", (uint8_t *)&v5, 0x12u);
  }
  -[RPScreenRecorder notifyDelegateOfUpdatedState](self, "notifyDelegateOfUpdatedState");

}

- (void)recordingDidStopWithError:(id)a3 movieURL:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke;
  block[3] = &unk_24D15D940;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke(uint64_t a1)
{
  _BYTE *v2;
  void *v3;
  char v4;
  id *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v13 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
    v14 = 1024;
    v15 = 1615;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v2 = *(_BYTE **)(a1 + 32);
  if (!v2[15])
  {
    objc_msgSend(v2, "setWindowRotationLocked:", 0);
    v2 = *(_BYTE **)(a1 + 32);
  }
  objc_msgSend(v2, "updateStateWithActive:error:", 0, *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = *(id **)(a1 + 32);
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v5[12], "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "broadcastController:didFinishWithError:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(_QWORD *)(a1 + 40));

  }
  else if (objc_msgSend(v5, "shouldNotifyDidStop"))
  {
    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
    {
      if (__RPLogLevel <= 1)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          v8 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 136446722;
          v13 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
          v14 = 1024;
          v15 = 1639;
          v16 = 2112;
          v17 = v8;
          _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d movieURL: %@", buf, 0x1Cu);
        }
        v7 = *(_QWORD *)(a1 + 48);
      }
      v10[0] = MEMORY[0x24BDAC760];
      v10[1] = 3221225472;
      v10[2] = __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke_63;
      v10[3] = &unk_24D15DA68;
      v9 = *(void **)(a1 + 40);
      v10[4] = *(_QWORD *)(a1 + 32);
      v11 = v9;
      +[RPPreviewViewController loadPreviewViewControllerWithMovieURL:completion:](RPPreviewViewController, "loadPreviewViewControllerWithMovieURL:completion:", v7, v10);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "didStopRecordingWithError:previewViewController:", *(_QWORD *)(a1 + 40), 0);
    }
  }
}

void __55__RPScreenRecorder_recordingDidStopWithError_movieURL___block_invoke_63(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136446722;
    v5 = "-[RPScreenRecorder recordingDidStopWithError:movieURL:]_block_invoke";
    v6 = 1024;
    v7 = 1645;
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d previewViewController %@", (uint8_t *)&v4, 0x1Cu);
  }
  objc_msgSend(v3, "setPreviewControllerDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "didStopRecordingWithError:previewViewController:", *(_QWORD *)(a1 + 40), v3);

}

- (BOOL)isConnectionInterruptedOrInvalid:(id)a3
{
  id v3;
  BOOL v4;

  v3 = a3;
  v4 = objc_msgSend(v3, "code") == -5815 || objc_msgSend(v3, "code") == -5814;

  return v4;
}

- (BOOL)shouldNotifyDidStop
{
  RPScreenRecorderDelegate **p_delegate;
  id WeakRetained;
  char v4;
  id v5;
  char v6;

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_loadWeakRetained((id *)p_delegate);
    v4 = objc_opt_respondsToSelector();

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 1;
  else
    v6 = objc_opt_respondsToSelector();
  return (v4 | v6) & 1;
}

- (void)didStopRecordingWithError:(id)a3 previewViewController:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  char v16;
  id v17;

  v17 = a3;
  v6 = a4;
  -[RPScreenRecorder delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  -[RPScreenRecorder delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if ((v8 & 1) != 0)
  {
    objc_msgSend(v9, "screenRecorder:didStopRecordingWithPreviewViewController:error:", self, v6, v17);
  }
  else
  {
    v11 = objc_opt_respondsToSelector();

    if ((v11 & 1) == 0)
      goto LABEL_6;
    -[RPScreenRecorder delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "screenRecorder:didStopRecordingWithError:previewViewController:", self, v17, v6);
  }

LABEL_6:
  -[RPScreenRecorder secondDelegate](self, "secondDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_opt_respondsToSelector();

  -[RPScreenRecorder secondDelegate](self, "secondDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v13 & 1) != 0)
  {
    objc_msgSend(v14, "screenRecorder:didStopRecordingWithPreviewViewController:error:", self, v6, v17);
LABEL_10:

    goto LABEL_11;
  }
  v16 = objc_opt_respondsToSelector();

  if ((v16 & 1) != 0)
  {
    -[RPScreenRecorder secondDelegate](self, "secondDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "screenRecorder:didStopRecordingWithError:previewViewController:", self, v17, v6);
    goto LABEL_10;
  }
LABEL_11:

}

- (void)notifyDelegateOfUpdatedState
{
  -[RPScreenRecorderPrivateDelegate screenRecorderDidUpdateState:](self->_privateDelegate, "screenRecorderDidUpdateState:", self);
}

- (void)updateRecordingAvailability:(id)a3
{
  id v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (__RPLogLevel <= 1 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136446466;
    v6 = "-[RPScreenRecorder updateRecordingAvailability:]";
    v7 = 1024;
    v8 = 1707;
    _os_log_impl(&dword_214135000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", (uint8_t *)&v5, 0x12u);
  }
  -[RPScreenRecorder isScreenRecordingAvailable](self, "isScreenRecordingAvailable");

}

- (void)updateProcessIDForAudioCapture:(int)a3
{
  uint64_t v3;
  void *v5;

  if (self->_processIDForAudioCapture != a3)
  {
    v3 = *(_QWORD *)&a3;
    if (-[RPScreenRecorder isRecording](self, "isRecording"))
    {
      +[RPDaemonProxy daemonProxy](RPDaemonProxy, "daemonProxy");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "updateProcessIDForAudioCaptureWithPID:", v3);

    }
    self->_processIDForAudioCapture = v3;
  }
}

- (BOOL)checkContextID:(id)a3 withHandler:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  void *v7;

  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (!v5)
  {
    if (__RPLogLevel <= 2 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      -[RPScreenRecorder checkContextID:withHandler:].cold.1();
      if (!v6)
        goto LABEL_6;
      goto LABEL_5;
    }
    if (v6)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BDD1540], "_rpUserErrorForCode:userInfo:", -5803, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6[2](v6, v7);

    }
  }
LABEL_6:

  return v5 != 0;
}

- (BOOL)screenRecordingSupportedOnDevice
{
  return 1;
}

- (BOOL)screenRecordingAllowed
{
  void *v2;
  BOOL v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63A98]) != 2;

  return v3;
}

- (id)delegate
{
  return objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (BOOL)isRecording
{
  return self->_recording;
}

- (void)setRecording:(BOOL)a3
{
  self->_recording = a3;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isCameraEnabled
{
  return self->_cameraEnabled;
}

- (RPCameraPosition)cameraPosition
{
  return self->_cameraPosition;
}

- (UIView)cameraPreviewView
{
  return self->_cameraPreviewView;
}

- (void)setCameraPreviewView:(id)a3
{
  objc_storeStrong((id *)&self->_cameraPreviewView, a3);
}

- (unint64_t)previousAudioSessionOptions
{
  return self->_previousAudioSessionOptions;
}

- (void)setPreviousAudioSessionOptions:(unint64_t)a3
{
  self->_previousAudioSessionOptions = a3;
}

- (NSString)previousAudioCategory
{
  return self->_previousAudioCategory;
}

- (void)setPreviousAudioCategory:(id)a3
{
  objc_storeStrong((id *)&self->_previousAudioCategory, a3);
}

- (UIWindow)windowToRecord
{
  return self->_windowToRecord;
}

- (void)setWindowToRecord:(id)a3
{
  objc_storeStrong((id *)&self->_windowToRecord, a3);
}

- (RPPipViewController)pipViewController
{
  return self->_pipViewController;
}

- (void)setPipViewController:(id)a3
{
  objc_storeStrong((id *)&self->_pipViewController, a3);
}

- (id)saveVideoToCameraRollCompletionBlock
{
  return self->_saveVideoToCameraRollCompletionBlock;
}

- (void)setSaveVideoToCameraRollCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)hasUserConsentForCamera
{
  return self->_hasUserConsentForCamera;
}

- (void)setHasUserConsentForCamera:(BOOL)a3
{
  self->_hasUserConsentForCamera = a3;
}

- (BOOL)hasUserConsentForMicrophone
{
  return self->_hasUserConsentForMicrophone;
}

- (void)setHasUserConsentForMicrophone:(BOOL)a3
{
  self->_hasUserConsentForMicrophone = a3;
}

- (id)captureHandler
{
  return self->_captureHandler;
}

- (void)setCaptureHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (RPBroadcastController)activeBroadcastController
{
  return self->_activeBroadcastController;
}

- (void)setActiveBroadcastController:(id)a3
{
  objc_storeStrong((id *)&self->_activeBroadcastController, a3);
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (void)setPaused:(BOOL)a3
{
  self->_paused = a3;
}

- (int)processIDForAudioCapture
{
  return self->_processIDForAudioCapture;
}

- (BOOL)systemRecording
{
  return self->_systemRecording;
}

- (void)setSystemRecording:(BOOL)a3
{
  self->_systemRecording = a3;
}

- (NSURL)broadcastURL
{
  return self->_broadcastURL;
}

- (RPScreenRecorderPrivateDelegate)privateDelegate
{
  return self->_privateDelegate;
}

- (void)setPrivateDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_privateDelegate, a3);
}

- (RPScreenRecorderScreenCapureKitDelegate)screenCaptureKitDelegate
{
  return self->_screenCaptureKitDelegate;
}

- (void)setScreenCaptureKitDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_screenCaptureKitDelegate, a3);
}

- (RPScreenCaptureKitControlCenterManagerDelegate)screenCaptureKitControlCenterManagerDelegate
{
  return self->_screenCaptureKitControlCenterManagerDelegate;
}

- (void)setScreenCaptureKitControlCenterManagerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_screenCaptureKitControlCenterManagerDelegate, a3);
}

- (RPScreenCaptureKitContentSharingPickerDelegate)screenCaptureKitContentSharingPickerDelegate
{
  return self->_screenCaptureKitContentSharingPickerDelegate;
}

- (void)setScreenCaptureKitContentSharingPickerDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_screenCaptureKitContentSharingPickerDelegate, a3);
}

- (RPScreenRecorderScreenCapureKitPreviewDelegate)screenCaptureKitPreviewDelegate
{
  return self->_screenCaptureKitPreviewDelegate;
}

- (void)setScreenCaptureKitPreviewDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_screenCaptureKitPreviewDelegate, a3);
}

- (RPScreenRecorderScreenCapureKitRecordingOutputDelegate)screenCaptureKitRecordingOutputDelegate
{
  return self->_screenCaptureKitRecordingOutputDelegate;
}

- (void)setScreenCaptureKitRecordingOutputDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_screenCaptureKitRecordingOutputDelegate, a3);
}

- (RPScreenRecorderDelegate)secondDelegate
{
  return self->_secondDelegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitRecordingOutputDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitPreviewDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitContentSharingPickerDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitControlCenterManagerDelegate, 0);
  objc_storeStrong((id *)&self->_screenCaptureKitDelegate, 0);
  objc_storeStrong((id *)&self->_privateDelegate, 0);
  objc_storeStrong((id *)&self->_broadcastURL, 0);
  objc_storeStrong((id *)&self->_activeBroadcastController, 0);
  objc_storeStrong(&self->_captureHandler, 0);
  objc_storeStrong(&self->_saveVideoToCameraRollCompletionBlock, 0);
  objc_storeStrong((id *)&self->_pipViewController, 0);
  objc_storeStrong((id *)&self->_windowToRecord, 0);
  objc_storeStrong((id *)&self->_previousAudioCategory, 0);
  objc_storeStrong((id *)&self->_cameraPreviewView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startRecordingWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __46__RPScreenRecorder_startRecordingWithHandler___block_invoke_9_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopRecordingWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app recording because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __45__RPScreenRecorder_stopRecordingWithHandler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d stop recording error: %i", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)stopRecordingWithOutputURL:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app recording because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startCaptureWithHandler:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __62__RPScreenRecorder_startCaptureWithHandler_completionHandler___block_invoke_19_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopCaptureWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app capture because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startInAppBroadcastWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startInAppBroadcastWithHandler:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __51__RPScreenRecorder_startInAppBroadcastWithHandler___block_invoke_21_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopInAppBroadcastWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app broadcast because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __50__RPScreenRecorder_stopInAppBroadcastWithHandler___block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app broadacast due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d No active broadcast controller", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d delegate does not exist", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)clientDidUpdateBroadcastServiceInfo:.cold.3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d delegate DOES NOT responds to protocol", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startSystemRecordingWithMicrophoneEnabled:handler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_27_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __70__RPScreenRecorder_startSystemRecordingWithMicrophoneEnabled_handler___block_invoke_28_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopSystemRecording:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop system recording because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopSystemRecordingWithURLHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop system recording because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __41__RPScreenRecorder_resumeSystemRecording__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to resume system recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __62__RPScreenRecorder_setupSystemBroadcastWithExtension_handler___block_invoke_cold_1(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend(a1, "code");
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_3(&dword_214135000, MEMORY[0x24BDACB70], v1, " [ERROR] %{public}s:%d Error setting up broadcast, error code: %i", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)startSystemBroadcastWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_34_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __52__RPScreenRecorder_startSystemBroadcastWithHandler___block_invoke_35_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopSystemBroadcastWithHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop system broadcast because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __41__RPScreenRecorder_resumeSystemBroadcast__block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d Failed to resume system broadcast", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)startClipBufferingWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because we're already active with another session", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_2_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_4_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start due to error: %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_9();
}

void __60__RPScreenRecorder_startClipBufferingWithCompletionHandler___block_invoke_37_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d undefined completion handler", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopClipBufferingWithCompletionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to stop in app clip recording because we're not recording", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)exportClipToURL:duration:completionHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to export app clip because clip buferring has not started", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)handleUnavailableState
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d failed to start because screen is not allowed", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)checkContextID:withHandler:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_1_0(&dword_214135000, MEMORY[0x24BDACB70], v0, " [ERROR] %{public}s:%d contextID is nil", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

@end
