@implementation BCSNFCReaderConnection

- (void)checkHardwareSupportStateWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D7872D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)stopReaderWithErrorHandler:(id)a3
{
  -[BCSNotificationServiceConnection stopNFCReaderWithErrorHandler:](self->_notificationServiceConnection, "stopNFCReaderWithErrorHandler:", a3);
}

uint64_t __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_hardwareSupportState");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __73__BCSNFCReaderConnection_checkHardwareSupportStateWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24D7877B0;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

- (int64_t)_hardwareSupportState
{
  void *v2;
  int v3;
  id v4;
  int64_t v5;
  id v7;

  objc_msgSend(getNFHardwareManagerClass_0(), "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0;
  v3 = objc_msgSend(v2, "queryHardwareSupport:", &v7);
  v4 = v7;

  v5 = 0;
  if (!v4)
  {
    if ((v3 - 1) > 2)
      v5 = 2;
    else
      v5 = qword_2174BF628[v3 - 1];
  }

  return v5;
}

- (BCSNFCReaderConnection)init
{
  BCSNFCReaderConnection *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  BCSNFCReaderConnection *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BCSNFCReaderConnection;
  v2 = -[BCSNFCReaderConnection init](&v8, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(0, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create_with_target_V2("com.apple.BarcodeSupport.BCSNFCReaderConnection", 0, v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = v2;
  }

  return v2;
}

- (void)checkNFCEnabledWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D7872D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_isNFCEnabled");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24D787768;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __63__BCSNFCReaderConnection_checkNFCEnabledWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_isNFCEnabled
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  BOOL v6;
  char v8;

  if (!-[BCSNFCReaderConnection _needsRadioEnabledCheck](self, "_needsRadioEnabledCheck"))
    return 1;
  v8 = 0;
  objc_msgSend(getNFHardwareManagerClass_0(), "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getRadioEnabledSetting:", &v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (readerConnectionLog_onceToken != -1)
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_44);
    v4 = (void *)readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReaderConnection _isNFCEnabled].cold.1(v4, v3);
  }
  if (v3)
    v5 = 1;
  else
    v5 = v8 == 0;
  v6 = !v5;

  return v6;
}

- (BOOL)_needsRadioEnabledCheck
{
  if (_needsRadioEnabledCheck_onceToken != -1)
    dispatch_once(&_needsRadioEnabledCheck_onceToken, &__block_literal_global_1);
  return _needsRadioEnabledCheck_deviceRegionIsChina;
}

void __49__BCSNFCReaderConnection__needsRadioEnabledCheck__block_invoke()
{
  const __CFString *v0;
  const __CFString *v1;

  v0 = (const __CFString *)MGGetStringAnswer();
  if (v0)
  {
    v1 = v0;
    _needsRadioEnabledCheck_deviceRegionIsChina = CFStringCompare(v0, CFSTR("CH"), 0) == kCFCompareEqualTo;
    CFRelease(v1);
  }
}

- (void)enableNFCWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke;
  v7[3] = &unk_24D7872D8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke(uint64_t a1)
{
  char v2;
  _QWORD v3[4];
  id v4;
  char v5;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_enableNFC");
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_24D787768;
  v4 = *(id *)(a1 + 40);
  v5 = v2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);

}

uint64_t __57__BCSNFCReaderConnection_enableNFCWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)_enableNFC
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(getNFHardwareManagerClass_0(), "sharedHardwareManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRadioEnabledSetting:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (readerConnectionLog_onceToken != -1)
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_44);
    v4 = (void *)readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReaderConnection _enableNFC].cold.1(v4, v3);
  }

  return v3 == 0;
}

- (void)startReaderWithDelegate:(id)a3 errorHandler:(id)a4 interruptionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  BCSNotificationServiceConnection *v12;
  BCSNotificationServiceConnection *notificationServiceConnection;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_notificationServiceConnection)
  {
    if (readerConnectionLog_onceToken != -1)
      dispatch_once(&readerConnectionLog_onceToken, &__block_literal_global_44);
    v11 = readerConnectionLog_log;
    if (os_log_type_enabled((os_log_t)readerConnectionLog_log, OS_LOG_TYPE_ERROR))
      -[BCSNFCReaderConnection startReaderWithDelegate:errorHandler:interruptionHandler:].cold.1(v11);
  }
  v12 = objc_alloc_init(BCSNotificationServiceConnection);
  notificationServiceConnection = self->_notificationServiceConnection;
  self->_notificationServiceConnection = v12;

  -[BCSNotificationServiceConnection setInterruptionHandler:](self->_notificationServiceConnection, "setInterruptionHandler:", v10);
  -[BCSNotificationServiceConnection startNFCReaderWithDelegate:errorHandler:](self->_notificationServiceConnection, "startNFCReaderWithDelegate:errorHandler:", v8, v9);

}

- (void)disconnect
{
  BCSNotificationServiceConnection *notificationServiceConnection;

  notificationServiceConnection = self->_notificationServiceConnection;
  self->_notificationServiceConnection = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
}

- (void)_isNFCEnabled
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v5, v6, "Get radio enabled error: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)_enableNFC
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = a1;
  objc_msgSend(a2, "_bcs_privacyPreservingDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1(&dword_21748C000, v5, v6, "Failed to enable radio: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_2();
}

- (void)startReaderWithDelegate:(os_log_t)log errorHandler:interruptionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21748C000, log, OS_LOG_TYPE_ERROR, "Notification service connection is non-nil when starting reader", v1, 2u);
}

@end
