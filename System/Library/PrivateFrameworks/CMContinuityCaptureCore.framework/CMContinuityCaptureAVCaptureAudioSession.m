@implementation CMContinuityCaptureAVCaptureAudioSession

- (CMContinuityCaptureAVCaptureAudioSession)initWithQueue:(id)a3
{
  id v4;
  id v5;
  CMContinuityCaptureAVCaptureAudioSession *v6;
  CMContinuityCaptureAVCaptureAudioSession *v7;
  objc_super v9;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x24BDB24D0]);
  if (!v5)
    goto LABEL_6;
  v9.receiver = self;
  v9.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
  v6 = -[CMContinuityCaptureAVCaptureBaseSession initWithCaptureSession:queue:](&v9, sel_initWithCaptureSession_queue_, v5, v4);
  if (!v6)
  {
    self = 0;
LABEL_6:
    v7 = 0;
    goto LABEL_4;
  }
  self = v6;
  v7 = self;
LABEL_4:

  return v7;
}

- (void)configureSessionWithInput:(id)a3 andOutput:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;

  v6 = a3;
  v7 = a4;
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "canAddInput:", v6);

  if (v10)
  {
    -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
    v11 = objc_claimAutoreleasedReturnValue();
    -[NSObject addInput:](v11, "addInput:", v6);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureAVCaptureAudioSession configureSessionWithInput:andOutput:].cold.2(self);
  }

  -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "canAddOutput:", v7);

  if (v13)
  {
    -[CMContinuityCaptureAVCaptureBaseSession captureSession](self, "captureSession");
    v14 = objc_claimAutoreleasedReturnValue();
    -[NSObject addOutput:](v14, "addOutput:", v7);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureAVCaptureAudioSession configureSessionWithInput:andOutput:].cold.1(self);
  }

}

- (void)start
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state"))
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v7 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
      v8 = 2080;
      v9 = "-[CMContinuityCaptureAVCaptureAudioSession start]";
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }

  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
    -[CMContinuityCaptureAVCaptureBaseSession start](&v5, sel_start);
  }
}

- (void)stop
{
  NSObject *v3;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureAVCaptureBaseSession queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[CMContinuityCaptureAVCaptureBaseSession state](self, "state") == 2)
  {
    v5.receiver = self;
    v5.super_class = (Class)CMContinuityCaptureAVCaptureAudioSession;
    -[CMContinuityCaptureAVCaptureBaseSession stop](&v5, sel_stop);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v7 = -[CMContinuityCaptureAVCaptureBaseSession state](self, "state");
      v8 = 2080;
      v9 = "-[CMContinuityCaptureAVCaptureAudioSession stop]";
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "Invalid state %d for %s", buf, 0x12u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
}

- (void)configureSessionWithInput:(void *)a1 andOutput:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "captureSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v2, v3, "%{public}@ Cannot add AVCaptureAudioDataOutput (%p) to AVCaptureSession (%p)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

- (void)configureSessionWithInput:(void *)a1 andOutput:.cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "captureSession");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_5_0(&dword_227C5D000, v2, v3, "%{public}@ Cannot add AVCaptureDeviceInput (%p) to AVCaptureSession (%p)", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

@end
