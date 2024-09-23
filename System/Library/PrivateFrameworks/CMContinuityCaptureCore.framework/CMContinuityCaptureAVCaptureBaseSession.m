@implementation CMContinuityCaptureAVCaptureBaseSession

- (CMContinuityCaptureAVCaptureBaseSession)initWithCaptureSession:(id)a3 queue:(id)a4
{
  id v7;
  id v8;
  CMContinuityCaptureAVCaptureBaseSession *v9;
  CMContinuityCaptureAVCaptureBaseSession *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  CMContinuityCaptureAVCaptureBaseSession *v15;
  objc_super v17;

  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CMContinuityCaptureAVCaptureBaseSession;
  v9 = -[CMContinuityCaptureAVCaptureBaseSession init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_captureSession, a3);
    objc_storeStrong((id *)&v10->_queue, a4);
    v10->_state = 0;
    v10->_transport = 0;
    v10->_clientDeviceModel = 0;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v10, sel_handleCaptureSessionNotification_, *MEMORY[0x24BDB1B58], v10->_captureSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v10, sel_handleCaptureSessionNotification_, *MEMORY[0x24BDB1AC8], v10->_captureSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v10, sel_handleCaptureSessionNotification_, *MEMORY[0x24BDB1AD0], v10->_captureSession);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v10, sel_handleCaptureSessionNotification_, *MEMORY[0x24BDB1B68], v10->_captureSession);

    v15 = v10;
  }

  return v10;
}

- (void)dealloc
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 138412546;
  v5 = a1;
  v6 = 1024;
  v7 = v3;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%@ ContinuityCapture error : invalid avcapture session state %d", (uint8_t *)&v4, 0x12u);
}

- (void)handleCaptureSessionNotification:(id)a3
{
  id v4;
  NSObject *v5;
  AVCaptureSession *captureSession;
  void *v7;
  int v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  _BYTE buf[12];
  __int16 v13;
  AVCaptureSession *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    captureSession = self->_captureSession;
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = self;
    v13 = 2112;
    v14 = captureSession;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ avcapture session %@ notification %@", buf, 0x20u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDB1B58]);

  if (v8)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __76__CMContinuityCaptureAVCaptureBaseSession_handleCaptureSessionNotification___block_invoke;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v11, (id *)buf);
    dispatch_async(queue, block);
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak((id *)buf);

}

void __76__CMContinuityCaptureAVCaptureBaseSession_handleCaptureSessionNotification___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "willChangeValueForKey:", CFSTR("state"));
    v2[3] = 3;
    objc_msgSend(v2, "didChangeValueForKey:", CFSTR("state"));
    WeakRetained = v2;
  }

}

- (OpaqueCMClock)synchronizationClock
{
  return -[AVCaptureSession synchronizationClock](self->_captureSession, "synchronizationClock");
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)transport
{
  return self->_transport;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (void)setTransport:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__CMContinuityCaptureAVCaptureBaseSession_setTransport___block_invoke;
  block[3] = &unk_24F06C780;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __56__CMContinuityCaptureAVCaptureBaseSession_setTransport___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = *(_QWORD *)(a1 + 40);
    *((_QWORD *)WeakRetained + 4) = v3;
    v4 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 1), "setContinuityCameraIsWired:", v3 == 2);
    WeakRetained = v4;
  }

}

- (int64_t)clientDeviceModel
{
  return self->_clientDeviceModel;
}

- (void)setClientDeviceModel:(int64_t)a3
{
  NSObject *queue;
  _QWORD block[4];
  id v7[2];
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __64__CMContinuityCaptureAVCaptureBaseSession_setClientDeviceModel___block_invoke;
  block[3] = &unk_24F06C780;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

void __64__CMContinuityCaptureAVCaptureBaseSession_setClientDeviceModel___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    *((_QWORD *)WeakRetained + 5) = *(_QWORD *)(a1 + 40);
    v3 = WeakRetained;
    objc_msgSend(*((id *)WeakRetained + 1), "setContinuityCameraClientDeviceClass:", CMContinuityCaptureDeviceClassFromDeviceModel(*(_QWORD *)(a1 + 40)));
    WeakRetained = v3;
  }

}

- (void)willConfigure
{
  NSObject *v3;
  int64_t state;
  const char *v5;
  int64_t v6;
  int v7;
  CMContinuityCaptureAVCaptureBaseSession *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 1)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v7 = 138412546;
      v8 = self;
      v9 = 1024;
      v10 = state;
      v5 = "%@ skip will configure, state %d";
LABEL_6:
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, v5, (uint8_t *)&v7, 0x12u);
    }
  }
  else
  {
    -[AVCaptureSession beginConfiguration](self->_captureSession, "beginConfiguration");
    -[CMContinuityCaptureAVCaptureBaseSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    self->_state = 1;
    -[CMContinuityCaptureAVCaptureBaseSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v6 = self->_state;
      v7 = 138412546;
      v8 = self;
      v9 = 1024;
      v10 = v6;
      v5 = "%@ done will configure, state %d";
      goto LABEL_6;
    }
  }

}

- (void)didConfigure
{
  int64_t v3;
  NSObject *v4;
  int64_t v5;
  const char *v6;
  _BOOL4 v7;
  int64_t state;
  int v9;
  CMContinuityCaptureAVCaptureBaseSession *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_state == 1)
  {
    -[AVCaptureSession commitConfiguration](self->_captureSession, "commitConfiguration");
    -[CMContinuityCaptureAVCaptureBaseSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    if (-[AVCaptureSession isRunning](self->_captureSession, "isRunning"))
    {
      v3 = 2;
    }
    else
    {
      v7 = -[AVCaptureSession isInterrupted](self->_captureSession, "isInterrupted");
      v3 = 2;
      if (!v7)
        v3 = 0;
    }
    self->_state = v3;
    -[CMContinuityCaptureAVCaptureBaseSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      state = self->_state;
      v9 = 138412546;
      v10 = self;
      v11 = 1024;
      v12 = state;
      v6 = "%@ done did configure, state %d";
      goto LABEL_10;
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = self->_state;
      v9 = 138412546;
      v10 = self;
      v11 = 1024;
      v12 = v5;
      v6 = "%@ skip did configure, state %d";
LABEL_10:
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x12u);
    }
  }

}

- (void)start
{
  NSObject *v3;
  int64_t state;
  int v5;
  CMContinuityCaptureAVCaptureBaseSession *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  +[CMContinuityCaptureRemoteCompositeDevice setWombatMode:](CMContinuityCaptureRemoteCompositeDevice, "setWombatMode:", 1);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AVCaptureSession startRunning](self->_captureSession, "startRunning");
  -[CMContinuityCaptureAVCaptureBaseSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
  if (-[AVCaptureSession isRunning](self->_captureSession, "isRunning")
    || -[AVCaptureSession isInterrupted](self->_captureSession, "isInterrupted"))
  {
    self->_state = 2;
  }
  -[CMContinuityCaptureAVCaptureBaseSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v5 = 138412802;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureAVCaptureBaseSession start]";
    v9 = 1024;
    v10 = state;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s RunningState %d", (uint8_t *)&v5, 0x1Cu);
  }

}

- (void)stop
{
  NSObject *v3;
  int64_t state;
  int v5;
  CMContinuityCaptureAVCaptureBaseSession *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[AVCaptureSession stopRunning](self->_captureSession, "stopRunning");
  if (!-[AVCaptureSession isRunning](self->_captureSession, "isRunning"))
  {
    -[CMContinuityCaptureAVCaptureBaseSession willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("state"));
    self->_state = 0;
    -[CMContinuityCaptureAVCaptureBaseSession didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("state"));
  }
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    state = self->_state;
    v5 = 138412802;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureAVCaptureBaseSession stop]";
    v9 = 1024;
    v10 = state;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ %s RunningState %d", (uint8_t *)&v5, 0x1Cu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

@end
