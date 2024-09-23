@implementation CSUAFDownloadMonitor

- (CSUAFDownloadMonitor)init
{
  CSUAFDownloadMonitor *v3;
  objc_super v5;

  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)CSUAFDownloadMonitor;
    self = -[CSEventMonitor init](&v5, sel_init);
    v3 = self;
  }

  return v3;
}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id observerToken;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke;
  v15[3] = &unk_1E687E470;
  objc_copyWeak(&v17, &location);
  v6 = v4;
  v16 = v6;
  v7 = (void *)MEMORY[0x1B5E468D0](v15);
  objc_msgSend(MEMORY[0x1E0DC5DE8], "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke_181;
  v13[3] = &unk_1E687EE50;
  v9 = v7;
  v14 = v9;
  objc_msgSend(v8, "observeAssetSet:queue:handler:", CFSTR("com.apple.siri.understanding"), 0, v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  observerToken = self->_observerToken;
  self->_observerToken = v10;

  v12 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v20 = "-[CSUAFDownloadMonitor _startMonitoringWithQueue:]";
    v21 = 2112;
    v22 = CFSTR("com.apple.siri.understanding");
    _os_log_impl(&dword_1B502E000, v12, OS_LOG_TYPE_DEFAULT, "%s Adding observer for AssetSet: %@ to asset manager", buf, 0x16u);
  }

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

}

- (void)_stopMonitoring
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[CSUAFDownloadMonitor _stopMonitoring]";
    _os_log_impl(&dword_1B502E000, v2, OS_LOG_TYPE_DEFAULT, "%s UAFDownloadMonitor stop monitoring", (uint8_t *)&v3, 0xCu);
  }
}

- (void)notifyAssets:(id)a3 onQueue:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __45__CSUAFDownloadMonitor_notifyAssets_onQueue___block_invoke;
  v4[3] = &unk_1E68810D0;
  v4[4] = self;
  -[CSEventMonitor enumerateObserversInQueue:](self, "enumerateObserversInQueue:", v4, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_observerToken, 0);
  objc_storeStrong((id *)&self->_assetSetDict, 0);
}

void __45__CSUAFDownloadMonitor_notifyAssets_onQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "assetDownloadMonitorDelegate:assetType:", *(_QWORD *)(a1 + 32), 0);
    objc_msgSend(v3, "assetDownloadMonitorDelegate:assetType:", *(_QWORD *)(a1 + 32), 6);
  }

}

void __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v5 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315394;
      v7 = "-[CSUAFDownloadMonitor _startMonitoringWithQueue:]_block_invoke";
      v8 = 2114;
      v9 = v3;
      _os_log_impl(&dword_1B502E000, v5, OS_LOG_TYPE_DEFAULT, "%s AssetSet update for %{public}@ received", (uint8_t *)&v6, 0x16u);
    }
    objc_msgSend(WeakRetained, "notifyAssets:onQueue:", v3, *(_QWORD *)(a1 + 32));
  }

}

uint64_t __50__CSUAFDownloadMonitor__startMonitoringWithQueue___block_invoke_181(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (id)sharedInstance
{
  if (+[CSUtils isDarwinOS](CSUtils, "isDarwinOS"))
    return 0;
  if (sharedInstance_onceToken_1155[0] != -1)
    dispatch_once(sharedInstance_onceToken_1155, &__block_literal_global_1156);
  return (id)sharedInstance_sharedManager;
}

void __38__CSUAFDownloadMonitor_sharedInstance__block_invoke()
{
  CSUAFDownloadMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSUAFDownloadMonitor);
  v1 = (void *)sharedInstance_sharedManager;
  sharedInstance_sharedManager = (uint64_t)v0;

}

@end
