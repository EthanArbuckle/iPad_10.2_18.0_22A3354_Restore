@implementation CSAdBlockerAssetMetaUpdateMonitor

- (CSAdBlockerAssetMetaUpdateMonitor)init
{
  CSAdBlockerAssetMetaUpdateMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSAdBlockerAssetMetaUpdateMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
    result->_notifyToken = -1;
  return result;
}

- (const)_asssetMetaUpdatedKey
{
  return "com.apple.MobileAsset.AdBlockerAssets.ma.cached-metadata-updated";
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
    v6 = -[CSAdBlockerAssetMetaUpdateMonitor _asssetMetaUpdatedKey](self, "_asssetMetaUpdatedKey");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __63__CSAdBlockerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E7C28DC0;
    handler[4] = self;
    notify_register_dispatch(v6, p_notifyToken, v5, handler);

    v7 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[CSAdBlockerAssetMetaUpdateMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1C2614000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : AdBlocker Asset meta update", buf, 0xCu);
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
      v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _stopMonitoring]";
      _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : AdBlocker Asset meta update", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_didReceiveNewAdBlockerAssetMetaData
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
    v6 = "-[CSAdBlockerAssetMetaUpdateMonitor _didReceiveNewAdBlockerAssetMetaData]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s New AdBlocker asset metadata is available", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __73__CSAdBlockerAssetMetaUpdateMonitor__didReceiveNewAdBlockerAssetMetaData__block_invoke;
  v4[3] = &unk_1E7C29250;
  v4[4] = self;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  objc_msgSend(v4, "CSAdBlockerMetaUpdateMonitor:didReceiveNewAdBlockerAssetMetaData:", self, 1);

}

uint64_t __73__CSAdBlockerAssetMetaUpdateMonitor__didReceiveNewAdBlockerAssetMetaData__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __63__CSAdBlockerAssetMetaUpdateMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNewAdBlockerAssetMetaData");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_19440 != -1)
    dispatch_once(&sharedInstance_onceToken_19440, &__block_literal_global_19441);
  return (id)sharedInstance__sharedInstance_19442;
}

void __51__CSAdBlockerAssetMetaUpdateMonitor_sharedInstance__block_invoke()
{
  CSAdBlockerAssetMetaUpdateMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSAdBlockerAssetMetaUpdateMonitor);
  v1 = (void *)sharedInstance__sharedInstance_19442;
  sharedInstance__sharedInstance_19442 = (uint64_t)v0;

}

@end
