@implementation CSOpportuneSpeakEventMonitor

- (CSOpportuneSpeakEventMonitor)init
{
  CSOpportuneSpeakEventMonitor *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSOpportuneSpeakEventMonitor;
  v2 = -[CSEventMonitor init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSOpportuneSpeakEventMonitor", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v2->_isOpportuneSpeakListening = 0;
  }
  return v2;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  void *v4;
  NSObject *queue;
  _QWORD block[5];

  +[CSOpportuneSpeakBehaviorMonitor sharedInstance](CSOpportuneSpeakBehaviorMonitor, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "registerObserver:", self);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__CSOpportuneSpeakEventMonitor__startMonitoringWithQueue___block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopMonitoring
{
  void *v3;
  NSObject *queue;
  _QWORD block[5];

  +[CSOpportuneSpeakBehaviorMonitor sharedInstance](CSOpportuneSpeakBehaviorMonitor, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterObserver:", self);

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__CSOpportuneSpeakEventMonitor__stopMonitoring__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (BOOL)isStreaming
{
  NSObject *queue;
  NSObject *v3;
  int v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __43__CSOpportuneSpeakEventMonitor_isStreaming__block_invoke;
  v7[3] = &unk_1E7C29228;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_async_and_wait(queue, v7);
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *((unsigned __int8 *)v9 + 24);
    *(_DWORD *)buf = 136315394;
    v13 = "-[CSOpportuneSpeakEventMonitor isStreaming]";
    v14 = 1024;
    v15 = v4;
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s Fetching CommandControl Listening State: %d", buf, 0x12u);
  }
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (NSString)audioProviderUUID
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
  v9 = __Block_byref_object_copy__26851;
  v10 = __Block_byref_object_dispose__26852;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__CSOpportuneSpeakEventMonitor_audioProviderUUID__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (CSAudioRecordContext)audioRecordContext
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
  v9 = __Block_byref_object_copy__26851;
  v10 = __Block_byref_object_dispose__26852;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__CSOpportuneSpeakEventMonitor_audioRecordContext__block_invoke;
  v5[3] = &unk_1E7C29228;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async_and_wait(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CSAudioRecordContext *)v3;
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStartStreamWithContext:(id)a4 audioProviderUUID:(id)a5 successfully:(BOOL)a6 option:(id)a7
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v10 = a4;
  v11 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __126__CSOpportuneSpeakEventMonitor_opportuneSpeakBehaviorMonitor_didStartStreamWithContext_audioProviderUUID_successfully_option___block_invoke;
  v15[3] = &unk_1E7C29278;
  v18 = a6;
  v15[4] = self;
  v16 = v11;
  v17 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(queue, v15);

}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 willStopStream:(id)a4
{
  -[CSOpportuneSpeakEventMonitor _notifyStopOpportuneSpeakWithDelay:](self, "_notifyStopOpportuneSpeakWithDelay:", a3, a4, 3.0);
}

- (void)opportuneSpeakBehaviorMonitor:(id)a3 didStopStream:(id)a4
{
  -[CSOpportuneSpeakEventMonitor _notifyStopOpportuneSpeakWithDelay:](self, "_notifyStopOpportuneSpeakWithDelay:", a3, a4, 3.0);
}

- (void)_notifyStopOpportuneSpeakWithDelay:(double)a3
{
  void *v5;
  dispatch_time_t v6;
  NSObject *queue;
  id v8;
  _QWORD v9[4];
  id v10;
  CSOpportuneSpeakEventMonitor *v11;

  v5 = (void *)-[NSUUID copy](self->_token, "copy");
  v6 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  queue = self->_queue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __67__CSOpportuneSpeakEventMonitor__notifyStopOpportuneSpeakWithDelay___block_invoke;
  v9[3] = &unk_1E7C292A0;
  v10 = v5;
  v11 = self;
  v8 = v5;
  dispatch_after(v6, queue, v9);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)isOpportuneSpeakListening
{
  return self->_isOpportuneSpeakListening;
}

- (void)setIsOpportuneSpeakListening:(BOOL)a3
{
  self->_isOpportuneSpeakListening = a3;
}

- (void)setAudioProviderUUID:(id)a3
{
  objc_storeStrong((id *)&self->_audioProviderUUID, a3);
}

- (void)setAudioRecordContext:(id)a3
{
  objc_storeStrong((id *)&self->_audioRecordContext, a3);
}

- (NSUUID)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_storeStrong((id *)&self->_token, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_token, 0);
  objc_storeStrong((id *)&self->_audioRecordContext, 0);
  objc_storeStrong((id *)&self->_audioProviderUUID, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __67__CSOpportuneSpeakEventMonitor__notifyStopOpportuneSpeakWithDelay___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "UUIDString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "UUIDString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 40);
    if (*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 0;
      v6 = *(void **)(a1 + 40);
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __67__CSOpportuneSpeakEventMonitor__notifyStopOpportuneSpeakWithDelay___block_invoke_2;
      v7[3] = &unk_1E7C29250;
      v7[4] = v6;
      objc_msgSend(v6, "enumerateObserversInQueue:", v7);
    }
  }
}

void __67__CSOpportuneSpeakEventMonitor__notifyStopOpportuneSpeakWithDelay___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "opportuneSpeakEventMonitor:didStreamStateChanged:", *(_QWORD *)(a1 + 32), 1);

}

uint64_t __126__CSOpportuneSpeakEventMonitor_opportuneSpeakBehaviorMonitor_didStartStreamWithContext_audioProviderUUID_successfully_option___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  if (*(_BYTE *)(a1 + 56))
  {
    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 1;
    v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 48), *(id *)(a1 + 48));
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 56);
    *(_QWORD *)(v6 + 56) = v5;

  }
  v8 = *(void **)(a1 + 32);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __126__CSOpportuneSpeakEventMonitor_opportuneSpeakBehaviorMonitor_didStartStreamWithContext_audioProviderUUID_successfully_option___block_invoke_2;
  v10[3] = &unk_1E7C29250;
  v10[4] = v8;
  return objc_msgSend(v8, "enumerateObserversInQueue:", v10);
}

void __126__CSOpportuneSpeakEventMonitor_opportuneSpeakBehaviorMonitor_didStartStreamWithContext_audioProviderUUID_successfully_option___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "notifyObserver:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "opportuneSpeakEventMonitor:didStreamStateChanged:", *(_QWORD *)(a1 + 32), 1);

}

void __50__CSOpportuneSpeakEventMonitor_audioRecordContext__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __49__CSOpportuneSpeakEventMonitor_audioProviderUUID__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "copy");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __43__CSOpportuneSpeakEventMonitor_isStreaming__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 24);
  return result;
}

uint64_t __47__CSOpportuneSpeakEventMonitor__stopMonitoring__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

uint64_t __58__CSOpportuneSpeakEventMonitor__startMonitoringWithQueue___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 24) = 0;
  return result;
}

+ (CSOpportuneSpeakEventMonitor)sharedInstance
{
  if (sharedInstance_onceToken_26859 != -1)
    dispatch_once(&sharedInstance_onceToken_26859, &__block_literal_global_26860);
  return (CSOpportuneSpeakEventMonitor *)(id)sharedInstance__sharedInstance_26861;
}

void __46__CSOpportuneSpeakEventMonitor_sharedInstance__block_invoke()
{
  CSOpportuneSpeakEventMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSOpportuneSpeakEventMonitor);
  v1 = (void *)sharedInstance__sharedInstance_26861;
  sharedInstance__sharedInstance_26861 = (uint64_t)v0;

}

@end
