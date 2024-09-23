@implementation CSAVCallConnectedMonitor

- (CSAVCallConnectedMonitor)init
{
  CSAVCallConnectedMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAVCallConnectedMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_hasConnectedAVCall = 0;
  return result;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  -[CSAVCallConnectedMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle", a3);
  -[CSAVCallConnectedMonitor _startObservingAVCallActiveChange](self, "_startObservingAVCallActiveChange");
  -[CSAVCallConnectedMonitor _handleCallActiveDidChangeNotification:](self, "_handleCallActiveDidChangeNotification:", 0);
}

- (void)_handleCallActiveDidChangeNotification:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "attributeForKey:", *MEMORY[0x1E0D47EE8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  self->_hasConnectedAVCall = objc_msgSend(v4, "BOOLValue");

}

- (void)_stopMonitoring
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (BOOL)hasConnectedAVCall
{
  return self->_hasConnectedAVCall;
}

- (void)_startObservingAVCallActiveChange
{
  void *v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (_QWORD *)MEMORY[0x1E0D47EF0];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D47EF0], 0);

  v8[0] = *v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAttribute:forKey:error:", v5, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleCallActiveDidChangeNotification_, *v4, 0);

}

- (void)_systemControllerDied:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[CSAVCallConnectedMonitor _systemControllerDied:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s notification = %{public}@", (uint8_t *)&v6, 0x16u);
  }
  -[CSAVCallConnectedMonitor _startObservingSystemControllerLifecycle](self, "_startObservingSystemControllerLifecycle");
  -[CSAVCallConnectedMonitor _startObservingAVCallActiveChange](self, "_startObservingAVCallActiveChange");
  -[CSAVCallConnectedMonitor _handleCallActiveDidChangeNotification:](self, "_handleCallActiveDidChangeNotification:", 0);

}

- (void)_startObservingSystemControllerLifecycle
{
  void *v3;
  uint64_t *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (uint64_t *)MEMORY[0x1E0D48200];
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0D48200], 0);

  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObject:", *v4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttribute:forKey:error:", v9, *MEMORY[0x1E0D48280], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *v4;
  objc_msgSend(MEMORY[0x1E0D48560], "sharedAVSystemController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__systemControllerDied_, v7, v8);

}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_20385 != -1)
    dispatch_once(&sharedInstance_onceToken_20385, &__block_literal_global_20386);
  return (id)sharedInstance_sharedInstance_20387;
}

void __42__CSAVCallConnectedMonitor_sharedInstance__block_invoke()
{
  CSAVCallConnectedMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAVCallConnectedMonitor);
  v1 = (void *)sharedInstance_sharedInstance_20387;
  sharedInstance_sharedInstance_20387 = (uint64_t)v0;

}

@end
