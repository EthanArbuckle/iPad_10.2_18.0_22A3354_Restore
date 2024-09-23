@implementation CoreSpeechXPCFakeModelMonitor

- (CoreSpeechXPCFakeModelMonitor)init
{
  CoreSpeechXPCFakeModelMonitor *v2;
  uint64_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CoreSpeechXPCFakeModelMonitor;
  v2 = -[CoreSpeechXPCFakeModelMonitor init](&v6, sel_init);
  if (v2)
  {
    dispatch_get_global_queue(33, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_fakeAssetRollNotificationRegistrationToken = -1;
  }
  return v2;
}

- (void)start
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__CoreSpeechXPCFakeModelMonitor_start__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)stop
{
  int fakeAssetRollNotificationRegistrationToken;
  NSObject *queue;
  _QWORD block[4];
  int v5;

  fakeAssetRollNotificationRegistrationToken = self->_fakeAssetRollNotificationRegistrationToken;
  self->_fakeAssetRollNotificationRegistrationToken = -1;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CoreSpeechXPCFakeModelMonitor_stop__block_invoke;
  block[3] = &__block_descriptor_36_e5_v8__0l;
  v5 = fakeAssetRollNotificationRegistrationToken;
  dispatch_sync(queue, block);
}

- (void)_registerForFakeAssetRollNotification
{
  const char *v3;
  NSObject *queue;
  uint32_t v5;
  NSObject *v6;
  _QWORD handler[4];
  id v8;
  id location;
  int out_token;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  uint32_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (CSIsInternalBuild() && self->_fakeAssetRollNotificationRegistrationToken == -1)
  {
    out_token = 0;
    objc_initWeak(&location, self);
    v3 = (const char *)objc_msgSend(CFSTR("com.apple.corespeech.fakeasset.rolling"), "UTF8String");
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __70__CoreSpeechXPCFakeModelMonitor__registerForFakeAssetRollNotification__block_invoke;
    handler[3] = &unk_1E7C26F50;
    objc_copyWeak(&v8, &location);
    v5 = notify_register_dispatch(v3, &out_token, queue, handler);
    if (v5)
    {
      v6 = *MEMORY[0x1E0D18F60];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        objc_destroyWeak(&v8);
        objc_destroyWeak(&location);
        return;
      }
      *(_DWORD *)buf = 136315650;
      v12 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]";
      v13 = 2112;
      v14 = CFSTR("com.apple.corespeech.fakeasset.rolling");
      v15 = 1024;
      v16 = v5;
    }
    else
    {
      if (out_token != -1)
      {
        self->_fakeAssetRollNotificationRegistrationToken = out_token;
        goto LABEL_11;
      }
      v6 = *MEMORY[0x1E0D18F60];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
        goto LABEL_11;
      *(_DWORD *)buf = 136315650;
      v12 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]";
      v13 = 2112;
      v14 = CFSTR("com.apple.corespeech.fakeasset.rolling");
      v15 = 1024;
      v16 = 0;
    }
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s Failed to register for notification %@ (status=%d)", buf, 0x1Cu);
    goto LABEL_11;
  }
}

- (NSString)lastFakeModelUsedHash
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastFakeModelUsedHash:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)shouldRollFakeModel
{
  return self->_shouldRollFakeModel;
}

- (void)setShouldRollFakeModel:(BOOL)a3
{
  self->_shouldRollFakeModel = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int)fakeAssetRollNotificationRegistrationToken
{
  return self->_fakeAssetRollNotificationRegistrationToken;
}

- (void)setFakeAssetRollNotificationRegistrationToken:(int)a3
{
  self->_fakeAssetRollNotificationRegistrationToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_lastFakeModelUsedHash, 0);
}

void __70__CoreSpeechXPCFakeModelMonitor__registerForFakeAssetRollNotification__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "-[CoreSpeechXPCFakeModelMonitor _registerForFakeAssetRollNotification]_block_invoke";
    v6 = 2112;
    v7 = CFSTR("com.apple.corespeech.fakeasset.rolling");
    _os_log_impl(&dword_1C2614000, v2, OS_LOG_TYPE_DEFAULT, "%s Received notification %@", (uint8_t *)&v4, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setShouldRollFakeModel:", 1);

}

uint64_t __37__CoreSpeechXPCFakeModelMonitor_stop__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 32);
  if ((_DWORD)result != -1)
    return notify_cancel(result);
  return result;
}

uint64_t __38__CoreSpeechXPCFakeModelMonitor_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_registerForFakeAssetRollNotification");
}

@end
