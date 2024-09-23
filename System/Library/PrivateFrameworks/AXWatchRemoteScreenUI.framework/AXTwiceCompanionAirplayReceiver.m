@implementation AXTwiceCompanionAirplayReceiver

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__Shared;
}

void __49__AXTwiceCompanionAirplayReceiver_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[AXTwiceCompanionAirplayReceiver _init]([AXTwiceCompanionAirplayReceiver alloc], "_init");
  v1 = (void *)sharedInstance__Shared;
  sharedInstance__Shared = (uint64_t)v0;

}

- (id)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  AXLogTwiceRemoteScreen();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[AXTwiceCompanionAirplayReceiver start]";
    _os_log_impl(&dword_21EC60000, v3, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(getAPRKStreamRenderingManagerClass(), "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setAssistedModeEnabled:", 1);
  objc_msgSend(v4, "setEnableMixingMediaAudio:", 1);
  objc_msgSend(v4, "setOptimizeAudioRenderingLatency:", 1);
  objc_msgSend(v4, "startReceiverServer");
  objc_msgSend(v4, "assistedInfoForAWDL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)cleanup
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  AXLogTwiceRemoteScreen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[AXTwiceCompanionAirplayReceiver cleanup]";
    _os_log_impl(&dword_21EC60000, v2, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v4, 0xCu);
  }

  objc_msgSend(getAPRKStreamRenderingManagerClass(), "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAssistedModeEnabled:", 0);
  objc_msgSend(v3, "stopReceiverServer");

}

- (id)_init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AXTwiceCompanionAirplayReceiver;
  return -[AXTwiceCompanionAirplayReceiver init](&v3, sel_init);
}

- (void)dealloc
{
  objc_super v3;

  -[AXTwiceCompanionAirplayReceiver cleanup](self, "cleanup");
  v3.receiver = self;
  v3.super_class = (Class)AXTwiceCompanionAirplayReceiver;
  -[AXTwiceCompanionAirplayReceiver dealloc](&v3, sel_dealloc);
}

- (void)didChangeStreamRendererModeTo:(unint64_t)a3 forRenderer:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  AXLogTwiceRemoteScreen();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136315394;
    v14 = "-[AXTwiceCompanionAirplayReceiver didChangeStreamRendererModeTo:forRenderer:]";
    v15 = 2112;
    v16 = (uint64_t)v7;
    _os_log_impl(&dword_21EC60000, v6, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v13, 0x16u);

  }
  AXLogTwiceRemoteScreen();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(v5, "streamRendererMode");
    v13 = 136315394;
    v14 = "-[AXTwiceCompanionAirplayReceiver didChangeStreamRendererModeTo:forRenderer:]";
    v15 = 2048;
    v16 = v9;
    _os_log_impl(&dword_21EC60000, v8, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %lu", (uint8_t *)&v13, 0x16u);
  }

  -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "mirroringLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[AXTwiceCompanionAirplayReceiver delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "airplayDidStartStreamingWithMirroringLayer:", v11);

  }
}

- (void)didStartStreamingWithRenderer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  int v17;
  const char *v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogTwiceRemoteScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 136315394;
    v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
    v19 = 2112;
    v20 = (uint64_t)v6;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v17, 0x16u);

  }
  AXLogTwiceRemoteScreen();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_msgSend(v4, "streamRendererMode");
    v17 = 136315394;
    v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
    v19 = 2048;
    v20 = v8;
    _os_log_impl(&dword_21EC60000, v7, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %lu", (uint8_t *)&v17, 0x16u);
  }

  -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stop");

    AXLogTwiceRemoteScreen();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:].cold.1(self);

  }
  -[AXTwiceCompanionAirplayReceiver setStreamRenderer:](self, "setStreamRenderer:", v4);
  -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setDelegate:", self);

  -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "mirroringLayer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    AXLogTwiceRemoteScreen();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 136315394;
      v18 = "-[AXTwiceCompanionAirplayReceiver didStartStreamingWithRenderer:]";
      v19 = 2112;
      v20 = (uint64_t)v14;
      _os_log_impl(&dword_21EC60000, v15, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v17, 0x16u);
    }

    -[AXTwiceCompanionAirplayReceiver delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "airplayDidStartStreamingWithMirroringLayer:", v14);

  }
}

- (void)didStopStreamingWithRenderer:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogTwiceRemoteScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 136315394;
    v11 = "-[AXTwiceCompanionAirplayReceiver didStopStreamingWithRenderer:]";
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v10, 0x16u);

  }
  -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[AXTwiceCompanionAirplayReceiver streamRenderer](self, "streamRenderer");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8 == v4)
    {
      -[AXTwiceCompanionAirplayReceiver setStreamRenderer:](self, "setStreamRenderer:", 0);
      -[AXTwiceCompanionAirplayReceiver delegate](self, "delegate");
      v9 = objc_claimAutoreleasedReturnValue();
      -[NSObject airplayDidStopStreaming](v9, "airplayDidStopStreaming");
    }
    else
    {
      AXLogTwiceRemoteScreen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[AXTwiceCompanionAirplayReceiver didStopStreamingWithRenderer:].cold.1(self);
    }

  }
}

- (void)shouldShowGlobalPasscodeWithString:(id)a3 withClientName:(id)a4
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogTwiceRemoteScreen();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[AXTwiceCompanionAirplayReceiver shouldShowGlobalPasscodeWithString:withClientName:]";
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_21EC60000, v5, OS_LOG_TYPE_DEFAULT, "[TWICE] %s %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)shouldHideGlobalPasscode
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  AXLogTwiceRemoteScreen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[AXTwiceCompanionAirplayReceiver shouldHideGlobalPasscode]";
    _os_log_impl(&dword_21EC60000, v2, OS_LOG_TYPE_DEFAULT, "[TWICE] %s", (uint8_t *)&v3, 0xCu);
  }

}

- (AXTwiceCompanionAirplayReceiverDelegate)delegate
{
  return (AXTwiceCompanionAirplayReceiverDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (APRKStreamRenderer)streamRenderer
{
  return self->_streamRenderer;
}

- (void)setStreamRenderer:(id)a3
{
  objc_storeStrong((id *)&self->_streamRenderer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_streamRenderer, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)didStartStreamingWithRenderer:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "streamRenderer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "streamRendererMode");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21EC60000, v2, v3, "[TWICE] Stop %lu before assigning %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)didStopStreamingWithRenderer:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "streamRenderer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "streamRendererMode");
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_21EC60000, v2, v3, "[TWICE] mismatch renderer %lu - %lu", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

@end
