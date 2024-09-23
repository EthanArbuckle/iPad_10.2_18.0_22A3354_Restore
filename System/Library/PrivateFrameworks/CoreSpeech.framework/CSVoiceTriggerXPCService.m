@implementation CSVoiceTriggerXPCService

- (CSVoiceTriggerXPCService)init
{
  CSVoiceTriggerXPCService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSVoiceTriggerXPCService;
  v2 = -[CSVoiceTriggerXPCService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSVoiceTriggerXPCService Queue", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4 xpcClient:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  BOOL v16;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __71__CSVoiceTriggerXPCService_enableVoiceTrigger_withAssertion_xpcClient___block_invoke;
  v13[3] = &unk_1E7C29278;
  v13[4] = self;
  v14 = v9;
  v16 = a3;
  v15 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(queue, v13);

}

- (void)enableVoiceTrigger:(BOOL)a3 withAssertion:(id)a4
{
  -[CSVoiceTriggerXPCService enableVoiceTrigger:withAssertion:xpcClient:](self, "enableVoiceTrigger:withAssertion:xpcClient:", a3, a4, 0);
}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __72__CSVoiceTriggerXPCService_setPhraseSpotterBypassing_timeout_xpcClient___block_invoke;
  v11[3] = &unk_1E7C261F8;
  v11[4] = self;
  v12 = v8;
  v14 = a3;
  v13 = a4;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)setPhraseSpotterBypassing:(BOOL)a3 timeout:(double)a4
{
  -[CSVoiceTriggerXPCService setPhraseSpotterBypassing:timeout:xpcClient:](self, "setPhraseSpotterBypassing:timeout:xpcClient:", a3, 0, a4);
}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4 xpcClient:(id)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v11[5];
  id v12;
  double v13;
  BOOL v14;

  v8 = a5;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CSVoiceTriggerXPCService_setRaiseToSpeakBypassing_timeout_xpcClient___block_invoke;
  v11[3] = &unk_1E7C261F8;
  v14 = a3;
  v13 = a4;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, v11);

}

- (void)setRaiseToSpeakBypassing:(BOOL)a3 timeout:(double)a4
{
  -[CSVoiceTriggerXPCService setRaiseToSpeakBypassing:timeout:xpcClient:](self, "setRaiseToSpeakBypassing:timeout:xpcClient:", a3, 0, a4);
}

- (void)notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __82__CSVoiceTriggerXPCService_notifyVoiceTriggeredSiriSessionCancelledWithXpcClient___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (id)fetchVoiceTriggerDailyStats
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2052;
  v10 = __Block_byref_object_dispose__2053;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__CSVoiceTriggerXPCService_fetchVoiceTriggerDailyStats__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)notifyVoiceTriggeredSiriSessionCancelled
{
  -[CSVoiceTriggerXPCService notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:](self, "notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:", 0);
}

- (id)_createXPCClientConnectionIfNeeded:(id)a3
{
  id v4;
  CSVoiceTriggerXPCClient *v5;
  CSVoiceTriggerXPCClient *v6;
  CSVoiceTriggerXPCClient *xpcClient;
  CSVoiceTriggerXPCClient *v8;
  NSObject *v9;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    v5 = (CSVoiceTriggerXPCClient *)v4;
LABEL_3:
    v6 = v5;
    goto LABEL_14;
  }
  if (CSIsWatch())
  {
    xpcClient = self->_xpcClient;
    if (xpcClient)
    {
      v5 = xpcClient;
      goto LABEL_3;
    }
  }
  v6 = objc_alloc_init(CSVoiceTriggerXPCClient);
  -[CSVoiceTriggerXPCClient setDelegate:](v6, "setDelegate:", self);
  -[CSVoiceTriggerXPCClient connect](v6, "connect");
  if (v6)
  {
    if (CSIsWatch())
      -[CSVoiceTriggerXPCService setXpcClient:](self, "setXpcClient:", v6);
    v8 = v6;
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v11 = 136315138;
      v12 = "-[CSVoiceTriggerXPCService _createXPCClientConnectionIfNeeded:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s voiceTriggerXPC client not exist", (uint8_t *)&v11, 0xCu);
    }
  }

LABEL_14:
  return v6;
}

- (void)voiceTriggerXPCClient:(id)a3 didDisconnect:(BOOL)a4
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__CSVoiceTriggerXPCService_voiceTriggerXPCClient_didDisconnect___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_teardownXPCClientIfNeeded
{
  CSVoiceTriggerXPCClient *xpcClient;
  NSObject *v4;
  CSVoiceTriggerXPCClient *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  xpcClient = self->_xpcClient;
  if (xpcClient)
  {
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "-[CSVoiceTriggerXPCService _teardownXPCClientIfNeeded]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
      xpcClient = self->_xpcClient;
    }
    -[CSVoiceTriggerXPCClient setDelegate:](xpcClient, "setDelegate:", 0);
    v5 = self->_xpcClient;
    self->_xpcClient = 0;

  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (CSVoiceTriggerXPCClient)xpcClient
{
  return self->_xpcClient;
}

- (void)setXpcClient:(id)a3
{
  objc_storeStrong((id *)&self->_xpcClient, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcClient, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __64__CSVoiceTriggerXPCService_voiceTriggerXPCClient_didDisconnect___block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerXPCService voiceTriggerXPCClient:didDisconnect:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s reset xpcClient since it disconnected", (uint8_t *)&v4, 0xCu);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_teardownXPCClientIfNeeded");
}

void __55__CSVoiceTriggerXPCService_fetchVoiceTriggerDailyStats__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSVoiceTriggerXPCService fetchVoiceTriggerDailyStats]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchVoiceTriggerStats");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __82__CSVoiceTriggerXPCService_notifyVoiceTriggeredSiriSessionCancelledWithXpcClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerXPCService notifyVoiceTriggeredSiriSessionCancelledWithXpcClient:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "notifyVoiceTriggeredSiriSessionCancelled");

}

void __71__CSVoiceTriggerXPCService_setRaiseToSpeakBypassing_timeout_xpcClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  uint64_t v4;
  void *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v3 = &stru_1E7C296E8;
    v4 = *(_QWORD *)(a1 + 48);
    if (!*(_BYTE *)(a1 + 56))
      v3 = CFSTR("NOT");
    v6 = 136315650;
    v7 = "-[CSVoiceTriggerXPCService setRaiseToSpeakBypassing:timeout:xpcClient:]_block_invoke";
    v8 = 2114;
    v9 = v3;
    v10 = 2050;
    v11 = v4;
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Requesting RTS %{public}@ bypass for %{public}lf seconds", (uint8_t *)&v6, 0x20u);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRaiseToSpeakBypassing:timeout:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));

}

void __72__CSVoiceTriggerXPCService_setPhraseSpotterBypassing_timeout_xpcClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSVoiceTriggerXPCService setPhraseSpotterBypassing:timeout:xpcClient:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPhraseSpotterBypassing:timeout:", *(unsigned __int8 *)(a1 + 56), *(double *)(a1 + 48));

}

void __71__CSVoiceTriggerXPCService_enableVoiceTrigger_withAssertion_xpcClient___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[CSVoiceTriggerXPCService enableVoiceTrigger:withAssertion:xpcClient:]_block_invoke";
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v7, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_createXPCClientConnectionIfNeeded:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(unsigned __int8 *)(a1 + 56);
  v5 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "systemUptime");
  objc_msgSend(v3, "enableVoiceTrigger:withAssertion:timestamp:", v4, v5);

}

+ (id)sharedService
{
  if (sharedService_onceToken != -1)
    dispatch_once(&sharedService_onceToken, &__block_literal_global_2068);
  return (id)sharedService_sharedInstance;
}

void __41__CSVoiceTriggerXPCService_sharedService__block_invoke()
{
  CSVoiceTriggerXPCService *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerXPCService);
  v1 = (void *)sharedService_sharedInstance;
  sharedService_sharedInstance = (uint64_t)v0;

}

@end
