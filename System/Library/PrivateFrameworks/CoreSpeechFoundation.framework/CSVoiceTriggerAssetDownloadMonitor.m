@implementation CSVoiceTriggerAssetDownloadMonitor

- (CSVoiceTriggerAssetDownloadMonitor)init
{
  CSVoiceTriggerAssetDownloadMonitor *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSVoiceTriggerAssetDownloadMonitor;
  result = -[CSEventMonitor init](&v3, sel_init);
  if (result)
  {
    result->_notifyToken = -1;
    result->_gibraltarMacNotifyToken = -1;
    result->_darwinNotifyToken = -1;
  }
  return result;
}

- (const)_notificationKey
{
  _BOOL4 v2;
  const char *v4;

  v2 = +[CSUtils supportMphAssets](CSUtils, "supportMphAssets");
  if (CSIsIPad_onceToken != -1)
    dispatch_once(&CSIsIPad_onceToken, &__block_literal_global_14);
  if (CSIsIPad_isIPad)
  {
    if (v2)
      return "com.apple.MobileAsset.VoiceTriggerAssetsIPad.ma.new-asset-installed";
    else
      return "com.apple.MobileAsset.VoiceTriggerHSAssetsIPad.ma.new-asset-installed";
  }
  else
  {
    if (CSIsHorseman_onceToken != -1)
      dispatch_once(&CSIsHorseman_onceToken, &__block_literal_global_6);
    v4 = "com.apple.MobileAsset.VoiceTriggerHSAssets.ma.new-asset-installed";
    if (v2)
      v4 = "com.apple.MobileAsset.VoiceTriggerAssets.ma.new-asset-installed";
    if (CSIsHorseman_isHorseman)
      return "com.apple.MobileAsset.VoiceTriggerAssetsMarsh.ma.new-asset-installed";
    else
      return v4;
  }
}

- (void)_startMonitoringWithQueue:(id)a3
{
  NSObject *v4;
  const char *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  _QWORD v10[5];
  _QWORD handler[5];
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_notifyToken == -1)
  {
    v5 = -[CSVoiceTriggerAssetDownloadMonitor _notificationKey](self, "_notificationKey");
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke;
    handler[3] = &unk_1E6880F60;
    handler[4] = self;
    notify_register_dispatch(v5, &self->_notifyToken, v4, handler);
    v6 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : VoiceTrigger Asset Download", buf, 0xCu);
    }
  }
  if (+[CSUtils hasRemoteCoreSpeech](CSUtils, "hasRemoteCoreSpeech"))
  {
    if (+[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic"))
    {
      if (self->_gibraltarMacNotifyToken == -1)
      {
        v10[0] = MEMORY[0x1E0C809B0];
        v10[1] = 3221225472;
        v10[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_3;
        v10[3] = &unk_1E6880F60;
        v10[4] = self;
        notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsMac.ma.new-asset-installed", &self->_gibraltarMacNotifyToken, v4, v10);
        v7 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
          _os_log_impl(&dword_1B502E000, v7, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Gibraltar VoiceTrigger Asset Download", buf, 0xCu);
        }
      }
    }
  }
  if (self->_darwinNotifyToken == -1)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_4;
    v9[3] = &unk_1E6880F60;
    v9[4] = self;
    notify_register_dispatch("com.apple.MobileAsset.VoiceTriggerAssetsStudioDisplay.ma.new-asset-installed", &self->_darwinNotifyToken, v4, v9);
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSVoiceTriggerAssetDownloadMonitor _startMonitoringWithQueue:]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Start monitoring : Studio Display VoiceTrigger Asset Download", buf, 0xCu);
    }
  }

}

- (void)_stopMonitoring
{
  int notifyToken;
  NSObject *v4;
  int gibraltarMacNotifyToken;
  NSObject *v6;
  int darwinNotifyToken;
  NSObject *v8;
  int v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  notifyToken = self->_notifyToken;
  if (notifyToken != -1)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = -1;
    v4 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v4, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
    }
  }
  if (+[CSUtils hasRemoteCoreSpeech](CSUtils, "hasRemoteCoreSpeech"))
  {
    if (+[CSUtils hasRemoteBuiltInMic](CSUtils, "hasRemoteBuiltInMic"))
    {
      gibraltarMacNotifyToken = self->_gibraltarMacNotifyToken;
      if (gibraltarMacNotifyToken != -1)
      {
        notify_cancel(gibraltarMacNotifyToken);
        self->_gibraltarMacNotifyToken = -1;
        v6 = CSLogContextFacilityCoreSpeech;
        if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
        {
          v9 = 136315138;
          v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
          _os_log_impl(&dword_1B502E000, v6, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Gibraltar VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
        }
      }
    }
  }
  darwinNotifyToken = self->_darwinNotifyToken;
  if (darwinNotifyToken != -1)
  {
    notify_cancel(darwinNotifyToken);
    self->_darwinNotifyToken = -1;
    v8 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 136315138;
      v10 = "-[CSVoiceTriggerAssetDownloadMonitor _stopMonitoring]";
      _os_log_impl(&dword_1B502E000, v8, OS_LOG_TYPE_DEFAULT, "%s Stop monitoring : Studio Display VoiceTrigger Asset Download", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)_didInstalledNewVoiceTriggerAsset
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[4];
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v6 = "-[CSVoiceTriggerAssetDownloadMonitor _didInstalledNewVoiceTriggerAsset]";
    _os_log_impl(&dword_1B502E000, v3, OS_LOG_TYPE_DEFAULT, "%s New VoiceTrigger is now installed", buf, 0xCu);
  }
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __71__CSVoiceTriggerAssetDownloadMonitor__didInstalledNewVoiceTriggerAsset__block_invoke;
  v4[3] = &unk_1E68810D0;
  v4[4] = self;
  -[CSEventMonitor enumerateObservers:](self, "enumerateObservers:", v4);
}

- (void)_notifyObserver:(id)a3
{
  id v4;

  v4 = a3;
  -[CSEventMonitor notifyObserver:](self, "notifyObserver:", v4);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "CSVoiceTriggerAssetDownloadMonitor:didInstallNewAsset:", self, 1);

}

uint64_t __71__CSVoiceTriggerAssetDownloadMonitor__didInstalledNewVoiceTriggerAsset__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_notifyObserver:", a2);
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInstalledNewVoiceTriggerAsset");
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInstalledNewVoiceTriggerAsset");
}

uint64_t __64__CSVoiceTriggerAssetDownloadMonitor__startMonitoringWithQueue___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didInstalledNewVoiceTriggerAsset");
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_4647 != -1)
    dispatch_once(&sharedInstance_onceToken_4647, &__block_literal_global_4648);
  return (id)sharedInstance__sharedInstance_4649;
}

void __52__CSVoiceTriggerAssetDownloadMonitor_sharedInstance__block_invoke()
{
  CSVoiceTriggerAssetDownloadMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSVoiceTriggerAssetDownloadMonitor);
  v1 = (void *)sharedInstance__sharedInstance_4649;
  sharedInstance__sharedInstance_4649 = (uint64_t)v0;

}

@end
