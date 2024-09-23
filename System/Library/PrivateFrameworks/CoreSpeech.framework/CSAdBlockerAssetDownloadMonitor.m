@implementation CSAdBlockerAssetDownloadMonitor

- (CSAdBlockerAssetDownloadMonitor)init
{
  CSAdBlockerAssetDownloadMonitor *v2;
  CSAdBlockerAssetDownloadMonitor *v3;
  uint64_t v4;
  CSTrialAssetDownloadMonitor *monitor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CSAdBlockerAssetDownloadMonitor;
  v2 = -[CSEventMonitor init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    +[CSTrialAssetDownloadMonitor sharedInstance](CSTrialAssetDownloadMonitor, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    monitor = v3->_monitor;
    v3->_monitor = (CSTrialAssetDownloadMonitor *)v4;

    -[CSEventMonitor addObserver:](v3->_monitor, "addObserver:", v3);
    v3->_lastUpdatedAssetType = 0;
  }
  return v3;
}

- (const)_notificationKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.new-asset-installed";
}

- (void)_startMonitoringWithQueue:(id)a3
{
  int *p_notifyToken;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_notifyToken = &self->_notifyToken;
  if (self->_notifyToken == -1)
  {
    v5 = a3;
    v6 = -[CSAdBlockerAssetDownloadMonitor _notificationKey](self, "_notificationKey");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __61__CSAdBlockerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch(v6, p_notifyToken, v5, handler);

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSAdBlockerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AdBlocker Asset Download", buf, 0xCu);
    }
  }
}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      v5 = 136315138;
      v6 = "-[CSAdBlockerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AdBlocker Asset Download", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didInstalledNewAdBlockerAsset
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSAdBlockerAssetDownloadMonitor _didInstalledNewAdBlockerAsset]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s New AdBlockerAsset is now installed", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __65__CSAdBlockerAssetDownloadMonitor__didInstalledNewAdBlockerAsset__block_invoke;
  v4[3] = &unk_1E7C29250;
  v4[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  objc_msgSend(v4, "CSAdBlockerAssetDownloadMonitor:didInstallNewAsset:assetProviderType:", self, 1, self->_lastUpdatedAssetType);

}

- (void)trialAssetDownloadMonitorDelegate:(id)a3 didInstallNewAsset:(BOOL)a4 assetType:(unint64_t)a5
{
  _BOOL4 v6;
  id v8;
  NSObject *v9;
  int v10;
  const char *v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;

  v6 = a4;
  v14 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (a5 == 4)
  {
    if (v6)
    {
      self->_lastUpdatedAssetType = 1;
      -[CSAdBlockerAssetDownloadMonitor _didInstalledNewAdBlockerAsset](self, "_didInstalledNewAdBlockerAsset");
    }
  }
  else
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "-[CSAdBlockerAssetDownloadMonitor trialAssetDownloadMonitorDelegate:didInstallNewAsset:assetType:]";
      v12 = 2048;
      v13 = a5;
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Delegate received for invalid Trial assetType:%lu", (uint8_t *)&v10, 0x16u);
    }
  }

}

- (CSTrialAssetDownloadMonitor)monitor
{
  return self->_monitor;
}

- (void)setMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_monitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitor, 0);
}

uint64_t __65__CSAdBlockerAssetDownloadMonitor__didInstalledNewAdBlockerAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __61__CSAdBlockerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_didInstalledNewAdBlockerAsset");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3063 != -1)
    dispatch_once(&sharedInstance_onceToken_3063, &__block_literal_global_3064);
  return (id)sharedInstance__sharedInstance_3065;
}

void __49__CSAdBlockerAssetDownloadMonitor_sharedInstance__block_invoke()
{
  CSAdBlockerAssetDownloadMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAdBlockerAssetDownloadMonitor);
  v1 = (void *)sharedInstance__sharedInstance_3065;
  sharedInstance__sharedInstance_3065 = (uint64_t)v0;

}

@end
