@implementation AXLTTestTranscriber

- (AXLTTestTranscriber)initWithDelegate:(id)a3
{
  id v4;
  AXLTTestTranscriber *v5;
  AXLTTestTranscriber *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AXLTTestTranscriber;
  v5 = -[AXLTTestTranscriber init](&v8, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_isTranscribing = 0;
  }

  return v6;
}

- (BOOL)startTranscription:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  dispatch_source_t v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD handler[5];

  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXLTTestTranscriber startTranscription:].cold.2();

  if (!-[AXLTTestTranscriber isTranscribing](self, "isTranscribing"))
  {
    dispatch_get_global_queue(0, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v5);
    -[AXLTTestTranscriber setDispatchSource:](self, "setDispatchSource:", v6);

    v7 = dispatch_time(0, 0);
    -[AXLTTestTranscriber dispatchSource](self, "dispatchSource");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v8, v7, 0x3B9ACA00uLL, 0);

    -[AXLTTestTranscriber dispatchSource](self, "dispatchSource");
    v9 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __42__AXLTTestTranscriber_startTranscription___block_invoke;
    handler[3] = &unk_24F874E30;
    handler[4] = self;
    dispatch_source_set_event_handler(v9, handler);

    -[AXLTTestTranscriber dispatchSource](self, "dispatchSource");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v10);

    AXLogLiveTranscription();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[AXLTTestTranscriber startTranscription:].cold.1();

    -[AXLTTestTranscriber setIsTranscribing:](self, "setIsTranscribing:", 1);
  }
  return 1;
}

void __42__AXLTTestTranscriber_startTranscription___block_invoke(uint64_t a1)
{
  NSObject *v2;
  AXLTTranscribedData *v3;
  void *v4;
  AXLTTranscribedData *v5;
  void *v6;
  uint64_t v7;

  AXLogLiveTranscription();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __42__AXLTTestTranscriber_startTranscription___block_invoke_cold_1();

  v3 = [AXLTTranscribedData alloc];
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v7) = 0;
  v5 = -[AXLTTranscribedData initWithTranscribedText:requestType:timestamp:pid:appID:appName:downloadProgress:silence:](v3, "initWithTranscribedText:requestType:timestamp:pid:appID:appName:downloadProgress:silence:", CFSTR("This is a test"), 2, v4, getpid(), CFSTR("LiveTranscriptionService"), CFSTR("LiveTranscriptionService"), -2, v7);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transcriberOutputData:", v5);

}

- (BOOL)stopTranscription:(id *)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;

  AXLogLiveTranscription();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    -[AXLTTestTranscriber stopTranscription:].cold.2();

  if (-[AXLTTestTranscriber isTranscribing](self, "isTranscribing"))
  {
    -[AXLTTestTranscriber dispatchSource](self, "dispatchSource");
    v5 = objc_claimAutoreleasedReturnValue();
    dispatch_suspend(v5);

    AXLogLiveTranscription();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[AXLTTestTranscriber stopTranscription:].cold.1();

    -[AXLTTestTranscriber setIsTranscribing:](self, "setIsTranscribing:", 0);
  }
  return 1;
}

- (BOOL)isTranscribing
{
  return self->_isTranscribing;
}

- (void)setIsTranscribing:(BOOL)a3
{
  self->_isTranscribing = a3;
}

- (AXLTTranscriberDelegateProtocol)delegate
{
  return (AXLTTranscriberDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_source)dispatchSource
{
  return self->_dispatchSource;
}

- (void)setDispatchSource:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dispatchSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)startTranscription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "starting transcription for testing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)startTranscription:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "start test transcription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __42__AXLTTestTranscriber_startTranscription___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "reporting test transcribed data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)stopTranscription:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "stopping transcription for testing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)stopTranscription:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_22D27A000, v0, v1, "stop test transcription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
