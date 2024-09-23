@implementation CSOpportuneSpeakListnerTestService

- (CSOpportuneSpeakListnerTestService)init
{
  CSOpportuneSpeakListnerTestService *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSOpportuneSpeakListnerTestService;
  v2 = -[CSOpportuneSpeakListnerTestService init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("CSOpportuneSpeakListnerTestService", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

  }
  return v2;
}

- (void)start
{
  int *p_notifyToken;
  uint64_t v4;
  NSObject *queue;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD handler[5];

  p_notifyToken = &self->_notifyToken;
  v4 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __43__CSOpportuneSpeakListnerTestService_start__block_invoke;
  handler[3] = &unk_1E7C28DC0;
  handler[4] = self;
  notify_register_dispatch("com.apple.corespeech.opportunelistner.start", &self->_notifyToken, queue, handler);
  v6 = self->_queue;
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __43__CSOpportuneSpeakListnerTestService_start__block_invoke_2;
  v7[3] = &unk_1E7C28DC0;
  v7[4] = self;
  notify_register_dispatch("com.apple.corespeech.opportunelistner.stop", p_notifyToken, v6, v7);
}

- (void)receiveOpportuneSpeakListenerStart
{
  CSOpportuneSpeakListener *v3;
  CSOpportuneSpeakListener *listener;
  CSOpportuneSpeakListenerOption *v5;

  v3 = objc_alloc_init(CSOpportuneSpeakListener);
  listener = self->listener;
  self->listener = v3;

  -[CSOpportuneSpeakListener setDelegate:](self->listener, "setDelegate:", self);
  v5 = objc_alloc_init(CSOpportuneSpeakListenerOption);
  -[CSOpportuneSpeakListenerOption setDeviceId:](v5, "setDeviceId:", CFSTR("A945B95D-69F6-FC77-4FAE-91F50A039CD8"));
  -[CSOpportuneSpeakListener startListenWithOption:completion:](self->listener, "startListenWithOption:completion:", v5, &__block_literal_global_25885);

}

- (void)receiveOpportuneSpeakListenerStop
{
  -[CSOpportuneSpeakListener stopListenWithCompletion:](self->listener, "stopListenWithCompletion:", &__block_literal_global_7_25880);
}

- (void)opportuneSpeakListener:(id)a3 hasRemoteVADAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:hasRemoteVADAvailable:]";
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s hasRemoteVADAvailable : %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)opportuneSpeakListener:(id)a3 hasVADAvailable:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:hasVADAvailable:]";
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s hasVADAvailable : %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void)opportuneSpeakListener:(id)a3 didStopUnexpectedly:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v4 = a4;
  v10 = *MEMORY[0x1E0C80C00];
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSOpportuneSpeakListnerTestService opportuneSpeakListener:didStopUnexpectedly:]";
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s didStopUnexpectedly : %d", (uint8_t *)&v6, 0x12u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->listener, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __71__CSOpportuneSpeakListnerTestService_receiveOpportuneSpeakListenerStop__block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[CSOpportuneSpeakListnerTestService receiveOpportuneSpeakListenerStop]_block_invoke";
    v10 = 1026;
    v11 = a2;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s stopListenWithCompletion : %{public}d, %{public}@", (uint8_t *)&v8, 0x1Cu);

  }
}

void __72__CSOpportuneSpeakListnerTestService_receiveOpportuneSpeakListenerStart__block_invoke(uint64_t a1, int a2, void *a3)
{
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = (void *)*MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(a3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315650;
    v9 = "-[CSOpportuneSpeakListnerTestService receiveOpportuneSpeakListenerStart]_block_invoke";
    v10 = 1026;
    v11 = a2;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_1C2614000, v6, OS_LOG_TYPE_DEFAULT, "%s startListenWithOption : %{public}d, %{public}@", (uint8_t *)&v8, 0x1Cu);

  }
}

uint64_t __43__CSOpportuneSpeakListnerTestService_start__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveOpportuneSpeakListenerStart");
}

uint64_t __43__CSOpportuneSpeakListnerTestService_start__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "receiveOpportuneSpeakListenerStop");
}

@end
