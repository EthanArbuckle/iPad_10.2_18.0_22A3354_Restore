@implementation EFWatchdog

- (void)start
{
  SBSApplicationUserQuitMonitor *v3;
  SBSApplicationUserQuitMonitor *monitor;
  NSObject *v5;
  void *v6;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (self->_monitor)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EFWatchdog_iOS.m"), 36, CFSTR("-[EFWatchdog start] should only be called once"));

  }
  v3 = (SBSApplicationUserQuitMonitor *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADD0]), "initWithDelegate:", self);
  monitor = self->_monitor;
  self->_monitor = v3;

  +[EFWatchdog log](EFWatchdog, "log");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    -[EFWatchdog monitoredBundleIdentifier](self, "monitoredBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_1B106E000, v5, OS_LOG_TYPE_DEFAULT, "Monitoring for user termination of bundle identifier %{public}@", (uint8_t *)&v9, 0xCu);

  }
}

- (NSString)monitoredBundleIdentifier
{
  return self->_monitoredBundleIdentifier;
}

+ (OS_os_log)log
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __17__EFWatchdog_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_9 != -1)
    dispatch_once(&log_onceToken_9, block);
  return (OS_os_log *)(id)log_log_9;
}

void __17__EFWatchdog_log__block_invoke(uint64_t a1)
{
  os_log_t v1;
  void *v2;
  id v3;

  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = os_log_create("com.apple.email", (const char *)objc_msgSend(v3, "UTF8String"));
  v2 = (void *)log_log_9;
  log_log_9 = (uint64_t)v1;

}

- (EFWatchdog)initWithMonitoredBundleIdentifier:(id)a3
{
  id v4;
  EFWatchdog *v5;
  uint64_t v6;
  NSString *monitoredBundleIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EFWatchdog;
  v5 = -[EFWatchdog init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    monitoredBundleIdentifier = v5->_monitoredBundleIdentifier;
    v5->_monitoredBundleIdentifier = (NSString *)v6;

  }
  return v5;
}

- (void)invalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  +[EFWatchdog log](EFWatchdog, "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[EFWatchdog monitoredBundleIdentifier](self, "monitoredBundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1B106E000, v3, OS_LOG_TYPE_DEFAULT, "Stopping monitoring for user termination of bundle identifier %{public}@", (uint8_t *)&v5, 0xCu);

  }
  -[SBSApplicationUserQuitMonitor invalidate](self->_monitor, "invalidate");
}

- (void)quitMonitor:(id)a3 userClosedLastSceneOfApplicationWithBundleID:(id)a4
{
  id v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v6 = a4;
  -[EFWatchdog monitoredBundleIdentifier](self, "monitoredBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    +[EFWatchdog log](EFWatchdog, "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1B106E000, v9, OS_LOG_TYPE_DEFAULT, "App with bundle identifier %{public}@ was quit by the user, terminating", buf, 0xCu);
    }

    exit(0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end
